; Module: PlayerMgr
; Functions: 14
; Total code size: 1069 bytes
;

; === PlayerMgr::ChangeSecondProfession, ChangeSecondProfession ===
; RVA: 0x00020590  Size: 28 bytes
; Exports: ?ChangeSecondProfession@PlayerMgr@GW@@YA_NW4Profession@Constants@2@I@Z, ChangeSecondProfession
;
  10020590:  55                              push     ebp
  10020591:  8b ec                           mov      ebp, esp
  10020593:  ff 75 08                        push     dword ptr [ebp + 8]
  10020596:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10020599:  e8 92 1f fe ff                  call     0x10002530  ; Agents::GetHeroAgentID, GetHeroAgentID
  1002059E:  83 c4 04                        add      esp, 4
  100205A1:  50                              push     eax
  100205A2:  e8 79 21 00 00                  call     0x10022720  ; SkillbarMgr::ChangeSecondProfession
  100205A7:  83 c4 08                        add      esp, 8
  100205AA:  5d                              pop      ebp
  100205AB:  c3                              ret      


; === PlayerMgr::GetActiveTitle, GetActiveTitle ===
; RVA: 0x000205B0  Size: 52 bytes
; Exports: ?GetActiveTitle@PlayerMgr@GW@@YAPAUTitle@2@XZ, GetActiveTitle
;
  100205B0:  56                              push     esi
  100205B1:  e8 3a 00 00 00                  call     0x100205f0  ; PlayerMgr::GetActiveTitleId
  100205B6:  8b f0                           mov      esi, eax
  100205B8:  e8 e3 8a ff ff                  call     0x100190a0  ; GW::GetWorldContext
  100205BD:  85 c0                           test     eax, eax
  100205BF:  74 1f                           je       0x100205e0
  100205C1:  83 b8 1c 08 00 00 00            cmp      dword ptr [eax + 0x81c], 0
  100205C8:  8d 88 1c 08 00 00               lea      ecx, [eax + 0x81c]
  100205CE:  74 10                           je       0x100205e0
  100205D0:  85 c9                           test     ecx, ecx
  100205D2:  74 0c                           je       0x100205e0
  100205D4:  39 71 08                        cmp      dword ptr [ecx + 8], esi
  100205D7:  76 07                           jbe      0x100205e0
  100205D9:  6b c6 2c                        imul     eax, esi, 0x2c
  100205DC:  5e                              pop      esi
  100205DD:  03 01                           add      eax, dword ptr [ecx]
  100205DF:  c3                              ret      
  100205E0:  33 c0                           xor      eax, eax
  100205E2:  5e                              pop      esi
  100205E3:  c3                              ret      


