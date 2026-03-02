; Module: ChatMgr
; Functions: 20
; Total code size: 3552 bytes
;

; === Chat::AddToChatLog, AddToChatLog ===
; RVA: 0x00004390  Size: 66 bytes
; Exports: ?AddToChatLog@Chat@GW@@YA_NPA_WI@Z, AddToChatLog
;
  10004390:  55                              push     ebp
  10004391:  8b ec                           mov      ebp, esp
  10004393:  83 ec 08                        sub      esp, 8
  10004396:  83 3d 10 c1 08 10 00            cmp      dword ptr [0x1008c110], 0
  1000439D:  74 2d                           je       0x100043cc
  1000439F:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100043A2:  85 c0                           test     eax, eax
  100043A4:  74 26                           je       0x100043cc
  100043A6:  66 83 38 00                     cmp      word ptr [eax], 0
  100043AA:  74 20                           je       0x100043cc
  100043AC:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  100043AF:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  100043B2:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  100043B5:  8d 45 f8                        lea      eax, [ebp - 8]
  100043B8:  6a 00                           push     0
  100043BA:  50                              push     eax
  100043BB:  68 1d 00 00 30                  push     0x3000001d
  100043C0:  e8 0b 3d 02 00                  call     0x100280d0  ; UI::SendUIMessage
  100043C5:  83 c4 0c                        add      esp, 0xc
  100043C8:  8b e5                           mov      esp, ebp
  100043CA:  5d                              pop      ebp
  100043CB:  c3                              ret      
  100043CC:  32 c0                           xor      al, al
  100043CE:  8b e5                           mov      esp, ebp
  100043D0:  5d                              pop      ebp
  100043D1:  c3                              ret      


; === Chat::CreateCommand ===
; RVA: 0x000043E0  Size: 708 bytes
; Exports: ?CreateCommand@Chat@GW@@YAXPAUHookEntry@2@PB_WP6AXPAUHookStatus@2@1HPBQA_W@Z@Z
;
  100043E0:  55                              push     ebp
  100043E1:  8b ec                           mov      ebp, esp
  100043E3:  6a ff                           push     -1
  100043E5:  68 f4 a5 04 10                  push     0x1004a5f4
  100043EA:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  100043F0:  50                              push     eax
  100043F1:  83 ec 0c                        sub      esp, 0xc
  100043F4:  56                              push     esi
  100043F5:  57                              push     edi
  100043F6:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  100043FB:  33 c5                           xor      eax, ebp
  100043FD:  50                              push     eax
  100043FE:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10004401:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  10004407:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  1000440A:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  1000440D:  56                              push     esi
  1000440E:  e8 ad 01 00 00                  call     0x100045c0  ; Chat::DeleteCommand
  10004413:  6a 20                           push     0x20
  10004415:  e8 43 7c 02 00                  call     0x1002c05d
  1000441A:  8b f8                           mov      edi, eax
  1000441C:  83 c4 0c                        add      esp, 0xc
  1000441F:  89 7d e8                        mov      dword ptr [ebp - 0x18], edi
  10004422:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10004429:  85 ff                           test     edi, edi
  1000442B:  0f 84 17 01 00 00               je       0x10004548
  10004431:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  10004434:  8d 57 04                        lea      edx, [edi + 4]
  10004437:  89 37                           mov      dword ptr [edi], esi
  10004439:  0f 57 c0                        xorps    xmm0, xmm0
  1000443C:  8b f1                           mov      esi, ecx
  1000443E:  0f 11 02                        movups   xmmword ptr [edx], xmm0
  10004441:  c7 42 10 00 00 00 00            mov      dword ptr [edx + 0x10], 0
  10004448:  c7 42 14 00 00 00 00            mov      dword ptr [edx + 0x14], 0
  1000444F:  8d 46 02                        lea      eax, [esi + 2]
  10004452:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  10004455:  66 8b 06                        mov      ax, word ptr [esi]
  10004458:  83 c6 02                        add      esi, 2
  1000445B:  66 85 c0                        test     ax, ax
  1000445E:  75 f5                           jne      0x10004455
  10004460:  2b 75 ec                        sub      esi, dword ptr [ebp - 0x14]
  10004463:  d1 fe                           sar      esi, 1
  10004465:  81 fe fe ff ff 7f               cmp      esi, 0x7ffffffe
  1000446B:  0f 87 2a 01 00 00               ja       0x1000459b
  10004471:  83 fe 07                        cmp      esi, 7
  10004474:  77 29                           ja       0x1000449f
  10004476:  89 72 10                        mov      dword ptr [edx + 0x10], esi
  10004479:  03 f6                           add      esi, esi
  1000447B:  56                              push     esi
  1000447C:  51                              push     ecx
  1000447D:  52                              push     edx
  1000447E:  c7 42 14 07 00 00 00            mov      dword ptr [edx + 0x14], 7
  10004485:  e8 36 92 02 00                  call     0x1002d6c0
  1000448A:  83 c4 0c                        add      esp, 0xc
  1000448D:  33 c0                           xor      eax, eax
  1000448F:  66 89 44 3e 04                  mov      word ptr [esi + edi + 4], ax
  10004494:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  10004497:  89 47 1c                        mov      dword ptr [edi + 0x1c], eax
  1000449A:  e9 ab 00 00 00                  jmp      0x1000454a
  1000449F:  8b c6                           mov      eax, esi
  100044A1:  83 c8 07                        or       eax, 7
  100044A4:  3d fe ff ff 7f                  cmp      eax, 0x7ffffffe
  100044A9:  76 34                           jbe      0x100044df
  100044AB:  b9 ff ff ff 7f                  mov      ecx, 0x7fffffff
  100044B0:  c7 45 f0 fe ff ff 7f            mov      dword ptr [ebp - 0x10], 0x7ffffffe
  100044B7:  03 c9                           add      ecx, ecx
  100044B9:  81 f9 00 10 00 00               cmp      ecx, 0x1000
  100044BF:  72 4b                           jb       0x1000450c
  100044C1:  8d 41 23                        lea      eax, [ecx + 0x23]
  100044C4:  3b c1                           cmp      eax, ecx
  100044C6:  0f 86 e3 00 00 00               jbe      0x100045af
  100044CC:  50                              push     eax
  100044CD:  e8 8b 7b 02 00                  call     0x1002c05d
  100044D2:  83 c4 04                        add      esp, 4
  100044D5:  85 c0                           test     eax, eax
  100044D7:  0f 84 c3 00 00 00               je       0x100045a0
  100044DD:  eb 22                           jmp      0x10004501
  100044DF:  b9 0a 00 00 00                  mov      ecx, 0xa
  100044E4:  3b c1                           cmp      eax, ecx
  100044E6:  0f 42 c1                        cmovb    eax, ecx
  100044E9:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  100044EC:  8d 48 01                        lea      ecx, [eax + 1]
  100044EF:  81 f9 ff ff ff 7f               cmp      ecx, 0x7fffffff
  100044F5:  0f 87 b4 00 00 00               ja       0x100045af
  100044FB:  03 c9                           add      ecx, ecx
  100044FD:  75 ba                           jne      0x100044b9
  100044FF:  eb 1c                           jmp      0x1000451d
  10004501:  8d 48 23                        lea      ecx, [eax + 0x23]
  10004504:  83 e1 e0                        and      ecx, 0xffffffe0
  10004507:  89 41 fc                        mov      dword ptr [ecx - 4], eax
  1000450A:  eb 0b                           jmp      0x10004517
  1000450C:  51                              push     ecx
  1000450D:  e8 4b 7b 02 00                  call     0x1002c05d
  10004512:  83 c4 04                        add      esp, 4
  10004515:  8b c8                           mov      ecx, eax
  10004517:  8b 45 f0                        mov      eax, dword ptr [ebp - 0x10]
  1000451A:  8d 57 04                        lea      edx, [edi + 4]
  1000451D:  89 72 10                        mov      dword ptr [edx + 0x10], esi
  10004520:  03 f6                           add      esi, esi
  10004522:  56                              push     esi
  10004523:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10004526:  89 4d ec                        mov      dword ptr [ebp - 0x14], ecx
  10004529:  51                              push     ecx
  1000452A:  89 0a                           mov      dword ptr [edx], ecx
  1000452C:  89 42 14                        mov      dword ptr [edx + 0x14], eax
  1000452F:  e8 8c 91 02 00                  call     0x1002d6c0
  10004534:  8b 45 ec                        mov      eax, dword ptr [ebp - 0x14]
  10004537:  83 c4 0c                        add      esp, 0xc
  1000453A:  33 c9                           xor      ecx, ecx
  1000453C:  66 89 0c 06                     mov      word ptr [esi + eax], cx
  10004540:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  10004543:  89 47 1c                        mov      dword ptr [edi + 0x1c], eax
  10004546:  eb 02                           jmp      0x1000454a
  10004548:  33 ff                           xor      edi, edi
  1000454A:  a1 6c c1 08 10                  mov      eax, dword ptr [0x1008c16c]
  1000454F:  c7 45 fc ff ff ff ff            mov      dword ptr [ebp - 4], 0xffffffff
  10004556:  89 7d ec                        mov      dword ptr [ebp - 0x14], edi
  10004559:  3b 05 70 c1 08 10               cmp      eax, dword ptr [0x1008c170]
  1000455F:  74 1a                           je       0x1000457b
  10004561:  89 38                           mov      dword ptr [eax], edi
  10004563:  83 05 6c c1 08 10 04            add      dword ptr [0x1008c16c], 4
  1000456A:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  1000456D:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  10004574:  59                              pop      ecx
  10004575:  5f                              pop      edi
  10004576:  5e                              pop      esi
  10004577:  8b e5                           mov      esp, ebp
  10004579:  5d                              pop      ebp
  1000457A:  c3                              ret      
  1000457B:  8d 4d ec                        lea      ecx, [ebp - 0x14]
  1000457E:  51                              push     ecx
  1000457F:  50                              push     eax
  10004580:  b9 68 c1 08 10                  mov      ecx, 0x1008c168
  10004585:  e8 66 fb ff ff                  call     0x100040f0
  1000458A:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  1000458D:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  10004594:  59                              pop      ecx
  10004595:  5f                              pop      edi
  10004596:  5e                              pop      esi
  10004597:  8b e5                           mov      esp, ebp
  10004599:  5d                              pop      ebp
  1000459A:  c3                              ret      
  1000459B:  e8 60 10 00 00                  call     0x10005600
  100045A0:  6a 00                           push     0
  100045A2:  6a 00                           push     0
  100045A4:  6a 00                           push     0
  100045A6:  6a 00                           push     0
  100045A8:  6a 00                           push     0
  100045AA:  e8 20 c9 02 00                  call     0x10030ecf
  100045AF:  e8 dc eb ff ff                  call     0x10003190
  100045B4:  cc                              int3     
  100045B5:  cc                              int3     
  100045B6:  cc                              int3     
  100045B7:  cc                              int3     
  100045B8:  cc                              int3     
  100045B9:  cc                              int3     
  100045BA:  cc                              int3     
  100045BB:  cc                              int3     
  100045BC:  cc                              int3     
  100045BD:  cc                              int3     
  100045BE:  cc                              int3     
  100045BF:  cc                              int3     
  100045C0:  55                              push     ebp
  100045C1:  8b ec                           mov      ebp, esp
  100045C3:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  100045C6:  83 ec 08                        sub      esp, 8
  100045C9:  53                              push     ebx
  100045CA:  8b 1d 68 c1 08 10               mov      ebx, dword ptr [0x1008c168]
  100045D0:  56                              push     esi
  100045D1:  8b 35 6c c1 08 10               mov      esi, dword ptr [0x1008c16c]
  100045D7:  57                              push     edi
  100045D8:  3b de                           cmp      ebx, esi
  100045DA:  0f 84 bd 00 00 00               je       0x1000469d
  100045E0:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100045E3:  8b 3b                           mov      edi, dword ptr [ebx]
  100045E5:  39 07                           cmp      dword ptr [edi], eax
  100045E7:  75 1b                           jne      0x10004604
  100045E9:  8d 47 04                        lea      eax, [edi + 4]
  100045EC:  85 c9                           test     ecx, ecx
  100045EE:  74 20                           je       0x10004610
  100045F0:  51                              push     ecx
  100045F1:  50                              push     eax
  100045F2:  e8 99 fa ff ff                  call     0x10004090
  100045F7:  83 c4 08                        add      esp, 8
  100045FA:  84 c0                           test     al, al
  100045FC:  75 0f                           jne      0x1000460d
  100045FE:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  10004601:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10004604:  83 c3 04                        add      ebx, 4
  10004607:  3b de                           cmp      ebx, esi
  10004609:  75 d8                           jne      0x100045e3
  1000460B:  eb 15                           jmp      0x10004622
  1000460D:  8d 47 04                        lea      eax, [edi + 4]
  10004610:  8b c8                           mov      ecx, eax
  10004612:  e8 39 fc ff ff                  call     0x10004250
  10004617:  6a 20                           push     0x20
  10004619:  57                              push     edi
  1000461A:  e8 6e 7a 02 00                  call     0x1002c08d
  1000461F:  83 c4 08                        add      esp, 8
  10004622:  3b de                           cmp      ebx, esi
  10004624:  74 77                           je       0x1000469d
  10004626:  8d 7b 04                        lea      edi, [ebx + 4]
  10004629:  3b fe                           cmp      edi, esi
  1000462B:  74 55                           je       0x10004682
  1000462D:  0f 1f 00                        nop      dword ptr [eax]
  10004630:  8b 07                           mov      eax, dword ptr [edi]
  10004632:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10004635:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  10004638:  39 08                           cmp      dword ptr [eax], ecx
  1000463A:  75 34                           jne      0x10004670
  1000463C:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  1000463F:  83 c0 04                        add      eax, 4
  10004642:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10004645:  85 c9                           test     ecx, ecx
  10004647:  74 11                           je       0x1000465a
  10004649:  51                              push     ecx
  1000464A:  50                              push     eax
  1000464B:  e8 40 fa ff ff                  call     0x10004090
  10004650:  83 c4 08                        add      esp, 8
  10004653:  84 c0                           test     al, al
  10004655:  74 19                           je       0x10004670
  10004657:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  1000465A:  8b c8                           mov      ecx, eax
  1000465C:  e8 ef fb ff ff                  call     0x10004250
  10004661:  6a 20                           push     0x20
  10004663:  ff 75 f8                        push     dword ptr [ebp - 8]
  10004666:  e8 22 7a 02 00                  call     0x1002c08d
  1000466B:  83 c4 08                        add      esp, 8
  1000466E:  eb 07                           jmp      0x10004677
  10004670:  8b 07                           mov      eax, dword ptr [edi]
  10004672:  89 03                           mov      dword ptr [ebx], eax
  10004674:  83 c3 04                        add      ebx, 4
  10004677:  83 c7 04                        add      edi, 4
  1000467A:  3b fe                           cmp      edi, esi
  1000467C:  75 b2                           jne      0x10004630
  1000467E:  3b de                           cmp      ebx, esi
  10004680:  74 1b                           je       0x1000469d
  10004682:  8b 3d 6c c1 08 10               mov      edi, dword ptr [0x1008c16c]
  10004688:  2b fe                           sub      edi, esi
  1000468A:  57                              push     edi
  1000468B:  56                              push     esi
  1000468C:  53                              push     ebx
  1000468D:  e8 2e 90 02 00                  call     0x1002d6c0
  10004692:  8d 04 1f                        lea      eax, [edi + ebx]
  10004695:  83 c4 0c                        add      esp, 0xc
  10004698:  a3 6c c1 08 10                  mov      dword ptr [0x1008c16c], eax
  1000469D:  5f                              pop      edi
  1000469E:  5e                              pop      esi
  1000469F:  5b                              pop      ebx
  100046A0:  8b e5                           mov      esp, ebp
  100046A2:  5d                              pop      ebp
  100046A3:  c3                              ret      


