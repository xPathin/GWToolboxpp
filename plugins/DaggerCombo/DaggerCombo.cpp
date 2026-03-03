#include "DaggerCombo.h"

#include <GWCA/Constants/Constants.h>
#include <GWCA/GameEntities/Agent.h>
#include <GWCA/GameEntities/Skill.h>
#include <GWCA/Managers/AgentMgr.h>
#include <GWCA/Managers/GameThreadMgr.h>
#include <GWCA/Managers/SkillbarMgr.h>
#include <GWCA/Managers/UIMgr.h>
#include <GWCA/Utilities/Hook.h>

namespace {
    bool enabled = true;
    GW::HookEntry keydown_hook;
    int last_lead_slot = -1;

    bool IsSkillReady(const GW::Skillbar* bar, uint32_t slot)
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

    void OnKeyDown(GW::HookStatus* status, const uint32_t key)
    {
        if (!enabled) {
            return;
        }
        if (key < GW::UI::ControlAction_UseSkill1 || key > GW::UI::ControlAction_UseSkill8) {
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
            return;
        }

        // Only chain on repeated same-key presses.
        // Pressing a different lead key starts a fresh chain.
        if (pressed_slot != last_lead_slot) {
            last_lead_slot = pressed_slot;
            return;
        }

        // Get the target agent's dagger_status (combo state is tracked on the target)
        const auto target_id = GW::Agents::GetTargetId();
        if (!target_id) {
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

        for (int slot = pressed_slot + 1; slot < 8; slot++) {
            const auto& candidate = bar->skills[slot];
            if (candidate.skill_id == GW::Constants::SkillID::No_Skill) {
                continue;
            }
            const auto* candidate_data = GW::SkillbarMgr::GetSkillConstantData(candidate.skill_id);
            if (!candidate_data || candidate_data->combo != needed_combo) {
                continue;
            }
            if (!IsSkillReady(bar, static_cast<uint32_t>(slot))) {
                continue;
            }

            status->blocked = true;
            const auto target_slot = static_cast<uint32_t>(slot);
            GW::GameThread::Enqueue([target_slot, target_id] {
                GW::SkillbarMgr::UseSkill(target_slot, target_id);
            });
            return;
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
    GW::UI::RegisterKeydownCallback(&keydown_hook, OnKeyDown);
}

void DaggerCombo::SignalTerminate()
{
    ToolboxPlugin::SignalTerminate();
    GW::UI::RemoveKeydownCallback(&keydown_hook);
}

bool DaggerCombo::CanTerminate()
{
    return true;
}

void DaggerCombo::LoadSettings(const wchar_t* folder)
{
    ToolboxPlugin::LoadSettings(folder);
    PLUGIN_LOAD_BOOL(enabled);
}

void DaggerCombo::SaveSettings(const wchar_t* folder)
{
    PLUGIN_SAVE_BOOL(enabled);
    ToolboxPlugin::SaveSettings(folder);
}

void DaggerCombo::DrawSettings()
{
    if (!toolbox_handle) {
        return;
    }
    ImGui::Checkbox("Enable 1-Key Dagger Combo", &enabled);
    ImGui::TextWrapped(
        "Press a Lead Attack skill key to automatically chain "
        "through the next Off-Hand and Dual attacks on your skill bar.");
}