; === PlayerMgr::GetActiveTitleId ===
; RVA: 0x000205F0  Size: 208 bytes
; Exports: ?GetActiveTitleId@PlayerMgr@GW@@YA?AW4TitleID@Constants@2@XZ
;
  100205F0:  55                              push     ebp
  100205F1:  8b ec                           mov      ebp, esp
  100205F3:  51                              push     ecx
  100205F4:  53                              push     ebx
  100205F5:  56                              push     esi
  100205F6:  57                              push     edi
  100205F7:  e8 b4 89 ff ff                  call     0x10018fb0  ; GW::GetCharContext
  100205FC:  85 c0                           test     eax, eax
  100205FE:  74 08                           je       0x10020608
  10020600:  8b b0 a4 02 00 00               mov      esi, dword ptr [eax + 0x2a4]
  10020606:  eb 02                           jmp      0x1002060a
  10020608:  33 f6                           xor      esi, esi
  1002060A:  e8 91 8a ff ff                  call     0x100190a0  ; GW::GetWorldContext
  1002060F:  85 c0                           test     eax, eax
  10020611:  0f 84 94 00 00 00               je       0x100206ab
  10020617:  83 b8 0c 08 00 00 00            cmp      dword ptr [eax + 0x80c], 0
  1002061E:  8d 88 0c 08 00 00               lea      ecx, [eax + 0x80c]
  10020624:  0f 84 81 00 00 00               je       0x100206ab
  1002062A:  85 c9                           test     ecx, ecx
  1002062C:  74 7d                           je       0x100206ab
  1002062E:  3b 71 08                        cmp      esi, dword ptr [ecx + 8]
  10020631:  73 78                           jae      0x100206ab
  10020633:  8d 04 b6                        lea      eax, [esi + esi*4]
  10020636:  c1 e0 04                        shl      eax, 4
  10020639:  03 01                           add      eax, dword ptr [ecx]
  1002063B:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1002063E:  74 6b                           je       0x100206ab
  10020640:  83 78 30 00                     cmp      dword ptr [eax + 0x30], 0
  10020644:  74 65                           je       0x100206ab
  10020646:  e8 55 8a ff ff                  call     0x100190a0  ; GW::GetWorldContext
  1002064B:  85 c0                           test     eax, eax
  1002064D:  74 5c                           je       0x100206ab
  1002064F:  83 b8 1c 08 00 00 00            cmp      dword ptr [eax + 0x81c], 0
  10020656:  8d b8 1c 08 00 00               lea      edi, [eax + 0x81c]
  1002065C:  74 4d                           je       0x100206ab
  1002065E:  85 ff                           test     edi, edi
  10020660:  74 49                           je       0x100206ab
  10020662:  8b 47 08                        mov      eax, dword ptr [edi + 8]
  10020665:  33 f6                           xor      esi, esi
  10020667:  85 c0                           test     eax, eax
  10020669:  74 40                           je       0x100206ab
  1002066B:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1002066E:  33 db                           xor      ebx, ebx
  10020670:  83 3f 00                        cmp      dword ptr [edi], 0
  10020673:  74 04                           je       0x10020679
  10020675:  3b f0                           cmp      esi, eax
  10020677:  72 1c                           jb       0x10020695
  10020679:  68 50 35 05 10                  push     0x10053550  ; "GW::BaseArray<struct GW::Title>::at"
  1002067E:  6a 1e                           push     0x1e
  10020680:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  10020685:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  1002068A:  e8 e1 51 fe ff                  call     0x10005870  ; GW::FatalAssert
  1002068F:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10020692:  83 c4 10                        add      esp, 0x10
  10020695:  8b 07                           mov      eax, dword ptr [edi]
  10020697:  8b 44 03 08                     mov      eax, dword ptr [ebx + eax + 8]
  1002069B:  3b 41 30                        cmp      eax, dword ptr [ecx + 0x30]
  1002069E:  74 17                           je       0x100206b7
  100206A0:  8b 47 08                        mov      eax, dword ptr [edi + 8]
  100206A3:  46                              inc      esi
  100206A4:  83 c3 2c                        add      ebx, 0x2c
  100206A7:  3b f0                           cmp      esi, eax
  100206A9:  72 c5                           jb       0x10020670
  100206AB:  5f                              pop      edi
  100206AC:  5e                              pop      esi
  100206AD:  b8 ff 00 00 00                  mov      eax, 0xff
  100206B2:  5b                              pop      ebx
  100206B3:  8b e5                           mov      esp, ebp
  100206B5:  5d                              pop      ebp
  100206B6:  c3                              ret      
  100206B7:  5f                              pop      edi
  100206B8:  8b c6                           mov      eax, esi
  100206BA:  5e                              pop      esi
  100206BB:  5b                              pop      ebx
  100206BC:  8b e5                           mov      esp, ebp
  100206BE:  5d                              pop      ebp
  100206BF:  c3                              ret      