; === Chat::DeleteCommand ===
; RVA: 0x000045C0  Size: 228 bytes
; Exports: ?DeleteCommand@Chat@GW@@YAXPAUHookEntry@2@PB_W@Z
;
  100045C0:  55                              push     ebp
  100045C1:  8b ec                           mov      ebp, esp
  100045C3:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  100045C6:  83 ec 08                        sub      esp, 8
  100045C9:  53                              push     ebx
  100045CA:  8b 1d 68 c1 08 10               mov      ebx, dword ptr [0x1008c168]
  100045D0:  56                              push     esi
  100045D1:  8b 35 6c c1 08 10               mov      esi, dword ptr [0x1008c16c]
  100045D7:  57                              push     edi
  100045D8:  3b de                           cmp      ebx, esi
  100045DA:  0f 84 bd 00 00 00               je       0x1000469d
  100045E0:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100045E3:  8b 3b                           mov      edi, dword ptr [ebx]
  100045E5:  39 07                           cmp      dword ptr [edi], eax
  100045E7:  75 1b                           jne      0x10004604
  100045E9:  8d 47 04                        lea      eax, [edi + 4]
  100045EC:  85 c9                           test     ecx, ecx
  100045EE:  74 20                           je       0x10004610
  100045F0:  51                              push     ecx
  100045F1:  50                              push     eax
  100045F2:  e8 99 fa ff ff                  call     0x10004090
  100045F7:  83 c4 08                        add      esp, 8
  100045FA:  84 c0                           test     al, al
  100045FC:  75 0f                           jne      0x1000460d
  100045FE:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  10004601:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10004604:  83 c3 04                        add      ebx, 4
  10004607:  3b de                           cmp      ebx, esi
  10004609:  75 d8                           jne      0x100045e3
  1000460B:  eb 15                           jmp      0x10004622
  1000460D:  8d 47 04                        lea      eax, [edi + 4]
  10004610:  8b c8                           mov      ecx, eax
  10004612:  e8 39 fc ff ff                  call     0x10004250
  10004617:  6a 20                           push     0x20
  10004619:  57                              push     edi
  1000461A:  e8 6e 7a 02 00                  call     0x1002c08d
  1000461F:  83 c4 08                        add      esp, 8
  10004622:  3b de                           cmp      ebx, esi
  10004624:  74 77                           je       0x1000469d
  10004626:  8d 7b 04                        lea      edi, [ebx + 4]
  10004629:  3b fe                           cmp      edi, esi
  1000462B:  74 55                           je       0x10004682
  1000462D:  0f 1f 00                        nop      dword ptr [eax]
  10004630:  8b 07                           mov      eax, dword ptr [edi]
  10004632:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10004635:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  10004638:  39 08                           cmp      dword ptr [eax], ecx
  1000463A:  75 34                           jne      0x10004670
  1000463C:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  1000463F:  83 c0 04                        add      eax, 4
  10004642:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10004645:  85 c9                           test     ecx, ecx
  10004647:  74 11                           je       0x1000465a
  10004649:  51                              push     ecx
  1000464A:  50                              push     eax
  1000464B:  e8 40 fa ff ff                  call     0x10004090
  10004650:  83 c4 08                        add      esp, 8
  10004653:  84 c0                           test     al, al
  10004655:  74 19                           je       0x10004670
  10004657:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  1000465A:  8b c8                           mov      ecx, eax
  1000465C:  e8 ef fb ff ff                  call     0x10004250
  10004661:  6a 20                           push     0x20
  10004663:  ff 75 f8                        push     dword ptr [ebp - 8]
  10004666:  e8 22 7a 02 00                  call     0x1002c08d
  1000466B:  83 c4 08                        add      esp, 8
  1000466E:  eb 07                           jmp      0x10004677
  10004670:  8b 07                           mov      eax, dword ptr [edi]
  10004672:  89 03                           mov      dword ptr [ebx], eax
  10004674:  83 c3 04                        add      ebx, 4
  10004677:  83 c7 04                        add      edi, 4
  1000467A:  3b fe                           cmp      edi, esi
  1000467C:  75 b2                           jne      0x10004630
  1000467E:  3b de                           cmp      ebx, esi
  10004680:  74 1b                           je       0x1000469d
  10004682:  8b 3d 6c c1 08 10               mov      edi, dword ptr [0x1008c16c]
  10004688:  2b fe                           sub      edi, esi
  1000468A:  57                              push     edi
  1000468B:  56                              push     esi
  1000468C:  53                              push     ebx
  1000468D:  e8 2e 90 02 00                  call     0x1002d6c0
  10004692:  8d 04 1f                        lea      eax, [edi + ebx]
  10004695:  83 c4 0c                        add      esp, 0xc
  10004698:  a3 6c c1 08 10                  mov      dword ptr [0x1008c16c], eax
  1000469D:  5f                              pop      edi
  1000469E:  5e                              pop      esi
  1000469F:  5b                              pop      ebx
  100046A0:  8b e5                           mov      esp, ebp
  100046A2:  5d                              pop      ebp
  100046A3:  c3                              ret      


