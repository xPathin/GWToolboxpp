; Module: TradeMgr
; Functions: 7
; Total code size: 551 bytes
;

; === Trade::AcceptTrade, AcceptTrade ===
; RVA: 0x00024E20  Size: 28 bytes
; Exports: ?AcceptTrade@Trade@GW@@YA_NXZ, AcceptTrade
;
  10024E20:  68 48 3d 05 10                  push     0x10053d48
  10024E25:  e8 56 19 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  10024E2A:  6a 02                           push     2
  10024E2C:  50                              push     eax
  10024E2D:  e8 be 15 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  10024E32:  50                              push     eax
  10024E33:  e8 f8 11 00 00                  call     0x10026030  ; UI::ButtonClick, ButtonClick
  10024E38:  83 c4 10                        add      esp, 0x10
  10024E3B:  c3                              ret      


; === Trade::CancelTrade, CancelTrade ===
; RVA: 0x00024E40  Size: 61 bytes
; Exports: ?CancelTrade@Trade@GW@@YA_NXZ, CancelTrade
;
  10024E40:  56                              push     esi
  10024E41:  68 48 3d 05 10                  push     0x10053d48
  10024E46:  e8 35 19 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  10024E4B:  8b f0                           mov      esi, eax
  10024E4D:  6a 0d                           push     0xd
  10024E4F:  56                              push     esi
  10024E50:  e8 9b 15 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  10024E55:  50                              push     eax
  10024E56:  e8 d5 11 00 00                  call     0x10026030  ; UI::ButtonClick, ButtonClick
  10024E5B:  83 c4 10                        add      esp, 0x10
  10024E5E:  84 c0                           test     al, al
  10024E60:  75 17                           jne      0x10024e79
  10024E62:  6a 01                           push     1
  10024E64:  56                              push     esi
  10024E65:  e8 86 15 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  10024E6A:  50                              push     eax
  10024E6B:  e8 c0 11 00 00                  call     0x10026030  ; UI::ButtonClick, ButtonClick
  10024E70:  83 c4 0c                        add      esp, 0xc
  10024E73:  84 c0                           test     al, al
  10024E75:  75 02                           jne      0x10024e79
  10024E77:  5e                              pop      esi
  10024E78:  c3                              ret      
  10024E79:  b0 01                           mov      al, 1
  10024E7B:  5e                              pop      esi
  10024E7C:  c3                              ret      


; === Trade::ChangeOffer, Trade::SubmitOffer, ChangeOffer, SubmitOffer ===
; RVA: 0x00024E80  Size: 28 bytes
; Exports: ?ChangeOffer@Trade@GW@@YA_NXZ, ?SubmitOffer@Trade@GW@@YA_NI@Z, ChangeOffer, SubmitOffer
;
  10024E80:  68 48 3d 05 10                  push     0x10053d48
  10024E85:  e8 f6 18 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  10024E8A:  6a 00                           push     0
  10024E8C:  50                              push     eax
  10024E8D:  e8 5e 15 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  10024E92:  50                              push     eax
  10024E93:  e8 98 11 00 00                  call     0x10026030  ; UI::ButtonClick, ButtonClick
  10024E98:  83 c4 10                        add      esp, 0x10
  10024E9B:  c3                              ret      


