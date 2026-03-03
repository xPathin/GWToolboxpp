#include "SkillQueue.h"

#include <array>

#include <GWCA/Constants/Constants.h>
#include <GWCA/Constants/Skills.h>
#include <GWCA/GameEntities/Agent.h>
#include <GWCA/GameEntities/Skill.h>
#include <GWCA/Managers/AgentMgr.h>
#include <GWCA/Managers/EffectMgr.h>
#include <GWCA/Managers/GameThreadMgr.h>
#include <GWCA/Managers/MapMgr.h>
#include <GWCA/Managers/SkillbarMgr.h>
#include <GWCA/Managers/UIMgr.h>
#include <GWCA/Utilities/Hook.h>

namespace {
    enum class SkillMode : uint8_t {
        Off = 0,
        AutoCast = 1
    };

    struct SlotState {
        SkillMode mode = SkillMode::Off;
        bool cast_pending = false;
    };

    bool enabled = true;
    bool visible = true;
    uint32_t min_cast_interval_ms = 250;

    std::array<SlotState, 8> slots{};
    GW::Constants::SkillID prev_skill_ids[8]{};
    uint32_t last_cast_ms = 0;

    // Skillbar position tracking
    GW::HookEntry ui_hook;
    bool skillbar_position_dirty = true;
    GW::UI::FramePosition skillbar_skill_positions[8];
    ImVec2 skill_positions_calculated[8];
    float skill_width = 50.f;
    float skill_height = 50.f;

    void OnUIMessage(GW::HookStatus*, GW::UI::UIMessage, void*, void*)
    {
        skillbar_position_dirty = true;
    }

    bool GetSkillbarPos()
    {
        if (!skillbar_position_dirty) {
            return true;
        }
        const auto frame = GW::UI::GetFrameByLabel(L"Skillbar");
        if (!(frame && frame->IsVisible() && frame->IsCreated())) {
            return false;
        }
        if (!GImGui) {
            return false;
        }
        const auto imgui_viewport = ImGui::GetMainViewport();
        for (size_t i = 0; i < 8; i++) {
            const auto skillframe = GW::UI::GetChildFrame(frame, i);
            if (!skillframe) {
                return false;
            }
            skillbar_skill_positions[i] = skillframe->position;
            skill_positions_calculated[i] = skillbar_skill_positions[i].GetTopLeftOnScreen();
            skill_positions_calculated[i].y += imgui_viewport->Pos.y;
            skill_positions_calculated[i].x += imgui_viewport->Pos.x;
            if (i == 0) {
                skill_width = skillbar_skill_positions[0].GetSizeOnScreen().x;
                skill_height = skillbar_skill_positions[0].GetSizeOnScreen().y;
            }
        }
        skillbar_position_dirty = false;
        return true;
    }

    bool IsBuffType(GW::Constants::SkillType type)
    {
        switch (type) {
            case GW::Constants::SkillType::Enchantment:
            case GW::Constants::SkillType::Stance:
            case GW::Constants::SkillType::Preparation:
            case GW::Constants::SkillType::Form:
            case GW::Constants::SkillType::Shout:
            case GW::Constants::SkillType::Chant:
            case GW::Constants::SkillType::EchoRefrain:
            case GW::Constants::SkillType::WeaponSpell:
            case GW::Constants::SkillType::Ritual:
                return true;
            default:
                return false;
        }
    }

    bool HasActiveEffect(const uint32_t agent_id, const GW::Constants::SkillID skill_id)
    {
        const auto* effects = GW::Effects::GetAgentEffects(agent_id);
        if (!effects) {
            return false;
        }
        for (const auto& effect : *effects) {
            if (effect.skill_id == skill_id && effect.GetTimeRemaining() > 0) {
                return true;
            }
        }
        return false;
    }

    bool IsSkillReady(const GW::Skillbar* bar, const uint32_t slot)
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
        if (data->adrenaline > 0) {
            return skill.adrenaline_a >= data->adrenaline;
        }
        return skill.GetRecharge() == 0;
    }

    void ResetAllModes()
    {
        for (auto& slot : slots) {
            slot.mode = SkillMode::Off;
            slot.cast_pending = false;
        }
    }

    SkillMode CycleMode(const SkillMode current)
    {
        return current == SkillMode::Off ? SkillMode::AutoCast : SkillMode::Off;
    }
}

DLLAPI ToolboxPlugin* ToolboxPluginInstance()
{
    static SkillQueue instance;
    return &instance;
}

void SkillQueue::Initialize(ImGuiContext* ctx, const ImGuiAllocFns allocator_fns, const HMODULE toolbox_dll)
{
    ToolboxPlugin::Initialize(ctx, allocator_fns, toolbox_dll);
    GW::UI::RegisterUIMessageCallback(&ui_hook, GW::UI::UIMessage::kUIPositionChanged, OnUIMessage, 0x8000);
    GW::UI::RegisterUIMessageCallback(&ui_hook, GW::UI::UIMessage::kPreferenceValueChanged, OnUIMessage, 0x8000);
}

void SkillQueue::SignalTerminate()
{
    ToolboxPlugin::SignalTerminate();
    GW::UI::RemoveUIMessageCallback(&ui_hook);
}

