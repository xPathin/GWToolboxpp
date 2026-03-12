#include "stdafx.h"

#include "QuestModule.h"

#include <GWCA/GameEntities/Agent.h>
#include <GWCA/GameEntities/Map.h>
#include <GWCA/GameEntities/Quest.h>

#include <GWCA/Managers/AgentMgr.h>
#include <GWCA/Managers/GameThreadMgr.h>
#include <GWCA/Managers/MapMgr.h>
#include <GWCA/Managers/QuestMgr.h>
#include <GWCA/Managers/UIMgr.h>

#include <GWCA/Utilities/Hook.h>
#include <GWCA/Utilities/Hooker.h>
#include <GWCA/Utilities/Scanner.h>

#include <Modules/Resources.h>
#include <Widgets/Minimap/CustomRenderer.h>
#include <Widgets/Minimap/Minimap.h>
#include <Windows/Pathfinding/PathfindingWindow.h>
#include <Windows/TravelWindow.h>

#include <GWCA/Context/WorldContext.h>
#include <GWCA/Managers/StoCMgr.h>
#include <GWCA/Utilities/MemoryPatcher.h>
#include <Utils/GuiUtils.h>
#include <Utils/ToolboxUtils.h>
#include <Widgets/WorldMapWidget.h>
#include "AudioSettings.h"

namespace {
    bool draw_quest_path_on_terrain = false;
    bool draw_quest_path_on_minimap = true;
    bool draw_quest_path_on_mission_map = true;
    bool show_paths_to_all_quests = false;
    bool keep_current_quest_when_new_quest_added = false;

    // Questing Mode: auto-select closest quest
    bool questing_mode_enabled = false;
    bool questing_mode_evaluation_queued = false;
    clock_t questing_mode_evaluation_deferred_at = 0;
    constexpr clock_t QUESTING_MODE_EVAL_DEFER_MS = 3000;
    clock_t questing_mode_last_eval = 0;
    constexpr clock_t QUESTING_MODE_EVAL_INTERVAL_MS = 1000;
    GW::Constants::QuestID questing_mode_selected_quest = GW::Constants::QuestID::None;
    std::set<GW::Constants::QuestID> questing_mode_tracked_quests;

    // Auto-navigate
    bool auto_navigate_active = false;
    bool auto_navigate_paused_for_eval = false;
    clock_t auto_navigate_last_move_time = 0;
    clock_t auto_navigate_started = 0;
    constexpr clock_t AUTO_NAV_MOVE_INTERVAL_MS = 250;
    constexpr clock_t AUTO_NAV_GRACE_PERIOD_MS = 5000;
    constexpr float AUTO_NAV_ARRIVAL_DIST_SQ = 200.f * 200.f;
    GW::GamePos auto_navigate_last_pos = {};
    clock_t auto_navigate_last_progress_time = 0;
    constexpr clock_t AUTO_NAV_STUCK_TIMEOUT_MS = 3000;
    constexpr float AUTO_NAV_STUCK_DIST_SQ = 30.f * 30.f;
    constexpr float AUTO_NAV_LOOK_AHEAD = 300.f;
    constexpr float AUTO_NAV_UNSTUCK_DIST = 100.f;
    constexpr int AUTO_NAV_UNSTUCK_MAX_ATTEMPTS = 8;
    int auto_navigate_unstuck_attempts = 0;
    int auto_navigate_recalc_count = 0;
    constexpr int AUTO_NAV_MAX_RECALCS = 2;
    clock_t auto_navigate_unstuck_time = 0;
    constexpr clock_t AUTO_NAV_UNSTUCK_MOVE_MS = 1000;

    // Party spread: pause when furthest party member is too far behind
    bool auto_navigate_party_spread_paused = false;
    constexpr float AUTO_NAV_PARTY_SPREAD_PAUSE_SQ = 1500.f * 1500.f;  // pause threshold
    constexpr float AUTO_NAV_PARTY_SPREAD_RESUME_SQ = 900.f * 900.f;   // resume threshold (hysteresis)

    // Combat pause for auto-navigate (controlled externally by plugins)
    bool auto_navigate_combat_paused = false;
    // Configurable hotkeys (modifier flags: 1=Ctrl, 2=Shift, 4=Alt)
    DWORD questing_mode_hotkey_modifiers = 1;
    DWORD questing_mode_hotkey_key = 'Q';
    DWORD auto_navigate_hotkey_modifiers = 1;
    DWORD auto_navigate_hotkey_key = 'R';
    DWORD refresh_nearest_hotkey_modifiers = 5; // Ctrl+Alt
    DWORD refresh_nearest_hotkey_key = 'Q';
    bool capturing_questing_mode_hotkey = false;
    bool capturing_auto_navigate_hotkey = false;
    bool capturing_refresh_nearest_hotkey = false;

    bool fetch_missing_quest_info_queued = false;

    GW::HookEntry pre_ui_message_entry;
    GW::HookEntry post_ui_message_entry;
    bool initialised = false;

    clock_t last_fetched_missing_quest_info = 0;

    bool double_click_to_travel_to_quest = true;

    GW::Constants::QuestID custom_quest_id = static_cast<GW::Constants::QuestID>(0x0000fdd);
    GW::Quest custom_quest_marker;
    GW::Vec2f custom_quest_marker_world_pos;
    GW::Continent custom_quest_marker_continent = GW::Continent::Kryta;
    GW::Constants::QuestID player_chosen_quest_id = GW::Constants::QuestID::None;
    struct PendingSetActiveQuest {
        GW::Constants::QuestID quest_id = GW::Constants::QuestID::None;
        clock_t requested_at = 0;
        bool notify_server = false;
        void reset(GW::Constants::QuestID _quest_id, bool _notify_server = false) { 
            requested_at = TIMER_INIT();
            quest_id = _quest_id;
            notify_server = _notify_server;
        }
    } pending_set_active_quest;
    bool setting_custom_quest_marker = false;

    const wchar_t* custom_quest_marker_enc_name = L"\x452"; // "Map Travel"

    clock_t last_quest_clicked = 0;

    GW::UI::UIInteractionCallback QuestLogRow_UICallback_Func = nullptr, QuestLogRow_UICallback_Ret = nullptr;

    // If double clicked on a quest entry, teleport to nearest outpost
    void OnQuestLogRow_UICallback(GW::UI::InteractionMessage* message, void* wParam, void* lParam)
    {
        GW::Hook::EnterHook();
        QuestLogRow_UICallback_Ret(message, wParam, lParam);
        if (!(double_click_to_travel_to_quest && message->message_id == GW::UI::UIMessage::kMouseClick2 && GW::Map::GetInstanceType() == GW::Constants::InstanceType::Outpost &&
              GW::UI::BelongsToFrame(GW::UI::GetFrameByLabel(L"Quest"), GW::UI::GetFrameById(message->frame_id))))
            return GW::Hook::LeaveHook();
        const auto packet = (GW::UI::UIPacket::kMouseAction*)wParam;
        if (!(packet->current_state == GW::UI::UIPacket::ActionState::MouseClick && (packet->child_offset_id & 0xffff0000) == 0x80000000)) return GW::Hook::LeaveHook(); // Not a double click on a quest entry
        if (last_quest_clicked && TIMER_DIFF(last_quest_clicked) < 250) {
            const auto quest_id = static_cast<GW::Constants::QuestID>(packet->child_offset_id & 0xffff);
            const auto quest = GW::QuestMgr::GetQuest(quest_id);
            if (quest && quest->map_to != GW::Constants::MapID::Count) {
                TravelWindow::Instance().TravelNearest(quest->map_to);
            }
        }
        last_quest_clicked = TIMER_INIT();
        GW::Hook::LeaveHook();
    }

    void OnQuestPathRecalculated(std::vector<GW::GamePos>& waypoints, void* args);
    void ClearCalculatedPath(GW::Constants::QuestID quest_id);

    bool IsActiveQuestPath(const GW::Constants::QuestID quest_id)
    {
        const auto questlog = GW::QuestMgr::GetQuestLog();
        const auto active_quest = GW::QuestMgr::GetActiveQuest();
        if (!questlog || !active_quest) return false;
        if (quest_id == active_quest->quest_id) return true;
        if (!show_paths_to_all_quests) return false;
        // De-duplicate other quests that are pointing to the same place!
        const auto quest = GW::QuestMgr::GetQuest(quest_id);
        if (!quest) return false; // Quest has just been removed?
        for (const auto q : *questlog) {
            if (quest->marker == q.marker) {
                return q.quest_id == quest_id;
            }
        }
        return false;
    }

    struct CalculatedQuestPath {
        CalculatedQuestPath(const GW::Constants::QuestID _quest_id) : quest_id(_quest_id) {}

        ~CalculatedQuestPath() { ClearMinimapLines(); }

        CalculatedQuestPath(const CalculatedQuestPath&) = delete;
        CalculatedQuestPath& operator=(const CalculatedQuestPath&) = delete;
        CalculatedQuestPath(CalculatedQuestPath&&) = delete;
        CalculatedQuestPath& operator=(CalculatedQuestPath&&) = delete;

