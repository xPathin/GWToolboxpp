; Module: ItemMgr
; Functions: 50
; Total code size: 5301 bytes
;

; === Items::CanAccessXunlaiChest, CanAccessXunlaiChest ===
; RVA: 0x0001B3D0  Size: 59 bytes
; Exports: ?CanAccessXunlaiChest@Items@GW@@YA_NXZ, CanAccessXunlaiChest
;
  1001B3D0:  e8 8b 20 00 00                  call     0x1001d460  ; Map::GetInstanceType, GetInstanceType
  1001B3D5:  85 c0                           test     eax, eax
  1001B3D7:  75 2f                           jne      0x1001b408
  1001B3D9:  e8 c2 21 00 00                  call     0x1001d5a0  ; Map::GetMapID, GetMapID
  1001B3DE:  50                              push     eax
  1001B3DF:  e8 dc 21 00 00                  call     0x1001d5c0  ; Map::GetMapInfo, GetMapInfo
  1001B3E4:  83 c4 04                        add      esp, 4
  1001B3E7:  85 c0                           test     eax, eax
  1001B3E9:  74 06                           je       0x1001b3f1
  1001B3EB:  83 78 08 07                     cmp      dword ptr [eax + 8], 7
  1001B3EF:  74 17                           je       0x1001b408
  1001B3F1:  6a 00                           push     0
  1001B3F3:  e8 28 53 00 00                  call     0x10020720  ; PlayerMgr::GetPlayerByID
  1001B3F8:  83 c4 04                        add      esp, 4
  1001B3FB:  85 c0                           test     eax, eax
  1001B3FD:  74 09                           je       0x1001b408
  1001B3FF:  f6 40 34 02                     test     byte ptr [eax + 0x34], 2
  1001B403:  75 03                           jne      0x1001b408
  1001B405:  b0 01                           mov      al, 1
  1001B407:  c3                              ret      
  1001B408:  32 c0                           xor      al, al
  1001B40A:  c3                              ret      


; === Items::CanInteractWithItem, CanInteractWithItem ===
; RVA: 0x0001B410  Size: 83 bytes
; Exports: ?CanInteractWithItem@Items@GW@@YA_NPBUItem@2@@Z, CanInteractWithItem
;
  1001B410:  55                              push     ebp
  1001B411:  8b ec                           mov      ebp, esp
  1001B413:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001B416:  85 c0                           test     eax, eax
  1001B418:  74 0c                           je       0x1001b426
  1001B41A:  8b 40 0c                        mov      eax, dword ptr [eax + 0xc]
  1001B41D:  85 c0                           test     eax, eax
  1001B41F:  74 3a                           je       0x1001b45b
  1001B421:  83 38 04                        cmp      dword ptr [eax], 4
  1001B424:  75 35                           jne      0x1001b45b
  1001B426:  e8 35 20 00 00                  call     0x1001d460  ; Map::GetInstanceType, GetInstanceType
  1001B42B:  85 c0                           test     eax, eax
  1001B42D:  75 30                           jne      0x1001b45f
  1001B42F:  e8 6c 21 00 00                  call     0x1001d5a0  ; Map::GetMapID, GetMapID
  1001B434:  50                              push     eax
  1001B435:  e8 86 21 00 00                  call     0x1001d5c0  ; Map::GetMapInfo, GetMapInfo
  1001B43A:  83 c4 04                        add      esp, 4
  1001B43D:  85 c0                           test     eax, eax
  1001B43F:  74 06                           je       0x1001b447
  1001B441:  83 78 08 07                     cmp      dword ptr [eax + 8], 7
  1001B445:  74 18                           je       0x1001b45f
  1001B447:  6a 00                           push     0
  1001B449:  e8 d2 52 00 00                  call     0x10020720  ; PlayerMgr::GetPlayerByID
  1001B44E:  83 c4 04                        add      esp, 4
  1001B451:  85 c0                           test     eax, eax
  1001B453:  74 0a                           je       0x1001b45f
  1001B455:  f6 40 34 02                     test     byte ptr [eax + 0x34], 2
  1001B459:  75 04                           jne      0x1001b45f
  1001B45B:  b0 01                           mov      al, 1
  1001B45D:  5d                              pop      ebp
  1001B45E:  c3                              ret      
  1001B45F:  32 c0                           xor      al, al
  1001B461:  5d                              pop      ebp
  1001B462:  c3                              ret      


; === Items::CountItemByModelId ===
; RVA: 0x0001B470  Size: 117 bytes
; Exports: ?CountItemByModelId@Items@GW@@YAIIHH@Z
;
  1001B470:  55                              push     ebp
  1001B471:  8b ec                           mov      ebp, esp
  1001B473:  53                              push     ebx
  1001B474:  8b 5d 0c                        mov      ebx, dword ptr [ebp + 0xc]
  1001B477:  56                              push     esi
  1001B478:  33 f6                           xor      esi, esi
  1001B47A:  3b 5d 10                        cmp      ebx, dword ptr [ebp + 0x10]
  1001B47D:  7f 60                           jg       0x1001b4df
  1001B47F:  57                              push     edi
  1001B480:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  1001B483:  8d 43 ff                        lea      eax, [ebx - 1]
  1001B486:  3c 15                           cmp      al, 0x15
  1001B488:  77 4e                           ja       0x1001b4d8
  1001B48A:  e8 81 db ff ff                  call     0x10019010  ; GW::GetItemContext
  1001B48F:  85 c0                           test     eax, eax
  1001B491:  74 12                           je       0x1001b4a5
  1001B493:  8b 88 f8 00 00 00               mov      ecx, dword ptr [eax + 0xf8]
  1001B499:  85 c9                           test     ecx, ecx
  1001B49B:  74 08                           je       0x1001b4a5
  1001B49D:  0f b6 c3                        movzx    eax, bl
  1001B4A0:  8b 04 81                        mov      eax, dword ptr [ecx + eax*4]
  1001B4A3:  eb 02                           jmp      0x1001b4a7
  1001B4A5:  33 c0                           xor      eax, eax
  1001B4A7:  85 c0                           test     eax, eax
  1001B4A9:  74 2d                           je       0x1001b4d8
  1001B4AB:  8b 48 18                        mov      ecx, dword ptr [eax + 0x18]
  1001B4AE:  85 c9                           test     ecx, ecx
  1001B4B0:  74 26                           je       0x1001b4d8
  1001B4B2:  8b 40 20                        mov      eax, dword ptr [eax + 0x20]
  1001B4B5:  8d 14 81                        lea      edx, [ecx + eax*4]
  1001B4B8:  3b ca                           cmp      ecx, edx
  1001B4BA:  74 1c                           je       0x1001b4d8
  1001B4BC:  0f 1f 40 00                     nop      dword ptr [eax]
  1001B4C0:  8b 01                           mov      eax, dword ptr [ecx]
  1001B4C2:  85 c0                           test     eax, eax
  1001B4C4:  74 0b                           je       0x1001b4d1
  1001B4C6:  39 78 2c                        cmp      dword ptr [eax + 0x2c], edi
  1001B4C9:  75 06                           jne      0x1001b4d1
  1001B4CB:  0f b7 40 4c                     movzx    eax, word ptr [eax + 0x4c]
  1001B4CF:  03 f0                           add      esi, eax
  1001B4D1:  83 c1 04                        add      ecx, 4
  1001B4D4:  3b ca                           cmp      ecx, edx
  1001B4D6:  75 e8                           jne      0x1001b4c0
  1001B4D8:  43                              inc      ebx
  1001B4D9:  3b 5d 10                        cmp      ebx, dword ptr [ebp + 0x10]
  1001B4DC:  7e a5                           jle      0x1001b483
  1001B4DE:  5f                              pop      edi
  1001B4DF:  8b c6                           mov      eax, esi
  1001B4E1:  5e                              pop      esi
  1001B4E2:  5b                              pop      ebx
  1001B4E3:  5d                              pop      ebp
  1001B4E4:  c3                              ret      


; === Items::DepositGold ===
; RVA: 0x0001B4F0  Size: 244 bytes
; Exports: ?DepositGold@Items@GW@@YAII@Z
;
  1001B4F0:  55                              push     ebp
  1001B4F1:  8b ec                           mov      ebp, esp
  1001B4F3:  83 ec 14                        sub      esp, 0x14
  1001B4F6:  56                              push     esi
  1001B4F7:  57                              push     edi
  1001B4F8:  e8 63 1f 00 00                  call     0x1001d460  ; Map::GetInstanceType, GetInstanceType
  1001B4FD:  85 c0                           test     eax, eax
  1001B4FF:  0f 85 d7 00 00 00               jne      0x1001b5dc
  1001B505:  e8 96 20 00 00                  call     0x1001d5a0  ; Map::GetMapID, GetMapID
  1001B50A:  50                              push     eax
  1001B50B:  e8 b0 20 00 00                  call     0x1001d5c0  ; Map::GetMapInfo, GetMapInfo
  1001B510:  83 c4 04                        add      esp, 4
  1001B513:  85 c0                           test     eax, eax
  1001B515:  74 0a                           je       0x1001b521
  1001B517:  83 78 08 07                     cmp      dword ptr [eax + 8], 7
  1001B51B:  0f 84 bb 00 00 00               je       0x1001b5dc
  1001B521:  6a 00                           push     0
  1001B523:  e8 f8 51 00 00                  call     0x10020720  ; PlayerMgr::GetPlayerByID
  1001B528:  83 c4 04                        add      esp, 4
  1001B52B:  85 c0                           test     eax, eax
  1001B52D:  0f 84 a9 00 00 00               je       0x1001b5dc
  1001B533:  f6 40 34 02                     test     byte ptr [eax + 0x34], 2
  1001B537:  0f 85 9f 00 00 00               jne      0x1001b5dc
  1001B53D:  83 3d e4 c2 08 10 00            cmp      dword ptr [0x1008c2e4], 0
  1001B544:  0f 84 92 00 00 00               je       0x1001b5dc
  1001B54A:  e8 c1 da ff ff                  call     0x10019010  ; GW::GetItemContext
  1001B54F:  85 c0                           test     eax, eax
  1001B551:  74 12                           je       0x1001b565
  1001B553:  8b b8 f8 00 00 00               mov      edi, dword ptr [eax + 0xf8]
  1001B559:  85 ff                           test     edi, edi
  1001B55B:  74 08                           je       0x1001b565
  1001B55D:  8b bf 94 00 00 00               mov      edi, dword ptr [edi + 0x94]
  1001B563:  eb 02                           jmp      0x1001b567
  1001B565:  33 ff                           xor      edi, edi
  1001B567:  e8 a4 da ff ff                  call     0x10019010  ; GW::GetItemContext
  1001B56C:  85 c0                           test     eax, eax
  1001B56E:  74 12                           je       0x1001b582
  1001B570:  8b 88 f8 00 00 00               mov      ecx, dword ptr [eax + 0xf8]
  1001B576:  85 c9                           test     ecx, ecx
  1001B578:  74 08                           je       0x1001b582
  1001B57A:  8b 89 90 00 00 00               mov      ecx, dword ptr [ecx + 0x90]
  1001B580:  eb 02                           jmp      0x1001b584
  1001B582:  33 c9                           xor      ecx, ecx
  1001B584:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  1001B587:  85 f6                           test     esi, esi
  1001B589:  75 0e                           jne      0x1001b599
  1001B58B:  be 40 42 0f 00                  mov      esi, 0xf4240
  1001B590:  2b f7                           sub      esi, edi
  1001B592:  3b ce                           cmp      ecx, esi
  1001B594:  0f 42 f1                        cmovb    esi, ecx
  1001B597:  eb 0e                           jmp      0x1001b5a7
  1001B599:  8d 04 37                        lea      eax, [edi + esi]
  1001B59C:  3d 40 42 0f 00                  cmp      eax, 0xf4240
  1001B5A1:  77 39                           ja       0x1001b5dc
  1001B5A3:  3b f1                           cmp      esi, ecx
  1001B5A5:  77 35                           ja       0x1001b5dc
  1001B5A7:  8d 45 ec                        lea      eax, [ebp - 0x14]
  1001B5AA:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  1001B5B1:  50                              push     eax
  1001B5B2:  33 d2                           xor      edx, edx
  1001B5B4:  c7 45 f0 04 00 00 00            mov      dword ptr [ebp - 0x10], 4
  1001B5BB:  33 c9                           xor      ecx, ecx
  1001B5BD:  c7 45 f4 07 00 00 00            mov      dword ptr [ebp - 0xc], 7
  1001B5C4:  89 75 f8                        mov      dword ptr [ebp - 8], esi
  1001B5C7:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001B5CE:  ff 15 e4 c2 08 10               call     dword ptr [0x1008c2e4]
  1001B5D4:  5f                              pop      edi
  1001B5D5:  8b c6                           mov      eax, esi
  1001B5D7:  5e                              pop      esi
  1001B5D8:  8b e5                           mov      esp, ebp
  1001B5DA:  5d                              pop      ebp
  1001B5DB:  c3                              ret      
  1001B5DC:  5f                              pop      edi
  1001B5DD:  33 c0                           xor      eax, eax
  1001B5DF:  5e                              pop      esi
  1001B5E0:  8b e5                           mov      esp, ebp
  1001B5E2:  5d                              pop      ebp
  1001B5E3:  c3                              ret      


; === Items::DestroyItem ===
; RVA: 0x0001B5F0  Size: 178 bytes
; Exports: ?DestroyItem@Items@GW@@YA_NI@Z
;
  1001B5F0:  55                              push     ebp
  1001B5F1:  8b ec                           mov      ebp, esp
  1001B5F3:  83 ec 20                        sub      esp, 0x20
  1001B5F6:  83 3d e0 c2 08 10 00            cmp      dword ptr [0x1008c2e0], 0
  1001B5FD:  53                              push     ebx
  1001B5FE:  57                              push     edi
  1001B5FF:  0f 84 95 00 00 00               je       0x1001b69a
  1001B605:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  1001B608:  85 ff                           test     edi, edi
  1001B60A:  0f 84 8a 00 00 00               je       0x1001b69a
  1001B610:  57                              push     edi
  1001B611:  e8 1a 05 00 00                  call     0x1001bb30  ; Items::GetItemById
  1001B616:  83 c4 04                        add      esp, 4
  1001B619:  85 c0                           test     eax, eax
  1001B61B:  74 7d                           je       0x1001b69a
  1001B61D:  68 d8 2c 05 10                  push     0x10052cd8
  1001B622:  e8 59 b1 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001B627:  8b d8                           mov      ebx, eax
  1001B629:  83 c4 04                        add      esp, 4
  1001B62C:  85 db                           test     ebx, ebx
  1001B62E:  74 6a                           je       0x1001b69a
  1001B630:  56                              push     esi
  1001B631:  8b b3 c4 01 00 00               mov      esi, dword ptr [ebx + 0x1c4]
  1001B637:  0f 57 c0                        xorps    xmm0, xmm0
  1001B63A:  89 bb c4 01 00 00               mov      dword ptr [ebx + 0x1c4], edi
  1001B640:  66 0f d6 45 f4                  movq     qword ptr [ebp - 0xc], xmm0
  1001B645:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001B64C:  c7 45 f8 31 00 00 00            mov      dword ptr [ebp - 8], 0x31
  1001B653:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  1001B65A:  c7 45 f0 00 00 00 00            mov      dword ptr [ebp - 0x10], 0
  1001B661:  c7 45 e4 69 00 00 00            mov      dword ptr [ebp - 0x1c], 0x69
  1001B668:  c7 45 e8 0b 00 00 00            mov      dword ptr [ebp - 0x18], 0xb
  1001B66F:  8b 83 bc 00 00 00               mov      eax, dword ptr [ebx + 0xbc]
  1001B675:  89 45 e0                        mov      dword ptr [ebp - 0x20], eax
  1001B678:  8d 45 e0                        lea      eax, [ebp - 0x20]
  1001B67B:  6a 00                           push     0
  1001B67D:  50                              push     eax
  1001B67E:  8d 45 f4                        lea      eax, [ebp - 0xc]
  1001B681:  50                              push     eax
  1001B682:  ff 15 e0 c2 08 10               call     dword ptr [0x1008c2e0]
  1001B688:  83 c4 0c                        add      esp, 0xc
  1001B68B:  89 b3 c4 01 00 00               mov      dword ptr [ebx + 0x1c4], esi
  1001B691:  b0 01                           mov      al, 1
  1001B693:  5e                              pop      esi
  1001B694:  5f                              pop      edi
  1001B695:  5b                              pop      ebx
  1001B696:  8b e5                           mov      esp, ebp
  1001B698:  5d                              pop      ebp
  1001B699:  c3                              ret      
  1001B69A:  5f                              pop      edi
  1001B69B:  32 c0                           xor      al, al
  1001B69D:  5b                              pop      ebx
  1001B69E:  8b e5                           mov      esp, ebp
  1001B6A0:  5d                              pop      ebp
  1001B6A1:  c3                              ret      


