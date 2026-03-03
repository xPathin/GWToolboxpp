#pragma once

#include <ToolboxPlugin.h>

class SkillQueue : public ToolboxPlugin {
public:
    SkillQueue() = default;
    ~SkillQueue() override = default;

    const char* Name() const override { return "Skill Queue"; }
    bool HasSettings() const override { return true; }
    bool* GetVisiblePtr() override { return &visible; }

    void Initialize(ImGuiContext* ctx, ImGuiAllocFns allocator_fns, HMODULE toolbox_dll) override;
    void SignalTerminate() override;
    bool CanTerminate() override;
    void Update(float delta) override;
    void Draw(IDirect3DDevice9*) override;
    bool WndProc(UINT msg, WPARAM wParam, LPARAM lParam) override;
    void LoadSettings(const wchar_t*) override;
    void SaveSettings(const wchar_t*) override;
    void DrawSettings() override;

private:
    bool visible = true;
};