; === Chat::GetChannel ===
; RVA: 0x000046B0  Size: 153 bytes
; Exports: ?GetChannel@Chat@GW@@YA?AW4Channel@12@D@Z
;
  100046B0:  55                              push     ebp
  100046B1:  8b ec                           mov      ebp, esp
  100046B3:  0f be 45 08                     movsx    eax, byte ptr [ebp + 8]
  100046B7:  83 c0 df                        add      eax, -0x21
  100046BA:  83 f8 1f                        cmp      eax, 0x1f
  100046BD:  77 3c                           ja       0x100046fb
  100046BF:  0f b6 80 20 47 00 10            movzx    eax, byte ptr [eax + 0x10004720]
  100046C6:  ff 24 85 00 47 00 10            jmp      dword ptr [eax*4 + 0x10004700]
  100046CD:  b8 03 00 00 00                  mov      eax, 3
  100046D2:  5d                              pop      ebp
  100046D3:  c3                              ret      
  100046D4:  b8 09 00 00 00                  mov      eax, 9
  100046D9:  5d                              pop      ebp
  100046DA:  c3                              ret      
  100046DB:  b8 0b 00 00 00                  mov      eax, 0xb
  100046E0:  5d                              pop      ebp
  100046E1:  c3                              ret      
  100046E2:  b8 0c 00 00 00                  mov      eax, 0xc
  100046E7:  5d                              pop      ebp
  100046E8:  c3                              ret      
  100046E9:  33 c0                           xor      eax, eax
  100046EB:  5d                              pop      ebp
  100046EC:  c3                              ret      
  100046ED:  b8 0e 00 00 00                  mov      eax, 0xe
  100046F2:  5d                              pop      ebp
  100046F3:  c3                              ret      
  100046F4:  b8 10 00 00 00                  mov      eax, 0x10
  100046F9:  5d                              pop      ebp
  100046FA:  c3                              ret      
  100046FB:  83 c8 ff                        or       eax, 0xffffffff
  100046FE:  5d                              pop      ebp
  100046FF:  c3                              ret      
  10004700:  cd 46                           int      0x46
  10004702:  00 10                           add      byte ptr [eax], dl
  10004704:  ed                              in       eax, dx
  10004705:  46                              inc      esi
  10004706:  00 10                           add      byte ptr [eax], dl
  10004708:  db 46 00                        fild     dword ptr [esi]
  1000470B:  10 e2                           adc      dl, ah
  1000470D:  46                              inc      esi
  1000470E:  00 10                           add      byte ptr [eax], dl
  10004710:  e9 46 00 10 f4                  jmp      0x410475b
  10004715:  46                              inc      esi
  10004716:  00 10                           add      byte ptr [eax], dl
  10004718:  d4 46                           aam      0x46
  1000471A:  00 10                           add      byte ptr [eax], dl
  1000471C:  fb                              sti      
  1000471D:  46                              inc      esi
  1000471E:  00 10                           add      byte ptr [eax], dl
  10004720:  00 01                           add      byte ptr [ecx], al
  10004722:  02 03                           add      al, byte ptr [ebx]
  10004724:  04 07                           add      al, 7
  10004726:  07                              pop      es
  10004727:  07                              pop      es
  10004728:  07                              pop      es
  10004729:  07                              pop      es
  1000472A:  07                              pop      es
  1000472B:  07                              pop      es
  1000472C:  07                              pop      es
  1000472D:  07                              pop      es
  1000472E:  05 07 07 07 07                  add      eax, 0x7070707
  10004733:  07                              pop      es
  10004734:  07                              pop      es
  10004735:  07                              pop      es
  10004736:  07                              pop      es
  10004737:  07                              pop      es
  10004738:  07                              pop      es
  10004739:  07                              pop      es
  1000473A:  07                              pop      es
  1000473B:  07                              pop      es
  1000473C:  07                              pop      es
  1000473D:  07                              pop      es
  1000473E:  07                              pop      es
  1000473F:  06                              push     es
  10004740:  55                              push     ebp
  10004741:  8b ec                           mov      ebp, esp
  10004743:  5d                              pop      ebp
  10004744:  e9 67 ff ff ff                  jmp      0x100046b0


; === Chat::GetChannel, GetChannelFromChar, GetChannelFromWChar ===
; RVA: 0x00004740  Size: 9 bytes
; Exports: ?GetChannel@Chat@GW@@YA?AW4Channel@12@_W@Z, GetChannelFromChar, GetChannelFromWChar
;
  10004740:  55                              push     ebp
  10004741:  8b ec                           mov      ebp, esp
  10004743:  5d                              pop      ebp
  10004744:  e9 67 ff ff ff                  jmp      0x100046b0


; === Chat::GetChannelColors, GetChannelColors ===
; RVA: 0x00004750  Size: 57 bytes
; Exports: ?GetChannelColors@Chat@GW@@YAXW4Channel@12@PAI1@Z, GetChannelColors
;
  10004750:  55                              push     ebp
  10004751:  8b ec                           mov      ebp, esp
  10004753:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10004756:  85 c0                           test     eax, eax
  10004758:  74 13                           je       0x1000476d
  1000475A:  8b 0d dc c0 08 10               mov      ecx, dword ptr [0x1008c0dc]
  10004760:  85 c9                           test     ecx, ecx
  10004762:  74 09                           je       0x1000476d
  10004764:  ff 75 08                        push     dword ptr [ebp + 8]
  10004767:  50                              push     eax
  10004768:  ff d1                           call     ecx
  1000476A:  83 c4 08                        add      esp, 8
  1000476D:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  10004770:  85 c0                           test     eax, eax
  10004772:  74 13                           je       0x10004787
  10004774:  8b 0d e4 c0 08 10               mov      ecx, dword ptr [0x1008c0e4]
  1000477A:  85 c9                           test     ecx, ecx
  1000477C:  74 09                           je       0x10004787
  1000477E:  ff 75 08                        push     dword ptr [ebp + 8]
  10004781:  50                              push     eax
  10004782:  ff d1                           call     ecx
  10004784:  83 c4 08                        add      esp, 8
  10004787:  5d                              pop      ebp
  10004788:  c3                              ret      


; === Chat::GetChatLog, GetChatLog ===
; RVA: 0x00004790  Size: 15 bytes
; Exports: ?GetChatLog@Chat@GW@@YAPAUChatBuffer@12@XZ, GetChatLog
;
  10004790:  a1 3c c1 08 10                  mov      eax, dword ptr [0x1008c13c]
  10004795:  85 c0                           test     eax, eax
  10004797:  74 03                           je       0x1000479c
  10004799:  8b 00                           mov      eax, dword ptr [eax]
  1000479B:  c3                              ret      
  1000479C:  33 c0                           xor      eax, eax
  1000479E:  c3                              ret      


; === Chat::GetDefaultColors, GetDefaultColors ===
; RVA: 0x000047A0  Size: 57 bytes
; Exports: ?GetDefaultColors@Chat@GW@@YAXW4Channel@12@PAI1@Z, GetDefaultColors
;
  100047A0:  55                              push     ebp
  100047A1:  8b ec                           mov      ebp, esp
  100047A3:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  100047A6:  85 c0                           test     eax, eax
  100047A8:  74 13                           je       0x100047bd
  100047AA:  8b 0d e0 c0 08 10               mov      ecx, dword ptr [0x1008c0e0]
  100047B0:  85 c9                           test     ecx, ecx
  100047B2:  74 09                           je       0x100047bd
  100047B4:  ff 75 08                        push     dword ptr [ebp + 8]
  100047B7:  50                              push     eax
  100047B8:  ff d1                           call     ecx
  100047BA:  83 c4 08                        add      esp, 8
  100047BD:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  100047C0:  85 c0                           test     eax, eax
  100047C2:  74 13                           je       0x100047d7
  100047C4:  8b 0d e8 c0 08 10               mov      ecx, dword ptr [0x1008c0e8]
  100047CA:  85 c9                           test     ecx, ecx
  100047CC:  74 09                           je       0x100047d7
  100047CE:  ff 75 08                        push     dword ptr [ebp + 8]
  100047D1:  50                              push     eax
  100047D2:  ff d1                           call     ecx
  100047D4:  83 c4 08                        add      esp, 8
  100047D7:  5d                              pop      ebp
  100047D8:  c3                              ret      


