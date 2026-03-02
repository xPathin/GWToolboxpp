; Module: MapMgr
; Functions: 27
; Total code size: 1628 bytes
;

; === Map::CancelEnterChallenge, CancelEnterChallenge ===
; RVA: 0x0001D2F0  Size: 44 bytes
; Exports: ?CancelEnterChallenge@Map@GW@@YA_NXZ, CancelEnterChallenge
;
  1001D2F0:  68 6c 2f 05 10                  push     0x10052f6c
  1001D2F5:  e8 86 94 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001D2FA:  6a 00                           push     0
  1001D2FC:  50                              push     eax
  1001D2FD:  e8 ee 90 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001D302:  6a 01                           push     1
  1001D304:  50                              push     eax
  1001D305:  e8 e6 90 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001D30A:  6a 01                           push     1
  1001D30C:  50                              push     eax
  1001D30D:  e8 de 90 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001D312:  50                              push     eax
  1001D313:  e8 18 8d 00 00                  call     0x10026030  ; UI::ButtonClick, ButtonClick
  1001D318:  83 c4 20                        add      esp, 0x20
  1001D31B:  c3                              ret      


; === Map::CreateMapContext ===
; RVA: 0x0001D320  Size: 105 bytes
; Exports: ?CreateMapContext@Map@GW@@YAPAUMapContext@2@I@Z
;
  1001D320:  55                              push     ebp
  1001D321:  8b ec                           mov      ebp, esp
  1001D323:  83 ec 2c                        sub      esp, 0x2c
  1001D326:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1001D32B:  33 c5                           xor      eax, ebp
  1001D32D:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001D330:  83 3d 30 c3 08 10 00            cmp      dword ptr [0x1008c330], 0
  1001D337:  74 40                           je       0x1001d379
  1001D339:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001D33C:  85 c0                           test     eax, eax
  1001D33E:  74 39                           je       0x1001d379
  1001D340:  6a 04                           push     4
  1001D342:  8d 4d f4                        lea      ecx, [ebp - 0xc]
  1001D345:  51                              push     ecx
  1001D346:  50                              push     eax
  1001D347:  e8 a4 b9 00 00                  call     0x10028cf0  ; UI::UInt32ToEncStr
  1001D34C:  83 c4 0c                        add      esp, 0xc
  1001D34F:  84 c0                           test     al, al
  1001D351:  74 26                           je       0x1001d379
  1001D353:  a1 30 c3 08 10                  mov      eax, dword ptr [0x1008c330]
  1001D358:  8d 4d d4                        lea      ecx, [ebp - 0x2c]
  1001D35B:  51                              push     ecx
  1001D35C:  6a 00                           push     0
  1001D35E:  6a 00                           push     0
  1001D360:  8d 4d f4                        lea      ecx, [ebp - 0xc]
  1001D363:  6a 00                           push     0
  1001D365:  51                              push     ecx
  1001D366:  ff d0                           call     eax
  1001D368:  83 c4 14                        add      esp, 0x14
  1001D36B:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001D36E:  33 cd                           xor      ecx, ebp
  1001D370:  e8 42 f0 00 00                  call     0x1002c3b7
  1001D375:  8b e5                           mov      esp, ebp
  1001D377:  5d                              pop      ebp
  1001D378:  c3                              ret      
  1001D379:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001D37C:  33 c0                           xor      eax, eax
  1001D37E:  33 cd                           xor      ecx, ebp
  1001D380:  e8 32 f0 00 00                  call     0x1002c3b7
  1001D385:  8b e5                           mov      esp, ebp
  1001D387:  5d                              pop      ebp
  1001D388:  c3                              ret      


; === Map::DestroyMapContext, DestroyMapContext ===
; RVA: 0x0001D390  Size: 28 bytes
; Exports: ?DestroyMapContext@Map@GW@@YA_NPAUMapContext@2@@Z, DestroyMapContext
;
  1001D390:  55                              push     ebp
  1001D391:  8b ec                           mov      ebp, esp
  1001D393:  a1 34 c3 08 10                  mov      eax, dword ptr [0x1008c334]
  1001D398:  85 c0                           test     eax, eax
  1001D39A:  74 0c                           je       0x1001d3a8
  1001D39C:  ff 75 08                        push     dword ptr [ebp + 8]
  1001D39F:  ff d0                           call     eax
  1001D3A1:  83 c4 04                        add      esp, 4
  1001D3A4:  b0 01                           mov      al, 1
  1001D3A6:  5d                              pop      ebp
  1001D3A7:  c3                              ret      
  1001D3A8:  32 c0                           xor      al, al
  1001D3AA:  5d                              pop      ebp
  1001D3AB:  c3                              ret      


; === Map::EnterChallenge, EnterChallenge ===
; RVA: 0x0001D3B0  Size: 36 bytes
; Exports: ?EnterChallenge@Map@GW@@YA_NXZ, EnterChallenge
;
  1001D3B0:  68 50 2f 05 10                  push     0x10052f50
  1001D3B5:  e8 c6 93 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001D3BA:  6a 00                           push     0
  1001D3BC:  50                              push     eax
  1001D3BD:  e8 2e 90 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001D3C2:  6a 00                           push     0
  1001D3C4:  50                              push     eax
  1001D3C5:  e8 26 90 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001D3CA:  50                              push     eax
  1001D3CB:  e8 60 8c 00 00                  call     0x10026030  ; UI::ButtonClick, ButtonClick
  1001D3D0:  83 c4 18                        add      esp, 0x18
  1001D3D3:  c3                              ret      