        std::vector<GW::GamePos> waypoints{};
        std::vector<CustomRenderer::CustomLine*> minimap_lines{};
        GW::GamePos previous_closest_waypoint{};
        GW::GamePos original_quest_marker{};
        GW::GamePos calculated_from{};
        GW::GamePos calculated_to{};
        clock_t calculated_at = 0;
        uint32_t current_waypoint = 0;
        GW::Constants::QuestID quest_id{};
        clock_t calculating = 0;
        bool IsCalculating() { return calculating && TIMER_DIFF(calculating) < 5000; }

        void ClearMinimapLines()
        {
            for (const auto l : minimap_lines) {
                Minimap::Instance().custom_renderer.RemoveCustomLine(l);
            }
            minimap_lines.clear();
        }

        void DrawMinimapLines()
        {
            ClearMinimapLines();
            if (!(draw_quest_path_on_terrain || draw_quest_path_on_minimap || draw_quest_path_on_mission_map)) return;
            if (waypoints.empty()) return;
            const size_t start_idx = current_waypoint > 0 ? current_waypoint - 1 : 0;
            for (size_t i = start_idx; i < waypoints.size() - 1; i++) {
                const auto l = Minimap::Instance().custom_renderer.AddCustomLine(waypoints[i], waypoints[i + 1], std::format("{} - {}", static_cast<uint32_t>(quest_id), i).c_str(), true);
                l->from_player_pos = i == start_idx;
                l->draw_on_terrain = draw_quest_path_on_terrain;
                l->draw_on_minimap = draw_quest_path_on_minimap;
                l->draw_on_mission_map = draw_quest_path_on_mission_map;
                l->created_by_toolbox = true;
                l->color = QuestModule::GetQuestLineColor(quest_id);
                minimap_lines.push_back(l);
            }
            GameWorldRenderer::TriggerSyncAllMarkers();
        }

        [[nodiscard]] const GW::Quest* GetQuest() const { return GW::QuestMgr::GetQuest(quest_id); }

        [[nodiscard]] bool IsActive() const
        {
            const auto a = GW::QuestMgr::GetActiveQuestId() == quest_id;
            return a || (GetQuest() && Minimap::ShouldDrawAllQuests());
        }

        const GW::GamePos* CurrentWaypoint() { return &waypoints[current_waypoint]; }

        const GW::GamePos* NextWaypoint() { return current_waypoint < waypoints.size() - 1 ? &waypoints[current_waypoint + 1] : nullptr; }

        void Recalculate(const GW::GamePos& from)
        {
            if (calculated_at && from == calculated_from && calculated_to == original_quest_marker) {
                calculating = TIMER_INIT();
                OnQuestPathRecalculated(waypoints, (void*)quest_id); // No need to recalculate
                return;
            }
            calculated_from = from;
            calculated_to = original_quest_marker;
            if (original_quest_marker.x == INFINITY) {
                if (waypoints.size()) {
                    // Quest marker has changed to infinity; clear any current markers
                    waypoints.clear();
                    calculating = TIMER_INIT();
                    OnQuestPathRecalculated(waypoints, (void*)quest_id); // No need to recalculate
                }
                return;
            }
            calculating = PathfindingWindow::CalculatePath(calculated_from, calculated_to, OnQuestPathRecalculated, (void*)quest_id);
            if (!IsCalculating()) {
                calculated_at = 0;
            }
        }

        bool Update(const GW::GamePos& from)
        {
            if (IsCalculating()) {
                return false;
            }
            const auto quest = GetQuest();
            if (!quest) {
                ClearCalculatedPath(quest_id);
                return true;
            }

            if (!calculated_at) {
                Recalculate(from);
                return false;
            }
            constexpr float recalculate_when_moved_further_than = 100.f * 100.f;
            // Don't recalculate while on a non-ground plane (e.g. bridge).
            // The pathfinder doesn't maintain plane continuity, so recalculating
            // from a bridge position produces a path that drops to ground.
            if (from.zplane != 0 && calculated_from.zplane == 0) {
                // Skip recalculation, keep using the original path
            } else if (GetSquareDistance(from, calculated_from) > recalculate_when_moved_further_than) {
                Recalculate(from);
                return false;
            }
            const uint32_t original_waypoint = current_waypoint;

            const auto waypoint_len = waypoints.size();
            if (!waypoint_len) return false;

            // Find closest segment using perpendicular projection.
            // Only search current segment and forward to prevent backward jumps.
            const uint32_t player_zplane = from.zplane;
            const size_t search_start = current_waypoint > 0 ? current_waypoint - 1 : 0;
            size_t best_seg = search_start;
            float best_dist_sq = FLT_MAX;
            size_t fallback_seg = search_start;
            float fallback_dist_sq = FLT_MAX;
            for (size_t i = search_start; i + 1 < waypoint_len; i++) {
                const float sx = waypoints[i + 1].x - waypoints[i].x;
                const float sy = waypoints[i + 1].y - waypoints[i].y;
                const float seg_len_sq = sx * sx + sy * sy;
                float t = 0.f;
                if (seg_len_sq > 0.01f) {
                    t = ((from.x - waypoints[i].x) * sx + (from.y - waypoints[i].y) * sy) / seg_len_sq;
                    if (t < 0.f) t = 0.f;
                    if (t > 1.f) t = 1.f;
                }
                const float px = waypoints[i].x + t * sx;
                const float py = waypoints[i].y + t * sy;
                const float dx = from.x - px;
                const float dy = from.y - py;
                const float d = dx * dx + dy * dy;
                const bool same_plane = player_zplane == 0
                    || waypoints[i].zplane == player_zplane
                    || waypoints[i + 1].zplane == player_zplane;
                if (same_plane && d < best_dist_sq) {
                    best_dist_sq = d;
                    best_seg = i;
                }
                if (d < fallback_dist_sq) {
                    fallback_dist_sq = d;
                    fallback_seg = i;
                }
            }
            if (best_dist_sq == FLT_MAX) best_seg = fallback_seg;
            current_waypoint = static_cast<uint32_t>(best_seg + 1);
            if (original_waypoint != current_waypoint) {
                calculated_from = from;
                UpdateUI();
            }
            return false;
        }

        void UpdateUI()
        {
            DrawMinimapLines();
            if (waypoints.empty()) return;

            const auto& current_waypoint_pos = waypoints[current_waypoint];
            const auto waypoint_distance = GetSquareDistance(current_waypoint_pos, previous_closest_waypoint);
            constexpr float update_when_waypoint_changed_more_than = 300.f * 300.f;
            if (IsActive() && waypoint_distance > update_when_waypoint_changed_more_than) {
                previous_closest_waypoint = waypoints[current_waypoint];
            }
        }
    };
    void BlockQuestSound()
    {
        AudioSettings::BlockSoundForMs(L"\xe14d\x0101", 1000);
        AudioSettings::BlockSoundForMs(L"\xe14c\x0101", 1000);
    }


    // Custom quests have ids greater than the count in-game - there are some assertions that don't like this!
    GW::MemoryPatcher bypass_custom_quest_assertion_patch;

    std::unordered_map<GW::Constants::QuestID, CalculatedQuestPath*> calculated_quest_paths;

    void ClearCalculatedPaths()
    {
        for (const auto cqp : calculated_quest_paths | std::views::values) {
            delete cqp;
        }
        calculated_quest_paths.clear();
    }

    void ClearCalculatedPath(GW::Constants::QuestID quest_id)
    {
        const auto found = calculated_quest_paths.find(quest_id);
        if (found == calculated_quest_paths.end()) return;
        auto cqp = found->second;
        calculated_quest_paths.erase(found);
        delete cqp;
    }

    CalculatedQuestPath* GetCalculatedQuestPath(GW::Constants::QuestID quest_id, bool create_if_not_found = true)
    {
        const auto found = calculated_quest_paths.find(quest_id);
        if (found != calculated_quest_paths.end()) return found->second;
        if (!create_if_not_found) return nullptr;
        const auto cqp = new CalculatedQuestPath(quest_id);
        calculated_quest_paths[quest_id] = cqp;
        return cqp;
    }

    bool is_spoofing_quest_update = false;

    // Settings
    GW::GamePos* GetPlayerPos()
    {
        const auto p = GW::Agents::GetControlledCharacter();
        return p ? &p->pos : nullptr;
    }

    // Cast helper
    float GetSquareDistance(const GW::GamePos& a, const GW::GamePos& b)
    {
        return GetSquareDistance(static_cast<GW::Vec2f>(a), static_cast<GW::Vec2f>(b));
    }