; === Chat::GetIsTyping, GetIsTyping ===
; RVA: 0x000047E0  Size: 20 bytes
; Exports: ?GetIsTyping@Chat@GW@@YA_NXZ, GetIsTyping
;
  100047E0:  a1 40 c1 08 10                  mov      eax, dword ptr [0x1008c140]
  100047E5:  85 c0                           test     eax, eax
  100047E7:  74 08                           je       0x100047f1
  100047E9:  83 38 00                        cmp      dword ptr [eax], 0
  100047EC:  74 03                           je       0x100047f1
  100047EE:  b0 01                           mov      al, 1
  100047F0:  c3                              ret      
  100047F1:  32 c0                           xor      al, al
  100047F3:  c3                              ret      


; === Chat::SendChat ===
; RVA: 0x00004F70  Size: 602 bytes
; Exports: ?SendChat@Chat@GW@@YA_NDPBD@Z
;
  10004F70:  55                              push     ebp
  10004F71:  8b ec                           mov      ebp, esp
  10004F73:  81 ec 1c 01 00 00               sub      esp, 0x11c
  10004F79:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  10004F7E:  33 c5                           xor      eax, ebp
  10004F80:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10004F83:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10004F86:  50                              push     eax
  10004F87:  68 6c ca 04 10                  push     0x1004ca6c
  10004F8C:  8d 85 e4 fe ff ff               lea      eax, [ebp - 0x11c]
  10004F92:  68 8c 00 00 00                  push     0x8c
  10004F97:  50                              push     eax
  10004F98:  e8 43 07 00 00                  call     0x100056e0
  10004F9D:  83 c4 10                        add      esp, 0x10
  10004FA0:  8d 48 ff                        lea      ecx, [eax - 1]
  10004FA3:  81 f9 8a 00 00 00               cmp      ecx, 0x8a
  10004FA9:  77 33                           ja       0x10004fde
  10004FAB:  03 c0                           add      eax, eax
  10004FAD:  3d 18 01 00 00                  cmp      eax, 0x118
  10004FB2:  73 3a                           jae      0x10004fee
  10004FB4:  33 c9                           xor      ecx, ecx
  10004FB6:  66 89 8c 05 e4 fe ff ff         mov      word ptr [ebp + eax - 0x11c], cx
  10004FBE:  8d 85 e4 fe ff ff               lea      eax, [ebp - 0x11c]
  10004FC4:  50                              push     eax
  10004FC5:  ff 75 08                        push     dword ptr [ebp + 8]
  10004FC8:  e8 33 00 00 00                  call     0x10005000  ; Chat::SendChat
  10004FCD:  83 c4 08                        add      esp, 8
  10004FD0:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10004FD3:  33 cd                           xor      ecx, ebp
  10004FD5:  e8 dd 73 02 00                  call     0x1002c3b7
  10004FDA:  8b e5                           mov      esp, ebp
  10004FDC:  5d                              pop      ebp
  10004FDD:  c3                              ret      
  10004FDE:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10004FE1:  32 c0                           xor      al, al
  10004FE3:  33 cd                           xor      ecx, ebp
  10004FE5:  e8 cd 73 02 00                  call     0x1002c3b7
  10004FEA:  8b e5                           mov      esp, ebp
  10004FEC:  5d                              pop      ebp
  10004FED:  c3                              ret      
  10004FEE:  e8 03 75 02 00                  call     0x1002c4f6
  10004FF3:  cc                              int3     
  10004FF4:  cc                              int3     
  10004FF5:  cc                              int3     
  10004FF6:  cc                              int3     
  10004FF7:  cc                              int3     
  10004FF8:  cc                              int3     
  10004FF9:  cc                              int3     
  10004FFA:  cc                              int3     
  10004FFB:  cc                              int3     
  10004FFC:  cc                              int3     
  10004FFD:  cc                              int3     
  10004FFE:  cc                              int3     
  10004FFF:  cc                              int3     
  10005000:  55                              push     ebp
  10005001:  8b ec                           mov      ebp, esp
  10005003:  81 ec 1c 01 00 00               sub      esp, 0x11c
  10005009:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1000500E:  33 c5                           xor      eax, ebp
  10005010:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10005013:  83 3d ec c0 08 10 00            cmp      dword ptr [0x1008c0ec], 0
  1000501A:  53                              push     ebx
  1000501B:  57                              push     edi
  1000501C:  8b 7d 0c                        mov      edi, dword ptr [ebp + 0xc]
  1000501F:  0f 84 9d 00 00 00               je       0x100050c2
  10005025:  85 ff                           test     edi, edi
  10005027:  0f 84 95 00 00 00               je       0x100050c2
  1000502D:  66 83 3f 00                     cmp      word ptr [edi], 0
  10005031:  0f 84 8b 00 00 00               je       0x100050c2
  10005037:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  1000503A:  53                              push     ebx
  1000503B:  e8 70 f6 ff ff                  call     0x100046b0  ; Chat::GetChannel
  10005040:  83 c4 04                        add      esp, 4
  10005043:  83 f8 ff                        cmp      eax, -1
  10005046:  74 7a                           je       0x100050c2
  10005048:  56                              push     esi
  10005049:  8b f7                           mov      esi, edi
  1000504B:  8d 4e 02                        lea      ecx, [esi + 2]
  1000504E:  66 90                           nop      
  10005050:  66 8b 06                        mov      ax, word ptr [esi]
  10005053:  83 c6 02                        add      esi, 2
  10005056:  66 85 c0                        test     ax, ax
  10005059:  75 f5                           jne      0x10005050
  1000505B:  2b f1                           sub      esi, ecx
  1000505D:  b8 78 00 00 00                  mov      eax, 0x78
  10005062:  d1 fe                           sar      esi, 1
  10005064:  3b f0                           cmp      esi, eax
  10005066:  0f 47 f0                        cmova    esi, eax
  10005069:  66 0f be c3                     movsx    ax, bl
  1000506D:  56                              push     esi
  1000506E:  57                              push     edi
  1000506F:  66 89 85 e4 fe ff ff            mov      word ptr [ebp - 0x11c], ax
  10005076:  8d 85 e6 fe ff ff               lea      eax, [ebp - 0x11a]
  1000507C:  50                              push     eax
  1000507D:  e8 4e c4 02 00                  call     0x100314d0
  10005082:  8d 34 75 02 00 00 00            lea      esi, [esi*2 + 2]
  10005089:  83 c4 0c                        add      esp, 0xc
  1000508C:  81 fe 18 01 00 00               cmp      esi, 0x118
  10005092:  73 40                           jae      0x100050d4
  10005094:  33 c0                           xor      eax, eax
  10005096:  50                              push     eax
  10005097:  66 89 84 35 e4 fe ff ff         mov      word ptr [ebp + esi - 0x11c], ax
  1000509F:  8d 85 e4 fe ff ff               lea      eax, [ebp - 0x11c]
  100050A5:  50                              push     eax
  100050A6:  ff 15 ec c0 08 10               call     dword ptr [0x1008c0ec]
  100050AC:  83 c4 08                        add      esp, 8
  100050AF:  b0 01                           mov      al, 1
  100050B1:  5e                              pop      esi
  100050B2:  5f                              pop      edi
  100050B3:  5b                              pop      ebx
  100050B4:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  100050B7:  33 cd                           xor      ecx, ebp
  100050B9:  e8 f9 72 02 00                  call     0x1002c3b7
  100050BE:  8b e5                           mov      esp, ebp
  100050C0:  5d                              pop      ebp
  100050C1:  c3                              ret      
  100050C2:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  100050C5:  32 c0                           xor      al, al
  100050C7:  5f                              pop      edi
  100050C8:  33 cd                           xor      ecx, ebp
  100050CA:  5b                              pop      ebx
  100050CB:  e8 e7 72 02 00                  call     0x1002c3b7
  100050D0:  8b e5                           mov      esp, ebp
  100050D2:  5d                              pop      ebp
  100050D3:  c3                              ret      
  100050D4:  e8 1d 74 02 00                  call     0x1002c4f6
  100050D9:  cc                              int3     
  100050DA:  cc                              int3     
  100050DB:  cc                              int3     
  100050DC:  cc                              int3     
  100050DD:  cc                              int3     
  100050DE:  cc                              int3     
  100050DF:  cc                              int3     
  100050E0:  55                              push     ebp
  100050E1:  8b ec                           mov      ebp, esp
  100050E3:  81 ec 1c 01 00 00               sub      esp, 0x11c
  100050E9:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  100050EE:  33 c5                           xor      eax, ebp
  100050F0:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  100050F3:  83 3d ec c0 08 10 00            cmp      dword ptr [0x1008c0ec], 0
  100050FA:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100050FD:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  10005100:  74 6e                           je       0x10005170
  10005102:  85 c0                           test     eax, eax
  10005104:  74 6a                           je       0x10005170
  10005106:  66 83 38 00                     cmp      word ptr [eax], 0
  1000510A:  74 64                           je       0x10005170
  1000510C:  85 c9                           test     ecx, ecx
  1000510E:  74 60                           je       0x10005170
  10005110:  66 83 39 00                     cmp      word ptr [ecx], 0
  10005114:  74 5a                           je       0x10005170
  10005116:  51                              push     ecx
  10005117:  50                              push     eax
  10005118:  68 74 ca 04 10                  push     0x1004ca74
  1000511D:  8d 85 e4 fe ff ff               lea      eax, [ebp - 0x11c]
  10005123:  68 8c 00 00 00                  push     0x8c
  10005128:  50                              push     eax
  10005129:  e8 b2 05 00 00                  call     0x100056e0
  1000512E:  83 c4 14                        add      esp, 0x14
  10005131:  8d 48 ff                        lea      ecx, [eax - 1]
  10005134:  81 f9 8a 00 00 00               cmp      ecx, 0x8a
  1000513A:  77 34                           ja       0x10005170
  1000513C:  03 c0                           add      eax, eax
  1000513E:  3d 18 01 00 00                  cmp      eax, 0x118
  10005143:  73 3b                           jae      0x10005180
  10005145:  33 c9                           xor      ecx, ecx
  10005147:  66 89 8c 05 e4 fe ff ff         mov      word ptr [ebp + eax - 0x11c], cx
  1000514F:  8d 85 e4 fe ff ff               lea      eax, [ebp - 0x11c]
  10005155:  51                              push     ecx
  10005156:  50                              push     eax
  10005157:  ff 15 ec c0 08 10               call     dword ptr [0x1008c0ec]
  1000515D:  83 c4 08                        add      esp, 8
  10005160:  b0 01                           mov      al, 1
  10005162:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10005165:  33 cd                           xor      ecx, ebp
  10005167:  e8 4b 72 02 00                  call     0x1002c3b7
  1000516C:  8b e5                           mov      esp, ebp
  1000516E:  5d                              pop      ebp
  1000516F:  c3                              ret      
  10005170:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10005173:  32 c0                           xor      al, al
  10005175:  33 cd                           xor      ecx, ebp
  10005177:  e8 3b 72 02 00                  call     0x1002c3b7
  1000517C:  8b e5                           mov      esp, ebp
  1000517E:  5d                              pop      ebp
  1000517F:  c3                              ret      
  10005180:  e8 71 73 02 00                  call     0x1002c4f6
  10005185:  cc                              int3     
  10005186:  cc                              int3     
  10005187:  cc                              int3     
  10005188:  cc                              int3     
  10005189:  cc                              int3     
  1000518A:  cc                              int3     
  1000518B:  cc                              int3     
  1000518C:  cc                              int3     
  1000518D:  cc                              int3     
  1000518E:  cc                              int3     
  1000518F:  cc                              int3     
  10005190:  55                              push     ebp
  10005191:  8b ec                           mov      ebp, esp
  10005193:  51                              push     ecx
  10005194:  a1 e4 c0 08 10                  mov      eax, dword ptr [0x1008c0e4]
  10005199:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  100051A0:  85 c0                           test     eax, eax
  100051A2:  74 0c                           je       0x100051b0
  100051A4:  ff 75 08                        push     dword ptr [ebp + 8]
  100051A7:  8d 4d fc                        lea      ecx, [ebp - 4]
  100051AA:  51                              push     ecx
  100051AB:  ff d0                           call     eax
  100051AD:  83 c4 08                        add      esp, 8
  100051B0:  8d 45 08                        lea      eax, [ebp + 8]
  100051B3:  b9 4c c1 08 10                  mov      ecx, 0x1008c14c
  100051B8:  50                              push     eax
  100051B9:  e8 f2 f0 ff ff                  call     0x100042b0
  100051BE:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  100051C1:  89 08                           mov      dword ptr [eax], ecx
  100051C3:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  100051C6:  8b e5                           mov      esp, ebp
  100051C8:  5d                              pop      ebp
  100051C9:  c3                              ret      


