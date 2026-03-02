#include <GWCA/stdafx.h>

#include <GWCA/Utilities/Debug.h>
#include <GWCA/Utilities/Hooker.h>
#include <GWCA/Utilities/Macros.h>
#include <GWCA/Utilities/Scanner.h>
#include <GWCA/GameEntities/Camera.h>

#include <GWCA/Managers/Module.h>

#include <GWCA/Managers/UIMgr.h>
#include <GWCA/Managers/RenderMgr.h>
#include <GWCA/Managers/CameraMgr.h>

namespace {
    using namespace GW;
    typedef Render::Mat4x3f*(__cdecl*GwGetTransform_pt)(int transform);
    GwGetTransform_pt GwGetTransform_func;

    struct gwdx {
        /* +h0000 */
        uint8_t h0000[24];
        /* +h0018 */
        uint32_t h0018; // might not be a func pointer, seems like it tho lol
        /* +h001C */
        uint8_t h001C[44];
        /* +h0048 */
        wchar_t gpu_name[32];
        /* +h0088 */
        uint8_t h0088[8];
        /* +h0090 */
        IDirect3DDevice9* device;
        /* +h0094 */
        uint8_t h0094[12];
        /* +h00A0 */
        uint32_t framecount;
        /* +h00A4 */
        uint8_t h00A4[2936];
        /* +h0C1C */
        uint32_t viewport_width;
        /* +h0C20 */
        uint32_t viewport_height;
        /* +h0C24 */
        uint8_t h0C24[148];
        /* +h0CB8 */
        uint32_t window_width;
        /* +h0CBC */
        uint32_t window_height;
        /* +h0CC0 */
        uint8_t h0CC0[952];
    }; //Size: 0x1074
    gwdx* gwdx_ptr = nullptr;

    struct GwRendererContext {
        /* +h0000 */ uint8_t h0000[0x50];
        /* +h0050 */ uint32_t values[3][26];
        /* +h0188 */ uint32_t flags[3];
        /* +h0194 */ uint32_t current_mode;
        /* +h0198 */ uint8_t h0198[0x48];
        /* +h01E0 */ uint32_t dirty_flags;
    };
    static_assert(offsetof(GwRendererContext, values) == 0x50);
    static_assert(offsetof(GwRendererContext, flags) == 0x188);
    static_assert(offsetof(GwRendererContext, current_mode) == 0x194);
    static_assert(offsetof(GwRendererContext, dirty_flags) == 0x1E0);

    uintptr_t GwRendererContext_addr = 0;
    HWND gw_window_handle = nullptr;
    bool fog_enabled = false;

    GwRendererContext* GetRendererContext() {
        return GwRendererContext_addr ? *(GwRendererContext**)GwRendererContext_addr : nullptr;
    }

    BOOL CALLBACK FindGWWindow(HWND hwnd, LPARAM) {
        gw_window_handle = hwnd;
        return FALSE;
    }

    typedef bool (__cdecl *GwEndScene_pt)(gwdx* ctx, void* unk);
    GwEndScene_pt RetGwEndScene;
    GwEndScene_pt GwEndScene_Func;

    GwEndScene_pt RetScreenCapture;
    GwEndScene_pt ScreenCapture_Func;

    CRITICAL_SECTION mutex;
    bool in_render_loop = false;

    typedef bool (__cdecl *GwReset_pt)(gwdx* ctx);
    GwReset_pt RetGwReset;
    GwReset_pt GwReset_Func;

    Render::RenderCallback render_callback = nullptr;
    Render::RenderCallback reset_callback = nullptr;

    bool __cdecl OnGwEndScene(gwdx* ctx, void* unk)
    {
        Hook::EnterHook();
        EnterCriticalSection(&mutex);
        in_render_loop = true;
        gwdx_ptr = ctx;
        if (render_callback)
            render_callback(ctx->device);
        bool retval = RetGwEndScene(ctx, unk);
        in_render_loop = false;
        LeaveCriticalSection(&mutex);
        Hook::LeaveHook();
        return retval;
    }

    bool __cdecl OnGwReset(gwdx* ctx)
    {
        Hook::EnterHook();
        gwdx_ptr = ctx;
        if (reset_callback)
            reset_callback(ctx->device);
        bool retval = RetGwReset(ctx);
        Hook::LeaveHook();
        return retval;
    }

