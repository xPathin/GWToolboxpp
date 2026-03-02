; Module: RenderMgr
; Functions: 17
; Total code size: 1178 bytes
;

; === Render::EnableHooks ===
; RVA: 0x00021200  Size: 35 bytes
; Exports: ?EnableHooks@Render@GW@@YAXXZ
;
  10021200:  a1 24 c4 08 10                  mov      eax, dword ptr [0x1008c424]
  10021205:  85 c0                           test     eax, eax
  10021207:  74 09                           je       0x10021212
  10021209:  50                              push     eax
  1002120A:  e8 31 98 ff ff                  call     0x1001aa40  ; Hook::EnableHooks
  1002120F:  83 c4 04                        add      esp, 4
  10021212:  a1 50 c4 08 10                  mov      eax, dword ptr [0x1008c450]
  10021217:  85 c0                           test     eax, eax
  10021219:  74 07                           je       0x10021222
  1002121B:  50                              push     eax
  1002121C:  e8 1f 98 ff ff                  call     0x1001aa40  ; Hook::EnableHooks
  10021221:  59                              pop      ecx
  10021222:  c3                              ret      


; === Render::GetDevice ===
; RVA: 0x000212E0  Size: 19 bytes
; Exports: ?GetDevice@Render@GW@@YAPAUIDirect3DDevice9@@XZ
;
  100212E0:  a1 14 c4 08 10                  mov      eax, dword ptr [0x1008c414]
  100212E5:  85 c0                           test     eax, eax
  100212E7:  74 07                           je       0x100212f0
  100212E9:  8b 80 b8 01 00 00               mov      eax, dword ptr [eax + 0x1b8]
  100212EF:  c3                              ret      
  100212F0:  33 c0                           xor      eax, eax
  100212F2:  c3                              ret      


; === Render::GetFieldOfView ===
; RVA: 0x00021300  Size: 91 bytes
; Exports: ?GetFieldOfView@Render@GW@@YAMXZ
;
  10021300:  55                              push     ebp
  10021301:  8b ec                           mov      ebp, esp
  10021303:  83 ec 08                        sub      esp, 8
  10021306:  e8 d5 21 fe ff                  call     0x100034e0  ; CameraMgr::GetCamera, GetCamera
  1002130B:  85 c0                           test     eax, eax
  1002130D:  75 06                           jne      0x10021315
  1002130F:  d9 ee                           fldz     
  10021311:  8b e5                           mov      esp, ebp
  10021313:  5d                              pop      ebp
  10021314:  c3                              ret      
  10021315:  f3 0f 10 80 c0 00 00 00         movss    xmm0, dword ptr [eax + 0xc0]
  1002131D:  f3 0f 59 05 c4 37 05 10         mulss    xmm0, dword ptr [0x100537c4]
  10021325:  0f 5a c0                        cvtps2pd xmm0, xmm0
  10021328:  e8 d3 50 01 00                  call     0x10036400
  1002132D:  f3 0f 10 0d c8 37 05 10         movss    xmm1, dword ptr [0x100537c8]
  10021335:  f2 0f 5a c0                     cvtsd2ss xmm0, xmm0
  10021339:  d9 e8                           fld1     
  1002133B:  f3 0f 5e c8                     divss    xmm1, xmm0
  1002133F:  0f 5a c1                        cvtps2pd xmm0, xmm1
  10021342:  f2 0f 11 45 f8                  movsd    qword ptr [ebp - 8], xmm0
  10021347:  dd 45 f8                        fld      qword ptr [ebp - 8]
  1002134A:  e8 a1 50 01 00                  call     0x100363f0
  1002134F:  d9 5d fc                        fstp     dword ptr [ebp - 4]
  10021352:  d9 45 fc                        fld      dword ptr [ebp - 4]
  10021355:  dc c0                           fadd     st(0), st(0)
  10021357:  8b e5                           mov      esp, ebp
  10021359:  5d                              pop      ebp
  1002135A:  c3                              ret      