    // Insert quadratic Bezier arc points at sharp corners to smooth the path.
    void SmoothCorners(std::vector<GW::GamePos>& waypoints)
    {
        if (waypoints.size() < 3) return;
        std::vector<GW::GamePos> smoothed;
        smoothed.reserve(waypoints.size() * 2);
        smoothed.push_back(waypoints[0]);

        for (size_t i = 1; i + 1 < waypoints.size(); i++) {
            const auto& prev = waypoints[i - 1];
            const auto& curr = waypoints[i];
            const auto& next = waypoints[i + 1];

            // Don't smooth across zplane transitions
            if (curr.zplane != prev.zplane || curr.zplane != next.zplane) {
                smoothed.push_back(curr);
                continue;
            }

            const float in_dx = curr.x - prev.x;
            const float in_dy = curr.y - prev.y;
            const float out_dx = next.x - curr.x;
            const float out_dy = next.y - curr.y;
            const float in_len = sqrtf(in_dx * in_dx + in_dy * in_dy);
            const float out_len = sqrtf(out_dx * out_dx + out_dy * out_dy);

            if (in_len < 1.f || out_len < 1.f) {
                smoothed.push_back(curr);
                continue;
            }

            const float dot = (in_dx * out_dx + in_dy * out_dy) / (in_len * out_len);

            // Only smooth turns > ~25 degrees (dot < 0.9)
            if (dot > 0.9f) {
                smoothed.push_back(curr);
                continue;
            }

            // Arc radius: fraction of shorter adjacent segment, capped
            constexpr float ARC_FRACTION = 0.3f;
            constexpr float MAX_ARC_RADIUS = 100.f;
            const float radius = std::min(MAX_ARC_RADIUS, ARC_FRACTION * std::min(in_len, out_len));

            // Arc start/end: pull back from the corner along incoming/outgoing
            const float start_x = curr.x - (in_dx / in_len) * radius;
            const float start_y = curr.y - (in_dy / in_len) * radius;
            const float end_x = curr.x + (out_dx / out_len) * radius;
            const float end_y = curr.y + (out_dy / out_len) * radius;

            smoothed.push_back(GW::GamePos(start_x, start_y, curr.zplane));

            // Quadratic Bezier with corner as control point
            const int arc_points = dot < 0.f ? 3 : 2;
            for (int j = 1; j <= arc_points; j++) {
                const float t = static_cast<float>(j) / (arc_points + 1);
                const float ax = start_x + t * (curr.x - start_x);
                const float ay = start_y + t * (curr.y - start_y);
                const float bx = curr.x + t * (end_x - curr.x);
                const float by = curr.y + t * (end_y - curr.y);
                smoothed.push_back(GW::GamePos(ax + t * (bx - ax), ay + t * (by - ay), curr.zplane));
            }

            smoothed.push_back(GW::GamePos(end_x, end_y, curr.zplane));
        }

        smoothed.push_back(waypoints.back());
        waypoints = std::move(smoothed);
    }

    // Walk forward along the path from the player's closest point by look_ahead units.
    // Returns the target position for navigation.
    GW::GamePos GetLookAheadTarget(const std::vector<GW::GamePos>& waypoints,
                                    const GW::GamePos& player_pos, float look_ahead,
                                    size_t min_segment = 0)
    {
        if (waypoints.size() < 2) return waypoints.empty() ? player_pos : waypoints[0];

        const uint32_t player_zplane = player_pos.zplane;

        // 1. Find closest point on the path via segment projection
        // Only search from min_segment forward to prevent backward jumps.
        size_t best_seg = min_segment;
        float best_t = 0.f;
        float best_dist_sq = FLT_MAX;
        size_t fallback_seg = min_segment;
        float fallback_t = 0.f;
        float fallback_dist_sq = FLT_MAX;

        for (size_t i = min_segment; i + 1 < waypoints.size(); i++) {
            const float sx = waypoints[i + 1].x - waypoints[i].x;
            const float sy = waypoints[i + 1].y - waypoints[i].y;
            const float seg_len_sq = sx * sx + sy * sy;
            float t = 0.f;
            if (seg_len_sq > 0.01f) {
                t = ((player_pos.x - waypoints[i].x) * sx + (player_pos.y - waypoints[i].y) * sy) / seg_len_sq;
                if (t < 0.f) t = 0.f;
                if (t > 1.f) t = 1.f;
            }
            const float px = waypoints[i].x + t * sx;
            const float py = waypoints[i].y + t * sy;
            const float dx = player_pos.x - px;
            const float dy = player_pos.y - py;
            const float d = dx * dx + dy * dy;

            const bool same_plane = player_zplane == 0
                || waypoints[i].zplane == player_zplane
                || waypoints[i + 1].zplane == player_zplane;
            if (same_plane && d < best_dist_sq) {
                best_dist_sq = d;
                best_seg = i;
                best_t = t;
            }
            if (d < fallback_dist_sq) {
                fallback_dist_sq = d;
                fallback_seg = i;
                fallback_t = t;
            }
        }
        if (best_dist_sq == FLT_MAX) {
            best_seg = fallback_seg;
            best_t = fallback_t;
        }

        // 2. Walk forward from the projection point by look_ahead distance
        const float sx = waypoints[best_seg + 1].x - waypoints[best_seg].x;
        const float sy = waypoints[best_seg + 1].y - waypoints[best_seg].y;
        const float seg_len = sqrtf(sx * sx + sy * sy);
        float remaining = look_ahead - (1.f - best_t) * seg_len;

        if (remaining <= 0.f) {
            // Target is on the current segment
            const float target_t = best_t + look_ahead / std::max(seg_len, 0.01f);
            return GW::GamePos(
                waypoints[best_seg].x + target_t * sx,
                waypoints[best_seg].y + target_t * sy,
                waypoints[best_seg].zplane
            );
        }

        // Walk through subsequent segments
        for (size_t i = best_seg + 1; i + 1 < waypoints.size(); i++) {
            const float dx = waypoints[i + 1].x - waypoints[i].x;
            const float dy = waypoints[i + 1].y - waypoints[i].y;
            const float len = sqrtf(dx * dx + dy * dy);

            if (remaining <= len) {
                const float t = remaining / std::max(len, 0.01f);
                return GW::GamePos(
                    waypoints[i].x + t * dx,
                    waypoints[i].y + t * dy,
                    waypoints[i].zplane
                );
            }
            remaining -= len;
        }

        return waypoints.back();
    }

    // Called by PathfindingWindow when a path has been calculated. Should be on the main loop.
    void OnQuestPathRecalculated(std::vector<GW::GamePos>& waypoints, void* args)
    {
        const auto cqp = GetCalculatedQuestPath(*reinterpret_cast<GW::Constants::QuestID*>(&args), false);
        if (!cqp) return;
        cqp->current_waypoint = 0;
        cqp->waypoints = std::move(waypoints); // Move

        const auto waypoint_len = cqp->waypoints.size();
        if (waypoint_len) {
            if (GetSquareDistance(cqp->waypoints.back(), cqp->calculated_from) < GetSquareDistance(cqp->waypoints.front(), cqp->calculated_from)) {
                // Waypoint array is in descending distance, flip it
                std::ranges::reverse(cqp->waypoints);
            }
            SmoothCorners(cqp->waypoints);
            // Find closest segment using perpendicular projection
            const uint32_t player_zplane = cqp->calculated_from.zplane;
            size_t best_seg = 0;
            float best_dist_sq = FLT_MAX;
            size_t fallback_seg = 0;
            float fallback_dist_sq = FLT_MAX;
            for (size_t i = 0; i + 1 < waypoint_len; i++) {
                const float sx = cqp->waypoints[i + 1].x - cqp->waypoints[i].x;
                const float sy = cqp->waypoints[i + 1].y - cqp->waypoints[i].y;
                const float seg_len_sq = sx * sx + sy * sy;
                float t = 0.f;
                if (seg_len_sq > 0.01f) {
                    t = ((cqp->calculated_from.x - cqp->waypoints[i].x) * sx + (cqp->calculated_from.y - cqp->waypoints[i].y) * sy) / seg_len_sq;
                    if (t < 0.f) t = 0.f;
                    if (t > 1.f) t = 1.f;
                }
                const float px = cqp->waypoints[i].x + t * sx;
                const float py = cqp->waypoints[i].y + t * sy;
                const float dx = cqp->calculated_from.x - px;
                const float dy = cqp->calculated_from.y - py;
                const float d = dx * dx + dy * dy;
                const bool same_plane = player_zplane == 0
                    || cqp->waypoints[i].zplane == player_zplane
                    || cqp->waypoints[i + 1].zplane == player_zplane;
                if (same_plane && d < best_dist_sq) {
                    best_dist_sq = d;
                    best_seg = i;
                }
                if (d < fallback_dist_sq) {
                    fallback_dist_sq = d;
                    fallback_seg = i;
                }
            }
            if (best_dist_sq == FLT_MAX) best_seg = fallback_seg;
            cqp->current_waypoint = static_cast<uint32_t>(best_seg + 1);
        }
        cqp->calculated_at = TIMER_INIT();
        cqp->calculating = 0;
        cqp->UpdateUI();
    }