; === Trade::IsItemOffered ===
; RVA: 0x00024EA0  Size: 144 bytes
; Exports: ?IsItemOffered@Trade@GW@@YAPAUTradeItem@2@I@Z
;
  10024EA0:  55                              push     ebp
  10024EA1:  8b ec                           mov      ebp, esp
  10024EA3:  53                              push     ebx
  10024EA4:  56                              push     esi
  10024EA5:  57                              push     edi
  10024EA6:  e8 d5 41 ff ff                  call     0x10019080
  10024EAB:  8b f8                           mov      edi, eax
  10024EAD:  85 ff                           test     edi, edi
  10024EAF:  74 4c                           je       0x10024efd
  10024EB1:  8b 47 1c                        mov      eax, dword ptr [edi + 0x1c]
  10024EB4:  33 f6                           xor      esi, esi
  10024EB6:  85 c0                           test     eax, eax
  10024EB8:  74 43                           je       0x10024efd
  10024EBA:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10024EBD:  0f 1f 00                        nop      dword ptr [eax]
  10024EC0:  83 7f 14 00                     cmp      dword ptr [edi + 0x14], 0
  10024EC4:  74 04                           je       0x10024eca
  10024EC6:  3b f0                           cmp      esi, eax
  10024EC8:  72 1c                           jb       0x10024ee6
  10024ECA:  68 74 3d 05 10                  push     0x10053d74  ; "GW::BaseArray<struct GW::TradeItem>::at"
  10024ECF:  6a 1e                           push     0x1e
  10024ED1:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  10024ED6:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  10024EDB:  e8 90 09 fe ff                  call     0x10005870  ; GW::FatalAssert
  10024EE0:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10024EE3:  83 c4 10                        add      esp, 0x10
  10024EE6:  8b 47 14                        mov      eax, dword ptr [edi + 0x14]
  10024EE9:  8d 1c f5 00 00 00 00            lea      ebx, [esi*8]
  10024EF0:  39 0c 03                        cmp      dword ptr [ebx + eax], ecx
  10024EF3:  74 0f                           je       0x10024f04
  10024EF5:  8b 47 1c                        mov      eax, dword ptr [edi + 0x1c]
  10024EF8:  46                              inc      esi
  10024EF9:  3b f0                           cmp      esi, eax
  10024EFB:  72 c3                           jb       0x10024ec0
  10024EFD:  5f                              pop      edi
  10024EFE:  5e                              pop      esi
  10024EFF:  33 c0                           xor      eax, eax
  10024F01:  5b                              pop      ebx
  10024F02:  5d                              pop      ebp
  10024F03:  c3                              ret      
  10024F04:  85 c0                           test     eax, eax
  10024F06:  74 05                           je       0x10024f0d
  10024F08:  3b 77 1c                        cmp      esi, dword ptr [edi + 0x1c]
  10024F0B:  72 19                           jb       0x10024f26
  10024F0D:  68 74 3d 05 10                  push     0x10053d74  ; "GW::BaseArray<struct GW::TradeItem>::at"
  10024F12:  6a 1e                           push     0x1e
  10024F14:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  10024F19:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  10024F1E:  e8 4d 09 fe ff                  call     0x10005870  ; GW::FatalAssert
  10024F23:  83 c4 10                        add      esp, 0x10
  10024F26:  8b 47 14                        mov      eax, dword ptr [edi + 0x14]
  10024F29:  5f                              pop      edi
  10024F2A:  5e                              pop      esi
  10024F2B:  03 c3                           add      eax, ebx
  10024F2D:  5b                              pop      ebx
  10024F2E:  5d                              pop      ebp
  10024F2F:  c3                              ret      


; === Trade::OfferItem ===
; RVA: 0x00024F30  Size: 139 bytes
; Exports: ?OfferItem@Trade@GW@@YA_NII@Z
;
  10024F30:  55                              push     ebp
  10024F31:  8b ec                           mov      ebp, esp
  10024F33:  83 ec 1c                        sub      esp, 0x1c
  10024F36:  e8 45 41 ff ff                  call     0x10019080
  10024F3B:  85 c0                           test     eax, eax
  10024F3D:  74 76                           je       0x10024fb5
  10024F3F:  83 38 01                        cmp      dword ptr [eax], 1
  10024F42:  75 71                           jne      0x10024fb5
  10024F44:  56                              push     esi
  10024F45:  68 5c 3d 05 10                  push     0x10053d5c
  10024F4A:  e8 31 18 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  10024F4F:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  10024F52:  8b f0                           mov      esi, eax
  10024F54:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  10024F57:  8d 45 f8                        lea      eax, [ebp - 8]
  10024F5A:  83 c4 04                        add      esp, 4
  10024F5D:  89 55 f8                        mov      dword ptr [ebp - 8], edx
  10024F60:  89 4d fc                        mov      dword ptr [ebp - 4], ecx
  10024F63:  c7 45 e4 00 00 00 00            mov      dword ptr [ebp - 0x1c], 0
  10024F6A:  c7 45 e8 02 00 00 00            mov      dword ptr [ebp - 0x18], 2
  10024F71:  c7 45 ec 07 00 00 00            mov      dword ptr [ebp - 0x14], 7
  10024F78:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  10024F7B:  c7 45 f4 00 00 00 00            mov      dword ptr [ebp - 0xc], 0
  10024F82:  85 f6                           test     esi, esi
  10024F84:  74 28                           je       0x10024fae
  10024F86:  52                              push     edx
  10024F87:  e8 14 ff ff ff                  call     0x10024ea0  ; Trade::IsItemOffered
  10024F8C:  83 c4 04                        add      esp, 4
  10024F8F:  85 c0                           test     eax, eax
  10024F91:  75 1b                           jne      0x10024fae
  10024F93:  50                              push     eax
  10024F94:  8d 45 e4                        lea      eax, [ebp - 0x1c]
  10024F97:  50                              push     eax
  10024F98:  6a 31                           push     0x31
  10024F9A:  56                              push     esi
  10024F9B:  e8 80 2f 00 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10024FA0:  83 c4 10                        add      esp, 0x10
  10024FA3:  84 c0                           test     al, al
  10024FA5:  74 07                           je       0x10024fae
  10024FA7:  b0 01                           mov      al, 1
  10024FA9:  5e                              pop      esi
  10024FAA:  8b e5                           mov      esp, ebp
  10024FAC:  5d                              pop      ebp
  10024FAD:  c3                              ret      
  10024FAE:  32 c0                           xor      al, al
  10024FB0:  5e                              pop      esi
  10024FB1:  8b e5                           mov      esp, ebp
  10024FB3:  5d                              pop      ebp
  10024FB4:  c3                              ret      
  10024FB5:  32 c0                           xor      al, al
  10024FB7:  8b e5                           mov      esp, ebp
  10024FB9:  5d                              pop      ebp
  10024FBA:  c3                              ret      