; === Chat::SendChat ===
; RVA: 0x00005000  Size: 458 bytes
; Exports: ?SendChat@Chat@GW@@YA_NDPB_W@Z
;
  10005000:  55                              push     ebp
  10005001:  8b ec                           mov      ebp, esp
  10005003:  81 ec 1c 01 00 00               sub      esp, 0x11c
  10005009:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1000500E:  33 c5                           xor      eax, ebp
  10005010:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10005013:  83 3d ec c0 08 10 00            cmp      dword ptr [0x1008c0ec], 0
  1000501A:  53                              push     ebx
  1000501B:  57                              push     edi
  1000501C:  8b 7d 0c                        mov      edi, dword ptr [ebp + 0xc]
  1000501F:  0f 84 9d 00 00 00               je       0x100050c2
  10005025:  85 ff                           test     edi, edi
  10005027:  0f 84 95 00 00 00               je       0x100050c2
  1000502D:  66 83 3f 00                     cmp      word ptr [edi], 0
  10005031:  0f 84 8b 00 00 00               je       0x100050c2
  10005037:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  1000503A:  53                              push     ebx
  1000503B:  e8 70 f6 ff ff                  call     0x100046b0  ; Chat::GetChannel
  10005040:  83 c4 04                        add      esp, 4
  10005043:  83 f8 ff                        cmp      eax, -1
  10005046:  74 7a                           je       0x100050c2
  10005048:  56                              push     esi
  10005049:  8b f7                           mov      esi, edi
  1000504B:  8d 4e 02                        lea      ecx, [esi + 2]
  1000504E:  66 90                           nop      
  10005050:  66 8b 06                        mov      ax, word ptr [esi]
  10005053:  83 c6 02                        add      esi, 2
  10005056:  66 85 c0                        test     ax, ax
  10005059:  75 f5                           jne      0x10005050
  1000505B:  2b f1                           sub      esi, ecx
  1000505D:  b8 78 00 00 00                  mov      eax, 0x78
  10005062:  d1 fe                           sar      esi, 1
  10005064:  3b f0                           cmp      esi, eax
  10005066:  0f 47 f0                        cmova    esi, eax
  10005069:  66 0f be c3                     movsx    ax, bl
  1000506D:  56                              push     esi
  1000506E:  57                              push     edi
  1000506F:  66 89 85 e4 fe ff ff            mov      word ptr [ebp - 0x11c], ax
  10005076:  8d 85 e6 fe ff ff               lea      eax, [ebp - 0x11a]
  1000507C:  50                              push     eax
  1000507D:  e8 4e c4 02 00                  call     0x100314d0
  10005082:  8d 34 75 02 00 00 00            lea      esi, [esi*2 + 2]
  10005089:  83 c4 0c                        add      esp, 0xc
  1000508C:  81 fe 18 01 00 00               cmp      esi, 0x118
  10005092:  73 40                           jae      0x100050d4
  10005094:  33 c0                           xor      eax, eax
  10005096:  50                              push     eax
  10005097:  66 89 84 35 e4 fe ff ff         mov      word ptr [ebp + esi - 0x11c], ax
  1000509F:  8d 85 e4 fe ff ff               lea      eax, [ebp - 0x11c]
  100050A5:  50                              push     eax
  100050A6:  ff 15 ec c0 08 10               call     dword ptr [0x1008c0ec]
  100050AC:  83 c4 08                        add      esp, 8
  100050AF:  b0 01                           mov      al, 1
  100050B1:  5e                              pop      esi
  100050B2:  5f                              pop      edi
  100050B3:  5b                              pop      ebx
  100050B4:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  100050B7:  33 cd                           xor      ecx, ebp
  100050B9:  e8 f9 72 02 00                  call     0x1002c3b7
  100050BE:  8b e5                           mov      esp, ebp
  100050C0:  5d                              pop      ebp
  100050C1:  c3                              ret      
  100050C2:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  100050C5:  32 c0                           xor      al, al
  100050C7:  5f                              pop      edi
  100050C8:  33 cd                           xor      ecx, ebp
  100050CA:  5b                              pop      ebx
  100050CB:  e8 e7 72 02 00                  call     0x1002c3b7
  100050D0:  8b e5                           mov      esp, ebp
  100050D2:  5d                              pop      ebp
  100050D3:  c3                              ret      
  100050D4:  e8 1d 74 02 00                  call     0x1002c4f6
  100050D9:  cc                              int3     
  100050DA:  cc                              int3     
  100050DB:  cc                              int3     
  100050DC:  cc                              int3     
  100050DD:  cc                              int3     
  100050DE:  cc                              int3     
  100050DF:  cc                              int3     
  100050E0:  55                              push     ebp
  100050E1:  8b ec                           mov      ebp, esp
  100050E3:  81 ec 1c 01 00 00               sub      esp, 0x11c
  100050E9:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  100050EE:  33 c5                           xor      eax, ebp
  100050F0:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  100050F3:  83 3d ec c0 08 10 00            cmp      dword ptr [0x1008c0ec], 0
  100050FA:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100050FD:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  10005100:  74 6e                           je       0x10005170
  10005102:  85 c0                           test     eax, eax
  10005104:  74 6a                           je       0x10005170
  10005106:  66 83 38 00                     cmp      word ptr [eax], 0
  1000510A:  74 64                           je       0x10005170
  1000510C:  85 c9                           test     ecx, ecx
  1000510E:  74 60                           je       0x10005170
  10005110:  66 83 39 00                     cmp      word ptr [ecx], 0
  10005114:  74 5a                           je       0x10005170
  10005116:  51                              push     ecx
  10005117:  50                              push     eax
  10005118:  68 74 ca 04 10                  push     0x1004ca74
  1000511D:  8d 85 e4 fe ff ff               lea      eax, [ebp - 0x11c]
  10005123:  68 8c 00 00 00                  push     0x8c
  10005128:  50                              push     eax
  10005129:  e8 b2 05 00 00                  call     0x100056e0
  1000512E:  83 c4 14                        add      esp, 0x14
  10005131:  8d 48 ff                        lea      ecx, [eax - 1]
  10005134:  81 f9 8a 00 00 00               cmp      ecx, 0x8a
  1000513A:  77 34                           ja       0x10005170
  1000513C:  03 c0                           add      eax, eax
  1000513E:  3d 18 01 00 00                  cmp      eax, 0x118
  10005143:  73 3b                           jae      0x10005180
  10005145:  33 c9                           xor      ecx, ecx
  10005147:  66 89 8c 05 e4 fe ff ff         mov      word ptr [ebp + eax - 0x11c], cx
  1000514F:  8d 85 e4 fe ff ff               lea      eax, [ebp - 0x11c]
  10005155:  51                              push     ecx
  10005156:  50                              push     eax
  10005157:  ff 15 ec c0 08 10               call     dword ptr [0x1008c0ec]
  1000515D:  83 c4 08                        add      esp, 8
  10005160:  b0 01                           mov      al, 1
  10005162:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10005165:  33 cd                           xor      ecx, ebp
  10005167:  e8 4b 72 02 00                  call     0x1002c3b7
  1000516C:  8b e5                           mov      esp, ebp
  1000516E:  5d                              pop      ebp
  1000516F:  c3                              ret      
  10005170:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10005173:  32 c0                           xor      al, al
  10005175:  33 cd                           xor      ecx, ebp
  10005177:  e8 3b 72 02 00                  call     0x1002c3b7
  1000517C:  8b e5                           mov      esp, ebp
  1000517E:  5d                              pop      ebp
  1000517F:  c3                              ret      
  10005180:  e8 71 73 02 00                  call     0x1002c4f6
  10005185:  cc                              int3     
  10005186:  cc                              int3     
  10005187:  cc                              int3     
  10005188:  cc                              int3     
  10005189:  cc                              int3     
  1000518A:  cc                              int3     
  1000518B:  cc                              int3     
  1000518C:  cc                              int3     
  1000518D:  cc                              int3     
  1000518E:  cc                              int3     
  1000518F:  cc                              int3     
  10005190:  55                              push     ebp
  10005191:  8b ec                           mov      ebp, esp
  10005193:  51                              push     ecx
  10005194:  a1 e4 c0 08 10                  mov      eax, dword ptr [0x1008c0e4]
  10005199:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  100051A0:  85 c0                           test     eax, eax
  100051A2:  74 0c                           je       0x100051b0
  100051A4:  ff 75 08                        push     dword ptr [ebp + 8]
  100051A7:  8d 4d fc                        lea      ecx, [ebp - 4]
  100051AA:  51                              push     ecx
  100051AB:  ff d0                           call     eax
  100051AD:  83 c4 08                        add      esp, 8
  100051B0:  8d 45 08                        lea      eax, [ebp + 8]
  100051B3:  b9 4c c1 08 10                  mov      ecx, 0x1008c14c
  100051B8:  50                              push     eax
  100051B9:  e8 f2 f0 ff ff                  call     0x100042b0
  100051BE:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  100051C1:  89 08                           mov      dword ptr [eax], ecx
  100051C3:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  100051C6:  8b e5                           mov      esp, ebp
  100051C8:  5d                              pop      ebp
  100051C9:  c3                              ret      


