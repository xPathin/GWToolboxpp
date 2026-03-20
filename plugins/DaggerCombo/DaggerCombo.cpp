#include "DaggerCombo.h"

#include <GWCA/Constants/Constants.h>
#include <GWCA/GameEntities/Agent.h>
#include <GWCA/GameEntities/Skill.h>
#include <GWCA/GameEntities/Party.h>
#include <GWCA/Managers/AgentMgr.h>
#include <GWCA/Managers/ItemMgr.h>
#include <GWCA/Managers/GameThreadMgr.h>
#include <GWCA/Managers/PartyMgr.h>
#include <GWCA/Managers/MapMgr.h>
#include <GWCA/Managers/SkillbarMgr.h>
#include <GWCA/Managers/UIMgr.h>
#include <GWCA/Utilities/Hook.h>

namespace {
    bool enabled = true;
    bool auto_target_nearest = true;
    bool hold_to_combo = true;
    bool auto_loot = true;
    bool auto_engage = false;

    // Auto-engage state
    bool auto_engage_active = false;

    // Nav control (resolved from GWToolboxdll at init)
    using NavFn = void(*)();
    NavFn PauseAutoNavigate = nullptr;
    NavFn ResumeAutoNavigate = nullptr;

    GW::HookEntry keydown_hook;
    GW::HookEntry msg_hooks[3];

    bool IsSkillSpamMessage(const wchar_t* msg)
    {
        if (!msg) return false;
        switch (msg[0]) {
        case 0x8C4: // "That skill is still recharging"
        case 0x8C3: // "Target is out of range"
        case 0x8C2: // "Invalid spell target"
        case 0x88E: // "Invalid attack target"
            return true;
        default:
            return false;
        }
    }

    // Hold-to-combo state
    bool combo_active = false;
    int lead_slot = -1;
    uint32_t tracked_vk = 0;
    uint32_t pending_vk = 0;
    uint32_t last_cast_ms = 0;
    constexpr uint32_t CAST_INTERVAL_MS = 250;
    bool casting_from_update = false;
    bool cast_pending = false;
    int cast_pending_slot = -1;
    uint32_t cast_pending_ms = 0;

    bool IsSkillReady(const GW::Skillbar* bar, uint32_t slot, float current_energy = -1.f)
    {
        const auto& skill = bar->skills[slot];
        if (skill.skill_id == GW::Constants::SkillID::No_Skill) {
            return false;
        }
        if (bar->disabled & (1u << slot)) {
            return false;
        }
        const auto* data = GW::SkillbarMgr::GetSkillConstantData(skill.skill_id);
        if (!data) {
            return false;
        }
        if (current_energy >= 0.f && data->GetEnergyCost() > 0) {
            if (current_energy < static_cast<float>(data->GetEnergyCost())) {
                return false;
            }
        }
        if (data->adrenaline > 0) {
            return skill.adrenaline_a >= data->adrenaline;
        }
        return skill.GetRecharge() == 0;
    }

    int FindComboFollowUp(const GW::Skillbar* bar, int after_slot, uint8_t needed_combo, float current_energy = -1.f)
    {
        for (int slot = after_slot + 1; slot < 8; slot++) {
            const auto& candidate = bar->skills[slot];
            if (candidate.skill_id == GW::Constants::SkillID::No_Skill) {
                continue;
            }
            const auto* data = GW::SkillbarMgr::GetSkillConstantData(candidate.skill_id);
            if (!data || data->combo != needed_combo) {
                continue;
            }
            if (!IsSkillReady(bar, static_cast<uint32_t>(slot), current_energy)) {
                continue;
            }
            return slot;
        }
        return -1;
    }

    // Auto-loot state
    uint32_t looting_agent_id = 0;
    uint32_t loot_attempt_ms = 0;
    constexpr uint32_t LOOT_TIMEOUT_MS = 5000;
    constexpr float LOOT_RANGE = GW::Constants::Range::Earshot;

    // Auto-engage: preemptive enemy detection range (default Spellcast = 1248)
    float auto_engage_range = GW::Constants::Range::Spellcast;

    uint32_t combo_deactivated_ms = 0;
    constexpr uint32_t MSG_BLOCK_GRACE_MS = 1000;

