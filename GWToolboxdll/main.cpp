#include "stdafx.h"

#include <Defines.h>
#include <GWToolbox.h>
#include <Logger.h>
#include <Modules/CrashHandler.h>
#include <MinHook.h>

namespace {
    HMODULE dllmodule;
    volatile bool thread_running = false;
    volatile bool is_detaching = false;
    volatile bool pending_reload = false;
    wchar_t reload_dll_path[MAX_PATH] = {};

    typedef UINT(WINAPI* GetUserDefaultLCID_t)();
    GetUserDefaultLCID_t GetUserDefaultLCID_Func = nullptr, GetUserDefaultLCID_Ret = nullptr;

    UINT OnGetUserDefaultLCID() {
        if(GetUserDefaultLCID_Func) MH_DisableHook(GetUserDefaultLCID_Func);
        GWToolbox::Initialize(dllmodule);
        return GetUserDefaultLCID_Ret();
    }
    /**
    * We can't call GWToolbox::Initialize inside DllMain - it tries to call LoadLibrary later on and can cause deadlocks!
    * We know Guild Wars calls GetUserDefaultLCID on load - hook into this to initialize Toolbox instead
    * This allows us to intercept early calls like login and keyboard language
    */
    void HookForInitialize() {
        const auto hTimeApi = GetModuleHandleA("kernel32.dll");
        GetUserDefaultLCID_Func = hTimeApi ? (GetUserDefaultLCID_t)GetProcAddress(hTimeApi, "GetUserDefaultLCID") : nullptr;
        ASSERT(GetUserDefaultLCID_Func);
        MH_Initialize();
        MH_CreateHook(GetUserDefaultLCID_Func, OnGetUserDefaultLCID, (void**)&GetUserDefaultLCID_Ret);
        MH_EnableHook(GetUserDefaultLCID_Func);
    }

    // x86 reload trampoline: Sleep(delay_ms) then LoadLibraryW(path)
    // Lives in VirtualAlloc'd memory so it survives DLL unload.
#pragma pack(push, 1)
    struct ReloadBlock {
        void* pSleep;           // offset 0
        void* pLoadLibraryW;    // offset 4
        DWORD delay_ms;         // offset 8
        wchar_t path[MAX_PATH]; // offset 12
        BYTE code[24];
    };
#pragma pack(pop)

    void ScheduleReload()
    {
        auto* block = static_cast<ReloadBlock*>(
            VirtualAlloc(nullptr, sizeof(ReloadBlock), MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE));
        if (!block) return;

        const auto kernel32 = GetModuleHandleW(L"kernel32.dll");
        block->pSleep = reinterpret_cast<void*>(GetProcAddress(kernel32, "Sleep"));
        block->pLoadLibraryW = reinterpret_cast<void*>(GetProcAddress(kernel32, "LoadLibraryW"));
        block->delay_ms = 2000;
        wcscpy_s(block->path, MAX_PATH, reload_dll_path);

        // x86 position-independent stub:
        //   mov esi, [esp+4]   ; ReloadBlock*
        //   push [esi+8]       ; delay_ms
        //   call [esi]         ; Sleep
        //   lea eax, [esi+12]  ; &path
        //   push eax
        //   call [esi+4]       ; LoadLibraryW
        //   xor eax, eax
        //   ret 4
        static const BYTE code[] = {
            0x8B, 0x74, 0x24, 0x04,
            0xFF, 0x76, 0x08,
            0xFF, 0x16,
            0x8D, 0x46, 0x0C,
            0x50,
            0xFF, 0x56, 0x04,
            0x33, 0xC0,
            0xC2, 0x04, 0x00
        };
        static_assert(sizeof(code) <= sizeof(ReloadBlock::code));
        memcpy(block->code, code, sizeof(code));

        const HANDLE hThread = CreateThread(
            nullptr, 0,
            reinterpret_cast<LPTHREAD_START_ROUTINE>(&block->code),
            block, 0, nullptr);
        if (hThread) CloseHandle(hThread);
    }

    // Do all your startup things here instead.
    DWORD WINAPI MainLoopThread() noexcept
    {
        ASSERT(!thread_running);
        thread_running = true;
        GWToolbox::MainLoop(dllmodule);
        if(GetUserDefaultLCID_Func) MH_DisableHook(GetUserDefaultLCID_Func);
        thread_running = false;
        if (!is_detaching) {
            if (pending_reload) {
                ScheduleReload();
            }
            FreeLibraryAndExitThread(dllmodule, EXIT_SUCCESS);
        }
        return 0;
    }

    void StartMainLoop() {
        const HANDLE hThread = CreateThread(
            nullptr,
            0,
            reinterpret_cast<LPTHREAD_START_ROUTINE>(MainLoopThread),
            nullptr,
            0,
            nullptr);

        if (hThread != nullptr) {
            CloseHandle(hThread);
        }
    }

}

// Exported functions
extern "C" __declspec(dllexport) const char* GWToolboxVersion = GWTOOLBOXDLL_VERSION;

extern "C" __declspec(dllexport) void __cdecl RequestReload(const wchar_t* dll_path)
{
    if (!dll_path || !dll_path[0]) return;
    wcscpy_s(reload_dll_path, MAX_PATH, dll_path);
    pending_reload = true;
    GWToolbox::SignalTerminate();
}

extern "C" __declspec(dllexport) void __cdecl Terminate()
{
    if (thread_running) {
        // Tell tb to close, then wait for the thread to finish.
        GWToolbox::SignalTerminate();
    }
    // Wait up to 5000 ms for toolbox to clean up after itself; after that, bomb out
    constexpr uint32_t timeout = 5000 / 16;
    for (auto i = 0u; i < timeout && thread_running; i++) {
        Sleep(16);
    }
    Sleep(16);
    if (!is_detaching) {
        FreeLibraryAndExitThread(dllmodule, EXIT_SUCCESS);
    }
}


// DLL entry point, dont do things in this thread unless you know what you are doing.
BOOL WINAPI DllMain(_In_ const HMODULE hDllHandle, _In_ const DWORD reason, _In_opt_ const LPVOID)
{
    DisableThreadLibraryCalls(hDllHandle);
    switch (reason) {
        case DLL_PROCESS_ATTACH: {
            dllmodule = hDllHandle;
            __try {
                // Add a hook for if GW isn't loaded yet...
                HookForInitialize();
                // ...but also call GWToolbox::Initialize inside the main loop too!
                StartMainLoop();
            } __except (EXCEPT_EXPRESSION_ENTRY) {
                return FALSE;
            }
        }
        break;
        case DLL_PROCESS_DETACH: {
            is_detaching = true;
            Terminate();
        }
        break;
        default:
            break;
    }
    return TRUE;
}