; === Items::DropGold ===
; RVA: 0x0001B6B0  Size: 111 bytes
; Exports: ?DropGold@Items@GW@@YA_NI@Z
;
  1001B6B0:  55                              push     ebp
  1001B6B1:  8b ec                           mov      ebp, esp
  1001B6B3:  83 ec 14                        sub      esp, 0x14
  1001B6B6:  e8 55 d9 ff ff                  call     0x10019010  ; GW::GetItemContext
  1001B6BB:  85 c0                           test     eax, eax
  1001B6BD:  74 12                           je       0x1001b6d1
  1001B6BF:  8b 80 f8 00 00 00               mov      eax, dword ptr [eax + 0xf8]
  1001B6C5:  85 c0                           test     eax, eax
  1001B6C7:  74 08                           je       0x1001b6d1
  1001B6C9:  8b 80 90 00 00 00               mov      eax, dword ptr [eax + 0x90]
  1001B6CF:  eb 02                           jmp      0x1001b6d3
  1001B6D1:  33 c0                           xor      eax, eax
  1001B6D3:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001B6D6:  3b c1                           cmp      eax, ecx
  1001B6D8:  73 06                           jae      0x1001b6e0
  1001B6DA:  32 c0                           xor      al, al
  1001B6DC:  8b e5                           mov      esp, ebp
  1001B6DE:  5d                              pop      ebp
  1001B6DF:  c3                              ret      
  1001B6E0:  68 d8 2c 05 10                  push     0x10052cd8
  1001B6E5:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001B6EC:  c7 45 f0 75 00 00 00            mov      dword ptr [ebp - 0x10], 0x75
  1001B6F3:  c7 45 f4 07 00 00 00            mov      dword ptr [ebp - 0xc], 7
  1001B6FA:  89 4d f8                        mov      dword ptr [ebp - 8], ecx
  1001B6FD:  e8 7e b0 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001B702:  6a 06                           push     6
  1001B704:  50                              push     eax
  1001B705:  e8 e6 ac 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001B70A:  6a 00                           push     0
  1001B70C:  8d 4d ec                        lea      ecx, [ebp - 0x14]
  1001B70F:  51                              push     ecx
  1001B710:  6a 31                           push     0x31
  1001B712:  50                              push     eax
  1001B713:  e8 08 c8 00 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  1001B718:  83 c4 1c                        add      esp, 0x1c
  1001B71B:  8b e5                           mov      esp, ebp
  1001B71D:  5d                              pop      ebp
  1001B71E:  c3                              ret      


; === Items::DropItem ===
; RVA: 0x0001B720  Size: 315 bytes
; Exports: ?DropItem@Items@GW@@YA_NPBUItem@2@I@Z
;
  1001B720:  55                              push     ebp
  1001B721:  8b ec                           mov      ebp, esp
  1001B723:  6a ff                           push     -1
  1001B725:  68 fd af 04 10                  push     0x1004affd
  1001B72A:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  1001B730:  50                              push     eax
  1001B731:  83 ec 64                        sub      esp, 0x64
  1001B734:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1001B739:  33 c5                           xor      eax, ebp
  1001B73B:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  1001B73E:  53                              push     ebx
  1001B73F:  56                              push     esi
  1001B740:  57                              push     edi
  1001B741:  50                              push     eax
  1001B742:  8d 45 f4                        lea      eax, [ebp - 0xc]
  1001B745:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  1001B74B:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  1001B74E:  85 ff                           test     edi, edi
  1001B750:  0f 84 e7 00 00 00               je       0x1001b83d
  1001B756:  68 d8 2c 05 10                  push     0x10052cd8
  1001B75B:  e8 20 b0 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001B760:  6a 06                           push     6
  1001B762:  50                              push     eax
  1001B763:  e8 88 ac 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001B768:  0f b7 4f 4c                     movzx    ecx, word ptr [edi + 0x4c]
  1001B76C:  8b d0                           mov      edx, eax
  1001B76E:  8b 75 0c                        mov      esi, dword ptr [ebp + 0xc]
  1001B771:  8d 45 a4                        lea      eax, [ebp - 0x5c]
  1001B774:  89 45 a0                        mov      dword ptr [ebp - 0x60], eax
  1001B777:  3b f1                           cmp      esi, ecx
  1001B779:  8b 07                           mov      eax, dword ptr [edi]
  1001B77B:  89 45 9c                        mov      dword ptr [ebp - 0x64], eax
  1001B77E:  0f 47 f1                        cmova    esi, ecx
  1001B781:  6a 00                           push     0
  1001B783:  8d 45 90                        lea      eax, [ebp - 0x70]
  1001B786:  c7 45 98 06 00 00 00            mov      dword ptr [ebp - 0x68], 6
  1001B78D:  50                              push     eax
  1001B78E:  6a 28                           push     0x28
  1001B790:  52                              push     edx
  1001B791:  c7 45 a4 06 00 00 00            mov      dword ptr [ebp - 0x5c], 6
  1001B798:  e8 83 c7 00 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  1001B79D:  83 c4 1c                        add      esp, 0x1c
  1001B7A0:  84 c0                           test     al, al
  1001B7A2:  0f 84 95 00 00 00               je       0x1001b83d
  1001B7A8:  66 83 7f 4c 01                  cmp      word ptr [edi + 0x4c], 1
  1001B7AD:  0f 86 86 00 00 00               jbe      0x1001b839
  1001B7B3:  85 f6                           test     esi, esi
  1001B7B5:  0f 84 7e 00 00 00               je       0x1001b839
  1001B7BB:  68 e4 2c 05 10                  push     0x10052ce4
  1001B7C0:  e8 bb af 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001B7C5:  8b f8                           mov      edi, eax
  1001B7C7:  83 c4 04                        add      esp, 4
  1001B7CA:  85 ff                           test     edi, edi
  1001B7CC:  74 6f                           je       0x1001b83d
  1001B7CE:  8d 4d ee                        lea      ecx, [ebp - 0x12]
  1001B7D1:  b8 cd cc cc cc                  mov      eax, 0xcccccccd
  1001B7D6:  83 e9 02                        sub      ecx, 2
  1001B7D9:  f7 e6                           mul      esi
  1001B7DB:  c1 ea 03                        shr      edx, 3
  1001B7DE:  8d 04 92                        lea      eax, [edx + edx*4]
  1001B7E1:  03 c0                           add      eax, eax
  1001B7E3:  2b f0                           sub      esi, eax
  1001B7E5:  83 c6 30                        add      esi, 0x30
  1001B7E8:  66 89 31                        mov      word ptr [ecx], si
  1001B7EB:  8b f2                           mov      esi, edx
  1001B7ED:  85 f6                           test     esi, esi
  1001B7EF:  75 e0                           jne      0x1001b7d1
  1001B7F1:  8d 45 ab                        lea      eax, [ebp - 0x55]
  1001B7F4:  50                              push     eax
  1001B7F5:  8d 45 ee                        lea      eax, [ebp - 0x12]
  1001B7F8:  50                              push     eax
  1001B7F9:  51                              push     ecx
  1001B7FA:  8d 4d ac                        lea      ecx, [ebp - 0x54]
  1001B7FD:  e8 2e f8 ff ff                  call     0x1001b030
  1001B802:  83 7d c0 07                     cmp      dword ptr [ebp - 0x40], 7
  1001B806:  8d 45 ac                        lea      eax, [ebp - 0x54]
  1001B809:  8b cf                           mov      ecx, edi
  1001B80B:  89 75 fc                        mov      dword ptr [ebp - 4], esi
  1001B80E:  0f 47 45 ac                     cmova    eax, dword ptr [ebp - 0x54]
  1001B812:  50                              push     eax
  1001B813:  e8 f8 c1 ff ff                  call     0x10017a10  ; EditableTextFrame::SetValue
  1001B818:  68 f8 2c 05 10                  push     0x10052cf8
  1001B81D:  e8 5e af 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001B822:  50                              push     eax
  1001B823:  e8 08 a8 00 00                  call     0x10026030  ; UI::ButtonClick, ButtonClick
  1001B828:  83 c4 08                        add      esp, 8
  1001B82B:  8d 4d ac                        lea      ecx, [ebp - 0x54]
  1001B82E:  8a d8                           mov      bl, al
  1001B830:  e8 1b 8a fe ff                  call     0x10004250
  1001B835:  8a c3                           mov      al, bl
  1001B837:  eb 06                           jmp      0x1001b83f
  1001B839:  b0 01                           mov      al, 1
  1001B83B:  eb 02                           jmp      0x1001b83f
  1001B83D:  32 c0                           xor      al, al
  1001B83F:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  1001B842:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  1001B849:  59                              pop      ecx
  1001B84A:  5f                              pop      edi
  1001B84B:  5e                              pop      esi
  1001B84C:  5b                              pop      ebx
  1001B84D:  8b 4d f0                        mov      ecx, dword ptr [ebp - 0x10]
  1001B850:  33 cd                           xor      ecx, ebp
  1001B852:  e8 60 0b 01 00                  call     0x1002c3b7
  1001B857:  8b e5                           mov      esp, ebp
  1001B859:  5d                              pop      ebp
  1001B85A:  c3                              ret      


; === Items::EquipItem ===
; RVA: 0x0001B860  Size: 156 bytes
; Exports: ?EquipItem@Items@GW@@YA_NPBUItem@2@I@Z
;
  1001B860:  55                              push     ebp
  1001B861:  8b ec                           mov      ebp, esp
  1001B863:  83 ec 08                        sub      esp, 8
  1001B866:  56                              push     esi
  1001B867:  57                              push     edi
  1001B868:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  1001B86B:  85 ff                           test     edi, edi
  1001B86D:  74 0c                           je       0x1001b87b
  1001B86F:  8b 47 0c                        mov      eax, dword ptr [edi + 0xc]
  1001B872:  85 c0                           test     eax, eax
  1001B874:  74 3a                           je       0x1001b8b0
  1001B876:  83 38 04                        cmp      dword ptr [eax], 4
  1001B879:  75 35                           jne      0x1001b8b0
  1001B87B:  e8 e0 1b 00 00                  call     0x1001d460  ; Map::GetInstanceType, GetInstanceType
  1001B880:  85 c0                           test     eax, eax
  1001B882:  75 70                           jne      0x1001b8f4
  1001B884:  e8 17 1d 00 00                  call     0x1001d5a0  ; Map::GetMapID, GetMapID
  1001B889:  50                              push     eax
  1001B88A:  e8 31 1d 00 00                  call     0x1001d5c0  ; Map::GetMapInfo, GetMapInfo
  1001B88F:  83 c4 04                        add      esp, 4
  1001B892:  85 c0                           test     eax, eax
  1001B894:  74 06                           je       0x1001b89c
  1001B896:  83 78 08 07                     cmp      dword ptr [eax + 8], 7
  1001B89A:  74 58                           je       0x1001b8f4
  1001B89C:  6a 00                           push     0
  1001B89E:  e8 7d 4e 00 00                  call     0x10020720  ; PlayerMgr::GetPlayerByID
  1001B8A3:  83 c4 04                        add      esp, 4
  1001B8A6:  85 c0                           test     eax, eax
  1001B8A8:  74 4a                           je       0x1001b8f4
  1001B8AA:  f6 40 34 02                     test     byte ptr [eax + 0x34], 2
  1001B8AE:  75 44                           jne      0x1001b8f4
  1001B8B0:  8b 75 0c                        mov      esi, dword ptr [ebp + 0xc]
  1001B8B3:  85 f6                           test     esi, esi
  1001B8B5:  75 07                           jne      0x1001b8be
  1001B8B7:  e8 14 6a fe ff                  call     0x100022d0  ; Agents::GetControlledCharacterId, GetControlledCharacterId
  1001B8BC:  8b f0                           mov      esi, eax
  1001B8BE:  85 ff                           test     edi, edi
  1001B8C0:  74 32                           je       0x1001b8f4
  1001B8C2:  85 f6                           test     esi, esi
  1001B8C4:  74 2e                           je       0x1001b8f4
  1001B8C6:  56                              push     esi
  1001B8C7:  e8 a4 66 fe ff                  call     0x10001f70  ; Agents::GetAgentByID, GetAgentByID
  1001B8CC:  83 c4 04                        add      esp, 4
  1001B8CF:  85 c0                           test     eax, eax
  1001B8D1:  74 21                           je       0x1001b8f4
  1001B8D3:  8b 07                           mov      eax, dword ptr [edi]
  1001B8D5:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  1001B8D8:  8d 45 f8                        lea      eax, [ebp - 8]
  1001B8DB:  6a 00                           push     0
  1001B8DD:  50                              push     eax
  1001B8DE:  68 aa 01 00 10                  push     0x100001aa
  1001B8E3:  89 75 fc                        mov      dword ptr [ebp - 4], esi
  1001B8E6:  e8 e5 c7 00 00                  call     0x100280d0  ; UI::SendUIMessage
  1001B8EB:  83 c4 0c                        add      esp, 0xc
  1001B8EE:  5f                              pop      edi
  1001B8EF:  5e                              pop      esi
  1001B8F0:  8b e5                           mov      esp, ebp
  1001B8F2:  5d                              pop      ebp
  1001B8F3:  c3                              ret      
  1001B8F4:  5f                              pop      edi
  1001B8F5:  32 c0                           xor      al, al
  1001B8F7:  5e                              pop      esi
  1001B8F8:  8b e5                           mov      esp, ebp
  1001B8FA:  5d                              pop      ebp
  1001B8FB:  c3                              ret      


; === Items::GetBag, GetBag ===
; RVA: 0x0001B900  Size: 47 bytes
; Exports: ?GetBag@Items@GW@@YAPAUBag@2@W43Constants@2@@Z, GetBag
;
  1001B900:  55                              push     ebp
  1001B901:  8b ec                           mov      ebp, esp
  1001B903:  53                              push     ebx
  1001B904:  8a 5d 08                        mov      bl, byte ptr [ebp + 8]
  1001B907:  8d 43 ff                        lea      eax, [ebx - 1]
  1001B90A:  3c 15                           cmp      al, 0x15
  1001B90C:  77 1c                           ja       0x1001b92a
  1001B90E:  e8 fd d6 ff ff                  call     0x10019010  ; GW::GetItemContext
  1001B913:  85 c0                           test     eax, eax
  1001B915:  74 13                           je       0x1001b92a
  1001B917:  8b 88 f8 00 00 00               mov      ecx, dword ptr [eax + 0xf8]
  1001B91D:  85 c9                           test     ecx, ecx
  1001B91F:  74 09                           je       0x1001b92a
  1001B921:  0f b6 c3                        movzx    eax, bl
  1001B924:  5b                              pop      ebx
  1001B925:  8b 04 81                        mov      eax, dword ptr [ecx + eax*4]
  1001B928:  5d                              pop      ebp
  1001B929:  c3                              ret      
  1001B92A:  33 c0                           xor      eax, eax
  1001B92C:  5b                              pop      ebx
  1001B92D:  5d                              pop      ebp
  1001B92E:  c3                              ret      


; === Items::GetBagArray, Items::GetInventory, GetInventory ===
; RVA: 0x0001B930  Size: 19 bytes
; Exports: ?GetBagArray@Items@GW@@YAPAPAUBag@2@XZ, ?GetInventory@Items@GW@@YAPAUInventory@2@XZ, GetInventory
;
  1001B930:  e8 db d6 ff ff                  call     0x10019010  ; GW::GetItemContext
  1001B935:  85 c0                           test     eax, eax
  1001B937:  74 07                           je       0x1001b940
  1001B939:  8b 80 f8 00 00 00               mov      eax, dword ptr [eax + 0xf8]
  1001B93F:  c3                              ret      
  1001B940:  33 c0                           xor      eax, eax
  1001B942:  c3                              ret      


; === Items::GetBagByIndex, GetBagByIndex ===
; RVA: 0x0001B950  Size: 47 bytes
; Exports: ?GetBagByIndex@Items@GW@@YAPAUBag@2@I@Z, GetBagByIndex
;
  1001B950:  55                              push     ebp
  1001B951:  8b ec                           mov      ebp, esp
  1001B953:  8a 45 08                        mov      al, byte ptr [ebp + 8]
  1001B956:  53                              push     ebx
  1001B957:  8d 58 01                        lea      ebx, [eax + 1]
  1001B95A:  3c 15                           cmp      al, 0x15
  1001B95C:  77 1c                           ja       0x1001b97a
  1001B95E:  e8 ad d6 ff ff                  call     0x10019010  ; GW::GetItemContext
  1001B963:  85 c0                           test     eax, eax
  1001B965:  74 13                           je       0x1001b97a
  1001B967:  8b 88 f8 00 00 00               mov      ecx, dword ptr [eax + 0xf8]
  1001B96D:  85 c9                           test     ecx, ecx
  1001B96F:  74 09                           je       0x1001b97a
  1001B971:  0f b6 c3                        movzx    eax, bl
  1001B974:  5b                              pop      ebx
  1001B975:  8b 04 81                        mov      eax, dword ptr [ecx + eax*4]
  1001B978:  5d                              pop      ebp
  1001B979:  c3                              ret      
  1001B97A:  33 c0                           xor      eax, eax
  1001B97C:  5b                              pop      ebx
  1001B97D:  5d                              pop      ebp
  1001B97E:  c3                              ret      