    bool ShouldBlockMessages()
    {
        if (combo_active) return true;
        if (!combo_deactivated_ms) return false;
        return (GW::Map::GetInstanceTime() - combo_deactivated_ms) < MSG_BLOCK_GRACE_MS;
    }

    const GW::AgentItem* FindNearestLootableItem(const GW::AgentLiving* player)
    {
        const auto* agents = GW::Agents::GetAgentArray();
        if (!agents) return nullptr;

        const GW::AgentItem* nearest = nullptr;
        float nearest_dist = LOOT_RANGE;

        for (auto* agent : *agents) {
            if (!agent || !agent->GetIsItemType()) continue;
            const auto* item_agent = agent->GetAsAgentItem();
            if (!item_agent) continue;
            if (item_agent->owner != 0 && item_agent->owner != player->agent_id) continue;
            if (!GW::Items::GetItemById(item_agent->item_id)) continue;

            const float dist = GetDistance(player->pos, agent->pos);
            if (dist < nearest_dist) {
                nearest_dist = dist;
                nearest = item_agent;
            }
        }
        return nearest;
    }

    bool HasNearbyEnemies(const GW::AgentLiving* player, float range)
    {
        const auto* agents = GW::Agents::GetAgentArray();
        if (!agents) return false;

        for (auto* agent : *agents) {
            if (!agent || !agent->GetIsLivingType()) continue;
            const auto* living = agent->GetAsAgentLiving();
            if (!living || !living->GetIsAlive()) continue;
            if (living->allegiance != GW::Constants::Allegiance::Enemy) continue;
            if (GetDistance(player->pos, agent->pos) <= range) return true;
        }
        return false;
    }

    int FindLeadAttackSlot(const GW::Skillbar* bar)
    {
        for (int slot = 0; slot < 8; slot++) {
            const auto& skill = bar->skills[slot];
            if (skill.skill_id == GW::Constants::SkillID::No_Skill) continue;
            const auto* data = GW::SkillbarMgr::GetSkillConstantData(skill.skill_id);
            if (data && data->combo == 1) return slot;
        }
        return -1;
    }

    void DeactivateCombo()
    {
        combo_deactivated_ms = GW::Map::GetInstanceTime();
        combo_active = false;
        lead_slot = -1;
        tracked_vk = 0;
        cast_pending = false;
        cast_pending_slot = -1;
        looting_agent_id = 0;
        loot_attempt_ms = 0;
        if (auto_engage_active && ResumeAutoNavigate) ResumeAutoNavigate();
        auto_engage_active = false;
    }

    void AutoTargetNearest()
    {
        if (auto_target_nearest) {
            GW::GameThread::Enqueue([] {
                GW::UI::Keypress(GW::UI::ControlAction::ControlAction_TargetNearestEnemy);
            });
        }
    }

    void OnKeyDown(GW::HookStatus* status, const uint32_t key)
    {
        if (!enabled) {
            return;
        }
        if (key < GW::UI::ControlAction_UseSkill1 || key > GW::UI::ControlAction_UseSkill8) {
            return;
        }
        // Let our own programmatic Keypresses through
        if (casting_from_update) {
            return;
        }

        const auto pressed_slot = static_cast<int>(key - GW::UI::ControlAction_UseSkill1);

        const auto* bar = GW::SkillbarMgr::GetPlayerSkillbar();
        if (!bar || !bar->IsValid()) {
            return;
        }

        const auto& skill = bar->skills[pressed_slot];
        if (skill.skill_id == GW::Constants::SkillID::No_Skill) {
            return;
        }

        const auto* skill_data = GW::SkillbarMgr::GetSkillConstantData(skill.skill_id);
        if (!skill_data || skill_data->combo != 1) {
            // Don't kill an active hold-to-combo when other skills fire (e.g. SkillQueue auto-cast)
            if (!hold_to_combo || !combo_active) {
                DeactivateCombo();
            }
            return;
        }

        // Hold-to-combo: activate and let Update handle everything
        if (hold_to_combo) {
            if (!combo_active || lead_slot != pressed_slot) {
                lead_slot = pressed_slot;
                tracked_vk = pending_vk;
                combo_active = true;
                last_cast_ms = 0;
            }
            status->blocked = true;
            return;
        }

        // Single-press mode: chain on repeated presses of the same lead key
        const auto target_id = GW::Agents::GetTargetId();
        if (!target_id) {
            AutoTargetNearest();
            return;
        }
        const auto* target = static_cast<const GW::AgentLiving*>(GW::Agents::GetAgentByID(target_id));
        if (!target || !target->GetIsLivingType()) {
            return;
        }

        const uint8_t dagger_status = target->dagger_status;
        if (dagger_status == 0 || dagger_status == 3) {
            return;
        }

        const uint8_t needed_combo = (dagger_status == 1) ? 2 : 3;
        const int follow_up = FindComboFollowUp(bar, pressed_slot, needed_combo);
        if (follow_up >= 0) {
            status->blocked = true;
            const auto cast_slot = static_cast<uint32_t>(follow_up);
            GW::GameThread::Enqueue([cast_slot, target_id] {
                GW::SkillbarMgr::UseSkill(cast_slot, target_id);
            });
        }
    }
}