; === Render::GetFrameLimit ===
; RVA: 0x00021360  Size: 250 bytes
; Exports: ?GetFrameLimit@Render@GW@@YAIXZ
;
  10021360:  55                              push     ebp
  10021361:  8b ec                           mov      ebp, esp
  10021363:  51                              push     ecx
  10021364:  8d 45 fc                        lea      eax, [ebp - 4]
  10021367:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1002136E:  50                              push     eax
  1002136F:  68 bc 37 05 10                  push     0x100537bc
  10021374:  e8 a7 50 00 00                  call     0x10026420  ; UI::GetCommandLinePref, GetCommandLinePref_UInt
  10021379:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  1002137C:  83 c4 08                        add      esp, 8
  1002137F:  85 c0                           test     eax, eax
  10021381:  0f 85 cf 00 00 00               jne      0x10021456
  10021387:  8b 0d 18 c4 08 10               mov      ecx, dword ptr [0x1008c418]
  1002138D:  c7 45 fc 5a 00 00 00            mov      dword ptr [ebp - 4], 0x5a
  10021394:  56                              push     esi
  10021395:  85 c9                           test     ecx, ecx
  10021397:  74 26                           je       0x100213bf
  10021399:  8b 81 94 01 00 00               mov      eax, dword ptr [ecx + 0x194]
  1002139F:  83 f8 02                        cmp      eax, 2
  100213A2:  77 1b                           ja       0x100213bf
  100213A4:  f7 84 81 88 01 00 00 00 00 40 00  test     dword ptr [ecx + eax*4 + 0x188], 0x400000
  100213AF:  74 0e                           je       0x100213bf
  100213B1:  6b c0 68                        imul     eax, eax, 0x68
  100213B4:  8b b4 08 a8 00 00 00            mov      esi, dword ptr [eax + ecx + 0xa8]
  100213BB:  85 f6                           test     esi, esi
  100213BD:  75 05                           jne      0x100213c4
  100213BF:  be 3c 00 00 00                  mov      esi, 0x3c
  100213C4:  6a 07                           push     7
  100213C6:  e8 75 55 00 00                  call     0x10026940  ; UI::GetPreference, GetPreference_Enum
  100213CB:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  100213CE:  83 c4 04                        add      esp, 4
  100213D1:  83 f8 01                        cmp      eax, 1
  100213D4:  75 0a                           jne      0x100213e0
  100213D6:  83 f9 1e                        cmp      ecx, 0x1e
  100213D9:  76 22                           jbe      0x100213fd
  100213DB:  8d 48 1d                        lea      ecx, [eax + 0x1d]
  100213DE:  eb 37                           jmp      0x10021417
  100213E0:  83 f8 02                        cmp      eax, 2
  100213E3:  75 0a                           jne      0x100213ef
  100213E5:  83 f9 3c                        cmp      ecx, 0x3c
  100213E8:  76 13                           jbe      0x100213fd
  100213EA:  8d 48 3a                        lea      ecx, [eax + 0x3a]
  100213ED:  eb 28                           jmp      0x10021417
  100213EF:  83 f8 03                        cmp      eax, 3
  100213F2:  75 09                           jne      0x100213fd
  100213F4:  3b ce                           cmp      ecx, esi
  100213F6:  72 05                           jb       0x100213fd
  100213F8:  8b ce                           mov      ecx, esi
  100213FA:  89 4d fc                        mov      dword ptr [ebp - 4], ecx
  100213FD:  85 c9                           test     ecx, ecx
  100213FF:  74 11                           je       0x10021412
  10021401:  83 f9 5a                        cmp      ecx, 0x5a
  10021404:  77 0c                           ja       0x10021412
  10021406:  83 f9 0f                        cmp      ecx, 0xf
  10021409:  73 0f                           jae      0x1002141a
  1002140B:  b9 0f 00 00 00                  mov      ecx, 0xf
  10021410:  eb 05                           jmp      0x10021417
  10021412:  b9 5a 00 00 00                  mov      ecx, 0x5a
  10021417:  89 4d fc                        mov      dword ptr [ebp - 4], ecx
  1002141A:  3b ce                           cmp      ecx, esi
  1002141C:  5e                              pop      esi
  1002141D:  72 35                           jb       0x10021454
  1002141F:  8b 15 18 c4 08 10               mov      edx, dword ptr [0x1008c418]
  10021425:  85 d2                           test     edx, edx
  10021427:  74 2b                           je       0x10021454
  10021429:  8b 82 94 01 00 00               mov      eax, dword ptr [edx + 0x194]
  1002142F:  83 f8 02                        cmp      eax, 2
  10021432:  77 20                           ja       0x10021454
  10021434:  f7 84 82 88 01 00 00 00 80 00 00  test     dword ptr [edx + eax*4 + 0x188], 0x8000
  1002143F:  74 13                           je       0x10021454
  10021441:  6b c0 68                        imul     eax, eax, 0x68
  10021444:  83 bc 10 8c 00 00 00 00         cmp      dword ptr [eax + edx + 0x8c], 0
  1002144C:  74 06                           je       0x10021454
  1002144E:  33 c0                           xor      eax, eax
  10021450:  8b e5                           mov      esp, ebp
  10021452:  5d                              pop      ebp
  10021453:  c3                              ret      
  10021454:  8b c1                           mov      eax, ecx
  10021456:  8b e5                           mov      esp, ebp
  10021458:  5d                              pop      ebp
  10021459:  c3                              ret      