; === Items::GetCompositeModelInfo, GetCompositeModelInfo ===
; RVA: 0x0001B980  Size: 67 bytes
; Exports: ?GetCompositeModelInfo@Items@GW@@YAPBUCompositeModelInfo@2@I@Z, GetCompositeModelInfo
;
  1001B980:  55                              push     ebp
  1001B981:  8b ec                           mov      ebp, esp
  1001B983:  56                              push     esi
  1001B984:  8b 35 9c c2 08 10               mov      esi, dword ptr [0x1008c29c]
  1001B98A:  57                              push     edi
  1001B98B:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  1001B98E:  3b 7e 08                        cmp      edi, dword ptr [esi + 8]
  1001B991:  73 2a                           jae      0x1001b9bd
  1001B993:  83 3e 00                        cmp      dword ptr [esi], 0
  1001B996:  75 19                           jne      0x1001b9b1
  1001B998:  68 88 2d 05 10                  push     0x10052d88  ; "GW::BaseArray<struct GW::CompositeModelInfo>::at"
  1001B99D:  6a 23                           push     0x23
  1001B99F:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  1001B9A4:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  1001B9A9:  e8 c2 9e fe ff                  call     0x10005870  ; GW::FatalAssert
  1001B9AE:  83 c4 10                        add      esp, 0x10
  1001B9B1:  8d 04 7f                        lea      eax, [edi + edi*2]
  1001B9B4:  c1 e0 04                        shl      eax, 4
  1001B9B7:  03 06                           add      eax, dword ptr [esi]
  1001B9B9:  5f                              pop      edi
  1001B9BA:  5e                              pop      esi
  1001B9BB:  5d                              pop      ebp
  1001B9BC:  c3                              ret      
  1001B9BD:  5f                              pop      edi
  1001B9BE:  33 c0                           xor      eax, eax
  1001B9C0:  5e                              pop      esi
  1001B9C1:  5d                              pop      ebp
  1001B9C2:  c3                              ret      


; === Items::GetCompositeModelInfoArray ===
; RVA: 0x0001B9D0  Size: 6 bytes
; Exports: ?GetCompositeModelInfoArray@Items@GW@@YAABV?$BaseArray@UCompositeModelInfo@GW@@@2@XZ
;
  1001B9D0:  a1 9c c2 08 10                  mov      eax, dword ptr [0x1008c29c]
  1001B9D5:  c3                              ret      


; === Items::GetEquipmentVisibility, GetEquipmentVisibility ===
; RVA: 0x0001B9E0  Size: 40 bytes
; Exports: ?GetEquipmentVisibility@Items@GW@@YA?AW4EquipmentStatus@2@W4EquipmentType@2@@Z, GetEquipmentVisibility
;
  1001B9E0:  55                              push     ebp
  1001B9E1:  8b ec                           mov      ebp, esp
  1001B9E3:  e8 b8 d6 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  1001B9E8:  85 c0                           test     eax, eax
  1001B9EA:  74 10                           je       0x1001b9fc
  1001B9EC:  8b 80 c8 07 00 00               mov      eax, dword ptr [eax + 0x7c8]
  1001B9F2:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001B9F5:  d3 e8                           shr      eax, cl
  1001B9F7:  83 e0 03                        and      eax, 3
  1001B9FA:  5d                              pop      ebp
  1001B9FB:  c3                              ret      
  1001B9FC:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001B9FF:  33 c0                           xor      eax, eax
  1001BA01:  d3 e8                           shr      eax, cl
  1001BA03:  83 e0 03                        and      eax, 3
  1001BA06:  5d                              pop      ebp
  1001BA07:  c3                              ret      


; === Items::GetGoldAmountInStorage, GetGoldAmountInStorage ===
; RVA: 0x0001BA10  Size: 29 bytes
; Exports: ?GetGoldAmountInStorage@Items@GW@@YAIXZ, GetGoldAmountInStorage
;
  1001BA10:  e8 fb d5 ff ff                  call     0x10019010  ; GW::GetItemContext
  1001BA15:  85 c0                           test     eax, eax
  1001BA17:  74 11                           je       0x1001ba2a
  1001BA19:  8b 80 f8 00 00 00               mov      eax, dword ptr [eax + 0xf8]
  1001BA1F:  85 c0                           test     eax, eax
  1001BA21:  74 07                           je       0x1001ba2a
  1001BA23:  8b 80 94 00 00 00               mov      eax, dword ptr [eax + 0x94]
  1001BA29:  c3                              ret      
  1001BA2A:  33 c0                           xor      eax, eax
  1001BA2C:  c3                              ret      


; === Items::GetGoldAmountOnCharacter, GetGoldAmountOnCharacter ===
; RVA: 0x0001BA30  Size: 29 bytes
; Exports: ?GetGoldAmountOnCharacter@Items@GW@@YAIXZ, GetGoldAmountOnCharacter
;
  1001BA30:  e8 db d5 ff ff                  call     0x10019010  ; GW::GetItemContext
  1001BA35:  85 c0                           test     eax, eax
  1001BA37:  74 11                           je       0x1001ba4a
  1001BA39:  8b 80 f8 00 00 00               mov      eax, dword ptr [eax + 0xf8]
  1001BA3F:  85 c0                           test     eax, eax
  1001BA41:  74 07                           je       0x1001ba4a
  1001BA43:  8b 80 90 00 00 00               mov      eax, dword ptr [eax + 0x90]
  1001BA49:  c3                              ret      
  1001BA4A:  33 c0                           xor      eax, eax
  1001BA4C:  c3                              ret      


; === Items::GetHoveredItem, GetHoveredItem ===
; RVA: 0x0001BA50  Size: 79 bytes
; Exports: ?GetHoveredItem@Items@GW@@YAPAUItem@2@XZ, GetHoveredItem
;
  1001BA50:  e8 8b ac 00 00                  call     0x100266e0  ; UI::GetCurrentTooltip
  1001BA55:  85 c0                           test     eax, eax
  1001BA57:  74 43                           je       0x1001ba9c
  1001BA59:  8b 48 0c                        mov      ecx, dword ptr [eax + 0xc]
  1001BA5C:  83 f9 08                        cmp      ecx, 8
  1001BA5F:  75 17                           jne      0x1001ba78
  1001BA61:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  1001BA64:  81 78 04 ff 00 00 00            cmp      dword ptr [eax + 4], 0xff
  1001BA6B:  75 2f                           jne      0x1001ba9c
  1001BA6D:  ff 30                           push     dword ptr [eax]
  1001BA6F:  e8 bc 00 00 00                  call     0x1001bb30  ; Items::GetItemById
  1001BA74:  83 c4 04                        add      esp, 4
  1001BA77:  c3                              ret      
  1001BA78:  83 f9 0c                        cmp      ecx, 0xc
  1001BA7B:  75 1f                           jne      0x1001ba9c
  1001BA7D:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  1001BA80:  81 78 08 ff 00 00 00            cmp      dword ptr [eax + 8], 0xff
  1001BA87:  75 13                           jne      0x1001ba9c
  1001BA89:  8b 08                           mov      ecx, dword ptr [eax]
  1001BA8B:  85 c9                           test     ecx, ecx
  1001BA8D:  75 03                           jne      0x1001ba92
  1001BA8F:  8b 48 04                        mov      ecx, dword ptr [eax + 4]
  1001BA92:  51                              push     ecx
  1001BA93:  e8 98 00 00 00                  call     0x1001bb30  ; Items::GetItemById
  1001BA98:  83 c4 04                        add      esp, 4
  1001BA9B:  c3                              ret      
  1001BA9C:  33 c0                           xor      eax, eax
  1001BA9E:  c3                              ret      


; === Items::GetIsStorageOpen, GetIsStorageOpen ===
; RVA: 0x0001BAD0  Size: 19 bytes
; Exports: ?GetIsStorageOpen@Items@GW@@YA_NXZ, GetIsStorageOpen
;
  1001BAD0:  68 a0 2a 05 10                  push     0x10052aa0
  1001BAD5:  e8 a6 ac 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001BADA:  83 c4 04                        add      esp, 4
  1001BADD:  85 c0                           test     eax, eax
  1001BADF:  0f 95 c0                        setne    al
  1001BAE2:  c3                              ret      


; === Items::GetItemArray ===
; RVA: 0x0001BB10  Size: 22 bytes
; Exports: ?GetItemArray@Items@GW@@YAPAV?$Array@PAUItem@GW@@@2@XZ
;
  1001BB10:  e8 fb d4 ff ff                  call     0x10019010  ; GW::GetItemContext
  1001BB15:  85 c0                           test     eax, eax
  1001BB17:  74 0a                           je       0x1001bb23
  1001BB19:  05 b8 00 00 00                  add      eax, 0xb8
  1001BB1E:  83 38 00                        cmp      dword ptr [eax], 0
  1001BB21:  75 02                           jne      0x1001bb25
  1001BB23:  33 c0                           xor      eax, eax
  1001BB25:  c3                              ret      


; === Items::GetItemById ===
; RVA: 0x0001BB30  Size: 92 bytes
; Exports: ?GetItemById@Items@GW@@YAPAUItem@2@I@Z
;
  1001BB30:  55                              push     ebp
  1001BB31:  8b ec                           mov      ebp, esp
  1001BB33:  56                              push     esi
  1001BB34:  57                              push     edi
  1001BB35:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  1001BB38:  85 ff                           test     edi, edi
  1001BB3A:  74 4a                           je       0x1001bb86
  1001BB3C:  e8 cf d4 ff ff                  call     0x10019010  ; GW::GetItemContext
  1001BB41:  85 c0                           test     eax, eax
  1001BB43:  74 0f                           je       0x1001bb54
  1001BB45:  83 b8 b8 00 00 00 00            cmp      dword ptr [eax + 0xb8], 0
  1001BB4C:  8d b0 b8 00 00 00               lea      esi, [eax + 0xb8]
  1001BB52:  75 02                           jne      0x1001bb56
  1001BB54:  33 f6                           xor      esi, esi
  1001BB56:  85 f6                           test     esi, esi
  1001BB58:  74 2c                           je       0x1001bb86
  1001BB5A:  3b 7e 08                        cmp      edi, dword ptr [esi + 8]
  1001BB5D:  73 27                           jae      0x1001bb86
  1001BB5F:  83 3e 00                        cmp      dword ptr [esi], 0
  1001BB62:  75 19                           jne      0x1001bb7d
  1001BB64:  68 34 2d 05 10                  push     0x10052d34  ; "GW::BaseArray<struct GW::Item *>::at"
  1001BB69:  6a 1e                           push     0x1e
  1001BB6B:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  1001BB70:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  1001BB75:  e8 f6 9c fe ff                  call     0x10005870  ; GW::FatalAssert
  1001BB7A:  83 c4 10                        add      esp, 0x10
  1001BB7D:  8b 06                           mov      eax, dword ptr [esi]
  1001BB7F:  8b 04 b8                        mov      eax, dword ptr [eax + edi*4]
  1001BB82:  5f                              pop      edi
  1001BB83:  5e                              pop      esi
  1001BB84:  5d                              pop      ebp
  1001BB85:  c3                              ret      
  1001BB86:  5f                              pop      edi
  1001BB87:  33 c0                           xor      eax, eax
  1001BB89:  5e                              pop      esi
  1001BB8A:  5d                              pop      ebp
  1001BB8B:  c3                              ret      


; === Items::GetItemByModelId ===
; RVA: 0x0001BB90  Size: 117 bytes
; Exports: ?GetItemByModelId@Items@GW@@YAPAUItem@2@IHH@Z
;
  1001BB90:  55                              push     ebp
  1001BB91:  8b ec                           mov      ebp, esp
  1001BB93:  53                              push     ebx
  1001BB94:  8b 5d 0c                        mov      ebx, dword ptr [ebp + 0xc]
  1001BB97:  56                              push     esi
  1001BB98:  57                              push     edi
  1001BB99:  8b 7d 10                        mov      edi, dword ptr [ebp + 0x10]
  1001BB9C:  3b df                           cmp      ebx, edi
  1001BB9E:  7f 57                           jg       0x1001bbf7
  1001BBA0:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  1001BBA3:  8d 43 ff                        lea      eax, [ebx - 1]
  1001BBA6:  3c 15                           cmp      al, 0x15
  1001BBA8:  77 48                           ja       0x1001bbf2
  1001BBAA:  e8 61 d4 ff ff                  call     0x10019010  ; GW::GetItemContext
  1001BBAF:  85 c0                           test     eax, eax
  1001BBB1:  74 12                           je       0x1001bbc5
  1001BBB3:  8b 88 f8 00 00 00               mov      ecx, dword ptr [eax + 0xf8]
  1001BBB9:  85 c9                           test     ecx, ecx
  1001BBBB:  74 08                           je       0x1001bbc5
  1001BBBD:  0f b6 c3                        movzx    eax, bl
  1001BBC0:  8b 0c 81                        mov      ecx, dword ptr [ecx + eax*4]
  1001BBC3:  eb 02                           jmp      0x1001bbc7
  1001BBC5:  33 c9                           xor      ecx, ecx
  1001BBC7:  85 c9                           test     ecx, ecx
  1001BBC9:  74 27                           je       0x1001bbf2
  1001BBCB:  8b 41 18                        mov      eax, dword ptr [ecx + 0x18]
  1001BBCE:  85 c0                           test     eax, eax
  1001BBD0:  74 20                           je       0x1001bbf2
  1001BBD2:  8b 49 20                        mov      ecx, dword ptr [ecx + 0x20]
  1001BBD5:  8d 14 88                        lea      edx, [eax + ecx*4]
  1001BBD8:  3b c2                           cmp      eax, edx
  1001BBDA:  74 16                           je       0x1001bbf2
  1001BBDC:  0f 1f 40 00                     nop      dword ptr [eax]
  1001BBE0:  8b 08                           mov      ecx, dword ptr [eax]
  1001BBE2:  85 c9                           test     ecx, ecx
  1001BBE4:  74 05                           je       0x1001bbeb
  1001BBE6:  39 71 2c                        cmp      dword ptr [ecx + 0x2c], esi
  1001BBE9:  74 13                           je       0x1001bbfe
  1001BBEB:  83 c0 04                        add      eax, 4
  1001BBEE:  3b c2                           cmp      eax, edx
  1001BBF0:  75 ee                           jne      0x1001bbe0
  1001BBF2:  43                              inc      ebx
  1001BBF3:  3b df                           cmp      ebx, edi
  1001BBF5:  7e ac                           jle      0x1001bba3
  1001BBF7:  5f                              pop      edi
  1001BBF8:  5e                              pop      esi
  1001BBF9:  33 c0                           xor      eax, eax
  1001BBFB:  5b                              pop      ebx
  1001BBFC:  5d                              pop      ebp
  1001BBFD:  c3                              ret      
  1001BBFE:  5f                              pop      edi
  1001BBFF:  5e                              pop      esi
  1001BC00:  8b c1                           mov      eax, ecx
  1001BC02:  5b                              pop      ebx
  1001BC03:  5d                              pop      ebp
  1001BC04:  c3                              ret      