    void RefreshQuestPath(GW::Constants::QuestID quest_id)
    {
        GW::GameThread::Enqueue([quest_id] {
            // Always allow the custom quest marker path (it may become
            // active after this check due to UI message ordering).
            if (quest_id != custom_quest_id && !IsActiveQuestPath(quest_id)) {
                ClearCalculatedPath(quest_id);
                return;
            }
            const auto quest = GW::QuestMgr::GetQuest(quest_id);
            const auto pos = quest ? GetPlayerPos() : nullptr;
            if (!pos) return;
            const auto cqp = GetCalculatedQuestPath(quest_id);
            if (!cqp) return;
            auto marker = quest->marker;
            // The custom quest marker stores INFINITY in quest->marker even
            // on the same map. Convert the world map position to game coords.
            if (quest_id == custom_quest_id && marker.x == INFINITY
                && custom_quest_marker_world_pos.x != 0.f) {
                GW::GamePos game_pos;
                if (WorldMapWidget::WorldMapToGamePos(custom_quest_marker_world_pos, game_pos)) {
                    marker = game_pos;
                }
            }
            cqp->original_quest_marker = marker;
            cqp->Recalculate(*pos);
        });
    }

    void ClearCalculatedQuestPaths()
    {
        for (auto quest_path : calculated_quest_paths | std::views::values) {
            delete quest_path;
        }
        calculated_quest_paths.clear();
    }

    GW::Constants::QuestID quest_id_before_map_load = GW::Constants::QuestID::None;

    void RefreshAllQuestPaths()
    {
        const auto q = GW::QuestMgr::GetQuestLog();
        if (!q) return;
        for (auto& quest : *q) {
            RefreshQuestPath(quest.quest_id);
        }
    }

    // --- Quest log change detection ---

    void RebuildTrackedQuests()
    {
        questing_mode_tracked_quests.clear();
        const auto quest_log = GW::QuestMgr::GetQuestLog();
        if (!quest_log) return;
        for (const auto& quest : *quest_log) {
            questing_mode_tracked_quests.insert(quest.quest_id);
        }
    }

    bool CheckForQuestRemovals()
    {
        const auto quest_log = GW::QuestMgr::GetQuestLog();
        if (!quest_log) return false;
        std::set<GW::Constants::QuestID> current;
        for (const auto& quest : *quest_log) {
            current.insert(quest.quest_id);
        }
        bool removed = false;
        for (const auto& id : questing_mode_tracked_quests) {
            if (!current.contains(id)) { removed = true; break; }
        }
        questing_mode_tracked_quests = std::move(current);
        return removed;
    }

    // --- Auto-navigate helpers ---

    void StopAutoNavigate(const char* reason)
    {
        if (!auto_navigate_active) return;
        auto_navigate_active = false;
        auto_navigate_unstuck_attempts = 0;
        auto_navigate_recalc_count = 0;
        auto_navigate_unstuck_time = 0;
        auto_navigate_combat_paused = false;
        auto_navigate_party_spread_paused = false;
        Log::Warning("Auto-navigate stopped: %s", reason);
        // Redraw minimap lines to revert color
        const auto active_id = GW::QuestMgr::GetActiveQuestId();
        auto* cqp = GetCalculatedQuestPath(active_id, false);
        if (cqp) cqp->DrawMinimapLines();
    }

    void BeginQuestingModeEvaluation(bool force = false)
    {
        Log::Log("[QuestMode] BeginQuestingModeEvaluation(force=%d)\n", force);
        if (!questing_mode_enabled) return;
        const auto pos = GetPlayerPos();
        if (!pos) { Log::Log("[QuestMode]   no player pos\n"); return; }
        const auto quest_log = GW::QuestMgr::GetQuestLog();
        if (!quest_log) { Log::Log("[QuestMode]   no quest log\n"); return; }

        // Track same-map and cross-map candidates separately so that quests
        // actually on this map are preferred over nearby loading zones.
        // For cross-map quests, use world map distance to the destination map
        // instead of local distance to the loading zone.
        const auto current_map_id = GW::Map::GetMapID();
        const auto current_map_info = GW::Map::GetCurrentMapInfo();

        GW::Vec2f player_world_pos;
        const bool have_world_pos = WorldMapWidget::GamePosToWorldMap(GW::GamePos(pos->x, pos->y), player_world_pos);

        GW::Constants::QuestID best_same_map_id = GW::Constants::QuestID::None;
        float best_same_map_dist_sq = FLT_MAX;
        GW::Constants::QuestID best_other_map_id = GW::Constants::QuestID::None;
        float best_other_map_dist_sq = FLT_MAX;

        for (auto& quest : *quest_log) {
            if (quest.quest_id == custom_quest_id) continue;
            if (quest.marker.x == INFINITY) continue;

            const auto quest_map_info = GW::Map::GetMapInfo(quest.map_to);
            // Skip quests on a different continent
            if (current_map_info && quest_map_info &&
                quest_map_info->continent != current_map_info->continent) continue;

            const bool is_same_map = quest.map_to == current_map_id
                || quest.map_to == GW::Constants::MapID::None;

            if (is_same_map) {
                const float dist_sq = GetSquareDistance(*pos, quest.marker);
                if (dist_sq < best_same_map_dist_sq) {
                    best_same_map_dist_sq = dist_sq;
                    best_same_map_id = quest.quest_id;
                }
            } else if (have_world_pos && quest_map_info) {
                // Use world map distance to the destination map
                const GW::Vec2f dest_world_pos = {
                    static_cast<float>(quest_map_info->x ? quest_map_info->x : (quest_map_info->icon_start_x + quest_map_info->icon_end_x) / 2),
                    static_cast<float>(quest_map_info->y ? quest_map_info->y : (quest_map_info->icon_start_y + quest_map_info->icon_end_y) / 2)
                };
                const float dist_sq = GetSquareDistance(player_world_pos, dest_world_pos);
                if (dist_sq < best_other_map_dist_sq) {
                    best_other_map_dist_sq = dist_sq;
                    best_other_map_id = quest.quest_id;
                }
            } else {
                // Fallback: use local loading zone distance
                const float dist_sq = GetSquareDistance(*pos, quest.marker);
                if (dist_sq < best_other_map_dist_sq) {
                    best_other_map_dist_sq = dist_sq;
                    best_other_map_id = quest.quest_id;
                }
            }
        }

        // Unless forced (map change, hotkey), stick with the current active quest
        // as long as it was selected by questing mode, is still on this map, and
        // still in the quest log. If the user manually changed the quest, don't override.
        const auto active_id = GW::QuestMgr::GetActiveQuestId();
        Log::Log("[QuestMode]   active_id=%d, selected=%d, best_same=%d, best_other=%d\n",
            (int)active_id, (int)questing_mode_selected_quest, (int)best_same_map_id, (int)best_other_map_id);
        if (!force && active_id != GW::Constants::QuestID::None) {
            if (active_id != questing_mode_selected_quest) {
                Log::Log("[QuestMode]   user manually selected, respecting\n");
                return;
            }
            const auto active_quest = GW::QuestMgr::GetQuest(active_id);
            if (active_quest && active_quest->marker.x != INFINITY) {
                const bool active_on_same_map = active_quest->map_to == current_map_id
                    || active_quest->map_to == GW::Constants::MapID::None;
                if (active_on_same_map) {
                    Log::Log("[QuestMode]   keeping current quest (same map)\n");
                    return;
                }
            }
        }

        // Prefer same-map quests; only fall back to cross-map if none exist
        const auto best_id = best_same_map_id != GW::Constants::QuestID::None
            ? best_same_map_id : best_other_map_id;
        if (best_id != GW::Constants::QuestID::None && best_id != active_id) {
            Log::Log("[QuestMode]   selecting quest %d\n", (int)best_id);
            questing_mode_selected_quest = best_id;
            QuestModule::EmulateQuestSelected(best_id);
            RefreshQuestPath(best_id);
        } else {
            Log::Log("[QuestMode]   no change (best=%d, active=%d)\n", (int)best_id, (int)active_id);
        }
    }

    // --- Hotkey UI helpers ---

    bool ModifiersMatch(DWORD required_modifiers)
    {
        const bool ctrl_held = (GetKeyState(VK_CONTROL) & 0x8000) != 0;
        const bool shift_held = (GetKeyState(VK_SHIFT) & 0x8000) != 0;
        const bool alt_held = (GetKeyState(VK_MENU) & 0x8000) != 0;
        const bool ctrl_required = (required_modifiers & 1) != 0;
        const bool shift_required = (required_modifiers & 2) != 0;
        const bool alt_required = (required_modifiers & 4) != 0;
        return ctrl_held == ctrl_required && shift_held == shift_required && alt_held == alt_required;
    }

    const char* GetHotkeyName(DWORD modifiers, DWORD key)
    {
        static char buf[64];
        buf[0] = 0;
        if (modifiers & 1) strcat(buf, "Ctrl+");
        if (modifiers & 2) strcat(buf, "Shift+");
        if (modifiers & 4) strcat(buf, "Alt+");
        char key_name[32];
        const UINT scancode = MapVirtualKey(key, MAPVK_VK_TO_VSC);
        if (GetKeyNameTextA(scancode << 16, key_name, sizeof(key_name)))
            strcat(buf, key_name);
        else
            snprintf(buf + strlen(buf), sizeof(buf) - strlen(buf), "0x%X", key);
        return buf;
    }