; === PlayerMgr::GetAmountOfPlayersInInstance ===
; RVA: 0x000206C0  Size: 94 bytes
; Exports: ?GetAmountOfPlayersInInstance@PlayerMgr@GW@@YAIXZ
;
  100206C0:  e9 6b 1b fe ff                  jmp      0x10002230
  100206C5:  cc                              int3     
  100206C6:  cc                              int3     
  100206C7:  cc                              int3     
  100206C8:  cc                              int3     
  100206C9:  cc                              int3     
  100206CA:  cc                              int3     
  100206CB:  cc                              int3     
  100206CC:  cc                              int3     
  100206CD:  cc                              int3     
  100206CE:  cc                              int3     
  100206CF:  cc                              int3     
  100206D0:  55                              push     ebp
  100206D1:  8b ec                           mov      ebp, esp
  100206D3:  56                              push     esi
  100206D4:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  100206D7:  85 f6                           test     esi, esi
  100206D9:  75 13                           jne      0x100206ee
  100206DB:  e8 d0 88 ff ff                  call     0x10018fb0  ; GW::GetCharContext
  100206E0:  85 c0                           test     eax, eax
  100206E2:  74 08                           je       0x100206ec
  100206E4:  8b b0 a4 02 00 00               mov      esi, dword ptr [eax + 0x2a4]
  100206EA:  eb 02                           jmp      0x100206ee
  100206EC:  33 f6                           xor      esi, esi
  100206EE:  e8 ad 89 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  100206F3:  85 c0                           test     eax, eax
  100206F5:  74 22                           je       0x10020719
  100206F7:  05 0c 08 00 00                  add      eax, 0x80c
  100206FC:  83 38 00                        cmp      dword ptr [eax], 0
  100206FF:  74 18                           je       0x10020719
  10020701:  85 c0                           test     eax, eax
  10020703:  74 14                           je       0x10020719
  10020705:  3b 70 08                        cmp      esi, dword ptr [eax + 8]
  10020708:  73 0f                           jae      0x10020719
  1002070A:  8d 0c b6                        lea      ecx, [esi + esi*4]
  1002070D:  c1 e1 04                        shl      ecx, 4
  10020710:  03 08                           add      ecx, dword ptr [eax]
  10020712:  74 05                           je       0x10020719
  10020714:  8b 01                           mov      eax, dword ptr [ecx]
  10020716:  5e                              pop      esi
  10020717:  5d                              pop      ebp
  10020718:  c3                              ret      
  10020719:  33 c0                           xor      eax, eax
  1002071B:  5e                              pop      esi
  1002071C:  5d                              pop      ebp
  1002071D:  c3                              ret      


; === PlayerMgr::GetPlayerAgentId, GetPlayerAgentId ===
; RVA: 0x000206D0  Size: 78 bytes
; Exports: ?GetPlayerAgentId@PlayerMgr@GW@@YAII@Z, GetPlayerAgentId
;
  100206D0:  55                              push     ebp
  100206D1:  8b ec                           mov      ebp, esp
  100206D3:  56                              push     esi
  100206D4:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  100206D7:  85 f6                           test     esi, esi
  100206D9:  75 13                           jne      0x100206ee
  100206DB:  e8 d0 88 ff ff                  call     0x10018fb0  ; GW::GetCharContext
  100206E0:  85 c0                           test     eax, eax
  100206E2:  74 08                           je       0x100206ec
  100206E4:  8b b0 a4 02 00 00               mov      esi, dword ptr [eax + 0x2a4]
  100206EA:  eb 02                           jmp      0x100206ee
  100206EC:  33 f6                           xor      esi, esi
  100206EE:  e8 ad 89 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  100206F3:  85 c0                           test     eax, eax
  100206F5:  74 22                           je       0x10020719
  100206F7:  05 0c 08 00 00                  add      eax, 0x80c
  100206FC:  83 38 00                        cmp      dword ptr [eax], 0
  100206FF:  74 18                           je       0x10020719
  10020701:  85 c0                           test     eax, eax
  10020703:  74 14                           je       0x10020719
  10020705:  3b 70 08                        cmp      esi, dword ptr [eax + 8]
  10020708:  73 0f                           jae      0x10020719
  1002070A:  8d 0c b6                        lea      ecx, [esi + esi*4]
  1002070D:  c1 e1 04                        shl      ecx, 4
  10020710:  03 08                           add      ecx, dword ptr [eax]
  10020712:  74 05                           je       0x10020719
  10020714:  8b 01                           mov      eax, dword ptr [ecx]
  10020716:  5e                              pop      esi
  10020717:  5d                              pop      ebp
  10020718:  c3                              ret      
  10020719:  33 c0                           xor      eax, eax
  1002071B:  5e                              pop      esi
  1002071C:  5d                              pop      ebp
  1002071D:  c3                              ret      