; === Items::GetItemByModelIdAndModifiers ===
; RVA: 0x0001BC10  Size: 265 bytes
; Exports: ?GetItemByModelIdAndModifiers@Items@GW@@YAPAUItem@2@IPBUItemModifier@2@IHH@Z
;
  1001BC10:  55                              push     ebp
  1001BC11:  8b ec                           mov      ebp, esp
  1001BC13:  51                              push     ecx
  1001BC14:  53                              push     ebx
  1001BC15:  56                              push     esi
  1001BC16:  8b 75 10                        mov      esi, dword ptr [ebp + 0x10]
  1001BC19:  57                              push     edi
  1001BC1A:  85 f6                           test     esi, esi
  1001BC1C:  0f 84 e5 00 00 00               je       0x1001bd07
  1001BC22:  83 7d 0c 00                     cmp      dword ptr [ebp + 0xc], 0
  1001BC26:  0f 84 db 00 00 00               je       0x1001bd07
  1001BC2C:  8b 45 14                        mov      eax, dword ptr [ebp + 0x14]
  1001BC2F:  8b 5d 18                        mov      ebx, dword ptr [ebp + 0x18]
  1001BC32:  3b c3                           cmp      eax, ebx
  1001BC34:  0f 8f cd 00 00 00               jg       0x1001bd07
  1001BC3A:  66 0f 1f 44 00 00               nop      word ptr [eax + eax]
  1001BC40:  fe c8                           dec      al
  1001BC42:  3c 15                           cmp      al, 0x15
  1001BC44:  0f 87 ae 00 00 00               ja       0x1001bcf8
  1001BC4A:  e8 c1 d3 ff ff                  call     0x10019010  ; GW::GetItemContext
  1001BC4F:  85 c0                           test     eax, eax
  1001BC51:  74 15                           je       0x1001bc68
  1001BC53:  8b 88 f8 00 00 00               mov      ecx, dword ptr [eax + 0xf8]
  1001BC59:  85 c9                           test     ecx, ecx
  1001BC5B:  74 0b                           je       0x1001bc68
  1001BC5D:  8b 45 14                        mov      eax, dword ptr [ebp + 0x14]
  1001BC60:  0f b6 c0                        movzx    eax, al
  1001BC63:  8b 04 81                        mov      eax, dword ptr [ecx + eax*4]
  1001BC66:  eb 02                           jmp      0x1001bc6a
  1001BC68:  33 c0                           xor      eax, eax
  1001BC6A:  85 c0                           test     eax, eax
  1001BC6C:  0f 84 86 00 00 00               je       0x1001bcf8
  1001BC72:  8b 58 18                        mov      ebx, dword ptr [eax + 0x18]
  1001BC75:  8b 40 20                        mov      eax, dword ptr [eax + 0x20]
  1001BC78:  8d 3c 83                        lea      edi, [ebx + eax*4]
  1001BC7B:  89 7d fc                        mov      dword ptr [ebp - 4], edi
  1001BC7E:  3b df                           cmp      ebx, edi
  1001BC80:  74 73                           je       0x1001bcf5
  1001BC82:  8b c7                           mov      eax, edi
  1001BC84:  8b 3b                           mov      edi, dword ptr [ebx]
  1001BC86:  85 ff                           test     edi, edi
  1001BC88:  74 64                           je       0x1001bcee
  1001BC8A:  39 77 14                        cmp      dword ptr [edi + 0x14], esi
  1001BC8D:  75 5f                           jne      0x1001bcee
  1001BC8F:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001BC92:  39 4f 2c                        cmp      dword ptr [edi + 0x2c], ecx
  1001BC95:  75 57                           jne      0x1001bcee
  1001BC97:  8b 57 10                        mov      edx, dword ptr [edi + 0x10]
  1001BC9A:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  1001BC9D:  c1 e6 02                        shl      esi, 2
  1001BCA0:  83 ee 04                        sub      esi, 4
  1001BCA3:  72 11                           jb       0x1001bcb6
  1001BCA5:  8b 0a                           mov      ecx, dword ptr [edx]
  1001BCA7:  3b 08                           cmp      ecx, dword ptr [eax]
  1001BCA9:  75 10                           jne      0x1001bcbb
  1001BCAB:  83 c2 04                        add      edx, 4
  1001BCAE:  83 c0 04                        add      eax, 4
  1001BCB1:  83 ee 04                        sub      esi, 4
  1001BCB4:  73 ef                           jae      0x1001bca5
  1001BCB6:  83 fe fc                        cmp      esi, -4
  1001BCB9:  74 55                           je       0x1001bd10
  1001BCBB:  8a 0a                           mov      cl, byte ptr [edx]
  1001BCBD:  3a 08                           cmp      cl, byte ptr [eax]
  1001BCBF:  75 27                           jne      0x1001bce8
  1001BCC1:  83 fe fd                        cmp      esi, -3
  1001BCC4:  74 4a                           je       0x1001bd10
  1001BCC6:  8a 4a 01                        mov      cl, byte ptr [edx + 1]
  1001BCC9:  3a 48 01                        cmp      cl, byte ptr [eax + 1]
  1001BCCC:  75 1a                           jne      0x1001bce8
  1001BCCE:  83 fe fe                        cmp      esi, -2
  1001BCD1:  74 3d                           je       0x1001bd10
  1001BCD3:  8a 4a 02                        mov      cl, byte ptr [edx + 2]
  1001BCD6:  3a 48 02                        cmp      cl, byte ptr [eax + 2]
  1001BCD9:  75 0d                           jne      0x1001bce8
  1001BCDB:  83 fe ff                        cmp      esi, -1
  1001BCDE:  74 30                           je       0x1001bd10
  1001BCE0:  8a 4a 03                        mov      cl, byte ptr [edx + 3]
  1001BCE3:  3a 48 03                        cmp      cl, byte ptr [eax + 3]
  1001BCE6:  74 28                           je       0x1001bd10
  1001BCE8:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  1001BCEB:  8b 75 10                        mov      esi, dword ptr [ebp + 0x10]
  1001BCEE:  83 c3 04                        add      ebx, 4
  1001BCF1:  3b d8                           cmp      ebx, eax
  1001BCF3:  75 8f                           jne      0x1001bc84
  1001BCF5:  8b 5d 18                        mov      ebx, dword ptr [ebp + 0x18]
  1001BCF8:  8b 45 14                        mov      eax, dword ptr [ebp + 0x14]
  1001BCFB:  40                              inc      eax
  1001BCFC:  89 45 14                        mov      dword ptr [ebp + 0x14], eax
  1001BCFF:  3b c3                           cmp      eax, ebx
  1001BD01:  0f 8e 39 ff ff ff               jle      0x1001bc40
  1001BD07:  5f                              pop      edi
  1001BD08:  5e                              pop      esi
  1001BD09:  33 c0                           xor      eax, eax
  1001BD0B:  5b                              pop      ebx
  1001BD0C:  8b e5                           mov      esp, ebp
  1001BD0E:  5d                              pop      ebp
  1001BD0F:  c3                              ret      
  1001BD10:  8b c7                           mov      eax, edi
  1001BD12:  5f                              pop      edi
  1001BD13:  5e                              pop      esi
  1001BD14:  5b                              pop      ebx
  1001BD15:  8b e5                           mov      esp, ebp
  1001BD17:  5d                              pop      ebp
  1001BD18:  c3                              ret      


; === Items::GetItemBySlot ===
; RVA: 0x0001BD20  Size: 48 bytes
; Exports: ?GetItemBySlot@Items@GW@@YAPAUItem@2@PBUBag@2@I@Z
;
  1001BD20:  55                              push     ebp
  1001BD21:  8b ec                           mov      ebp, esp
  1001BD23:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001BD26:  85 c0                           test     eax, eax
  1001BD28:  74 22                           je       0x1001bd4c
  1001BD2A:  8b 55 0c                        mov      edx, dword ptr [ebp + 0xc]
  1001BD2D:  85 d2                           test     edx, edx
  1001BD2F:  74 1b                           je       0x1001bd4c
  1001BD31:  83 78 18 00                     cmp      dword ptr [eax + 0x18], 0
  1001BD35:  8d 48 18                        lea      ecx, [eax + 0x18]
  1001BD38:  74 12                           je       0x1001bd4c
  1001BD3A:  3b 50 20                        cmp      edx, dword ptr [eax + 0x20]
  1001BD3D:  77 0d                           ja       0x1001bd4c
  1001BD3F:  8d 42 ff                        lea      eax, [edx - 1]
  1001BD42:  50                              push     eax
  1001BD43:  e8 48 f6 ff ff                  call     0x1001b390
  1001BD48:  8b 00                           mov      eax, dword ptr [eax]
  1001BD4A:  5d                              pop      ebp
  1001BD4B:  c3                              ret      
  1001BD4C:  33 c0                           xor      eax, eax
  1001BD4E:  5d                              pop      ebp
  1001BD4F:  c3                              ret      


; === Items::GetItemFormula, GetItemFormula ===
; RVA: 0x0001BD50  Size: 78 bytes
; Exports: ?GetItemFormula@Items@GW@@YAPBUItemFormula@2@PBUItem@2@@Z, GetItemFormula
;
  1001BD50:  55                              push     ebp
  1001BD51:  8b ec                           mov      ebp, esp
  1001BD53:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001BD56:  56                              push     esi
  1001BD57:  85 c0                           test     eax, eax
  1001BD59:  74 3e                           je       0x1001bd99
  1001BD5B:  0f b7 70 48                     movzx    esi, word ptr [eax + 0x48]
  1001BD5F:  3b 35 08 c3 08 10               cmp      esi, dword ptr [0x1008c308]
  1001BD65:  73 32                           jae      0x1001bd99
  1001BD67:  8b 0d 00 c3 08 10               mov      ecx, dword ptr [0x1008c300]
  1001BD6D:  85 c9                           test     ecx, ecx
  1001BD6F:  75 1f                           jne      0x1001bd90
  1001BD71:  68 5c 2d 05 10                  push     0x10052d5c  ; "GW::BaseArray<struct GW::ItemFormula>::at"
  1001BD76:  6a 1e                           push     0x1e
  1001BD78:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  1001BD7D:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  1001BD82:  e8 e9 9a fe ff                  call     0x10005870  ; GW::FatalAssert
  1001BD87:  8b 0d 00 c3 08 10               mov      ecx, dword ptr [0x1008c300]
  1001BD8D:  83 c4 10                        add      esp, 0x10
  1001BD90:  8d 04 b6                        lea      eax, [esi + esi*4]
  1001BD93:  8d 04 81                        lea      eax, [ecx + eax*4]
  1001BD96:  5e                              pop      esi
  1001BD97:  5d                              pop      ebp
  1001BD98:  c3                              ret      
  1001BD99:  33 c0                           xor      eax, eax
  1001BD9B:  5e                              pop      esi
  1001BD9C:  5d                              pop      ebp
  1001BD9D:  c3                              ret      


; === Items::GetMaterialSlot, GetMaterialSlot ===
; RVA: 0x0001BDA0  Size: 85 bytes
; Exports: ?GetMaterialSlot@Items@GW@@YA?AW4MaterialSlot@Constants@2@PBUItem@2@@Z, GetMaterialSlot
;
  1001BDA0:  55                              push     ebp
  1001BDA1:  8b ec                           mov      ebp, esp
  1001BDA3:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001BDA6:  85 c9                           test     ecx, ecx
  1001BDA8:  74 44                           je       0x1001bdee
  1001BDAA:  56                              push     esi
  1001BDAB:  8b 71 14                        mov      esi, dword ptr [ecx + 0x14]
  1001BDAE:  33 d2                           xor      edx, edx
  1001BDB0:  85 f6                           test     esi, esi
  1001BDB2:  74 22                           je       0x1001bdd6
  1001BDB4:  8b 49 10                        mov      ecx, dword ptr [ecx + 0x10]
  1001BDB7:  66 0f 1f 84 00 00 00 00 00      nop      word ptr [eax + eax]
  1001BDC0:  8b 01                           mov      eax, dword ptr [ecx]
  1001BDC2:  25 00 00 ff ff                  and      eax, 0xffff0000
  1001BDC7:  3d 00 00 08 25                  cmp      eax, 0x25080000
  1001BDCC:  74 0a                           je       0x1001bdd8
  1001BDCE:  42                              inc      edx
  1001BDCF:  83 c1 04                        add      ecx, 4
  1001BDD2:  3b d6                           cmp      edx, esi
  1001BDD4:  72 ea                           jb       0x1001bdc0
  1001BDD6:  33 c9                           xor      ecx, ecx
  1001BDD8:  5e                              pop      esi
  1001BDD9:  85 c9                           test     ecx, ecx
  1001BDDB:  74 11                           je       0x1001bdee
  1001BDDD:  0f b6 41 01                     movzx    eax, byte ptr [ecx + 1]
  1001BDE1:  b9 29 00 00 00                  mov      ecx, 0x29
  1001BDE6:  83 f8 26                        cmp      eax, 0x26
  1001BDE9:  0f 43 c1                        cmovae   eax, ecx
  1001BDEC:  5d                              pop      ebp
  1001BDED:  c3                              ret      
  1001BDEE:  b8 29 00 00 00                  mov      eax, 0x29
  1001BDF3:  5d                              pop      ebp
  1001BDF4:  c3                              ret      


; === Items::GetMaterialStorageStackSize, GetMaterialStorageStackSize ===
; RVA: 0x0001BE00  Size: 64 bytes
; Exports: ?GetMaterialStorageStackSize@Items@GW@@YAIXZ, GetMaterialStorageStackSize
;
  1001BE00:  e8 cb d1 ff ff                  call     0x10018fd0  ; GW::GetGameContext
  1001BE05:  85 c0                           test     eax, eax
  1001BE07:  74 26                           je       0x1001be2f
  1001BE09:  8b 48 28                        mov      ecx, dword ptr [eax + 0x28]
  1001BE0C:  85 c9                           test     ecx, ecx
  1001BE0E:  74 1f                           je       0x1001be2f
  1001BE10:  8b 01                           mov      eax, dword ptr [ecx]
  1001BE12:  8b 49 08                        mov      ecx, dword ptr [ecx + 8]
  1001BE15:  8d 0c 49                        lea      ecx, [ecx + ecx*2]
  1001BE18:  8d 0c 88                        lea      ecx, [eax + ecx*4]
  1001BE1B:  3b c1                           cmp      eax, ecx
  1001BE1D:  74 10                           je       0x1001be2f
  1001BE1F:  90                              nop      
  1001BE20:  81 38 83 00 00 00               cmp      dword ptr [eax], 0x83
  1001BE26:  74 0d                           je       0x1001be35
  1001BE28:  83 c0 0c                        add      eax, 0xc
  1001BE2B:  3b c1                           cmp      eax, ecx
  1001BE2D:  75 f1                           jne      0x1001be20
  1001BE2F:  b8 fa 00 00 00                  mov      eax, 0xfa
  1001BE34:  c3                              ret      
  1001BE35:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  1001BE38:  40                              inc      eax
  1001BE39:  69 c0 fa 00 00 00               imul     eax, eax, 0xfa
  1001BE3F:  c3                              ret      


; === Items::GetPvPItemInfo, GetPvPItemInfo ===
; RVA: 0x0001BE40  Size: 70 bytes
; Exports: ?GetPvPItemInfo@Items@GW@@YAPBUPvPItemInfo@2@I@Z, GetPvPItemInfo
;
  1001BE40:  55                              push     ebp
  1001BE41:  8b ec                           mov      ebp, esp
  1001BE43:  56                              push     esi
  1001BE44:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  1001BE47:  3b 35 fc c2 08 10               cmp      esi, dword ptr [0x1008c2fc]
  1001BE4D:  73 32                           jae      0x1001be81
  1001BE4F:  8b 0d f4 c2 08 10               mov      ecx, dword ptr [0x1008c2f4]
  1001BE55:  85 c9                           test     ecx, ecx
  1001BE57:  75 1f                           jne      0x1001be78
  1001BE59:  68 bc 2d 05 10                  push     0x10052dbc  ; "GW::BaseArray<struct GW::PvPItemInfo>::at"
  1001BE5E:  6a 23                           push     0x23
  1001BE60:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  1001BE65:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  1001BE6A:  e8 01 9a fe ff                  call     0x10005870  ; GW::FatalAssert
  1001BE6F:  8b 0d f4 c2 08 10               mov      ecx, dword ptr [0x1008c2f4]
  1001BE75:  83 c4 10                        add      esp, 0x10
  1001BE78:  8d 04 f6                        lea      eax, [esi + esi*8]
  1001BE7B:  8d 04 81                        lea      eax, [ecx + eax*4]
  1001BE7E:  5e                              pop      esi
  1001BE7F:  5d                              pop      ebp
  1001BE80:  c3                              ret      
  1001BE81:  33 c0                           xor      eax, eax
  1001BE83:  5e                              pop      esi
  1001BE84:  5d                              pop      ebp
  1001BE85:  c3                              ret      


; === Items::GetPvPItemInfoArray ===
; RVA: 0x0001BE90  Size: 6 bytes
; Exports: ?GetPvPItemInfoArray@Items@GW@@YAABV?$BaseArray@UPvPItemInfo@GW@@@2@XZ
;
  1001BE90:  b8 f4 c2 08 10                  mov      eax, 0x1008c2f4
  1001BE95:  c3                              ret      