; === Map::GetDistrict, GetDistrict ===
; RVA: 0x0001D3E0  Size: 19 bytes
; Exports: ?GetDistrict@Map@GW@@YAHXZ, GetDistrict
;
  1001D3E0:  e8 cb bb ff ff                  call     0x10018fb0  ; GW::GetCharContext
  1001D3E5:  85 c0                           test     eax, eax
  1001D3E7:  74 07                           je       0x1001d3f0
  1001D3E9:  8b 80 20 02 00 00               mov      eax, dword ptr [eax + 0x220]
  1001D3EF:  c3                              ret      
  1001D3F0:  33 c0                           xor      eax, eax
  1001D3F2:  c3                              ret      


; === Map::GetFoesKilled, GetFoesKilled ===
; RVA: 0x0001D400  Size: 19 bytes
; Exports: ?GetFoesKilled@Map@GW@@YAIXZ, GetFoesKilled
;
  1001D400:  e8 9b bc ff ff                  call     0x100190a0  ; GW::GetWorldContext
  1001D405:  85 c0                           test     eax, eax
  1001D407:  74 07                           je       0x1001d410
  1001D409:  8b 80 4c 08 00 00               mov      eax, dword ptr [eax + 0x84c]
  1001D40F:  c3                              ret      
  1001D410:  33 c0                           xor      eax, eax
  1001D412:  c3                              ret      


; === Map::GetFoesToKill, GetFoesToKill ===
; RVA: 0x0001D420  Size: 19 bytes
; Exports: ?GetFoesToKill@Map@GW@@YAIXZ, GetFoesToKill
;
  1001D420:  e8 7b bc ff ff                  call     0x100190a0  ; GW::GetWorldContext
  1001D425:  85 c0                           test     eax, eax
  1001D427:  74 07                           je       0x1001d430
  1001D429:  8b 80 50 08 00 00               mov      eax, dword ptr [eax + 0x850]
  1001D42F:  c3                              ret      
  1001D430:  33 c0                           xor      eax, eax
  1001D432:  c3                              ret      


; === Map::GetInstanceTime, GetInstanceTime ===
; RVA: 0x0001D440  Size: 19 bytes
; Exports: ?GetInstanceTime@Map@GW@@YAIXZ, GetInstanceTime
;
  1001D440:  e8 3b bb ff ff                  call     0x10018f80  ; GW::GetAgentContext
  1001D445:  85 c0                           test     eax, eax
  1001D447:  74 07                           je       0x1001d450
  1001D449:  8b 80 ac 01 00 00               mov      eax, dword ptr [eax + 0x1ac]
  1001D44F:  c3                              ret      
  1001D450:  33 c0                           xor      eax, eax
  1001D452:  c3                              ret      


; === Map::GetInstanceType, GetInstanceType ===
; RVA: 0x0001D460  Size: 73 bytes
; Exports: ?GetInstanceType@Map@GW@@YA?AW4InstanceType@Constants@2@XZ, GetInstanceType
;
  1001D460:  56                              push     esi
  1001D461:  57                              push     edi
  1001D462:  e8 49 bb ff ff                  call     0x10018fb0  ; GW::GetCharContext
  1001D467:  8b f8                           mov      edi, eax
  1001D469:  e8 c2 bb ff ff                  call     0x10019030  ; GW::GetMapContext
  1001D46E:  8b f0                           mov      esi, eax
  1001D470:  85 f6                           test     esi, esi
  1001D472:  74 2d                           je       0x1001d4a1
  1001D474:  83 be 84 00 00 00 00            cmp      dword ptr [esi + 0x84], 0
  1001D47B:  74 24                           je       0x1001d4a1
  1001D47D:  e8 2e bb ff ff                  call     0x10018fb0  ; GW::GetCharContext
  1001D482:  85 c0                           test     eax, eax
  1001D484:  74 08                           je       0x1001d48e
  1001D486:  8b 80 2c 02 00 00               mov      eax, dword ptr [eax + 0x22c]
  1001D48C:  eb 02                           jmp      0x1001d490
  1001D48E:  33 c0                           xor      eax, eax
  1001D490:  39 86 8c 00 00 00               cmp      dword ptr [esi + 0x8c], eax
  1001D496:  75 09                           jne      0x1001d4a1
  1001D498:  8b 87 34 02 00 00               mov      eax, dword ptr [edi + 0x234]
  1001D49E:  5f                              pop      edi
  1001D49F:  5e                              pop      esi
  1001D4A0:  c3                              ret      
  1001D4A1:  5f                              pop      edi
  1001D4A2:  b8 02 00 00 00                  mov      eax, 2
  1001D4A7:  5e                              pop      esi
  1001D4A8:  c3                              ret      


; === Map::GetIsInCinematic ===
; RVA: 0x0001D4B0  Size: 28 bytes
; Exports: ?GetIsInCinematic@Map@GW@@YA_NXZ
;
  1001D4B0:  e8 1b bb ff ff                  call     0x10018fd0  ; GW::GetGameContext
  1001D4B5:  85 c0                           test     eax, eax
  1001D4B7:  74 10                           je       0x1001d4c9
  1001D4B9:  8b 48 30                        mov      ecx, dword ptr [eax + 0x30]
  1001D4BC:  85 c9                           test     ecx, ecx
  1001D4BE:  74 09                           je       0x1001d4c9
  1001D4C0:  33 c0                           xor      eax, eax
  1001D4C2:  39 41 04                        cmp      dword ptr [ecx + 4], eax
  1001D4C5:  0f 95 c0                        setne    al
  1001D4C8:  c3                              ret      
  1001D4C9:  32 c0                           xor      al, al
  1001D4CB:  c3                              ret      


