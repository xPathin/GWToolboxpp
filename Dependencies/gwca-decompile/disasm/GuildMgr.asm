; Module: GuildMgr
; Functions: 10
; Total code size: 397 bytes
;

; === GuildMgr::GetCurrentGH ===
; RVA: 0x0001A5F0  Size: 83 bytes
; Exports: ?GetCurrentGH@GuildMgr@GW@@YAPAUGuild@2@XZ
;
  1001A5F0:  e8 ab 2f 00 00                  call     0x1001d5a0  ; Map::GetMapID, GetMapID
  1001A5F5:  50                              push     eax
  1001A5F6:  e8 c5 2f 00 00                  call     0x1001d5c0  ; Map::GetMapInfo, GetMapInfo
  1001A5FB:  83 c4 04                        add      esp, 4
  1001A5FE:  85 c0                           test     eax, eax
  1001A600:  74 3b                           je       0x1001a63d
  1001A602:  83 78 0c 04                     cmp      dword ptr [eax + 0xc], 4
  1001A606:  75 35                           jne      0x1001a63d
  1001A608:  e8 e3 e9 ff ff                  call     0x10018ff0  ; GW::GetGuildContext
  1001A60D:  85 c0                           test     eax, eax
  1001A60F:  74 2c                           je       0x1001a63d
  1001A611:  83 b8 f8 02 00 00 00            cmp      dword ptr [eax + 0x2f8], 0
  1001A618:  8d 88 f8 02 00 00               lea      ecx, [eax + 0x2f8]
  1001A61E:  74 1d                           je       0x1001a63d
  1001A620:  85 c9                           test     ecx, ecx
  1001A622:  74 19                           je       0x1001a63d
  1001A624:  8b 01                           mov      eax, dword ptr [ecx]
  1001A626:  8b 49 08                        mov      ecx, dword ptr [ecx + 8]
  1001A629:  8d 14 88                        lea      edx, [eax + ecx*4]
  1001A62C:  3b c2                           cmp      eax, edx
  1001A62E:  74 0d                           je       0x1001a63d
  1001A630:  8b 08                           mov      ecx, dword ptr [eax]
  1001A632:  85 c9                           test     ecx, ecx
  1001A634:  75 0a                           jne      0x1001a640
  1001A636:  83 c0 04                        add      eax, 4
  1001A639:  3b c2                           cmp      eax, edx
  1001A63B:  75 f3                           jne      0x1001a630
  1001A63D:  33 c0                           xor      eax, eax
  1001A63F:  c3                              ret      
  1001A640:  8b c1                           mov      eax, ecx
  1001A642:  c3                              ret      


; === GuildMgr::GetGuildArray ===
; RVA: 0x0001A650  Size: 22 bytes
; Exports: ?GetGuildArray@GuildMgr@GW@@YAPAV?$Array@PAUGuild@GW@@@2@XZ
;
  1001A650:  e8 9b e9 ff ff                  call     0x10018ff0  ; GW::GetGuildContext
  1001A655:  85 c0                           test     eax, eax
  1001A657:  74 0a                           je       0x1001a663
  1001A659:  05 f8 02 00 00                  add      eax, 0x2f8
  1001A65E:  83 38 00                        cmp      dword ptr [eax], 0
  1001A661:  75 02                           jne      0x1001a665
  1001A663:  33 c0                           xor      eax, eax
  1001A665:  c3                              ret      


; === GuildMgr::GetGuildInfo, GetGuildInfo ===
; RVA: 0x0001A670  Size: 45 bytes
; Exports: ?GetGuildInfo@GuildMgr@GW@@YAPAUGuild@2@I@Z, GetGuildInfo
;
  1001A670:  55                              push     ebp
  1001A671:  8b ec                           mov      ebp, esp
  1001A673:  e8 78 e9 ff ff                  call     0x10018ff0  ; GW::GetGuildContext
  1001A678:  85 c0                           test     eax, eax
  1001A67A:  74 1d                           je       0x1001a699
  1001A67C:  05 f8 02 00 00                  add      eax, 0x2f8
  1001A681:  83 38 00                        cmp      dword ptr [eax], 0
  1001A684:  74 13                           je       0x1001a699
  1001A686:  85 c0                           test     eax, eax
  1001A688:  74 0f                           je       0x1001a699
  1001A68A:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001A68D:  3b 48 08                        cmp      ecx, dword ptr [eax + 8]
  1001A690:  73 07                           jae      0x1001a699
  1001A692:  8b 00                           mov      eax, dword ptr [eax]
  1001A694:  8b 04 88                        mov      eax, dword ptr [eax + ecx*4]
  1001A697:  5d                              pop      ebp
  1001A698:  c3                              ret      
  1001A699:  33 c0                           xor      eax, eax
  1001A69B:  5d                              pop      ebp
  1001A69C:  c3                              ret      