; === Chat::SendChat ===
; RVA: 0x000050E0  Size: 234 bytes
; Exports: ?SendChat@Chat@GW@@YA_NPB_W0@Z
;
  100050E0:  55                              push     ebp
  100050E1:  8b ec                           mov      ebp, esp
  100050E3:  81 ec 1c 01 00 00               sub      esp, 0x11c
  100050E9:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  100050EE:  33 c5                           xor      eax, ebp
  100050F0:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  100050F3:  83 3d ec c0 08 10 00            cmp      dword ptr [0x1008c0ec], 0
  100050FA:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100050FD:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  10005100:  74 6e                           je       0x10005170
  10005102:  85 c0                           test     eax, eax
  10005104:  74 6a                           je       0x10005170
  10005106:  66 83 38 00                     cmp      word ptr [eax], 0
  1000510A:  74 64                           je       0x10005170
  1000510C:  85 c9                           test     ecx, ecx
  1000510E:  74 60                           je       0x10005170
  10005110:  66 83 39 00                     cmp      word ptr [ecx], 0
  10005114:  74 5a                           je       0x10005170
  10005116:  51                              push     ecx
  10005117:  50                              push     eax
  10005118:  68 74 ca 04 10                  push     0x1004ca74
  1000511D:  8d 85 e4 fe ff ff               lea      eax, [ebp - 0x11c]
  10005123:  68 8c 00 00 00                  push     0x8c
  10005128:  50                              push     eax
  10005129:  e8 b2 05 00 00                  call     0x100056e0
  1000512E:  83 c4 14                        add      esp, 0x14
  10005131:  8d 48 ff                        lea      ecx, [eax - 1]
  10005134:  81 f9 8a 00 00 00               cmp      ecx, 0x8a
  1000513A:  77 34                           ja       0x10005170
  1000513C:  03 c0                           add      eax, eax
  1000513E:  3d 18 01 00 00                  cmp      eax, 0x118
  10005143:  73 3b                           jae      0x10005180
  10005145:  33 c9                           xor      ecx, ecx
  10005147:  66 89 8c 05 e4 fe ff ff         mov      word ptr [ebp + eax - 0x11c], cx
  1000514F:  8d 85 e4 fe ff ff               lea      eax, [ebp - 0x11c]
  10005155:  51                              push     ecx
  10005156:  50                              push     eax
  10005157:  ff 15 ec c0 08 10               call     dword ptr [0x1008c0ec]
  1000515D:  83 c4 08                        add      esp, 8
  10005160:  b0 01                           mov      al, 1
  10005162:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10005165:  33 cd                           xor      ecx, ebp
  10005167:  e8 4b 72 02 00                  call     0x1002c3b7
  1000516C:  8b e5                           mov      esp, ebp
  1000516E:  5d                              pop      ebp
  1000516F:  c3                              ret      
  10005170:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10005173:  32 c0                           xor      al, al
  10005175:  33 cd                           xor      ecx, ebp
  10005177:  e8 3b 72 02 00                  call     0x1002c3b7
  1000517C:  8b e5                           mov      esp, ebp
  1000517E:  5d                              pop      ebp
  1000517F:  c3                              ret      
  10005180:  e8 71 73 02 00                  call     0x1002c4f6
  10005185:  cc                              int3     
  10005186:  cc                              int3     
  10005187:  cc                              int3     
  10005188:  cc                              int3     
  10005189:  cc                              int3     
  1000518A:  cc                              int3     
  1000518B:  cc                              int3     
  1000518C:  cc                              int3     
  1000518D:  cc                              int3     
  1000518E:  cc                              int3     
  1000518F:  cc                              int3     
  10005190:  55                              push     ebp
  10005191:  8b ec                           mov      ebp, esp
  10005193:  51                              push     ecx
  10005194:  a1 e4 c0 08 10                  mov      eax, dword ptr [0x1008c0e4]
  10005199:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  100051A0:  85 c0                           test     eax, eax
  100051A2:  74 0c                           je       0x100051b0
  100051A4:  ff 75 08                        push     dword ptr [ebp + 8]
  100051A7:  8d 4d fc                        lea      ecx, [ebp - 4]
  100051AA:  51                              push     ecx
  100051AB:  ff d0                           call     eax
  100051AD:  83 c4 08                        add      esp, 8
  100051B0:  8d 45 08                        lea      eax, [ebp + 8]
  100051B3:  b9 4c c1 08 10                  mov      ecx, 0x1008c14c
  100051B8:  50                              push     eax
  100051B9:  e8 f2 f0 ff ff                  call     0x100042b0
  100051BE:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  100051C1:  89 08                           mov      dword ptr [eax], ecx
  100051C3:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  100051C6:  8b e5                           mov      esp, ebp
  100051C8:  5d                              pop      ebp
  100051C9:  c3                              ret      


; === Chat::SetMessageColor ===
; RVA: 0x00005190  Size: 58 bytes
; Exports: ?SetMessageColor@Chat@GW@@YAIW4Channel@12@I@Z
;
  10005190:  55                              push     ebp
  10005191:  8b ec                           mov      ebp, esp
  10005193:  51                              push     ecx
  10005194:  a1 e4 c0 08 10                  mov      eax, dword ptr [0x1008c0e4]
  10005199:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  100051A0:  85 c0                           test     eax, eax
  100051A2:  74 0c                           je       0x100051b0
  100051A4:  ff 75 08                        push     dword ptr [ebp + 8]
  100051A7:  8d 4d fc                        lea      ecx, [ebp - 4]
  100051AA:  51                              push     ecx
  100051AB:  ff d0                           call     eax
  100051AD:  83 c4 08                        add      esp, 8
  100051B0:  8d 45 08                        lea      eax, [ebp + 8]
  100051B3:  b9 4c c1 08 10                  mov      ecx, 0x1008c14c
  100051B8:  50                              push     eax
  100051B9:  e8 f2 f0 ff ff                  call     0x100042b0
  100051BE:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  100051C1:  89 08                           mov      dword ptr [eax], ecx
  100051C3:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  100051C6:  8b e5                           mov      esp, ebp
  100051C8:  5d                              pop      ebp
  100051C9:  c3                              ret      


; === Chat::SetSenderColor ===
; RVA: 0x000051D0  Size: 58 bytes
; Exports: ?SetSenderColor@Chat@GW@@YAIW4Channel@12@I@Z
;
  100051D0:  55                              push     ebp
  100051D1:  8b ec                           mov      ebp, esp
  100051D3:  51                              push     ecx
  100051D4:  a1 dc c0 08 10                  mov      eax, dword ptr [0x1008c0dc]
  100051D9:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  100051E0:  85 c0                           test     eax, eax
  100051E2:  74 0c                           je       0x100051f0
  100051E4:  ff 75 08                        push     dword ptr [ebp + 8]
  100051E7:  8d 4d fc                        lea      ecx, [ebp - 4]
  100051EA:  51                              push     ecx
  100051EB:  ff d0                           call     eax
  100051ED:  83 c4 08                        add      esp, 8
  100051F0:  8d 45 08                        lea      eax, [ebp + 8]
  100051F3:  b9 44 c1 08 10                  mov      ecx, 0x1008c144
  100051F8:  50                              push     eax
  100051F9:  e8 b2 f0 ff ff                  call     0x100042b0
  100051FE:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  10005201:  89 08                           mov      dword ptr [eax], ecx
  10005203:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  10005206:  8b e5                           mov      esp, ebp
  10005208:  5d                              pop      ebp
  10005209:  c3                              ret      