DLLAPI ToolboxPlugin* ToolboxPluginInstance()
{
    static DaggerCombo instance;
    return &instance;
}

void DaggerCombo::Initialize(ImGuiContext* ctx, const ImGuiAllocFns allocator_fns, const HMODULE toolbox_dll)
{
    ToolboxPlugin::Initialize(ctx, allocator_fns, toolbox_dll);

    PauseAutoNavigate = reinterpret_cast<NavFn>(GetProcAddress(toolbox_dll, "PauseAutoNavigate"));
    ResumeAutoNavigate = reinterpret_cast<NavFn>(GetProcAddress(toolbox_dll, "ResumeAutoNavigate"));

    GW::UI::RegisterKeydownCallback(&keydown_hook, OnKeyDown);
    // Block skill spam messages during hold-to-combo
    constexpr uint32_t chat_msgs[] = {
        0x3000001f, // kPrintChatMessage
        0x3000001d, // kLogChatMessage
        0x1000007f, // kWriteToChatLog
    };
    for (int i = 0; i < 3; i++) {
        GW::UI::RegisterUIMessageCallback(&msg_hooks[i],
            static_cast<GW::UI::UIMessage>(chat_msgs[i]),
            [](GW::HookStatus* status, GW::UI::UIMessage msg_id, void* wparam, void*) {
                if (!ShouldBlockMessages()) return;
                // kLogChatMessage has message first; the others have channel first then message
                wchar_t* message = nullptr;
                if (static_cast<uint32_t>(msg_id) == 0x3000001d) {
                    message = *static_cast<wchar_t**>(wparam);
                } else {
                    message = *reinterpret_cast<wchar_t**>(static_cast<char*>(wparam) + sizeof(uint32_t));
                }
                if (IsSkillSpamMessage(message))
                    status->blocked = true;
            });
    }
}

void DaggerCombo::SignalTerminate()
{
    ToolboxPlugin::SignalTerminate();
    if (auto_engage_active && ResumeAutoNavigate) ResumeAutoNavigate();
    GW::UI::RemoveKeydownCallback(&keydown_hook);
    for (auto& hook : msg_hooks)
        GW::UI::RemoveUIMessageCallback(&hook, static_cast<GW::UI::UIMessage>(0));
}

bool DaggerCombo::CanTerminate()
{
    return true;
}

bool DaggerCombo::WndProc(const UINT msg, const WPARAM wParam, const LPARAM)
{
    if (msg == WM_KEYDOWN) {
        pending_vk = static_cast<uint32_t>(wParam);
    }
    return false;
}

