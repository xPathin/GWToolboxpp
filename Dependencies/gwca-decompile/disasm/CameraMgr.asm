; Module: CameraMgr
; Functions: 10
; Total code size: 608 bytes
;

; === CameraMgr::ComputeCamPos ===
; RVA: 0x000033B0  Size: 291 bytes
; Exports: ?ComputeCamPos@CameraMgr@GW@@YA?AUVec3f@2@M@Z
;
  100033B0:  55                              push     ebp
  100033B1:  8b ec                           mov      ebp, esp
  100033B3:  83 e4 f8                        and      esp, 0xfffffff8
  100033B6:  8b 0d b0 c0 08 10               mov      ecx, dword ptr [0x1008c0b0]
  100033BC:  83 ec 24                        sub      esp, 0x24
  100033BF:  56                              push     esi
  100033C0:  85 c9                           test     ecx, ecx
  100033C2:  75 10                           jne      0x100033d4
  100033C4:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100033C7:  89 08                           mov      dword ptr [eax], ecx
  100033C9:  89 48 04                        mov      dword ptr [eax + 4], ecx
  100033CC:  89 48 08                        mov      dword ptr [eax + 8], ecx
  100033CF:  5e                              pop      esi
  100033D0:  8b e5                           mov      esp, ebp
  100033D2:  5d                              pop      ebp
  100033D3:  c3                              ret      
  100033D4:  f3 0f 10 45 0c                  movss    xmm0, dword ptr [ebp + 0xc]
  100033D9:  0f 2e 05 10 c6 04 10            ucomiss  xmm0, dword ptr [0x1004c610]
  100033E0:  9f                              lahf     
  100033E1:  f6 c4 44                        test     ah, 0x44
  100033E4:  7a 0a                           jp       0x100033f0
  100033E6:  f3 0f 10 41 20                  movss    xmm0, dword ptr [ecx + 0x20]
  100033EB:  f3 0f 11 45 0c                  movss    dword ptr [ebp + 0xc], xmm0
  100033F0:  f3 0f 7e 81 a8 00 00 00         movq     xmm0, qword ptr [ecx + 0xa8]
  100033F8:  f3 0f 10 51 1c                  movss    xmm2, dword ptr [ecx + 0x1c]
  100033FD:  66 0f d6 44 24 1c               movq     qword ptr [esp + 0x1c], xmm0
  10003403:  0f 28 ca                        movaps   xmm1, xmm2
  10003406:  f3 0f 10 41 18                  movss    xmm0, dword ptr [ecx + 0x18]
  1000340B:  8b 81 b0 00 00 00               mov      eax, dword ptr [ecx + 0xb0]
  10003411:  0f 5a c0                        cvtps2pd xmm0, xmm0
  10003414:  89 44 24 24                     mov      dword ptr [esp + 0x24], eax
  10003418:  f3 0f 59 ca                     mulss    xmm1, xmm2
  1000341C:  f2 0f 11 44 24 10               movsd    qword ptr [esp + 0x10], xmm0
  10003422:  f3 0f 10 05 18 c6 04 10         movss    xmm0, dword ptr [0x1004c618]
  1000342A:  f3 0f 5c c1                     subss    xmm0, xmm1
  1000342E:  f3 0f 11 54 24 0c               movss    dword ptr [esp + 0xc], xmm2
  10003434:  0f 57 c9                        xorps    xmm1, xmm1
  10003437:  0f 5a c0                        cvtps2pd xmm0, xmm0
  1000343A:  66 0f 2e c8                     ucomisd  xmm1, xmm0
  1000343E:  77 06                           ja       0x10003446
  10003440:  f2 0f 51 c0                     sqrtsd   xmm0, xmm0
  10003444:  eb 05                           jmp      0x1000344b
  10003446:  e8 85 df 02 00                  call     0x100313d0
  1000344B:  f2 0f 5a c0                     cvtsd2ss xmm0, xmm0
  1000344F:  f3 0f 59 45 0c                  mulss    xmm0, dword ptr [ebp + 0xc]
  10003454:  f3 0f 11 44 24 08               movss    dword ptr [esp + 8], xmm0
  1000345A:  f2 0f 10 44 24 10               movsd    xmm0, qword ptr [esp + 0x10]
  10003460:  e8 db db 02 00                  call     0x10031040
  10003465:  f3 0f 10 54 24 1c               movss    xmm2, dword ptr [esp + 0x1c]
  1000346B:  0f 57 c9                        xorps    xmm1, xmm1
  1000346E:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10003471:  f2 0f 5a c8                     cvtsd2ss xmm1, xmm0
  10003475:  f2 0f 10 44 24 10               movsd    xmm0, qword ptr [esp + 0x10]
  1000347B:  f3 0f 59 4c 24 08               mulss    xmm1, dword ptr [esp + 8]
  10003481:  f3 0f 5c d1                     subss    xmm2, xmm1
  10003485:  f3 0f 11 16                     movss    dword ptr [esi], xmm2
  10003489:  e8 72 dd 02 00                  call     0x10031200
  1000348E:  0f 57 c9                        xorps    xmm1, xmm1
  10003491:  8b c6                           mov      eax, esi
  10003493:  f2 0f 5a c8                     cvtsd2ss xmm1, xmm0
  10003497:  f3 0f 10 44 24 20               movss    xmm0, dword ptr [esp + 0x20]
  1000349D:  f3 0f 59 4c 24 08               mulss    xmm1, dword ptr [esp + 8]
  100034A3:  f3 0f 5c c1                     subss    xmm0, xmm1
  100034A7:  f3 0f 10 4d 0c                  movss    xmm1, dword ptr [ebp + 0xc]
  100034AC:  f3 0f 11 46 04                  movss    dword ptr [esi + 4], xmm0
  100034B1:  f3 0f 59 0d 14 c6 04 10         mulss    xmm1, dword ptr [0x1004c614]  ; "33s?"
  100034B9:  f3 0f 10 44 24 24               movss    xmm0, dword ptr [esp + 0x24]
  100034BF:  f3 0f 59 4c 24 0c               mulss    xmm1, dword ptr [esp + 0xc]
  100034C5:  f3 0f 5c c1                     subss    xmm0, xmm1
  100034C9:  f3 0f 11 46 08                  movss    dword ptr [esi + 8], xmm0
  100034CE:  5e                              pop      esi
  100034CF:  8b e5                           mov      esp, ebp
  100034D1:  5d                              pop      ebp
  100034D2:  c3                              ret      