; === Map::GetIsMapLoaded, GetIsMapLoaded ===
; RVA: 0x0001D4D0  Size: 56 bytes
; Exports: ?GetIsMapLoaded@Map@GW@@YA_NXZ, GetIsMapLoaded
;
  1001D4D0:  56                              push     esi
  1001D4D1:  e8 5a bb ff ff                  call     0x10019030  ; GW::GetMapContext
  1001D4D6:  8b f0                           mov      esi, eax
  1001D4D8:  85 f6                           test     esi, esi
  1001D4DA:  74 28                           je       0x1001d504
  1001D4DC:  83 be 84 00 00 00 00            cmp      dword ptr [esi + 0x84], 0
  1001D4E3:  74 1f                           je       0x1001d504
  1001D4E5:  e8 c6 ba ff ff                  call     0x10018fb0  ; GW::GetCharContext
  1001D4EA:  85 c0                           test     eax, eax
  1001D4EC:  74 08                           je       0x1001d4f6
  1001D4EE:  8b 80 2c 02 00 00               mov      eax, dword ptr [eax + 0x22c]
  1001D4F4:  eb 02                           jmp      0x1001d4f8
  1001D4F6:  33 c0                           xor      eax, eax
  1001D4F8:  39 86 8c 00 00 00               cmp      dword ptr [esi + 0x8c], eax
  1001D4FE:  75 04                           jne      0x1001d504
  1001D500:  b0 01                           mov      al, 1
  1001D502:  5e                              pop      esi
  1001D503:  c3                              ret      
  1001D504:  32 c0                           xor      al, al
  1001D506:  5e                              pop      esi
  1001D507:  c3                              ret      


; === Map::GetIsMapUnlocked ===
; RVA: 0x0001D510  Size: 66 bytes
; Exports: ?GetIsMapUnlocked@Map@GW@@YA_NW4MapID@Constants@2@@Z
;
  1001D510:  55                              push     ebp
  1001D511:  8b ec                           mov      ebp, esp
  1001D513:  56                              push     esi
  1001D514:  e8 87 bb ff ff                  call     0x100190a0  ; GW::GetWorldContext
  1001D519:  85 c0                           test     eax, eax
  1001D51B:  74 30                           je       0x1001d54d
  1001D51D:  05 0c 06 00 00                  add      eax, 0x60c
  1001D522:  83 38 00                        cmp      dword ptr [eax], 0
  1001D525:  74 26                           je       0x1001d54d
  1001D527:  85 c0                           test     eax, eax
  1001D529:  74 22                           je       0x1001d54d
  1001D52B:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001D52E:  8b f1                           mov      esi, ecx
  1001D530:  c1 ee 05                        shr      esi, 5
  1001D533:  3b 70 08                        cmp      esi, dword ptr [eax + 8]
  1001D536:  73 15                           jae      0x1001d54d
  1001D538:  8b 00                           mov      eax, dword ptr [eax]
  1001D53A:  83 e1 1f                        and      ecx, 0x1f
  1001D53D:  ba 01 00 00 00                  mov      edx, 1
  1001D542:  d3 e2                           shl      edx, cl
  1001D544:  85 14 b0                        test     dword ptr [eax + esi*4], edx
  1001D547:  5e                              pop      esi
  1001D548:  0f 95 c0                        setne    al
  1001D54B:  5d                              pop      ebp
  1001D54C:  c3                              ret      
  1001D54D:  32 c0                           xor      al, al
  1001D54F:  5e                              pop      esi
  1001D550:  5d                              pop      ebp
  1001D551:  c3                              ret      


; === Map::GetIsObserving ===
; RVA: 0x0001D560  Size: 51 bytes
; Exports: ?GetIsObserving@Map@GW@@YA_NXZ
;
  1001D560:  e8 4b ba ff ff                  call     0x10018fb0  ; GW::GetCharContext
  1001D565:  8b d0                           mov      edx, eax
  1001D567:  85 d2                           test     edx, edx
  1001D569:  74 12                           je       0x1001d57d
  1001D56B:  8b 8a 2c 02 00 00               mov      ecx, dword ptr [edx + 0x22c]
  1001D571:  33 c0                           xor      eax, eax
  1001D573:  3b 8a 28 02 00 00               cmp      ecx, dword ptr [edx + 0x228]
  1001D579:  0f 95 c0                        setne    al
  1001D57C:  c3                              ret      
  1001D57D:  32 c0                           xor      al, al
  1001D57F:  c3                              ret      
  1001D580:  e8 2b ba ff ff                  call     0x10018fb0  ; GW::GetCharContext
  1001D585:  85 c0                           test     eax, eax
  1001D587:  74 07                           je       0x1001d590
  1001D589:  8b 80 24 02 00 00               mov      eax, dword ptr [eax + 0x224]
  1001D58F:  c3                              ret      
  1001D590:  33 c0                           xor      eax, eax
  1001D592:  c3                              ret      


; === Map::GetLanguage, GetLanguage ===
; RVA: 0x0001D580  Size: 19 bytes
; Exports: ?GetLanguage@Map@GW@@YA?AW4Language@Constants@2@XZ, GetLanguage
;
  1001D580:  e8 2b ba ff ff                  call     0x10018fb0  ; GW::GetCharContext
  1001D585:  85 c0                           test     eax, eax
  1001D587:  74 07                           je       0x1001d590
  1001D589:  8b 80 24 02 00 00               mov      eax, dword ptr [eax + 0x224]
  1001D58F:  c3                              ret      
  1001D590:  33 c0                           xor      eax, eax
  1001D592:  c3                              ret      


