; Module: PartyMgr
; Functions: 42
; Total code size: 4048 bytes
;

; === PartyMgr::AddHenchman ===
; RVA: 0x0001F1B0  Size: 83 bytes
; Exports: ?AddHenchman@PartyMgr@GW@@YA_NI@Z
;
  1001F1B0:  55                              push     ebp
  1001F1B1:  8b ec                           mov      ebp, esp
  1001F1B3:  83 ec 48                        sub      esp, 0x48
  1001F1B6:  56                              push     esi
  1001F1B7:  8b 35 d8 c3 08 10               mov      esi, dword ptr [0x1008c3d8]
  1001F1BD:  85 f6                           test     esi, esi
  1001F1BF:  75 07                           jne      0x1001f1c8
  1001F1C1:  32 c0                           xor      al, al
  1001F1C3:  5e                              pop      esi
  1001F1C4:  8b e5                           mov      esp, ebp
  1001F1C6:  5d                              pop      ebp
  1001F1C7:  c3                              ret      
  1001F1C8:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001F1CB:  8d 4d b8                        lea      ecx, [ebp - 0x48]
  1001F1CE:  89 45 e0                        mov      dword ptr [ebp - 0x20], eax
  1001F1D1:  33 d2                           xor      edx, edx
  1001F1D3:  8d 45 ec                        lea      eax, [ebp - 0x14]
  1001F1D6:  c7 45 f8 00 00 00 00            mov      dword ptr [ebp - 8], 0
  1001F1DD:  50                              push     eax
  1001F1DE:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001F1E5:  c7 45 f4 07 00 00 00            mov      dword ptr [ebp - 0xc], 7
  1001F1EC:  c7 45 f0 02 00 00 00            mov      dword ptr [ebp - 0x10], 2
  1001F1F3:  c7 45 e4 02 00 00 00            mov      dword ptr [ebp - 0x1c], 2
  1001F1FA:  ff d6                           call     esi
  1001F1FC:  b0 01                           mov      al, 1
  1001F1FE:  5e                              pop      esi
  1001F1FF:  8b e5                           mov      esp, ebp
  1001F201:  5d                              pop      ebp
  1001F202:  c3                              ret      


; === PartyMgr::AddHero ===
; RVA: 0x0001F210  Size: 83 bytes
; Exports: ?AddHero@PartyMgr@GW@@YA_NW4HeroID@Constants@2@@Z
;
  1001F210:  55                              push     ebp
  1001F211:  8b ec                           mov      ebp, esp
  1001F213:  83 ec 48                        sub      esp, 0x48
  1001F216:  56                              push     esi
  1001F217:  8b 35 d8 c3 08 10               mov      esi, dword ptr [0x1008c3d8]
  1001F21D:  85 f6                           test     esi, esi
  1001F21F:  75 07                           jne      0x1001f228
  1001F221:  32 c0                           xor      al, al
  1001F223:  5e                              pop      esi
  1001F224:  8b e5                           mov      esp, ebp
  1001F226:  5d                              pop      ebp
  1001F227:  c3                              ret      
  1001F228:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001F22B:  8d 4d b8                        lea      ecx, [ebp - 0x48]
  1001F22E:  89 45 dc                        mov      dword ptr [ebp - 0x24], eax
  1001F231:  33 d2                           xor      edx, edx
  1001F233:  8d 45 ec                        lea      eax, [ebp - 0x14]
  1001F236:  c7 45 f8 00 00 00 00            mov      dword ptr [ebp - 8], 0
  1001F23D:  50                              push     eax
  1001F23E:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001F245:  c7 45 f4 07 00 00 00            mov      dword ptr [ebp - 0xc], 7
  1001F24C:  c7 45 f0 01 00 00 00            mov      dword ptr [ebp - 0x10], 1
  1001F253:  c7 45 e4 01 00 00 00            mov      dword ptr [ebp - 0x1c], 1
  1001F25A:  ff d6                           call     esi
  1001F25C:  b0 01                           mov      al, 1
  1001F25E:  5e                              pop      esi
  1001F25F:  8b e5                           mov      esp, ebp
  1001F261:  5d                              pop      ebp
  1001F262:  c3                              ret      


; === PartyMgr::FlagAll ===
; RVA: 0x0001F270  Size: 99 bytes
; Exports: ?FlagAll@PartyMgr@GW@@YA_NUGamePos@2@@Z
;
  1001F270:  55                              push     ebp
  1001F271:  8b ec                           mov      ebp, esp
  1001F273:  83 ec 0c                        sub      esp, 0xc
  1001F276:  f3 0f 7e 45 08                  movq     xmm0, qword ptr [ebp + 8]
  1001F27B:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  1001F27E:  53                              push     ebx
  1001F27F:  57                              push     edi
  1001F280:  66 0f d6 45 f4                  movq     qword ptr [ebp - 0xc], xmm0
  1001F285:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001F288:  e8 13 9e ff ff                  call     0x100190a0  ; GW::GetWorldContext
  1001F28D:  68 8c 34 05 10                  push     0x1005348c
  1001F292:  e8 e9 74 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001F297:  8b d8                           mov      ebx, eax
  1001F299:  53                              push     ebx
  1001F29A:  e8 41 75 00 00                  call     0x100267e0  ; UI::GetFrameContext
  1001F29F:  8b f8                           mov      edi, eax
  1001F2A1:  83 c4 08                        add      esp, 8
  1001F2A4:  85 ff                           test     edi, edi
  1001F2A6:  75 08                           jne      0x1001f2b0
  1001F2A8:  5f                              pop      edi
  1001F2A9:  32 c0                           xor      al, al
  1001F2AB:  5b                              pop      ebx
  1001F2AC:  8b e5                           mov      esp, ebp
  1001F2AE:  5d                              pop      ebp
  1001F2AF:  c3                              ret      
  1001F2B0:  56                              push     esi
  1001F2B1:  8b 37                           mov      esi, dword ptr [edi]
  1001F2B3:  8d 45 f4                        lea      eax, [ebp - 0xc]
  1001F2B6:  6a 00                           push     0
  1001F2B8:  50                              push     eax
  1001F2B9:  6a 57                           push     0x57
  1001F2BB:  53                              push     ebx
  1001F2BC:  c7 07 00 00 00 00               mov      dword ptr [edi], 0
  1001F2C2:  e8 59 8c 00 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  1001F2C7:  83 c4 10                        add      esp, 0x10
  1001F2CA:  89 37                           mov      dword ptr [edi], esi
  1001F2CC:  5e                              pop      esi
  1001F2CD:  5f                              pop      edi
  1001F2CE:  5b                              pop      ebx
  1001F2CF:  8b e5                           mov      esp, ebp
  1001F2D1:  5d                              pop      ebp
  1001F2D2:  c3                              ret      


; === PartyMgr::FlagHero ===
; RVA: 0x0001F2E0  Size: 93 bytes
; Exports: ?FlagHero@PartyMgr@GW@@YA_NIUGamePos@2@@Z
;
  1001F2E0:  55                              push     ebp
  1001F2E1:  8b ec                           mov      ebp, esp
  1001F2E3:  53                              push     ebx
  1001F2E4:  57                              push     edi
  1001F2E5:  e8 b6 9d ff ff                  call     0x100190a0  ; GW::GetWorldContext
  1001F2EA:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  1001F2ED:  85 ff                           test     edi, edi
  1001F2EF:  74 0b                           je       0x1001f2fc
  1001F2F1:  8d 4f ff                        lea      ecx, [edi - 1]
  1001F2F4:  39 88 8c 05 00 00               cmp      dword ptr [eax + 0x58c], ecx
  1001F2FA:  76 1c                           jbe      0x1001f318
  1001F2FC:  68 8c 34 05 10                  push     0x1005348c
  1001F301:  e8 7a 74 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001F306:  50                              push     eax
  1001F307:  89 45 08                        mov      dword ptr [ebp + 8], eax
  1001F30A:  e8 d1 74 00 00                  call     0x100267e0  ; UI::GetFrameContext
  1001F30F:  8b d8                           mov      ebx, eax
  1001F311:  83 c4 08                        add      esp, 8
  1001F314:  85 db                           test     ebx, ebx
  1001F316:  75 06                           jne      0x1001f31e
  1001F318:  5f                              pop      edi
  1001F319:  32 c0                           xor      al, al
  1001F31B:  5b                              pop      ebx
  1001F31C:  5d                              pop      ebp
  1001F31D:  c3                              ret      
  1001F31E:  56                              push     esi
  1001F31F:  8b 33                           mov      esi, dword ptr [ebx]
  1001F321:  8d 45 0c                        lea      eax, [ebp + 0xc]
  1001F324:  6a 00                           push     0
  1001F326:  50                              push     eax
  1001F327:  6a 57                           push     0x57
  1001F329:  ff 75 08                        push     dword ptr [ebp + 8]
  1001F32C:  89 3b                           mov      dword ptr [ebx], edi
  1001F32E:  e8 ed 8b 00 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  1001F333:  83 c4 10                        add      esp, 0x10
  1001F336:  89 33                           mov      dword ptr [ebx], esi
  1001F338:  5e                              pop      esi
  1001F339:  5f                              pop      edi
  1001F33A:  5b                              pop      ebx
  1001F33B:  5d                              pop      ebp
  1001F33C:  c3                              ret      


; === PartyMgr::GetAgentAttributes ===
; RVA: 0x0001F410  Size: 71 bytes
; Exports: ?GetAgentAttributes@PartyMgr@GW@@YAPAUAttribute@2@I@Z
;
  1001F410:  55                              push     ebp
  1001F411:  8b ec                           mov      ebp, esp
  1001F413:  e8 88 9c ff ff                  call     0x100190a0  ; GW::GetWorldContext
  1001F418:  85 c0                           test     eax, eax
  1001F41A:  74 32                           je       0x1001f44e
  1001F41C:  8b 88 ac 00 00 00               mov      ecx, dword ptr [eax + 0xac]
  1001F422:  85 c9                           test     ecx, ecx
  1001F424:  74 28                           je       0x1001f44e
  1001F426:  69 80 b4 00 00 00 3c 04 00 00   imul     eax, dword ptr [eax + 0xb4], 0x43c
  1001F430:  03 c1                           add      eax, ecx
  1001F432:  3b c8                           cmp      ecx, eax
  1001F434:  74 18                           je       0x1001f44e
  1001F436:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  1001F439:  0f 1f 80 00 00 00 00            nop      dword ptr [eax]
  1001F440:  39 11                           cmp      dword ptr [ecx], edx
  1001F442:  74 0e                           je       0x1001f452
  1001F444:  81 c1 3c 04 00 00               add      ecx, 0x43c
  1001F44A:  3b c8                           cmp      ecx, eax
  1001F44C:  75 f2                           jne      0x1001f440
  1001F44E:  33 c0                           xor      eax, eax
  1001F450:  5d                              pop      ebp
  1001F451:  c3                              ret      
  1001F452:  8d 41 04                        lea      eax, [ecx + 4]
  1001F455:  5d                              pop      ebp
  1001F456:  c3                              ret      


; === PartyMgr::GetHeroAgentID ===
; RVA: 0x0001F460  Size: 70 bytes
; Exports: ?GetHeroAgentID@PartyMgr@GW@@YAII@Z
;
  1001F460:  55                              push     ebp
  1001F461:  8b ec                           mov      ebp, esp
  1001F463:  56                              push     esi
  1001F464:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  1001F467:  85 f6                           test     esi, esi
  1001F469:  75 07                           jne      0x1001f472
  1001F46B:  5e                              pop      esi
  1001F46C:  5d                              pop      ebp
  1001F46D:  e9 5e 2e fe ff                  jmp      0x100022d0
  1001F472:  4e                              dec      esi
  1001F473:  e8 d8 9b ff ff                  call     0x10019050  ; GW::GetPartyContext
  1001F478:  85 c0                           test     eax, eax
  1001F47A:  74 25                           je       0x1001f4a1
  1001F47C:  83 78 48 00                     cmp      dword ptr [eax + 0x48], 0
  1001F480:  74 1f                           je       0x1001f4a1
  1001F482:  8b 48 54                        mov      ecx, dword ptr [eax + 0x54]
  1001F485:  85 c9                           test     ecx, ecx
  1001F487:  74 18                           je       0x1001f4a1
  1001F489:  83 c1 24                        add      ecx, 0x24
  1001F48C:  83 39 00                        cmp      dword ptr [ecx], 0
  1001F48F:  74 10                           je       0x1001f4a1
  1001F491:  3b 71 08                        cmp      esi, dword ptr [ecx + 8]
  1001F494:  73 0b                           jae      0x1001f4a1
  1001F496:  56                              push     esi
  1001F497:  e8 d4 fc ff ff                  call     0x1001f170
  1001F49C:  5e                              pop      esi
  1001F49D:  8b 00                           mov      eax, dword ptr [eax]
  1001F49F:  5d                              pop      ebp
  1001F4A0:  c3                              ret      
  1001F4A1:  33 c0                           xor      eax, eax
  1001F4A3:  5e                              pop      esi
  1001F4A4:  5d                              pop      ebp
  1001F4A5:  c3                              ret      