; === CameraMgr::GetCamera, GetCamera ===
; RVA: 0x000034E0  Size: 6 bytes
; Exports: ?GetCamera@CameraMgr@GW@@YAPAUCamera@2@XZ, GetCamera
;
  100034E0:  a1 b0 c0 08 10                  mov      eax, dword ptr [0x1008c0b0]
  100034E5:  c3                              ret      


; === CameraMgr::GetCameraUnlock, GetCameraUnlock ===
; RVA: 0x000034F0  Size: 6 bytes
; Exports: ?GetCameraUnlock@CameraMgr@GW@@YA_NXZ, GetCameraUnlock
;
  100034F0:  a0 d8 c0 08 10                  mov      al, byte ptr [0x1008c0d8]
  100034F5:  c3                              ret      


; === CameraMgr::GetFieldOfView, GetFieldOfView ===
; RVA: 0x00003500  Size: 47 bytes
; Exports: ?GetFieldOfView@CameraMgr@GW@@YAMXZ, GetFieldOfView
;
  10003500:  55                              push     ebp
  10003501:  8b ec                           mov      ebp, esp
  10003503:  51                              push     ecx
  10003504:  a1 b0 c0 08 10                  mov      eax, dword ptr [0x1008c0b0]
  10003509:  85 c0                           test     eax, eax
  1000350B:  74 14                           je       0x10003521
  1000350D:  f3 0f 10 80 c0 00 00 00         movss    xmm0, dword ptr [eax + 0xc0]
  10003515:  f3 0f 11 45 fc                  movss    dword ptr [ebp - 4], xmm0
  1000351A:  d9 45 fc                        fld      dword ptr [ebp - 4]
  1000351D:  8b e5                           mov      esp, ebp
  1000351F:  5d                              pop      ebp
  10003520:  c3                              ret      
  10003521:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10003528:  d9 45 fc                        fld      dword ptr [ebp - 4]
  1000352B:  8b e5                           mov      esp, ebp
  1000352D:  5d                              pop      ebp
  1000352E:  c3                              ret      


