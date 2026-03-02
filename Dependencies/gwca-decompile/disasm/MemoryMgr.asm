; Module: MemoryMgr
; Functions: 7
; Total code size: 261 bytes
;

; === MemoryMgr::GetGWVersion ===
; RVA: 0x0001E090  Size: 14 bytes
; Exports: ?GetGWVersion@MemoryMgr@GW@@YAIXZ
;
  1001E090:  a1 5c c3 08 10                  mov      eax, dword ptr [0x1008c35c]
  1001E095:  85 c0                           test     eax, eax
  1001E097:  74 02                           je       0x1001e09b
  1001E099:  ff e0                           jmp      eax
  1001E09B:  33 c0                           xor      eax, eax
  1001E09D:  c3                              ret      


; === MemoryMgr::GetGWWindowHandle ===
; RVA: 0x0001E0A0  Size: 80 bytes
; Exports: ?GetGWWindowHandle@MemoryMgr@GW@@YAPAUHWND__@@XZ
;
  1001E0A0:  e9 fb 34 00 00                  jmp      0x100215a0
  1001E0A5:  cc                              int3     
  1001E0A6:  cc                              int3     
  1001E0A7:  cc                              int3     
  1001E0A8:  cc                              int3     
  1001E0A9:  cc                              int3     
  1001E0AA:  cc                              int3     
  1001E0AB:  cc                              int3     
  1001E0AC:  cc                              int3     
  1001E0AD:  cc                              int3     
  1001E0AE:  cc                              int3     
  1001E0AF:  cc                              int3     
  1001E0B0:  55                              push     ebp
  1001E0B1:  8b ec                           mov      ebp, esp
  1001E0B3:  56                              push     esi
  1001E0B4:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  1001E0B7:  85 f6                           test     esi, esi
  1001E0B9:  74 2b                           je       0x1001e0e6
  1001E0BB:  80 7d 0c 00                     cmp      byte ptr [ebp + 0xc], 0
  1001E0BF:  74 05                           je       0x1001e0c6
  1001E0C1:  e8 5a 01 00 00                  call     0x1001e220
  1001E0C6:  a1 a0 c3 08 10                  mov      eax, dword ptr [0x1008c3a0]
  1001E0CB:  8b 0d a4 c3 08 10               mov      ecx, dword ptr [0x1008c3a4]
  1001E0D1:  3b c1                           cmp      eax, ecx
  1001E0D3:  74 11                           je       0x1001e0e6
  1001E0D5:  3b 70 04                        cmp      esi, dword ptr [eax + 4]
  1001E0D8:  72 05                           jb       0x1001e0df
  1001E0DA:  3b 70 08                        cmp      esi, dword ptr [eax + 8]
  1001E0DD:  72 0c                           jb       0x1001e0eb
  1001E0DF:  83 c0 0c                        add      eax, 0xc
  1001E0E2:  3b c1                           cmp      eax, ecx
  1001E0E4:  75 ef                           jne      0x1001e0d5
  1001E0E6:  33 c0                           xor      eax, eax
  1001E0E8:  5e                              pop      esi
  1001E0E9:  5d                              pop      ebp
  1001E0EA:  c3                              ret      
  1001E0EB:  8b 00                           mov      eax, dword ptr [eax]
  1001E0ED:  5e                              pop      esi
  1001E0EE:  5d                              pop      ebp
  1001E0EF:  c3                              ret      


; === MemoryMgr::GetPersonalDir ===
; RVA: 0x0001E0F0  Size: 45 bytes
; Exports: ?GetPersonalDir@MemoryMgr@GW@@YA_NIPA_W@Z
;
  1001E0F0:  55                              push     ebp
  1001E0F1:  8b ec                           mov      ebp, esp
  1001E0F3:  a1 78 c3 08 10                  mov      eax, dword ptr [0x1008c378]
  1001E0F8:  85 c0                           test     eax, eax
  1001E0FA:  74 1d                           je       0x1001e119
  1001E0FC:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  1001E0FF:  85 c9                           test     ecx, ecx
  1001E101:  74 16                           je       0x1001e119
  1001E103:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  1001E106:  85 d2                           test     edx, edx
  1001E108:  74 0f                           je       0x1001e119
  1001E10A:  51                              push     ecx
  1001E10B:  52                              push     edx
  1001E10C:  ff d0                           call     eax
  1001E10E:  83 c4 08                        add      esp, 8
  1001E111:  85 c0                           test     eax, eax
  1001E113:  7e 04                           jle      0x1001e119
  1001E115:  b0 01                           mov      al, 1
  1001E117:  5d                              pop      ebp
  1001E118:  c3                              ret      
  1001E119:  32 c0                           xor      al, al
  1001E11B:  5d                              pop      ebp
  1001E11C:  c3                              ret      