; === Items::GetPvPItemUpgrade, GetPvPItemUpgrade ===
; RVA: 0x0001BEA0  Size: 70 bytes
; Exports: ?GetPvPItemUpgrade@Items@GW@@YAPBUPvPItemUpgradeInfo@2@I@Z, GetPvPItemUpgrade
;
  1001BEA0:  55                              push     ebp
  1001BEA1:  8b ec                           mov      ebp, esp
  1001BEA3:  56                              push     esi
  1001BEA4:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  1001BEA7:  3b 35 f0 c2 08 10               cmp      esi, dword ptr [0x1008c2f0]
  1001BEAD:  73 32                           jae      0x1001bee1
  1001BEAF:  8b 0d e8 c2 08 10               mov      ecx, dword ptr [0x1008c2e8]
  1001BEB5:  85 c9                           test     ecx, ecx
  1001BEB7:  75 1f                           jne      0x1001bed8
  1001BEB9:  68 e8 2d 05 10                  push     0x10052de8  ; "GW::BaseArray<struct GW::PvPItemUpgradeInfo>::at"
  1001BEBE:  6a 23                           push     0x23
  1001BEC0:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  1001BEC5:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  1001BECA:  e8 a1 99 fe ff                  call     0x10005870  ; GW::FatalAssert
  1001BECF:  8b 0d e8 c2 08 10               mov      ecx, dword ptr [0x1008c2e8]
  1001BED5:  83 c4 10                        add      esp, 0x10
  1001BED8:  8d 04 b6                        lea      eax, [esi + esi*4]
  1001BEDB:  8d 04 c1                        lea      eax, [ecx + eax*8]
  1001BEDE:  5e                              pop      esi
  1001BEDF:  5d                              pop      ebp
  1001BEE0:  c3                              ret      
  1001BEE1:  33 c0                           xor      eax, eax
  1001BEE3:  5e                              pop      esi
  1001BEE4:  5d                              pop      ebp
  1001BEE5:  c3                              ret      


; === Items::GetPvPItemUpgradeEncodedDescription, GetPvPItemUpgradeEncodedDescription ===
; RVA: 0x0001BEF0  Size: 118 bytes
; Exports: ?GetPvPItemUpgradeEncodedDescription@Items@GW@@YA_NIPAPA_W@Z, GetPvPItemUpgradeEncodedDescription
;
  1001BEF0:  55                              push     ebp
  1001BEF1:  8b ec                           mov      ebp, esp
  1001BEF3:  56                              push     esi
  1001BEF4:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  1001BEF7:  57                              push     edi
  1001BEF8:  3b 35 f0 c2 08 10               cmp      esi, dword ptr [0x1008c2f0]
  1001BEFE:  73 60                           jae      0x1001bf60
  1001BF00:  8b 0d e8 c2 08 10               mov      ecx, dword ptr [0x1008c2e8]
  1001BF06:  85 c9                           test     ecx, ecx
  1001BF08:  75 1f                           jne      0x1001bf29
  1001BF0A:  68 e8 2d 05 10                  push     0x10052de8  ; "GW::BaseArray<struct GW::PvPItemUpgradeInfo>::at"
  1001BF0F:  6a 23                           push     0x23
  1001BF11:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  1001BF16:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  1001BF1B:  e8 50 99 fe ff                  call     0x10005870  ; GW::FatalAssert
  1001BF20:  8b 0d e8 c2 08 10               mov      ecx, dword ptr [0x1008c2e8]
  1001BF26:  83 c4 10                        add      esp, 0x10
  1001BF29:  8d 04 b6                        lea      eax, [esi + esi*4]
  1001BF2C:  8d 04 c1                        lea      eax, [ecx + eax*8]
  1001BF2F:  85 c0                           test     eax, eax
  1001BF31:  74 2d                           je       0x1001bf60
  1001BF33:  a1 a0 c2 08 10                  mov      eax, dword ptr [0x1008c2a0]
  1001BF38:  85 c0                           test     eax, eax
  1001BF3A:  74 24                           je       0x1001bf60
  1001BF3C:  8b 7d 0c                        mov      edi, dword ptr [ebp + 0xc]
  1001BF3F:  85 ff                           test     edi, edi
  1001BF41:  74 1d                           je       0x1001bf60
  1001BF43:  57                              push     edi
  1001BF44:  8d 4d 08                        lea      ecx, [ebp + 8]
  1001BF47:  c7 07 00 00 00 00               mov      dword ptr [edi], 0
  1001BF4D:  51                              push     ecx
  1001BF4E:  6a 00                           push     0
  1001BF50:  56                              push     esi
  1001BF51:  ff d0                           call     eax
  1001BF53:  83 c4 10                        add      esp, 0x10
  1001BF56:  83 3f 00                        cmp      dword ptr [edi], 0
  1001BF59:  0f 95 c0                        setne    al
  1001BF5C:  5f                              pop      edi
  1001BF5D:  5e                              pop      esi
  1001BF5E:  5d                              pop      ebp
  1001BF5F:  c3                              ret      
  1001BF60:  5f                              pop      edi
  1001BF61:  32 c0                           xor      al, al
  1001BF63:  5e                              pop      esi
  1001BF64:  5d                              pop      ebp
  1001BF65:  c3                              ret      


; === Items::GetPvPItemUpgradeEncodedName, GetPvPItemUpgradeEncodedName ===
; RVA: 0x0001BF70  Size: 118 bytes
; Exports: ?GetPvPItemUpgradeEncodedName@Items@GW@@YA_NIPAPA_W@Z, GetPvPItemUpgradeEncodedName
;
  1001BF70:  55                              push     ebp
  1001BF71:  8b ec                           mov      ebp, esp
  1001BF73:  56                              push     esi
  1001BF74:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  1001BF77:  57                              push     edi
  1001BF78:  3b 35 f0 c2 08 10               cmp      esi, dword ptr [0x1008c2f0]
  1001BF7E:  73 60                           jae      0x1001bfe0
  1001BF80:  8b 0d e8 c2 08 10               mov      ecx, dword ptr [0x1008c2e8]
  1001BF86:  85 c9                           test     ecx, ecx
  1001BF88:  75 1f                           jne      0x1001bfa9
  1001BF8A:  68 e8 2d 05 10                  push     0x10052de8  ; "GW::BaseArray<struct GW::PvPItemUpgradeInfo>::at"
  1001BF8F:  6a 23                           push     0x23
  1001BF91:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  1001BF96:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  1001BF9B:  e8 d0 98 fe ff                  call     0x10005870  ; GW::FatalAssert
  1001BFA0:  8b 0d e8 c2 08 10               mov      ecx, dword ptr [0x1008c2e8]
  1001BFA6:  83 c4 10                        add      esp, 0x10
  1001BFA9:  8d 04 b6                        lea      eax, [esi + esi*4]
  1001BFAC:  8d 04 c1                        lea      eax, [ecx + eax*8]
  1001BFAF:  85 c0                           test     eax, eax
  1001BFB1:  74 2d                           je       0x1001bfe0
  1001BFB3:  a1 a0 c2 08 10                  mov      eax, dword ptr [0x1008c2a0]
  1001BFB8:  85 c0                           test     eax, eax
  1001BFBA:  74 24                           je       0x1001bfe0
  1001BFBC:  8b 7d 0c                        mov      edi, dword ptr [ebp + 0xc]
  1001BFBF:  85 ff                           test     edi, edi
  1001BFC1:  74 1d                           je       0x1001bfe0
  1001BFC3:  8d 4d 08                        lea      ecx, [ebp + 8]
  1001BFC6:  c7 07 00 00 00 00               mov      dword ptr [edi], 0
  1001BFCC:  51                              push     ecx
  1001BFCD:  57                              push     edi
  1001BFCE:  6a 00                           push     0
  1001BFD0:  56                              push     esi
  1001BFD1:  ff d0                           call     eax
  1001BFD3:  83 c4 10                        add      esp, 0x10
  1001BFD6:  83 3f 00                        cmp      dword ptr [edi], 0
  1001BFD9:  0f 95 c0                        setne    al
  1001BFDC:  5f                              pop      edi
  1001BFDD:  5e                              pop      esi
  1001BFDE:  5d                              pop      ebp
  1001BFDF:  c3                              ret      
  1001BFE0:  5f                              pop      edi
  1001BFE1:  32 c0                           xor      al, al
  1001BFE3:  5e                              pop      esi
  1001BFE4:  5d                              pop      ebp
  1001BFE5:  c3                              ret      


; === Items::GetPvPItemUpgradesArray ===
; RVA: 0x0001BFF0  Size: 6 bytes
; Exports: ?GetPvPItemUpgradesArray@Items@GW@@YAABV?$BaseArray@UPvPItemUpgradeInfo@GW@@@2@XZ
;
  1001BFF0:  b8 e8 c2 08 10                  mov      eax, 0x1008c2e8
  1001BFF5:  c3                              ret      


; === Items::GetSalvageSessionInfo, GetSalvageSessionInfo ===
; RVA: 0x0001C000  Size: 6 bytes
; Exports: ?GetSalvageSessionInfo@Items@GW@@YAPAUSalvageSessionInfo@2@XZ, GetSalvageSessionInfo
;
  1001C000:  a1 bc c2 08 10                  mov      eax, dword ptr [0x1008c2bc]
  1001C005:  c3                              ret      


; === Items::GetStoragePage ===
; RVA: 0x0001C010  Size: 11 bytes
; Exports: ?GetStoragePage@Items@GW@@YA?AW4StoragePane@Constants@2@XZ
;
  1001C010:  6a 14                           push     0x14
  1001C012:  e8 59 a9 00 00                  call     0x10026970  ; UI::GetPreference, GetPreference_Number
  1001C017:  83 c4 04                        add      esp, 4
  1001C01A:  c3                              ret      


; === Items::IdentifyItem ===
; RVA: 0x0001C020  Size: 345 bytes
; Exports: ?IdentifyItem@Items@GW@@YA_NII@Z
;
  1001C020:  55                              push     ebp
  1001C021:  8b ec                           mov      ebp, esp
  1001C023:  83 ec 5c                        sub      esp, 0x5c
  1001C026:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1001C02B:  33 c5                           xor      eax, ebp
  1001C02D:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001C030:  83 3d c8 c2 08 10 00            cmp      dword ptr [0x1008c2c8], 0
  1001C037:  56                              push     esi
  1001C038:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  1001C03B:  57                              push     edi
  1001C03C:  8b 7d 0c                        mov      edi, dword ptr [ebp + 0xc]
  1001C03F:  0f 84 22 01 00 00               je       0x1001c167
  1001C045:  56                              push     esi
  1001C046:  e8 e5 fa ff ff                  call     0x1001bb30  ; Items::GetItemById
  1001C04B:  83 c4 04                        add      esp, 4
  1001C04E:  85 c0                           test     eax, eax
  1001C050:  74 0c                           je       0x1001c05e
  1001C052:  8b 40 0c                        mov      eax, dword ptr [eax + 0xc]
  1001C055:  85 c0                           test     eax, eax
  1001C057:  74 4a                           je       0x1001c0a3
  1001C059:  83 38 04                        cmp      dword ptr [eax], 4
  1001C05C:  75 45                           jne      0x1001c0a3
  1001C05E:  e8 fd 13 00 00                  call     0x1001d460  ; Map::GetInstanceType, GetInstanceType
  1001C063:  85 c0                           test     eax, eax
  1001C065:  0f 85 fc 00 00 00               jne      0x1001c167
  1001C06B:  e8 30 15 00 00                  call     0x1001d5a0  ; Map::GetMapID, GetMapID
  1001C070:  50                              push     eax
  1001C071:  e8 4a 15 00 00                  call     0x1001d5c0  ; Map::GetMapInfo, GetMapInfo
  1001C076:  83 c4 04                        add      esp, 4
  1001C079:  85 c0                           test     eax, eax
  1001C07B:  74 0a                           je       0x1001c087
  1001C07D:  83 78 08 07                     cmp      dword ptr [eax + 8], 7
  1001C081:  0f 84 e0 00 00 00               je       0x1001c167
  1001C087:  6a 00                           push     0
  1001C089:  e8 92 46 00 00                  call     0x10020720  ; PlayerMgr::GetPlayerByID
  1001C08E:  83 c4 04                        add      esp, 4
  1001C091:  85 c0                           test     eax, eax
  1001C093:  0f 84 ce 00 00 00               je       0x1001c167
  1001C099:  f6 40 34 02                     test     byte ptr [eax + 0x34], 2
  1001C09D:  0f 85 c4 00 00 00               jne      0x1001c167
  1001C0A3:  57                              push     edi
  1001C0A4:  e8 87 fa ff ff                  call     0x1001bb30  ; Items::GetItemById
  1001C0A9:  83 c4 04                        add      esp, 4
  1001C0AC:  85 c0                           test     eax, eax
  1001C0AE:  74 0c                           je       0x1001c0bc
  1001C0B0:  8b 40 0c                        mov      eax, dword ptr [eax + 0xc]
  1001C0B3:  85 c0                           test     eax, eax
  1001C0B5:  74 42                           je       0x1001c0f9
  1001C0B7:  83 38 04                        cmp      dword ptr [eax], 4
  1001C0BA:  75 3d                           jne      0x1001c0f9
  1001C0BC:  e8 9f 13 00 00                  call     0x1001d460  ; Map::GetInstanceType, GetInstanceType
  1001C0C1:  85 c0                           test     eax, eax
  1001C0C3:  0f 85 9e 00 00 00               jne      0x1001c167
  1001C0C9:  e8 d2 14 00 00                  call     0x1001d5a0  ; Map::GetMapID, GetMapID
  1001C0CE:  50                              push     eax
  1001C0CF:  e8 ec 14 00 00                  call     0x1001d5c0  ; Map::GetMapInfo, GetMapInfo
  1001C0D4:  83 c4 04                        add      esp, 4
  1001C0D7:  85 c0                           test     eax, eax
  1001C0D9:  74 0a                           je       0x1001c0e5
  1001C0DB:  83 78 08 07                     cmp      dword ptr [eax + 8], 7
  1001C0DF:  0f 84 82 00 00 00               je       0x1001c167
  1001C0E5:  6a 00                           push     0
  1001C0E7:  e8 34 46 00 00                  call     0x10020720  ; PlayerMgr::GetPlayerByID
  1001C0EC:  83 c4 04                        add      esp, 4
  1001C0EF:  85 c0                           test     eax, eax
  1001C0F1:  74 74                           je       0x1001c167
  1001C0F3:  f6 40 34 02                     test     byte ptr [eax + 0x34], 2
  1001C0F7:  75 6e                           jne      0x1001c167
  1001C0F9:  8d 45 ac                        lea      eax, [ebp - 0x54]
  1001C0FC:  c7 45 bc 00 00 00 00            mov      dword ptr [ebp - 0x44], 0
  1001C103:  6a 30                           push     0x30
  1001C105:  89 45 b4                        mov      dword ptr [ebp - 0x4c], eax
  1001C108:  0f 57 c0                        xorps    xmm0, xmm0
  1001C10B:  8d 45 cc                        lea      eax, [ebp - 0x34]
  1001C10E:  c7 45 c0 28 00 00 00            mov      dword ptr [ebp - 0x40], 0x28
  1001C115:  6a 00                           push     0
  1001C117:  50                              push     eax
  1001C118:  66 0f 13 45 a4                  movlpd   qword ptr [ebp - 0x5c], xmm0
  1001C11D:  c7 45 b8 00 00 00 00            mov      dword ptr [ebp - 0x48], 0
  1001C124:  c7 45 ac 0d 00 00 00            mov      dword ptr [ebp - 0x54], 0xd
  1001C12B:  89 75 b0                        mov      dword ptr [ebp - 0x50], esi
  1001C12E:  e8 7d 1f 01 00                  call     0x1002e0b0
  1001C133:  8d 45 cc                        lea      eax, [ebp - 0x34]
  1001C136:  89 7d e4                        mov      dword ptr [ebp - 0x1c], edi
  1001C139:  89 45 c8                        mov      dword ptr [ebp - 0x38], eax
  1001C13C:  8d 45 c8                        lea      eax, [ebp - 0x38]
  1001C13F:  89 45 c4                        mov      dword ptr [ebp - 0x3c], eax
  1001C142:  8d 45 a4                        lea      eax, [ebp - 0x5c]
  1001C145:  6a 00                           push     0
  1001C147:  50                              push     eax
  1001C148:  8d 45 bc                        lea      eax, [ebp - 0x44]
  1001C14B:  50                              push     eax
  1001C14C:  ff 15 c8 c2 08 10               call     dword ptr [0x1008c2c8]
  1001C152:  83 c4 18                        add      esp, 0x18
  1001C155:  b0 01                           mov      al, 1
  1001C157:  5f                              pop      edi
  1001C158:  5e                              pop      esi
  1001C159:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001C15C:  33 cd                           xor      ecx, ebp
  1001C15E:  e8 54 02 01 00                  call     0x1002c3b7
  1001C163:  8b e5                           mov      esp, ebp
  1001C165:  5d                              pop      ebp
  1001C166:  c3                              ret      
  1001C167:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001C16A:  32 c0                           xor      al, al
  1001C16C:  5f                              pop      edi
  1001C16D:  33 cd                           xor      ecx, ebp
  1001C16F:  5e                              pop      esi
  1001C170:  e8 42 02 01 00                  call     0x1002c3b7
  1001C175:  8b e5                           mov      esp, ebp
  1001C177:  5d                              pop      ebp
  1001C178:  c3                              ret      