; === Map::GetMapID, GetMapID ===
; RVA: 0x0001D5A0  Size: 19 bytes
; Exports: ?GetMapID@Map@GW@@YA?AW4MapID@Constants@2@XZ, GetMapID
;
  1001D5A0:  e8 0b ba ff ff                  call     0x10018fb0  ; GW::GetCharContext
  1001D5A5:  85 c0                           test     eax, eax
  1001D5A7:  74 07                           je       0x1001d5b0
  1001D5A9:  8b 80 2c 02 00 00               mov      eax, dword ptr [eax + 0x22c]
  1001D5AF:  c3                              ret      
  1001D5B0:  33 c0                           xor      eax, eax
  1001D5B2:  c3                              ret      


; === Map::GetMapInfo, GetMapInfo ===
; RVA: 0x0001D5C0  Size: 59 bytes
; Exports: ?GetMapInfo@Map@GW@@YAPAUAreaInfo@2@W4MapID@Constants@2@@Z, GetMapInfo
;
  1001D5C0:  55                              push     ebp
  1001D5C1:  8b ec                           mov      ebp, esp
  1001D5C3:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001D5C6:  85 c9                           test     ecx, ecx
  1001D5C8:  75 13                           jne      0x1001d5dd
  1001D5CA:  e8 e1 b9 ff ff                  call     0x10018fb0  ; GW::GetCharContext
  1001D5CF:  85 c0                           test     eax, eax
  1001D5D1:  74 08                           je       0x1001d5db
  1001D5D3:  8b 88 2c 02 00 00               mov      ecx, dword ptr [eax + 0x22c]
  1001D5D9:  eb 02                           jmp      0x1001d5dd
  1001D5DB:  33 c9                           xor      ecx, ecx
  1001D5DD:  8b 15 2c c3 08 10               mov      edx, dword ptr [0x1008c32c]
  1001D5E3:  85 d2                           test     edx, edx
  1001D5E5:  74 10                           je       0x1001d5f7
  1001D5E7:  8d 41 ff                        lea      eax, [ecx - 1]
  1001D5EA:  3d 71 03 00 00                  cmp      eax, 0x371
  1001D5EF:  77 06                           ja       0x1001d5f7
  1001D5F1:  89 4d 08                        mov      dword ptr [ebp + 8], ecx
  1001D5F4:  5d                              pop      ebp
  1001D5F5:  ff e2                           jmp      edx
  1001D5F7:  33 c0                           xor      eax, eax
  1001D5F9:  5d                              pop      ebp
  1001D5FA:  c3                              ret      


; === Map::GetMissionMapContext, GetMissionMapContext ===
; RVA: 0x0001D600  Size: 20 bytes
; Exports: ?GetMissionMapContext@Map@GW@@YAPAUMissionMapContext@2@XZ, GetMissionMapContext
;
  1001D600:  68 3c 2f 05 10                  push     0x10052f3c
  1001D605:  e8 76 91 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001D60A:  50                              push     eax
  1001D60B:  e8 d0 91 00 00                  call     0x100267e0  ; UI::GetFrameContext
  1001D610:  83 c4 08                        add      esp, 8
  1001D613:  c3                              ret      


; === Map::GetMissionMapIconArray ===
; RVA: 0x0001D620  Size: 22 bytes
; Exports: ?GetMissionMapIconArray@Map@GW@@YAPAV?$Array@UMissionMapIcon@GW@@@2@XZ
;
  1001D620:  e8 7b ba ff ff                  call     0x100190a0  ; GW::GetWorldContext
  1001D625:  85 c0                           test     eax, eax
  1001D627:  74 0a                           je       0x1001d633
  1001D629:  05 ec 07 00 00                  add      eax, 0x7ec
  1001D62E:  83 38 00                        cmp      dword ptr [eax], 0
  1001D631:  75 02                           jne      0x1001d635
  1001D633:  33 c0                           xor      eax, eax
  1001D635:  c3                              ret      


; === Map::GetPathingMap ===
; RVA: 0x0001D640  Size: 31 bytes
; Exports: ?GetPathingMap@Map@GW@@YAPAV?$Array@UPathingMap@GW@@@2@XZ
;
  1001D640:  e8 eb b9 ff ff                  call     0x10019030  ; GW::GetMapContext
  1001D645:  85 c0                           test     eax, eax
  1001D647:  74 13                           je       0x1001d65c
  1001D649:  8b 40 74                        mov      eax, dword ptr [eax + 0x74]
  1001D64C:  85 c0                           test     eax, eax
  1001D64E:  74 0c                           je       0x1001d65c
  1001D650:  8b 00                           mov      eax, dword ptr [eax]
  1001D652:  8d 48 18                        lea      ecx, [eax + 0x18]
  1001D655:  f7 d8                           neg      eax
  1001D657:  1b c0                           sbb      eax, eax
  1001D659:  23 c1                           and      eax, ecx
  1001D65B:  c3                              ret      
  1001D65C:  33 c0                           xor      eax, eax
  1001D65E:  c3                              ret      