; === PartyMgr::GetHeroConstData ===
; RVA: 0x0001F4B0  Size: 30 bytes
; Exports: ?GetHeroConstData@PartyMgr@GW@@YAPAUHeroConstData@2@W4HeroID@Constants@2@@Z
;
  1001F4B0:  55                              push     ebp
  1001F4B1:  8b ec                           mov      ebp, esp
  1001F4B3:  a1 d4 c3 08 10                  mov      eax, dword ptr [0x1008c3d4]
  1001F4B8:  85 c0                           test     eax, eax
  1001F4BA:  74 0e                           je       0x1001f4ca
  1001F4BC:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001F4BF:  83 f9 28                        cmp      ecx, 0x28
  1001F4C2:  73 06                           jae      0x1001f4ca
  1001F4C4:  89 4d 08                        mov      dword ptr [ebp + 8], ecx
  1001F4C7:  5d                              pop      ebp
  1001F4C8:  ff e0                           jmp      eax
  1001F4CA:  33 c0                           xor      eax, eax
  1001F4CC:  5d                              pop      ebp
  1001F4CD:  c3                              ret      


; === PartyMgr::GetHeroInfo ===
; RVA: 0x0001F4D0  Size: 65 bytes
; Exports: ?GetHeroInfo@PartyMgr@GW@@YAPAUHeroInfo@2@W4HeroID@Constants@2@@Z
;
  1001F4D0:  55                              push     ebp
  1001F4D1:  8b ec                           mov      ebp, esp
  1001F4D3:  e8 c8 9b ff ff                  call     0x100190a0  ; GW::GetWorldContext
  1001F4D8:  8b c8                           mov      ecx, eax
  1001F4DA:  85 c9                           test     ecx, ecx
  1001F4DC:  74 2f                           je       0x1001f50d
  1001F4DE:  83 b9 9c 05 00 00 00            cmp      dword ptr [ecx + 0x59c], 0
  1001F4E5:  74 26                           je       0x1001f50d
  1001F4E7:  8b 81 94 05 00 00               mov      eax, dword ptr [ecx + 0x594]
  1001F4ED:  69 89 9c 05 00 00 9c 00 00 00   imul     ecx, dword ptr [ecx + 0x59c], 0x9c
  1001F4F7:  03 c8                           add      ecx, eax
  1001F4F9:  3b c1                           cmp      eax, ecx
  1001F4FB:  74 10                           je       0x1001f50d
  1001F4FD:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  1001F500:  39 10                           cmp      dword ptr [eax], edx
  1001F502:  74 0b                           je       0x1001f50f
  1001F504:  05 9c 00 00 00                  add      eax, 0x9c
  1001F509:  3b c1                           cmp      eax, ecx
  1001F50B:  75 f3                           jne      0x1001f500
  1001F50D:  33 c0                           xor      eax, eax
  1001F50F:  5d                              pop      ebp
  1001F510:  c3                              ret      


; === PartyMgr::GetIsHardModeUnlocked ===
; RVA: 0x0001F5A0  Size: 26 bytes
; Exports: ?GetIsHardModeUnlocked@PartyMgr@GW@@YA_NXZ
;
  1001F5A0:  e8 fb 9a ff ff                  call     0x100190a0  ; GW::GetWorldContext
  1001F5A5:  8b c8                           mov      ecx, eax
  1001F5A7:  85 c9                           test     ecx, ecx
  1001F5A9:  74 0c                           je       0x1001f5b7
  1001F5AB:  33 c0                           xor      eax, eax
  1001F5AD:  39 81 84 06 00 00               cmp      dword ptr [ecx + 0x684], eax
  1001F5B3:  0f 95 c0                        setne    al
  1001F5B6:  c3                              ret      
  1001F5B7:  32 c0                           xor      al, al
  1001F5B9:  c3                              ret      


; === PartyMgr::GetIsLeader ===
; RVA: 0x0001F5C0  Size: 74 bytes
; Exports: ?GetIsLeader@PartyMgr@GW@@YA_NXZ
;
  1001F5C0:  56                              push     esi
  1001F5C1:  e8 8a 9a ff ff                  call     0x10019050  ; GW::GetPartyContext
  1001F5C6:  85 c0                           test     eax, eax
  1001F5C8:  74 35                           je       0x1001f5ff
  1001F5CA:  83 78 48 00                     cmp      dword ptr [eax + 0x48], 0
  1001F5CE:  74 2f                           je       0x1001f5ff
  1001F5D0:  8b 70 54                        mov      esi, dword ptr [eax + 0x54]
  1001F5D3:  85 f6                           test     esi, esi
  1001F5D5:  74 28                           je       0x1001f5ff
  1001F5D7:  83 7e 04 00                     cmp      dword ptr [esi + 4], 0
  1001F5DB:  74 22                           je       0x1001f5ff
  1001F5DD:  e8 be 12 00 00                  call     0x100208a0  ; PlayerMgr::GetPlayerNumber, GetPlayerNumber
  1001F5E2:  8b 56 0c                        mov      edx, dword ptr [esi + 0xc]
  1001F5E5:  8b 4e 04                        mov      ecx, dword ptr [esi + 4]
  1001F5E8:  8d 14 52                        lea      edx, [edx + edx*2]
  1001F5EB:  8d 14 91                        lea      edx, [ecx + edx*4]
  1001F5EE:  3b ca                           cmp      ecx, edx
  1001F5F0:  74 0d                           je       0x1001f5ff
  1001F5F2:  f6 41 08 01                     test     byte ptr [ecx + 8], 1
  1001F5F6:  77 0b                           ja       0x1001f603
  1001F5F8:  83 c1 0c                        add      ecx, 0xc
  1001F5FB:  3b ca                           cmp      ecx, edx
  1001F5FD:  75 f3                           jne      0x1001f5f2
  1001F5FF:  32 c0                           xor      al, al
  1001F601:  5e                              pop      esi
  1001F602:  c3                              ret      
  1001F603:  39 01                           cmp      dword ptr [ecx], eax
  1001F605:  5e                              pop      esi
  1001F606:  0f 94 c0                        sete     al
  1001F609:  c3                              ret      


; === PartyMgr::GetIsPartyDefeated ===
; RVA: 0x0001F610  Size: 20 bytes
; Exports: ?GetIsPartyDefeated@PartyMgr@GW@@YA_NXZ
;
  1001F610:  e8 3b 9a ff ff                  call     0x10019050  ; GW::GetPartyContext
  1001F615:  85 c0                           test     eax, eax
  1001F617:  74 08                           je       0x1001f621
  1001F619:  f6 40 14 20                     test     byte ptr [eax + 0x14], 0x20
  1001F61D:  0f 97 c0                        seta     al
  1001F620:  c3                              ret      
  1001F621:  32 c0                           xor      al, al
  1001F623:  c3                              ret      


; === PartyMgr::GetIsPartyInHardMode ===
; RVA: 0x0001F630  Size: 20 bytes
; Exports: ?GetIsPartyInHardMode@PartyMgr@GW@@YA_NXZ
;
  1001F630:  e8 1b 9a ff ff                  call     0x10019050  ; GW::GetPartyContext
  1001F635:  85 c0                           test     eax, eax
  1001F637:  74 08                           je       0x1001f641
  1001F639:  f6 40 14 10                     test     byte ptr [eax + 0x14], 0x10
  1001F63D:  0f 97 c0                        seta     al
  1001F640:  c3                              ret      
  1001F641:  32 c0                           xor      al, al
  1001F643:  c3                              ret      


; === PartyMgr::GetIsPartyLoaded ===
; RVA: 0x0001F650  Size: 67 bytes
; Exports: ?GetIsPartyLoaded@PartyMgr@GW@@YA_NXZ
;
  1001F650:  e8 fb 99 ff ff                  call     0x10019050  ; GW::GetPartyContext
  1001F655:  85 c0                           test     eax, eax
  1001F657:  74 37                           je       0x1001f690
  1001F659:  83 78 48 00                     cmp      dword ptr [eax + 0x48], 0
  1001F65D:  74 31                           je       0x1001f690
  1001F65F:  8b 48 54                        mov      ecx, dword ptr [eax + 0x54]
  1001F662:  85 c9                           test     ecx, ecx
  1001F664:  74 2a                           je       0x1001f690
  1001F666:  8b 41 04                        mov      eax, dword ptr [ecx + 4]
  1001F669:  85 c0                           test     eax, eax
  1001F66B:  74 23                           je       0x1001f690
  1001F66D:  8b 49 0c                        mov      ecx, dword ptr [ecx + 0xc]
  1001F670:  8d 0c 49                        lea      ecx, [ecx + ecx*2]
  1001F673:  8d 0c 88                        lea      ecx, [eax + ecx*4]
  1001F676:  3b c1                           cmp      eax, ecx
  1001F678:  74 13                           je       0x1001f68d
  1001F67A:  66 0f 1f 44 00 00               nop      word ptr [eax + eax]
  1001F680:  f6 40 08 01                     test     byte ptr [eax + 8], 1
  1001F684:  76 0a                           jbe      0x1001f690
  1001F686:  83 c0 0c                        add      eax, 0xc
  1001F689:  3b c1                           cmp      eax, ecx
  1001F68B:  75 f3                           jne      0x1001f680
  1001F68D:  b0 01                           mov      al, 1
  1001F68F:  c3                              ret      
  1001F690:  32 c0                           xor      al, al
  1001F692:  c3                              ret      


; === PartyMgr::GetIsPartyTicked ===
; RVA: 0x0001F6A0  Size: 67 bytes
; Exports: ?GetIsPartyTicked@PartyMgr@GW@@YA_NXZ
;
  1001F6A0:  e8 ab 99 ff ff                  call     0x10019050  ; GW::GetPartyContext
  1001F6A5:  85 c0                           test     eax, eax
  1001F6A7:  74 37                           je       0x1001f6e0
  1001F6A9:  83 78 48 00                     cmp      dword ptr [eax + 0x48], 0
  1001F6AD:  74 31                           je       0x1001f6e0
  1001F6AF:  8b 48 54                        mov      ecx, dword ptr [eax + 0x54]
  1001F6B2:  85 c9                           test     ecx, ecx
  1001F6B4:  74 2a                           je       0x1001f6e0
  1001F6B6:  8b 41 04                        mov      eax, dword ptr [ecx + 4]
  1001F6B9:  85 c0                           test     eax, eax
  1001F6BB:  74 23                           je       0x1001f6e0
  1001F6BD:  8b 49 0c                        mov      ecx, dword ptr [ecx + 0xc]
  1001F6C0:  8d 0c 49                        lea      ecx, [ecx + ecx*2]
  1001F6C3:  8d 0c 88                        lea      ecx, [eax + ecx*4]
  1001F6C6:  3b c1                           cmp      eax, ecx
  1001F6C8:  74 13                           je       0x1001f6dd
  1001F6CA:  66 0f 1f 44 00 00               nop      word ptr [eax + eax]
  1001F6D0:  f6 40 08 02                     test     byte ptr [eax + 8], 2
  1001F6D4:  76 0a                           jbe      0x1001f6e0
  1001F6D6:  83 c0 0c                        add      eax, 0xc
  1001F6D9:  3b c1                           cmp      eax, ecx
  1001F6DB:  75 f3                           jne      0x1001f6d0
  1001F6DD:  b0 01                           mov      al, 1
  1001F6DF:  c3                              ret      
  1001F6E0:  32 c0                           xor      al, al
  1001F6E2:  c3                              ret      


