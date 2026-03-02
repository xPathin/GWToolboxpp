; Module: Hooker
; Functions: 9
; Total code size: 162 bytes
;

; === Hook::CreateHook ===
; RVA: 0x0001A9D0  Size: 56 bytes
; Exports: ?CreateHook@Hook@GW@@YAHPAPAXPAX0@Z
;
  1001A9D0:  55                              push     ebp
  1001A9D1:  8b ec                           mov      ebp, esp
  1001A9D3:  56                              push     esi
  1001A9D4:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  1001A9D7:  85 f6                           test     esi, esi
  1001A9D9:  74 27                           je       0x1001aa02
  1001A9DB:  8b 06                           mov      eax, dword ptr [esi]
  1001A9DD:  85 c0                           test     eax, eax
  1001A9DF:  74 21                           je       0x1001aa02
  1001A9E1:  6a 00                           push     0
  1001A9E3:  50                              push     eax
  1001A9E4:  e8 77 77 00 00                  call     0x10022160  ; Scanner::FunctionFromNearCall
  1001A9E9:  83 c4 08                        add      esp, 8
  1001A9EC:  85 c0                           test     eax, eax
  1001A9EE:  74 02                           je       0x1001a9f2
  1001A9F0:  89 06                           mov      dword ptr [esi], eax
  1001A9F2:  ff 75 10                        push     dword ptr [ebp + 0x10]
  1001A9F5:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  1001A9F8:  ff 36                           push     dword ptr [esi]
  1001A9FA:  e8 31 f9 00 00                  call     0x1002a330
  1001A9FF:  5e                              pop      esi
  1001AA00:  5d                              pop      ebp
  1001AA01:  c3                              ret      
  1001AA02:  83 c8 ff                        or       eax, 0xffffffff
  1001AA05:  5e                              pop      esi
  1001AA06:  5d                              pop      ebp
  1001AA07:  c3                              ret      


; === Hook::Deinitialize ===
; RVA: 0x0001AA10  Size: 27 bytes
; Exports: ?Deinitialize@Hook@GW@@YAXXZ
;
  1001AA10:  55                              push     ebp
  1001AA11:  8b ec                           mov      ebp, esp
  1001AA13:  51                              push     ecx
  1001AA14:  83 c8 ff                        or       eax, 0xffffffff
  1001AA17:  f0 0f c1 05 94 c2 08 10         lock xadd dword ptr [0x1008c294], eax
  1001AA1F:  48                              dec      eax
  1001AA20:  75 05                           jne      0x1001aa27
  1001AA22:  e8 e9 fc 00 00                  call     0x1002a710
  1001AA27:  8b e5                           mov      esp, ebp
  1001AA29:  5d                              pop      ebp
  1001AA2A:  c3                              ret      


; === Hook::DisableHooks ===
; RVA: 0x0001AA30  Size: 13 bytes
; Exports: ?DisableHooks@Hook@GW@@YAXPAX@Z
;
  1001AA30:  55                              push     ebp
  1001AA31:  8b ec                           mov      ebp, esp
  1001AA33:  ff 75 08                        push     dword ptr [ebp + 8]
  1001AA36:  e8 05 fb 00 00                  call     0x1002a540
  1001AA3B:  5d                              pop      ebp
  1001AA3C:  c3                              ret      


; === Hook::EnableHooks ===
; RVA: 0x0001AA40  Size: 13 bytes
; Exports: ?EnableHooks@Hook@GW@@YAXPAX@Z
;
  1001AA40:  55                              push     ebp
  1001AA41:  8b ec                           mov      ebp, esp
  1001AA43:  ff 75 08                        push     dword ptr [ebp + 8]
  1001AA46:  e8 15 fb 00 00                  call     0x1002a560
  1001AA4B:  5d                              pop      ebp
  1001AA4C:  c3                              ret      


; === Hook::EnterHook ===
; RVA: 0x0001AA50  Size: 8 bytes
; Exports: ?EnterHook@Hook@GW@@YAXXZ
;
  1001AA50:  f0 ff 05 98 c2 08 10            lock inc dword ptr [0x1008c298]
  1001AA57:  c3                              ret      


; === Hook::GetInHookCount ===
; RVA: 0x0001AA60  Size: 7 bytes
; Exports: ?GetInHookCount@Hook@GW@@YAHXZ
;
  1001AA60:  a1 98 c2 08 10                  mov      eax, dword ptr [0x1008c298]
  1001AA65:  90                              nop      
  1001AA66:  c3                              ret      


; === Hook::Initialize ===
; RVA: 0x0001AA70  Size: 12 bytes
; Exports: ?Initialize@Hook@GW@@YAXXZ
;
  1001AA70:  f0 ff 05 94 c2 08 10            lock inc dword ptr [0x1008c294]
  1001AA77:  e9 04 fb 00 00                  jmp      0x1002a580


; === Hook::LeaveHook ===
; RVA: 0x0001AA80  Size: 8 bytes
; Exports: ?LeaveHook@Hook@GW@@YAXXZ
;
  1001AA80:  f0 ff 0d 98 c2 08 10            lock dec dword ptr [0x1008c298]
  1001AA87:  c3                              ret      


; === Hook::RemoveHook ===
; RVA: 0x0001AA90  Size: 18 bytes
; Exports: ?RemoveHook@Hook@GW@@YAXPAX@Z
;
  1001AA90:  55                              push     ebp
  1001AA91:  8b ec                           mov      ebp, esp
  1001AA93:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001AA96:  85 c0                           test     eax, eax
  1001AA98:  74 06                           je       0x1001aaa0
  1001AA9A:  50                              push     eax
  1001AA9B:  e8 30 fb 00 00                  call     0x1002a5d0
  1001AAA0:  5d                              pop      ebp
  1001AAA1:  c3                              ret      