; === Map::GetRegion, GetRegion ===
; RVA: 0x0001D660  Size: 11 bytes
; Exports: ?GetRegion@Map@GW@@YA?AW4ServerRegion@Constants@2@XZ, GetRegion
;
  1001D660:  6a 04                           push     4
  1001D662:  e8 09 93 00 00                  call     0x10026970  ; UI::GetPreference, GetPreference_Number
  1001D667:  83 c4 04                        add      esp, 4
  1001D66A:  c3                              ret      


; === Map::GetWorldMapContext ===
; RVA: 0x0001D670  Size: 175 bytes
; Exports: ?GetWorldMapContext@Map@GW@@YAPAUWorldMapContext@2@XZ
;
  1001D670:  83 3d 54 c3 08 10 00            cmp      dword ptr [0x1008c354], 0
  1001D677:  56                              push     esi
  1001D678:  8b 35 50 c3 08 10               mov      esi, dword ptr [0x1008c350]
  1001D67E:  0f 85 90 00 00 00               jne      0x1001d714
  1001D684:  85 f6                           test     esi, esi
  1001D686:  75 2c                           jne      0x1001d6b4
  1001D688:  68 d8 2c 05 10                  push     0x10052cd8
  1001D68D:  e8 ee 90 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001D692:  6a 06                           push     6
  1001D694:  50                              push     eax
  1001D695:  e8 56 8d 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001D69A:  68 92 00 00 00                  push     0x92
  1001D69F:  50                              push     eax
  1001D6A0:  e8 4b 8d 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001D6A5:  8b f0                           mov      esi, eax
  1001D6A7:  83 c4 14                        add      esp, 0x14
  1001D6AA:  89 35 50 c3 08 10               mov      dword ptr [0x1008c350], esi
  1001D6B0:  85 f6                           test     esi, esi
  1001D6B2:  74 60                           je       0x1001d714
  1001D6B4:  83 be a8 00 00 00 00            cmp      dword ptr [esi + 0xa8], 0
  1001D6BB:  74 09                           je       0x1001d6c6
  1001D6BD:  83 be b0 00 00 00 00            cmp      dword ptr [esi + 0xb0], 0
  1001D6C4:  77 19                           ja       0x1001d6df
  1001D6C6:  68 c8 c3 04 10                  push     0x1004c3c8  ; "GW::BaseArray<struct GW::UI::FrameInteractionCallback>::at"
  1001D6CB:  6a 1e                           push     0x1e
  1001D6CD:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  1001D6D2:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  1001D6D7:  e8 94 81 fe ff                  call     0x10005870  ; GW::FatalAssert
  1001D6DC:  83 c4 10                        add      esp, 0x10
  1001D6DF:  8b 86 a8 00 00 00               mov      eax, dword ptr [esi + 0xa8]
  1001D6E5:  68 58 c3 08 10                  push     0x1008c358
  1001D6EA:  68 b0 d7 01 10                  push     0x1001d7b0
  1001D6EF:  68 54 c3 08 10                  push     0x1008c354
  1001D6F4:  8b 00                           mov      eax, dword ptr [eax]
  1001D6F6:  a3 54 c3 08 10                  mov      dword ptr [0x1008c354], eax
  1001D6FB:  e8 d0 d2 ff ff                  call     0x1001a9d0  ; Hook::CreateHook
  1001D700:  ff 35 54 c3 08 10               push     dword ptr [0x1008c354]
  1001D706:  e8 35 d3 ff ff                  call     0x1001aa40  ; Hook::EnableHooks
  1001D70B:  8b 35 50 c3 08 10               mov      esi, dword ptr [0x1008c350]
  1001D711:  83 c4 10                        add      esp, 0x10
  1001D714:  56                              push     esi
  1001D715:  e8 c6 90 00 00                  call     0x100267e0  ; UI::GetFrameContext
  1001D71A:  83 c4 04                        add      esp, 4
  1001D71D:  5e                              pop      esi
  1001D71E:  c3                              ret      