; === PartyMgr::GetIsPlayerTicked ===
; RVA: 0x0001F6F0  Size: 115 bytes
; Exports: ?GetIsPlayerTicked@PartyMgr@GW@@YA_NI@Z
;
  1001F6F0:  55                              push     ebp
  1001F6F1:  8b ec                           mov      ebp, esp
  1001F6F3:  56                              push     esi
  1001F6F4:  57                              push     edi
  1001F6F5:  e8 56 99 ff ff                  call     0x10019050  ; GW::GetPartyContext
  1001F6FA:  85 c0                           test     eax, eax
  1001F6FC:  74 3d                           je       0x1001f73b
  1001F6FE:  83 78 48 00                     cmp      dword ptr [eax + 0x48], 0
  1001F702:  74 37                           je       0x1001f73b
  1001F704:  8b 70 54                        mov      esi, dword ptr [eax + 0x54]
  1001F707:  85 f6                           test     esi, esi
  1001F709:  74 30                           je       0x1001f73b
  1001F70B:  83 7e 04 00                     cmp      dword ptr [esi + 4], 0
  1001F70F:  74 2a                           je       0x1001f73b
  1001F711:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  1001F714:  83 ff ff                        cmp      edi, -1
  1001F717:  75 33                           jne      0x1001f74c
  1001F719:  e8 82 11 00 00                  call     0x100208a0  ; PlayerMgr::GetPlayerNumber, GetPlayerNumber
  1001F71E:  8b 56 0c                        mov      edx, dword ptr [esi + 0xc]
  1001F721:  8b 4e 04                        mov      ecx, dword ptr [esi + 4]
  1001F724:  8d 14 52                        lea      edx, [edx + edx*2]
  1001F727:  8d 14 91                        lea      edx, [ecx + edx*4]
  1001F72A:  3b ca                           cmp      ecx, edx
  1001F72C:  74 0d                           je       0x1001f73b
  1001F72E:  66 90                           nop      
  1001F730:  39 01                           cmp      dword ptr [ecx], eax
  1001F732:  74 0d                           je       0x1001f741
  1001F734:  83 c1 0c                        add      ecx, 0xc
  1001F737:  3b ca                           cmp      ecx, edx
  1001F739:  75 f5                           jne      0x1001f730
  1001F73B:  5f                              pop      edi
  1001F73C:  32 c0                           xor      al, al
  1001F73E:  5e                              pop      esi
  1001F73F:  5d                              pop      ebp
  1001F740:  c3                              ret      
  1001F741:  f6 41 08 02                     test     byte ptr [ecx + 8], 2
  1001F745:  5f                              pop      edi
  1001F746:  0f 97 c0                        seta     al
  1001F749:  5e                              pop      esi
  1001F74A:  5d                              pop      ebp
  1001F74B:  c3                              ret      
  1001F74C:  3b 7e 0c                        cmp      edi, dword ptr [esi + 0xc]
  1001F74F:  73 ea                           jae      0x1001f73b
  1001F751:  8b 46 04                        mov      eax, dword ptr [esi + 4]
  1001F754:  8d 0c 7f                        lea      ecx, [edi + edi*2]
  1001F757:  5f                              pop      edi
  1001F758:  5e                              pop      esi
  1001F759:  f6 44 88 08 02                  test     byte ptr [eax + ecx*4 + 8], 2
  1001F75E:  0f 97 c0                        seta     al
  1001F761:  5d                              pop      ebp
  1001F762:  c3                              ret      


; === PartyMgr::GetPartyHenchmanCount ===
; RVA: 0x0001F770  Size: 29 bytes
; Exports: ?GetPartyHenchmanCount@PartyMgr@GW@@YAIXZ
;
  1001F770:  e8 db 98 ff ff                  call     0x10019050  ; GW::GetPartyContext
  1001F775:  85 c0                           test     eax, eax
  1001F777:  74 11                           je       0x1001f78a
  1001F779:  83 78 48 00                     cmp      dword ptr [eax + 0x48], 0
  1001F77D:  74 0b                           je       0x1001f78a
  1001F77F:  8b 40 54                        mov      eax, dword ptr [eax + 0x54]
  1001F782:  85 c0                           test     eax, eax
  1001F784:  74 04                           je       0x1001f78a
  1001F786:  8b 40 1c                        mov      eax, dword ptr [eax + 0x1c]
  1001F789:  c3                              ret      
  1001F78A:  33 c0                           xor      eax, eax
  1001F78C:  c3                              ret      


; === PartyMgr::GetPartyHeroCount ===
; RVA: 0x0001F790  Size: 29 bytes
; Exports: ?GetPartyHeroCount@PartyMgr@GW@@YAIXZ
;
  1001F790:  e8 bb 98 ff ff                  call     0x10019050  ; GW::GetPartyContext
  1001F795:  85 c0                           test     eax, eax
  1001F797:  74 11                           je       0x1001f7aa
  1001F799:  83 78 48 00                     cmp      dword ptr [eax + 0x48], 0
  1001F79D:  74 0b                           je       0x1001f7aa
  1001F79F:  8b 40 54                        mov      eax, dword ptr [eax + 0x54]
  1001F7A2:  85 c0                           test     eax, eax
  1001F7A4:  74 04                           je       0x1001f7aa
  1001F7A6:  8b 40 2c                        mov      eax, dword ptr [eax + 0x2c]
  1001F7A9:  c3                              ret      
  1001F7AA:  33 c0                           xor      eax, eax
  1001F7AC:  c3                              ret      


; === PartyMgr::GetPartyInfo ===
; RVA: 0x0001F7B0  Size: 92 bytes
; Exports: ?GetPartyInfo@PartyMgr@GW@@YAPAUPartyInfo@2@I@Z
;
  1001F7B0:  55                              push     ebp
  1001F7B1:  8b ec                           mov      ebp, esp
  1001F7B3:  56                              push     esi
  1001F7B4:  57                              push     edi
  1001F7B5:  e8 96 98 ff ff                  call     0x10019050  ; GW::GetPartyContext
  1001F7BA:  8b f0                           mov      esi, eax
  1001F7BC:  85 f6                           test     esi, esi
  1001F7BE:  74 46                           je       0x1001f806
  1001F7C0:  8b 46 48                        mov      eax, dword ptr [esi + 0x48]
  1001F7C3:  85 c0                           test     eax, eax
  1001F7C5:  74 3f                           je       0x1001f806
  1001F7C7:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  1001F7CA:  85 ff                           test     edi, edi
  1001F7CC:  75 07                           jne      0x1001f7d5
  1001F7CE:  8b 46 54                        mov      eax, dword ptr [esi + 0x54]
  1001F7D1:  5f                              pop      edi
  1001F7D2:  5e                              pop      esi
  1001F7D3:  5d                              pop      ebp
  1001F7D4:  c3                              ret      
  1001F7D5:  3b f8                           cmp      edi, eax
  1001F7D7:  73 2d                           jae      0x1001f806
  1001F7D9:  83 7e 40 00                     cmp      dword ptr [esi + 0x40], 0
  1001F7DD:  74 04                           je       0x1001f7e3
  1001F7DF:  3b f8                           cmp      edi, eax
  1001F7E1:  72 19                           jb       0x1001f7fc
  1001F7E3:  68 9c 34 05 10                  push     0x1005349c  ; "GW::BaseArray<struct GW::PartyInfo *>::at"
  1001F7E8:  6a 1e                           push     0x1e
  1001F7EA:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  1001F7EF:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  1001F7F4:  e8 77 60 fe ff                  call     0x10005870  ; GW::FatalAssert
  1001F7F9:  83 c4 10                        add      esp, 0x10
  1001F7FC:  8b 46 40                        mov      eax, dword ptr [esi + 0x40]
  1001F7FF:  8b 04 b8                        mov      eax, dword ptr [eax + edi*4]
  1001F802:  5f                              pop      edi
  1001F803:  5e                              pop      esi
  1001F804:  5d                              pop      ebp
  1001F805:  c3                              ret      
  1001F806:  5f                              pop      edi
  1001F807:  33 c0                           xor      eax, eax
  1001F809:  5e                              pop      esi
  1001F80A:  5d                              pop      ebp
  1001F80B:  c3                              ret      


; === PartyMgr::GetPartyPlayerCount ===
; RVA: 0x0001F810  Size: 29 bytes
; Exports: ?GetPartyPlayerCount@PartyMgr@GW@@YAIXZ
;
  1001F810:  e8 3b 98 ff ff                  call     0x10019050  ; GW::GetPartyContext
  1001F815:  85 c0                           test     eax, eax
  1001F817:  74 11                           je       0x1001f82a
  1001F819:  83 78 48 00                     cmp      dword ptr [eax + 0x48], 0
  1001F81D:  74 0b                           je       0x1001f82a
  1001F81F:  8b 40 54                        mov      eax, dword ptr [eax + 0x54]
  1001F822:  85 c0                           test     eax, eax
  1001F824:  74 04                           je       0x1001f82a
  1001F826:  8b 40 0c                        mov      eax, dword ptr [eax + 0xc]
  1001F829:  c3                              ret      
  1001F82A:  33 c0                           xor      eax, eax
  1001F82C:  c3                              ret      


; === PartyMgr::GetPartySearch ===
; RVA: 0x0001F830  Size: 57 bytes
; Exports: ?GetPartySearch@PartyMgr@GW@@YAPAUPartySearch@2@I@Z
;
  1001F830:  55                              push     ebp
  1001F831:  8b ec                           mov      ebp, esp
  1001F833:  56                              push     esi
  1001F834:  e8 17 98 ff ff                  call     0x10019050  ; GW::GetPartyContext
  1001F839:  85 c0                           test     eax, eax
  1001F83B:  74 27                           je       0x1001f864
  1001F83D:  8b 88 c0 00 00 00               mov      ecx, dword ptr [eax + 0xc0]
  1001F843:  8b 80 c8 00 00 00               mov      eax, dword ptr [eax + 0xc8]
  1001F849:  8d 14 81                        lea      edx, [ecx + eax*4]
  1001F84C:  3b ca                           cmp      ecx, edx
  1001F84E:  74 14                           je       0x1001f864
  1001F850:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  1001F853:  8b 01                           mov      eax, dword ptr [ecx]
  1001F855:  85 c0                           test     eax, eax
  1001F857:  74 04                           je       0x1001f85d
  1001F859:  39 30                           cmp      dword ptr [eax], esi
  1001F85B:  74 09                           je       0x1001f866
  1001F85D:  83 c1 04                        add      ecx, 4
  1001F860:  3b ca                           cmp      ecx, edx
  1001F862:  75 ef                           jne      0x1001f853
  1001F864:  33 c0                           xor      eax, eax
  1001F866:  5e                              pop      esi
  1001F867:  5d                              pop      ebp
  1001F868:  c3                              ret      


; === PartyMgr::GetPartySize ===
; RVA: 0x0001F870  Size: 35 bytes
; Exports: ?GetPartySize@PartyMgr@GW@@YAIXZ
;
  1001F870:  e8 db 97 ff ff                  call     0x10019050  ; GW::GetPartyContext
  1001F875:  85 c0                           test     eax, eax
  1001F877:  74 17                           je       0x1001f890
  1001F879:  83 78 48 00                     cmp      dword ptr [eax + 0x48], 0
  1001F87D:  74 11                           je       0x1001f890
  1001F87F:  8b 48 54                        mov      ecx, dword ptr [eax + 0x54]
  1001F882:  85 c9                           test     ecx, ecx
  1001F884:  74 0a                           je       0x1001f890
  1001F886:  8b 41 2c                        mov      eax, dword ptr [ecx + 0x2c]
  1001F889:  03 41 1c                        add      eax, dword ptr [ecx + 0x1c]
  1001F88C:  03 41 0c                        add      eax, dword ptr [ecx + 0xc]
  1001F88F:  c3                              ret      
  1001F890:  33 c0                           xor      eax, eax
  1001F892:  c3                              ret      


; === PartyMgr::GetPetInfo ===
; RVA: 0x0001F8A0  Size: 85 bytes
; Exports: ?GetPetInfo@PartyMgr@GW@@YAPAUPetInfo@2@I@Z
;
  1001F8A0:  55                              push     ebp
  1001F8A1:  8b ec                           mov      ebp, esp
  1001F8A3:  56                              push     esi
  1001F8A4:  57                              push     edi
  1001F8A5:  e8 f6 97 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  1001F8AA:  8b f8                           mov      edi, eax
  1001F8AC:  85 ff                           test     edi, edi
  1001F8AE:  74 3f                           je       0x1001f8ef
  1001F8B0:  83 bf b4 06 00 00 00            cmp      dword ptr [edi + 0x6b4], 0
  1001F8B7:  74 36                           je       0x1001f8ef
  1001F8B9:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  1001F8BC:  85 f6                           test     esi, esi
  1001F8BE:  75 07                           jne      0x1001f8c7
  1001F8C0:  e8 0b 2a fe ff                  call     0x100022d0  ; Agents::GetControlledCharacterId, GetControlledCharacterId
  1001F8C5:  8b f0                           mov      esi, eax
  1001F8C7:  8b 8f b4 06 00 00               mov      ecx, dword ptr [edi + 0x6b4]
  1001F8CD:  8b 87 ac 06 00 00               mov      eax, dword ptr [edi + 0x6ac]
  1001F8D3:  8d 14 cd 00 00 00 00            lea      edx, [ecx*8]
  1001F8DA:  2b d1                           sub      edx, ecx
  1001F8DC:  8d 0c 90                        lea      ecx, [eax + edx*4]
  1001F8DF:  3b c1                           cmp      eax, ecx
  1001F8E1:  74 0c                           je       0x1001f8ef
  1001F8E3:  39 70 04                        cmp      dword ptr [eax + 4], esi
  1001F8E6:  74 09                           je       0x1001f8f1
  1001F8E8:  83 c0 1c                        add      eax, 0x1c
  1001F8EB:  3b c1                           cmp      eax, ecx
  1001F8ED:  75 f4                           jne      0x1001f8e3
  1001F8EF:  33 c0                           xor      eax, eax
  1001F8F1:  5f                              pop      edi
  1001F8F2:  5e                              pop      esi
  1001F8F3:  5d                              pop      ebp
  1001F8F4:  c3                              ret      


