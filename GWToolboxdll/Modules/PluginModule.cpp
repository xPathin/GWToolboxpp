#include "stdafx.h"

#include "PluginModule.h"
#include "../plugins/Base/ToolboxPlugin.h"

#include <GWToolbox.h>
#include <GWCA/Managers/ChatMgr.h>

#include <Modules/Resources.h>
#include <filesystem>
#include <string>

#include "GWCA/Managers/UIMgr.h"
#include "Utils/TextUtils.h"

namespace {
    std::wstring pluginsfoldername;

    const char* plugins_enabled_section = "Plugins Enabled";

    std::vector<PluginModule::Plugin*> plugins_available;

    std::vector<PluginModule::Plugin*> plugins_loaded;

    bool UnloadPlugin(PluginModule::Plugin* plugin_ptr)
    {
        auto& plugin = *plugin_ptr;
        if (!plugin.terminating) {
            if (plugin.instance) {
                plugin.instance->SignalTerminate();
            }
            plugin.terminating = true;
        }
        if (plugin.instance && !plugin.instance->CanTerminate()) {
            return false; // Pending
        }

        if (plugin.instance) {
            plugin.instance->Terminate();
        }
        plugin.initialized = false;
        plugin.terminating = false;
        plugin.instance = nullptr;
        if (SUCCEEDED(FreeLibrary(plugin.dll))) {
            plugin.dll = nullptr;
        }
        std::erase_if(plugins_loaded, [plugin_ptr](auto p) { return p == plugin_ptr; });
        return true;
    }

    bool LoadPlugin(PluginModule::Plugin* plugin_ptr)
    {
        auto& plugin = *plugin_ptr;
        if (plugin.instance) {
            return true;
        }
        if (!plugin.dll) {
            plugin.dll = LoadLibraryW(plugin.path.wstring().c_str());
        }
        if (!plugin.dll) {
            UnloadPlugin(plugin_ptr);
            Log::Error("Failed to load plugin %s (LoadLibraryW)", TextUtils::PrintFilename(plugin.path.filename().string()).c_str());
            return false;
        }
        using ToolboxPluginInstanceFn = ToolboxPlugin* (*)();
        const auto instance_fn = reinterpret_cast<ToolboxPluginInstanceFn>(GetProcAddress(plugin.dll, "ToolboxPluginInstance"));
        if (!instance_fn) {
            UnloadPlugin(plugin_ptr);
            Log::Error("Failed to load plugin %s (ToolboxPluginInstance)", TextUtils::PrintFilename(plugin.path.filename().string()).c_str());
            return false;
        }

        plugin.instance = instance_fn();
        plugins_loaded.push_back(plugin_ptr);
        return true;
    }

    bool InitializePlugin(PluginModule::Plugin* plugin_ptr)
    {
        auto& plugin = *plugin_ptr;
        if (plugin.terminating || !plugin.instance) {
            return false;
        }
        if (plugin.initialized) {
            return true;
        }
        const auto context = ImGui::GetCurrentContext();
        if (!context) {
            return false;
        }
        ImGuiAllocFns fns;
        ImGui::GetAllocatorFunctions(&fns.alloc_func, &fns.free_func, &fns.user_data);
        plugin.instance->Initialize(context, fns, GWToolbox::GetDLLModule());
        plugin.instance->LoadSettings(pluginsfoldername.c_str());
        plugin.initialized = true;
        return true;
    }

    constexpr clock_t PLUGIN_RELOAD_POLL_MS = 2000;
    constexpr clock_t PLUGIN_RELOAD_DEBOUNCE_MS = 2000;

    bool HotReloadPlugin(PluginModule::Plugin* plugin)
    {
        auto& p = *plugin;

        // Save settings and signal terminate
        if (!p.terminating) {
            if (p.initialized && p.instance) {
                p.instance->SaveSettings(pluginsfoldername.c_str());
                p.instance->SignalTerminate();
            }
            p.terminating = true;
        }

        // Wait for graceful shutdown
        if (p.instance && !p.instance->CanTerminate()) {
            return false;
        }

        // Complete teardown
        if (p.instance) {
            p.instance->Terminate();
        }
        p.initialized = false;
        p.terminating = false;
        p.instance = nullptr;
        if (p.dll) {
            FreeLibrary(p.dll);
            p.dll = nullptr;
        }
        std::erase_if(plugins_loaded, [plugin](auto pp) { return pp == plugin; });

        // Swap files: current -> .old, .new -> current
        const auto new_path = p.path.wstring() + L".new";
        const auto old_path = p.path.wstring() + L".old";
        DeleteFileW(old_path.c_str());
        MoveFileW(p.path.wstring().c_str(), old_path.c_str());
        MoveFileW(new_path.c_str(), p.path.wstring().c_str());

        // Reload
        p.pending_hot_reload = false;
        if (LoadPlugin(plugin)) {
            InitializePlugin(plugin);
            Log::Flash("Plugin reloaded: %s", p.path.filename().string().c_str());
        }
        else {
            Log::Error("Failed to reload plugin: %s", p.path.filename().string().c_str());
        }

        return true;
    }