; === Map::LanguageFromDistrict ===
; RVA: 0x0001D720  Size: 226 bytes
; Exports: ?LanguageFromDistrict@Map@GW@@YA?AW4Language@Constants@2@W4District@42@@Z
;
  1001D720:  55                              push     ebp
  1001D721:  8b ec                           mov      ebp, esp
  1001D723:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001D726:  48                              dec      eax
  1001D727:  83 f8 0b                        cmp      eax, 0xb
  1001D72A:  77 31                           ja       0x1001d75d
  1001D72C:  ff 24 85 74 d7 01 10            jmp      dword ptr [eax*4 + 0x1001d774]
  1001D733:  b8 02 00 00 00                  mov      eax, 2
  1001D738:  5d                              pop      ebp
  1001D739:  c3                              ret      
  1001D73A:  b8 03 00 00 00                  mov      eax, 3
  1001D73F:  5d                              pop      ebp
  1001D740:  c3                              ret      
  1001D741:  b8 04 00 00 00                  mov      eax, 4
  1001D746:  5d                              pop      ebp
  1001D747:  c3                              ret      
  1001D748:  b8 05 00 00 00                  mov      eax, 5
  1001D74D:  5d                              pop      ebp
  1001D74E:  c3                              ret      
  1001D74F:  b8 09 00 00 00                  mov      eax, 9
  1001D754:  5d                              pop      ebp
  1001D755:  c3                              ret      
  1001D756:  b8 0a 00 00 00                  mov      eax, 0xa
  1001D75B:  5d                              pop      ebp
  1001D75C:  c3                              ret      
  1001D75D:  e8 4e b8 ff ff                  call     0x10018fb0  ; GW::GetCharContext
  1001D762:  85 c0                           test     eax, eax
  1001D764:  74 08                           je       0x1001d76e
  1001D766:  8b 80 24 02 00 00               mov      eax, dword ptr [eax + 0x224]
  1001D76C:  5d                              pop      ebp
  1001D76D:  c3                              ret      
  1001D76E:  33 c0                           xor      eax, eax
  1001D770:  5d                              pop      ebp
  1001D771:  c3                              ret      
  1001D772:  66 90                           nop      
  1001D774:  6e                              outsb    dx, byte ptr [esi]
  1001D775:  d7                              xlatb    
  1001D776:  01 10                           add      dword ptr [eax], edx
  1001D778:  6e                              outsb    dx, byte ptr [esi]
  1001D779:  d7                              xlatb    
  1001D77A:  01 10                           add      dword ptr [eax], edx
  1001D77C:  6e                              outsb    dx, byte ptr [esi]
  1001D77D:  d7                              xlatb    
  1001D77E:  01 10                           add      dword ptr [eax], edx
  1001D780:  33 d7                           xor      edx, edi
  1001D782:  01 10                           add      dword ptr [eax], edx
  1001D784:  3a d7                           cmp      dl, bh
  1001D786:  01 10                           add      dword ptr [eax], edx
  1001D788:  41                              inc      ecx
  1001D789:  d7                              xlatb    
  1001D78A:  01 10                           add      dword ptr [eax], edx
  1001D78C:  48                              dec      eax
  1001D78D:  d7                              xlatb    
  1001D78E:  01 10                           add      dword ptr [eax], edx
  1001D790:  4f                              dec      edi
  1001D791:  d7                              xlatb    
  1001D792:  01 10                           add      dword ptr [eax], edx
  1001D794:  56                              push     esi
  1001D795:  d7                              xlatb    
  1001D796:  01 10                           add      dword ptr [eax], edx
  1001D798:  6e                              outsb    dx, byte ptr [esi]
  1001D799:  d7                              xlatb    
  1001D79A:  01 10                           add      dword ptr [eax], edx
  1001D79C:  6e                              outsb    dx, byte ptr [esi]
  1001D79D:  d7                              xlatb    
  1001D79E:  01 10                           add      dword ptr [eax], edx
  1001D7A0:  6e                              outsb    dx, byte ptr [esi]
  1001D7A1:  d7                              xlatb    
  1001D7A2:  01 10                           add      dword ptr [eax], edx
  1001D7A4:  cc                              int3     
  1001D7A5:  cc                              int3     
  1001D7A6:  cc                              int3     
  1001D7A7:  cc                              int3     
  1001D7A8:  cc                              int3     
  1001D7A9:  cc                              int3     
  1001D7AA:  cc                              int3     
  1001D7AB:  cc                              int3     
  1001D7AC:  cc                              int3     
  1001D7AD:  cc                              int3     
  1001D7AE:  cc                              int3     
  1001D7AF:  cc                              int3     
  1001D7B0:  55                              push     ebp
  1001D7B1:  8b ec                           mov      ebp, esp
  1001D7B3:  56                              push     esi
  1001D7B4:  e8 97 d2 ff ff                  call     0x1001aa50  ; Hook::EnterHook
  1001D7B9:  ff 75 10                        push     dword ptr [ebp + 0x10]
  1001D7BC:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  1001D7BF:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  1001D7C2:  56                              push     esi
  1001D7C3:  ff 15 58 c3 08 10               call     dword ptr [0x1008c358]
  1001D7C9:  83 c4 0c                        add      esp, 0xc
  1001D7CC:  83 7e 04 0b                     cmp      dword ptr [esi + 4], 0xb
  1001D7D0:  75 11                           jne      0x1001d7e3
  1001D7D2:  c7 05 50 c3 08 10 00 00 00 00   mov      dword ptr [0x1008c350], 0
  1001D7DC:  5e                              pop      esi
  1001D7DD:  5d                              pop      ebp
  1001D7DE:  e9 9d d2 ff ff                  jmp      0x1001aa80
  1001D7E3:  83 3d 50 c3 08 10 00            cmp      dword ptr [0x1008c350], 0
  1001D7EA:  75 0f                           jne      0x1001d7fb
  1001D7EC:  ff 36                           push     dword ptr [esi]
  1001D7EE:  e8 1d 8f 00 00                  call     0x10026710  ; UI::GetFrameById
  1001D7F3:  83 c4 04                        add      esp, 4
  1001D7F6:  a3 50 c3 08 10                  mov      dword ptr [0x1008c350], eax
  1001D7FB:  5e                              pop      esi
  1001D7FC:  5d                              pop      ebp
  1001D7FD:  e9 7e d2 ff ff                  jmp      0x1001aa80