; === PartyMgr::InvitePlayer ===
; RVA: 0x0001F900  Size: 38 bytes
; Exports: ?InvitePlayer@PartyMgr@GW@@YA_NI@Z
;
  1001F900:  55                              push     ebp
  1001F901:  8b ec                           mov      ebp, esp
  1001F903:  ff 75 08                        push     dword ptr [ebp + 8]
  1001F906:  e8 15 0e 00 00                  call     0x10020720  ; PlayerMgr::GetPlayerByID
  1001F90B:  83 c4 04                        add      esp, 4
  1001F90E:  85 c0                           test     eax, eax
  1001F910:  74 10                           je       0x1001f922
  1001F912:  8b 40 28                        mov      eax, dword ptr [eax + 0x28]
  1001F915:  85 c0                           test     eax, eax
  1001F917:  74 09                           je       0x1001f922
  1001F919:  89 45 08                        mov      dword ptr [ebp + 8], eax
  1001F91C:  5d                              pop      ebp
  1001F91D:  e9 0e 00 00 00                  jmp      0x1001f930
  1001F922:  32 c0                           xor      al, al
  1001F924:  5d                              pop      ebp
  1001F925:  c3                              ret      


; === PartyMgr::InvitePlayer ===
; RVA: 0x0001F930  Size: 99 bytes
; Exports: ?InvitePlayer@PartyMgr@GW@@YA_NPB_W@Z
;
  1001F930:  55                              push     ebp
  1001F931:  8b ec                           mov      ebp, esp
  1001F933:  83 ec 44                        sub      esp, 0x44
  1001F936:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1001F93B:  33 c5                           xor      eax, ebp
  1001F93D:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001F940:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001F943:  85 c0                           test     eax, eax
  1001F945:  74 3c                           je       0x1001f983
  1001F947:  66 83 38 00                     cmp      word ptr [eax], 0
  1001F94B:  74 36                           je       0x1001f983
  1001F94D:  50                              push     eax
  1001F94E:  68 78 34 05 10                  push     0x10053478
  1001F953:  8d 45 bc                        lea      eax, [ebp - 0x44]
  1001F956:  6a 20                           push     0x20
  1001F958:  50                              push     eax
  1001F959:  e8 82 5d fe ff                  call     0x100056e0
  1001F95E:  83 c4 10                        add      esp, 0x10
  1001F961:  85 c0                           test     eax, eax
  1001F963:  78 1e                           js       0x1001f983
  1001F965:  8d 45 bc                        lea      eax, [ebp - 0x44]
  1001F968:  50                              push     eax
  1001F969:  6a 2f                           push     0x2f
  1001F96B:  e8 90 56 fe ff                  call     0x10005000  ; Chat::SendChat
  1001F970:  83 c4 08                        add      esp, 8
  1001F973:  b0 01                           mov      al, 1
  1001F975:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001F978:  33 cd                           xor      ecx, ebp
  1001F97A:  e8 38 ca 00 00                  call     0x1002c3b7
  1001F97F:  8b e5                           mov      esp, ebp
  1001F981:  5d                              pop      ebp
  1001F982:  c3                              ret      
  1001F983:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001F986:  32 c0                           xor      al, al
  1001F988:  33 cd                           xor      ecx, ebp
  1001F98A:  e8 28 ca 00 00                  call     0x1002c3b7
  1001F98F:  8b e5                           mov      esp, ebp
  1001F991:  5d                              pop      ebp
  1001F992:  c3                              ret      


; === PartyMgr::KickAllHeroes ===
; RVA: 0x0001F9A0  Size: 91 bytes
; Exports: ?KickAllHeroes@PartyMgr@GW@@YA_NXZ
;
  1001F9A0:  53                              push     ebx
  1001F9A1:  56                              push     esi
  1001F9A2:  57                              push     edi
  1001F9A3:  e8 a8 96 ff ff                  call     0x10019050  ; GW::GetPartyContext
  1001F9A8:  85 c0                           test     eax, eax
  1001F9AA:  74 49                           je       0x1001f9f5
  1001F9AC:  83 78 48 00                     cmp      dword ptr [eax + 0x48], 0
  1001F9B0:  74 43                           je       0x1001f9f5
  1001F9B2:  8b 58 54                        mov      ebx, dword ptr [eax + 0x54]
  1001F9B5:  85 db                           test     ebx, ebx
  1001F9B7:  74 3c                           je       0x1001f9f5
  1001F9B9:  e8 e2 0e 00 00                  call     0x100208a0  ; PlayerMgr::GetPlayerNumber, GetPlayerNumber
  1001F9BE:  8b f8                           mov      edi, eax
  1001F9C0:  85 ff                           test     edi, edi
  1001F9C2:  74 31                           je       0x1001f9f5
  1001F9C4:  8b 4b 2c                        mov      ecx, dword ptr [ebx + 0x2c]
  1001F9C7:  8b 73 24                        mov      esi, dword ptr [ebx + 0x24]
  1001F9CA:  8d 0c 49                        lea      ecx, [ecx + ecx*2]
  1001F9CD:  8d 1c ce                        lea      ebx, [esi + ecx*8]
  1001F9D0:  3b f3                           cmp      esi, ebx
  1001F9D2:  74 1b                           je       0x1001f9ef
  1001F9D4:  39 7e 04                        cmp      dword ptr [esi + 4], edi
  1001F9D7:  75 0f                           jne      0x1001f9e8
  1001F9D9:  ff 76 08                        push     dword ptr [esi + 8]
  1001F9DC:  e8 7f 00 00 00                  call     0x1001fa60  ; PartyMgr::KickHero
  1001F9E1:  83 c4 04                        add      esp, 4
  1001F9E4:  84 c0                           test     al, al
  1001F9E6:  74 0d                           je       0x1001f9f5
  1001F9E8:  83 c6 18                        add      esi, 0x18
  1001F9EB:  3b f3                           cmp      esi, ebx
  1001F9ED:  75 e5                           jne      0x1001f9d4
  1001F9EF:  5f                              pop      edi
  1001F9F0:  5e                              pop      esi
  1001F9F1:  b0 01                           mov      al, 1
  1001F9F3:  5b                              pop      ebx
  1001F9F4:  c3                              ret      
  1001F9F5:  5f                              pop      edi
  1001F9F6:  5e                              pop      esi
  1001F9F7:  32 c0                           xor      al, al
  1001F9F9:  5b                              pop      ebx
  1001F9FA:  c3                              ret      


; === PartyMgr::KickHenchman ===
; RVA: 0x0001FA00  Size: 90 bytes
; Exports: ?KickHenchman@PartyMgr@GW@@YA_NI@Z
;
  1001FA00:  55                              push     ebp
  1001FA01:  8b ec                           mov      ebp, esp
  1001FA03:  56                              push     esi
  1001FA04:  68 54 34 05 10                  push     0x10053454
  1001FA09:  e8 72 6d 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001FA0E:  6a 01                           push     1
  1001FA10:  50                              push     eax
  1001FA11:  e8 da 69 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001FA16:  6a 00                           push     0
  1001FA18:  50                              push     eax
  1001FA19:  e8 d2 69 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001FA1E:  8b f0                           mov      esi, eax
  1001FA20:  56                              push     esi
  1001FA21:  e8 ba 6d 00 00                  call     0x100267e0  ; UI::GetFrameContext
  1001FA26:  8b c8                           mov      ecx, eax
  1001FA28:  83 c4 18                        add      esp, 0x18
  1001FA2B:  85 c9                           test     ecx, ecx
  1001FA2D:  75 05                           jne      0x1001fa34
  1001FA2F:  32 c0                           xor      al, al
  1001FA31:  5e                              pop      esi
  1001FA32:  5d                              pop      ebp
  1001FA33:  c3                              ret      
  1001FA34:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001FA37:  6a 00                           push     0
  1001FA39:  6a 00                           push     0
  1001FA3B:  6a 62                           push     0x62
  1001FA3D:  56                              push     esi
  1001FA3E:  c7 41 24 02 00 00 00            mov      dword ptr [ecx + 0x24], 2
  1001FA45:  c7 41 28 01 00 00 00            mov      dword ptr [ecx + 0x28], 1
  1001FA4C:  89 41 2c                        mov      dword ptr [ecx + 0x2c], eax
  1001FA4F:  e8 cc 84 00 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  1001FA54:  83 c4 10                        add      esp, 0x10
  1001FA57:  5e                              pop      esi
  1001FA58:  5d                              pop      ebp
  1001FA59:  c3                              ret      


; === PartyMgr::KickHero ===
; RVA: 0x0001FA60  Size: 181 bytes
; Exports: ?KickHero@PartyMgr@GW@@YA_NW4HeroID@Constants@2@@Z
;
  1001FA60:  55                              push     ebp
  1001FA61:  8b ec                           mov      ebp, esp
  1001FA63:  51                              push     ecx
  1001FA64:  53                              push     ebx
  1001FA65:  56                              push     esi
  1001FA66:  57                              push     edi
  1001FA67:  68 54 34 05 10                  push     0x10053454
  1001FA6C:  e8 0f 6d 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001FA71:  6a 01                           push     1
  1001FA73:  50                              push     eax
  1001FA74:  e8 77 69 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001FA79:  6a 00                           push     0
  1001FA7B:  50                              push     eax
  1001FA7C:  e8 6f 69 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001FA81:  50                              push     eax
  1001FA82:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001FA85:  e8 56 6d 00 00                  call     0x100267e0  ; UI::GetFrameContext
  1001FA8A:  8b f8                           mov      edi, eax
  1001FA8C:  83 c4 18                        add      esp, 0x18
  1001FA8F:  85 ff                           test     edi, edi
  1001FA91:  74 51                           je       0x1001fae4
  1001FA93:  c7 47 24 03 00 00 00            mov      dword ptr [edi + 0x24], 3
  1001FA9A:  c7 47 28 01 00 00 00            mov      dword ptr [edi + 0x28], 1
  1001FAA1:  e8 aa 95 ff ff                  call     0x10019050  ; GW::GetPartyContext
  1001FAA6:  85 c0                           test     eax, eax
  1001FAA8:  74 3a                           je       0x1001fae4
  1001FAAA:  83 78 48 00                     cmp      dword ptr [eax + 0x48], 0
  1001FAAE:  74 34                           je       0x1001fae4
  1001FAB0:  8b 58 54                        mov      ebx, dword ptr [eax + 0x54]
  1001FAB3:  85 db                           test     ebx, ebx
  1001FAB5:  74 2d                           je       0x1001fae4
  1001FAB7:  e8 e4 0d 00 00                  call     0x100208a0  ; PlayerMgr::GetPlayerNumber, GetPlayerNumber
  1001FABC:  85 c0                           test     eax, eax
  1001FABE:  74 24                           je       0x1001fae4
  1001FAC0:  8b 4b 2c                        mov      ecx, dword ptr [ebx + 0x2c]
  1001FAC3:  8b 73 24                        mov      esi, dword ptr [ebx + 0x24]
  1001FAC6:  8d 0c 49                        lea      ecx, [ecx + ecx*2]
  1001FAC9:  8d 0c ce                        lea      ecx, [esi + ecx*8]
  1001FACC:  3b f1                           cmp      esi, ecx
  1001FACE:  74 14                           je       0x1001fae4
  1001FAD0:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  1001FAD3:  39 46 04                        cmp      dword ptr [esi + 4], eax
  1001FAD6:  75 05                           jne      0x1001fadd
  1001FAD8:  3b 56 08                        cmp      edx, dword ptr [esi + 8]
  1001FADB:  74 10                           je       0x1001faed
  1001FADD:  83 c6 18                        add      esi, 0x18
  1001FAE0:  3b f1                           cmp      esi, ecx
  1001FAE2:  75 ef                           jne      0x1001fad3
  1001FAE4:  5f                              pop      edi
  1001FAE5:  5e                              pop      esi
  1001FAE6:  32 c0                           xor      al, al
  1001FAE8:  5b                              pop      ebx
  1001FAE9:  8b e5                           mov      esp, ebp
  1001FAEB:  5d                              pop      ebp
  1001FAEC:  c3                              ret      
  1001FAED:  e8 ae 0d 00 00                  call     0x100208a0  ; PlayerMgr::GetPlayerNumber, GetPlayerNumber
  1001FAF2:  0f b7 0e                        movzx    ecx, word ptr [esi]
  1001FAF5:  6a 00                           push     0
  1001FAF7:  6a 00                           push     0
  1001FAF9:  c1 e0 10                        shl      eax, 0x10
  1001FAFC:  6a 62                           push     0x62
  1001FAFE:  ff 75 fc                        push     dword ptr [ebp - 4]
  1001FB01:  0b c8                           or       ecx, eax
  1001FB03:  89 4f 2c                        mov      dword ptr [edi + 0x2c], ecx
  1001FB06:  e8 15 84 00 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  1001FB0B:  83 c4 10                        add      esp, 0x10
  1001FB0E:  5f                              pop      edi
  1001FB0F:  5e                              pop      esi
  1001FB10:  5b                              pop      ebx
  1001FB11:  8b e5                           mov      esp, ebp
  1001FB13:  5d                              pop      ebp
  1001FB14:  c3                              ret      


