; Module: QuestMgr
; Functions: 11
; Total code size: 693 bytes
;

; === QuestMgr::AbandonQuest, AbandonQuest ===
; RVA: 0x00020C20  Size: 55 bytes
; Exports: ?AbandonQuest@QuestMgr@GW@@YA_NPAUQuest@2@@Z, AbandonQuest
;
  10020C20:  55                              push     ebp
  10020C21:  8b ec                           mov      ebp, esp
  10020C23:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10020C26:  56                              push     esi
  10020C27:  85 c0                           test     eax, eax
  10020C29:  74 27                           je       0x10020c52
  10020C2B:  83 3d 04 c4 08 10 00            cmp      dword ptr [0x1008c404], 0
  10020C32:  74 1e                           je       0x10020c52
  10020C34:  8b 30                           mov      esi, dword ptr [eax]
  10020C36:  56                              push     esi
  10020C37:  e8 c4 00 00 00                  call     0x10020d00  ; QuestMgr::GetQuest, GetQuest
  10020C3C:  83 c4 04                        add      esp, 4
  10020C3F:  85 c0                           test     eax, eax
  10020C41:  74 0f                           je       0x10020c52
  10020C43:  56                              push     esi
  10020C44:  ff 15 04 c4 08 10               call     dword ptr [0x1008c404]
  10020C4A:  83 c4 04                        add      esp, 4
  10020C4D:  b0 01                           mov      al, 1
  10020C4F:  5e                              pop      esi
  10020C50:  5d                              pop      ebp
  10020C51:  c3                              ret      
  10020C52:  32 c0                           xor      al, al
  10020C54:  5e                              pop      esi
  10020C55:  5d                              pop      ebp
  10020C56:  c3                              ret      


; === QuestMgr::AbandonQuestId, AbandonQuestId ===
; RVA: 0x00020C60  Size: 47 bytes
; Exports: ?AbandonQuestId@QuestMgr@GW@@YA_NW4QuestID@Constants@2@@Z, AbandonQuestId
;
  10020C60:  55                              push     ebp
  10020C61:  8b ec                           mov      ebp, esp
  10020C63:  83 3d 04 c4 08 10 00            cmp      dword ptr [0x1008c404], 0
  10020C6A:  74 1f                           je       0x10020c8b
  10020C6C:  ff 75 08                        push     dword ptr [ebp + 8]
  10020C6F:  e8 8c 00 00 00                  call     0x10020d00  ; QuestMgr::GetQuest, GetQuest
  10020C74:  83 c4 04                        add      esp, 4
  10020C77:  85 c0                           test     eax, eax
  10020C79:  74 10                           je       0x10020c8b
  10020C7B:  ff 75 08                        push     dword ptr [ebp + 8]
  10020C7E:  ff 15 04 c4 08 10               call     dword ptr [0x1008c404]
  10020C84:  83 c4 04                        add      esp, 4
  10020C87:  b0 01                           mov      al, 1
  10020C89:  5d                              pop      ebp
  10020C8A:  c3                              ret      
  10020C8B:  32 c0                           xor      al, al
  10020C8D:  5d                              pop      ebp
  10020C8E:  c3                              ret      