; === MemoryMgr::GetSkillTimer ===
; RVA: 0x0001E120  Size: 14 bytes
; Exports: ?GetSkillTimer@MemoryMgr@GW@@YAKXZ
;
  1001E120:  a1 74 c3 08 10                  mov      eax, dword ptr [0x1008c374]
  1001E125:  85 c0                           test     eax, eax
  1001E127:  74 02                           je       0x1001e12b
  1001E129:  ff e0                           jmp      eax
  1001E12B:  33 c0                           xor      eax, eax
  1001E12D:  c3                              ret      


; === MemoryMgr::MemAlloc ===
; RVA: 0x0001E130  Size: 33 bytes
; Exports: ?MemAlloc@MemoryMgr@GW@@YAPAXI@Z
;
  1001E130:  55                              push     ebp
  1001E131:  8b ec                           mov      ebp, esp
  1001E133:  a1 60 c3 08 10                  mov      eax, dword ptr [0x1008c360]
  1001E138:  85 c0                           test     eax, eax
  1001E13A:  75 02                           jne      0x1001e13e
  1001E13C:  5d                              pop      ebp
  1001E13D:  c3                              ret      
  1001E13E:  68 d6 00 00 00                  push     0xd6
  1001E143:  68 50 30 05 10                  push     0x10053050  ; "C:\GitRepositories\GWCA\Source\MemoryMgr.cpp"
  1001E148:  6a 00                           push     0
  1001E14A:  ff 75 08                        push     dword ptr [ebp + 8]
  1001E14D:  ff d0                           call     eax
  1001E14F:  5d                              pop      ebp
  1001E150:  c3                              ret      


; === MemoryMgr::MemFree ===
; RVA: 0x0001E160  Size: 39 bytes
; Exports: ?MemFree@MemoryMgr@GW@@YAXPAX@Z
;
  1001E160:  55                              push     ebp
  1001E161:  8b ec                           mov      ebp, esp
  1001E163:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001E166:  85 c9                           test     ecx, ecx
  1001E168:  74 1b                           je       0x1001e185
  1001E16A:  6a 00                           push     0
  1001E16C:  83 ec 28                        sub      esp, 0x28
  1001E16F:  8b c4                           mov      eax, esp
  1001E171:  c7 00 84 30 05 10               mov      dword ptr [eax], 0x10053084
  1001E177:  89 48 04                        mov      dword ptr [eax + 4], ecx
  1001E17A:  89 40 24                        mov      dword ptr [eax + 0x24], eax
  1001E17D:  e8 be be ff ff                  call     0x1001a040  ; GameThread::Enqueue
  1001E182:  83 c4 2c                        add      esp, 0x2c
  1001E185:  5d                              pop      ebp
  1001E186:  c3                              ret      


; === MemoryMgr::MemRealloc ===
; RVA: 0x0001E190  Size: 36 bytes
; Exports: ?MemRealloc@MemoryMgr@GW@@YAPAXPAXI@Z
;
  1001E190:  55                              push     ebp
  1001E191:  8b ec                           mov      ebp, esp
  1001E193:  a1 64 c3 08 10                  mov      eax, dword ptr [0x1008c364]
  1001E198:  85 c0                           test     eax, eax
  1001E19A:  75 02                           jne      0x1001e19e
  1001E19C:  5d                              pop      ebp
  1001E19D:  c3                              ret      
  1001E19E:  68 e0 00 00 00                  push     0xe0
  1001E1A3:  68 50 30 05 10                  push     0x10053050  ; "C:\GitRepositories\GWCA\Source\MemoryMgr.cpp"
  1001E1A8:  6a 00                           push     0
  1001E1AA:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  1001E1AD:  ff 75 08                        push     dword ptr [ebp + 8]
  1001E1B0:  ff d0                           call     eax
  1001E1B2:  5d                              pop      ebp
  1001E1B3:  c3                              ret      