void DaggerCombo::Update(float)
{
    if (!enabled) return;

    // Auto-engage: activate combo when enemies or lootable items are nearby
    if (auto_engage && !combo_active) {
        const auto* player_check = GW::Agents::GetControlledCharacter();
        const auto* bar = GW::SkillbarMgr::GetPlayerSkillbar();
        if (player_check && bar && bar->IsValid() &&
            (HasNearbyEnemies(player_check, auto_engage_range) ||
             (auto_loot && FindNearestLootableItem(player_check)))) {
            const int slot = FindLeadAttackSlot(bar);
            if (slot >= 0) {
                lead_slot = slot;
                tracked_vk = 0;
                combo_active = true;
                auto_engage_active = true;
                last_cast_ms = 0;
                if (PauseAutoNavigate) PauseAutoNavigate();
            }
        }
    }

    if (!combo_active) return;
    if (!hold_to_combo && !auto_engage_active) return;

    if (lead_slot < 0 || lead_slot >= 8) {
        DeactivateCombo();
        return;
    }

    // Check if the physical key is still held (hold-to-combo mode)
    if (tracked_vk && !(GetAsyncKeyState(static_cast<int>(tracked_vk)) & 0x8000)) {
        DeactivateCombo();
        return;
    }

    if (GW::Map::GetInstanceType() == GW::Constants::InstanceType::Loading) {
        DeactivateCombo();
        return;
    }

    const auto* player = GW::Agents::GetControlledCharacter();
    if (!player || player->GetIsDead()) {
        DeactivateCombo();
        return;
    }
    if (player->GetIsCasting() || player->GetIsKnockedDown()) {
        return;
    }

    // Auto-engage deactivation: stop when no nearby enemies, party out of combat, and no work remains
    if (auto_engage_active && !HasNearbyEnemies(player, auto_engage_range)) {
        bool has_work = looting_agent_id != 0;
        if (!has_work) {
            const auto tid = GW::Agents::GetTargetId();
            if (tid) {
                const auto* t = GW::Agents::GetAgentByID(tid);
                if (t && t->GetIsLivingType()) {
                    const auto* living = t->GetAsAgentLiving();
                    has_work = living && living->GetIsAlive();
                }
            }
        }
        if (!has_work && auto_loot) {
            has_work = FindNearestLootableItem(player) != nullptr;
        }
        if (!has_work) {
            DeactivateCombo();
            return;
        }
    }

    const auto* bar = GW::SkillbarMgr::GetPlayerSkillbar();
    if (!bar || !bar->IsValid()) {
        return;
    }

    // Wait for game to acknowledge the previous cast before firing again
    if (cast_pending && cast_pending_slot >= 0) {
        const auto now_check = GW::Map::GetInstanceTime();
        if (!IsSkillReady(bar, static_cast<uint32_t>(cast_pending_slot))) {
            cast_pending = false;
            cast_pending_slot = -1;
        } else if (now_check - cast_pending_ms > 500) {
            cast_pending = false;
            cast_pending_slot = -1;
        } else {
            return;
        }
    }

    const auto now = GW::Map::GetInstanceTime();
    if (now - last_cast_ms < CAST_INTERVAL_MS) {
        return;
    }

    // Auto-loot: pick up nearby items before engaging new targets
    if (auto_loot) {
        // Currently trying to pick something up?
        if (looting_agent_id) {
            const auto* loot_agent = GW::Agents::GetAgentByID(looting_agent_id);
            if (!loot_agent || !loot_agent->GetIsItemType()) {
                // Item gone (picked up or despawned)
                looting_agent_id = 0;
                loot_attempt_ms = 0;
            } else if (now - loot_attempt_ms > LOOT_TIMEOUT_MS) {
                // Timeout, give up on this item
                looting_agent_id = 0;
                loot_attempt_ms = 0;
            } else {
                return; // Still walking to / picking up item
            }
        }

        // Only loot when not fighting a living target
        const auto target_id_check = GW::Agents::GetTargetId();
        bool has_living_target = false;
        if (target_id_check) {
            const auto* t = GW::Agents::GetAgentByID(target_id_check);
            if (t && t->GetIsLivingType()) {
                const auto* living = t->GetAsAgentLiving();
                has_living_target = living && living->GetIsAlive();
            }
        }

        if (!has_living_target) {
            const auto* loot = FindNearestLootableItem(player);
            if (loot) {
                looting_agent_id = loot->agent_id;
                loot_attempt_ms = now;
                const auto item_id = loot->item_id;
                GW::GameThread::Enqueue([item_id] {
                    const auto* item = GW::Items::GetItemById(item_id);
                    if (item) {
                        GW::Items::PickUpItem(item);
                    }
                });
                return;
            }
        }
    }

    // Check target; retarget if dead or missing
    const auto target_id = GW::Agents::GetTargetId();
    if (target_id) {
        const auto* target = static_cast<const GW::AgentLiving*>(GW::Agents::GetAgentByID(target_id));
        if (!target || !target->GetIsLivingType() || target->GetIsDead()) {
            AutoTargetNearest();
            return;
        }
    } else {
        AutoTargetNearest();
        return;
    }

    // Determine which skill to cast based on dagger combo state
    const auto* target = static_cast<const GW::AgentLiving*>(GW::Agents::GetAgentByID(target_id));
    const uint8_t dagger_status = target->dagger_status;
    const float current_energy = player->energy * static_cast<float>(player->max_energy);

    int slot_to_cast = -1;

    if (dagger_status == 0 || dagger_status == 3) {
        if (IsSkillReady(bar, static_cast<uint32_t>(lead_slot), current_energy)) {
            slot_to_cast = lead_slot;
        }
    } else {
        const uint8_t needed_combo = (dagger_status == 1) ? 2 : 3;
        slot_to_cast = FindComboFollowUp(bar, lead_slot, needed_combo, current_energy);
        // Fall back to lead if no follow-up is ready (restarts the chain)
        if (slot_to_cast < 0 && IsSkillReady(bar, static_cast<uint32_t>(lead_slot), current_energy)) {
            slot_to_cast = lead_slot;
        }
    }

    if (slot_to_cast >= 0) {
        cast_pending = true;
        cast_pending_slot = slot_to_cast;
        cast_pending_ms = now;
        const auto action = static_cast<GW::UI::ControlAction>(
            static_cast<uint32_t>(GW::UI::ControlAction::ControlAction_UseSkill1) + slot_to_cast);
        GW::GameThread::Enqueue([action] {
            casting_from_update = true;
            GW::UI::Keypress(action);
            casting_from_update = false;
        });
        last_cast_ms = now;
    } else {
        // No skill available (including lead); fall back to normal attack
        const auto* t = GW::Agents::GetAgentByID(target_id);
        if (t) {
            GW::GameThread::Enqueue([t] {
                GW::Agents::InteractAgent(t);
            });
        }
        last_cast_ms = now;
    }
}