; === Items::MoveItem, MoveItemToItem ===
; RVA: 0x0001C180  Size: 82 bytes
; Exports: ?MoveItem@Items@GW@@YA_NPBUItem@2@0I@Z, MoveItemToItem
;
  1001C180:  55                              push     ebp
  1001C181:  8b ec                           mov      ebp, esp
  1001C183:  83 ec 14                        sub      esp, 0x14
  1001C186:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1001C18B:  33 c5                           xor      eax, ebp
  1001C18D:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001C190:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001C193:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  1001C196:  6a 00                           push     0
  1001C198:  8b 00                           mov      eax, dword ptr [eax]
  1001C19A:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  1001C19D:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  1001C1A0:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  1001C1A3:  8b 41 0c                        mov      eax, dword ptr [ecx + 0xc]
  1001C1A6:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  1001C1A9:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  1001C1AC:  0f b6 41 50                     movzx    eax, byte ptr [ecx + 0x50]
  1001C1B0:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  1001C1B3:  8d 45 ec                        lea      eax, [ebp - 0x14]
  1001C1B6:  50                              push     eax
  1001C1B7:  68 05 00 00 30                  push     0x30000005
  1001C1BC:  e8 0f bf 00 00                  call     0x100280d0  ; UI::SendUIMessage
  1001C1C1:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001C1C4:  83 c4 0c                        add      esp, 0xc
  1001C1C7:  33 cd                           xor      ecx, ebp
  1001C1C9:  e8 e9 01 01 00                  call     0x1002c3b7
  1001C1CE:  8b e5                           mov      esp, ebp
  1001C1D0:  5d                              pop      ebp
  1001C1D1:  c3                              ret      


; === Items::MoveItem ===
; RVA: 0x0001C1E0  Size: 78 bytes
; Exports: ?MoveItem@Items@GW@@YA_NPBUItem@2@PBUBag@2@II@Z
;
  1001C1E0:  55                              push     ebp
  1001C1E1:  8b ec                           mov      ebp, esp
  1001C1E3:  83 ec 14                        sub      esp, 0x14
  1001C1E6:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1001C1EB:  33 c5                           xor      eax, ebp
  1001C1ED:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001C1F0:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001C1F3:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  1001C1F6:  6a 00                           push     0
  1001C1F8:  8b 00                           mov      eax, dword ptr [eax]
  1001C1FA:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  1001C1FD:  8b 45 14                        mov      eax, dword ptr [ebp + 0x14]
  1001C200:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  1001C203:  8b 41 04                        mov      eax, dword ptr [ecx + 4]
  1001C206:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  1001C209:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  1001C20C:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  1001C20F:  8d 45 ec                        lea      eax, [ebp - 0x14]
  1001C212:  50                              push     eax
  1001C213:  68 05 00 00 30                  push     0x30000005
  1001C218:  e8 b3 be 00 00                  call     0x100280d0  ; UI::SendUIMessage
  1001C21D:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001C220:  83 c4 0c                        add      esp, 0xc
  1001C223:  33 cd                           xor      ecx, ebp
  1001C225:  e8 8d 01 01 00                  call     0x1002c3b7
  1001C22A:  8b e5                           mov      esp, ebp
  1001C22C:  5d                              pop      ebp
  1001C22D:  c3                              ret      


; === Items::MoveItem, MoveItemToBag ===
; RVA: 0x0001C230  Size: 119 bytes
; Exports: ?MoveItem@Items@GW@@YA_NPBUItem@2@W4Bag@Constants@2@II@Z, MoveItemToBag
;
  1001C230:  55                              push     ebp
  1001C231:  8b ec                           mov      ebp, esp
  1001C233:  83 ec 14                        sub      esp, 0x14
  1001C236:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1001C23B:  33 c5                           xor      eax, ebp
  1001C23D:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001C240:  53                              push     ebx
  1001C241:  8a 5d 0c                        mov      bl, byte ptr [ebp + 0xc]
  1001C244:  8a c3                           mov      al, bl
  1001C246:  fe c8                           dec      al
  1001C248:  56                              push     esi
  1001C249:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  1001C24C:  3c 15                           cmp      al, 0x15
  1001C24E:  77 1b                           ja       0x1001c26b
  1001C250:  e8 bb cd ff ff                  call     0x10019010  ; GW::GetItemContext
  1001C255:  85 c0                           test     eax, eax
  1001C257:  74 12                           je       0x1001c26b
  1001C259:  8b 88 f8 00 00 00               mov      ecx, dword ptr [eax + 0xf8]
  1001C25F:  85 c9                           test     ecx, ecx
  1001C261:  74 08                           je       0x1001c26b
  1001C263:  0f b6 c3                        movzx    eax, bl
  1001C266:  8b 0c 81                        mov      ecx, dword ptr [ecx + eax*4]
  1001C269:  eb 02                           jmp      0x1001c26d
  1001C26B:  33 c9                           xor      ecx, ecx
  1001C26D:  8b 06                           mov      eax, dword ptr [esi]
  1001C26F:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  1001C272:  8b 45 14                        mov      eax, dword ptr [ebp + 0x14]
  1001C275:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  1001C278:  8b 41 04                        mov      eax, dword ptr [ecx + 4]
  1001C27B:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  1001C27E:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  1001C281:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  1001C284:  8d 45 ec                        lea      eax, [ebp - 0x14]
  1001C287:  6a 00                           push     0
  1001C289:  50                              push     eax
  1001C28A:  68 05 00 00 30                  push     0x30000005
  1001C28F:  e8 3c be 00 00                  call     0x100280d0  ; UI::SendUIMessage
  1001C294:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001C297:  83 c4 0c                        add      esp, 0xc
  1001C29A:  33 cd                           xor      ecx, ebp
  1001C29C:  5e                              pop      esi
  1001C29D:  5b                              pop      ebx
  1001C29E:  e8 14 01 01 00                  call     0x1002c3b7
  1001C2A3:  8b e5                           mov      esp, ebp
  1001C2A5:  5d                              pop      ebp
  1001C2A6:  c3                              ret      


; === Items::OpenXunlaiWindow, OpenXunlaiWindow ===
; RVA: 0x0001C890  Size: 48 bytes
; Exports: ?OpenXunlaiWindow@Items@GW@@YA_N_N0@Z, OpenXunlaiWindow
;
  1001C890:  55                              push     ebp
  1001C891:  8b ec                           mov      ebp, esp
  1001C893:  83 ec 08                        sub      esp, 8
  1001C896:  8a 45 0c                        mov      al, byte ptr [ebp + 0xc]
  1001C899:  88 45 fc                        mov      byte ptr [ebp - 4], al
  1001C89C:  8a 45 08                        mov      al, byte ptr [ebp + 8]
  1001C89F:  88 45 fd                        mov      byte ptr [ebp - 3], al
  1001C8A2:  8d 45 f8                        lea      eax, [ebp - 8]
  1001C8A5:  6a 00                           push     0
  1001C8A7:  50                              push     eax
  1001C8A8:  68 40 00 00 10                  push     0x10000040
  1001C8AD:  c7 45 f8 00 00 00 00            mov      dword ptr [ebp - 8], 0
  1001C8B4:  e8 17 b8 00 00                  call     0x100280d0  ; UI::SendUIMessage
  1001C8B9:  83 c4 0c                        add      esp, 0xc
  1001C8BC:  8b e5                           mov      esp, ebp
  1001C8BE:  5d                              pop      ebp
  1001C8BF:  c3                              ret      


; === Items::PickUpItem, PickUpItem ===
; RVA: 0x0001C8C0  Size: 73 bytes
; Exports: ?PickUpItem@Items@GW@@YA_NPBUItem@2@I@Z, PickUpItem
;
  1001C8C0:  55                              push     ebp
  1001C8C1:  8b ec                           mov      ebp, esp
  1001C8C3:  83 ec 10                        sub      esp, 0x10
  1001C8C6:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1001C8CB:  33 c5                           xor      eax, ebp
  1001C8CD:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001C8D0:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001C8D3:  83 7d 0c 00                     cmp      dword ptr [ebp + 0xc], 0
  1001C8D7:  6a 00                           push     0
  1001C8D9:  c7 45 f0 03 00 00 00            mov      dword ptr [ebp - 0x10], 3
  1001C8E0:  0f 94 45 f8                     sete     byte ptr [ebp - 8]
  1001C8E4:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  1001C8E7:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  1001C8EA:  8d 45 f0                        lea      eax, [ebp - 0x10]
  1001C8ED:  50                              push     eax
  1001C8EE:  68 20 00 00 30                  push     0x30000020
  1001C8F3:  e8 d8 b7 00 00                  call     0x100280d0  ; UI::SendUIMessage
  1001C8F8:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001C8FB:  83 c4 0c                        add      esp, 0xc
  1001C8FE:  33 cd                           xor      ecx, ebp
  1001C900:  e8 b2 fa 00 00                  call     0x1002c3b7
  1001C905:  8b e5                           mov      esp, ebp
  1001C907:  5d                              pop      ebp
  1001C908:  c3                              ret      


; === Items::PingWeaponSet, PingWeaponSet ===
; RVA: 0x0001C910  Size: 39 bytes
; Exports: ?PingWeaponSet@Items@GW@@YA_NIII@Z, PingWeaponSet
;
  1001C910:  55                              push     ebp
  1001C911:  8b ec                           mov      ebp, esp
  1001C913:  a1 a8 c2 08 10                  mov      eax, dword ptr [0x1008c2a8]
  1001C918:  85 c0                           test     eax, eax
  1001C91A:  74 17                           je       0x1001c933
  1001C91C:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001C91F:  85 c9                           test     ecx, ecx
  1001C921:  74 10                           je       0x1001c933
  1001C923:  ff 75 10                        push     dword ptr [ebp + 0x10]
  1001C926:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  1001C929:  51                              push     ecx
  1001C92A:  ff d0                           call     eax
  1001C92C:  83 c4 0c                        add      esp, 0xc
  1001C92F:  b0 01                           mov      al, 1
  1001C931:  5d                              pop      ebp
  1001C932:  c3                              ret      
  1001C933:  32 c0                           xor      al, al
  1001C935:  5d                              pop      ebp
  1001C936:  c3                              ret      


; === Items::RegisterItemClickCallback ===
; RVA: 0x0001C940  Size: 161 bytes
; Exports: ?RegisterItemClickCallback@Items@GW@@YAXPAUHookEntry@2@ABV?$function@$$A6AXPAUHookStatus@GW@@PAUkMouseAction@UIPacket@UI@2@PAUItem@2@@Z@std@@@Z
;
  1001C940:  55                              push     ebp
  1001C941:  8b ec                           mov      ebp, esp
  1001C943:  6a ff                           push     -1
  1001C945:  68 95 b0 04 10                  push     0x1004b095
  1001C94A:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  1001C950:  50                              push     eax
  1001C951:  83 ec 3c                        sub      esp, 0x3c
  1001C954:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1001C959:  33 c5                           xor      eax, ebp
  1001C95B:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  1001C95E:  50                              push     eax
  1001C95F:  8d 45 f4                        lea      eax, [ebp - 0xc]
  1001C962:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  1001C968:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001C96B:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  1001C96E:  89 45 c0                        mov      dword ptr [ebp - 0x40], eax
  1001C971:  8d 45 c8                        lea      eax, [ebp - 0x38]
  1001C974:  89 45 bc                        mov      dword ptr [ebp - 0x44], eax
  1001C977:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  1001C97E:  8b 49 24                        mov      ecx, dword ptr [ecx + 0x24]
  1001C981:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001C988:  85 c9                           test     ecx, ecx
  1001C98A:  74 0b                           je       0x1001c997
  1001C98C:  8b 01                           mov      eax, dword ptr [ecx]
  1001C98E:  8d 55 c8                        lea      edx, [ebp - 0x38]
  1001C991:  52                              push     edx
  1001C992:  ff 10                           call     dword ptr [eax]
  1001C994:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  1001C997:  8d 45 c0                        lea      eax, [ebp - 0x40]
  1001C99A:  c7 45 fc 01 00 00 00            mov      dword ptr [ebp - 4], 1
  1001C9A1:  50                              push     eax
  1001C9A2:  8d 45 b8                        lea      eax, [ebp - 0x48]
  1001C9A5:  b9 0c c3 08 10                  mov      ecx, 0x1008c30c
  1001C9AA:  50                              push     eax
  1001C9AB:  e8 b0 e7 ff ff                  call     0x1001b160
  1001C9B0:  8b 4d ec                        mov      ecx, dword ptr [ebp - 0x14]
  1001C9B3:  85 c9                           test     ecx, ecx
  1001C9B5:  74 11                           je       0x1001c9c8
  1001C9B7:  8b 11                           mov      edx, dword ptr [ecx]
  1001C9B9:  8d 45 c8                        lea      eax, [ebp - 0x38]
  1001C9BC:  3b c8                           cmp      ecx, eax
  1001C9BE:  0f 95 c0                        setne    al
  1001C9C1:  0f b6 c0                        movzx    eax, al
  1001C9C4:  50                              push     eax
  1001C9C5:  ff 52 10                        call     dword ptr [edx + 0x10]
  1001C9C8:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  1001C9CB:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  1001C9D2:  59                              pop      ecx
  1001C9D3:  8b 4d f0                        mov      ecx, dword ptr [ebp - 0x10]
  1001C9D6:  33 cd                           xor      ecx, ebp
  1001C9D8:  e8 da f9 00 00                  call     0x1002c3b7
  1001C9DD:  8b e5                           mov      esp, ebp
  1001C9DF:  5d                              pop      ebp
  1001C9E0:  c3                              ret      