    void RefreshDlls()
    {
        // when we refresh, how do we map the modules that were already loaded to the ones on disk?
        // the dll file may have changed
        namespace fs = std::filesystem;

        const fs::path plugin_folder = pluginsfoldername;

        if (!Resources::EnsureFolderExists(plugin_folder)) {
            return;
        }

        for (auto& p : fs::directory_iterator(plugin_folder)) {
            fs::path file_path = p.path();
            fs::path ext = file_path.extension();
            if (ext == ".lnk") {
                if (SUCCEEDED(Resources::ResolveShortcut(file_path, file_path))) {
                    ext = file_path.extension();
                }
            }
            if (ext == ".dll") {
                const auto found = std::ranges::find_if(plugins_available, [file_path](const auto plugin) {
                    return plugin->path == file_path;
                });
                if (found == plugins_available.end()) {
                    plugins_available.push_back(new PluginModule::Plugin(file_path));
                }
            }
        }
    }
}

void PluginModule::DrawSettingsInternal()
{
    ImGui::PushID("Plugins");

    for (const auto plugin : plugins_available) {
        ImGui::PushID(plugin);
        auto& style = ImGui::GetStyle();
        const auto origin_header_col = style.Colors[ImGuiCol_Header];
        style.Colors[ImGuiCol_Header] = {0, 0, 0, 0};

        static char buf[128];
        const auto has_settings = plugin->initialized && plugin->instance && plugin->instance->HasSettings();
        if (has_settings) {
            sprintf(buf, "      %s", plugin->path.filename().string().c_str());
        }
        else {
            sprintf(buf, "             %s", plugin->path.filename().string().c_str());
        }
        const auto pos = ImGui::GetCursorScreenPos();
        const bool is_showing = has_settings ? ImGui::CollapsingHeader(buf, ImGuiTreeNodeFlags_AllowOverlap) : ImGui::CollapsingHeader(buf, ImGuiTreeNodeFlags_Leaf | ImGuiTreeNodeFlags_AllowOverlap);

        if (const auto icon = plugin->initialized ? plugin->instance->Icon() : nullptr) {
            const float text_offset_x = ImGui::GetTextLineHeightWithSpacing() + 4.0f; // TODO: find a proper number
            ImGui::GetWindowDrawList()->AddText(
                ImVec2(pos.x + text_offset_x, pos.y + style.ItemSpacing.y / 2),
                ImColor(style.Colors[ImGuiCol_Text]), icon);
        }

        style.Colors[ImGuiCol_Header] = origin_header_col;

        ImGui::SameLine(ImGui::GetContentRegionAvail().x - ImGui::GetTextLineHeight() - ImGui::GetStyle().FramePadding.x - 128.f);
        snprintf(buf, _countof(buf), "%s###load_unload", plugin->instance ? "Unload" : "Load");
        if (ImGui::Button(buf)) {
            if (!plugin->instance) {
                LoadPlugin(plugin);
            }
            else {
                UnloadPlugin(plugin);
            }
        }
        if (plugin->instance && plugin->instance->GetVisiblePtr()) {
            ImGui::SameLine(ImGui::GetContentRegionAvail().x - ImGui::GetTextLineHeight() - ImGui::GetStyle().FramePadding.x);
            ImGui::Checkbox("##check", plugin->instance->GetVisiblePtr());
            if (ImGui::IsItemHovered()) {
                ImGui::SetTooltip("Visible");
            }
        }

        if (is_showing && InitializePlugin(plugin) && has_settings) {
            plugin->instance->DrawSettings();
        }
        ImGui::PopID();
        ImGui::Separator();
    }

    if (ImGui::Button("Refresh")) {
        RefreshDlls();
    }

    ImGui::PopID();
}

bool PluginModule::CanTerminate()
{
    return plugins_loaded.empty();
}

bool PluginModule::WndProc(const UINT msg, const WPARAM wParam, const LPARAM lParam)
{
    bool capture = false;
    for (const auto plugin : plugins_loaded) {
        if (!plugin->instance) {
            continue;
        }
        capture |= plugin->instance->WndProc(msg, wParam, lParam);
    }
    return capture;
}