; === GuildMgr::GetPlayerGuild, GetPlayerGuild ===
; RVA: 0x0001A6A0  Size: 56 bytes
; Exports: ?GetPlayerGuild@GuildMgr@GW@@YAPAUGuild@2@XZ, GetPlayerGuild
;
  1001A6A0:  56                              push     esi
  1001A6A1:  e8 4a e9 ff ff                  call     0x10018ff0  ; GW::GetGuildContext
  1001A6A6:  85 c0                           test     eax, eax
  1001A6A8:  74 05                           je       0x1001a6af
  1001A6AA:  8b 70 60                        mov      esi, dword ptr [eax + 0x60]
  1001A6AD:  eb 02                           jmp      0x1001a6b1
  1001A6AF:  33 f6                           xor      esi, esi
  1001A6B1:  e8 3a e9 ff ff                  call     0x10018ff0  ; GW::GetGuildContext
  1001A6B6:  85 c0                           test     eax, eax
  1001A6B8:  74 1a                           je       0x1001a6d4
  1001A6BA:  05 f8 02 00 00                  add      eax, 0x2f8
  1001A6BF:  83 38 00                        cmp      dword ptr [eax], 0
  1001A6C2:  74 10                           je       0x1001a6d4
  1001A6C4:  85 c0                           test     eax, eax
  1001A6C6:  74 0c                           je       0x1001a6d4
  1001A6C8:  3b 70 08                        cmp      esi, dword ptr [eax + 8]
  1001A6CB:  73 07                           jae      0x1001a6d4
  1001A6CD:  8b 00                           mov      eax, dword ptr [eax]
  1001A6CF:  8b 04 b0                        mov      eax, dword ptr [eax + esi*4]
  1001A6D2:  5e                              pop      esi
  1001A6D3:  c3                              ret      
  1001A6D4:  33 c0                           xor      eax, eax
  1001A6D6:  5e                              pop      esi
  1001A6D7:  c3                              ret      


; === GuildMgr::GetPlayerGuildAnnouncement, GetPlayerGuildAnnouncement ===
; RVA: 0x0001A6E0  Size: 15 bytes
; Exports: ?GetPlayerGuildAnnouncement@GuildMgr@GW@@YAPA_WXZ, GetPlayerGuildAnnouncement
;
  1001A6E0:  e8 0b e9 ff ff                  call     0x10018ff0  ; GW::GetGuildContext
  1001A6E5:  8d 48 78                        lea      ecx, [eax + 0x78]
  1001A6E8:  f7 d8                           neg      eax
  1001A6EA:  1b c0                           sbb      eax, eax
  1001A6EC:  23 c1                           and      eax, ecx
  1001A6EE:  c3                              ret      


; === GuildMgr::GetPlayerGuildAnnouncer, GetPlayerGuildAnnouncer ===
; RVA: 0x0001A6F0  Size: 18 bytes
; Exports: ?GetPlayerGuildAnnouncer@GuildMgr@GW@@YAPA_WXZ, GetPlayerGuildAnnouncer
;
  1001A6F0:  e8 fb e8 ff ff                  call     0x10018ff0  ; GW::GetGuildContext
  1001A6F5:  8d 88 78 02 00 00               lea      ecx, [eax + 0x278]
  1001A6FB:  f7 d8                           neg      eax
  1001A6FD:  1b c0                           sbb      eax, eax
  1001A6FF:  23 c1                           and      eax, ecx
  1001A701:  c3                              ret      