; === QuestMgr::GetActiveQuest ===
; RVA: 0x00020C90  Size: 79 bytes
; Exports: ?GetActiveQuest@QuestMgr@GW@@YAPAUQuest@2@XZ
;
  10020C90:  56                              push     esi
  10020C91:  e8 0a 84 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  10020C96:  85 c0                           test     eax, eax
  10020C98:  74 41                           je       0x10020cdb
  10020C9A:  8b b0 28 05 00 00               mov      esi, dword ptr [eax + 0x528]
  10020CA0:  85 f6                           test     esi, esi
  10020CA2:  74 37                           je       0x10020cdb
  10020CA4:  e8 f7 83 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  10020CA9:  85 c0                           test     eax, eax
  10020CAB:  74 2e                           je       0x10020cdb
  10020CAD:  83 b8 2c 05 00 00 00            cmp      dword ptr [eax + 0x52c], 0
  10020CB4:  8d 88 2c 05 00 00               lea      ecx, [eax + 0x52c]
  10020CBA:  74 1f                           je       0x10020cdb
  10020CBC:  85 c9                           test     ecx, ecx
  10020CBE:  74 1b                           je       0x10020cdb
  10020CC0:  8b 01                           mov      eax, dword ptr [ecx]
  10020CC2:  6b 49 08 34                     imul     ecx, dword ptr [ecx + 8], 0x34
  10020CC6:  03 c8                           add      ecx, eax
  10020CC8:  3b c1                           cmp      eax, ecx
  10020CCA:  74 0f                           je       0x10020cdb
  10020CCC:  0f 1f 40 00                     nop      dword ptr [eax]
  10020CD0:  39 30                           cmp      dword ptr [eax], esi
  10020CD2:  74 09                           je       0x10020cdd
  10020CD4:  83 c0 34                        add      eax, 0x34
  10020CD7:  3b c1                           cmp      eax, ecx
  10020CD9:  75 f5                           jne      0x10020cd0
  10020CDB:  33 c0                           xor      eax, eax
  10020CDD:  5e                              pop      esi
  10020CDE:  c3                              ret      


; === QuestMgr::GetActiveQuestId, GetActiveQuestId ===
; RVA: 0x00020CE0  Size: 19 bytes
; Exports: ?GetActiveQuestId@QuestMgr@GW@@YA?AW4QuestID@Constants@2@XZ, GetActiveQuestId
;
  10020CE0:  e8 bb 83 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  10020CE5:  85 c0                           test     eax, eax
  10020CE7:  74 07                           je       0x10020cf0
  10020CE9:  8b 80 28 05 00 00               mov      eax, dword ptr [eax + 0x528]
  10020CEF:  c3                              ret      
  10020CF0:  33 c0                           xor      eax, eax
  10020CF2:  c3                              ret      


; === QuestMgr::GetQuest, GetQuest ===
; RVA: 0x00020D00  Size: 67 bytes
; Exports: ?GetQuest@QuestMgr@GW@@YAPAUQuest@2@W4QuestID@Constants@2@@Z, GetQuest
;
  10020D00:  55                              push     ebp
  10020D01:  8b ec                           mov      ebp, esp
  10020D03:  56                              push     esi
  10020D04:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10020D07:  85 f6                           test     esi, esi
  10020D09:  74 33                           je       0x10020d3e
  10020D0B:  e8 90 83 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  10020D10:  85 c0                           test     eax, eax
  10020D12:  74 2a                           je       0x10020d3e
  10020D14:  83 b8 2c 05 00 00 00            cmp      dword ptr [eax + 0x52c], 0
  10020D1B:  8d 88 2c 05 00 00               lea      ecx, [eax + 0x52c]
  10020D21:  74 1b                           je       0x10020d3e
  10020D23:  85 c9                           test     ecx, ecx
  10020D25:  74 17                           je       0x10020d3e
  10020D27:  8b 01                           mov      eax, dword ptr [ecx]
  10020D29:  6b 49 08 34                     imul     ecx, dword ptr [ecx + 8], 0x34
  10020D2D:  03 c8                           add      ecx, eax
  10020D2F:  3b c1                           cmp      eax, ecx
  10020D31:  74 0b                           je       0x10020d3e
  10020D33:  39 30                           cmp      dword ptr [eax], esi
  10020D35:  74 09                           je       0x10020d40
  10020D37:  83 c0 34                        add      eax, 0x34
  10020D3A:  3b c1                           cmp      eax, ecx
  10020D3C:  75 f5                           jne      0x10020d33
  10020D3E:  33 c0                           xor      eax, eax
  10020D40:  5e                              pop      esi
  10020D41:  5d                              pop      ebp
  10020D42:  c3                              ret      