    void DrawHotkeySelector(const char* label, DWORD* modifiers, DWORD* key, bool* capturing)
    {
        if (*capturing) {
            ImGui::Text("%s:", label);
            ImGui::SameLine();
            ImGui::TextColored(ImVec4(1, 1, 0, 1), "Press key combo...");
            ImGui::SameLine();
            if (ImGui::SmallButton("Cancel")) {
                *capturing = false;
            }
        }
        else {
            ImGui::Text("%s: %s", label, GetHotkeyName(*modifiers, *key));
            ImGui::SameLine();
            char btn_id[64];
            snprintf(btn_id, sizeof(btn_id), "Set##%s", label);
            if (ImGui::SmallButton(btn_id)) {
                *capturing = true;
            }
        }
    }

    void OnPreUIMessage(GW::HookStatus* status, GW::UI::UIMessage message_id, void* wparam, void*)
    {
        switch (message_id) {
            case GW::UI::UIMessage::kQuestAdded: {
                const auto quest = GW::QuestMgr::GetQuest(*(GW::Constants::QuestID*)wparam);
                if (!quest) break;
                questing_mode_tracked_quests.insert(quest->quest_id);
                if (quest->quest_id == custom_quest_id) {
                    quest->log_state |= 1; // Avoid asking for description about this quest
                }
                if (questing_mode_enabled) {
                    questing_mode_evaluation_queued = true;
                }
                if (quest->quest_id != player_chosen_quest_id) {
                    // Quest assigned without user interaction
                    if (keep_current_quest_when_new_quest_added) {
                        status->blocked = true;
                        QuestModule::SetActiveQuestId(player_chosen_quest_id,true);
                        break;
                    }
                }
            } break;
            case GW::UI::UIMessage::kStartMapLoad:
                quest_id_before_map_load = GW::QuestMgr::GetActiveQuestId();
                break;
            case GW::UI::UIMessage::kSendSetActiveQuest: {
                const auto quest_id = static_cast<GW::Constants::QuestID>((uint32_t)wparam);
                if (setting_custom_quest_marker) {
                    // This triggers if the player has no quests, or the map has just loaded; we want to "undo" this by spoofing the previous quest selection if there is one
                    status->blocked = true;
                    QuestModule::SetActiveQuestId(GW::QuestMgr::GetActiveQuestId(), false);
                    return;
                }
                player_chosen_quest_id = quest_id;
                if (quest_id == custom_quest_id) {
                    // If the player has chosen the custom quest, spoof the response without asking the server
                    status->blocked = true;
                    QuestModule::SetActiveQuestId(quest_id, false);
                }
            } break;
            case GW::UI::UIMessage::kSendAbandonQuest: {
                const auto quest_id = static_cast<GW::Constants::QuestID>((uint32_t)wparam);
                if (quest_id == custom_quest_id) {
                    status->blocked = true;
                    QuestModule::SetCustomQuestMarker({0, 0});
                }
            } break;
            case GW::UI::UIMessage::kOnScreenMessage: {
                // Block the on-screen message when the custom marker is placed
                if (setting_custom_quest_marker) {
                    status->blocked = true;
                }
            } break;
        }
    }

    // Callback invoked by quest related ui messages. All messages sent should have the quest id as first wparam variable
    void OnPostUIMessage(GW::HookStatus* status, GW::UI::UIMessage message_id, void* packet, void*)
    {
        if (status->blocked) return;
        switch (message_id) {
            case GW::UI::UIMessage::kQuestDetailsChanged: {
                const auto quest_id = *static_cast<GW::Constants::QuestID*>(packet);
                RefreshQuestPath(quest_id);
                if (questing_mode_enabled && quest_id == GW::QuestMgr::GetActiveQuestId()) {
                    const auto quest = GW::QuestMgr::GetQuest(quest_id);
                    const auto current_map = GW::Map::GetMapID();
                    if (quest && quest->map_to != current_map
                        && quest->map_to != GW::Constants::MapID::None) {
                        questing_mode_evaluation_queued = true;
                    }
                }
            } break;
            case GW::UI::UIMessage::kClientActiveQuestChanged:
            case GW::UI::UIMessage::kQuestAdded:
                RefreshQuestPath(*static_cast<GW::Constants::QuestID*>(packet));
                break;
            case GW::UI::UIMessage::kMapLoaded:
                BlockQuestSound();
                break;
        }
    }
    bool was_loading = true;



    void OnMapLoaded()
    {
        if (GW::UI::IsLoadingScreenShown()) return;
        BlockQuestSound();
        QuestModule::FetchMissingQuestInfo();
        ClearCalculatedQuestPaths();
        if (custom_quest_marker.quest_id != (GW::Constants::QuestID)0) {
            const auto map_info = GW::Map::GetMapInfo();
            if (map_info && map_info->continent == custom_quest_marker_continent) {
                QuestModule::SetCustomQuestMarker(custom_quest_marker_world_pos, player_chosen_quest_id == custom_quest_marker.quest_id);
                if (quest_id_before_map_load == custom_quest_marker.quest_id) GW::QuestMgr::SetActiveQuestId(quest_id_before_map_load);
            }
        }
        RefreshAllQuestPaths();
        RebuildTrackedQuests();
        if (questing_mode_enabled) {
            questing_mode_evaluation_deferred_at = TIMER_INIT();
            Log::Log("[QuestMode] OnMapLoaded: set deferred eval timer\n");
        }
        if (auto_navigate_active) {
            auto_navigate_started = TIMER_INIT();
            auto_navigate_last_move_time = 0;
            auto_navigate_last_progress_time = TIMER_INIT();
            auto_navigate_combat_paused = false;
            auto_navigate_party_spread_paused = false;
            if (questing_mode_enabled) {
                auto_navigate_paused_for_eval = true;
            }
        }
    }

    bool refresh_all_quest_paths_queued = 0;


} // namespace

const GW::Quest* QuestModule::GetCustomQuestMarker()
{
    return GW::QuestMgr::GetQuest(custom_quest_id);
}

void QuestModule::SetCustomQuestMarker(const GW::Vec2f& world_pos, bool set_active)
{
    BlockQuestSound();
    Instance().Initialize();
    if (!GW::Agents::GetControlledCharacter()) return; // Map not ready
    custom_quest_marker_world_pos = world_pos;
    const auto current_map_info = GW::Map::GetMapInfo();
    if (current_map_info && world_pos.x != 0.f) {
        custom_quest_marker_continent = current_map_info->continent;
    }
    if (GW::QuestMgr::GetQuest(custom_quest_id)) {
        struct QuestRemovePacket : GW::Packet::StoC::PacketBase {
            GW::Constants::QuestID quest_id = custom_quest_id;
        };
        QuestRemovePacket quest_remove_packet;
        quest_remove_packet.header = GAME_SMSG_QUEST_REMOVE;
        GW::StoC::EmulatePacket(&quest_remove_packet);
        memset(&custom_quest_marker, 0, sizeof(custom_quest_marker));
    }
    if (custom_quest_marker_world_pos.x == 0 && custom_quest_marker_world_pos.y == 0) return;

    setting_custom_quest_marker = true;

    const auto map_id = WorldMapWidget::GetMapIdForLocation(custom_quest_marker_world_pos);

    struct QuestInfoPacket : GW::Packet::StoC::PacketBase {
        GW::Constants::QuestID quest_id = custom_quest_id;
        uint32_t log_state = 0x20;
        wchar_t location[8]{};
        wchar_t name[8]{};
        wchar_t npc[8]{};
        GW::Constants::MapID map_from;
    };

    QuestInfoPacket quest_add_packet;
    quest_add_packet.header = GAME_SMSG_QUEST_GENERAL_INFO;
    quest_add_packet.quest_id = custom_quest_id;
    wcscpy(quest_add_packet.location, L"\x564"); // Primary Quests
    wcscpy(quest_add_packet.name, custom_quest_marker_enc_name);
    quest_add_packet.map_from = GW::Constants::MapID::Count;
    GW::StoC::EmulatePacket(&quest_add_packet);

    struct QuestDescriptionPacket : GW::Packet::StoC::PacketBase {
        GW::Constants::QuestID quest_id = custom_quest_id;
        wchar_t description[128] = {0};
        wchar_t objective[128] = {0};
    };
    QuestDescriptionPacket quest_description_packet;
    quest_description_packet.header = GAME_SMSG_QUEST_DESCRIPTION;

    swprintf(quest_description_packet.description, _countof(quest_description_packet.description), L"\x108\x107You've placed a custom marker on the map.\x1");

    GW::StoC::EmulatePacket(&quest_description_packet);

    struct QuestMarkerPacket : GW::Packet::StoC::PacketBase {
        GW::Constants::QuestID quest_id = custom_quest_id;
        GW::GamePos marker;
        GW::Constants::MapID map_id;
    };
    QuestMarkerPacket quest_marker_packet;
    quest_marker_packet.header = GAME_SMSG_QUEST_UPDATE_MARKER;
    quest_marker_packet.marker = {INFINITY, INFINITY};
    quest_marker_packet.map_id = map_id;
    if (map_id == GW::Map::GetMapID()) WorldMapWidget::WorldMapToGamePos(custom_quest_marker_world_pos, quest_marker_packet.marker);
    GW::StoC::EmulatePacket(&quest_marker_packet);

    setting_custom_quest_marker = false;

    const auto quest = GetCustomQuestMarker();
    ASSERT(quest);
    custom_quest_marker = *quest;
    if (set_active) GW::QuestMgr::SetActiveQuestId(custom_quest_id);
    RefreshQuestPath(custom_quest_id);
}