; === Map::QueryAltitude ===
; RVA: 0x0001D810  Size: 208 bytes
; Exports: ?QueryAltitude@Map@GW@@YAMPBUGamePos@2@MPAUMapContext@2@@Z
;
  1001D810:  55                              push     ebp
  1001D811:  8b ec                           mov      ebp, esp
  1001D813:  51                              push     ecx
  1001D814:  53                              push     ebx
  1001D815:  57                              push     edi
  1001D816:  8b 7d 10                        mov      edi, dword ptr [ebp + 0x10]
  1001D819:  85 ff                           test     edi, edi
  1001D81B:  75 07                           jne      0x1001d824
  1001D81D:  e8 0e b8 ff ff                  call     0x10019030  ; GW::GetMapContext
  1001D822:  8b f8                           mov      edi, eax
  1001D824:  83 3d 38 c3 08 10 00            cmp      dword ptr [0x1008c338], 0
  1001D82B:  0f 84 a7 00 00 00               je       0x1001d8d8
  1001D831:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  1001D834:  85 db                           test     ebx, ebx
  1001D836:  0f 84 9c 00 00 00               je       0x1001d8d8
  1001D83C:  85 ff                           test     edi, edi
  1001D83E:  0f 84 94 00 00 00               je       0x1001d8d8
  1001D844:  f3 0f 10 4d 0c                  movss    xmm1, dword ptr [ebp + 0xc]
  1001D849:  0f 57 c0                        xorps    xmm0, xmm0
  1001D84C:  0f 2f c8                        comiss   xmm1, xmm0
  1001D84F:  0f 86 83 00 00 00               jbe      0x1001d8d8
  1001D855:  8b 47 74                        mov      eax, dword ptr [edi + 0x74]
  1001D858:  85 c0                           test     eax, eax
  1001D85A:  74 7c                           je       0x1001d8d8
  1001D85C:  8b 00                           mov      eax, dword ptr [eax]
  1001D85E:  85 c0                           test     eax, eax
  1001D860:  74 76                           je       0x1001d8d8
  1001D862:  8b 40 20                        mov      eax, dword ptr [eax + 0x20]
  1001D865:  3b 43 08                        cmp      eax, dword ptr [ebx + 8]
  1001D868:  76 6e                           jbe      0x1001d8d8
  1001D86A:  f3 0f 10 0b                     movss    xmm1, dword ptr [ebx]
  1001D86E:  0f 2f 4f 04                     comiss   xmm1, dword ptr [edi + 4]
  1001D872:  72 64                           jb       0x1001d8d8
  1001D874:  f3 0f 10 53 04                  movss    xmm2, dword ptr [ebx + 4]
  1001D879:  0f 2f 57 08                     comiss   xmm2, dword ptr [edi + 8]
  1001D87D:  72 59                           jb       0x1001d8d8
  1001D87F:  f3 0f 10 47 0c                  movss    xmm0, dword ptr [edi + 0xc]
  1001D884:  0f 2f c1                        comiss   xmm0, xmm1
  1001D887:  72 4f                           jb       0x1001d8d8
  1001D889:  f3 0f 10 47 10                  movss    xmm0, dword ptr [edi + 0x10]
  1001D88E:  0f 2f c2                        comiss   xmm0, xmm2
  1001D891:  72 45                           jb       0x1001d8d8
  1001D893:  e8 38 b7 ff ff                  call     0x10018fd0  ; GW::GetGameContext
  1001D898:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001D89B:  85 c0                           test     eax, eax
  1001D89D:  74 39                           je       0x1001d8d8
  1001D89F:  f3 0f 10 45 0c                  movss    xmm0, dword ptr [ebp + 0xc]
  1001D8A4:  56                              push     esi
  1001D8A5:  8b 70 14                        mov      esi, dword ptr [eax + 0x14]
  1001D8A8:  c7 45 10 00 00 00 00            mov      dword ptr [ebp + 0x10], 0
  1001D8AF:  89 78 14                        mov      dword ptr [eax + 0x14], edi
  1001D8B2:  8d 45 10                        lea      eax, [ebp + 0x10]
  1001D8B5:  6a 00                           push     0
  1001D8B7:  50                              push     eax
  1001D8B8:  51                              push     ecx
  1001D8B9:  f3 0f 11 04 24                  movss    dword ptr [esp], xmm0
  1001D8BE:  53                              push     ebx
  1001D8BF:  ff 15 38 c3 08 10               call     dword ptr [0x1008c338]
  1001D8C5:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  1001D8C8:  83 c4 10                        add      esp, 0x10
  1001D8CB:  89 70 14                        mov      dword ptr [eax + 0x14], esi
  1001D8CE:  d9 45 10                        fld      dword ptr [ebp + 0x10]
  1001D8D1:  5e                              pop      esi
  1001D8D2:  5f                              pop      edi
  1001D8D3:  5b                              pop      ebx
  1001D8D4:  8b e5                           mov      esp, ebp
  1001D8D6:  5d                              pop      ebp
  1001D8D7:  c3                              ret      
  1001D8D8:  d9 ee                           fldz     
  1001D8DA:  5f                              pop      edi
  1001D8DB:  5b                              pop      ebx
  1001D8DC:  8b e5                           mov      esp, ebp
  1001D8DE:  5d                              pop      ebp
  1001D8DF:  c3                              ret      


; === Map::RegionFromDistrict ===
; RVA: 0x0001D8E0  Size: 71 bytes
; Exports: ?RegionFromDistrict@Map@GW@@YA?AW4ServerRegion@Constants@2@W4District@42@@Z
;
  1001D8E0:  55                              push     ebp
  1001D8E1:  8b ec                           mov      ebp, esp
  1001D8E3:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001D8E6:  48                              dec      eax
  1001D8E7:  83 f8 0b                        cmp      eax, 0xb
  1001D8EA:  77 2e                           ja       0x1001d91a
  1001D8EC:  ff 24 85 28 d9 01 10            jmp      dword ptr [eax*4 + 0x1001d928]
  1001D8F3:  b8 fe ff ff ff                  mov      eax, 0xfffffffe
  1001D8F8:  5d                              pop      ebp
  1001D8F9:  c3                              ret      
  1001D8FA:  33 c0                           xor      eax, eax
  1001D8FC:  5d                              pop      ebp
  1001D8FD:  c3                              ret      
  1001D8FE:  b8 02 00 00 00                  mov      eax, 2
  1001D903:  5d                              pop      ebp
  1001D904:  c3                              ret      
  1001D905:  b8 01 00 00 00                  mov      eax, 1
  1001D90A:  5d                              pop      ebp
  1001D90B:  c3                              ret      
  1001D90C:  b8 03 00 00 00                  mov      eax, 3
  1001D911:  5d                              pop      ebp
  1001D912:  c3                              ret      
  1001D913:  b8 04 00 00 00                  mov      eax, 4
  1001D918:  5d                              pop      ebp
  1001D919:  c3                              ret      
  1001D91A:  c7 45 08 04 00 00 00            mov      dword ptr [ebp + 8], 4
  1001D921:  5d                              pop      ebp
  1001D922:  e9 49 90 00 00                  jmp      0x10026970