; === Render::GetGraphicsRendererValue ===
; RVA: 0x00021460  Size: 74 bytes
; Exports: ?GetGraphicsRendererValue@Render@GW@@YAIW4Metric@12@I@Z
;
  10021460:  55                              push     ebp
  10021461:  8b ec                           mov      ebp, esp
  10021463:  56                              push     esi
  10021464:  8b 35 18 c4 08 10               mov      esi, dword ptr [0x1008c418]
  1002146A:  85 f6                           test     esi, esi
  1002146C:  74 37                           je       0x100214a5
  1002146E:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10021471:  83 f9 1a                        cmp      ecx, 0x1a
  10021474:  73 2f                           jae      0x100214a5
  10021476:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10021479:  83 f8 02                        cmp      eax, 2
  1002147C:  76 0b                           jbe      0x10021489
  1002147E:  8b 86 94 01 00 00               mov      eax, dword ptr [esi + 0x194]
  10021484:  83 f8 02                        cmp      eax, 2
  10021487:  77 1c                           ja       0x100214a5
  10021489:  ba 01 00 00 00                  mov      edx, 1
  1002148E:  d3 e2                           shl      edx, cl
  10021490:  85 94 86 88 01 00 00            test     dword ptr [esi + eax*4 + 0x188], edx
  10021497:  74 0c                           je       0x100214a5
  10021499:  6b c0 1a                        imul     eax, eax, 0x1a
  1002149C:  03 c1                           add      eax, ecx
  1002149E:  8b 44 86 50                     mov      eax, dword ptr [esi + eax*4 + 0x50]
  100214A2:  5e                              pop      esi
  100214A3:  5d                              pop      ebp
  100214A4:  c3                              ret      
  100214A5:  33 c0                           xor      eax, eax
  100214A7:  5e                              pop      esi
  100214A8:  5d                              pop      ebp
  100214A9:  c3                              ret      


; === Render::GetIsFullscreen ===
; RVA: 0x000214B0  Size: 49 bytes
; Exports: ?GetIsFullscreen@Render@GW@@YAHXZ
;
  100214B0:  8b 15 14 c4 08 10               mov      edx, dword ptr [0x1008c414]
  100214B6:  85 d2                           test     edx, edx
  100214B8:  75 04                           jne      0x100214be
  100214BA:  83 c8 ff                        or       eax, 0xffffffff
  100214BD:  c3                              ret      
  100214BE:  8b 82 48 0d 00 00               mov      eax, dword ptr [edx + 0xd48]
  100214C4:  3b 82 e4 0d 00 00               cmp      eax, dword ptr [edx + 0xde4]
  100214CA:  75 12                           jne      0x100214de
  100214CC:  8b 8a 44 0d 00 00               mov      ecx, dword ptr [edx + 0xd44]
  100214D2:  33 c0                           xor      eax, eax
  100214D4:  3b 8a e0 0d 00 00               cmp      ecx, dword ptr [edx + 0xde0]
  100214DA:  0f 94 c0                        sete     al
  100214DD:  c3                              ret      
  100214DE:  33 c0                           xor      eax, eax
  100214E0:  c3                              ret      