; === PlayerMgr::GetPlayerByID ===
; RVA: 0x00020720  Size: 79 bytes
; Exports: ?GetPlayerByID@PlayerMgr@GW@@YAPAUPlayer@2@I@Z
;
  10020720:  55                              push     ebp
  10020721:  8b ec                           mov      ebp, esp
  10020723:  56                              push     esi
  10020724:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10020727:  85 f6                           test     esi, esi
  10020729:  75 13                           jne      0x1002073e
  1002072B:  e8 80 88 ff ff                  call     0x10018fb0  ; GW::GetCharContext
  10020730:  85 c0                           test     eax, eax
  10020732:  74 08                           je       0x1002073c
  10020734:  8b b0 a4 02 00 00               mov      esi, dword ptr [eax + 0x2a4]
  1002073A:  eb 02                           jmp      0x1002073e
  1002073C:  33 f6                           xor      esi, esi
  1002073E:  e8 5d 89 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  10020743:  85 c0                           test     eax, eax
  10020745:  74 23                           je       0x1002076a
  10020747:  83 b8 0c 08 00 00 00            cmp      dword ptr [eax + 0x80c], 0
  1002074E:  8d 88 0c 08 00 00               lea      ecx, [eax + 0x80c]
  10020754:  74 14                           je       0x1002076a
  10020756:  85 c9                           test     ecx, ecx
  10020758:  74 10                           je       0x1002076a
  1002075A:  3b 71 08                        cmp      esi, dword ptr [ecx + 8]
  1002075D:  73 0b                           jae      0x1002076a
  1002075F:  8d 04 b6                        lea      eax, [esi + esi*4]
  10020762:  c1 e0 04                        shl      eax, 4
  10020765:  03 01                           add      eax, dword ptr [ecx]
  10020767:  5e                              pop      esi
  10020768:  5d                              pop      ebp
  10020769:  c3                              ret      
  1002076A:  33 c0                           xor      eax, eax
  1002076C:  5e                              pop      esi
  1002076D:  5d                              pop      ebp
  1002076E:  c3                              ret      