    bool __cdecl OnScreenCapture(gwdx* ctx, void* unk)
    {
        Hook::EnterHook();
        // @Enhancement: This should probably be an option.
        if (!GW::UI::GetIsShiftScreenShot() && render_callback) {
            render_callback(ctx->device);
        }
        bool retval = RetScreenCapture(ctx, unk);
        Hook::LeaveHook();
        return retval;
    }

    void Init()
    {
        InitializeCriticalSection(&mutex);

        GwGetTransform_func = (GwGetTransform_pt)Scanner::Find("\x8B\x75\x08\x83\xFE\x05\x7C\x14\x68\xDB\x02\x00\x00", "xxxxxxxxxxxxx", -0x4);
        GwEndScene_Func = (GwEndScene_pt)Scanner::Find("\x89\x45\xFC\x57\x8B\x7D\x08\x8B\x8F", "xxxxxxxxx", -0xD);
        ScreenCapture_Func = (GwEndScene_pt)Scanner::Find("\x83\xC4\x10\x8B\x86\x00\x00\x00\x00\x83", "xxxxx??xxx", -0x8F);
        GwReset_Func = (GwReset_pt)Scanner::Find("\x3B\x4D\xB4\x6A\x00\x1B\xDB\xF7\xDB", "xxxxxxxxx", -0x8C);

        {
            uintptr_t address = (uintptr_t)Scanner::Find("\x8B\x35\x00\x00\x00\x00\x85\xF6\x74\x00\x8B\x4D\x08\x83\xF9\x1A", "xx????xxx?xxxxxx", +2);
            if (Verify(address))
                GwRendererContext_addr = *(uintptr_t*)address;
        }

        GWCA_INFO("[SCAN] GwRendererContext = %p", GwRendererContext_addr);
        GWCA_INFO("[SCAN] GwGetTransform = %p", GwGetTransform_func);
        GWCA_INFO("[SCAN] GwReset = %p", GwReset_Func);
        GWCA_INFO("[SCAN] GwEndScene = %p", GwEndScene_Func);
        GWCA_INFO("[SCAN] GwScreenCapture = %p", ScreenCapture_Func);

#ifdef _DEBUG
        GWCA_ASSERT(GwGetTransform_func); // remove in the future
        GWCA_ASSERT(GwReset_Func);
        GWCA_ASSERT(GwEndScene_Func);
        GWCA_ASSERT(ScreenCapture_Func);
#endif

        Hook::CreateHook((void**)&GwEndScene_Func, OnGwEndScene, (void**)&RetGwEndScene);
        Hook::CreateHook((void**)&ScreenCapture_Func, OnScreenCapture, (void**)&RetScreenCapture);
        Hook::CreateHook((void**)&GwReset_Func, OnGwReset, (void**)&RetGwReset);
    }

    void EnableHooks()
    {
        if (GwEndScene_Func)
            Hook::EnableHooks(GwEndScene_Func);
        if (ScreenCapture_Func)
            Hook::EnableHooks(ScreenCapture_Func);
        if (GwReset_Func)
            Hook::EnableHooks(GwReset_Func);
    }

    void DisableHooks()
    {
        if (GwEndScene_Func)
            Hook::DisableHooks(GwEndScene_Func);
        if (ScreenCapture_Func)
            Hook::DisableHooks(ScreenCapture_Func);
        if (GwReset_Func)
            Hook::DisableHooks(GwReset_Func);
    }

    void Exit()
    {
        Hook::RemoveHook(GwEndScene_Func);
        Hook::RemoveHook(ScreenCapture_Func);
        Hook::RemoveHook(GwReset_Func);
        DeleteCriticalSection(&mutex);
    }
}

namespace GW {
    Module RenderModule = {
        "RenderModule", // name
        NULL,           // param
        ::Init,         // init_module
        ::Exit,         // exit_module
        ::EnableHooks,  // enable_hooks
        ::DisableHooks, // disable_hooks
    };

    bool Render::GetIsInRenderLoop()
    {
        EnterCriticalSection(&mutex);
        bool ret = in_render_loop;
        LeaveCriticalSection(&mutex);
        return ret;
    }

    IDirect3DDevice9* Render::GetDevice() {
        return gwdx_ptr ? gwdx_ptr->device : nullptr;
    }


    int Render::GetIsFullscreen()
    {
        // this is hacky and might be unreliable
        if (gwdx_ptr == nullptr) return -1;
        if (gwdx_ptr->viewport_height == gwdx_ptr->window_height
            && gwdx_ptr->viewport_width == gwdx_ptr->window_width)
            return 1;
        return 0;
    }