; === PartyMgr::KickPlayer ===
; RVA: 0x0001FB20  Size: 90 bytes
; Exports: ?KickPlayer@PartyMgr@GW@@YA_NI@Z
;
  1001FB20:  55                              push     ebp
  1001FB21:  8b ec                           mov      ebp, esp
  1001FB23:  56                              push     esi
  1001FB24:  68 54 34 05 10                  push     0x10053454
  1001FB29:  e8 52 6c 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001FB2E:  6a 01                           push     1
  1001FB30:  50                              push     eax
  1001FB31:  e8 ba 68 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001FB36:  6a 00                           push     0
  1001FB38:  50                              push     eax
  1001FB39:  e8 b2 68 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001FB3E:  8b f0                           mov      esi, eax
  1001FB40:  56                              push     esi
  1001FB41:  e8 9a 6c 00 00                  call     0x100267e0  ; UI::GetFrameContext
  1001FB46:  8b c8                           mov      ecx, eax
  1001FB48:  83 c4 18                        add      esp, 0x18
  1001FB4B:  85 c9                           test     ecx, ecx
  1001FB4D:  75 05                           jne      0x1001fb54
  1001FB4F:  32 c0                           xor      al, al
  1001FB51:  5e                              pop      esi
  1001FB52:  5d                              pop      ebp
  1001FB53:  c3                              ret      
  1001FB54:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001FB57:  6a 00                           push     0
  1001FB59:  6a 00                           push     0
  1001FB5B:  6a 62                           push     0x62
  1001FB5D:  56                              push     esi
  1001FB5E:  c7 41 24 09 00 00 00            mov      dword ptr [ecx + 0x24], 9
  1001FB65:  c7 41 28 01 00 00 00            mov      dword ptr [ecx + 0x28], 1
  1001FB6C:  89 41 2c                        mov      dword ptr [ecx + 0x2c], eax
  1001FB6F:  e8 ac 83 00 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  1001FB74:  83 c4 10                        add      esp, 0x10
  1001FB77:  5e                              pop      esi
  1001FB78:  5d                              pop      ebp
  1001FB79:  c3                              ret      


; === PartyMgr::LeaveParty ===
; RVA: 0x0001FB80  Size: 42 bytes
; Exports: ?LeaveParty@PartyMgr@GW@@YA_NXZ
;
  1001FB80:  68 54 34 05 10                  push     0x10053454
  1001FB85:  e8 f6 6b 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001FB8A:  6a 01                           push     1
  1001FB8C:  50                              push     eax
  1001FB8D:  e8 5e 68 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001FB92:  6a 01                           push     1
  1001FB94:  50                              push     eax
  1001FB95:  e8 56 68 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001FB9A:  6a 00                           push     0
  1001FB9C:  6a 00                           push     0
  1001FB9E:  6a 62                           push     0x62
  1001FBA0:  50                              push     eax
  1001FBA1:  e8 7a 83 00 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  1001FBA6:  83 c4 24                        add      esp, 0x24
  1001FBA9:  c3                              ret      


; === PartyMgr::RespondToPartyRequest ===
; RVA: 0x0001FC80  Size: 100 bytes
; Exports: ?RespondToPartyRequest@PartyMgr@GW@@YA_NI_N@Z
;
  1001FC80:  55                              push     ebp
  1001FC81:  8b ec                           mov      ebp, esp
  1001FC83:  68 54 34 05 10                  push     0x10053454
  1001FC88:  e8 f3 6a 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001FC8D:  6a 01                           push     1
  1001FC8F:  50                              push     eax
  1001FC90:  e8 5b 67 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001FC95:  6a 08                           push     8
  1001FC97:  50                              push     eax
  1001FC98:  e8 53 67 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001FC9D:  8b d0                           mov      edx, eax
  1001FC9F:  83 c4 14                        add      esp, 0x14
  1001FCA2:  85 d2                           test     edx, edx
  1001FCA4:  74 3a                           je       0x1001fce0
  1001FCA6:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001FCA9:  85 c9                           test     ecx, ecx
  1001FCAB:  74 33                           je       0x1001fce0
  1001FCAD:  83 3d e0 c3 08 10 00            cmp      dword ptr [0x1008c3e0], 0
  1001FCB4:  74 2a                           je       0x1001fce0
  1001FCB6:  0f b6 45 0c                     movzx    eax, byte ptr [ebp + 0xc]
  1001FCBA:  83 f0 01                        xor      eax, 1
  1001FCBD:  89 0d dc c3 08 10               mov      dword ptr [0x1008c3dc], ecx
  1001FCC3:  40                              inc      eax
  1001FCC4:  50                              push     eax
  1001FCC5:  52                              push     edx
  1001FCC6:  e8 25 67 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001FCCB:  50                              push     eax
  1001FCCC:  e8 5f 63 00 00                  call     0x10026030  ; UI::ButtonClick, ButtonClick
  1001FCD1:  83 c4 0c                        add      esp, 0xc
  1001FCD4:  c7 05 dc c3 08 10 00 00 00 00   mov      dword ptr [0x1008c3dc], 0
  1001FCDE:  5d                              pop      ebp
  1001FCDF:  c3                              ret      
  1001FCE0:  32 c0                           xor      al, al
  1001FCE2:  5d                              pop      ebp
  1001FCE3:  c3                              ret      


; === PartyMgr::ReturnToOutpost ===
; RVA: 0x0001FCF0  Size: 28 bytes
; Exports: ?ReturnToOutpost@PartyMgr@GW@@YA_NXZ
;
  1001FCF0:  68 60 34 05 10                  push     0x10053460
  1001FCF5:  e8 86 6a 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001FCFA:  6a 00                           push     0
  1001FCFC:  50                              push     eax
  1001FCFD:  e8 ee 66 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001FD02:  50                              push     eax
  1001FD03:  e8 28 63 00 00                  call     0x10026030  ; UI::ButtonClick, ButtonClick
  1001FD08:  83 c4 10                        add      esp, 0x10
  1001FD0B:  c3                              ret      


; === PartyMgr::SearchParty ===
; RVA: 0x0001FD10  Size: 45 bytes
; Exports: ?SearchParty@PartyMgr@GW@@YA_NIPB_W@Z
;
  1001FD10:  55                              push     ebp
  1001FD11:  8b ec                           mov      ebp, esp
  1001FD13:  8b 15 d0 c3 08 10               mov      edx, dword ptr [0x1008c3d0]
  1001FD19:  85 d2                           test     edx, edx
  1001FD1B:  75 04                           jne      0x1001fd21
  1001FD1D:  32 c0                           xor      al, al
  1001FD1F:  5d                              pop      ebp
  1001FD20:  c3                              ret      
  1001FD21:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  1001FD24:  b9 50 34 05 10                  mov      ecx, 0x10053450
  1001FD29:  85 c0                           test     eax, eax
  1001FD2B:  6a 00                           push     0
  1001FD2D:  0f 45 c8                        cmovne   ecx, eax
  1001FD30:  51                              push     ecx
  1001FD31:  ff 75 08                        push     dword ptr [ebp + 8]
  1001FD34:  ff d2                           call     edx
  1001FD36:  83 c4 0c                        add      esp, 0xc
  1001FD39:  b0 01                           mov      al, 1
  1001FD3B:  5d                              pop      ebp
  1001FD3C:  c3                              ret      


; === PartyMgr::SearchPartyCancel ===
; RVA: 0x0001FD40  Size: 73 bytes
; Exports: ?SearchPartyCancel@PartyMgr@GW@@YA_NXZ
;
  1001FD40:  55                              push     ebp
  1001FD41:  8b ec                           mov      ebp, esp
  1001FD43:  a1 d8 c3 08 10                  mov      eax, dword ptr [0x1008c3d8]
  1001FD48:  83 ec 48                        sub      esp, 0x48
  1001FD4B:  85 c0                           test     eax, eax
  1001FD4D:  75 06                           jne      0x1001fd55
  1001FD4F:  32 c0                           xor      al, al
  1001FD51:  8b e5                           mov      esp, ebp
  1001FD53:  5d                              pop      ebp
  1001FD54:  c3                              ret      
  1001FD55:  8d 4d ec                        lea      ecx, [ebp - 0x14]
  1001FD58:  c7 45 f8 00 00 00 00            mov      dword ptr [ebp - 8], 0
  1001FD5F:  51                              push     ecx
  1001FD60:  33 d2                           xor      edx, edx
  1001FD62:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001FD69:  8d 4d b8                        lea      ecx, [ebp - 0x48]
  1001FD6C:  c7 45 f0 0b 00 00 00            mov      dword ptr [ebp - 0x10], 0xb
  1001FD73:  c7 45 f4 09 00 00 00            mov      dword ptr [ebp - 0xc], 9
  1001FD7A:  c7 45 e4 00 00 00 00            mov      dword ptr [ebp - 0x1c], 0
  1001FD81:  ff d0                           call     eax
  1001FD83:  b0 01                           mov      al, 1
  1001FD85:  8b e5                           mov      esp, ebp
  1001FD87:  5d                              pop      ebp
  1001FD88:  c3                              ret      


; === PartyMgr::SearchPartyReply ===
; RVA: 0x0001FD90  Size: 88 bytes
; Exports: ?SearchPartyReply@PartyMgr@GW@@YA_NI_N@Z
;
  1001FD90:  55                              push     ebp
  1001FD91:  8b ec                           mov      ebp, esp
  1001FD93:  83 ec 48                        sub      esp, 0x48
  1001FD96:  56                              push     esi
  1001FD97:  8b 35 d8 c3 08 10               mov      esi, dword ptr [0x1008c3d8]
  1001FD9D:  85 f6                           test     esi, esi
  1001FD9F:  75 07                           jne      0x1001fda8
  1001FDA1:  32 c0                           xor      al, al
  1001FDA3:  5e                              pop      esi
  1001FDA4:  8b e5                           mov      esp, ebp
  1001FDA6:  5d                              pop      ebp
  1001FDA7:  c3                              ret      
  1001FDA8:  33 c9                           xor      ecx, ecx
  1001FDAA:  c7 45 f8 00 00 00 00            mov      dword ptr [ebp - 8], 0
  1001FDB1:  38 4d 0c                        cmp      byte ptr [ebp + 0xc], cl
  1001FDB4:  b8 03 00 00 00                  mov      eax, 3
  1001FDB9:  89 4d e4                        mov      dword ptr [ebp - 0x1c], ecx
  1001FDBC:  0f 45 c1                        cmovne   eax, ecx
  1001FDBF:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001FDC6:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  1001FDC9:  8d 4d b8                        lea      ecx, [ebp - 0x48]
  1001FDCC:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001FDCF:  33 d2                           xor      edx, edx
  1001FDD1:  89 45 d8                        mov      dword ptr [ebp - 0x28], eax
  1001FDD4:  8d 45 ec                        lea      eax, [ebp - 0x14]
  1001FDD7:  50                              push     eax
  1001FDD8:  c7 45 f4 07 00 00 00            mov      dword ptr [ebp - 0xc], 7
  1001FDDF:  ff d6                           call     esi
  1001FDE1:  b0 01                           mov      al, 1
  1001FDE3:  5e                              pop      esi
  1001FDE4:  8b e5                           mov      esp, ebp
  1001FDE6:  5d                              pop      ebp
  1001FDE7:  c3                              ret      