; === PlayerMgr::GetPlayerByName ===
; RVA: 0x00020770  Size: 213 bytes
; Exports: ?GetPlayerByName@PlayerMgr@GW@@YAPAUPlayer@2@PB_W@Z
;
  10020770:  55                              push     ebp
  10020771:  8b ec                           mov      ebp, esp
  10020773:  83 ec 10                        sub      esp, 0x10
  10020776:  53                              push     ebx
  10020777:  56                              push     esi
  10020778:  57                              push     edi
  10020779:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  1002077C:  85 ff                           test     edi, edi
  1002077E:  0f 84 ac 00 00 00               je       0x10020830
  10020784:  e8 17 89 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  10020789:  85 c0                           test     eax, eax
  1002078B:  0f 84 9f 00 00 00               je       0x10020830
  10020791:  05 0c 08 00 00                  add      eax, 0x80c
  10020796:  83 38 00                        cmp      dword ptr [eax], 0
  10020799:  0f 84 91 00 00 00               je       0x10020830
  1002079F:  85 c0                           test     eax, eax
  100207A1:  0f 84 89 00 00 00               je       0x10020830
  100207A7:  8b 08                           mov      ecx, dword ptr [eax]
  100207A9:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  100207AC:  89 4d fc                        mov      dword ptr [ebp - 4], ecx
  100207AF:  8d 04 80                        lea      eax, [eax + eax*4]
  100207B2:  c1 e0 04                        shl      eax, 4
  100207B5:  03 c1                           add      eax, ecx
  100207B7:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  100207BA:  3b c8                           cmp      ecx, eax
  100207BC:  74 72                           je       0x10020830
  100207BE:  66 90                           nop      
  100207C0:  8b 41 28                        mov      eax, dword ptr [ecx + 0x28]
  100207C3:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  100207C6:  85 c0                           test     eax, eax
  100207C8:  74 5b                           je       0x10020825
  100207CA:  3b f8                           cmp      edi, eax
  100207CC:  74 6e                           je       0x1002083c
  100207CE:  33 db                           xor      ebx, ebx
  100207D0:  8b f7                           mov      esi, edi
  100207D2:  2b c7                           sub      eax, edi
  100207D4:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  100207D7:  66 0f 1f 84 00 00 00 00 00      nop      word ptr [eax + eax]
  100207E0:  0f b7 04 30                     movzx    eax, word ptr [eax + esi]
  100207E4:  50                              push     eax
  100207E5:  e8 1d 5b 01 00                  call     0x10036307
  100207EA:  0f b7 0e                        movzx    ecx, word ptr [esi]
  100207ED:  8b f8                           mov      edi, eax
  100207EF:  51                              push     ecx
  100207F0:  e8 12 5b 01 00                  call     0x10036307
  100207F5:  83 c4 08                        add      esp, 8
  100207F8:  3b c7                           cmp      eax, edi
  100207FA:  75 14                           jne      0x10020810
  100207FC:  66 83 3e 00                     cmp      word ptr [esi], 0
  10020800:  74 0e                           je       0x10020810
  10020802:  43                              inc      ebx
  10020803:  83 c6 02                        add      esi, 2
  10020806:  83 fb 20                        cmp      ebx, 0x20
  10020809:  73 2e                           jae      0x10020839
  1002080B:  8b 45 f8                        mov      eax, dword ptr [ebp - 8]
  1002080E:  eb d0                           jmp      0x100207e0
  10020810:  8b 45 f4                        mov      eax, dword ptr [ebp - 0xc]
  10020813:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  10020816:  0f b7 04 58                     movzx    eax, word ptr [eax + ebx*2]
  1002081A:  0f b7 0c 5f                     movzx    ecx, word ptr [edi + ebx*2]
  1002081E:  2b c8                           sub      ecx, eax
  10020820:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10020823:  74 17                           je       0x1002083c
  10020825:  83 c1 50                        add      ecx, 0x50
  10020828:  89 4d fc                        mov      dword ptr [ebp - 4], ecx
  1002082B:  3b 4d f0                        cmp      ecx, dword ptr [ebp - 0x10]
  1002082E:  75 90                           jne      0x100207c0
  10020830:  5f                              pop      edi
  10020831:  5e                              pop      esi
  10020832:  33 c0                           xor      eax, eax
  10020834:  5b                              pop      ebx
  10020835:  8b e5                           mov      esp, ebp
  10020837:  5d                              pop      ebp
  10020838:  c3                              ret      
  10020839:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1002083C:  5f                              pop      edi
  1002083D:  5e                              pop      esi
  1002083E:  8b c1                           mov      eax, ecx
  10020840:  5b                              pop      ebx
  10020841:  8b e5                           mov      esp, ebp
  10020843:  5d                              pop      ebp
  10020844:  c3                              ret      


; === PlayerMgr::GetPlayerName ===
; RVA: 0x00020850  Size: 79 bytes
; Exports: ?GetPlayerName@PlayerMgr@GW@@YAPA_WI@Z
;
  10020850:  55                              push     ebp
  10020851:  8b ec                           mov      ebp, esp
  10020853:  56                              push     esi
  10020854:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10020857:  85 f6                           test     esi, esi
  10020859:  75 13                           jne      0x1002086e
  1002085B:  e8 50 87 ff ff                  call     0x10018fb0  ; GW::GetCharContext
  10020860:  85 c0                           test     eax, eax
  10020862:  74 08                           je       0x1002086c
  10020864:  8b b0 a4 02 00 00               mov      esi, dword ptr [eax + 0x2a4]
  1002086A:  eb 02                           jmp      0x1002086e
  1002086C:  33 f6                           xor      esi, esi
  1002086E:  e8 2d 88 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  10020873:  85 c0                           test     eax, eax
  10020875:  74 23                           je       0x1002089a
  10020877:  05 0c 08 00 00                  add      eax, 0x80c
  1002087C:  83 38 00                        cmp      dword ptr [eax], 0
  1002087F:  74 19                           je       0x1002089a
  10020881:  85 c0                           test     eax, eax
  10020883:  74 15                           je       0x1002089a
  10020885:  3b 70 08                        cmp      esi, dword ptr [eax + 8]
  10020888:  73 10                           jae      0x1002089a
  1002088A:  8d 0c b6                        lea      ecx, [esi + esi*4]
  1002088D:  c1 e1 04                        shl      ecx, 4
  10020890:  03 08                           add      ecx, dword ptr [eax]
  10020892:  74 06                           je       0x1002089a
  10020894:  8b 41 28                        mov      eax, dword ptr [ecx + 0x28]
  10020897:  5e                              pop      esi
  10020898:  5d                              pop      ebp
  10020899:  c3                              ret      
  1002089A:  33 c0                           xor      eax, eax
  1002089C:  5e                              pop      esi
  1002089D:  5d                              pop      ebp
  1002089E:  c3                              ret      