; === CameraMgr::GetYaw, GetYaw ===
; RVA: 0x00003530  Size: 44 bytes
; Exports: ?GetYaw@CameraMgr@GW@@YAMXZ, GetYaw
;
  10003530:  55                              push     ebp
  10003531:  8b ec                           mov      ebp, esp
  10003533:  51                              push     ecx
  10003534:  a1 b0 c0 08 10                  mov      eax, dword ptr [0x1008c0b0]
  10003539:  85 c0                           test     eax, eax
  1000353B:  74 11                           je       0x1000354e
  1000353D:  f3 0f 10 40 18                  movss    xmm0, dword ptr [eax + 0x18]
  10003542:  f3 0f 11 45 fc                  movss    dword ptr [ebp - 4], xmm0
  10003547:  d9 45 fc                        fld      dword ptr [ebp - 4]
  1000354A:  8b e5                           mov      esp, ebp
  1000354C:  5d                              pop      ebp
  1000354D:  c3                              ret      
  1000354E:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10003555:  d9 45 fc                        fld      dword ptr [ebp - 4]
  10003558:  8b e5                           mov      esp, ebp
  1000355A:  5d                              pop      ebp
  1000355B:  c3                              ret      


; === CameraMgr::SetFieldOfView, SetFieldOfView ===
; RVA: 0x00003560  Size: 33 bytes
; Exports: ?SetFieldOfView@CameraMgr@GW@@YA_NM@Z, SetFieldOfView
;
  10003560:  55                              push     ebp
  10003561:  8b ec                           mov      ebp, esp
  10003563:  a1 b0 c0 08 10                  mov      eax, dword ptr [0x1008c0b0]
  10003568:  85 c0                           test     eax, eax
  1000356A:  74 11                           je       0x1000357d
  1000356C:  f3 0f 10 45 08                  movss    xmm0, dword ptr [ebp + 8]
  10003571:  f3 0f 11 80 c0 00 00 00         movss    dword ptr [eax + 0xc0], xmm0
  10003579:  b0 01                           mov      al, 1
  1000357B:  5d                              pop      ebp
  1000357C:  c3                              ret      
  1000357D:  32 c0                           xor      al, al
  1000357F:  5d                              pop      ebp
  10003580:  c3                              ret      


; === CameraMgr::SetFog, SetFog ===
; RVA: 0x00003590  Size: 9 bytes
; Exports: ?SetFog@CameraMgr@GW@@YA_N_N@Z, SetFog
;
  10003590:  55                              push     ebp
  10003591:  8b ec                           mov      ebp, esp
  10003593:  5d                              pop      ebp
  10003594:  e9 e7 e1 01 00                  jmp      0x10021780


; === CameraMgr::SetMaxDist, SetMaxDist ===
; RVA: 0x000035A0  Size: 30 bytes
; Exports: ?SetMaxDist@CameraMgr@GW@@YA_NM@Z, SetMaxDist
;
  100035A0:  55                              push     ebp
  100035A1:  8b ec                           mov      ebp, esp
  100035A3:  a1 b0 c0 08 10                  mov      eax, dword ptr [0x1008c0b0]
  100035A8:  85 c0                           test     eax, eax
  100035AA:  74 0e                           je       0x100035ba
  100035AC:  f3 0f 10 45 08                  movss    xmm0, dword ptr [ebp + 8]
  100035B1:  f3 0f 11 40 6c                  movss    dword ptr [eax + 0x6c], xmm0
  100035B6:  b0 01                           mov      al, 1
  100035B8:  5d                              pop      ebp
  100035B9:  c3                              ret      
  100035BA:  32 c0                           xor      al, al
  100035BC:  5d                              pop      ebp
  100035BD:  c3                              ret      