; === QuestMgr::GetQuestEntryGroupName ===
; RVA: 0x00020D50  Size: 178 bytes
; Exports: ?GetQuestEntryGroupName@QuestMgr@GW@@YA_NW4QuestID@Constants@2@PA_WI@Z
;
  10020D50:  55                              push     ebp
  10020D51:  8b ec                           mov      ebp, esp
  10020D53:  56                              push     esi
  10020D54:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10020D57:  85 f6                           test     esi, esi
  10020D59:  74 33                           je       0x10020d8e
  10020D5B:  e8 40 83 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  10020D60:  85 c0                           test     eax, eax
  10020D62:  74 2a                           je       0x10020d8e
  10020D64:  83 b8 2c 05 00 00 00            cmp      dword ptr [eax + 0x52c], 0
  10020D6B:  8d 88 2c 05 00 00               lea      ecx, [eax + 0x52c]
  10020D71:  74 1b                           je       0x10020d8e
  10020D73:  85 c9                           test     ecx, ecx
  10020D75:  74 17                           je       0x10020d8e
  10020D77:  8b 01                           mov      eax, dword ptr [ecx]
  10020D79:  6b 49 08 34                     imul     ecx, dword ptr [ecx + 8], 0x34
  10020D7D:  03 c8                           add      ecx, eax
  10020D7F:  3b c1                           cmp      eax, ecx
  10020D81:  74 0b                           je       0x10020d8e
  10020D83:  39 30                           cmp      dword ptr [eax], esi
  10020D85:  74 0c                           je       0x10020d93
  10020D87:  83 c0 34                        add      eax, 0x34
  10020D8A:  3b c1                           cmp      eax, ecx
  10020D8C:  75 f5                           jne      0x10020d83
  10020D8E:  32 c0                           xor      al, al
  10020D90:  5e                              pop      esi
  10020D91:  5d                              pop      ebp
  10020D92:  c3                              ret      
  10020D93:  85 c0                           test     eax, eax
  10020D95:  74 f7                           je       0x10020d8e
  10020D97:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  10020D9A:  85 c9                           test     ecx, ecx
  10020D9C:  74 f0                           je       0x10020d8e
  10020D9E:  8b 55 10                        mov      edx, dword ptr [ebp + 0x10]
  10020DA1:  85 d2                           test     edx, edx
  10020DA3:  74 e9                           je       0x10020d8e
  10020DA5:  8b 70 04                        mov      esi, dword ptr [eax + 4]
  10020DA8:  81 e6 f0 00 00 00               and      esi, 0xf0
  10020DAE:  74 31                           je       0x10020de1
  10020DB0:  83 fe 20                        cmp      esi, 0x20
  10020DB3:  74 14                           je       0x10020dc9
  10020DB5:  83 fe 40                        cmp      esi, 0x40
  10020DB8:  75 d4                           jne      0x10020d8e
  10020DBA:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  10020DBD:  85 c0                           test     eax, eax
  10020DBF:  74 cd                           je       0x10020d8e
  10020DC1:  50                              push     eax
  10020DC2:  68 c0 36 05 10                  push     0x100536c0
  10020DC7:  eb 25                           jmp      0x10020dee
  10020DC9:  68 bc 36 05 10                  push     0x100536bc
  10020DCE:  52                              push     edx
  10020DCF:  51                              push     ecx
  10020DD0:  e8 0b 49 fe ff                  call     0x100056e0
  10020DD5:  83 c4 0c                        add      esp, 0xc
  10020DD8:  83 f8 ff                        cmp      eax, -1
  10020DDB:  0f 95 c0                        setne    al
  10020DDE:  5e                              pop      esi
  10020DDF:  5d                              pop      ebp
  10020DE0:  c3                              ret      
  10020DE1:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  10020DE4:  85 c0                           test     eax, eax
  10020DE6:  74 a6                           je       0x10020d8e
  10020DE8:  50                              push     eax
  10020DE9:  68 d0 36 05 10                  push     0x100536d0
  10020DEE:  52                              push     edx
  10020DEF:  51                              push     ecx
  10020DF0:  e8 eb 48 fe ff                  call     0x100056e0
  10020DF5:  83 c4 10                        add      esp, 0x10
  10020DF8:  83 f8 ff                        cmp      eax, -1
  10020DFB:  74 91                           je       0x10020d8e
  10020DFD:  b0 01                           mov      al, 1
  10020DFF:  5e                              pop      esi
  10020E00:  5d                              pop      ebp
  10020E01:  c3                              ret      


