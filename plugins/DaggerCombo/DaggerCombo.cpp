#include "DaggerCombo.h"

#include <GWCA/Constants/Constants.h>
#include <GWCA/GameEntities/Agent.h>
#include <GWCA/GameEntities/Skill.h>
#include <GWCA/Managers/AgentMgr.h>
#include <GWCA/Managers/GameThreadMgr.h>
#include <GWCA/Managers/SkillbarMgr.h>
#include <GWCA/Managers/UIMgr.h>
#include <GWCA/Utilities/Hook.h>
#include <Logger.h>

namespace {
    bool enabled = true;
    bool debug = true;
    GW::HookEntry keydown_hook;

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

        if (debug) {
            Log::Log("[DaggerCombo] --- Key pressed: slot %d (key=0x%X) ---", pressed_slot, key);
        }

        const auto* bar = GW::SkillbarMgr::GetPlayerSkillbar();
        if (!bar || !bar->IsValid()) {
            if (debug) Log::Log("[DaggerCombo]   No valid skillbar");
            return;
        }

        if (debug) {
            Log::Log("[DaggerCombo]   Skillbar (agent_id=%u, disabled=0x%X):", bar->agent_id, bar->disabled);
            for (int i = 0; i < 8; i++) {
                const auto& s = bar->skills[i];
                const auto* sd = GW::SkillbarMgr::GetSkillConstantData(s.skill_id);
                Log::Log("[DaggerCombo]     [%d] skill_id=%d combo=%d recharge=%u adrenaline_a=%u ready=%d",
                    i, static_cast<int>(s.skill_id),
                    sd ? sd->combo : -1,
                    s.recharge, s.adrenaline_a,
                    IsSkillReady(bar, static_cast<uint32_t>(i)) ? 1 : 0);
            }
        }

        const auto& skill = bar->skills[pressed_slot];
        if (skill.skill_id == GW::Constants::SkillID::No_Skill) {
            return;
        }

        const auto* skill_data = GW::SkillbarMgr::GetSkillConstantData(skill.skill_id);
        if (debug) {
            Log::Log("[DaggerCombo]   Pressed skill: id=%d, combo=%d",
                static_cast<int>(skill.skill_id), skill_data ? skill_data->combo : -1);
        }

        if (!skill_data || skill_data->combo != 1) {
            return;
        }

        const auto* player = GW::Agents::GetControlledCharacter();
        if (!player) {
            return;
        }

        if (debug) {
            Log::Log("[DaggerCombo]   Player: dagger_status=%d, weapon_type=%d, skill=%d",
                static_cast<int>(player->dagger_status),
                static_cast<int>(player->weapon_type),
                static_cast<int>(player->skill));
        }

        const uint8_t dagger_status = player->dagger_status;

        if (dagger_status == 0 || dagger_status == 3) {
            if (debug) Log::Log("[DaggerCombo]   dagger_status 0 or 3, firing lead normally");
            return;
        }

        const uint8_t needed_combo = (dagger_status == 1) ? 2 : 3;
        if (debug) {
            Log::Log("[DaggerCombo]   Need combo type %d, scanning slots %d-7",
                static_cast<int>(needed_combo), pressed_slot + 1);
        }

        for (int slot = pressed_slot + 1; slot < 8; slot++) {
            const auto& candidate = bar->skills[slot];
            if (candidate.skill_id == GW::Constants::SkillID::No_Skill) {
                continue;
            }
            const auto* candidate_data = GW::SkillbarMgr::GetSkillConstantData(candidate.skill_id);
            const bool ready = IsSkillReady(bar, static_cast<uint32_t>(slot));

            if (debug) {
                Log::Log("[DaggerCombo]     Candidate slot %d: skill_id=%d, combo=%d, ready=%d",
                    slot, static_cast<int>(candidate.skill_id),
                    candidate_data ? candidate_data->combo : -1, ready ? 1 : 0);
            }

            if (!candidate_data || candidate_data->combo != needed_combo) {
                continue;
            }
            if (!ready) {
                continue;
            }

            if (debug) Log::Log("[DaggerCombo]   >>> REDIRECTING to slot %d <<<", slot);

            status->blocked = true;
            const auto target_slot = static_cast<uint32_t>(slot);
            const auto target_id = GW::Agents::GetTargetId();
            GW::GameThread::Enqueue([target_slot, target_id] {
                GW::SkillbarMgr::UseSkill(target_slot, target_id);
            });
            return;
        }

        if (debug) Log::Log("[DaggerCombo]   No valid follow-up found, firing lead normally");
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
    Log::Log("[DaggerCombo] === Initialized ===");
    GW::UI::RegisterKeydownCallback(&keydown_hook, OnKeyDown);
}

void DaggerCombo::SignalTerminate()
{
    ToolboxPlugin::SignalTerminate();
    GW::UI::RemoveKeydownCallback(&keydown_hook);
    Log::Log("[DaggerCombo] === Terminated ===");
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