; === Render::GetIsInRenderLoop ===
; RVA: 0x000214F0  Size: 33 bytes
; Exports: ?GetIsInRenderLoop@Render@GW@@YA_NXZ
;
  100214F0:  53                              push     ebx
  100214F1:  68 30 c4 08 10                  push     0x1008c430
  100214F6:  ff 15 34 c0 04 10               call     dword ptr [0x1004c034]
  100214FC:  8a 1d 48 c4 08 10               mov      bl, byte ptr [0x1008c448]
  10021502:  68 30 c4 08 10                  push     0x1008c430
  10021507:  ff 15 38 c0 04 10               call     dword ptr [0x1004c038]
  1002150D:  8a c3                           mov      al, bl
  1002150F:  5b                              pop      ebx
  10021510:  c3                              ret      


; === Render::GetRenderCallback ===
; RVA: 0x00021520  Size: 6 bytes
; Exports: ?GetRenderCallback@Render@GW@@YAP6AXPAUIDirect3DDevice9@@@ZXZ
;
  10021520:  a1 54 c4 08 10                  mov      eax, dword ptr [0x1008c454]
  10021525:  c3                              ret      


; === Render::GetTransform ===
; RVA: 0x00021530  Size: 67 bytes
; Exports: ?GetTransform@Render@GW@@YAPAUMat4x3f@12@W4Transform@12@@Z
;
  10021530:  55                              push     ebp
  10021531:  8b ec                           mov      ebp, esp
  10021533:  a1 2c c4 08 10                  mov      eax, dword ptr [0x1008c42c]
  10021538:  85 c0                           test     eax, eax
  1002153A:  75 21                           jne      0x1002155d
  1002153C:  68 50 37 05 10                  push     0x10053750  ; "GW::Render::GetTransform"
  10021541:  68 43 01 00 00                  push     0x143
  10021546:  68 6c 37 05 10                  push     0x1005376c  ; "C:\GitRepositories\GWCA\Source\RenderMgr.cpp"
  1002154B:  68 9c 37 05 10                  push     0x1005379c  ; "GwGetTransform_func != nullptr"
  10021550:  e8 1b 43 fe ff                  call     0x10005870  ; GW::FatalAssert
  10021555:  a1 2c c4 08 10                  mov      eax, dword ptr [0x1008c42c]
  1002155A:  83 c4 10                        add      esp, 0x10
  1002155D:  5d                              pop      ebp
  1002155E:  ff e0                           jmp      eax
  10021560:  a1 14 c4 08 10                  mov      eax, dword ptr [0x1008c414]
  10021565:  85 c0                           test     eax, eax
  10021567:  74 07                           je       0x10021570
  10021569:  8b 80 48 0d 00 00               mov      eax, dword ptr [eax + 0xd48]
  1002156F:  c3                              ret      
  10021570:  33 c0                           xor      eax, eax
  10021572:  c3                              ret      


; === Render::GetViewportHeight ===
; RVA: 0x00021560  Size: 19 bytes
; Exports: ?GetViewportHeight@Render@GW@@YAIXZ
;
  10021560:  a1 14 c4 08 10                  mov      eax, dword ptr [0x1008c414]
  10021565:  85 c0                           test     eax, eax
  10021567:  74 07                           je       0x10021570
  10021569:  8b 80 48 0d 00 00               mov      eax, dword ptr [eax + 0xd48]
  1002156F:  c3                              ret      
  10021570:  33 c0                           xor      eax, eax
  10021572:  c3                              ret      


; === Render::GetViewportWidth ===
; RVA: 0x00021580  Size: 19 bytes
; Exports: ?GetViewportWidth@Render@GW@@YAIXZ
;
  10021580:  a1 14 c4 08 10                  mov      eax, dword ptr [0x1008c414]
  10021585:  85 c0                           test     eax, eax
  10021587:  74 07                           je       0x10021590
  10021589:  8b 80 44 0d 00 00               mov      eax, dword ptr [eax + 0xd44]
  1002158F:  c3                              ret      
  10021590:  33 c0                           xor      eax, eax
  10021592:  c3                              ret      