std::vector<QuestObjective> QuestModule::ParseQuestObjectives(GW::Constants::QuestID quest_id)
{
    const auto quest = GW::QuestMgr::GetQuest(quest_id);
    std::vector<QuestObjective> out;
    if (!quest) return out;
    const wchar_t* next_objective_enc = nullptr;
    const wchar_t* current_objective_enc = quest->objectives;
    if (!quest->objectives) {
        BlockQuestSound();
        GW::QuestMgr::RequestQuestInfo(quest);
    }

    while (current_objective_enc) {
        next_objective_enc = wcschr(current_objective_enc, 0x2);
        size_t current_objective_len = next_objective_enc ? next_objective_enc - current_objective_enc : wcslen(current_objective_enc);

        auto enc_str = std::wstring(current_objective_enc, current_objective_len);
        auto content_start = enc_str.find(0x10a);
        if (content_start == std::wstring::npos) break;
        content_start++;

        enc_str = enc_str.substr(content_start, enc_str.size() - content_start - 1);

        const auto is_complete = *current_objective_enc == 0x2af5;

        out.push_back({quest_id, enc_str.c_str(), is_complete});

        current_objective_enc = next_objective_enc ? next_objective_enc + 1 : nullptr;
    }
    return out;
}

ImU32& QuestModule::GetQuestColor(GW::Constants::QuestID quest_id)
{
    if (GW::QuestMgr::GetActiveQuestId() == quest_id) {
        return Minimap::Instance().symbols_renderer.color_quest;
    }
    return Minimap::Instance().symbols_renderer.color_other_quests;
}

ImU32& QuestModule::GetQuestLineColor(GW::Constants::QuestID quest_id)
{
    if (auto_navigate_active && GW::QuestMgr::GetActiveQuestId() == quest_id) {
        static ImU32 auto_nav_color = IM_COL32(0, 255, 200, 255);
        return auto_nav_color;
    }
    if (GW::QuestMgr::GetActiveQuestId() == quest_id) {
        return Minimap::Instance().symbols_renderer.color_quest_line;
    }
    return Minimap::Instance().symbols_renderer.color_other_quests;
}

void QuestModule::DrawSettingsInternal()
{
    ImGui::Checkbox("Keep current quest when accepting a new one", &keep_current_quest_when_new_quest_added);
    ImGui::ShowHelp(
        "By default, Guild Wars changes your currently selected quest to the one you've just taken from an NPC.\nThis can be annoying if you don't realise your quest marker is now taking you somewhere different!\nTick this to make sure your current quest isn't changed when a new quest is added to your log."
    );
    ImGui::Checkbox("Double click a quest in the quest log window to travel to nearest outpost", &double_click_to_travel_to_quest);
    ImGui::Text("Draw path to quest marker on:");
    bool recalc_quest_paths = false;
    recalc_quest_paths |= ImGui::Checkbox("Terrain##terrianquestpath", &draw_quest_path_on_terrain);
    recalc_quest_paths |= ImGui::Checkbox("Minimap##minimapquestpath", &draw_quest_path_on_minimap);
    recalc_quest_paths |= ImGui::Checkbox("Mission Map##missionmapquestpath", &draw_quest_path_on_mission_map);
#ifdef _DEBUG
    recalc_quest_paths |= ImGui::Checkbox("Show paths to all quests##drawallquestpaths", &show_paths_to_all_quests);
#endif
    if (recalc_quest_paths) RefreshAllQuestPaths();

    ImGui::Separator();
    ImGui::Text("Questing Mode");
    ImGui::Checkbox("Auto-select closest quest on zone change##questingmode", &questing_mode_enabled);
    ImGui::ShowHelp("Automatically selects the quest with the shortest path after zone change or quest completion.");
    DrawHotkeySelector("Toggle Questing Mode", &questing_mode_hotkey_modifiers, &questing_mode_hotkey_key, &capturing_questing_mode_hotkey);
    DrawHotkeySelector("Toggle Auto-Navigate", &auto_navigate_hotkey_modifiers, &auto_navigate_hotkey_key, &capturing_auto_navigate_hotkey);
    DrawHotkeySelector("Refresh Nearest Quest", &refresh_nearest_hotkey_modifiers, &refresh_nearest_hotkey_key, &capturing_refresh_nearest_hotkey);
}

void QuestModule::LoadSettings(ToolboxIni* ini)
{
    ToolboxModule::LoadSettings(ini);
    LOAD_BOOL(draw_quest_path_on_minimap);
    LOAD_BOOL(draw_quest_path_on_mission_map);
    LOAD_BOOL(draw_quest_path_on_terrain);
    LOAD_BOOL(show_paths_to_all_quests);
    using namespace Pathing;
    float custom_quest_marker_world_pos_x = .0f;
    float custom_quest_marker_world_pos_y = .0f;
    LOAD_FLOAT(custom_quest_marker_world_pos_x);
    LOAD_FLOAT(custom_quest_marker_world_pos_y);
    LOAD_BOOL(double_click_to_travel_to_quest);
    uint32_t custom_quest_marker_continent_val = 0;
    LOAD_UINT(custom_quest_marker_continent_val);
    custom_quest_marker_continent = static_cast<GW::Continent>(custom_quest_marker_continent_val);
    custom_quest_marker_world_pos = {custom_quest_marker_world_pos_x, custom_quest_marker_world_pos_y};
    GW::GameThread::Enqueue([] {
        SetCustomQuestMarker(custom_quest_marker_world_pos);
    });
    LOAD_BOOL(keep_current_quest_when_new_quest_added);
    LOAD_BOOL(questing_mode_enabled);
    LOAD_UINT(questing_mode_hotkey_modifiers);
    LOAD_UINT(questing_mode_hotkey_key);
    LOAD_UINT(auto_navigate_hotkey_modifiers);
    LOAD_UINT(auto_navigate_hotkey_key);
    LOAD_UINT(refresh_nearest_hotkey_modifiers);
    LOAD_UINT(refresh_nearest_hotkey_key);
}

void QuestModule::SaveSettings(ToolboxIni* ini)
{
    ToolboxModule::SaveSettings(ini);
    SAVE_BOOL(draw_quest_path_on_minimap);
    SAVE_BOOL(draw_quest_path_on_mission_map);
    SAVE_BOOL(draw_quest_path_on_terrain);
    SAVE_BOOL(show_paths_to_all_quests);
    using namespace Pathing;
    float custom_quest_marker_world_pos_x = custom_quest_marker_world_pos.x;
    float custom_quest_marker_world_pos_y = custom_quest_marker_world_pos.y;
    SAVE_FLOAT(custom_quest_marker_world_pos_x);
    SAVE_FLOAT(custom_quest_marker_world_pos_y);
    uint32_t custom_quest_marker_continent_val = static_cast<uint32_t>(custom_quest_marker_continent);
    SAVE_UINT(custom_quest_marker_continent_val);
    SAVE_BOOL(double_click_to_travel_to_quest);
    SAVE_BOOL(keep_current_quest_when_new_quest_added);
    SAVE_BOOL(questing_mode_enabled);
    SAVE_UINT(questing_mode_hotkey_modifiers);
    SAVE_UINT(questing_mode_hotkey_key);
    SAVE_UINT(auto_navigate_hotkey_modifiers);
    SAVE_UINT(auto_navigate_hotkey_key);
    SAVE_UINT(refresh_nearest_hotkey_modifiers);
    SAVE_UINT(refresh_nearest_hotkey_key);
}