; === Items::RemoveItemClickCallback ===
; RVA: 0x0001C9F0  Size: 277 bytes
; Exports: ?RemoveItemClickCallback@Items@GW@@YAXPAUHookEntry@2@@Z
;
  1001C9F0:  55                              push     ebp
  1001C9F1:  8b ec                           mov      ebp, esp
  1001C9F3:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  1001C9F6:  83 ec 08                        sub      esp, 8
  1001C9F9:  0f b6 c2                        movzx    eax, dl
  1001C9FC:  35 c5 9d 1c 81                  xor      eax, 0x811c9dc5
  1001CA01:  69 c8 93 01 00 01               imul     ecx, eax, 0x1000193
  1001CA07:  8b c2                           mov      eax, edx
  1001CA09:  c1 e8 08                        shr      eax, 8
  1001CA0C:  0f b6 c0                        movzx    eax, al
  1001CA0F:  56                              push     esi
  1001CA10:  33 c8                           xor      ecx, eax
  1001CA12:  8b c2                           mov      eax, edx
  1001CA14:  c1 e8 10                        shr      eax, 0x10
  1001CA17:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  1001CA1D:  0f b6 c0                        movzx    eax, al
  1001CA20:  c1 ea 18                        shr      edx, 0x18
  1001CA23:  33 c8                           xor      ecx, eax
  1001CA25:  69 c1 93 01 00 01               imul     eax, ecx, 0x1000193
  1001CA2B:  b9 0c c3 08 10                  mov      ecx, 0x1008c30c
  1001CA30:  33 c2                           xor      eax, edx
  1001CA32:  69 c0 93 01 00 01               imul     eax, eax, 0x1000193
  1001CA38:  50                              push     eax
  1001CA39:  8d 45 08                        lea      eax, [ebp + 8]
  1001CA3C:  50                              push     eax
  1001CA3D:  8d 45 f8                        lea      eax, [ebp - 8]
  1001CA40:  50                              push     eax
  1001CA41:  e8 9a 97 fe ff                  call     0x100061e0
  1001CA46:  8b 15 10 c3 08 10               mov      edx, dword ptr [0x1008c310]
  1001CA4C:  8b f2                           mov      esi, edx
  1001CA4E:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  1001CA51:  85 c0                           test     eax, eax
  1001CA53:  0f 45 f0                        cmovne   esi, eax
  1001CA56:  3b f2                           cmp      esi, edx
  1001CA58:  0f 84 a2 00 00 00               je       0x1001cb00
  1001CA5E:  0f b6 46 08                     movzx    eax, byte ptr [esi + 8]
  1001CA62:  35 c5 9d 1c 81                  xor      eax, 0x811c9dc5
  1001CA67:  69 c8 93 01 00 01               imul     ecx, eax, 0x1000193
  1001CA6D:  0f b6 46 09                     movzx    eax, byte ptr [esi + 9]
  1001CA71:  33 c8                           xor      ecx, eax
  1001CA73:  0f b6 46 0a                     movzx    eax, byte ptr [esi + 0xa]
  1001CA77:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  1001CA7D:  33 c8                           xor      ecx, eax
  1001CA7F:  0f b6 46 0b                     movzx    eax, byte ptr [esi + 0xb]
  1001CA83:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  1001CA89:  33 c8                           xor      ecx, eax
  1001CA8B:  a1 18 c3 08 10                  mov      eax, dword ptr [0x1008c318]
  1001CA90:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  1001CA96:  23 0d 24 c3 08 10               and      ecx, dword ptr [0x1008c324]
  1001CA9C:  8d 0c c8                        lea      ecx, [eax + ecx*8]
  1001CA9F:  8b 01                           mov      eax, dword ptr [ecx]
  1001CAA1:  39 71 04                        cmp      dword ptr [ecx + 4], esi
  1001CAA4:  75 13                           jne      0x1001cab9
  1001CAA6:  3b c6                           cmp      eax, esi
  1001CAA8:  75 07                           jne      0x1001cab1
  1001CAAA:  89 11                           mov      dword ptr [ecx], edx
  1001CAAC:  89 51 04                        mov      dword ptr [ecx + 4], edx
  1001CAAF:  eb 10                           jmp      0x1001cac1
  1001CAB1:  8b 56 04                        mov      edx, dword ptr [esi + 4]
  1001CAB4:  89 51 04                        mov      dword ptr [ecx + 4], edx
  1001CAB7:  eb 08                           jmp      0x1001cac1
  1001CAB9:  3b c6                           cmp      eax, esi
  1001CABB:  75 04                           jne      0x1001cac1
  1001CABD:  8b 06                           mov      eax, dword ptr [esi]
  1001CABF:  89 01                           mov      dword ptr [ecx], eax
  1001CAC1:  8b 0e                           mov      ecx, dword ptr [esi]
  1001CAC3:  ff 0d 14 c3 08 10               dec      dword ptr [0x1008c314]
  1001CAC9:  8b 46 04                        mov      eax, dword ptr [esi + 4]
  1001CACC:  57                              push     edi
  1001CACD:  8d 7e 10                        lea      edi, [esi + 0x10]
  1001CAD0:  89 08                           mov      dword ptr [eax], ecx
  1001CAD2:  8b 46 04                        mov      eax, dword ptr [esi + 4]
  1001CAD5:  89 41 04                        mov      dword ptr [ecx + 4], eax
  1001CAD8:  8b 4f 24                        mov      ecx, dword ptr [edi + 0x24]
  1001CADB:  85 c9                           test     ecx, ecx
  1001CADD:  74 15                           je       0x1001caf4
  1001CADF:  8b 11                           mov      edx, dword ptr [ecx]
  1001CAE1:  3b cf                           cmp      ecx, edi
  1001CAE3:  0f 95 c0                        setne    al
  1001CAE6:  0f b6 c0                        movzx    eax, al
  1001CAE9:  50                              push     eax
  1001CAEA:  ff 52 10                        call     dword ptr [edx + 0x10]
  1001CAED:  c7 47 24 00 00 00 00            mov      dword ptr [edi + 0x24], 0
  1001CAF4:  6a 38                           push     0x38
  1001CAF6:  56                              push     esi
  1001CAF7:  e8 91 f5 00 00                  call     0x1002c08d
  1001CAFC:  83 c4 08                        add      esp, 8
  1001CAFF:  5f                              pop      edi
  1001CB00:  5e                              pop      esi
  1001CB01:  8b e5                           mov      esp, ebp
  1001CB03:  5d                              pop      ebp
  1001CB04:  c3                              ret      


; === Items::SalvageMaterials ===
; RVA: 0x0001CB10  Size: 152 bytes
; Exports: ?SalvageMaterials@Items@GW@@YA_NXZ
;
  1001CB10:  53                              push     ebx
  1001CB11:  8b dc                           mov      ebx, esp
  1001CB13:  83 ec 08                        sub      esp, 8
  1001CB16:  83 e4 f0                        and      esp, 0xfffffff0
  1001CB19:  83 c4 04                        add      esp, 4
  1001CB1C:  55                              push     ebp
  1001CB1D:  8b 6b 04                        mov      ebp, dword ptr [ebx + 4]
  1001CB20:  89 6c 24 04                     mov      dword ptr [esp + 4], ebp
  1001CB24:  8b ec                           mov      ebp, esp
  1001CB26:  a1 bc c2 08 10                  mov      eax, dword ptr [0x1008c2bc]
  1001CB2B:  83 ec 2c                        sub      esp, 0x2c
  1001CB2E:  56                              push     esi
  1001CB2F:  85 c0                           test     eax, eax
  1001CB31:  75 0a                           jne      0x1001cb3d
  1001CB33:  32 c0                           xor      al, al
  1001CB35:  5e                              pop      esi
  1001CB36:  8b e5                           mov      esp, ebp
  1001CB38:  5d                              pop      ebp
  1001CB39:  8b e3                           mov      esp, ebx
  1001CB3B:  5b                              pop      ebx
  1001CB3C:  c3                              ret      
  1001CB3D:  0f 10 00                        movups   xmm0, xmmword ptr [eax]
  1001CB40:  8b 70 20                        mov      esi, dword ptr [eax + 0x20]
  1001CB43:  ff 70 04                        push     dword ptr [eax + 4]
  1001CB46:  0f 29 45 f0                     movaps   xmmword ptr [ebp - 0x10], xmm0
  1001CB4A:  0f 10 40 10                     movups   xmm0, xmmword ptr [eax + 0x10]
  1001CB4E:  c7 40 18 03 00 00 00            mov      dword ptr [eax + 0x18], 3
  1001CB55:  c7 40 0c 00 00 00 00            mov      dword ptr [eax + 0xc], 0
  1001CB5C:  0f 29 45 e0                     movaps   xmmword ptr [ebp - 0x20], xmm0
  1001CB60:  c7 40 10 00 00 00 00            mov      dword ptr [eax + 0x10], 0
  1001CB67:  c7 40 14 00 00 00 00            mov      dword ptr [eax + 0x14], 0
  1001CB6E:  e8 9d 9b 00 00                  call     0x10026710  ; UI::GetFrameById
  1001CB73:  6a 02                           push     2
  1001CB75:  50                              push     eax
  1001CB76:  e8 75 98 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001CB7B:  50                              push     eax
  1001CB7C:  e8 af 94 00 00                  call     0x10026030  ; UI::ButtonClick, ButtonClick
  1001CB81:  8b 0d bc c2 08 10               mov      ecx, dword ptr [0x1008c2bc]
  1001CB87:  83 c4 10                        add      esp, 0x10
  1001CB8A:  85 c9                           test     ecx, ecx
  1001CB8C:  74 12                           je       0x1001cba0
  1001CB8E:  0f 28 45 f0                     movaps   xmm0, xmmword ptr [ebp - 0x10]
  1001CB92:  0f 11 01                        movups   xmmword ptr [ecx], xmm0
  1001CB95:  0f 28 45 e0                     movaps   xmm0, xmmword ptr [ebp - 0x20]
  1001CB99:  0f 11 41 10                     movups   xmmword ptr [ecx + 0x10], xmm0
  1001CB9D:  89 71 20                        mov      dword ptr [ecx + 0x20], esi
  1001CBA0:  5e                              pop      esi
  1001CBA1:  8b e5                           mov      esp, ebp
  1001CBA3:  5d                              pop      ebp
  1001CBA4:  8b e3                           mov      esp, ebx
  1001CBA6:  5b                              pop      ebx
  1001CBA7:  c3                              ret      


; === Items::SalvageSessionCancel, SalvageSessionCancel ===
; RVA: 0x0001CBB0  Size: 38 bytes
; Exports: ?SalvageSessionCancel@Items@GW@@YA_NXZ, SalvageSessionCancel
;
  1001CBB0:  a1 bc c2 08 10                  mov      eax, dword ptr [0x1008c2bc]
  1001CBB5:  85 c0                           test     eax, eax
  1001CBB7:  75 03                           jne      0x1001cbbc
  1001CBB9:  32 c0                           xor      al, al
  1001CBBB:  c3                              ret      
  1001CBBC:  ff 70 04                        push     dword ptr [eax + 4]
  1001CBBF:  e8 4c 9b 00 00                  call     0x10026710  ; UI::GetFrameById
  1001CBC4:  6a 01                           push     1
  1001CBC6:  50                              push     eax
  1001CBC7:  e8 24 98 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001CBCC:  50                              push     eax
  1001CBCD:  e8 5e 94 00 00                  call     0x10026030  ; UI::ButtonClick, ButtonClick
  1001CBD2:  83 c4 10                        add      esp, 0x10
  1001CBD5:  c3                              ret      


; === Items::SalvageStart ===
; RVA: 0x0001CBE0  Size: 345 bytes
; Exports: ?SalvageStart@Items@GW@@YA_NII@Z
;
  1001CBE0:  55                              push     ebp
  1001CBE1:  8b ec                           mov      ebp, esp
  1001CBE3:  83 ec 5c                        sub      esp, 0x5c
  1001CBE6:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1001CBEB:  33 c5                           xor      eax, ebp
  1001CBED:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001CBF0:  83 3d c8 c2 08 10 00            cmp      dword ptr [0x1008c2c8], 0
  1001CBF7:  56                              push     esi
  1001CBF8:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  1001CBFB:  57                              push     edi
  1001CBFC:  8b 7d 0c                        mov      edi, dword ptr [ebp + 0xc]
  1001CBFF:  0f 84 22 01 00 00               je       0x1001cd27
  1001CC05:  56                              push     esi
  1001CC06:  e8 25 ef ff ff                  call     0x1001bb30  ; Items::GetItemById
  1001CC0B:  83 c4 04                        add      esp, 4
  1001CC0E:  85 c0                           test     eax, eax
  1001CC10:  74 0c                           je       0x1001cc1e
  1001CC12:  8b 40 0c                        mov      eax, dword ptr [eax + 0xc]
  1001CC15:  85 c0                           test     eax, eax
  1001CC17:  74 4a                           je       0x1001cc63
  1001CC19:  83 38 04                        cmp      dword ptr [eax], 4
  1001CC1C:  75 45                           jne      0x1001cc63
  1001CC1E:  e8 3d 08 00 00                  call     0x1001d460  ; Map::GetInstanceType, GetInstanceType
  1001CC23:  85 c0                           test     eax, eax
  1001CC25:  0f 85 fc 00 00 00               jne      0x1001cd27
  1001CC2B:  e8 70 09 00 00                  call     0x1001d5a0  ; Map::GetMapID, GetMapID
  1001CC30:  50                              push     eax
  1001CC31:  e8 8a 09 00 00                  call     0x1001d5c0  ; Map::GetMapInfo, GetMapInfo
  1001CC36:  83 c4 04                        add      esp, 4
  1001CC39:  85 c0                           test     eax, eax
  1001CC3B:  74 0a                           je       0x1001cc47
  1001CC3D:  83 78 08 07                     cmp      dword ptr [eax + 8], 7
  1001CC41:  0f 84 e0 00 00 00               je       0x1001cd27
  1001CC47:  6a 00                           push     0
  1001CC49:  e8 d2 3a 00 00                  call     0x10020720  ; PlayerMgr::GetPlayerByID
  1001CC4E:  83 c4 04                        add      esp, 4
  1001CC51:  85 c0                           test     eax, eax
  1001CC53:  0f 84 ce 00 00 00               je       0x1001cd27
  1001CC59:  f6 40 34 02                     test     byte ptr [eax + 0x34], 2
  1001CC5D:  0f 85 c4 00 00 00               jne      0x1001cd27
  1001CC63:  57                              push     edi
  1001CC64:  e8 c7 ee ff ff                  call     0x1001bb30  ; Items::GetItemById
  1001CC69:  83 c4 04                        add      esp, 4
  1001CC6C:  85 c0                           test     eax, eax
  1001CC6E:  74 0c                           je       0x1001cc7c
  1001CC70:  8b 40 0c                        mov      eax, dword ptr [eax + 0xc]
  1001CC73:  85 c0                           test     eax, eax
  1001CC75:  74 42                           je       0x1001ccb9
  1001CC77:  83 38 04                        cmp      dword ptr [eax], 4
  1001CC7A:  75 3d                           jne      0x1001ccb9
  1001CC7C:  e8 df 07 00 00                  call     0x1001d460  ; Map::GetInstanceType, GetInstanceType
  1001CC81:  85 c0                           test     eax, eax
  1001CC83:  0f 85 9e 00 00 00               jne      0x1001cd27
  1001CC89:  e8 12 09 00 00                  call     0x1001d5a0  ; Map::GetMapID, GetMapID
  1001CC8E:  50                              push     eax
  1001CC8F:  e8 2c 09 00 00                  call     0x1001d5c0  ; Map::GetMapInfo, GetMapInfo
  1001CC94:  83 c4 04                        add      esp, 4
  1001CC97:  85 c0                           test     eax, eax
  1001CC99:  74 0a                           je       0x1001cca5
  1001CC9B:  83 78 08 07                     cmp      dword ptr [eax + 8], 7
  1001CC9F:  0f 84 82 00 00 00               je       0x1001cd27
  1001CCA5:  6a 00                           push     0
  1001CCA7:  e8 74 3a 00 00                  call     0x10020720  ; PlayerMgr::GetPlayerByID
  1001CCAC:  83 c4 04                        add      esp, 4
  1001CCAF:  85 c0                           test     eax, eax
  1001CCB1:  74 74                           je       0x1001cd27
  1001CCB3:  f6 40 34 02                     test     byte ptr [eax + 0x34], 2
  1001CCB7:  75 6e                           jne      0x1001cd27
  1001CCB9:  8d 45 ac                        lea      eax, [ebp - 0x54]
  1001CCBC:  c7 45 bc 00 00 00 00            mov      dword ptr [ebp - 0x44], 0
  1001CCC3:  6a 30                           push     0x30
  1001CCC5:  89 45 b4                        mov      dword ptr [ebp - 0x4c], eax
  1001CCC8:  0f 57 c0                        xorps    xmm0, xmm0
  1001CCCB:  8d 45 cc                        lea      eax, [ebp - 0x34]
  1001CCCE:  c7 45 c0 28 00 00 00            mov      dword ptr [ebp - 0x40], 0x28
  1001CCD5:  6a 00                           push     0
  1001CCD7:  50                              push     eax
  1001CCD8:  66 0f 13 45 a4                  movlpd   qword ptr [ebp - 0x5c], xmm0
  1001CCDD:  c7 45 b8 00 00 00 00            mov      dword ptr [ebp - 0x48], 0
  1001CCE4:  c7 45 ac 0e 00 00 00            mov      dword ptr [ebp - 0x54], 0xe
  1001CCEB:  89 75 b0                        mov      dword ptr [ebp - 0x50], esi
  1001CCEE:  e8 bd 13 01 00                  call     0x1002e0b0
  1001CCF3:  8d 45 cc                        lea      eax, [ebp - 0x34]
  1001CCF6:  89 7d e4                        mov      dword ptr [ebp - 0x1c], edi
  1001CCF9:  89 45 c8                        mov      dword ptr [ebp - 0x38], eax
  1001CCFC:  8d 45 c8                        lea      eax, [ebp - 0x38]
  1001CCFF:  89 45 c4                        mov      dword ptr [ebp - 0x3c], eax
  1001CD02:  8d 45 a4                        lea      eax, [ebp - 0x5c]
  1001CD05:  6a 00                           push     0
  1001CD07:  50                              push     eax
  1001CD08:  8d 45 bc                        lea      eax, [ebp - 0x44]
  1001CD0B:  50                              push     eax
  1001CD0C:  ff 15 c8 c2 08 10               call     dword ptr [0x1008c2c8]
  1001CD12:  83 c4 18                        add      esp, 0x18
  1001CD15:  b0 01                           mov      al, 1
  1001CD17:  5f                              pop      edi
  1001CD18:  5e                              pop      esi
  1001CD19:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001CD1C:  33 cd                           xor      ecx, ebp
  1001CD1E:  e8 94 f6 00 00                  call     0x1002c3b7
  1001CD23:  8b e5                           mov      esp, ebp
  1001CD25:  5d                              pop      ebp
  1001CD26:  c3                              ret      
  1001CD27:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001CD2A:  32 c0                           xor      al, al
  1001CD2C:  5f                              pop      edi
  1001CD2D:  33 cd                           xor      ecx, ebp
  1001CD2F:  5e                              pop      esi
  1001CD30:  e8 82 f6 00 00                  call     0x1002c3b7
  1001CD35:  8b e5                           mov      esp, ebp
  1001CD37:  5d                              pop      ebp
  1001CD38:  c3                              ret      