; === Trade::OpenTradeWindow, OpenTradeWindow ===
; RVA: 0x00024FC0  Size: 23 bytes
; Exports: ?OpenTradeWindow@Trade@GW@@YA_NI@Z, OpenTradeWindow
;
  10024FC0:  55                              push     ebp
  10024FC1:  8b ec                           mov      ebp, esp
  10024FC3:  6a 00                           push     0
  10024FC5:  ff 75 08                        push     dword ptr [ebp + 8]
  10024FC8:  68 b0 01 00 10                  push     0x100001b0
  10024FCD:  e8 fe 30 00 00                  call     0x100280d0  ; UI::SendUIMessage
  10024FD2:  83 c4 0c                        add      esp, 0xc
  10024FD5:  5d                              pop      ebp
  10024FD6:  c3                              ret      


; === Trade::RemoveItem ===
; RVA: 0x00024FE0  Size: 128 bytes
; Exports: ?RemoveItem@Trade@GW@@YA_NI@Z
;
  10024FE0:  55                              push     ebp
  10024FE1:  8b ec                           mov      ebp, esp
  10024FE3:  83 ec 14                        sub      esp, 0x14
  10024FE6:  e8 95 40 ff ff                  call     0x10019080
  10024FEB:  85 c0                           test     eax, eax
  10024FED:  74 6b                           je       0x1002505a
  10024FEF:  83 38 01                        cmp      dword ptr [eax], 1
  10024FF2:  75 66                           jne      0x1002505a
  10024FF4:  56                              push     esi
  10024FF5:  68 5c 3d 05 10                  push     0x10053d5c
  10024FFA:  e8 81 17 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  10024FFF:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10025002:  8b f0                           mov      esi, eax
  10025004:  83 c4 04                        add      esp, 4
  10025007:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  1002500E:  c7 45 f0 09 00 00 00            mov      dword ptr [ebp - 0x10], 9
  10025015:  c7 45 f4 07 00 00 00            mov      dword ptr [ebp - 0xc], 7
  1002501C:  89 4d f8                        mov      dword ptr [ebp - 8], ecx
  1002501F:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10025026:  85 f6                           test     esi, esi
  10025028:  74 29                           je       0x10025053
  1002502A:  51                              push     ecx
  1002502B:  e8 70 fe ff ff                  call     0x10024ea0  ; Trade::IsItemOffered
  10025030:  83 c4 04                        add      esp, 4
  10025033:  85 c0                           test     eax, eax
  10025035:  74 1c                           je       0x10025053
  10025037:  6a 00                           push     0
  10025039:  8d 45 ec                        lea      eax, [ebp - 0x14]
  1002503C:  50                              push     eax
  1002503D:  6a 31                           push     0x31
  1002503F:  56                              push     esi
  10025040:  e8 db 2e 00 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10025045:  83 c4 10                        add      esp, 0x10
  10025048:  84 c0                           test     al, al
  1002504A:  74 07                           je       0x10025053
  1002504C:  b0 01                           mov      al, 1
  1002504E:  5e                              pop      esi
  1002504F:  8b e5                           mov      esp, ebp
  10025051:  5d                              pop      ebp
  10025052:  c3                              ret      
  10025053:  32 c0                           xor      al, al
  10025055:  5e                              pop      esi
  10025056:  8b e5                           mov      esp, ebp
  10025058:  5d                              pop      ebp
  10025059:  c3                              ret      
  1002505A:  32 c0                           xor      al, al
  1002505C:  8b e5                           mov      esp, ebp
  1002505E:  5d                              pop      ebp
  1002505F:  c3                              ret      


