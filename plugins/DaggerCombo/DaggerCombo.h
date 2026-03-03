#pragma once

#include <ToolboxPlugin.h>

class DaggerCombo : public ToolboxPlugin {
public:
    DaggerCombo() = default;
    ~DaggerCombo() override = default;

    const char* Name() const override { return "Dagger Combo"; }
    bool HasSettings() const override { return true; }

    void Initialize(ImGuiContext* ctx, ImGuiAllocFns allocator_fns, HMODULE toolbox_dll) override;
    void SignalTerminate() override;
    bool CanTerminate() override;
    void Update(float delta) override;
    bool WndProc(UINT msg, WPARAM wParam, LPARAM lParam) override;
    void LoadSettings(const wchar_t*) override;
    void SaveSettings(const wchar_t*) override;
    void DrawSettings() override;
};