; === Render::GetWindowHandle ===
; RVA: 0x000215A0  Size: 27 bytes
; Exports: ?GetWindowHandle@Render@GW@@YAPAUHWND__@@XZ
;
  100215A0:  a1 5c c4 08 10                  mov      eax, dword ptr [0x1008c45c]
  100215A5:  85 c0                           test     eax, eax
  100215A7:  75 11                           jne      0x100215ba
  100215A9:  50                              push     eax
  100215AA:  68 30 12 02 10                  push     0x10021230
  100215AF:  ff 15 ac c1 04 10               call     dword ptr [0x1004c1ac]
  100215B5:  a1 5c c4 08 10                  mov      eax, dword ptr [0x1008c45c]
  100215BA:  c3                              ret      


; === Render::SetFog ===
; RVA: 0x00021780  Size: 13 bytes
; Exports: ?SetFog@Render@GW@@YA_N_N@Z
;
  10021780:  55                              push     ebp
  10021781:  8b ec                           mov      ebp, esp
  10021783:  8a 45 08                        mov      al, byte ptr [ebp + 8]
  10021786:  a2 20 a2 08 10                  mov      byte ptr [0x1008a220], al
  1002178B:  5d                              pop      ebp
  1002178C:  c3                              ret      


; === Render::SetFrameLimit ===
; RVA: 0x00021790  Size: 21 bytes
; Exports: ?SetFrameLimit@Render@GW@@YA_NI@Z
;
  10021790:  55                              push     ebp
  10021791:  8b ec                           mov      ebp, esp
  10021793:  ff 75 08                        push     dword ptr [ebp + 8]
  10021796:  68 bc 37 05 10                  push     0x100537bc
  1002179B:  e8 c0 6a 00 00                  call     0x10028260  ; UI::SetCommandLinePref, SetCommandLinePref_UInt
  100217A0:  83 c4 08                        add      esp, 8
  100217A3:  5d                              pop      ebp
  100217A4:  c3                              ret      