void QuestModule::Initialize()
{
    if (initialised) return;
    initialised = true;
    ToolboxModule::Initialize();

    memset(&custom_quest_marker, 0, sizeof(custom_quest_marker));
    uintptr_t address = GW::Scanner::FindAssertion("UiCtlWebLink.cpp", "challengeId < CHALLENGES", 0, -0x7);
    if (address) {
        bypass_custom_quest_assertion_patch.SetPatch(address, "\xeb", 1);
        bypass_custom_quest_assertion_patch.TogglePatch(true);
    }

    constexpr GW::UI::UIMessage ui_messages[] = {GW::UI::UIMessage::kQuestDetailsChanged, GW::UI::UIMessage::kQuestAdded,      GW::UI::UIMessage::kClientActiveQuestChanged, GW::UI::UIMessage::kServerActiveQuestChanged,
                                                 GW::UI::UIMessage::kMapLoaded,           GW::UI::UIMessage::kOnScreenMessage, GW::UI::UIMessage::kSendSetActiveQuest,       GW::UI::UIMessage::kSendAbandonQuest,
                                                 GW::UI::UIMessage::kStartMapLoad};
    for (const auto ui_message : ui_messages) {
        // Post callbacks, non blocking
        GW::UI::RegisterUIMessageCallback(&pre_ui_message_entry, ui_message, OnPreUIMessage, -0x4000);
        GW::UI::RegisterUIMessageCallback(&post_ui_message_entry, ui_message, OnPostUIMessage, 0x4000);
    }
    RefreshQuestPath(GW::QuestMgr::GetActiveQuestId());

    QuestLogRow_UICallback_Func = (GW::UI::UIInteractionCallback)GW::Scanner::ToFunctionStart(GW::Scanner::FindAssertion("CtlFrameList.cpp", "selection", 0, 0), 0xfff);

    if (QuestLogRow_UICallback_Func) {
        GW::Hook::CreateHook((void**)&QuestLogRow_UICallback_Func, OnQuestLogRow_UICallback, (void**)&QuestLogRow_UICallback_Ret);
        GW::Hook::EnableHooks(QuestLogRow_UICallback_Func);
    }

#ifdef _DEBUG
    ASSERT(QuestLogRow_UICallback_Func);
    ASSERT(bypass_custom_quest_assertion_patch.GetAddress());
#endif
}

bool QuestModule::SetActiveQuestId(GW::Constants::QuestID quest_id, bool notify_server)
{
    Instance().Initialize();
    const auto quest = GW::QuestMgr::GetQuest(quest_id);
    if (pending_set_active_quest.quest_id != quest_id) {
        pending_set_active_quest.reset(quest_id, notify_server);
    }
    if (!quest) {
        return false;
    }
    pending_set_active_quest.reset(GW::Constants::QuestID::None);
    BlockQuestSound();
    if (notify_server) {
        GW::QuestMgr::SetActiveQuestId(quest_id);
        return true;
    }
    GW::UI::UIPacket::kServerActiveQuestChanged packet = {
        .quest_id = quest->quest_id,
        .marker = quest->marker,
        .h0024 = quest->h0024,
        .map_id = quest->map_to,
        .log_state = quest->log_state
    };
    GW::UI::SendUIMessage(GW::UI::UIMessage::kClientActiveQuestChanged, &packet);
    GW::GetWorldContext()->active_quest_id = quest->quest_id;
    GW::UI::SendUIMessage(GW::UI::UIMessage::kServerActiveQuestChanged, &packet);
    return true;
}

bool QuestModule::WndProc(UINT Message, WPARAM wParam, LPARAM)
{
    // Hotkey capture mode (settings UI)
    if (Message == WM_KEYDOWN && (capturing_questing_mode_hotkey || capturing_auto_navigate_hotkey || capturing_refresh_nearest_hotkey)) {
        if (wParam != VK_CONTROL && wParam != VK_SHIFT && wParam != VK_MENU) {
            DWORD mods = 0;
            if (GetKeyState(VK_CONTROL) & 0x8000) mods |= 1;
            if (GetKeyState(VK_SHIFT) & 0x8000) mods |= 2;
            if (GetKeyState(VK_MENU) & 0x8000) mods |= 4;
            if (capturing_questing_mode_hotkey) {
                questing_mode_hotkey_modifiers = mods;
                questing_mode_hotkey_key = static_cast<DWORD>(wParam);
                capturing_questing_mode_hotkey = false;
            }
            else if (capturing_auto_navigate_hotkey) {
                auto_navigate_hotkey_modifiers = mods;
                auto_navigate_hotkey_key = static_cast<DWORD>(wParam);
                capturing_auto_navigate_hotkey = false;
            }
            else {
                refresh_nearest_hotkey_modifiers = mods;
                refresh_nearest_hotkey_key = static_cast<DWORD>(wParam);
                capturing_refresh_nearest_hotkey = false;
            }
            return true;
        }
        return false;
    }

    if (Message == WM_KEYDOWN) {
        if (wParam == questing_mode_hotkey_key && ModifiersMatch(questing_mode_hotkey_modifiers)) {
            questing_mode_enabled = !questing_mode_enabled;
            Log::Flash("Questing Mode %s", questing_mode_enabled ? "enabled" : "disabled");
            if (questing_mode_enabled) questing_mode_evaluation_queued = true;
            return true;
        }
        if (wParam == refresh_nearest_hotkey_key && ModifiersMatch(refresh_nearest_hotkey_modifiers)) {
            if (questing_mode_enabled) {
                questing_mode_evaluation_queued = true;
                Log::Flash("Refreshing nearest quest");
            }
            return true;
        }
        if (wParam == auto_navigate_hotkey_key && ModifiersMatch(auto_navigate_hotkey_modifiers)) {
            auto_navigate_active = !auto_navigate_active;
            if (auto_navigate_active) {
                auto_navigate_started = TIMER_INIT();
                auto_navigate_last_move_time = 0;
                auto_navigate_last_progress_time = TIMER_INIT();
                const auto p = GetPlayerPos();
                if (p) auto_navigate_last_pos = *p;
            }
            Log::Flash("Auto-navigate %s", auto_navigate_active ? "enabled" : "disabled");
            // Redraw minimap lines to update color
            const auto active_id = GW::QuestMgr::GetActiveQuestId();
            auto* cqp = GetCalculatedQuestPath(active_id, false);
            if (cqp) cqp->DrawMinimapLines();
            return true;
        }
    }

    // Cancel auto-navigate on manual movement (WASD / arrow keys only)
    if (auto_navigate_active) {
        if (Message == WM_KEYDOWN) {
            switch (wParam) {
                case 'W':
                case 'A':
                case 'S':
                case 'D':
                case VK_UP:
                case VK_DOWN:
                case VK_LEFT:
                case VK_RIGHT:
                case VK_SPACE:
                case '1':
                case '2':
                case '3':
                case '4':
                case '5':
                case '6':
                case '7':
                case '8':
                    StopAutoNavigate("manual action");
                    break;
            }
        }
    }
    return false;
}

void QuestModule::SignalTerminate()
{
    ToolboxModule::SignalTerminate();
    GW::GameThread::Enqueue([] {
        SetCustomQuestMarker({0, 0});
    });
    GW::UI::RemoveUIMessageCallback(&pre_ui_message_entry);
    GW::UI::RemoveUIMessageCallback(&post_ui_message_entry);
    ClearCalculatedPaths();
    if (QuestLogRow_UICallback_Func) {
        GW::Hook::RemoveHook(QuestLogRow_UICallback_Func);
    }
    if (bypass_custom_quest_assertion_patch.IsValid()) bypass_custom_quest_assertion_patch.Reset();
}