; === Chat::SetTimestampsColor, SetTimestampsColor ===
; RVA: 0x00005210  Size: 37 bytes
; Exports: ?SetTimestampsColor@Chat@GW@@YAXI@Z, SetTimestampsColor
;
  10005210:  55                              push     ebp
  10005211:  8b ec                           mov      ebp, esp
  10005213:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10005216:  6a 00                           push     0
  10005218:  83 ec 28                        sub      esp, 0x28
  1000521B:  a3 48 a0 08 10                  mov      dword ptr [0x1008a048], eax
  10005220:  8b c4                           mov      eax, esp
  10005222:  c7 00 50 cc 04 10               mov      dword ptr [eax], 0x1004cc50
  10005228:  89 40 24                        mov      dword ptr [eax + 0x24], eax
  1000522B:  e8 10 4e 01 00                  call     0x1001a040  ; GameThread::Enqueue
  10005230:  83 c4 2c                        add      esp, 0x2c
  10005233:  5d                              pop      ebp
  10005234:  c3                              ret      


; === Chat::SetTimestampsFormat, SetTimestampsFormat ===
; RVA: 0x00005240  Size: 45 bytes
; Exports: ?SetTimestampsFormat@Chat@GW@@YAX_N0@Z, SetTimestampsFormat
;
  10005240:  55                              push     ebp
  10005241:  8b ec                           mov      ebp, esp
  10005243:  8a 45 08                        mov      al, byte ptr [ebp + 8]
  10005246:  a2 36 c1 08 10                  mov      byte ptr [0x1008c136], al
  1000524B:  8a 45 0c                        mov      al, byte ptr [ebp + 0xc]
  1000524E:  6a 00                           push     0
  10005250:  83 ec 28                        sub      esp, 0x28
  10005253:  a2 37 c1 08 10                  mov      byte ptr [0x1008c137], al
  10005258:  8b c4                           mov      eax, esp
  1000525A:  c7 00 50 cc 04 10               mov      dword ptr [eax], 0x1004cc50
  10005260:  89 40 24                        mov      dword ptr [eax + 0x24], eax
  10005263:  e8 d8 4d 01 00                  call     0x1001a040  ; GameThread::Enqueue
  10005268:  83 c4 2c                        add      esp, 0x2c
  1000526B:  5d                              pop      ebp
  1000526C:  c3                              ret      


; === Chat::ToggleTimestamps, ToggleTimestamps ===
; RVA: 0x00005270  Size: 18 bytes
; Exports: ?ToggleTimestamps@Chat@GW@@YAX_N@Z, ToggleTimestamps
;
  10005270:  55                              push     ebp
  10005271:  8b ec                           mov      ebp, esp
  10005273:  ff 75 08                        push     dword ptr [ebp + 8]
  10005276:  6a 56                           push     0x56
  10005278:  e8 63 33 02 00                  call     0x100285e0  ; UI::SetPreference
  1000527D:  83 c4 08                        add      esp, 8
  10005280:  5d                              pop      ebp
  10005281:  c3                              ret      


; === Chat::WriteChat ===
; RVA: 0x00005290  Size: 264 bytes
; Exports: ?WriteChat@Chat@GW@@YAXW4Channel@12@PB_W1_N@Z
;
  10005290:  55                              push     ebp
  10005291:  8b ec                           mov      ebp, esp
  10005293:  51                              push     ecx
  10005294:  57                              push     edi
  10005295:  8b 7d 0c                        mov      edi, dword ptr [ebp + 0xc]
  10005298:  8b c7                           mov      eax, edi
  1000529A:  8d 50 02                        lea      edx, [eax + 2]
  1000529D:  0f 1f 00                        nop      dword ptr [eax]
  100052A0:  66 8b 08                        mov      cx, word ptr [eax]
  100052A3:  83 c0 02                        add      eax, 2
  100052A6:  66 85 c9                        test     cx, cx
  100052A9:  75 f5                           jne      0x100052a0
  100052AB:  2b c2                           sub      eax, edx
  100052AD:  b9 02 00 00 00                  mov      ecx, 2
  100052B2:  d1 f8                           sar      eax, 1
  100052B4:  53                              push     ebx
  100052B5:  56                              push     esi
  100052B6:  8d 70 04                        lea      esi, [eax + 4]
  100052B9:  8b c6                           mov      eax, esi
  100052BB:  f7 e1                           mul      ecx
  100052BD:  b9 ff ff ff ff                  mov      ecx, 0xffffffff
  100052C2:  0f 42 c1                        cmovb    eax, ecx
  100052C5:  50                              push     eax
  100052C6:  e8 fa 70 02 00                  call     0x1002c3c5
  100052CB:  57                              push     edi
  100052CC:  68 84 ca 04 10                  push     0x1004ca84
  100052D1:  56                              push     esi
  100052D2:  50                              push     eax
  100052D3:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  100052D6:  e8 05 04 00 00                  call     0x100056e0
  100052DB:  83 c4 14                        add      esp, 0x14
  100052DE:  85 c0                           test     eax, eax
  100052E0:  79 1c                           jns      0x100052fe
  100052E2:  68 90 ca 04 10                  push     0x1004ca90  ; "GW::Chat::WriteChat"
  100052E7:  68 53 02 00 00                  push     0x253
  100052EC:  68 98 c6 04 10                  push     0x1004c698  ; "C:\GitRepositories\GWCA\Source\ChatMgr.cpp"
  100052F1:  68 a8 ca 04 10                  push     0x1004caa8  ; "swprintf(message_encoded, len, L"\x108\x107%s\x1", messag..."
  100052F6:  e8 75 05 00 00                  call     0x10005870  ; GW::FatalAssert
  100052FB:  83 c4 10                        add      esp, 0x10
  100052FE:  8b 5d 10                        mov      ebx, dword ptr [ebp + 0x10]
  10005301:  33 ff                           xor      edi, edi
  10005303:  85 db                           test     ebx, ebx
  10005305:  74 64                           je       0x1000536b
  10005307:  8b f3                           mov      esi, ebx
  10005309:  8d 4e 02                        lea      ecx, [esi + 2]
  1000530C:  0f 1f 40 00                     nop      dword ptr [eax]
  10005310:  66 8b 06                        mov      ax, word ptr [esi]
  10005313:  83 c6 02                        add      esi, 2
  10005316:  66 85 c0                        test     ax, ax
  10005319:  75 f5                           jne      0x10005310
  1000531B:  2b f1                           sub      esi, ecx
  1000531D:  b9 02 00 00 00                  mov      ecx, 2
  10005322:  d1 fe                           sar      esi, 1
  10005324:  83 c6 04                        add      esi, 4
  10005327:  8b c6                           mov      eax, esi
  10005329:  f7 e1                           mul      ecx
  1000532B:  b9 ff ff ff ff                  mov      ecx, 0xffffffff
  10005330:  0f 42 c1                        cmovb    eax, ecx
  10005333:  50                              push     eax
  10005334:  e8 8c 70 02 00                  call     0x1002c3c5
  10005339:  53                              push     ebx
  1000533A:  68 84 ca 04 10                  push     0x1004ca84
  1000533F:  8b f8                           mov      edi, eax
  10005341:  56                              push     esi
  10005342:  57                              push     edi
  10005343:  e8 98 03 00 00                  call     0x100056e0
  10005348:  83 c4 14                        add      esp, 0x14
  1000534B:  85 c0                           test     eax, eax
  1000534D:  79 1c                           jns      0x1000536b
  1000534F:  68 90 ca 04 10                  push     0x1004ca90  ; "GW::Chat::WriteChat"
  10005354:  68 58 02 00 00                  push     0x258
  10005359:  68 98 c6 04 10                  push     0x1004c698  ; "C:\GitRepositories\GWCA\Source\ChatMgr.cpp"
  1000535E:  68 f8 ca 04 10                  push     0x1004caf8  ; "swprintf(sender_encoded, len, L"\x108\x107%s\x1", sender_..."
  10005363:  e8 08 05 00 00                  call     0x10005870  ; GW::FatalAssert
  10005368:  83 c4 10                        add      esp, 0x10
  1000536B:  ff 75 14                        push     dword ptr [ebp + 0x14]
  1000536E:  8b 75 fc                        mov      esi, dword ptr [ebp - 4]
  10005371:  57                              push     edi
  10005372:  56                              push     esi
  10005373:  ff 75 08                        push     dword ptr [ebp + 8]
  10005376:  e8 25 00 00 00                  call     0x100053a0  ; Chat::WriteChatEnc
  1000537B:  56                              push     esi
  1000537C:  e8 4d 70 02 00                  call     0x1002c3ce
  10005381:  83 c4 14                        add      esp, 0x14
  10005384:  5e                              pop      esi
  10005385:  5b                              pop      ebx
  10005386:  85 ff                           test     edi, edi
  10005388:  74 09                           je       0x10005393
  1000538A:  57                              push     edi
  1000538B:  e8 3e 70 02 00                  call     0x1002c3ce
  10005390:  83 c4 04                        add      esp, 4
  10005393:  5f                              pop      edi
  10005394:  8b e5                           mov      esp, ebp
  10005396:  5d                              pop      ebp
  10005397:  c3                              ret      