std::vector<ToolboxPlugin*> PluginModule::GetPlugins()
{
    std::vector<ToolboxPlugin*> plugins;
    for (const auto plugin : plugins_loaded) {
        plugins.push_back(plugin->instance);
    }
    return plugins;
}

void PluginModule::Initialize()
{
    pluginsfoldername = Resources::GetRootPath(L"plugins");
    ToolboxUIElement::Initialize();
    RefreshDlls();
}

void PluginModule::Draw(IDirect3DDevice9* device)
{
    for (const auto plugin : plugins_loaded) {
        if (!InitializePlugin(plugin)) {
            continue;
        }
        if (GW::UI::GetIsWorldMapShowing() && !plugin->instance->ShowOnWorldMap()) {
            continue;
        }

        if (plugin->instance->GetVisiblePtr() && *plugin->instance->GetVisiblePtr()) {
            plugin->instance->Draw(device);
        }
    }
}

void PluginModule::LoadSettings(ToolboxIni* ini)
{
    std::list<CSimpleIniA::Entry> dlls_to_load;
    std::vector<Plugin*> plugins_loaded_from_ini;
    if (ini->GetAllKeys(plugins_enabled_section, dlls_to_load)) {
        for (const auto& entry : dlls_to_load) {
            std::filesystem::path path = entry.pItem;
            const auto filename = path.filename();
            auto matching_plugins = std::views::filter(plugins_available, [filename](auto plugin) {
                return plugin->path.filename() == filename;
            });
            // Find any matching plugins and load them
            for (const auto plugin : matching_plugins) {
                if (!LoadPlugin(plugin)) {
                    continue;
                }
                InitializePlugin(plugin);
                plugins_loaded_from_ini.push_back(plugin);
            }
        }
    }
    // Find any plugins that are currently loaded but not supposed to be
    auto to_unload = std::views::filter(plugins_loaded, [&](auto plugin) {
        return !std::ranges::contains(plugins_loaded_from_ini, plugin);
    });
    for (const auto plugin : std::views::reverse(to_unload)) {
        UnloadPlugin(plugin);
    }
}

void PluginModule::SaveSettings(ToolboxIni* ini)
{
    ini->Delete(plugins_enabled_section, nullptr);
    for (const auto plugin : plugins_loaded) {
        plugin->instance->SaveSettings(pluginsfoldername.c_str());
        ini->SetBoolValue(plugins_enabled_section, plugin->path.filename().string().c_str(), true);
    }
}

void PluginModule::Update(const float delta)
{
    // Poll for .new files alongside loaded plugins
    static clock_t last_plugin_check = 0;
    const clock_t now = clock();
    if (now - last_plugin_check >= PLUGIN_RELOAD_POLL_MS) {
        last_plugin_check = now;
        for (auto* plugin : plugins_loaded) {
            if (plugin->terminating || plugin->pending_hot_reload) continue;

            const auto new_path = plugin->path.wstring() + L".new";
            if (GetFileAttributesW(new_path.c_str()) == INVALID_FILE_ATTRIBUTES) {
                plugin->new_file_detected_at = 0;
                continue;
            }

            if (plugin->new_file_detected_at == 0) {
                plugin->new_file_detected_at = now;
                continue;
            }

            if (now - plugin->new_file_detected_at < PLUGIN_RELOAD_DEBOUNCE_MS) continue;

            plugin->pending_hot_reload = true;
            plugin->new_file_detected_at = 0;
            Log::Flash("Hot reloading plugin: %s", plugin->path.filename().string().c_str());
        }
    }

    // Process one hot reload per frame
    for (auto* plugin : plugins_loaded) {
        if (!plugin->pending_hot_reload) continue;
        HotReloadPlugin(plugin);
        break; // vector may have changed
    }

    for (const auto plugin : plugins_loaded) {
        if (!plugin->initialized)
            continue;
        plugin->instance->Update(delta);
        if (plugin->terminating && !plugin->pending_hot_reload) {
            if (UnloadPlugin(plugin)) {
                break; // plugins_loaded vector changed, skip a frame
            }
        }
    }
}

void PluginModule::SignalTerminate()
{
    ToolboxUIElement::SignalTerminate();
    for (const auto plugin : plugins_loaded) {
        UnloadPlugin(plugin);
    }
}

void PluginModule::Terminate()
{
    ASSERT(plugins_loaded.empty());
    for (const auto p : plugins_available) {
        if (p->dll) {
            FreeLibrary(p->dll);
        }
        delete p;
    }
}