    uint32_t Render::GetViewportWidth()
    {
        return gwdx_ptr ? gwdx_ptr->viewport_width : 0;
    }

    uint32_t Render::GetViewportHeight()
    {
        return gwdx_ptr ? gwdx_ptr->viewport_height : 0;
    }

    Render::Mat4x3f* Render::GetTransform(Transform transform)
    {
        GWCA_ASSERT(GwGetTransform_func != nullptr);
        return GwGetTransform_func(transform);
    }

    float Render::GetFieldOfView()
    {
        const Camera* cam = CameraMgr::GetCamera();
        if (!cam) return 0.f;
        constexpr float dividend = 2.f/3.f + 1.f;
        return atan2(1.0f, dividend / tan(cam->GetFieldOfView() * 0.5f)) * 2.0f;
    }

    void Render::SetRenderCallback(RenderCallback callback)
    {
        render_callback = callback;
    }

    Render::RenderCallback Render::GetRenderCallback()
    {
        return render_callback;
    }

    void Render::SetResetCallback(RenderCallback callback)
    {
        reset_callback = callback;
    }

    void Render::EnableHooks()
    {
        if (GwEndScene_Func)
            Hook::EnableHooks(GwEndScene_Func);
        if (ScreenCapture_Func)
            Hook::EnableHooks(ScreenCapture_Func);
    }

    uint32_t Render::GetGraphicsRendererValue(Metric metric, uint32_t mode)
    {
        auto* renderer = GetRendererContext();
        if (!renderer) return 0;
        if ((uint32_t)metric >= (uint32_t)Metric::Count) return 0;
        if (mode > 2) {
            mode = renderer->current_mode;
            if (mode > 2) return 0;
        }
        if (!((1u << (uint32_t)metric) & renderer->flags[mode])) return 0;
        return renderer->values[mode][(uint32_t)metric];
    }

    bool Render::SetGraphicsRendererValue(Metric metric, uint32_t value, uint32_t mode)
    {
        auto* renderer = GetRendererContext();
        if (!renderer) return false;
        if ((uint32_t)metric >= (uint32_t)Metric::Count) return false;
        if (metric == Metric::TextureMaxCX || metric == Metric::TextureMaxCY) return false;
        if (mode > 2) {
            mode = renderer->current_mode;
            if (mode > 2) return false;
        }
        renderer->values[mode][(uint32_t)metric] = value;
        renderer->flags[mode] |= (1u << (uint32_t)metric);
        if (mode != renderer->current_mode) return true;
        if ((uint32_t)metric <= 16) {
            switch (metric) {
            case Metric::Metric0:           renderer->dirty_flags |= 0x1; break;
            case Metric::Metric1:           renderer->dirty_flags |= 0x4; break;
            case Metric::Metric2:           renderer->dirty_flags |= 0x8; break;
            case Metric::Metric3:           renderer->dirty_flags |= 0x10; break;
            case Metric::FullscreenGamma:   renderer->dirty_flags |= 0x20; break;
            case Metric::MultiSampling:     renderer->dirty_flags |= 0x100; break;
            case Metric::PosX:              renderer->dirty_flags |= 0x400; break;
            case Metric::PosY:              renderer->dirty_flags |= 0x800; break;
            case Metric::RefreshRate:       renderer->dirty_flags |= 0x1000; break;
            case Metric::ShaderQuality:     renderer->dirty_flags |= 0x2000; break;
            case Metric::SizeX:             renderer->dirty_flags |= 0x4000; break;
            case Metric::SizeY:             renderer->dirty_flags |= 0x8000; break;
            case Metric::TextureFiltering:  renderer->dirty_flags |= 0x20000; break;
            default:                        renderer->dirty_flags |= 0x82400; break;
            }
        }
        return true;
    }

    uint32_t Render::GetFrameLimit()
    {
        // TODO: Requires UI::GetCommandLinePref and UI::GetPreference
        return 0;
    }

    bool Render::SetFrameLimit(uint32_t value)
    {
        // TODO: Requires UI::SetCommandLinePref
        (void)value;
        return false;
    }

    HWND Render::GetWindowHandle()
    {
        if (!gw_window_handle) {
            EnumWindows(FindGWWindow, 0);
        }
        return gw_window_handle;
    }

    bool Render::SetFog(bool enabled)
    {
        fog_enabled = enabled;
        return enabled;
    }
} // namespace GW