; === CameraMgr::UnlockCam, UnlockCam ===
; RVA: 0x000035C0  Size: 43 bytes
; Exports: ?UnlockCam@CameraMgr@GW@@YA_N_N@Z, UnlockCam
;
  100035C0:  55                              push     ebp
  100035C1:  8b ec                           mov      ebp, esp
  100035C3:  53                              push     ebx
  100035C4:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  100035C7:  38 1d d8 c0 08 10               cmp      byte ptr [0x1008c0d8], bl
  100035CD:  75 05                           jne      0x100035d4
  100035CF:  b0 01                           mov      al, 1
  100035D1:  5b                              pop      ebx
  100035D2:  5d                              pop      ebp
  100035D3:  c3                              ret      
  100035D4:  53                              push     ebx
  100035D5:  b9 c8 c0 08 10                  mov      ecx, 0x1008c0c8
  100035DA:  e8 f1 b2 01 00                  call     0x1001e8d0  ; MemoryPatcher::TogglePatch
  100035DF:  38 1d d8 c0 08 10               cmp      byte ptr [0x1008c0d8], bl
  100035E5:  5b                              pop      ebx
  100035E6:  0f 94 c0                        sete     al
  100035E9:  5d                              pop      ebp
  100035EA:  c3                              ret      


; === CameraMgr::UpdateCameraPos, UpdateCameraPos ===
; RVA: 0x000035F0  Size: 99 bytes
; Exports: ?UpdateCameraPos@CameraMgr@GW@@YA_NXZ, UpdateCameraPos
;
  100035F0:  55                              push     ebp
  100035F1:  8b ec                           mov      ebp, esp
  100035F3:  83 ec 18                        sub      esp, 0x18
  100035F6:  56                              push     esi
  100035F7:  8b 35 b0 c0 08 10               mov      esi, dword ptr [0x1008c0b0]
  100035FD:  85 f6                           test     esi, esi
  100035FF:  74 4b                           je       0x1000364c
  10003601:  51                              push     ecx
  10003602:  8d 45 e8                        lea      eax, [ebp - 0x18]
  10003605:  c7 04 24 00 00 00 00            mov      dword ptr [esp], 0
  1000360C:  50                              push     eax
  1000360D:  e8 9e fd ff ff                  call     0x100033b0  ; CameraMgr::ComputeCamPos
  10003612:  83 c4 08                        add      esp, 8
  10003615:  f3 0f 7e 00                     movq     xmm0, qword ptr [eax]
  10003619:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  1000361C:  66 0f d6 45 f4                  movq     qword ptr [ebp - 0xc], xmm0
  10003621:  f3 0f 10 45 f4                  movss    xmm0, dword ptr [ebp - 0xc]
  10003626:  f3 0f 11 46 78                  movss    dword ptr [esi + 0x78], xmm0
  1000362B:  f3 0f 10 45 f8                  movss    xmm0, dword ptr [ebp - 8]
  10003630:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10003633:  b0 01                           mov      al, 1
  10003635:  f3 0f 11 46 7c                  movss    dword ptr [esi + 0x7c], xmm0
  1000363A:  f3 0f 10 45 fc                  movss    xmm0, dword ptr [ebp - 4]
  1000363F:  f3 0f 11 86 80 00 00 00         movss    dword ptr [esi + 0x80], xmm0
  10003647:  5e                              pop      esi
  10003648:  8b e5                           mov      esp, ebp
  1000364A:  5d                              pop      ebp
  1000364B:  c3                              ret      
  1000364C:  32 c0                           xor      al, al
  1000364E:  5e                              pop      esi
  1000364F:  8b e5                           mov      esp, ebp
  10003651:  5d                              pop      ebp
  10003652:  c3                              ret      