; === Chat::WriteChatEnc ===
; RVA: 0x000053A0  Size: 347 bytes
; Exports: ?WriteChatEnc@Chat@GW@@YAXW4Channel@12@PB_W1_N@Z
;
  100053A0:  55                              push     ebp
  100053A1:  8b ec                           mov      ebp, esp
  100053A3:  83 ec 0c                        sub      esp, 0xc
  100053A6:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100053A9:  8b 55 10                        mov      edx, dword ptr [ebp + 0x10]
  100053AC:  53                              push     ebx
  100053AD:  56                              push     esi
  100053AE:  8b 75 0c                        mov      esi, dword ptr [ebp + 0xc]
  100053B1:  32 db                           xor      bl, bl
  100053B3:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  100053B6:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  100053B9:  89 75 f8                        mov      dword ptr [ebp - 8], esi
  100053BC:  85 d2                           test     edx, edx
  100053BE:  0f 84 f8 00 00 00               je       0x100054bc
  100053C4:  8b ce                           mov      ecx, esi
  100053C6:  c7 45 08 44 cb 04 10            mov      dword ptr [ebp + 8], 0x1004cb44
  100053CD:  57                              push     edi
  100053CE:  8d 79 02                        lea      edi, [ecx + 2]
  100053D1:  66 8b 01                        mov      ax, word ptr [ecx]
  100053D4:  83 c1 02                        add      ecx, 2
  100053D7:  66 85 c0                        test     ax, ax
  100053DA:  75 f5                           jne      0x100053d1
  100053DC:  2b cf                           sub      ecx, edi
  100053DE:  8d 7a 02                        lea      edi, [edx + 2]
  100053E1:  d1 f9                           sar      ecx, 1
  100053E3:  66 8b 02                        mov      ax, word ptr [edx]
  100053E6:  83 c2 02                        add      edx, 2
  100053E9:  66 85 c0                        test     ax, ax
  100053EC:  75 f5                           jne      0x100053e3
  100053EE:  2b d7                           sub      edx, edi
  100053F0:  d1 fa                           sar      edx, 1
  100053F2:  68 58 cb 04 10                  push     0x1004cb58
  100053F7:  56                              push     esi
  100053F8:  8d 7a 06                        lea      edi, [edx + 6]
  100053FB:  03 f9                           add      edi, ecx
  100053FD:  e8 e5 89 02 00                  call     0x1002dde7
  10005402:  8b d8                           mov      ebx, eax
  10005404:  83 c4 08                        add      esp, 8
  10005407:  85 db                           test     ebx, ebx
  10005409:  75 12                           jne      0x1000541d
  1000540B:  68 64 cb 04 10                  push     0x1004cb64
  10005410:  56                              push     esi
  10005411:  e8 d1 89 02 00                  call     0x1002dde7
  10005416:  83 c4 08                        add      esp, 8
  10005419:  85 c0                           test     eax, eax
  1000541B:  74 15                           je       0x10005432
  1000541D:  83 c7 13                        add      edi, 0x13
  10005420:  b8 a8 cb 04 10                  mov      eax, 0x1004cba8
  10005425:  85 db                           test     ebx, ebx
  10005427:  b9 6c cb 04 10                  mov      ecx, 0x1004cb6c
  1000542C:  0f 45 c1                        cmovne   eax, ecx
  1000542F:  89 45 08                        mov      dword ptr [ebp + 8], eax
  10005432:  b9 02 00 00 00                  mov      ecx, 2
  10005437:  8b c7                           mov      eax, edi
  10005439:  f7 e1                           mul      ecx
  1000543B:  b9 ff ff ff ff                  mov      ecx, 0xffffffff
  10005440:  0f 42 c1                        cmovb    eax, ecx
  10005443:  50                              push     eax
  10005444:  e8 7c 6f 02 00                  call     0x1002c3c5
  10005449:  56                              push     esi
  1000544A:  ff 75 10                        push     dword ptr [ebp + 0x10]
  1000544D:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  10005450:  b3 01                           mov      bl, 1
  10005452:  ff 75 08                        push     dword ptr [ebp + 8]
  10005455:  57                              push     edi
  10005456:  50                              push     eax
  10005457:  e8 84 02 00 00                  call     0x100056e0
  1000545C:  83 c4 18                        add      esp, 0x18
  1000545F:  5f                              pop      edi
  10005460:  85 c0                           test     eax, eax
  10005462:  79 55                           jns      0x100054b9
  10005464:  68 e4 cb 04 10                  push     0x1004cbe4  ; "GW::Chat::WriteChatEnc"
  10005469:  68 76 02 00 00                  push     0x276
  1000546E:  68 98 c6 04 10                  push     0x1004c698  ; "C:\GitRepositories\GWCA\Source\ChatMgr.cpp"
  10005473:  68 00 cc 04 10                  push     0x1004cc00  ; "swprintf(param.message, len, format, sender_encoded, mess..."
  10005478:  e8 f3 03 00 00                  call     0x10005870  ; GW::FatalAssert
  1000547D:  33 c0                           xor      eax, eax
  1000547F:  38 45 14                        cmp      byte ptr [ebp + 0x14], al
  10005482:  6a 00                           push     0
  10005484:  0f 45 45 f8                     cmovne   eax, dword ptr [ebp - 8]
  10005488:  a3 38 c1 08 10                  mov      dword ptr [0x1008c138], eax
  1000548D:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10005490:  50                              push     eax
  10005491:  68 7f 00 00 10                  push     0x1000007f
  10005496:  e8 35 2c 02 00                  call     0x100280d0  ; UI::SendUIMessage
  1000549B:  83 c4 1c                        add      esp, 0x1c
  1000549E:  c7 05 38 c1 08 10 00 00 00 00   mov      dword ptr [0x1008c138], 0
  100054A8:  ff 75 f8                        push     dword ptr [ebp - 8]
  100054AB:  e8 1e 6f 02 00                  call     0x1002c3ce
  100054B0:  83 c4 04                        add      esp, 4
  100054B3:  5e                              pop      esi
  100054B4:  5b                              pop      ebx
  100054B5:  8b e5                           mov      esp, ebp
  100054B7:  5d                              pop      ebp
  100054B8:  c3                              ret      
  100054B9:  8b 75 f8                        mov      esi, dword ptr [ebp - 8]
  100054BC:  33 c0                           xor      eax, eax
  100054BE:  38 45 14                        cmp      byte ptr [ebp + 0x14], al
  100054C1:  6a 00                           push     0
  100054C3:  0f 45 c6                        cmovne   eax, esi
  100054C6:  a3 38 c1 08 10                  mov      dword ptr [0x1008c138], eax
  100054CB:  8d 45 f4                        lea      eax, [ebp - 0xc]
  100054CE:  50                              push     eax
  100054CF:  68 7f 00 00 10                  push     0x1000007f
  100054D4:  e8 f7 2b 02 00                  call     0x100280d0  ; UI::SendUIMessage
  100054D9:  83 c4 0c                        add      esp, 0xc
  100054DC:  c7 05 38 c1 08 10 00 00 00 00   mov      dword ptr [0x1008c138], 0
  100054E6:  84 db                           test     bl, bl
  100054E8:  74 0b                           je       0x100054f5
  100054EA:  ff 75 f8                        push     dword ptr [ebp - 8]
  100054ED:  e8 dc 6e 02 00                  call     0x1002c3ce
  100054F2:  83 c4 04                        add      esp, 4
  100054F5:  5e                              pop      esi
  100054F6:  5b                              pop      ebx
  100054F7:  8b e5                           mov      esp, ebp
  100054F9:  5d                              pop      ebp
  100054FA:  c3                              ret      


; === Chat::WriteChatF ===
; RVA: 0x00005500  Size: 118 bytes
; Exports: ?WriteChatF@Chat@GW@@YAXW4Channel@12@PB_WZZ
;
  10005500:  55                              push     ebp
  10005501:  8b ec                           mov      ebp, esp
  10005503:  53                              push     ebx
  10005504:  56                              push     esi
  10005505:  57                              push     edi
  10005506:  e8 c5 01 00 00                  call     0x100056d0
  1000550B:  8b d8                           mov      ebx, eax
  1000550D:  8d 45 10                        lea      eax, [ebp + 0x10]
  10005510:  50                              push     eax
  10005511:  6a 00                           push     0
  10005513:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10005516:  6a 00                           push     0
  10005518:  6a 00                           push     0
  1000551A:  ff 73 04                        push     dword ptr [ebx + 4]
  1000551D:  ff 33                           push     dword ptr [ebx]
  1000551F:  e8 28 07 03 00                  call     0x10035c4c
  10005524:  8b f8                           mov      edi, eax
  10005526:  83 ce ff                        or       esi, 0xffffffff
  10005529:  85 ff                           test     edi, edi
  1000552B:  b9 02 00 00 00                  mov      ecx, 2
  10005530:  0f 48 fe                        cmovs    edi, esi
  10005533:  47                              inc      edi
  10005534:  8b c7                           mov      eax, edi
  10005536:  f7 e1                           mul      ecx
  10005538:  0f 42 c6                        cmovb    eax, esi
  1000553B:  50                              push     eax
  1000553C:  e8 84 6e 02 00                  call     0x1002c3c5
  10005541:  8b f0                           mov      esi, eax
  10005543:  8d 45 10                        lea      eax, [ebp + 0x10]
  10005546:  50                              push     eax
  10005547:  6a 00                           push     0
  10005549:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  1000554C:  57                              push     edi
  1000554D:  56                              push     esi
  1000554E:  ff 73 04                        push     dword ptr [ebx + 4]
  10005551:  ff 33                           push     dword ptr [ebx]
  10005553:  e8 f4 06 03 00                  call     0x10035c4c
  10005558:  6a 00                           push     0
  1000555A:  6a 00                           push     0
  1000555C:  56                              push     esi
  1000555D:  ff 75 08                        push     dword ptr [ebp + 8]
  10005560:  e8 2b fd ff ff                  call     0x10005290  ; Chat::WriteChat
  10005565:  83 c4 4c                        add      esp, 0x4c
  10005568:  56                              push     esi
  10005569:  e8 60 6e 02 00                  call     0x1002c3ce
  1000556E:  83 c4 04                        add      esp, 4
  10005571:  5f                              pop      edi
  10005572:  5e                              pop      esi
  10005573:  5b                              pop      ebx
  10005574:  5d                              pop      ebp
  10005575:  c3                              ret      