bool SkillQueue::CanTerminate()
{
    return true;
}

bool SkillQueue::WndProc(const UINT msg, const WPARAM, const LPARAM)
{
    if (!enabled || msg != WM_LBUTTONDOWN) {
        return false;
    }
    if (!(GetKeyState(VK_SHIFT) & 0x8000)) {
        return false;
    }

    const auto* hovered = GW::SkillbarMgr::GetHoveredSkill();
    if (!hovered || hovered->skill_id == GW::Constants::SkillID::No_Skill) {
        return false;
    }

    const auto* bar = GW::SkillbarMgr::GetPlayerSkillbar();
    if (!bar || !bar->IsValid()) {
        return false;
    }

    for (int i = 0; i < 8; i++) {
        if (bar->skills[i].skill_id == hovered->skill_id) {
            slots[i].mode = CycleMode(slots[i].mode);
            slots[i].cast_pending = false;
            return true;
        }
    }
    return false;
}

void SkillQueue::Update(float)
{
    if (!enabled) {
        return;
    }

    if (GW::Map::GetInstanceType() == GW::Constants::InstanceType::Loading) {
        ResetAllModes();
        return;
    }

    const auto* bar = GW::SkillbarMgr::GetPlayerSkillbar();
    if (!bar || !bar->IsValid()) {
        return;
    }

    // Detect skillbar changes and reset modes
    bool bar_changed = false;
    for (int i = 0; i < 8; i++) {
        if (bar->skills[i].skill_id != prev_skill_ids[i]) {
            bar_changed = true;
            prev_skill_ids[i] = bar->skills[i].skill_id;
        }
    }
    if (bar_changed) {
        ResetAllModes();
        return;
    }

    const auto* player = GW::Agents::GetControlledCharacter();
    if (!player || player->GetIsDead() || player->GetIsKnockedDown() || player->GetIsCasting()) {
        return;
    }

    const auto now = GW::Map::GetInstanceTime();
    if (now - last_cast_ms < min_cast_interval_ms) {
        return;
    }

    for (int i = 0; i < 8; i++) {
        auto& slot = slots[i];
        if (slot.mode == SkillMode::Off) {
            continue;
        }

        const bool ready = IsSkillReady(bar, static_cast<uint32_t>(i));

        // Clear pending once the game confirms the skill is no longer ready (recharging/disabled)
        if (slot.cast_pending) {
            if (!ready) {
                slot.cast_pending = false;
            }
            continue;
        }

        if (!ready) {
            continue;
        }

        const auto& skill = bar->skills[i];
        const auto* data = GW::SkillbarMgr::GetSkillConstantData(skill.skill_id);
        if (!data) {
            continue;
        }

        // For buff-type skills, only recast when the effect has expired on self
        if (IsBuffType(data->type)) {
            if (HasActiveEffect(GW::Agents::GetControlledCharacterId(), skill.skill_id)) {
                continue;
            }
        }

        const auto action = static_cast<GW::UI::ControlAction>(
            static_cast<uint32_t>(GW::UI::ControlAction::ControlAction_UseSkill1) + i);
        slot.cast_pending = true;
        GW::GameThread::Enqueue([action] {
            GW::UI::Keypress(action);
        });

        last_cast_ms = now;
        break; // one cast per tick
    }
}

void SkillQueue::Draw(IDirect3DDevice9*)
{
    if (!enabled || !visible) {
        return;
    }
    if (GW::Map::GetInstanceType() == GW::Constants::InstanceType::Loading) {
        return;
    }
    if (!GetSkillbarPos()) {
        return;
    }

    const auto draw_list = ImGui::GetBackgroundDrawList();
    const float indicator_size = skill_width * 0.25f;
    const float radius = indicator_size * 0.5f;

    for (int i = 0; i < 8; i++) {
        if (slots[i].mode == SkillMode::Off) {
            continue;
        }

        const auto& top_left = skill_positions_calculated[i];
        const ImVec2 center = {
            top_left.x + 1.f + radius,
            top_left.y + 1.f + radius
        };

        draw_list->AddCircleFilled(center, radius, IM_COL32(255, 165, 0, 180));
        draw_list->AddCircle(center, radius, IM_COL32(0, 0, 0, 200), 0, 1.5f);
    }
}

void SkillQueue::LoadSettings(const wchar_t* folder)
{
    ToolboxPlugin::LoadSettings(folder);
    PLUGIN_LOAD_BOOL(enabled);
}

void SkillQueue::SaveSettings(const wchar_t* folder)
{
    PLUGIN_SAVE_BOOL(enabled);
    ToolboxPlugin::SaveSettings(folder);
}

void SkillQueue::DrawSettings()
{
    if (!toolbox_handle) {
        return;
    }
    ImGui::Checkbox("Enable Skill Queue", &enabled);
    ImGui::TextWrapped(
        "Shift+Click a skill on your skill bar to toggle auto-cast.\n\n"
        "When enabled (orange dot), the skill casts automatically when ready.\n"
        "For buffs/enchantments, only recasts when the effect expires on the target.");
}