; === PartyMgr::SetHardMode ===
; RVA: 0x0001FDF0  Size: 148 bytes
; Exports: ?SetHardMode@PartyMgr@GW@@YA_N_N@Z
;
  1001FDF0:  55                              push     ebp
  1001FDF1:  8b ec                           mov      ebp, esp
  1001FDF3:  83 ec 14                        sub      esp, 0x14
  1001FDF6:  56                              push     esi
  1001FDF7:  68 54 34 05 10                  push     0x10053454
  1001FDFC:  e8 7f 69 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001FE01:  6a 01                           push     1
  1001FE03:  50                              push     eax
  1001FE04:  e8 e7 65 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001FE09:  6a 06                           push     6
  1001FE0B:  50                              push     eax
  1001FE0C:  e8 df 65 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001FE11:  83 c4 14                        add      esp, 0x14
  1001FE14:  8b f0                           mov      esi, eax
  1001FE16:  e8 35 92 ff ff                  call     0x10019050  ; GW::GetPartyContext
  1001FE1B:  85 f6                           test     esi, esi
  1001FE1D:  74 5e                           je       0x1001fe7d
  1001FE1F:  85 c0                           test     eax, eax
  1001FE21:  74 5a                           je       0x1001fe7d
  1001FE23:  83 78 54 00                     cmp      dword ptr [eax + 0x54], 0
  1001FE27:  74 54                           je       0x1001fe7d
  1001FE29:  8a 4d 08                        mov      cl, byte ptr [ebp + 8]
  1001FE2C:  0f 57 c0                        xorps    xmm0, xmm0
  1001FE2F:  66 0f d6 45 ec                  movq     qword ptr [ebp - 0x14], xmm0
  1001FE34:  c7 45 f4 00 00 00 00            mov      dword ptr [ebp - 0xc], 0
  1001FE3B:  c7 45 f8 00 00 00 00            mov      dword ptr [ebp - 8], 0
  1001FE42:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001FE49:  f6 40 14 10                     test     byte ptr [eax + 0x14], 0x10
  1001FE4D:  0f 97 c0                        seta     al
  1001FE50:  3a c1                           cmp      al, cl
  1001FE52:  74 22                           je       0x1001fe76
  1001FE54:  0f b6 c1                        movzx    eax, cl
  1001FE57:  83 f0 01                        xor      eax, 1
  1001FE5A:  50                              push     eax
  1001FE5B:  56                              push     esi
  1001FE5C:  e8 8f 65 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001FE61:  6a 00                           push     0
  1001FE63:  8d 4d ec                        lea      ecx, [ebp - 0x14]
  1001FE66:  51                              push     ecx
  1001FE67:  6a 24                           push     0x24
  1001FE69:  50                              push     eax
  1001FE6A:  e8 b1 80 00 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  1001FE6F:  83 c4 18                        add      esp, 0x18
  1001FE72:  84 c0                           test     al, al
  1001FE74:  74 07                           je       0x1001fe7d
  1001FE76:  b0 01                           mov      al, 1
  1001FE78:  5e                              pop      esi
  1001FE79:  8b e5                           mov      esp, ebp
  1001FE7B:  5d                              pop      ebp
  1001FE7C:  c3                              ret      
  1001FE7D:  32 c0                           xor      al, al
  1001FE7F:  5e                              pop      esi
  1001FE80:  8b e5                           mov      esp, ebp
  1001FE82:  5d                              pop      ebp
  1001FE83:  c3                              ret      


; === PartyMgr::SetHeroBehavior ===
; RVA: 0x0001FE90  Size: 291 bytes
; Exports: ?SetHeroBehavior@PartyMgr@GW@@YA_NIW4HeroBehavior@2@@Z
;
  1001FE90:  55                              push     ebp
  1001FE91:  8b ec                           mov      ebp, esp
  1001FE93:  6a ff                           push     -1
  1001FE95:  68 fd b0 04 10                  push     0x1004b0fd
  1001FE9A:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  1001FEA0:  50                              push     eax
  1001FEA1:  83 ec 28                        sub      esp, 0x28
  1001FEA4:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1001FEA9:  33 c5                           xor      eax, ebp
  1001FEAB:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  1001FEAE:  56                              push     esi
  1001FEAF:  57                              push     edi
  1001FEB0:  50                              push     eax
  1001FEB1:  8d 45 f4                        lea      eax, [ebp - 0xc]
  1001FEB4:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  1001FEBA:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  1001FEBD:  ff 75 08                        push     dword ptr [ebp + 8]
  1001FEC0:  89 45 d4                        mov      dword ptr [ebp - 0x2c], eax
  1001FEC3:  e8 58 f6 ff ff                  call     0x1001f520
  1001FEC8:  83 c4 04                        add      esp, 4
  1001FECB:  83 f8 06                        cmp      eax, 6
  1001FECE:  76 04                           jbe      0x1001fed4
  1001FED0:  33 f6                           xor      esi, esi
  1001FED2:  eb 07                           jmp      0x1001fedb
  1001FED4:  8b 34 85 78 a1 08 10            mov      esi, dword ptr [eax*4 + 0x1008a178]
  1001FEDB:  c6 45 cc 00                     mov      byte ptr [ebp - 0x34], 0
  1001FEDF:  89 75 d0                        mov      dword ptr [ebp - 0x30], esi
  1001FEE2:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001FEE9:  85 f6                           test     esi, esi
  1001FEEB:  75 04                           jne      0x1001fef1
  1001FEED:  33 ff                           xor      edi, edi
  1001FEEF:  eb 36                           jmp      0x1001ff27
  1001FEF1:  56                              push     esi
  1001FEF2:  e8 89 68 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001FEF7:  8b f8                           mov      edi, eax
  1001FEF9:  83 c4 04                        add      esp, 4
  1001FEFC:  85 ff                           test     edi, edi
  1001FEFE:  75 27                           jne      0x1001ff27
  1001FF00:  50                              push     eax
  1001FF01:  56                              push     esi
  1001FF02:  c6 45 cc 01                     mov      byte ptr [ebp - 0x34], 1
  1001FF06:  e8 35 f4 ff ff                  call     0x1001f340
  1001FF0B:  83 c4 04                        add      esp, 4
  1001FF0E:  50                              push     eax
  1001FF0F:  e8 ac 6e 00 00                  call     0x10026dc0  ; UI::Keypress
  1001FF14:  56                              push     esi
  1001FF15:  e8 66 68 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001FF1A:  8b f8                           mov      edi, eax
  1001FF1C:  6a 00                           push     0
  1001FF1E:  57                              push     edi
  1001FF1F:  e8 4c 84 00 00                  call     0x10028370  ; UI::SetFrameVisible, SetFrameVisible
  1001FF24:  83 c4 14                        add      esp, 0x14
  1001FF27:  ff 75 d4                        push     dword ptr [ebp - 0x2c]
  1001FF2A:  57                              push     edi
  1001FF2B:  e8 c0 64 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001FF30:  83 c4 08                        add      esp, 8
  1001FF33:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  1001FF3A:  0f 57 c0                        xorps    xmm0, xmm0
  1001FF3D:  0f 11 45 dc                     movups   xmmword ptr [ebp - 0x24], xmm0
  1001FF41:  85 c0                           test     eax, eax
  1001FF43:  74 19                           je       0x1001ff5e
  1001FF45:  6a 00                           push     0
  1001FF47:  8d 4d dc                        lea      ecx, [ebp - 0x24]
  1001FF4A:  51                              push     ecx
  1001FF4B:  6a 24                           push     0x24
  1001FF4D:  50                              push     eax
  1001FF4E:  e8 cd 7f 00 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  1001FF53:  83 c4 10                        add      esp, 0x10
  1001FF56:  84 c0                           test     al, al
  1001FF58:  74 04                           je       0x1001ff5e
  1001FF5A:  b0 01                           mov      al, 1
  1001FF5C:  eb 02                           jmp      0x1001ff60
  1001FF5E:  32 c0                           xor      al, al
  1001FF60:  88 45 db                        mov      byte ptr [ebp - 0x25], al
  1001FF63:  80 7d cc 00                     cmp      byte ptr [ebp - 0x34], 0
  1001FF67:  c7 45 fc 01 00 00 00            mov      dword ptr [ebp - 4], 1
  1001FF6E:  74 28                           je       0x1001ff98
  1001FF70:  85 f6                           test     esi, esi
  1001FF72:  74 24                           je       0x1001ff98
  1001FF74:  56                              push     esi
  1001FF75:  e8 06 68 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001FF7A:  83 c4 04                        add      esp, 4
  1001FF7D:  85 c0                           test     eax, eax
  1001FF7F:  74 14                           je       0x1001ff95
  1001FF81:  6a 00                           push     0
  1001FF83:  56                              push     esi
  1001FF84:  e8 b7 f3 ff ff                  call     0x1001f340
  1001FF89:  83 c4 04                        add      esp, 4
  1001FF8C:  50                              push     eax
  1001FF8D:  e8 2e 6e 00 00                  call     0x10026dc0  ; UI::Keypress
  1001FF92:  83 c4 08                        add      esp, 8
  1001FF95:  8a 45 db                        mov      al, byte ptr [ebp - 0x25]
  1001FF98:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  1001FF9B:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  1001FFA2:  59                              pop      ecx
  1001FFA3:  5f                              pop      edi
  1001FFA4:  5e                              pop      esi
  1001FFA5:  8b 4d f0                        mov      ecx, dword ptr [ebp - 0x10]
  1001FFA8:  33 cd                           xor      ecx, ebp
  1001FFAA:  e8 08 c4 00 00                  call     0x1002c3b7
  1001FFAF:  8b e5                           mov      esp, ebp
  1001FFB1:  5d                              pop      ebp
  1001FFB2:  c3                              ret      