; === QuestMgr::GetQuestLog ===
; RVA: 0x00020E10  Size: 22 bytes
; Exports: ?GetQuestLog@QuestMgr@GW@@YAPAV?$Array@UQuest@GW@@@2@XZ
;
  10020E10:  e8 8b 82 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  10020E15:  85 c0                           test     eax, eax
  10020E17:  74 0a                           je       0x10020e23
  10020E19:  05 2c 05 00 00                  add      eax, 0x52c
  10020E1E:  83 38 00                        cmp      dword ptr [eax], 0
  10020E21:  75 02                           jne      0x10020e25
  10020E23:  33 c0                           xor      eax, eax
  10020E25:  c3                              ret      


; === QuestMgr::RequestQuestInfo, RequestQuestInfo ===
; RVA: 0x00020F00  Size: 65 bytes
; Exports: ?RequestQuestInfo@QuestMgr@GW@@YA_NPBUQuest@2@_N@Z, RequestQuestInfo
;
  10020F00:  55                              push     ebp
  10020F01:  8b ec                           mov      ebp, esp
  10020F03:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10020F06:  56                              push     esi
  10020F07:  85 c0                           test     eax, eax
  10020F09:  74 31                           je       0x10020f3c
  10020F0B:  83 3d 0c c4 08 10 00            cmp      dword ptr [0x1008c40c], 0
  10020F12:  74 28                           je       0x10020f3c
  10020F14:  8b 30                           mov      esi, dword ptr [eax]
  10020F16:  56                              push     esi
  10020F17:  e8 e4 fd ff ff                  call     0x10020d00  ; QuestMgr::GetQuest, GetQuest
  10020F1C:  83 c4 04                        add      esp, 4
  10020F1F:  85 c0                           test     eax, eax
  10020F21:  74 19                           je       0x10020f3c
  10020F23:  56                              push     esi
  10020F24:  ff 15 0c c4 08 10               call     dword ptr [0x1008c40c]
  10020F2A:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10020F2D:  56                              push     esi
  10020F2E:  ff 15 10 c4 08 10               call     dword ptr [0x1008c410]
  10020F34:  83 c4 0c                        add      esp, 0xc
  10020F37:  b0 01                           mov      al, 1
  10020F39:  5e                              pop      esi
  10020F3A:  5d                              pop      ebp
  10020F3B:  c3                              ret      
  10020F3C:  32 c0                           xor      al, al
  10020F3E:  5e                              pop      esi
  10020F3F:  5d                              pop      ebp
  10020F40:  c3                              ret      


; === QuestMgr::RequestQuestInfoId, RequestQuestInfoId ===
; RVA: 0x00020F50  Size: 59 bytes
; Exports: ?RequestQuestInfoId@QuestMgr@GW@@YA_NW4QuestID@Constants@2@_N@Z, RequestQuestInfoId
;
  10020F50:  55                              push     ebp
  10020F51:  8b ec                           mov      ebp, esp
  10020F53:  83 3d 0c c4 08 10 00            cmp      dword ptr [0x1008c40c], 0
  10020F5A:  56                              push     esi
  10020F5B:  74 29                           je       0x10020f86
  10020F5D:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10020F60:  56                              push     esi
  10020F61:  e8 9a fd ff ff                  call     0x10020d00  ; QuestMgr::GetQuest, GetQuest
  10020F66:  83 c4 04                        add      esp, 4
  10020F69:  85 c0                           test     eax, eax
  10020F6B:  74 19                           je       0x10020f86
  10020F6D:  56                              push     esi
  10020F6E:  ff 15 0c c4 08 10               call     dword ptr [0x1008c40c]
  10020F74:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10020F77:  56                              push     esi
  10020F78:  ff 15 10 c4 08 10               call     dword ptr [0x1008c410]
  10020F7E:  83 c4 0c                        add      esp, 0xc
  10020F81:  b0 01                           mov      al, 1
  10020F83:  5e                              pop      esi
  10020F84:  5d                              pop      ebp
  10020F85:  c3                              ret      
  10020F86:  32 c0                           xor      al, al
  10020F88:  5e                              pop      esi
  10020F89:  5d                              pop      ebp
  10020F8A:  c3                              ret      