; === PlayerMgr::GetPlayerNumber, GetPlayerNumber ===
; RVA: 0x000208A0  Size: 19 bytes
; Exports: ?GetPlayerNumber@PlayerMgr@GW@@YAIXZ, GetPlayerNumber
;
  100208A0:  e8 0b 87 ff ff                  call     0x10018fb0  ; GW::GetCharContext
  100208A5:  85 c0                           test     eax, eax
  100208A7:  74 07                           je       0x100208b0
  100208A9:  8b 80 a4 02 00 00               mov      eax, dword ptr [eax + 0x2a4]
  100208AF:  c3                              ret      
  100208B0:  33 c0                           xor      eax, eax
  100208B2:  c3                              ret      


; === PlayerMgr::GetTitleData, GetTitleData ===
; RVA: 0x000208C0  Size: 28 bytes
; Exports: ?GetTitleData@PlayerMgr@GW@@YAPAUTitleClientData@2@W4TitleID@Constants@2@@Z, GetTitleData
;
  100208C0:  55                              push     ebp
  100208C1:  8b ec                           mov      ebp, esp
  100208C3:  8b 0d f4 c3 08 10               mov      ecx, dword ptr [0x1008c3f4]
  100208C9:  85 c9                           test     ecx, ecx
  100208CB:  74 0b                           je       0x100208d8
  100208CD:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100208D0:  8d 04 40                        lea      eax, [eax + eax*2]
  100208D3:  8d 04 81                        lea      eax, [ecx + eax*4]
  100208D6:  5d                              pop      ebp
  100208D7:  c3                              ret      
  100208D8:  33 c0                           xor      eax, eax
  100208DA:  5d                              pop      ebp
  100208DB:  c3                              ret      


; === PlayerMgr::GetTitleTrack, GetTitleTrack ===
; RVA: 0x000208E0  Size: 50 bytes
; Exports: ?GetTitleTrack@PlayerMgr@GW@@YAPAUTitle@2@W4TitleID@Constants@2@@Z, GetTitleTrack
;
  100208E0:  55                              push     ebp
  100208E1:  8b ec                           mov      ebp, esp
  100208E3:  e8 b8 87 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  100208E8:  85 c0                           test     eax, eax
  100208EA:  74 22                           je       0x1002090e
  100208EC:  83 b8 1c 08 00 00 00            cmp      dword ptr [eax + 0x81c], 0
  100208F3:  8d 88 1c 08 00 00               lea      ecx, [eax + 0x81c]
  100208F9:  74 13                           je       0x1002090e
  100208FB:  85 c9                           test     ecx, ecx
  100208FD:  74 0f                           je       0x1002090e
  100208FF:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10020902:  39 41 08                        cmp      dword ptr [ecx + 8], eax
  10020905:  76 07                           jbe      0x1002090e
  10020907:  6b c0 2c                        imul     eax, eax, 0x2c
  1002090A:  03 01                           add      eax, dword ptr [ecx]
  1002090C:  5d                              pop      ebp
  1002090D:  c3                              ret      
  1002090E:  33 c0                           xor      eax, eax
  10020910:  5d                              pop      ebp
  10020911:  c3                              ret      