; === PartyMgr::SetHeroTarget ===
; RVA: 0x0001FFC0  Size: 431 bytes
; Exports: ?SetHeroTarget@PartyMgr@GW@@YA_NII@Z
;
  1001FFC0:  55                              push     ebp
  1001FFC1:  8b ec                           mov      ebp, esp
  1001FFC3:  6a ff                           push     -1
  1001FFC5:  68 3d b1 04 10                  push     0x1004b13d
  1001FFCA:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  1001FFD0:  50                              push     eax
  1001FFD1:  83 ec 2c                        sub      esp, 0x2c
  1001FFD4:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1001FFD9:  33 c5                           xor      eax, ebp
  1001FFDB:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  1001FFDE:  56                              push     esi
  1001FFDF:  57                              push     edi
  1001FFE0:  50                              push     eax
  1001FFE1:  8d 45 f4                        lea      eax, [ebp - 0xc]
  1001FFE4:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  1001FFEA:  e8 b1 90 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  1001FFEF:  8b b0 84 05 00 00               mov      esi, dword ptr [eax + 0x584]
  1001FFF5:  8b 80 8c 05 00 00               mov      eax, dword ptr [eax + 0x58c]
  1001FFFB:  8d 04 c0                        lea      eax, [eax + eax*8]
  1001FFFE:  8d 0c 86                        lea      ecx, [esi + eax*4]
  10020001:  3b f1                           cmp      esi, ecx
  10020003:  74 0f                           je       0x10020014
  10020005:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10020008:  39 46 04                        cmp      dword ptr [esi + 4], eax
  1002000B:  74 24                           je       0x10020031
  1002000D:  83 c6 24                        add      esi, 0x24
  10020010:  3b f1                           cmp      esi, ecx
  10020012:  75 f4                           jne      0x10020008
  10020014:  32 c0                           xor      al, al
  10020016:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  10020019:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  10020020:  59                              pop      ecx
  10020021:  5f                              pop      edi
  10020022:  5e                              pop      esi
  10020023:  8b 4d f0                        mov      ecx, dword ptr [ebp - 0x10]
  10020026:  33 cd                           xor      ecx, ebp
  10020028:  e8 8a c3 00 00                  call     0x1002c3b7
  1002002D:  8b e5                           mov      esp, ebp
  1002002F:  5d                              pop      ebp
  10020030:  c3                              ret      
  10020031:  85 f6                           test     esi, esi
  10020033:  74 df                           je       0x10020014
  10020035:  50                              push     eax
  10020036:  e8 e5 f4 ff ff                  call     0x1001f520
  1002003B:  83 c4 04                        add      esp, 4
  1002003E:  83 f8 06                        cmp      eax, 6
  10020041:  76 04                           jbe      0x10020047
  10020043:  33 ff                           xor      edi, edi
  10020045:  eb 07                           jmp      0x1002004e
  10020047:  8b 3c 85 78 a1 08 10            mov      edi, dword ptr [eax*4 + 0x1008a178]
  1002004E:  c6 45 c8 00                     mov      byte ptr [ebp - 0x38], 0
  10020052:  89 7d cc                        mov      dword ptr [ebp - 0x34], edi
  10020055:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1002005C:  85 ff                           test     edi, edi
  1002005E:  75 04                           jne      0x10020064
  10020060:  33 c0                           xor      eax, eax
  10020062:  eb 38                           jmp      0x1002009c
  10020064:  57                              push     edi
  10020065:  e8 16 67 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1002006A:  83 c4 04                        add      esp, 4
  1002006D:  85 c0                           test     eax, eax
  1002006F:  75 2b                           jne      0x1002009c
  10020071:  50                              push     eax
  10020072:  57                              push     edi
  10020073:  c6 45 c8 01                     mov      byte ptr [ebp - 0x38], 1
  10020077:  e8 c4 f2 ff ff                  call     0x1001f340
  1002007C:  83 c4 04                        add      esp, 4
  1002007F:  50                              push     eax
  10020080:  e8 3b 6d 00 00                  call     0x10026dc0  ; UI::Keypress
  10020085:  57                              push     edi
  10020086:  e8 f5 66 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1002008B:  6a 00                           push     0
  1002008D:  50                              push     eax
  1002008E:  89 45 d4                        mov      dword ptr [ebp - 0x2c], eax
  10020091:  e8 da 82 00 00                  call     0x10028370  ; UI::SetFrameVisible, SetFrameVisible
  10020096:  8b 45 d4                        mov      eax, dword ptr [ebp - 0x2c]
  10020099:  83 c4 14                        add      esp, 0x14
  1002009C:  6a 08                           push     8
  1002009E:  50                              push     eax
  1002009F:  e8 4c 63 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  100200A4:  83 c4 08                        add      esp, 8
  100200A7:  89 45 d4                        mov      dword ptr [ebp - 0x2c], eax
  100200AA:  85 c0                           test     eax, eax
  100200AC:  75 05                           jne      0x100200b3
  100200AE:  88 45 db                        mov      byte ptr [ebp - 0x25], al
  100200B1:  eb 7a                           jmp      0x1002012d
  100200B3:  0f 57 c0                        xorps    xmm0, xmm0
  100200B6:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  100200BD:  0f 11 45 dc                     movups   xmmword ptr [ebp - 0x24], xmm0
  100200C1:  e8 fa 26 fe ff                  call     0x100027c0  ; Agents::GetTargetId, GetTargetId
  100200C6:  8b 55 0c                        mov      edx, dword ptr [ebp + 0xc]
  100200C9:  8b 4e 20                        mov      ecx, dword ptr [esi + 0x20]
  100200CC:  89 45 d0                        mov      dword ptr [ebp - 0x30], eax
  100200CF:  85 d2                           test     edx, edx
  100200D1:  75 27                           jne      0x100200fa
  100200D3:  85 c9                           test     ecx, ecx
  100200D5:  74 1a                           je       0x100200f1
  100200D7:  52                              push     edx
  100200D8:  8d 45 dc                        lea      eax, [ebp - 0x24]
  100200DB:  50                              push     eax
  100200DC:  6a 24                           push     0x24
  100200DE:  ff 75 d4                        push     dword ptr [ebp - 0x2c]
  100200E1:  e8 3a 7e 00 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  100200E6:  83 c4 10                        add      esp, 0x10
  100200E9:  c6 45 db 00                     mov      byte ptr [ebp - 0x25], 0
  100200ED:  84 c0                           test     al, al
  100200EF:  74 04                           je       0x100200f5
  100200F1:  c6 45 db 01                     mov      byte ptr [ebp - 0x25], 1
  100200F5:  8a 45 db                        mov      al, byte ptr [ebp - 0x25]
  100200F8:  eb 33                           jmp      0x1002012d
  100200FA:  3b ca                           cmp      ecx, edx
  100200FC:  75 04                           jne      0x10020102
  100200FE:  b0 01                           mov      al, 1
  10020100:  eb 28                           jmp      0x1002012a
  10020102:  52                              push     edx
  10020103:  e8 48 1d fe ff                  call     0x10001e50  ; Agents::ChangeTarget, ChangeTargetById
  10020108:  6a 00                           push     0
  1002010A:  8d 45 dc                        lea      eax, [ebp - 0x24]
  1002010D:  c7 46 20 00 00 00 00            mov      dword ptr [esi + 0x20], 0
  10020114:  50                              push     eax
  10020115:  6a 24                           push     0x24
  10020117:  ff 75 d4                        push     dword ptr [ebp - 0x2c]
  1002011A:  e8 01 7e 00 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  1002011F:  ff 75 d0                        push     dword ptr [ebp - 0x30]
  10020122:  e8 29 1d fe ff                  call     0x10001e50  ; Agents::ChangeTarget, ChangeTargetById
  10020127:  83 c4 18                        add      esp, 0x18
  1002012A:  88 45 db                        mov      byte ptr [ebp - 0x25], al
  1002012D:  80 7d c8 00                     cmp      byte ptr [ebp - 0x38], 0
  10020131:  c7 45 fc 04 00 00 00            mov      dword ptr [ebp - 4], 4
  10020138:  0f 84 d8 fe ff ff               je       0x10020016
  1002013E:  85 ff                           test     edi, edi
  10020140:  0f 84 d0 fe ff ff               je       0x10020016
  10020146:  57                              push     edi
  10020147:  e8 34 66 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1002014C:  83 c4 04                        add      esp, 4
  1002014F:  85 c0                           test     eax, eax
  10020151:  74 14                           je       0x10020167
  10020153:  6a 00                           push     0
  10020155:  57                              push     edi
  10020156:  e8 e5 f1 ff ff                  call     0x1001f340
  1002015B:  83 c4 04                        add      esp, 4
  1002015E:  50                              push     eax
  1002015F:  e8 5c 6c 00 00                  call     0x10026dc0  ; UI::Keypress
  10020164:  83 c4 08                        add      esp, 8
  10020167:  8a 45 db                        mov      al, byte ptr [ebp - 0x25]
  1002016A:  e9 a7 fe ff ff                  jmp      0x10020016


; === PartyMgr::SetPetBehavior ===
; RVA: 0x00020170  Size: 390 bytes
; Exports: ?SetPetBehavior@PartyMgr@GW@@YA_NIW4HeroBehavior@2@@Z
;
  10020170:  55                              push     ebp
  10020171:  8b ec                           mov      ebp, esp
  10020173:  6a ff                           push     -1
  10020175:  68 fd b0 04 10                  push     0x1004b0fd
  1002017A:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  10020180:  50                              push     eax
  10020181:  83 ec 28                        sub      esp, 0x28
  10020184:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  10020189:  33 c5                           xor      eax, ebp
  1002018B:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  1002018E:  56                              push     esi
  1002018F:  57                              push     edi
  10020190:  50                              push     eax
  10020191:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10020194:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  1002019A:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  1002019D:  89 45 d4                        mov      dword ptr [ebp - 0x2c], eax
  100201A0:  e8 fb 8e ff ff                  call     0x100190a0  ; GW::GetWorldContext
  100201A5:  8b f0                           mov      esi, eax
  100201A7:  85 f6                           test     esi, esi
  100201A9:  74 49                           je       0x100201f4
  100201AB:  83 be b4 06 00 00 00            cmp      dword ptr [esi + 0x6b4], 0
  100201B2:  74 40                           je       0x100201f4
  100201B4:  e8 97 8e ff ff                  call     0x10019050  ; GW::GetPartyContext
  100201B9:  85 c0                           test     eax, eax
  100201BB:  74 37                           je       0x100201f4
  100201BD:  83 78 48 00                     cmp      dword ptr [eax + 0x48], 0
  100201C1:  74 31                           je       0x100201f4
  100201C3:  83 78 54 00                     cmp      dword ptr [eax + 0x54], 0
  100201C7:  74 2b                           je       0x100201f4
  100201C9:  8b 86 b4 06 00 00               mov      eax, dword ptr [esi + 0x6b4]
  100201CF:  8b 96 ac 06 00 00               mov      edx, dword ptr [esi + 0x6ac]
  100201D5:  8d 0c c5 00 00 00 00            lea      ecx, [eax*8]
  100201DC:  2b c8                           sub      ecx, eax
  100201DE:  8d 04 8a                        lea      eax, [edx + ecx*4]
  100201E1:  3b d0                           cmp      edx, eax
  100201E3:  74 0f                           je       0x100201f4
  100201E5:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  100201E8:  39 72 04                        cmp      dword ptr [edx + 4], esi
  100201EB:  74 1f                           je       0x1002020c
  100201ED:  83 c2 1c                        add      edx, 0x1c
  100201F0:  3b d0                           cmp      edx, eax
  100201F2:  75 f4                           jne      0x100201e8
  100201F4:  33 f6                           xor      esi, esi
  100201F6:  c6 45 cc 00                     mov      byte ptr [ebp - 0x34], 0
  100201FA:  89 75 d0                        mov      dword ptr [ebp - 0x30], esi
  100201FD:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10020204:  85 f6                           test     esi, esi
  10020206:  75 2c                           jne      0x10020234
  10020208:  33 ff                           xor      edi, edi
  1002020A:  eb 5e                           jmp      0x1002026a
  1002020C:  e8 bf 20 fe ff                  call     0x100022d0  ; Agents::GetControlledCharacterId, GetControlledCharacterId
  10020211:  3b c6                           cmp      eax, esi
  10020213:  75 08                           jne      0x1002021d
  10020215:  8b 35 d0 a1 08 10               mov      esi, dword ptr [0x1008a1d0]
  1002021B:  eb d9                           jmp      0x100201f6
  1002021D:  56                              push     esi
  1002021E:  e8 fd f2 ff ff                  call     0x1001f520
  10020223:  83 c4 04                        add      esp, 4
  10020226:  83 f8 06                        cmp      eax, 6
  10020229:  77 c9                           ja       0x100201f4
  1002022B:  8b 34 85 d4 a1 08 10            mov      esi, dword ptr [eax*4 + 0x1008a1d4]
  10020232:  eb c2                           jmp      0x100201f6
  10020234:  56                              push     esi
  10020235:  e8 46 65 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1002023A:  8b f8                           mov      edi, eax
  1002023C:  83 c4 04                        add      esp, 4
  1002023F:  85 ff                           test     edi, edi
  10020241:  75 27                           jne      0x1002026a
  10020243:  50                              push     eax
  10020244:  56                              push     esi
  10020245:  c6 45 cc 01                     mov      byte ptr [ebp - 0x34], 1
  10020249:  e8 f2 f0 ff ff                  call     0x1001f340
  1002024E:  83 c4 04                        add      esp, 4
  10020251:  50                              push     eax
  10020252:  e8 69 6b 00 00                  call     0x10026dc0  ; UI::Keypress
  10020257:  56                              push     esi
  10020258:  e8 23 65 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1002025D:  8b f8                           mov      edi, eax
  1002025F:  6a 00                           push     0
  10020261:  57                              push     edi
  10020262:  e8 09 81 00 00                  call     0x10028370  ; UI::SetFrameVisible, SetFrameVisible
  10020267:  83 c4 14                        add      esp, 0x14
  1002026A:  ff 75 d4                        push     dword ptr [ebp - 0x2c]
  1002026D:  57                              push     edi
  1002026E:  e8 7d 61 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  10020273:  83 c4 08                        add      esp, 8
  10020276:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  1002027D:  0f 57 c0                        xorps    xmm0, xmm0
  10020280:  0f 11 45 dc                     movups   xmmword ptr [ebp - 0x24], xmm0
  10020284:  85 c0                           test     eax, eax
  10020286:  74 19                           je       0x100202a1
  10020288:  6a 00                           push     0
  1002028A:  8d 4d dc                        lea      ecx, [ebp - 0x24]
  1002028D:  51                              push     ecx
  1002028E:  6a 24                           push     0x24
  10020290:  50                              push     eax
  10020291:  e8 8a 7c 00 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10020296:  83 c4 10                        add      esp, 0x10
  10020299:  84 c0                           test     al, al
  1002029B:  74 04                           je       0x100202a1
  1002029D:  b0 01                           mov      al, 1
  1002029F:  eb 02                           jmp      0x100202a3
  100202A1:  32 c0                           xor      al, al
  100202A3:  88 45 db                        mov      byte ptr [ebp - 0x25], al
  100202A6:  80 7d cc 00                     cmp      byte ptr [ebp - 0x34], 0
  100202AA:  c7 45 fc 01 00 00 00            mov      dword ptr [ebp - 4], 1
  100202B1:  74 28                           je       0x100202db
  100202B3:  85 f6                           test     esi, esi
  100202B5:  74 24                           je       0x100202db
  100202B7:  56                              push     esi
  100202B8:  e8 c3 64 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  100202BD:  83 c4 04                        add      esp, 4
  100202C0:  85 c0                           test     eax, eax
  100202C2:  74 14                           je       0x100202d8
  100202C4:  6a 00                           push     0
  100202C6:  56                              push     esi
  100202C7:  e8 74 f0 ff ff                  call     0x1001f340
  100202CC:  83 c4 04                        add      esp, 4
  100202CF:  50                              push     eax
  100202D0:  e8 eb 6a 00 00                  call     0x10026dc0  ; UI::Keypress
  100202D5:  83 c4 08                        add      esp, 8
  100202D8:  8a 45 db                        mov      al, byte ptr [ebp - 0x25]
  100202DB:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  100202DE:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  100202E5:  59                              pop      ecx
  100202E6:  5f                              pop      edi
  100202E7:  5e                              pop      esi
  100202E8:  8b 4d f0                        mov      ecx, dword ptr [ebp - 0x10]
  100202EB:  33 cd                           xor      ecx, ebp
  100202ED:  e8 c5 c0 00 00                  call     0x1002c3b7
  100202F2:  8b e5                           mov      esp, ebp
  100202F4:  5d                              pop      ebp
  100202F5:  c3                              ret      