; === Render::SetGraphicsRendererValue ===
; RVA: 0x000217B0  Size: 429 bytes
; Exports: ?SetGraphicsRendererValue@Render@GW@@YA_NW4Metric@12@II@Z
;
  100217B0:  55                              push     ebp
  100217B1:  8b ec                           mov      ebp, esp
  100217B3:  8b 15 18 c4 08 10               mov      edx, dword ptr [0x1008c418]
  100217B9:  56                              push     esi
  100217BA:  57                              push     edi
  100217BB:  85 d2                           test     edx, edx
  100217BD:  0f 84 3f 01 00 00               je       0x10021902
  100217C3:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  100217C6:  83 fe 1a                        cmp      esi, 0x1a
  100217C9:  0f 83 33 01 00 00               jae      0x10021902
  100217CF:  83 fe 17                        cmp      esi, 0x17
  100217D2:  0f 84 2a 01 00 00               je       0x10021902
  100217D8:  83 fe 18                        cmp      esi, 0x18
  100217DB:  0f 84 21 01 00 00               je       0x10021902
  100217E1:  8b 7d 10                        mov      edi, dword ptr [ebp + 0x10]
  100217E4:  83 ff 02                        cmp      edi, 2
  100217E7:  76 0f                           jbe      0x100217f8
  100217E9:  8b ba 94 01 00 00               mov      edi, dword ptr [edx + 0x194]
  100217EF:  83 ff 02                        cmp      edi, 2
  100217F2:  0f 87 0a 01 00 00               ja       0x10021902
  100217F8:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  100217FB:  6b cf 1a                        imul     ecx, edi, 0x1a
  100217FE:  03 ce                           add      ecx, esi
  10021800:  89 44 8a 50                     mov      dword ptr [edx + ecx*4 + 0x50], eax
  10021804:  8b 84 ba 88 01 00 00            mov      eax, dword ptr [edx + edi*4 + 0x188]
  1002180B:  0f ab f0                        bts      eax, esi
  1002180E:  89 84 ba 88 01 00 00            mov      dword ptr [edx + edi*4 + 0x188], eax
  10021815:  3b ba 94 01 00 00               cmp      edi, dword ptr [edx + 0x194]
  1002181B:  0f 85 db 00 00 00               jne      0x100218fc
  10021821:  83 fe 10                        cmp      esi, 0x10
  10021824:  0f 87 d2 00 00 00               ja       0x100218fc
  1002182A:  ff 24 b5 08 19 02 10            jmp      dword ptr [esi*4 + 0x10021908]
  10021831:  83 8a e0 01 00 00 01            or       dword ptr [edx + 0x1e0], 1
  10021838:  b0 01                           mov      al, 1
  1002183A:  5f                              pop      edi
  1002183B:  5e                              pop      esi
  1002183C:  5d                              pop      ebp
  1002183D:  c3                              ret      
  1002183E:  83 8a e0 01 00 00 04            or       dword ptr [edx + 0x1e0], 4
  10021845:  b0 01                           mov      al, 1
  10021847:  5f                              pop      edi
  10021848:  5e                              pop      esi
  10021849:  5d                              pop      ebp
  1002184A:  c3                              ret      
  1002184B:  83 8a e0 01 00 00 08            or       dword ptr [edx + 0x1e0], 8
  10021852:  b0 01                           mov      al, 1
  10021854:  5f                              pop      edi
  10021855:  5e                              pop      esi
  10021856:  5d                              pop      ebp
  10021857:  c3                              ret      
  10021858:  83 8a e0 01 00 00 10            or       dword ptr [edx + 0x1e0], 0x10
  1002185F:  b0 01                           mov      al, 1
  10021861:  5f                              pop      edi
  10021862:  5e                              pop      esi
  10021863:  5d                              pop      ebp
  10021864:  c3                              ret      
  10021865:  83 8a e0 01 00 00 20            or       dword ptr [edx + 0x1e0], 0x20
  1002186C:  b0 01                           mov      al, 1
  1002186E:  5f                              pop      edi
  1002186F:  5e                              pop      esi
  10021870:  5d                              pop      ebp
  10021871:  c3                              ret      
  10021872:  81 8a e0 01 00 00 00 01 00 00   or       dword ptr [edx + 0x1e0], 0x100
  1002187C:  b0 01                           mov      al, 1
  1002187E:  5f                              pop      edi
  1002187F:  5e                              pop      esi
  10021880:  5d                              pop      ebp
  10021881:  c3                              ret      
  10021882:  81 8a e0 01 00 00 00 04 00 00   or       dword ptr [edx + 0x1e0], 0x400
  1002188C:  b0 01                           mov      al, 1
  1002188E:  5f                              pop      edi
  1002188F:  5e                              pop      esi
  10021890:  5d                              pop      ebp
  10021891:  c3                              ret      
  10021892:  81 8a e0 01 00 00 00 08 00 00   or       dword ptr [edx + 0x1e0], 0x800
  1002189C:  b0 01                           mov      al, 1
  1002189E:  5f                              pop      edi
  1002189F:  5e                              pop      esi
  100218A0:  5d                              pop      ebp
  100218A1:  c3                              ret      
  100218A2:  81 8a e0 01 00 00 00 10 00 00   or       dword ptr [edx + 0x1e0], 0x1000
  100218AC:  b0 01                           mov      al, 1
  100218AE:  5f                              pop      edi
  100218AF:  5e                              pop      esi
  100218B0:  5d                              pop      ebp
  100218B1:  c3                              ret      
  100218B2:  81 8a e0 01 00 00 00 20 00 00   or       dword ptr [edx + 0x1e0], 0x2000
  100218BC:  b0 01                           mov      al, 1
  100218BE:  5f                              pop      edi
  100218BF:  5e                              pop      esi
  100218C0:  5d                              pop      ebp
  100218C1:  c3                              ret      
  100218C2:  81 8a e0 01 00 00 00 40 00 00   or       dword ptr [edx + 0x1e0], 0x4000
  100218CC:  b0 01                           mov      al, 1
  100218CE:  5f                              pop      edi
  100218CF:  5e                              pop      esi
  100218D0:  5d                              pop      ebp
  100218D1:  c3                              ret      
  100218D2:  81 8a e0 01 00 00 00 80 00 00   or       dword ptr [edx + 0x1e0], 0x8000
  100218DC:  b0 01                           mov      al, 1
  100218DE:  5f                              pop      edi
  100218DF:  5e                              pop      esi
  100218E0:  5d                              pop      ebp
  100218E1:  c3                              ret      
  100218E2:  81 8a e0 01 00 00 00 00 02 00   or       dword ptr [edx + 0x1e0], 0x20000
  100218EC:  b0 01                           mov      al, 1
  100218EE:  5f                              pop      edi
  100218EF:  5e                              pop      esi
  100218F0:  5d                              pop      ebp
  100218F1:  c3                              ret      
  100218F2:  81 8a e0 01 00 00 00 24 08 00   or       dword ptr [edx + 0x1e0], 0x82400
  100218FC:  5f                              pop      edi
  100218FD:  b0 01                           mov      al, 1
  100218FF:  5e                              pop      esi
  10021900:  5d                              pop      ebp
  10021901:  c3                              ret      
  10021902:  5f                              pop      edi
  10021903:  32 c0                           xor      al, al
  10021905:  5e                              pop      esi
  10021906:  5d                              pop      ebp
  10021907:  c3                              ret      
  10021908:  31 18                           xor      dword ptr [eax], ebx
  1002190A:  02 10                           add      dl, byte ptr [eax]
  1002190C:  3e 18 02                        sbb      byte ptr ds:[edx], al
  1002190F:  10 4b 18                        adc      byte ptr [ebx + 0x18], cl
  10021912:  02 10                           add      dl, byte ptr [eax]
  10021914:  58                              pop      eax
  10021915:  18 02                           sbb      byte ptr [edx], al
  10021917:  10 65 18                        adc      byte ptr [ebp + 0x18], ah
  1002191A:  02 10                           add      dl, byte ptr [eax]
  1002191C:  72 18                           jb       0x10021936
  1002191E:  02 10                           add      dl, byte ptr [eax]
  10021920:  82 18 02                        sbb      byte ptr [eax], 2
  10021923:  10 82 18 02 10 92               adc      byte ptr [edx - 0x6deffde8], al
  10021929:  18 02                           sbb      byte ptr [edx], al
  1002192B:  10 a2 18 02 10 b2               adc      byte ptr [edx - 0x4deffde8], ah
  10021931:  18 02                           sbb      byte ptr [edx], al
  10021933:  10 b2 18 02 10 c2               adc      byte ptr [edx - 0x3deffde8], dh
  10021939:  18 02                           sbb      byte ptr [edx], al
  1002193B:  10 d2                           adc      dl, dl
  1002193D:  18 02                           sbb      byte ptr [edx], al
  1002193F:  10 e2                           adc      dl, ah
  10021941:  18 02                           sbb      byte ptr [edx], al
  10021943:  10 92 18 02 10 f2               adc      byte ptr [edx - 0xdeffde8], dl
  10021949:  18 02                           sbb      byte ptr [edx], al
  1002194B:  10 cc                           adc      ah, cl
  1002194D:  cc                              int3     
  1002194E:  cc                              int3     
  1002194F:  cc                              int3     
  10021950:  55                              push     ebp
  10021951:  8b ec                           mov      ebp, esp
  10021953:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10021956:  a3 54 c4 08 10                  mov      dword ptr [0x1008c454], eax
  1002195B:  5d                              pop      ebp
  1002195C:  c3                              ret      


; === Render::SetRenderCallback ===
; RVA: 0x00021950  Size: 13 bytes
; Exports: ?SetRenderCallback@Render@GW@@YAXP6AXPAUIDirect3DDevice9@@@Z@Z
;
  10021950:  55                              push     ebp
  10021951:  8b ec                           mov      ebp, esp
  10021953:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10021956:  a3 54 c4 08 10                  mov      dword ptr [0x1008c454], eax
  1002195B:  5d                              pop      ebp
  1002195C:  c3                              ret      


; === Render::SetResetCallback ===
; RVA: 0x00021960  Size: 13 bytes
; Exports: ?SetResetCallback@Render@GW@@YAXP6AXPAUIDirect3DDevice9@@@Z@Z
;
  10021960:  55                              push     ebp
  10021961:  8b ec                           mov      ebp, esp
  10021963:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10021966:  a3 58 c4 08 10                  mov      dword ptr [0x1008c458], eax
  1002196B:  5d                              pop      ebp
  1002196C:  c3                              ret      