; === Map::SkipCinematic, SkipCinematic ===
; RVA: 0x0001D960  Size: 44 bytes
; Exports: ?SkipCinematic@Map@GW@@YA_NXZ, SkipCinematic
;
  1001D960:  68 d8 2c 05 10                  push     0x10052cd8
  1001D965:  e8 16 8e 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001D96A:  6a 06                           push     6
  1001D96C:  50                              push     eax
  1001D96D:  e8 7e 8a 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001D972:  6a 01                           push     1
  1001D974:  50                              push     eax
  1001D975:  e8 76 8a 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001D97A:  6a 00                           push     0
  1001D97C:  50                              push     eax
  1001D97D:  e8 6e 8a 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001D982:  50                              push     eax
  1001D983:  e8 a8 86 00 00                  call     0x10026030  ; UI::ButtonClick, ButtonClick
  1001D988:  83 c4 20                        add      esp, 0x20
  1001D98B:  c3                              ret      


; === Map::Travel, TravelByDistrict ===
; RVA: 0x0001D990  Size: 87 bytes
; Exports: ?Travel@Map@GW@@YA_NW4MapID@Constants@2@W4District@42@H@Z, TravelByDistrict
;
  1001D990:  55                              push     ebp
  1001D991:  8b ec                           mov      ebp, esp
  1001D993:  83 ec 14                        sub      esp, 0x14
  1001D996:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1001D99B:  33 c5                           xor      eax, ebp
  1001D99D:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001D9A0:  57                              push     edi
  1001D9A1:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  1001D9A4:  e8 77 fd ff ff                  call     0x1001d720  ; Map::LanguageFromDistrict
  1001D9A9:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001D9AC:  8b f8                           mov      edi, eax
  1001D9AE:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  1001D9B1:  89 4d ec                        mov      dword ptr [ebp - 0x14], ecx
  1001D9B4:  8b 4d 10                        mov      ecx, dword ptr [ebp + 0x10]
  1001D9B7:  89 4d f8                        mov      dword ptr [ebp - 8], ecx
  1001D9BA:  e8 21 ff ff ff                  call     0x1001d8e0  ; Map::RegionFromDistrict
  1001D9BF:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  1001D9C2:  8d 45 ec                        lea      eax, [ebp - 0x14]
  1001D9C5:  6a 00                           push     0
  1001D9C7:  50                              push     eax
  1001D9C8:  68 82 01 00 10                  push     0x10000182
  1001D9CD:  89 7d f4                        mov      dword ptr [ebp - 0xc], edi
  1001D9D0:  e8 fb a6 00 00                  call     0x100280d0  ; UI::SendUIMessage
  1001D9D5:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001D9D8:  83 c4 14                        add      esp, 0x14
  1001D9DB:  33 cd                           xor      ecx, ebp
  1001D9DD:  5f                              pop      edi
  1001D9DE:  e8 d4 e9 00 00                  call     0x1002c3b7
  1001D9E3:  8b e5                           mov      esp, ebp
  1001D9E5:  5d                              pop      ebp
  1001D9E6:  c3                              ret      


; === Map::Travel, TravelByRegion ===
; RVA: 0x0001D9F0  Size: 73 bytes
; Exports: ?Travel@Map@GW@@YA_NW4MapID@Constants@2@W4ServerRegion@42@HW4Language@42@@Z, TravelByRegion
;
  1001D9F0:  55                              push     ebp
  1001D9F1:  8b ec                           mov      ebp, esp
  1001D9F3:  83 ec 14                        sub      esp, 0x14
  1001D9F6:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1001D9FB:  33 c5                           xor      eax, ebp
  1001D9FD:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001DA00:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001DA03:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  1001DA06:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  1001DA09:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  1001DA0C:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  1001DA0F:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  1001DA12:  8b 45 14                        mov      eax, dword ptr [ebp + 0x14]
  1001DA15:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  1001DA18:  8d 45 ec                        lea      eax, [ebp - 0x14]
  1001DA1B:  6a 00                           push     0
  1001DA1D:  50                              push     eax
  1001DA1E:  68 82 01 00 10                  push     0x10000182
  1001DA23:  e8 a8 a6 00 00                  call     0x100280d0  ; UI::SendUIMessage
  1001DA28:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001DA2B:  83 c4 0c                        add      esp, 0xc
  1001DA2E:  33 cd                           xor      ecx, ebp
  1001DA30:  e8 82 e9 00 00                  call     0x1002c3b7
  1001DA35:  8b e5                           mov      esp, ebp
  1001DA37:  5d                              pop      ebp
  1001DA38:  c3                              ret      