; === PartyMgr::SetTickToggle ===
; RVA: 0x00020300  Size: 13 bytes
; Exports: ?SetTickToggle@PartyMgr@GW@@YAX_N@Z
;
  10020300:  55                              push     ebp
  10020301:  8b ec                           mov      ebp, esp
  10020303:  8a 45 08                        mov      al, byte ptr [ebp + 8]
  10020306:  a2 e8 c3 08 10                  mov      byte ptr [0x1008c3e8], al
  1002030B:  5d                              pop      ebp
  1002030C:  c3                              ret      


; === PartyMgr::Tick ===
; RVA: 0x00020310  Size: 272 bytes
; Exports: ?Tick@PartyMgr@GW@@YA_N_N@Z
;
  10020310:  55                              push     ebp
  10020311:  8b ec                           mov      ebp, esp
  10020313:  83 ec 14                        sub      esp, 0x14
  10020316:  e8 35 8d ff ff                  call     0x10019050  ; GW::GetPartyContext
  1002031B:  85 c0                           test     eax, eax
  1002031D:  0f 84 f7 00 00 00               je       0x1002041a
  10020323:  83 78 48 00                     cmp      dword ptr [eax + 0x48], 0
  10020327:  0f 84 ed 00 00 00               je       0x1002041a
  1002032D:  83 78 54 00                     cmp      dword ptr [eax + 0x54], 0
  10020331:  0f 84 e3 00 00 00               je       0x1002041a
  10020337:  e8 24 d1 ff ff                  call     0x1001d460  ; Map::GetInstanceType, GetInstanceType
  1002033C:  85 c0                           test     eax, eax
  1002033E:  0f 85 d6 00 00 00               jne      0x1002041a
  10020344:  56                              push     esi
  10020345:  e8 06 8d ff ff                  call     0x10019050  ; GW::GetPartyContext
  1002034A:  85 c0                           test     eax, eax
  1002034C:  74 33                           je       0x10020381
  1002034E:  83 78 48 00                     cmp      dword ptr [eax + 0x48], 0
  10020352:  74 2d                           je       0x10020381
  10020354:  8b 70 54                        mov      esi, dword ptr [eax + 0x54]
  10020357:  85 f6                           test     esi, esi
  10020359:  74 26                           je       0x10020381
  1002035B:  83 7e 04 00                     cmp      dword ptr [esi + 4], 0
  1002035F:  74 20                           je       0x10020381
  10020361:  e8 3a 05 00 00                  call     0x100208a0  ; PlayerMgr::GetPlayerNumber, GetPlayerNumber
  10020366:  8b 56 0c                        mov      edx, dword ptr [esi + 0xc]
  10020369:  8b 4e 04                        mov      ecx, dword ptr [esi + 4]
  1002036C:  8d 14 52                        lea      edx, [edx + edx*2]
  1002036F:  8d 14 91                        lea      edx, [ecx + edx*4]
  10020372:  3b ca                           cmp      ecx, edx
  10020374:  74 0b                           je       0x10020381
  10020376:  39 01                           cmp      dword ptr [ecx], eax
  10020378:  74 19                           je       0x10020393
  1002037A:  83 c1 0c                        add      ecx, 0xc
  1002037D:  3b ca                           cmp      ecx, edx
  1002037F:  75 f5                           jne      0x10020376
  10020381:  32 c0                           xor      al, al
  10020383:  53                              push     ebx
  10020384:  8a 5d 08                        mov      bl, byte ptr [ebp + 8]
  10020387:  3a d8                           cmp      bl, al
  10020389:  75 11                           jne      0x1002039c
  1002038B:  5b                              pop      ebx
  1002038C:  b0 01                           mov      al, 1
  1002038E:  5e                              pop      esi
  1002038F:  8b e5                           mov      esp, ebp
  10020391:  5d                              pop      ebp
  10020392:  c3                              ret      
  10020393:  f6 41 08 02                     test     byte ptr [ecx + 8], 2
  10020397:  0f 97 c0                        seta     al
  1002039A:  eb e7                           jmp      0x10020383
  1002039C:  e8 ff 04 00 00                  call     0x100208a0  ; PlayerMgr::GetPlayerNumber, GetPlayerNumber
  100203A1:  68 54 34 05 10                  push     0x10053454
  100203A6:  8b f0                           mov      esi, eax
  100203A8:  e8 d3 63 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  100203AD:  6a 01                           push     1
  100203AF:  50                              push     eax
  100203B0:  e8 3b 60 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  100203B5:  6a 07                           push     7
  100203B7:  50                              push     eax
  100203B8:  e8 33 60 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  100203BD:  6a 00                           push     0
  100203BF:  50                              push     eax
  100203C0:  e8 2b 60 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  100203C5:  6a 00                           push     0
  100203C7:  50                              push     eax
  100203C8:  e8 23 60 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  100203CD:  6a 00                           push     0
  100203CF:  50                              push     eax
  100203D0:  e8 1b 60 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  100203D5:  6a 00                           push     0
  100203D7:  50                              push     eax
  100203D8:  e8 13 60 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  100203DD:  56                              push     esi
  100203DE:  50                              push     eax
  100203DF:  e8 0c 60 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  100203E4:  0f b6 cb                        movzx    ecx, bl
  100203E7:  83 f1 01                        xor      ecx, 1
  100203EA:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  100203F1:  41                              inc      ecx
  100203F2:  c7 45 f0 02 00 00 00            mov      dword ptr [ebp - 0x10], 2
  100203F9:  89 4d f8                        mov      dword ptr [ebp - 8], ecx
  100203FC:  8d 4d ec                        lea      ecx, [ebp - 0x14]
  100203FF:  6a 00                           push     0
  10020401:  51                              push     ecx
  10020402:  6a 31                           push     0x31
  10020404:  50                              push     eax
  10020405:  c7 45 f4 08 00 00 00            mov      dword ptr [ebp - 0xc], 8
  1002040C:  e8 0f 7b 00 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10020411:  83 c4 4c                        add      esp, 0x4c
  10020414:  5b                              pop      ebx
  10020415:  5e                              pop      esi
  10020416:  8b e5                           mov      esp, ebp
  10020418:  5d                              pop      ebp
  10020419:  c3                              ret      
  1002041A:  32 c0                           xor      al, al
  1002041C:  8b e5                           mov      esp, ebp
  1002041E:  5d                              pop      ebp
  1002041F:  c3                              ret      


; === PartyMgr::UnflagAll ===
; RVA: 0x00020420  Size: 156 bytes
; Exports: ?UnflagAll@PartyMgr@GW@@YA_NXZ
;
  10020420:  55                              push     ebp
  10020421:  8b ec                           mov      ebp, esp
  10020423:  83 ec 0c                        sub      esp, 0xc
  10020426:  53                              push     ebx
  10020427:  56                              push     esi
  10020428:  57                              push     edi
  10020429:  be 01 00 00 00                  mov      esi, 1
  1002042E:  c7 45 f4 00 00 80 7f            mov      dword ptr [ebp - 0xc], 0x7f800000
  10020435:  c7 45 f8 00 00 80 7f            mov      dword ptr [ebp - 8], 0x7f800000
  1002043C:  33 ff                           xor      edi, edi
  1002043E:  66 90                           nop      
  10020440:  f3 0f 7e 45 f4                  movq     xmm0, qword ptr [ebp - 0xc]
  10020445:  83 ec 0c                        sub      esp, 0xc
  10020448:  8b c4                           mov      eax, esp
  1002044A:  56                              push     esi
  1002044B:  66 0f d6 00                     movq     qword ptr [eax], xmm0
  1002044F:  89 78 08                        mov      dword ptr [eax + 8], edi
  10020452:  e8 89 ee ff ff                  call     0x1001f2e0  ; PartyMgr::FlagHero
  10020457:  46                              inc      esi
  10020458:  83 c4 10                        add      esp, 0x10
  1002045B:  83 fe 08                        cmp      esi, 8
  1002045E:  72 e0                           jb       0x10020440
  10020460:  c7 45 f4 00 00 80 7f            mov      dword ptr [ebp - 0xc], 0x7f800000
  10020467:  c7 45 f8 00 00 80 7f            mov      dword ptr [ebp - 8], 0x7f800000
  1002046E:  89 7d fc                        mov      dword ptr [ebp - 4], edi
  10020471:  e8 2a 8c ff ff                  call     0x100190a0  ; GW::GetWorldContext
  10020476:  68 8c 34 05 10                  push     0x1005348c
  1002047B:  e8 00 63 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  10020480:  8b d8                           mov      ebx, eax
  10020482:  53                              push     ebx
  10020483:  e8 58 63 00 00                  call     0x100267e0  ; UI::GetFrameContext
  10020488:  8b f8                           mov      edi, eax
  1002048A:  83 c4 08                        add      esp, 8
  1002048D:  85 ff                           test     edi, edi
  1002048F:  75 09                           jne      0x1002049a
  10020491:  32 c0                           xor      al, al
  10020493:  5f                              pop      edi
  10020494:  5e                              pop      esi
  10020495:  5b                              pop      ebx
  10020496:  8b e5                           mov      esp, ebp
  10020498:  5d                              pop      ebp
  10020499:  c3                              ret      
  1002049A:  8b 37                           mov      esi, dword ptr [edi]
  1002049C:  8d 45 f4                        lea      eax, [ebp - 0xc]
  1002049F:  6a 00                           push     0
  100204A1:  50                              push     eax
  100204A2:  6a 57                           push     0x57
  100204A4:  53                              push     ebx
  100204A5:  c7 07 00 00 00 00               mov      dword ptr [edi], 0
  100204AB:  e8 70 7a 00 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  100204B0:  83 c4 10                        add      esp, 0x10
  100204B3:  89 37                           mov      dword ptr [edi], esi
  100204B5:  5f                              pop      edi
  100204B6:  5e                              pop      esi
  100204B7:  5b                              pop      ebx
  100204B8:  8b e5                           mov      esp, ebp
  100204BA:  5d                              pop      ebp
  100204BB:  c3                              ret      


; === PartyMgr::UnflagHero ===
; RVA: 0x000204C0  Size: 43 bytes
; Exports: ?UnflagHero@PartyMgr@GW@@YA_NI@Z
;
  100204C0:  55                              push     ebp
  100204C1:  8b ec                           mov      ebp, esp
  100204C3:  f3 0f 10 05 f8 34 05 10         movss    xmm0, dword ptr [0x100534f8]
  100204CB:  83 ec 0c                        sub      esp, 0xc
  100204CE:  8b c4                           mov      eax, esp
  100204D0:  0f 14 c0                        unpcklps xmm0, xmm0
  100204D3:  ff 75 08                        push     dword ptr [ebp + 8]
  100204D6:  66 0f d6 00                     movq     qword ptr [eax], xmm0
  100204DA:  c7 40 08 00 00 00 00            mov      dword ptr [eax + 8], 0
  100204E1:  e8 fa ed ff ff                  call     0x1001f2e0  ; PartyMgr::FlagHero
  100204E6:  83 c4 10                        add      esp, 0x10
  100204E9:  5d                              pop      ebp
  100204EA:  c3                              ret      