void QuestModule::Update(float)
{
    const auto pos = GetPlayerPos();
    if (!pos) {
        was_loading = true;
        return;
    }
    if (was_loading) {
        if (GW::UI::IsLoadingScreenShown()) return;
        OnMapLoaded();
        was_loading = false;
    }
    if (fetch_missing_quest_info_queued) {
        // NB: We only do this once the loading splash screen is gone
        fetch_missing_quest_info_queued = 0;
        GW::GameThread::Enqueue([] {
            const auto quest_log = GW::QuestMgr::GetQuestLog();
            const auto active_quest = GW::QuestMgr::GetActiveQuestId();
            if (!quest_log) return;
            BlockQuestSound();
            for (auto& quest : *quest_log) {
                if ((quest.log_state & 1)) continue;
                GW::QuestMgr::RequestQuestInfoId(quest.quest_id, true);
            }
            SetActiveQuestId(active_quest);
            if (questing_mode_enabled) {
                questing_mode_evaluation_deferred_at = TIMER_INIT();
                Log::Log("[QuestMode] FetchMissingQuestInfo callback: set deferred eval timer\n");
            }
        });
    }
    if (pending_set_active_quest.quest_id != GW::Constants::QuestID::None) {
        if (TIMER_DIFF(pending_set_active_quest.requested_at) > 3000 
            || SetActiveQuestId(pending_set_active_quest.quest_id, pending_set_active_quest.notify_server)) {
            pending_set_active_quest.reset(GW::Constants::QuestID::None);
        }
    }


    const size_t size = calculated_quest_paths.size();
check_paths:
    for (const auto& [quest_id, calculated_quest_path] : calculated_quest_paths) {
        if (quest_id != custom_quest_id && !IsActiveQuestPath(quest_id)) {
            ClearCalculatedPath(quest_id);
            ASSERT(size != calculated_quest_paths.size());
            goto check_paths;
        }
        if (calculated_quest_path->Update(*pos)) {
            ASSERT(size != calculated_quest_paths.size());
            goto check_paths;
        }
    }

    // Party spread check: pause if the furthest party member is too far behind
    if (auto_navigate_active && !auto_navigate_combat_paused) {
        float max_dist_sq = 0.f;
        const auto party_ids = GW::PartyMgr::GetPartyAgentIds();
        for (const auto agent_id : party_ids) {
            if (agent_id == GW::Agents::GetControlledCharacterId()) continue;
            const auto* agent = GW::Agents::GetAgentByID(agent_id);
            if (!agent || !agent->GetIsLivingType()) continue;
            const auto* living = agent->GetAsAgentLiving();
            if (!living || !living->GetIsAlive()) continue;
            const float d = GetSquareDistance(*pos, agent->pos);
            if (d > max_dist_sq) max_dist_sq = d;
        }
        const float threshold = auto_navigate_party_spread_paused
            ? AUTO_NAV_PARTY_SPREAD_RESUME_SQ : AUTO_NAV_PARTY_SPREAD_PAUSE_SQ;
        auto_navigate_party_spread_paused = max_dist_sq > threshold;
    }

    // Auto-navigate: follow waypoints to active quest marker
    if (auto_navigate_active && !auto_navigate_paused_for_eval && !auto_navigate_combat_paused && !auto_navigate_party_spread_paused) {
        const auto active_id = GW::QuestMgr::GetActiveQuestId();
        auto* cqp = GetCalculatedQuestPath(active_id, false);
        if (!cqp || cqp->waypoints.empty()) {
            // Path not yet available; keep requesting until grace period expires.
            // Reset the grace timer each time we trigger a new calculation so
            // post-map-load delays (quest data not yet received) don't kill nav.
            if (!cqp) {
                RefreshQuestPath(active_id);
                auto_navigate_started = TIMER_INIT();
            } else if (!cqp->IsCalculating()) {
                // Has a path object but empty waypoints and not currently calculating;
                // re-trigger calculation (quest marker may have updated).
                RefreshQuestPath(active_id);
            }
            if (TIMER_DIFF(auto_navigate_started) > AUTO_NAV_GRACE_PERIOD_MS) {
                StopAutoNavigate("no path available");
            }
        }
        else {
            // Path available (possibly recalculating, but old waypoints are usable)
            auto_navigate_started = TIMER_INIT();

            // Look-ahead targeting: find a point AUTO_NAV_LOOK_AHEAD units
            // ahead along the path from the player's closest position.
            const size_t min_seg = cqp->current_waypoint > 0 ? cqp->current_waypoint - 1 : 0;
            auto target = GetLookAheadTarget(cqp->waypoints, *pos, AUTO_NAV_LOOK_AHEAD, min_seg);

            // Only navigate to zplane 0 waypoints. The game handles walking
            // across bridges/ramps naturally when given a ground destination.
            if (target.zplane != 0) {
                // Find the next ground-level waypoint past the elevated section.
                for (size_t i = min_seg; i < cqp->waypoints.size(); i++) {
                    if (cqp->waypoints[i].zplane == 0
                        && GetSquareDistance(*pos, cqp->waypoints[i]) > AUTO_NAV_STUCK_DIST_SQ) {
                        target = cqp->waypoints[i];
                        break;
                    }
                }
            }

            if (!auto_navigate_last_move_time || TIMER_DIFF(auto_navigate_last_move_time) > AUTO_NAV_MOVE_INTERVAL_MS) {
                GW::Agents::Move(target.x, target.y, 0);
                auto_navigate_last_move_time = TIMER_INIT();
            }

            // Stuck detection
            const float moved_sq = GetSquareDistance(*pos, auto_navigate_last_pos);
            if (moved_sq > AUTO_NAV_STUCK_DIST_SQ) {
                auto_navigate_last_pos = *pos;
                auto_navigate_last_progress_time = TIMER_INIT();
                if (auto_navigate_unstuck_attempts > 0) {
                    auto_navigate_unstuck_attempts = 0;
                    auto_navigate_recalc_count = 0;
                    auto_navigate_unstuck_time = 0;
                }
            }
            else if (auto_navigate_last_progress_time && TIMER_DIFF(auto_navigate_last_progress_time) > AUTO_NAV_STUCK_TIMEOUT_MS) {
                // Stuck: first try recalculating the path, then perpendicular moves.
                if (auto_navigate_recalc_count < AUTO_NAV_MAX_RECALCS) {
                    auto_navigate_recalc_count++;
                    auto_navigate_last_progress_time = TIMER_INIT();
                    RefreshQuestPath(active_id);
                }
                else if (auto_navigate_unstuck_attempts >= AUTO_NAV_UNSTUCK_MAX_ATTEMPTS) {
                    StopAutoNavigate("stuck - no progress");
                }
                else if (!auto_navigate_unstuck_time || TIMER_DIFF(auto_navigate_unstuck_time) > AUTO_NAV_UNSTUCK_MOVE_MS) {
                    // Move perpendicular to path direction to slide off obstacle.
                    const float dx = target.x - pos->x;
                    const float dy = target.y - pos->y;
                    const float len = sqrtf(dx * dx + dy * dy);
                    if (len > 1.f) {
                        const float nx = dx / len;
                        const float ny = dy / len;
                        const float sign = (auto_navigate_unstuck_attempts % 2 == 0) ? 1.f : -1.f;
                        const float px = -ny * sign;
                        const float py = nx * sign;
                        GW::Agents::Move(pos->x + px * AUTO_NAV_UNSTUCK_DIST, pos->y + py * AUTO_NAV_UNSTUCK_DIST, 0);
                    }
                    auto_navigate_last_move_time = TIMER_INIT();
                    auto_navigate_unstuck_attempts++;
                    auto_navigate_unstuck_time = TIMER_INIT();
                }
            }

            // Check if arrived at destination; if the quest marker is on another
            // map, keep moving so the player walks through the portal.
            const float dist_sq = GetSquareDistance(*pos, cqp->waypoints.back());
            if (dist_sq < AUTO_NAV_ARRIVAL_DIST_SQ) {
                const auto active_quest = GW::QuestMgr::GetQuest(active_id);
                const bool target_is_other_map = active_quest
                    && active_quest->map_to != GW::Constants::MapID::None
                    && active_quest->map_to != GW::Map::GetMapID();
                if (!target_is_other_map) StopAutoNavigate("arrived at destination");
            }
        }
    }

    // Questing mode evaluation
    bool force_eval = false;
    if (questing_mode_evaluation_queued) {
        questing_mode_evaluation_queued = false;
        Log::Log("[QuestMode] PATH 1: queued eval triggered\n");
        force_eval = true;
    }
    else if (questing_mode_evaluation_deferred_at && TIMER_DIFF(questing_mode_evaluation_deferred_at) > QUESTING_MODE_EVAL_DEFER_MS) {
        questing_mode_evaluation_deferred_at = 0;
        Log::Log("[QuestMode] PATH 2: deferred eval triggered\n");
        force_eval = true;
    }
    else if (questing_mode_enabled && TIMER_DIFF(questing_mode_last_eval) > QUESTING_MODE_EVAL_INTERVAL_MS) {
        questing_mode_last_eval = TIMER_INIT();
        if (CheckForQuestRemovals()) {
            force_eval = true;
        } else {
            BeginQuestingModeEvaluation();
        }
    }

    if (force_eval) {
        BeginQuestingModeEvaluation(true);
        if (auto_navigate_paused_for_eval) {
            auto_navigate_paused_for_eval = false;
            auto_navigate_started = TIMER_INIT();
            auto_navigate_last_progress_time = TIMER_INIT();
        }
    }
}

bool QuestModule::CanTerminate()
{
    return !GetCustomQuestMarker();
}

void QuestModule::FetchMissingQuestInfo()
{
    if (fetch_missing_quest_info_queued) return;
    fetch_missing_quest_info_queued = TIMER_INIT();
}

void QuestModule::Terminate()
{
    ToolboxModule::Terminate();
    initialised = false;
}

QuestObjective::QuestObjective(const GW::Constants::QuestID quest_id, const wchar_t* objective_enc, const bool is_completed) : quest_id(quest_id), objective_enc(new GuiUtils::EncString(objective_enc)), is_completed(is_completed) {}

QuestObjective::~QuestObjective()
{
    if (objective_enc) objective_enc->Release();
}

// Exported for plugins (e.g. DaggerCombo) to pause/resume auto-navigate
extern "C" __declspec(dllexport) void PauseAutoNavigate()
{
    auto_navigate_combat_paused = true;
}

extern "C" __declspec(dllexport) void ResumeAutoNavigate()
{
    if (!auto_navigate_combat_paused) return;
    auto_navigate_combat_paused = false;
    auto_navigate_started = TIMER_INIT();
    auto_navigate_last_progress_time = TIMER_INIT();
    auto_navigate_unstuck_attempts = 0;
    auto_navigate_recalc_count = 0;
    auto_navigate_unstuck_time = 0;
}