; === QuestMgr::SetActiveQuest, SetActiveQuest ===
; RVA: 0x00020F90  Size: 55 bytes
; Exports: ?SetActiveQuest@QuestMgr@GW@@YA_NPAUQuest@2@@Z, SetActiveQuest
;
  10020F90:  55                              push     ebp
  10020F91:  8b ec                           mov      ebp, esp
  10020F93:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10020F96:  56                              push     esi
  10020F97:  85 c0                           test     eax, eax
  10020F99:  74 27                           je       0x10020fc2
  10020F9B:  83 3d fc c3 08 10 00            cmp      dword ptr [0x1008c3fc], 0
  10020FA2:  74 1e                           je       0x10020fc2
  10020FA4:  8b 30                           mov      esi, dword ptr [eax]
  10020FA6:  56                              push     esi
  10020FA7:  e8 54 fd ff ff                  call     0x10020d00  ; QuestMgr::GetQuest, GetQuest
  10020FAC:  83 c4 04                        add      esp, 4
  10020FAF:  85 c0                           test     eax, eax
  10020FB1:  74 0f                           je       0x10020fc2
  10020FB3:  56                              push     esi
  10020FB4:  ff 15 fc c3 08 10               call     dword ptr [0x1008c3fc]
  10020FBA:  83 c4 04                        add      esp, 4
  10020FBD:  b0 01                           mov      al, 1
  10020FBF:  5e                              pop      esi
  10020FC0:  5d                              pop      ebp
  10020FC1:  c3                              ret      
  10020FC2:  32 c0                           xor      al, al
  10020FC4:  5e                              pop      esi
  10020FC5:  5d                              pop      ebp
  10020FC6:  c3                              ret      


; === QuestMgr::SetActiveQuestId, SetActiveQuestId ===
; RVA: 0x00020FD0  Size: 47 bytes
; Exports: ?SetActiveQuestId@QuestMgr@GW@@YA_NW4QuestID@Constants@2@@Z, SetActiveQuestId
;
  10020FD0:  55                              push     ebp
  10020FD1:  8b ec                           mov      ebp, esp
  10020FD3:  83 3d fc c3 08 10 00            cmp      dword ptr [0x1008c3fc], 0
  10020FDA:  74 1f                           je       0x10020ffb
  10020FDC:  ff 75 08                        push     dword ptr [ebp + 8]
  10020FDF:  e8 1c fd ff ff                  call     0x10020d00  ; QuestMgr::GetQuest, GetQuest
  10020FE4:  83 c4 04                        add      esp, 4
  10020FE7:  85 c0                           test     eax, eax
  10020FE9:  74 10                           je       0x10020ffb
  10020FEB:  ff 75 08                        push     dword ptr [ebp + 8]
  10020FEE:  ff 15 fc c3 08 10               call     dword ptr [0x1008c3fc]
  10020FF4:  83 c4 04                        add      esp, 4
  10020FF7:  b0 01                           mov      al, 1
  10020FF9:  5d                              pop      ebp
  10020FFA:  c3                              ret      
  10020FFB:  32 c0                           xor      al, al
  10020FFD:  5d                              pop      ebp
  10020FFE:  c3                              ret      


