#include <GWCA/stdafx.h>

#include <GWCA/Utilities/Debug.h>
#include <GWCA/Utilities/Scanner.h>

#include <GWCA/Managers/MemoryMgr.h>

namespace {
    // Used to get precise skill recharge times.
    DWORD* SkillTimerPtr = nullptr;

    uintptr_t WinHandlePtr = 0;

    uintptr_t GetPersonalDirPtr = 0;

    typedef uint32_t(__cdecl* GetGWVersion_pt)(void);
    GetGWVersion_pt GetGWVersion_Func = nullptr;

    typedef void*(__cdecl* MemAlloc_pt)(size_t size);
    MemAlloc_pt MemAlloc_Func = nullptr;

    typedef void*(__cdecl* MemRealloc_pt)(void* buf, size_t newSize);
    MemRealloc_pt MemRealloc_Func = nullptr;

    typedef void(__cdecl* MemFree_pt)(void* buf);
    MemFree_pt MemFree_Func = nullptr;

    void Scan() {
        GW::Scanner::Initialize();

        uintptr_t address;

        // Skill timer to use for exact effect times.
        address = GW::Scanner::Find("\x83\xCA\x01\x89\x15\x00\x00\x00\x00\xFF\xD6\x8B", "xxxxx????xxx", +5);
        if (address)
            SkillTimerPtr = *(DWORD**)address;

        address = GW::Scanner::Find("\x83\xC4\x04\x83\x3D\x00\x00\x00\x00\x00\x75\x31", "xxxxx????xxx", -0xC);
        if (address)
            WinHandlePtr = *(uintptr_t*)address;

        GetPersonalDirPtr = GW::Scanner::Find("\x75\x2E\x6A\x01\x6A\x05\x56\x6A\x00", "xxxxxxxxx", -0x53);

        address = GW::Scanner::Find("\x6A\x00\x68\x00\x00\x01\x00\x89", "xxxxxxxx", 0x42);
        GetGWVersion_Func = (GetGWVersion_pt)GW::Scanner::FunctionFromNearCall(address);

        MemAlloc_Func = (MemAlloc_pt)GW::Scanner::Find("\x56\x8B\x75\x08\x85\xF6\x74\x1F", "xxxxxxxx", -0x3);
        MemRealloc_Func = (MemRealloc_pt)GW::Scanner::Find("\x56\x8B\x75\x08\x57\x8B\x7D\x0C\x85\xF6\x75", "xxxxxxxxxxx", -0x3);
        MemFree_Func = (MemFree_pt)GW::Scanner::Find("\x56\x8B\x75\x08\x85\xF6\x74\x22", "xxxxxxxx", -0x3);

        GWCA_INFO("[SCAN] SkillTimerPtr = %08X", SkillTimerPtr);
        GWCA_INFO("[SCAN] WinHandlePtr = %08X", WinHandlePtr);
        GWCA_INFO("[SCAN] GetPersonalDirPtr = %08X", GetPersonalDirPtr);
        GWCA_INFO("[SCAN] GetGWVersion_Func = %p", GetGWVersion_Func);
        GWCA_INFO("[SCAN] MemAlloc_Func = %p", MemAlloc_Func);
        GWCA_INFO("[SCAN] MemRealloc_Func = %p", MemRealloc_Func);
        GWCA_INFO("[SCAN] MemFree_Func = %p", MemFree_Func);

#ifdef _DEBUG
        GWCA_ASSERT(SkillTimerPtr);
        GWCA_ASSERT(WinHandlePtr);
        GWCA_ASSERT(GetPersonalDirPtr);
        GWCA_ASSERT(GetGWVersion_Func);
#endif
    }
}

DWORD GW::MemoryMgr::GetSkillTimer() {
    return SkillTimerPtr ? GetTickCount() + *SkillTimerPtr : 0;
}

uint32_t GW::MemoryMgr::GetGWVersion() {
    if (!GetGWVersion_Func)
        Scan();
    return GetGWVersion_Func ? GetGWVersion_Func() : 0;
}

HWND GW::MemoryMgr::GetGWWindowHandle() {
    if (!WinHandlePtr)
        Scan();
    return WinHandlePtr ? *(HWND*)WinHandlePtr : nullptr;
}

bool GW::MemoryMgr::GetPersonalDir(size_t buf_len, wchar_t* buf) {
    if (!GetPersonalDirPtr)
        Scan();
    if (!GetPersonalDirPtr)
        return false;
    typedef bool(__cdecl* GetPersonalDir_pt)(size_t, wchar_t*);
    return ((GetPersonalDir_pt)GetPersonalDirPtr)(buf_len, buf);
}

void* GW::MemoryMgr::MemAlloc(size_t size) {
    if (!MemAlloc_Func)
        Scan();
    return MemAlloc_Func ? MemAlloc_Func(size) : nullptr;
}

void* GW::MemoryMgr::MemRealloc(void* buf, size_t newSize) {
    if (!MemRealloc_Func)
        Scan();
    return MemRealloc_Func ? MemRealloc_Func(buf, newSize) : nullptr;
}

void GW::MemoryMgr::MemFree(void* buf) {
    if (!MemFree_Func)
        Scan();
    if (MemFree_Func)
        MemFree_Func(buf);
}