; === GuildMgr::GetPlayerGuildIndex, GetPlayerGuildIndex ===
; RVA: 0x0001A710  Size: 34 bytes
; Exports: ?GetPlayerGuildIndex@GuildMgr@GW@@YAIXZ, GetPlayerGuildIndex
;
  1001A710:  e8 db e8 ff ff                  call     0x10018ff0  ; GW::GetGuildContext
  1001A715:  85 c0                           test     eax, eax
  1001A717:  74 04                           je       0x1001a71d
  1001A719:  8b 40 60                        mov      eax, dword ptr [eax + 0x60]
  1001A71C:  c3                              ret      
  1001A71D:  33 c0                           xor      eax, eax
  1001A71F:  c3                              ret      
  1001A720:  6a 00                           push     0
  1001A722:  6a 00                           push     0
  1001A724:  68 81 01 00 10                  push     0x10000181
  1001A729:  e8 a2 d9 00 00                  call     0x100280d0  ; UI::SendUIMessage
  1001A72E:  83 c4 0c                        add      esp, 0xc
  1001A731:  c3                              ret      


; === GuildMgr::LeaveGH, LeaveGH ===
; RVA: 0x0001A720  Size: 18 bytes
; Exports: ?LeaveGH@GuildMgr@GW@@YA_NXZ, LeaveGH
;
  1001A720:  6a 00                           push     0
  1001A722:  6a 00                           push     0
  1001A724:  68 81 01 00 10                  push     0x10000181
  1001A729:  e8 a2 d9 00 00                  call     0x100280d0  ; UI::SendUIMessage
  1001A72E:  83 c4 0c                        add      esp, 0xc
  1001A731:  c3                              ret      


; === GuildMgr::TravelGH ===
; RVA: 0x0001A740  Size: 24 bytes
; Exports: ?TravelGH@GuildMgr@GW@@YA_NUGHKey@2@@Z
;
  1001A740:  55                              push     ebp
  1001A741:  8b ec                           mov      ebp, esp
  1001A743:  6a 00                           push     0
  1001A745:  8d 45 08                        lea      eax, [ebp + 8]
  1001A748:  50                              push     eax
  1001A749:  68 7f 01 00 10                  push     0x1000017f
  1001A74E:  e8 7d d9 00 00                  call     0x100280d0  ; UI::SendUIMessage
  1001A753:  83 c4 0c                        add      esp, 0xc
  1001A756:  5d                              pop      ebp
  1001A757:  c3                              ret      


; === GuildMgr::TravelGH, TravelGH ===
; RVA: 0x0001A760  Size: 82 bytes
; Exports: ?TravelGH@GuildMgr@GW@@YA_NXZ, TravelGH
;
  1001A760:  55                              push     ebp
  1001A761:  8b ec                           mov      ebp, esp
  1001A763:  83 ec 14                        sub      esp, 0x14
  1001A766:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1001A76B:  33 c5                           xor      eax, ebp
  1001A76D:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001A770:  e8 7b e8 ff ff                  call     0x10018ff0  ; GW::GetGuildContext
  1001A775:  85 c0                           test     eax, eax
  1001A777:  74 29                           je       0x1001a7a2
  1001A779:  0f 10 40 64                     movups   xmm0, xmmword ptr [eax + 0x64]
  1001A77D:  6a 00                           push     0
  1001A77F:  8d 45 ec                        lea      eax, [ebp - 0x14]
  1001A782:  50                              push     eax
  1001A783:  68 7f 01 00 10                  push     0x1000017f
  1001A788:  0f 11 45 ec                     movups   xmmword ptr [ebp - 0x14], xmm0
  1001A78C:  e8 3f d9 00 00                  call     0x100280d0  ; UI::SendUIMessage
  1001A791:  83 c4 0c                        add      esp, 0xc
  1001A794:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001A797:  33 cd                           xor      ecx, ebp
  1001A799:  e8 19 1c 01 00                  call     0x1002c3b7
  1001A79E:  8b e5                           mov      esp, ebp
  1001A7A0:  5d                              pop      ebp
  1001A7A1:  c3                              ret      
  1001A7A2:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001A7A5:  32 c0                           xor      al, al
  1001A7A7:  33 cd                           xor      ecx, ebp
  1001A7A9:  e8 09 1c 01 00                  call     0x1002c3b7
  1001A7AE:  8b e5                           mov      esp, ebp
  1001A7B0:  5d                              pop      ebp
  1001A7B1:  c3                              ret      