void DaggerCombo::LoadSettings(const wchar_t* folder)
{
    ToolboxPlugin::LoadSettings(folder);
    PLUGIN_LOAD_BOOL(enabled);
    PLUGIN_LOAD_BOOL(auto_target_nearest);
    PLUGIN_LOAD_BOOL(hold_to_combo);
    PLUGIN_LOAD_BOOL(auto_loot);
    PLUGIN_LOAD_BOOL(auto_engage);
    PLUGIN_LOAD_FLOAT(auto_engage_range);
}

void DaggerCombo::SaveSettings(const wchar_t* folder)
{
    PLUGIN_SAVE_BOOL(enabled);
    PLUGIN_SAVE_BOOL(auto_target_nearest);
    PLUGIN_SAVE_BOOL(hold_to_combo);
    PLUGIN_SAVE_BOOL(auto_loot);
    PLUGIN_SAVE_BOOL(auto_engage);
    PLUGIN_SAVE_FLOAT(auto_engage_range);
    ToolboxPlugin::SaveSettings(folder);
}

void DaggerCombo::DrawSettings()
{
    if (!toolbox_handle) {
        return;
    }
    ImGui::Checkbox("Enable 1-Key Dagger Combo", &enabled);
    ImGui::Checkbox("Auto-target nearest enemy", &auto_target_nearest);
    ImGui::Checkbox("Hold to auto-chain combo", &hold_to_combo);
    ImGui::Checkbox("Auto-loot items before engaging", &auto_loot);
    ImGui::Checkbox("Auto-engage when party enters combat", &auto_engage);
    if (auto_engage) {
        ImGui::SliderFloat("Auto-engage range", &auto_engage_range, 500.0f, 10000.0f, "%.0f");
        ImGui::SameLine();
        if (ImGui::SmallButton("Reset")) {
            auto_engage_range = GW::Constants::Range::Spellcast;
        }
    }
    ImGui::TextWrapped(
        "Press a Lead Attack skill key to automatically chain "
        "through the next Off-Hand and Dual attacks on your skill bar.\n\n"
        "When auto-target is enabled, pressing a Lead Attack with no "
        "target selected will first select the nearest enemy.\n\n"
        "When hold-to-chain is enabled, holding the Lead Attack key "
        "continuously chains the combo and retargets on kill.\n\n"
        "When auto-loot is enabled, nearby items are picked up "
        "before engaging the next enemy. Items that drop during "
        "combat are looted after the current target dies.\n\n"
        "When auto-engage is enabled, the combo activates automatically "
        "when any party member enters combat. Works with auto-navigate "
        "for hands-free questing.");
}