; === PlayerMgr::RemoveActiveTitle, RemoveActiveTitle ===
; RVA: 0x00020920  Size: 17 bytes
; Exports: ?RemoveActiveTitle@PlayerMgr@GW@@YA_NXZ, RemoveActiveTitle
;
  10020920:  a1 ec c3 08 10                  mov      eax, dword ptr [0x1008c3ec]
  10020925:  85 c0                           test     eax, eax
  10020927:  74 05                           je       0x1002092e
  10020929:  ff d0                           call     eax
  1002092B:  b0 01                           mov      al, 1
  1002092D:  c3                              ret      
  1002092E:  32 c0                           xor      al, al
  10020930:  c3                              ret      


; === PlayerMgr::SetActiveTitle, SetActiveTitle ===
; RVA: 0x00020940  Size: 28 bytes
; Exports: ?SetActiveTitle@PlayerMgr@GW@@YA_NW4TitleID@Constants@2@@Z, SetActiveTitle
;
  10020940:  55                              push     ebp
  10020941:  8b ec                           mov      ebp, esp
  10020943:  a1 f0 c3 08 10                  mov      eax, dword ptr [0x1008c3f0]
  10020948:  85 c0                           test     eax, eax
  1002094A:  74 0c                           je       0x10020958
  1002094C:  ff 75 08                        push     dword ptr [ebp + 8]
  1002094F:  ff d0                           call     eax
  10020951:  83 c4 04                        add      esp, 4
  10020954:  b0 01                           mov      al, 1
  10020956:  5d                              pop      ebp
  10020957:  c3                              ret      
  10020958:  32 c0                           xor      al, al
  1002095A:  5d                              pop      ebp
  1002095B:  c3                              ret      


; === PlayerMgr::SetPlayerName ===
; RVA: 0x00020960  Size: 96 bytes
; Exports: ?SetPlayerName@PlayerMgr@GW@@YAPA_WIPB_W@Z
;
  10020960:  55                              push     ebp
  10020961:  8b ec                           mov      ebp, esp
  10020963:  56                              push     esi
  10020964:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10020967:  85 f6                           test     esi, esi
  10020969:  75 13                           jne      0x1002097e
  1002096B:  e8 40 86 ff ff                  call     0x10018fb0  ; GW::GetCharContext
  10020970:  85 c0                           test     eax, eax
  10020972:  74 08                           je       0x1002097c
  10020974:  8b b0 a4 02 00 00               mov      esi, dword ptr [eax + 0x2a4]
  1002097A:  eb 02                           jmp      0x1002097e
  1002097C:  33 f6                           xor      esi, esi
  1002097E:  e8 1d 87 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  10020983:  85 c0                           test     eax, eax
  10020985:  74 34                           je       0x100209bb
  10020987:  05 0c 08 00 00                  add      eax, 0x80c
  1002098C:  83 38 00                        cmp      dword ptr [eax], 0
  1002098F:  74 2a                           je       0x100209bb
  10020991:  85 c0                           test     eax, eax
  10020993:  74 26                           je       0x100209bb
  10020995:  3b 70 08                        cmp      esi, dword ptr [eax + 8]
  10020998:  73 21                           jae      0x100209bb
  1002099A:  8d 0c b6                        lea      ecx, [esi + esi*4]
  1002099D:  c1 e1 04                        shl      ecx, 4
  100209A0:  03 08                           add      ecx, dword ptr [eax]
  100209A2:  74 17                           je       0x100209bb
  100209A4:  8b 41 24                        mov      eax, dword ptr [ecx + 0x24]
  100209A7:  6a 14                           push     0x14
  100209A9:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  100209AC:  83 c0 04                        add      eax, 4
  100209AF:  50                              push     eax
  100209B0:  e8 1b 0b 01 00                  call     0x100314d0
  100209B5:  83 c4 0c                        add      esp, 0xc
  100209B8:  5e                              pop      esi
  100209B9:  5d                              pop      ebp
  100209BA:  c3                              ret      
  100209BB:  33 c0                           xor      eax, eax
  100209BD:  5e                              pop      esi
  100209BE:  5d                              pop      ebp
  100209BF:  c3                              ret      