; === Items::SetEquipmentVisibility, SetEquipmentVisibility ===
; RVA: 0x0001CD40  Size: 78 bytes
; Exports: ?SetEquipmentVisibility@Items@GW@@YA_NW4EquipmentType@2@W4EquipmentStatus@2@@Z, SetEquipmentVisibility
;
  1001CD40:  55                              push     ebp
  1001CD41:  8b ec                           mov      ebp, esp
  1001CD43:  e8 58 c3 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  1001CD48:  85 c0                           test     eax, eax
  1001CD4A:  74 08                           je       0x1001cd54
  1001CD4C:  8b 80 c8 07 00 00               mov      eax, dword ptr [eax + 0x7c8]
  1001CD52:  eb 02                           jmp      0x1001cd56
  1001CD54:  33 c0                           xor      eax, eax
  1001CD56:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001CD59:  8b 55 0c                        mov      edx, dword ptr [ebp + 0xc]
  1001CD5C:  d3 e8                           shr      eax, cl
  1001CD5E:  83 e0 03                        and      eax, 3
  1001CD61:  3b c2                           cmp      eax, edx
  1001CD63:  75 04                           jne      0x1001cd69
  1001CD65:  b0 01                           mov      al, 1
  1001CD67:  5d                              pop      ebp
  1001CD68:  c3                              ret      
  1001CD69:  56                              push     esi
  1001CD6A:  8b 35 b8 c2 08 10               mov      esi, dword ptr [0x1008c2b8]
  1001CD70:  85 f6                           test     esi, esi
  1001CD72:  75 05                           jne      0x1001cd79
  1001CD74:  32 c0                           xor      al, al
  1001CD76:  5e                              pop      esi
  1001CD77:  5d                              pop      ebp
  1001CD78:  c3                              ret      
  1001CD79:  b8 03 00 00 00                  mov      eax, 3
  1001CD7E:  d3 e2                           shl      edx, cl
  1001CD80:  d3 e0                           shl      eax, cl
  1001CD82:  50                              push     eax
  1001CD83:  52                              push     edx
  1001CD84:  ff d6                           call     esi
  1001CD86:  83 c4 08                        add      esp, 8
  1001CD89:  b0 01                           mov      al, 1
  1001CD8B:  5e                              pop      esi
  1001CD8C:  5d                              pop      ebp
  1001CD8D:  c3                              ret      


; === Items::UseItem ===
; RVA: 0x0001CD90  Size: 374 bytes
; Exports: ?UseItem@Items@GW@@YA_NPBUItem@2@@Z
;
  1001CD90:  55                              push     ebp
  1001CD91:  8b ec                           mov      ebp, esp
  1001CD93:  83 ec 54                        sub      esp, 0x54
  1001CD96:  83 3d d8 c2 08 10 00            cmp      dword ptr [0x1008c2d8], 0
  1001CD9D:  53                              push     ebx
  1001CD9E:  0f 84 5b 01 00 00               je       0x1001ceff
  1001CDA4:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  1001CDA7:  85 db                           test     ebx, ebx
  1001CDA9:  0f 84 50 01 00 00               je       0x1001ceff
  1001CDAF:  83 7b 0c 00                     cmp      dword ptr [ebx + 0xc], 0
  1001CDB3:  0f 84 46 01 00 00               je       0x1001ceff
  1001CDB9:  53                              push     ebx
  1001CDBA:  e8 51 e6 ff ff                  call     0x1001b410  ; Items::CanInteractWithItem, CanInteractWithItem
  1001CDBF:  83 c4 04                        add      esp, 4
  1001CDC2:  84 c0                           test     al, al
  1001CDC4:  0f 84 35 01 00 00               je       0x1001ceff
  1001CDCA:  80 7b 20 1d                     cmp      byte ptr [ebx + 0x20], 0x1d
  1001CDCE:  0f 85 8a 00 00 00               jne      0x1001ce5e
  1001CDD4:  8b 43 0c                        mov      eax, dword ptr [ebx + 0xc]
  1001CDD7:  56                              push     esi
  1001CDD8:  57                              push     edi
  1001CDD9:  0f b6 7b 50                     movzx    edi, byte ptr [ebx + 0x50]
  1001CDDD:  8b 70 04                        mov      esi, dword ptr [eax + 4]
  1001CDE0:  83 c7 02                        add      edi, 2
  1001CDE3:  68 04 2d 05 10                  push     0x10052d04
  1001CDE8:  e8 93 99 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001CDED:  56                              push     esi
  1001CDEE:  50                              push     eax
  1001CDEF:  e8 fc 95 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001CDF4:  57                              push     edi
  1001CDF5:  50                              push     eax
  1001CDF6:  e8 f5 95 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001CDFB:  83 c4 14                        add      esp, 0x14
  1001CDFE:  5f                              pop      edi
  1001CDFF:  5e                              pop      esi
  1001CE00:  85 c0                           test     eax, eax
  1001CE02:  75 4e                           jne      0x1001ce52
  1001CE04:  68 18 2d 05 10                  push     0x10052d18
  1001CE09:  e8 72 99 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001CE0E:  6a 00                           push     0
  1001CE10:  50                              push     eax
  1001CE11:  e8 da 95 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001CE16:  83 c4 0c                        add      esp, 0xc
  1001CE19:  85 c0                           test     eax, eax
  1001CE1B:  74 1a                           je       0x1001ce37
  1001CE1D:  8b 4b 0c                        mov      ecx, dword ptr [ebx + 0xc]
  1001CE20:  ff 71 04                        push     dword ptr [ecx + 4]
  1001CE23:  8b c8                           mov      ecx, eax
  1001CE25:  e8 86 9d ff ff                  call     0x10016bb0  ; ScrollableFrame::GetItemFrameId
  1001CE2A:  50                              push     eax
  1001CE2B:  e8 e0 98 00 00                  call     0x10026710  ; UI::GetFrameById
  1001CE30:  83 c4 04                        add      esp, 4
  1001CE33:  8b c8                           mov      ecx, eax
  1001CE35:  eb 02                           jmp      0x1001ce39
  1001CE37:  33 c9                           xor      ecx, ecx
  1001CE39:  0f b6 43 50                     movzx    eax, byte ptr [ebx + 0x50]
  1001CE3D:  83 c0 02                        add      eax, 2
  1001CE40:  50                              push     eax
  1001CE41:  51                              push     ecx
  1001CE42:  e8 a9 95 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001CE47:  83 c4 08                        add      esp, 8
  1001CE4A:  85 c0                           test     eax, eax
  1001CE4C:  0f 84 ad 00 00 00               je       0x1001ceff
  1001CE52:  8b c8                           mov      ecx, eax
  1001CE54:  e8 27 9b ff ff                  call     0x10016980  ; ButtonFrame::DoubleClick
  1001CE59:  5b                              pop      ebx
  1001CE5A:  8b e5                           mov      esp, ebp
  1001CE5C:  5d                              pop      ebp
  1001CE5D:  c3                              ret      
  1001CE5E:  8b 4b 0c                        mov      ecx, dword ptr [ebx + 0xc]
  1001CE61:  8d 55 ac                        lea      edx, [ebp - 0x54]
  1001CE64:  6a 00                           push     0
  1001CE66:  8b 41 04                        mov      eax, dword ptr [ecx + 4]
  1001CE69:  89 45 ac                        mov      dword ptr [ebp - 0x54], eax
  1001CE6C:  8b 03                           mov      eax, dword ptr [ebx]
  1001CE6E:  89 55 fc                        mov      dword ptr [ebp - 4], edx
  1001CE71:  8d 55 fc                        lea      edx, [ebp - 4]
  1001CE74:  89 45 c4                        mov      dword ptr [ebp - 0x3c], eax
  1001CE77:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  1001CE7A:  c7 45 b0 00 00 00 00            mov      dword ptr [ebp - 0x50], 0
  1001CE81:  c7 45 c0 00 00 00 00            mov      dword ptr [ebp - 0x40], 0
  1001CE88:  c7 45 c8 00 00 00 00            mov      dword ptr [ebp - 0x38], 0
  1001CE8F:  c7 45 cc 00 00 00 00            mov      dword ptr [ebp - 0x34], 0
  1001CE96:  c7 45 d0 00 00 00 00            mov      dword ptr [ebp - 0x30], 0
  1001CE9D:  89 5d b4                        mov      dword ptr [ebp - 0x4c], ebx
  1001CEA0:  c7 45 b8 01 00 00 00            mov      dword ptr [ebp - 0x48], 1
  1001CEA7:  c7 45 bc 01 00 00 00            mov      dword ptr [ebp - 0x44], 1
  1001CEAE:  c7 45 e8 00 00 00 00            mov      dword ptr [ebp - 0x18], 0
  1001CEB5:  c7 45 ec 31 00 00 00            mov      dword ptr [ebp - 0x14], 0x31
  1001CEBC:  89 55 f0                        mov      dword ptr [ebp - 0x10], edx
  1001CEBF:  8b 41 04                        mov      eax, dword ptr [ecx + 4]
  1001CEC2:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  1001CEC5:  8d 45 f4                        lea      eax, [ebp - 0xc]
  1001CEC8:  89 45 e0                        mov      dword ptr [ebp - 0x20], eax
  1001CECB:  8d 45 d4                        lea      eax, [ebp - 0x2c]
  1001CECE:  50                              push     eax
  1001CECF:  8d 45 e8                        lea      eax, [ebp - 0x18]
  1001CED2:  c7 45 d4 00 00 00 00            mov      dword ptr [ebp - 0x2c], 0
  1001CED9:  50                              push     eax
  1001CEDA:  c7 45 d8 02 00 00 00            mov      dword ptr [ebp - 0x28], 2
  1001CEE1:  c7 45 dc 09 00 00 00            mov      dword ptr [ebp - 0x24], 9
  1001CEE8:  c7 45 e4 00 00 00 00            mov      dword ptr [ebp - 0x1c], 0
  1001CEEF:  ff 15 d8 c2 08 10               call     dword ptr [0x1008c2d8]
  1001CEF5:  83 c4 0c                        add      esp, 0xc
  1001CEF8:  b0 01                           mov      al, 1
  1001CEFA:  5b                              pop      ebx
  1001CEFB:  8b e5                           mov      esp, ebp
  1001CEFD:  5d                              pop      ebp
  1001CEFE:  c3                              ret      
  1001CEFF:  32 c0                           xor      al, al
  1001CF01:  5b                              pop      ebx
  1001CF02:  8b e5                           mov      esp, ebp
  1001CF04:  5d                              pop      ebp
  1001CF05:  c3                              ret      


; === Items::UseItemByModelId, UseItemByModelId ===
; RVA: 0x0001CF10  Size: 28 bytes
; Exports: ?UseItemByModelId@Items@GW@@YA_NIHH@Z, UseItemByModelId
;
  1001CF10:  55                              push     ebp
  1001CF11:  8b ec                           mov      ebp, esp
  1001CF13:  ff 75 10                        push     dword ptr [ebp + 0x10]
  1001CF16:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  1001CF19:  ff 75 08                        push     dword ptr [ebp + 8]
  1001CF1C:  e8 6f ec ff ff                  call     0x1001bb90  ; Items::GetItemByModelId
  1001CF21:  50                              push     eax
  1001CF22:  e8 69 fe ff ff                  call     0x1001cd90  ; Items::UseItem
  1001CF27:  83 c4 10                        add      esp, 0x10
  1001CF2A:  5d                              pop      ebp
  1001CF2B:  c3                              ret      


; === Items::WithdrawGold ===
; RVA: 0x0001CF30  Size: 243 bytes
; Exports: ?WithdrawGold@Items@GW@@YAII@Z
;
  1001CF30:  55                              push     ebp
  1001CF31:  8b ec                           mov      ebp, esp
  1001CF33:  83 ec 14                        sub      esp, 0x14
  1001CF36:  56                              push     esi
  1001CF37:  e8 24 05 00 00                  call     0x1001d460  ; Map::GetInstanceType, GetInstanceType
  1001CF3C:  85 c0                           test     eax, eax
  1001CF3E:  0f 85 d8 00 00 00               jne      0x1001d01c
  1001CF44:  e8 57 06 00 00                  call     0x1001d5a0  ; Map::GetMapID, GetMapID
  1001CF49:  50                              push     eax
  1001CF4A:  e8 71 06 00 00                  call     0x1001d5c0  ; Map::GetMapInfo, GetMapInfo
  1001CF4F:  83 c4 04                        add      esp, 4
  1001CF52:  85 c0                           test     eax, eax
  1001CF54:  74 0a                           je       0x1001cf60
  1001CF56:  83 78 08 07                     cmp      dword ptr [eax + 8], 7
  1001CF5A:  0f 84 bc 00 00 00               je       0x1001d01c
  1001CF60:  6a 00                           push     0
  1001CF62:  e8 b9 37 00 00                  call     0x10020720  ; PlayerMgr::GetPlayerByID
  1001CF67:  83 c4 04                        add      esp, 4
  1001CF6A:  85 c0                           test     eax, eax
  1001CF6C:  0f 84 aa 00 00 00               je       0x1001d01c
  1001CF72:  f6 40 34 02                     test     byte ptr [eax + 0x34], 2
  1001CF76:  0f 85 a0 00 00 00               jne      0x1001d01c
  1001CF7C:  83 3d e4 c2 08 10 00            cmp      dword ptr [0x1008c2e4], 0
  1001CF83:  0f 84 93 00 00 00               je       0x1001d01c
  1001CF89:  e8 82 c0 ff ff                  call     0x10019010  ; GW::GetItemContext
  1001CF8E:  85 c0                           test     eax, eax
  1001CF90:  74 12                           je       0x1001cfa4
  1001CF92:  8b b0 f8 00 00 00               mov      esi, dword ptr [eax + 0xf8]
  1001CF98:  85 f6                           test     esi, esi
  1001CF9A:  74 08                           je       0x1001cfa4
  1001CF9C:  8b b6 94 00 00 00               mov      esi, dword ptr [esi + 0x94]
  1001CFA2:  eb 02                           jmp      0x1001cfa6
  1001CFA4:  33 f6                           xor      esi, esi
  1001CFA6:  e8 65 c0 ff ff                  call     0x10019010  ; GW::GetItemContext
  1001CFAB:  85 c0                           test     eax, eax
  1001CFAD:  74 12                           je       0x1001cfc1
  1001CFAF:  8b 90 f8 00 00 00               mov      edx, dword ptr [eax + 0xf8]
  1001CFB5:  85 d2                           test     edx, edx
  1001CFB7:  74 08                           je       0x1001cfc1
  1001CFB9:  8b 92 90 00 00 00               mov      edx, dword ptr [edx + 0x90]
  1001CFBF:  eb 02                           jmp      0x1001cfc3
  1001CFC1:  33 d2                           xor      edx, edx
  1001CFC3:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001CFC6:  85 c9                           test     ecx, ecx
  1001CFC8:  75 0e                           jne      0x1001cfd8
  1001CFCA:  b8 a0 86 01 00                  mov      eax, 0x186a0
  1001CFCF:  2b c2                           sub      eax, edx
  1001CFD1:  3b c6                           cmp      eax, esi
  1001CFD3:  0f 42 f0                        cmovb    esi, eax
  1001CFD6:  eb 10                           jmp      0x1001cfe8
  1001CFD8:  8d 04 0a                        lea      eax, [edx + ecx]
  1001CFDB:  3d a0 86 01 00                  cmp      eax, 0x186a0
  1001CFE0:  77 3a                           ja       0x1001d01c
  1001CFE2:  3b ce                           cmp      ecx, esi
  1001CFE4:  77 36                           ja       0x1001d01c
  1001CFE6:  8b f1                           mov      esi, ecx
  1001CFE8:  8d 45 ec                        lea      eax, [ebp - 0x14]
  1001CFEB:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  1001CFF2:  50                              push     eax
  1001CFF3:  33 d2                           xor      edx, edx
  1001CFF5:  c7 45 f0 05 00 00 00            mov      dword ptr [ebp - 0x10], 5
  1001CFFC:  33 c9                           xor      ecx, ecx
  1001CFFE:  c7 45 f4 07 00 00 00            mov      dword ptr [ebp - 0xc], 7
  1001D005:  89 75 f8                        mov      dword ptr [ebp - 8], esi
  1001D008:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001D00F:  ff 15 e4 c2 08 10               call     dword ptr [0x1008c2e4]
  1001D015:  8b c6                           mov      eax, esi
  1001D017:  5e                              pop      esi
  1001D018:  8b e5                           mov      esp, ebp
  1001D01A:  5d                              pop      ebp
  1001D01B:  c3                              ret      
  1001D01C:  33 c0                           xor      eax, eax
  1001D01E:  5e                              pop      esi
  1001D01F:  8b e5                           mov      esp, ebp
  1001D021:  5d                              pop      ebp
  1001D022:  c3                              ret      


