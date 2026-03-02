; Module: UIMgr
; Functions: 64
; Total code size: 12968 bytes
;

; === UI::SetFrameMargins ===
; RVA: 0x00017800  Size: 51 bytes
; Exports: ?SetFrameMargins@UI@GW@@YA_NPAUFrame@12@IQAM1I@Z
;
  10017800:  55                              push     ebp
  10017801:  8b ec                           mov      ebp, esp
  10017803:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10017806:  85 c0                           test     eax, eax
  10017808:  74 25                           je       0x1001782f
  1001780A:  8b 0d e0 c1 08 10               mov      ecx, dword ptr [0x1008c1e0]
  10017810:  85 c9                           test     ecx, ecx
  10017812:  74 1b                           je       0x1001782f
  10017814:  ff 75 18                        push     dword ptr [ebp + 0x18]
  10017817:  ff 75 14                        push     dword ptr [ebp + 0x14]
  1001781A:  ff 75 10                        push     dword ptr [ebp + 0x10]
  1001781D:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10017820:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  10017826:  ff d1                           call     ecx
  10017828:  83 c4 14                        add      esp, 0x14
  1001782B:  b0 01                           mov      al, 1
  1001782D:  5d                              pop      ebp
  1001782E:  c3                              ret      
  1001782F:  32 c0                           xor      al, al
  10017831:  5d                              pop      ebp
  10017832:  c3                              ret      


; === UI::AddFrameUIInteractionCallback ===
; RVA: 0x00025BE0  Size: 50 bytes
; Exports: ?AddFrameUIInteractionCallback@UI@GW@@YA_NPAUFrame@12@P6AXPAUInteractionMessage@12@PAX2@Z2@Z
;
  10025BE0:  55                              push     ebp
  10025BE1:  8b ec                           mov      ebp, esp
  10025BE3:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10025BE6:  85 c0                           test     eax, eax
  10025BE8:  74 24                           je       0x10025c0e
  10025BEA:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  10025BED:  85 c9                           test     ecx, ecx
  10025BEF:  74 1d                           je       0x10025c0e
  10025BF1:  8b 15 44 c5 08 10               mov      edx, dword ptr [0x1008c544]
  10025BF7:  85 d2                           test     edx, edx
  10025BF9:  74 13                           je       0x10025c0e
  10025BFB:  ff 75 10                        push     dword ptr [ebp + 0x10]
  10025BFE:  51                              push     ecx
  10025BFF:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  10025C05:  ff d2                           call     edx
  10025C07:  83 c4 0c                        add      esp, 0xc
  10025C0A:  b0 01                           mov      al, 1
  10025C0C:  5d                              pop      ebp
  10025C0D:  c3                              ret      
  10025C0E:  32 c0                           xor      al, al
  10025C10:  5d                              pop      ebp
  10025C11:  c3                              ret      


; === UI::AsyncDecodeStr ===
; RVA: 0x00025E00  Size: 557 bytes
; Exports: ?AsyncDecodeStr@UI@GW@@YAXPB_WP6AXPAX0@Z1W4Language@Constants@2@@Z
;
  10025E00:  55                              push     ebp
  10025E01:  8b ec                           mov      ebp, esp
  10025E03:  6a ff                           push     -1
  10025E05:  68 6d b3 04 10                  push     0x1004b36d
  10025E0A:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  10025E10:  50                              push     eax
  10025E11:  83 ec 30                        sub      esp, 0x30
  10025E14:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  10025E19:  33 c5                           xor      eax, ebp
  10025E1B:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  10025E1E:  56                              push     esi
  10025E1F:  57                              push     edi
  10025E20:  50                              push     eax
  10025E21:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10025E24:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  10025E2A:  83 3d 74 c5 08 10 00            cmp      dword ptr [0x1008c574], 0
  10025E31:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10025E34:  8b 4d 10                        mov      ecx, dword ptr [ebp + 0x10]
  10025E37:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  10025E3A:  89 45 c4                        mov      dword ptr [ebp - 0x3c], eax
  10025E3D:  89 4d c8                        mov      dword ptr [ebp - 0x38], ecx
  10025E40:  0f 84 7a 01 00 00               je       0x10025fc0
  10025E46:  85 ff                           test     edi, edi
  10025E48:  0f 84 72 01 00 00               je       0x10025fc0
  10025E4E:  8b cf                           mov      ecx, edi
  10025E50:  8d 51 02                        lea      edx, [ecx + 2]
  10025E53:  66 8b 01                        mov      ax, word ptr [ecx]
  10025E56:  83 c1 02                        add      ecx, 2
  10025E59:  66 85 c0                        test     ax, ax
  10025E5C:  75 f5                           jne      0x10025e53
  10025E5E:  2b ca                           sub      ecx, edx
  10025E60:  89 7d cc                        mov      dword ptr [ebp - 0x34], edi
  10025E63:  d1 f9                           sar      ecx, 1
  10025E65:  8d 45 cc                        lea      eax, [ebp - 0x34]
  10025E68:  41                              inc      ecx
  10025E69:  8d 34 4f                        lea      esi, [edi + ecx*2]
  10025E6C:  56                              push     esi
  10025E6D:  50                              push     eax
  10025E6E:  e8 ed 02 00 00                  call     0x10026160
  10025E73:  83 c4 08                        add      esp, 8
  10025E76:  84 c0                           test     al, al
  10025E78:  74 4a                           je       0x10025ec4
  10025E7A:  39 75 cc                        cmp      dword ptr [ebp - 0x34], esi
  10025E7D:  75 45                           jne      0x10025ec4
  10025E7F:  e8 4c 31 ff ff                  call     0x10018fd0  ; GW::GetGameContext
  10025E84:  8b f0                           mov      esi, eax
  10025E86:  8b 46 18                        mov      eax, dword ptr [esi + 0x18]
  10025E89:  8b 88 d0 01 00 00               mov      ecx, dword ptr [eax + 0x1d0]
  10025E8F:  89 4d cc                        mov      dword ptr [ebp - 0x34], ecx
  10025E92:  8b 4d 14                        mov      ecx, dword ptr [ebp + 0x14]
  10025E95:  81 f9 ff 00 00 00               cmp      ecx, 0xff
  10025E9B:  74 06                           je       0x10025ea3
  10025E9D:  89 88 d0 01 00 00               mov      dword ptr [eax + 0x1d0], ecx
  10025EA3:  ff 75 c8                        push     dword ptr [ebp - 0x38]
  10025EA6:  ff 75 c4                        push     dword ptr [ebp - 0x3c]
  10025EA9:  57                              push     edi
  10025EAA:  ff 15 74 c5 08 10               call     dword ptr [0x1008c574]
  10025EB0:  8b 46 18                        mov      eax, dword ptr [esi + 0x18]
  10025EB3:  83 c4 0c                        add      esp, 0xc
  10025EB6:  8b 4d cc                        mov      ecx, dword ptr [ebp - 0x34]
  10025EB9:  89 88 d0 01 00 00               mov      dword ptr [eax + 0x1d0], ecx
  10025EBF:  e9 07 01 00 00                  jmp      0x10025fcb
  10025EC4:  8d 45 cc                        lea      eax, [ebp - 0x34]
  10025EC7:  c7 45 e0 00 00 00 00            mov      dword ptr [ebp - 0x20], 0
  10025ECE:  50                              push     eax
  10025ECF:  8d 45 d0                        lea      eax, [ebp - 0x30]
  10025ED2:  c7 45 e4 00 00 00 00            mov      dword ptr [ebp - 0x1c], 0
  10025ED9:  0f 57 c0                        xorps    xmm0, xmm0
  10025EDC:  c7 45 cc 1f 00 00 00            mov      dword ptr [ebp - 0x34], 0x1f
  10025EE3:  50                              push     eax
  10025EE4:  0f 11 45 d0                     movups   xmmword ptr [ebp - 0x30], xmm0
  10025EE8:  e8 43 18 fe ff                  call     0x10007730
  10025EED:  0f 10 05 28 43 05 10            movups   xmm0, xmmword ptr [0x10054328]  ; "Invalid enc str: "
  10025EF4:  8b 4d cc                        mov      ecx, dword ptr [ebp - 0x34]
  10025EF7:  83 c4 08                        add      esp, 8
  10025EFA:  89 4d e4                        mov      dword ptr [ebp - 0x1c], ecx
  10025EFD:  89 45 d0                        mov      dword ptr [ebp - 0x30], eax
  10025F00:  c7 45 e0 11 00 00 00            mov      dword ptr [ebp - 0x20], 0x11
  10025F07:  0f 11 00                        movups   xmmword ptr [eax], xmm0
  10025F0A:  8a 0d 38 43 05 10               mov      cl, byte ptr [0x10054338]
  10025F10:  88 48 10                        mov      byte ptr [eax + 0x10], cl
  10025F13:  c6 40 11 00                     mov      byte ptr [eax + 0x11], 0
  10025F17:  8b cf                           mov      ecx, edi
  10025F19:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10025F20:  33 f6                           xor      esi, esi
  10025F22:  8d 51 02                        lea      edx, [ecx + 2]
  10025F25:  66 8b 01                        mov      ax, word ptr [ecx]
  10025F28:  83 c1 02                        add      ecx, 2
  10025F2B:  66 85 c0                        test     ax, ax
  10025F2E:  75 f5                           jne      0x10025f25
  10025F30:  2b ca                           sub      ecx, edx
  10025F32:  d1 f9                           sar      ecx, 1
  10025F34:  74 4d                           je       0x10025f83
  10025F36:  0f b7 04 77                     movzx    eax, word ptr [edi + esi*2]
  10025F3A:  50                              push     eax
  10025F3B:  68 3c 43 05 10                  push     0x1005433c  ; " %#06x"
  10025F40:  8d 45 e8                        lea      eax, [ebp - 0x18]
  10025F43:  6a 08                           push     8
  10025F45:  50                              push     eax
  10025F46:  e8 65 3f 00 00                  call     0x10029eb0
  10025F4B:  8d 4d e8                        lea      ecx, [ebp - 0x18]
  10025F4E:  83 c4 10                        add      esp, 0x10
  10025F51:  8d 51 01                        lea      edx, [ecx + 1]
  10025F54:  8a 01                           mov      al, byte ptr [ecx]
  10025F56:  41                              inc      ecx
  10025F57:  84 c0                           test     al, al
  10025F59:  75 f9                           jne      0x10025f54
  10025F5B:  2b ca                           sub      ecx, edx
  10025F5D:  8d 45 e8                        lea      eax, [ebp - 0x18]
  10025F60:  51                              push     ecx
  10025F61:  50                              push     eax
  10025F62:  8d 4d d0                        lea      ecx, [ebp - 0x30]
  10025F65:  e8 06 37 00 00                  call     0x10029670
  10025F6A:  8b c7                           mov      eax, edi
  10025F6C:  46                              inc      esi
  10025F6D:  8d 50 02                        lea      edx, [eax + 2]
  10025F70:  66 8b 08                        mov      cx, word ptr [eax]
  10025F73:  83 c0 02                        add      eax, 2
  10025F76:  66 85 c9                        test     cx, cx
  10025F79:  75 f5                           jne      0x10025f70
  10025F7B:  2b c2                           sub      eax, edx
  10025F7D:  d1 f8                           sar      eax, 1
  10025F7F:  3b f0                           cmp      esi, eax
  10025F81:  72 b3                           jb       0x10025f36
  10025F83:  68 44 43 05 10                  push     0x10054344
  10025F88:  ff 75 c8                        push     dword ptr [ebp - 0x38]
  10025F8B:  ff 55 c4                        call     dword ptr [ebp - 0x3c]
  10025F8E:  8b 4d e4                        mov      ecx, dword ptr [ebp - 0x1c]
  10025F91:  83 c4 08                        add      esp, 8
  10025F94:  83 f9 0f                        cmp      ecx, 0xf
  10025F97:  76 32                           jbe      0x10025fcb
  10025F99:  8b 55 d0                        mov      edx, dword ptr [ebp - 0x30]
  10025F9C:  41                              inc      ecx
  10025F9D:  8b c2                           mov      eax, edx
  10025F9F:  81 f9 00 10 00 00               cmp      ecx, 0x1000
  10025FA5:  72 10                           jb       0x10025fb7
  10025FA7:  8b 50 fc                        mov      edx, dword ptr [eax - 4]
  10025FAA:  83 c1 23                        add      ecx, 0x23
  10025FAD:  2b c2                           sub      eax, edx
  10025FAF:  83 c0 fc                        add      eax, -4
  10025FB2:  83 f8 1f                        cmp      eax, 0x1f
  10025FB5:  77 2f                           ja       0x10025fe6
  10025FB7:  51                              push     ecx
  10025FB8:  52                              push     edx
  10025FB9:  e8 cf 60 00 00                  call     0x1002c08d
  10025FBE:  eb 08                           jmp      0x10025fc8
  10025FC0:  68 50 34 05 10                  push     0x10053450
  10025FC5:  51                              push     ecx
  10025FC6:  ff d0                           call     eax
  10025FC8:  83 c4 08                        add      esp, 8
  10025FCB:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  10025FCE:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  10025FD5:  59                              pop      ecx
  10025FD6:  5f                              pop      edi
  10025FD7:  5e                              pop      esi
  10025FD8:  8b 4d f0                        mov      ecx, dword ptr [ebp - 0x10]
  10025FDB:  33 cd                           xor      ecx, ebp
  10025FDD:  e8 d5 63 00 00                  call     0x1002c3b7
  10025FE2:  8b e5                           mov      esp, ebp
  10025FE4:  5d                              pop      ebp
  10025FE5:  c3                              ret      
  10025FE6:  6a 00                           push     0
  10025FE8:  6a 00                           push     0
  10025FEA:  6a 00                           push     0
  10025FEC:  6a 00                           push     0
  10025FEE:  6a 00                           push     0
  10025FF0:  e8 da ae 00 00                  call     0x10030ecf
  10025FF5:  cc                              int3     
  10025FF6:  cc                              int3     
  10025FF7:  cc                              int3     
  10025FF8:  cc                              int3     
  10025FF9:  cc                              int3     
  10025FFA:  cc                              int3     
  10025FFB:  cc                              int3     
  10025FFC:  cc                              int3     
  10025FFD:  cc                              int3     
  10025FFE:  cc                              int3     
  10025FFF:  cc                              int3     
  10026000:  55                              push     ebp
  10026001:  8b ec                           mov      ebp, esp
  10026003:  6a 08                           push     8
  10026005:  e8 53 60 00 00                  call     0x1002c05d
  1002600A:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  1002600D:  68 ff 00 00 00                  push     0xff
  10026012:  50                              push     eax
  10026013:  68 00 5b 02 10                  push     0x10025b00
  10026018:  ff 75 08                        push     dword ptr [ebp + 8]
  1002601B:  89 08                           mov      dword ptr [eax], ecx
  1002601D:  8b 4d 10                        mov      ecx, dword ptr [ebp + 0x10]
  10026020:  89 48 04                        mov      dword ptr [eax + 4], ecx
  10026023:  e8 d8 fd ff ff                  call     0x10025e00  ; UI::AsyncDecodeStr
  10026028:  83 c4 14                        add      esp, 0x14
  1002602B:  5d                              pop      ebp
  1002602C:  c3                              ret      


; === UI::AsyncDecodeStr ===
; RVA: 0x00026000  Size: 45 bytes
; Exports: ?AsyncDecodeStr@UI@GW@@YAXPB_WPA_WI@Z
;
  10026000:  55                              push     ebp
  10026001:  8b ec                           mov      ebp, esp
  10026003:  6a 08                           push     8
  10026005:  e8 53 60 00 00                  call     0x1002c05d
  1002600A:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  1002600D:  68 ff 00 00 00                  push     0xff
  10026012:  50                              push     eax
  10026013:  68 00 5b 02 10                  push     0x10025b00
  10026018:  ff 75 08                        push     dword ptr [ebp + 8]
  1002601B:  89 08                           mov      dword ptr [eax], ecx
  1002601D:  8b 4d 10                        mov      ecx, dword ptr [ebp + 0x10]
  10026020:  89 48 04                        mov      dword ptr [eax + 4], ecx
  10026023:  e8 d8 fd ff ff                  call     0x10025e00  ; UI::AsyncDecodeStr
  10026028:  83 c4 14                        add      esp, 0x14
  1002602B:  5d                              pop      ebp
  1002602C:  c3                              ret      


; === UI::ButtonClick, ButtonClick ===
; RVA: 0x00026030  Size: 20 bytes
; Exports: ?ButtonClick@UI@GW@@YA_NPAUFrame@12@@Z, ButtonClick
;
  10026030:  55                              push     ebp
  10026031:  8b ec                           mov      ebp, esp
  10026033:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10026036:  85 c9                           test     ecx, ecx
  10026038:  74 06                           je       0x10026040
  1002603A:  5d                              pop      ebp
  1002603B:  e9 00 07 ff ff                  jmp      0x10016740
  10026040:  32 c0                           xor      al, al
  10026042:  5d                              pop      ebp
  10026043:  c3                              ret      


; === UI::CreateUIComponent ===
; RVA: 0x00026050  Size: 19 bytes
; Exports: ?CreateUIComponent@UI@GW@@YAIIIIP6AXPAUInteractionMessage@12@PAX1@Z1PB_W@Z
;
  10026050:  55                              push     ebp
  10026051:  8b ec                           mov      ebp, esp
  10026053:  a1 3c c5 08 10                  mov      eax, dword ptr [0x1008c53c]
  10026058:  85 c0                           test     eax, eax
  1002605A:  74 03                           je       0x1002605f
  1002605C:  5d                              pop      ebp
  1002605D:  ff e0                           jmp      eax
  1002605F:  33 c0                           xor      eax, eax
  10026061:  5d                              pop      ebp
  10026062:  c3                              ret      


; === UI::Default_UICallback ===
; RVA: 0x00026070  Size: 34 bytes
; Exports: ?Default_UICallback@UI@GW@@YA_NPAUInteractionMessage@12@PAX1@Z
;
  10026070:  55                              push     ebp
  10026071:  8b ec                           mov      ebp, esp
  10026073:  a1 04 c5 08 10                  mov      eax, dword ptr [0x1008c504]
  10026078:  85 c0                           test     eax, eax
  1002607A:  74 12                           je       0x1002608e
  1002607C:  ff 75 10                        push     dword ptr [ebp + 0x10]
  1002607F:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10026082:  ff 75 08                        push     dword ptr [ebp + 8]
  10026085:  ff d0                           call     eax
  10026087:  83 c4 0c                        add      esp, 0xc
  1002608A:  b0 01                           mov      al, 1
  1002608C:  5d                              pop      ebp
  1002608D:  c3                              ret      
  1002608E:  32 c0                           xor      al, al
  10026090:  5d                              pop      ebp
  10026091:  c3                              ret      


; === UI::DestroyUIComponent ===
; RVA: 0x000260A0  Size: 39 bytes
; Exports: ?DestroyUIComponent@UI@GW@@YA_NPAUFrame@12@@Z
;
  100260A0:  55                              push     ebp
  100260A1:  8b ec                           mov      ebp, esp
  100260A3:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100260A6:  85 c0                           test     eax, eax
  100260A8:  74 19                           je       0x100260c3
  100260AA:  8b 0d 48 c5 08 10               mov      ecx, dword ptr [0x1008c548]
  100260B0:  85 c9                           test     ecx, ecx
  100260B2:  74 0f                           je       0x100260c3
  100260B4:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  100260BA:  ff d1                           call     ecx
  100260BC:  83 c4 04                        add      esp, 4
  100260BF:  b0 01                           mov      al, 1
  100260C1:  5d                              pop      ebp
  100260C2:  c3                              ret      
  100260C3:  32 c0                           xor      al, al
  100260C5:  5d                              pop      ebp
  100260C6:  c3                              ret      


; === UI::DrawOnCompass ===
; RVA: 0x000260D0  Size: 34 bytes
; Exports: ?DrawOnCompass@UI@GW@@YA_NIIPAUCompassPoint@12@@Z
;
  100260D0:  55                              push     ebp
  100260D1:  8b ec                           mov      ebp, esp
  100260D3:  a1 5c c5 08 10                  mov      eax, dword ptr [0x1008c55c]
  100260D8:  85 c0                           test     eax, eax
  100260DA:  75 04                           jne      0x100260e0
  100260DC:  32 c0                           xor      al, al
  100260DE:  5d                              pop      ebp
  100260DF:  c3                              ret      
  100260E0:  ff 75 10                        push     dword ptr [ebp + 0x10]
  100260E3:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  100260E6:  ff 75 08                        push     dword ptr [ebp + 8]
  100260E9:  ff d0                           call     eax
  100260EB:  83 c4 0c                        add      esp, 0xc
  100260EE:  b0 01                           mov      al, 1
  100260F0:  5d                              pop      ebp
  100260F1:  c3                              ret      


; === UI::EncStrToUInt32 ===
; RVA: 0x00026100  Size: 92 bytes
; Exports: ?EncStrToUInt32@UI@GW@@YAIPB_W@Z
;
  10026100:  55                              push     ebp
  10026101:  8b ec                           mov      ebp, esp
  10026103:  53                              push     ebx
  10026104:  56                              push     esi
  10026105:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10026108:  bb 00 01 00 00                  mov      ebx, 0x100
  1002610D:  57                              push     edi
  1002610E:  33 ff                           xor      edi, edi
  10026110:  66 39 1e                        cmp      word ptr [esi], bx
  10026113:  73 1c                           jae      0x10026131
  10026115:  68 4c 43 05 10                  push     0x1005434c  ; "GW::UI::EncStrToUInt32"
  1002611A:  68 56 05 00 00                  push     0x556
  1002611F:  68 30 42 05 10                  push     0x10054230  ; "C:\GitRepositories\GWCA\Source\UIMgr.cpp"
  10026124:  68 64 43 05 10                  push     0x10054364  ; "*enc_str >= WORD_VALUE_BASE"
  10026129:  e8 42 f7 fd ff                  call     0x10005870  ; GW::FatalAssert
  1002612E:  83 c4 10                        add      esp, 0x10
  10026131:  0f b7 16                        movzx    edx, word ptr [esi]
  10026134:  83 c6 02                        add      esi, 2
  10026137:  69 cf 00 7f 00 00               imul     ecx, edi, 0x7f00
  1002613D:  8b fa                           mov      edi, edx
  1002613F:  81 e7 ff 7f ff ff               and      edi, 0xffff7fff
  10026145:  81 c7 00 ff ff ff               add      edi, 0xffffff00
  1002614B:  03 f9                           add      edi, ecx
  1002614D:  f7 c2 00 80 00 00               test     edx, 0x8000
  10026153:  75 bb                           jne      0x10026110
  10026155:  8b c7                           mov      eax, edi
  10026157:  5f                              pop      edi
  10026158:  5e                              pop      esi
  10026159:  5b                              pop      ebx
  1002615A:  5d                              pop      ebp
  1002615B:  c3                              ret      


; === UI::GetChildFrame, GetChildFrame ===
; RVA: 0x000263F0  Size: 45 bytes
; Exports: ?GetChildFrame@UI@GW@@YAPAUFrame@12@PAU312@I@Z, GetChildFrame
;
  100263F0:  55                              push     ebp
  100263F1:  8b ec                           mov      ebp, esp
  100263F3:  a1 34 c5 08 10                  mov      eax, dword ptr [0x1008c534]
  100263F8:  85 c0                           test     eax, eax
  100263FA:  74 1d                           je       0x10026419
  100263FC:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  100263FF:  85 c9                           test     ecx, ecx
  10026401:  74 16                           je       0x10026419
  10026403:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10026406:  ff b1 bc 00 00 00               push     dword ptr [ecx + 0xbc]
  1002640C:  ff d0                           call     eax
  1002640E:  50                              push     eax
  1002640F:  e8 fc 02 00 00                  call     0x10026710  ; UI::GetFrameById
  10026414:  83 c4 0c                        add      esp, 0xc
  10026417:  5d                              pop      ebp
  10026418:  c3                              ret      
  10026419:  33 c0                           xor      eax, eax
  1002641B:  5d                              pop      ebp
  1002641C:  c3                              ret      


; === UI::GetCommandLinePref, GetCommandLinePref_UInt ===
; RVA: 0x00026420  Size: 58 bytes
; Exports: ?GetCommandLinePref@UI@GW@@YA_NPB_WPAI@Z, GetCommandLinePref_UInt
;
  10026420:  55                              push     ebp
  10026421:  8b ec                           mov      ebp, esp
  10026423:  ff 75 08                        push     dword ptr [ebp + 8]
  10026426:  e8 75 00 00 00                  call     0x100264a0
  1002642B:  83 c4 04                        add      esp, 4
  1002642E:  85 c0                           test     eax, eax
  10026430:  74 24                           je       0x10026456
  10026432:  8b 00                           mov      eax, dword ptr [eax]
  10026434:  25 00 ff 00 00                  and      eax, 0xff00
  10026439:  3d 00 04 00 00                  cmp      eax, 0x400
  1002643E:  75 16                           jne      0x10026456
  10026440:  ff 75 08                        push     dword ptr [ebp + 8]
  10026443:  e8 d8 00 00 00                  call     0x10026520
  10026448:  83 c4 04                        add      esp, 4
  1002644B:  8b 08                           mov      ecx, dword ptr [eax]
  1002644D:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10026450:  89 08                           mov      dword ptr [eax], ecx
  10026452:  b0 01                           mov      al, 1
  10026454:  5d                              pop      ebp
  10026455:  c3                              ret      
  10026456:  32 c0                           xor      al, al
  10026458:  5d                              pop      ebp
  10026459:  c3                              ret      


; === UI::GetCommandLinePref, GetCommandLinePref_String ===
; RVA: 0x00026460  Size: 56 bytes
; Exports: ?GetCommandLinePref@UI@GW@@YA_NPB_WPAPA_W@Z, GetCommandLinePref_String
;
  10026460:  55                              push     ebp
  10026461:  8b ec                           mov      ebp, esp
  10026463:  ff 75 08                        push     dword ptr [ebp + 8]
  10026466:  e8 35 00 00 00                  call     0x100264a0
  1002646B:  83 c4 04                        add      esp, 4
  1002646E:  85 c0                           test     eax, eax
  10026470:  74 22                           je       0x10026494
  10026472:  8b 00                           mov      eax, dword ptr [eax]
  10026474:  25 00 ff 00 00                  and      eax, 0xff00
  10026479:  3d 00 03 00 00                  cmp      eax, 0x300
  1002647E:  75 14                           jne      0x10026494
  10026480:  ff 75 08                        push     dword ptr [ebp + 8]
  10026483:  e8 98 00 00 00                  call     0x10026520
  10026488:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  1002648B:  83 c4 04                        add      esp, 4
  1002648E:  89 01                           mov      dword ptr [ecx], eax
  10026490:  b0 01                           mov      al, 1
  10026492:  5d                              pop      ebp
  10026493:  c3                              ret      
  10026494:  32 c0                           xor      al, al
  10026496:  5d                              pop      ebp
  10026497:  c3                              ret      


; === UI::GetCurrentTooltip ===
; RVA: 0x000266E0  Size: 30 bytes
; Exports: ?GetCurrentTooltip@UI@GW@@YAPAUTooltipInfo@12@XZ
;
  100266E0:  a1 98 c5 08 10                  mov      eax, dword ptr [0x1008c598]
  100266E5:  85 c0                           test     eax, eax
  100266E7:  74 12                           je       0x100266fb
  100266E9:  8b 00                           mov      eax, dword ptr [eax]
  100266EB:  85 c0                           test     eax, eax
  100266ED:  74 0c                           je       0x100266fb
  100266EF:  8b 00                           mov      eax, dword ptr [eax]
  100266F1:  85 c0                           test     eax, eax
  100266F3:  74 06                           je       0x100266fb
  100266F5:  83 78 08 00                     cmp      dword ptr [eax + 8], 0
  100266F9:  75 02                           jne      0x100266fd
  100266FB:  33 c0                           xor      eax, eax
  100266FD:  c3                              ret      


; === UI::GetFrameById ===
; RVA: 0x00026710  Size: 99 bytes
; Exports: ?GetFrameById@UI@GW@@YAPAUFrame@12@I@Z
;
  10026710:  55                              push     ebp
  10026711:  8b ec                           mov      ebp, esp
  10026713:  56                              push     esi
  10026714:  8b 35 64 c5 08 10               mov      esi, dword ptr [0x1008c564]
  1002671A:  57                              push     edi
  1002671B:  85 f6                           test     esi, esi
  1002671D:  74 4e                           je       0x1002676d
  1002671F:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  10026722:  39 7e 08                        cmp      dword ptr [esi + 8], edi
  10026725:  76 46                           jbe      0x1002676d
  10026727:  83 3e 00                        cmp      dword ptr [esi], 0
  1002672A:  75 19                           jne      0x10026745
  1002672C:  68 b8 46 05 10                  push     0x100546b8  ; "GW::BaseArray<struct GW::UI::Frame *>::at"
  10026731:  6a 1e                           push     0x1e
  10026733:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  10026738:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  1002673D:  e8 2e f1 fd ff                  call     0x10005870  ; GW::FatalAssert
  10026742:  83 c4 10                        add      esp, 0x10
  10026745:  8b 06                           mov      eax, dword ptr [esi]
  10026747:  8b 0c b8                        mov      ecx, dword ptr [eax + edi*4]
  1002674A:  85 c9                           test     ecx, ecx
  1002674C:  74 12                           je       0x10026760
  1002674E:  83 f9 ff                        cmp      ecx, -1
  10026751:  74 0d                           je       0x10026760
  10026753:  b2 01                           mov      dl, 1
  10026755:  33 c0                           xor      eax, eax
  10026757:  84 d2                           test     dl, dl
  10026759:  5f                              pop      edi
  1002675A:  0f 45 c1                        cmovne   eax, ecx
  1002675D:  5e                              pop      esi
  1002675E:  5d                              pop      ebp
  1002675F:  c3                              ret      
  10026760:  32 d2                           xor      dl, dl
  10026762:  33 c0                           xor      eax, eax
  10026764:  84 d2                           test     dl, dl
  10026766:  5f                              pop      edi
  10026767:  0f 45 c1                        cmovne   eax, ecx
  1002676A:  5e                              pop      esi
  1002676B:  5d                              pop      ebp
  1002676C:  c3                              ret      
  1002676D:  5f                              pop      edi
  1002676E:  33 c0                           xor      eax, eax
  10026770:  5e                              pop      esi
  10026771:  5d                              pop      ebp
  10026772:  c3                              ret      


; === UI::GetFrameByLabel ===
; RVA: 0x00026780  Size: 82 bytes
; Exports: ?GetFrameByLabel@UI@GW@@YAPAUFrame@12@PB_W@Z
;
  10026780:  55                              push     ebp
  10026781:  8b ec                           mov      ebp, esp
  10026783:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10026786:  56                              push     esi
  10026787:  85 c0                           test     eax, eax
  10026789:  74 42                           je       0x100267cd
  1002678B:  83 3d 64 c5 08 10 00            cmp      dword ptr [0x1008c564], 0
  10026792:  74 39                           je       0x100267cd
  10026794:  6a ff                           push     -1
  10026796:  50                              push     eax
  10026797:  e8 b4 41 ff ff                  call     0x1001a950  ; GW::HashWString
  1002679C:  8b 15 64 c5 08 10               mov      edx, dword ptr [0x1008c564]
  100267A2:  83 c4 08                        add      esp, 8
  100267A5:  8b f0                           mov      esi, eax
  100267A7:  8b 0a                           mov      ecx, dword ptr [edx]
  100267A9:  8b 52 08                        mov      edx, dword ptr [edx + 8]
  100267AC:  8d 14 91                        lea      edx, [ecx + edx*4]
  100267AF:  3b ca                           cmp      ecx, edx
  100267B1:  74 1a                           je       0x100267cd
  100267B3:  8b 01                           mov      eax, dword ptr [ecx]
  100267B5:  85 c0                           test     eax, eax
  100267B7:  74 0d                           je       0x100267c6
  100267B9:  83 f8 ff                        cmp      eax, -1
  100267BC:  74 08                           je       0x100267c6
  100267BE:  39 b0 34 01 00 00               cmp      dword ptr [eax + 0x134], esi
  100267C4:  74 09                           je       0x100267cf
  100267C6:  83 c1 04                        add      ecx, 4
  100267C9:  3b ca                           cmp      ecx, edx
  100267CB:  75 e6                           jne      0x100267b3
  100267CD:  33 c0                           xor      eax, eax
  100267CF:  5e                              pop      esi
  100267D0:  5d                              pop      ebp
  100267D1:  c3                              ret      


; === UI::GetFrameContext ===
; RVA: 0x000267E0  Size: 105 bytes
; Exports: ?GetFrameContext@UI@GW@@YAPAXPAUFrame@12@@Z
;
  100267E0:  55                              push     ebp
  100267E1:  8b ec                           mov      ebp, esp
  100267E3:  53                              push     ebx
  100267E4:  56                              push     esi
  100267E5:  57                              push     edi
  100267E6:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  100267E9:  85 ff                           test     edi, edi
  100267EB:  74 55                           je       0x10026842
  100267ED:  8b b7 b0 00 00 00               mov      esi, dword ptr [edi + 0xb0]
  100267F3:  85 f6                           test     esi, esi
  100267F5:  74 4b                           je       0x10026842
  100267F7:  83 c6 ff                        add      esi, -1
  100267FA:  78 46                           js       0x10026842
  100267FC:  8d 1c 76                        lea      ebx, [esi + esi*2]
  100267FF:  c1 e3 02                        shl      ebx, 2
  10026802:  83 bf a8 00 00 00 00            cmp      dword ptr [edi + 0xa8], 0
  10026809:  74 08                           je       0x10026813
  1002680B:  3b b7 b0 00 00 00               cmp      esi, dword ptr [edi + 0xb0]
  10026811:  72 19                           jb       0x1002682c
  10026813:  68 c8 c3 04 10                  push     0x1004c3c8  ; "GW::BaseArray<struct GW::UI::FrameInteractionCallback>::at"
  10026818:  6a 1e                           push     0x1e
  1002681A:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  1002681F:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  10026824:  e8 47 f0 fd ff                  call     0x10005870  ; GW::FatalAssert
  10026829:  83 c4 10                        add      esp, 0x10
  1002682C:  8b 87 a8 00 00 00               mov      eax, dword ptr [edi + 0xa8]
  10026832:  8b 44 18 04                     mov      eax, dword ptr [eax + ebx + 4]
  10026836:  85 c0                           test     eax, eax
  10026838:  75 0a                           jne      0x10026844
  1002683A:  83 eb 0c                        sub      ebx, 0xc
  1002683D:  83 ee 01                        sub      esi, 1
  10026840:  79 c0                           jns      0x10026802
  10026842:  33 c0                           xor      eax, eax
  10026844:  5f                              pop      edi
  10026845:  5e                              pop      esi
  10026846:  5b                              pop      ebx
  10026847:  5d                              pop      ebp
  10026848:  c3                              ret      


; === UI::GetIsShiftScreenShot, GetIsShiftScreenShot ===
; RVA: 0x000268B0  Size: 19 bytes
; Exports: ?GetIsShiftScreenShot@UI@GW@@YA_NXZ, GetIsShiftScreenShot
;
  100268B0:  a1 90 c5 08 10                  mov      eax, dword ptr [0x1008c590]
  100268B5:  85 c0                           test     eax, eax
  100268B7:  74 07                           je       0x100268c0
  100268B9:  83 38 00                        cmp      dword ptr [eax], 0
  100268BC:  0f 95 c0                        setne    al
  100268BF:  c3                              ret      
  100268C0:  32 c0                           xor      al, al
  100268C2:  c3                              ret      


; === UI::GetIsUIDrawn, GetIsUIDrawn ===
; RVA: 0x000268D0  Size: 19 bytes
; Exports: ?GetIsUIDrawn@UI@GW@@YA_NXZ, GetIsUIDrawn
;
  100268D0:  a1 8c c5 08 10                  mov      eax, dword ptr [0x1008c58c]
  100268D5:  85 c0                           test     eax, eax
  100268D7:  74 07                           je       0x100268e0
  100268D9:  83 38 00                        cmp      dword ptr [eax], 0
  100268DC:  0f 94 c0                        sete     al
  100268DF:  c3                              ret      
  100268E0:  b0 01                           mov      al, 1
  100268E2:  c3                              ret      


; === UI::GetIsWorldMapShowing, GetIsWorldMapShowing ===
; RVA: 0x000268F0  Size: 11 bytes
; Exports: ?GetIsWorldMapShowing@UI@GW@@YA_NXZ, GetIsWorldMapShowing
;
  100268F0:  e8 7b 6d ff ff                  call     0x1001d670  ; Map::GetWorldMapContext
  100268F5:  85 c0                           test     eax, eax
  100268F7:  0f 95 c0                        setne    al
  100268FA:  c3                              ret      


; === UI::GetParentFrame, GetParentFrame ===
; RVA: 0x00026910  Size: 34 bytes
; Exports: ?GetParentFrame@UI@GW@@YAPAUFrame@12@PAU312@@Z, GetParentFrame
;
  10026910:  55                              push     ebp
  10026911:  8b ec                           mov      ebp, esp
  10026913:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10026916:  85 c0                           test     eax, eax
  10026918:  74 14                           je       0x1002692e
  1002691A:  8b 80 28 01 00 00               mov      eax, dword ptr [eax + 0x128]
  10026920:  8d 88 d8 fe ff ff               lea      ecx, [eax - 0x128]
  10026926:  f7 d8                           neg      eax
  10026928:  1b c0                           sbb      eax, eax
  1002692A:  23 c1                           and      eax, ecx
  1002692C:  5d                              pop      ebp
  1002692D:  c3                              ret      
  1002692E:  33 c0                           xor      eax, eax
  10026930:  5d                              pop      ebp
  10026931:  c3                              ret      


; === UI::GetPreference, GetPreference_Enum ===
; RVA: 0x00026940  Size: 45 bytes
; Exports: ?GetPreference@UI@GW@@YAIW4EnumPreference@12@@Z, GetPreference_Enum
;
  10026940:  55                              push     ebp
  10026941:  8b ec                           mov      ebp, esp
  10026943:  8b 0d ac c5 08 10               mov      ecx, dword ptr [0x1008c5ac]
  10026949:  85 c9                           test     ecx, ecx
  1002694B:  74 1c                           je       0x10026969
  1002694D:  a1 94 c5 08 10                  mov      eax, dword ptr [0x1008c594]
  10026952:  85 c0                           test     eax, eax
  10026954:  74 13                           je       0x10026969
  10026956:  83 38 01                        cmp      dword ptr [eax], 1
  10026959:  75 0e                           jne      0x10026969
  1002695B:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1002695E:  83 f8 08                        cmp      eax, 8
  10026961:  73 06                           jae      0x10026969
  10026963:  89 45 08                        mov      dword ptr [ebp + 8], eax
  10026966:  5d                              pop      ebp
  10026967:  ff e1                           jmp      ecx
  10026969:  33 c0                           xor      eax, eax
  1002696B:  5d                              pop      ebp
  1002696C:  c3                              ret      


; === UI::GetPreference, GetPreference_Number ===
; RVA: 0x00026970  Size: 45 bytes
; Exports: ?GetPreference@UI@GW@@YAIW4NumberPreference@12@@Z, GetPreference_Number
;
  10026970:  55                              push     ebp
  10026971:  8b ec                           mov      ebp, esp
  10026973:  8b 0d b4 c5 08 10               mov      ecx, dword ptr [0x1008c5b4]
  10026979:  85 c9                           test     ecx, ecx
  1002697B:  74 1c                           je       0x10026999
  1002697D:  a1 94 c5 08 10                  mov      eax, dword ptr [0x1008c594]
  10026982:  85 c0                           test     eax, eax
  10026984:  74 13                           je       0x10026999
  10026986:  83 38 01                        cmp      dword ptr [eax], 1
  10026989:  75 0e                           jne      0x10026999
  1002698B:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1002698E:  83 f8 2b                        cmp      eax, 0x2b
  10026991:  73 06                           jae      0x10026999
  10026993:  89 45 08                        mov      dword ptr [ebp + 8], eax
  10026996:  5d                              pop      ebp
  10026997:  ff e1                           jmp      ecx
  10026999:  33 c0                           xor      eax, eax
  1002699B:  5d                              pop      ebp
  1002699C:  c3                              ret      


; === UI::GetPreference, GetPreference_String ===
; RVA: 0x000269A0  Size: 45 bytes
; Exports: ?GetPreference@UI@GW@@YAPA_WW4StringPreference@12@@Z, GetPreference_String
;
  100269A0:  55                              push     ebp
  100269A1:  8b ec                           mov      ebp, esp
  100269A3:  8b 0d a4 c5 08 10               mov      ecx, dword ptr [0x1008c5a4]
  100269A9:  85 c9                           test     ecx, ecx
  100269AB:  74 1c                           je       0x100269c9
  100269AD:  a1 94 c5 08 10                  mov      eax, dword ptr [0x1008c594]
  100269B2:  85 c0                           test     eax, eax
  100269B4:  74 13                           je       0x100269c9
  100269B6:  83 38 01                        cmp      dword ptr [eax], 1
  100269B9:  75 0e                           jne      0x100269c9
  100269BB:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100269BE:  83 f8 03                        cmp      eax, 3
  100269C1:  73 06                           jae      0x100269c9
  100269C3:  89 45 08                        mov      dword ptr [ebp + 8], eax
  100269C6:  5d                              pop      ebp
  100269C7:  ff e1                           jmp      ecx
  100269C9:  33 c0                           xor      eax, eax
  100269CB:  5d                              pop      ebp
  100269CC:  c3                              ret      


; === UI::GetPreference, GetPreference_Flag ===
; RVA: 0x000269D0  Size: 45 bytes
; Exports: ?GetPreference@UI@GW@@YA_NW4FlagPreference@12@@Z, GetPreference_Flag
;
  100269D0:  55                              push     ebp
  100269D1:  8b ec                           mov      ebp, esp
  100269D3:  8b 0d 9c c5 08 10               mov      ecx, dword ptr [0x1008c59c]
  100269D9:  85 c9                           test     ecx, ecx
  100269DB:  74 1c                           je       0x100269f9
  100269DD:  a1 94 c5 08 10                  mov      eax, dword ptr [0x1008c594]
  100269E2:  85 c0                           test     eax, eax
  100269E4:  74 13                           je       0x100269f9
  100269E6:  83 38 01                        cmp      dword ptr [eax], 1
  100269E9:  75 0e                           jne      0x100269f9
  100269EB:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100269EE:  83 f8 6c                        cmp      eax, 0x6c
  100269F1:  73 06                           jae      0x100269f9
  100269F3:  89 45 08                        mov      dword ptr [ebp + 8], eax
  100269F6:  5d                              pop      ebp
  100269F7:  ff e1                           jmp      ecx
  100269F9:  32 c0                           xor      al, al
  100269FB:  5d                              pop      ebp
  100269FC:  c3                              ret      


; === UI::GetPreferenceOptions ===
; RVA: 0x00026A00  Size: 62 bytes
; Exports: ?GetPreferenceOptions@UI@GW@@YAIW4EnumPreference@12@PAPAI@Z
;
  10026A00:  55                              push     ebp
  10026A01:  8b ec                           mov      ebp, esp
  10026A03:  8b 0d 6c c5 08 10               mov      ecx, dword ptr [0x1008c56c]
  10026A09:  85 c9                           test     ecx, ecx
  10026A0B:  74 1f                           je       0x10026a2c
  10026A0D:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10026A10:  83 f8 08                        cmp      eax, 8
  10026A13:  73 17                           jae      0x10026a2c
  10026A15:  8b 55 0c                        mov      edx, dword ptr [ebp + 0xc]
  10026A18:  8d 04 80                        lea      eax, [eax + eax*4]
  10026A1B:  8d 04 81                        lea      eax, [ecx + eax*4]
  10026A1E:  85 d2                           test     edx, edx
  10026A20:  74 05                           je       0x10026a27
  10026A22:  8b 48 08                        mov      ecx, dword ptr [eax + 8]
  10026A25:  89 0a                           mov      dword ptr [edx], ecx
  10026A27:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  10026A2A:  5d                              pop      ebp
  10026A2B:  c3                              ret      
  10026A2C:  33 c0                           xor      eax, eax
  10026A2E:  5d                              pop      ebp
  10026A2F:  c3                              ret      
  10026A30:  a1 c8 c5 08 10                  mov      eax, dword ptr [0x1008c5c8]
  10026A35:  85 c0                           test     eax, eax
  10026A37:  74 02                           je       0x10026a3b
  10026A39:  ff e0                           jmp      eax
  10026A3B:  33 c0                           xor      eax, eax
  10026A3D:  c3                              ret      


; === UI::GetRootFrame, GetRootFrame ===
; RVA: 0x00026A30  Size: 14 bytes
; Exports: ?GetRootFrame@UI@GW@@YAPAUFrame@12@XZ, GetRootFrame
;
  10026A30:  a1 c8 c5 08 10                  mov      eax, dword ptr [0x1008c5c8]
  10026A35:  85 c0                           test     eax, eax
  10026A37:  74 02                           je       0x10026a3b
  10026A39:  ff e0                           jmp      eax
  10026A3B:  33 c0                           xor      eax, eax
  10026A3D:  c3                              ret      


; === UI::GetSettings ===
; RVA: 0x00026A40  Size: 6 bytes
; Exports: ?GetSettings@UI@GW@@YAPAV?$Array@E@2@XZ
;
  10026A40:  a1 88 c5 08 10                  mov      eax, dword ptr [0x1008c588]
  10026A45:  c3                              ret      


; === UI::GetTextLanguage, GetTextLanguage ===
; RVA: 0x00026B00  Size: 35 bytes
; Exports: ?GetTextLanguage@UI@GW@@YA?AW4Language@Constants@2@XZ, GetTextLanguage
;
  10026B00:  8b 0d b4 c5 08 10               mov      ecx, dword ptr [0x1008c5b4]
  10026B06:  85 c9                           test     ecx, ecx
  10026B08:  74 16                           je       0x10026b20
  10026B0A:  a1 94 c5 08 10                  mov      eax, dword ptr [0x1008c594]
  10026B0F:  85 c0                           test     eax, eax
  10026B11:  74 0d                           je       0x10026b20
  10026B13:  83 38 01                        cmp      dword ptr [eax], 1
  10026B16:  75 08                           jne      0x10026b20
  10026B18:  6a 0a                           push     0xa
  10026B1A:  ff d1                           call     ecx
  10026B1C:  83 c4 04                        add      esp, 4
  10026B1F:  c3                              ret      
  10026B20:  33 c0                           xor      eax, eax
  10026B22:  c3                              ret      


; === UI::GetWindowPosition, GetWindowPosition ===
; RVA: 0x00026C60  Size: 33 bytes
; Exports: ?GetWindowPosition@UI@GW@@YAPAUWindowPosition@12@W4WindowID@12@@Z, GetWindowPosition
;
  10026C60:  55                              push     ebp
  10026C61:  8b ec                           mov      ebp, esp
  10026C63:  8b 0d cc c5 08 10               mov      ecx, dword ptr [0x1008c5cc]
  10026C69:  85 c9                           test     ecx, ecx
  10026C6B:  74 10                           je       0x10026c7d
  10026C6D:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10026C70:  83 f8 69                        cmp      eax, 0x69
  10026C73:  73 08                           jae      0x10026c7d
  10026C75:  8d 04 80                        lea      eax, [eax + eax*4]
  10026C78:  8d 04 81                        lea      eax, [ecx + eax*4]
  10026C7B:  5d                              pop      ebp
  10026C7C:  c3                              ret      
  10026C7D:  33 c0                           xor      eax, eax
  10026C7F:  5d                              pop      ebp
  10026C80:  c3                              ret      


; === UI::IsInControllerCursorMode ===
; RVA: 0x00026C90  Size: 87 bytes
; Exports: ?IsInControllerCursorMode@UI@GW@@YA_NXZ
;
  10026C90:  a1 0c c5 08 10                  mov      eax, dword ptr [0x1008c50c]
  10026C95:  85 c0                           test     eax, eax
  10026C97:  74 4b                           je       0x10026ce4
  10026C99:  ff d0                           call     eax
  10026C9B:  83 f8 ff                        cmp      eax, -1
  10026C9E:  74 44                           je       0x10026ce4
  10026CA0:  a1 c8 c5 08 10                  mov      eax, dword ptr [0x1008c5c8]
  10026CA5:  85 c0                           test     eax, eax
  10026CA7:  74 04                           je       0x10026cad
  10026CA9:  ff d0                           call     eax
  10026CAB:  eb 02                           jmp      0x10026caf
  10026CAD:  33 c0                           xor      eax, eax
  10026CAF:  8b 0d 34 c5 08 10               mov      ecx, dword ptr [0x1008c534]
  10026CB5:  85 c9                           test     ecx, ecx
  10026CB7:  74 2b                           je       0x10026ce4
  10026CB9:  85 c0                           test     eax, eax
  10026CBB:  74 27                           je       0x10026ce4
  10026CBD:  6a 00                           push     0
  10026CBF:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  10026CC5:  ff d1                           call     ecx
  10026CC7:  50                              push     eax
  10026CC8:  e8 43 fa ff ff                  call     0x10026710  ; UI::GetFrameById
  10026CCD:  83 c4 0c                        add      esp, 0xc
  10026CD0:  85 c0                           test     eax, eax
  10026CD2:  74 10                           je       0x10026ce4
  10026CD4:  8b 80 8c 01 00 00               mov      eax, dword ptr [eax + 0x18c]
  10026CDA:  c1 e8 09                        shr      eax, 9
  10026CDD:  a8 01                           test     al, 1
  10026CDF:  75 03                           jne      0x10026ce4
  10026CE1:  b0 01                           mov      al, 1
  10026CE3:  c3                              ret      
  10026CE4:  32 c0                           xor      al, al
  10026CE6:  c3                              ret      


; === UI::IsInControllerMode, IsInControllerMode ===
; RVA: 0x00026CF0  Size: 21 bytes
; Exports: ?IsInControllerMode@UI@GW@@YA_NXZ, IsInControllerMode
;
  10026CF0:  a1 0c c5 08 10                  mov      eax, dword ptr [0x1008c50c]
  10026CF5:  85 c0                           test     eax, eax
  10026CF7:  75 03                           jne      0x10026cfc
  10026CF9:  32 c0                           xor      al, al
  10026CFB:  c3                              ret      
  10026CFC:  ff d0                           call     eax
  10026CFE:  83 f8 ff                        cmp      eax, -1
  10026D01:  0f 95 c0                        setne    al
  10026D04:  c3                              ret      


; === UI::IsValidEncStr ===
; RVA: 0x00026D10  Size: 69 bytes
; Exports: ?IsValidEncStr@UI@GW@@YA_NPB_W@Z
;
  10026D10:  55                              push     ebp
  10026D11:  8b ec                           mov      ebp, esp
  10026D13:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  10026D16:  56                              push     esi
  10026D17:  85 d2                           test     edx, edx
  10026D19:  74 35                           je       0x10026d50
  10026D1B:  8b c2                           mov      eax, edx
  10026D1D:  8d 70 02                        lea      esi, [eax + 2]
  10026D20:  66 8b 08                        mov      cx, word ptr [eax]
  10026D23:  83 c0 02                        add      eax, 2
  10026D26:  66 85 c9                        test     cx, cx
  10026D29:  75 f5                           jne      0x10026d20
  10026D2B:  2b c6                           sub      eax, esi
  10026D2D:  89 55 08                        mov      dword ptr [ebp + 8], edx
  10026D30:  d1 f8                           sar      eax, 1
  10026D32:  40                              inc      eax
  10026D33:  8d 34 42                        lea      esi, [edx + eax*2]
  10026D36:  8d 45 08                        lea      eax, [ebp + 8]
  10026D39:  56                              push     esi
  10026D3A:  50                              push     eax
  10026D3B:  e8 20 f4 ff ff                  call     0x10026160
  10026D40:  83 c4 08                        add      esp, 8
  10026D43:  84 c0                           test     al, al
  10026D45:  74 09                           je       0x10026d50
  10026D47:  39 75 08                        cmp      dword ptr [ebp + 8], esi
  10026D4A:  5e                              pop      esi
  10026D4B:  0f 94 c0                        sete     al
  10026D4E:  5d                              pop      ebp
  10026D4F:  c3                              ret      
  10026D50:  32 c0                           xor      al, al
  10026D52:  5e                              pop      esi
  10026D53:  5d                              pop      ebp
  10026D54:  c3                              ret      


; === UI::Keydown ===
; RVA: 0x00026D60  Size: 96 bytes
; Exports: ?Keydown@UI@GW@@YA_NW4ControlAction@12@PAUFrame@12@@Z
;
  10026D60:  55                              push     ebp
  10026D61:  8b ec                           mov      ebp, esp
  10026D63:  83 ec 0c                        sub      esp, 0xc
  10026D66:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10026D69:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  10026D6C:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10026D6F:  c7 45 f8 00 00 00 00            mov      dword ptr [ebp - 8], 0
  10026D76:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10026D7D:  85 c0                           test     eax, eax
  10026D7F:  75 2a                           jne      0x10026dab
  10026D81:  e8 ca fa ff ff                  call     0x10026850
  10026D86:  8b 0d 34 c5 08 10               mov      ecx, dword ptr [0x1008c534]
  10026D8C:  85 c9                           test     ecx, ecx
  10026D8E:  74 19                           je       0x10026da9
  10026D90:  85 c0                           test     eax, eax
  10026D92:  74 15                           je       0x10026da9
  10026D94:  6a 06                           push     6
  10026D96:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  10026D9C:  ff d1                           call     ecx
  10026D9E:  50                              push     eax
  10026D9F:  e8 6c f9 ff ff                  call     0x10026710  ; UI::GetFrameById
  10026DA4:  83 c4 0c                        add      esp, 0xc
  10026DA7:  eb 02                           jmp      0x10026dab
  10026DA9:  33 c0                           xor      eax, eax
  10026DAB:  6a 00                           push     0
  10026DAD:  8d 4d f4                        lea      ecx, [ebp - 0xc]
  10026DB0:  51                              push     ecx
  10026DB1:  6a 20                           push     0x20
  10026DB3:  50                              push     eax
  10026DB4:  e8 67 11 00 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10026DB9:  83 c4 10                        add      esp, 0x10
  10026DBC:  8b e5                           mov      esp, ebp
  10026DBE:  5d                              pop      ebp
  10026DBF:  c3                              ret      


; === UI::Keypress ===
; RVA: 0x00026DC0  Size: 146 bytes
; Exports: ?Keypress@UI@GW@@YA_NW4ControlAction@12@PAUFrame@12@@Z
;
  10026DC0:  55                              push     ebp
  10026DC1:  8b ec                           mov      ebp, esp
  10026DC3:  83 ec 0c                        sub      esp, 0xc
  10026DC6:  56                              push     esi
  10026DC7:  8b 75 0c                        mov      esi, dword ptr [ebp + 0xc]
  10026DCA:  c7 45 f8 00 00 00 00            mov      dword ptr [ebp - 8], 0
  10026DD1:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10026DD8:  57                              push     edi
  10026DD9:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  10026DDC:  89 7d f4                        mov      dword ptr [ebp - 0xc], edi
  10026DDF:  85 f6                           test     esi, esi
  10026DE1:  74 04                           je       0x10026de7
  10026DE3:  8b c6                           mov      eax, esi
  10026DE5:  eb 2a                           jmp      0x10026e11
  10026DE7:  e8 64 fa ff ff                  call     0x10026850
  10026DEC:  8b 0d 34 c5 08 10               mov      ecx, dword ptr [0x1008c534]
  10026DF2:  85 c9                           test     ecx, ecx
  10026DF4:  74 19                           je       0x10026e0f
  10026DF6:  85 c0                           test     eax, eax
  10026DF8:  74 15                           je       0x10026e0f
  10026DFA:  6a 06                           push     6
  10026DFC:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  10026E02:  ff d1                           call     ecx
  10026E04:  50                              push     eax
  10026E05:  e8 06 f9 ff ff                  call     0x10026710  ; UI::GetFrameById
  10026E0A:  83 c4 0c                        add      esp, 0xc
  10026E0D:  eb 02                           jmp      0x10026e11
  10026E0F:  33 c0                           xor      eax, eax
  10026E11:  6a 00                           push     0
  10026E13:  8d 4d f4                        lea      ecx, [ebp - 0xc]
  10026E16:  51                              push     ecx
  10026E17:  6a 20                           push     0x20
  10026E19:  50                              push     eax
  10026E1A:  e8 01 11 00 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10026E1F:  83 c4 10                        add      esp, 0x10
  10026E22:  84 c0                           test     al, al
  10026E24:  75 06                           jne      0x10026e2c
  10026E26:  5f                              pop      edi
  10026E27:  5e                              pop      esi
  10026E28:  8b e5                           mov      esp, ebp
  10026E2A:  5d                              pop      ebp
  10026E2B:  c3                              ret      
  10026E2C:  6a 00                           push     0
  10026E2E:  83 ec 28                        sub      esp, 0x28
  10026E31:  8b c4                           mov      eax, esp
  10026E33:  c7 00 dc 45 05 10               mov      dword ptr [eax], 0x100545dc
  10026E39:  89 78 04                        mov      dword ptr [eax + 4], edi
  10026E3C:  89 70 08                        mov      dword ptr [eax + 8], esi
  10026E3F:  89 40 24                        mov      dword ptr [eax + 0x24], eax
  10026E42:  e8 f9 31 ff ff                  call     0x1001a040  ; GameThread::Enqueue
  10026E47:  83 c4 2c                        add      esp, 0x2c
  10026E4A:  b0 01                           mov      al, 1
  10026E4C:  5f                              pop      edi
  10026E4D:  5e                              pop      esi
  10026E4E:  8b e5                           mov      esp, ebp
  10026E50:  5d                              pop      ebp
  10026E51:  c3                              ret      


; === UI::Keyup ===
; RVA: 0x00026E60  Size: 96 bytes
; Exports: ?Keyup@UI@GW@@YA_NW4ControlAction@12@PAUFrame@12@@Z
;
  10026E60:  55                              push     ebp
  10026E61:  8b ec                           mov      ebp, esp
  10026E63:  83 ec 0c                        sub      esp, 0xc
  10026E66:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10026E69:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  10026E6C:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10026E6F:  c7 45 f8 00 00 00 00            mov      dword ptr [ebp - 8], 0
  10026E76:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10026E7D:  85 c0                           test     eax, eax
  10026E7F:  75 2a                           jne      0x10026eab
  10026E81:  e8 ca f9 ff ff                  call     0x10026850
  10026E86:  8b 0d 34 c5 08 10               mov      ecx, dword ptr [0x1008c534]
  10026E8C:  85 c9                           test     ecx, ecx
  10026E8E:  74 19                           je       0x10026ea9
  10026E90:  85 c0                           test     eax, eax
  10026E92:  74 15                           je       0x10026ea9
  10026E94:  6a 06                           push     6
  10026E96:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  10026E9C:  ff d1                           call     ecx
  10026E9E:  50                              push     eax
  10026E9F:  e8 6c f8 ff ff                  call     0x10026710  ; UI::GetFrameById
  10026EA4:  83 c4 0c                        add      esp, 0xc
  10026EA7:  eb 02                           jmp      0x10026eab
  10026EA9:  33 c0                           xor      eax, eax
  10026EAB:  6a 00                           push     0
  10026EAD:  8d 4d f4                        lea      ecx, [ebp - 0xc]
  10026EB0:  51                              push     ecx
  10026EB1:  6a 22                           push     0x22
  10026EB3:  50                              push     eax
  10026EB4:  e8 67 10 00 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10026EB9:  83 c4 10                        add      esp, 0x10
  10026EBC:  8b e5                           mov      esp, ebp
  10026EBE:  5d                              pop      ebp
  10026EBF:  c3                              ret      


; === UI::RegisterCreateUIComponentCallback ===
; RVA: 0x00027340  Size: 230 bytes
; Exports: ?RegisterCreateUIComponentCallback@UI@GW@@YAXPAUHookEntry@2@ABV?$function@$$A6AXPAUCreateUIComponentPacket@UI@GW@@@Z@std@@H@Z
;
  10027340:  55                              push     ebp
  10027341:  8b ec                           mov      ebp, esp
  10027343:  6a ff                           push     -1
  10027345:  68 85 af 04 10                  push     0x1004af85
  1002734A:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  10027350:  50                              push     eax
  10027351:  83 ec 38                        sub      esp, 0x38
  10027354:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  10027359:  33 c5                           xor      eax, ebp
  1002735B:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  1002735E:  53                              push     ebx
  1002735F:  56                              push     esi
  10027360:  57                              push     edi
  10027361:  50                              push     eax
  10027362:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10027365:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  1002736B:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  1002736E:  8b 5d 0c                        mov      ebx, dword ptr [ebp + 0xc]
  10027371:  57                              push     edi
  10027372:  e8 79 06 00 00                  call     0x100279f0  ; UI::RemoveCreateUIComponentCallback
  10027377:  8b 35 e0 c5 08 10               mov      esi, dword ptr [0x1008c5e0]
  1002737D:  83 c4 04                        add      esp, 4
  10027380:  a1 e4 c5 08 10                  mov      eax, dword ptr [0x1008c5e4]
  10027385:  8b 4d 10                        mov      ecx, dword ptr [ebp + 0x10]
  10027388:  3b f0                           cmp      esi, eax
  1002738A:  74 0f                           je       0x1002739b
  1002738C:  0f 1f 40 00                     nop      dword ptr [eax]
  10027390:  39 0e                           cmp      dword ptr [esi], ecx
  10027392:  7f 07                           jg       0x1002739b
  10027394:  83 c6 30                        add      esi, 0x30
  10027397:  3b f0                           cmp      esi, eax
  10027399:  75 f5                           jne      0x10027390
  1002739B:  89 4d c0                        mov      dword ptr [ebp - 0x40], ecx
  1002739E:  89 7d c4                        mov      dword ptr [ebp - 0x3c], edi
  100273A1:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  100273A8:  8b 4b 24                        mov      ecx, dword ptr [ebx + 0x24]
  100273AB:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  100273B2:  85 c9                           test     ecx, ecx
  100273B4:  74 0b                           je       0x100273c1
  100273B6:  8b 01                           mov      eax, dword ptr [ecx]
  100273B8:  8d 55 c8                        lea      edx, [ebp - 0x38]
  100273BB:  52                              push     edx
  100273BC:  ff 10                           call     dword ptr [eax]
  100273BE:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  100273C1:  8d 45 c0                        lea      eax, [ebp - 0x40]
  100273C4:  c7 45 fc 01 00 00 00            mov      dword ptr [ebp - 4], 1
  100273CB:  50                              push     eax
  100273CC:  56                              push     esi
  100273CD:  8d 45 bc                        lea      eax, [ebp - 0x44]
  100273D0:  b9 e0 c5 08 10                  mov      ecx, 0x1008c5e0
  100273D5:  50                              push     eax
  100273D6:  e8 65 00 fe ff                  call     0x10007440
  100273DB:  8b 4d ec                        mov      ecx, dword ptr [ebp - 0x14]
  100273DE:  c7 45 fc ff ff ff ff            mov      dword ptr [ebp - 4], 0xffffffff
  100273E5:  85 c9                           test     ecx, ecx
  100273E7:  74 18                           je       0x10027401
  100273E9:  8b 11                           mov      edx, dword ptr [ecx]
  100273EB:  8d 45 c8                        lea      eax, [ebp - 0x38]
  100273EE:  3b c8                           cmp      ecx, eax
  100273F0:  0f 95 c0                        setne    al
  100273F3:  0f b6 c0                        movzx    eax, al
  100273F6:  50                              push     eax
  100273F7:  ff 52 10                        call     dword ptr [edx + 0x10]
  100273FA:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  10027401:  57                              push     edi
  10027402:  e8 19 e8 ff ff                  call     0x10025c20
  10027407:  83 c4 04                        add      esp, 4
  1002740A:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  1002740D:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  10027414:  59                              pop      ecx
  10027415:  5f                              pop      edi
  10027416:  5e                              pop      esi
  10027417:  5b                              pop      ebx
  10027418:  8b 4d f0                        mov      ecx, dword ptr [ebp - 0x10]
  1002741B:  33 cd                           xor      ecx, ebp
  1002741D:  e8 95 4f 00 00                  call     0x1002c3b7
  10027422:  8b e5                           mov      esp, ebp
  10027424:  5d                              pop      ebp
  10027425:  c3                              ret      


; === UI::RegisterFrameUIMessageCallback ===
; RVA: 0x00027430  Size: 467 bytes
; Exports: ?RegisterFrameUIMessageCallback@UI@GW@@YAXPAUHookEntry@2@W4UIMessage@12@ABV?$function@$$A6AXPAUHookStatus@GW@@PBUFrame@UI@2@W4UIMessage@42@PAX3@Z@std@@H@Z
;
  10027430:  55                              push     ebp
  10027431:  8b ec                           mov      ebp, esp
  10027433:  6a ff                           push     -1
  10027435:  68 7d a7 04 10                  push     0x1004a77d
  1002743A:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  10027440:  50                              push     eax
  10027441:  83 ec 58                        sub      esp, 0x58
  10027444:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  10027449:  33 c5                           xor      eax, ebp
  1002744B:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  1002744E:  53                              push     ebx
  1002744F:  56                              push     esi
  10027450:  57                              push     edi
  10027451:  50                              push     eax
  10027452:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10027455:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  1002745B:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1002745E:  8b 55 0c                        mov      edx, dword ptr [ebp + 0xc]
  10027461:  89 45 b0                        mov      dword ptr [ebp - 0x50], eax
  10027464:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  10027467:  89 45 bc                        mov      dword ptr [ebp - 0x44], eax
  1002746A:  0f b6 c2                        movzx    eax, dl
  1002746D:  35 c5 9d 1c 81                  xor      eax, 0x811c9dc5
  10027472:  69 c8 93 01 00 01               imul     ecx, eax, 0x1000193
  10027478:  8b c2                           mov      eax, edx
  1002747A:  c1 e8 08                        shr      eax, 8
  1002747D:  0f b6 c0                        movzx    eax, al
  10027480:  33 c8                           xor      ecx, eax
  10027482:  8b c2                           mov      eax, edx
  10027484:  c1 e8 10                        shr      eax, 0x10
  10027487:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  1002748D:  0f b6 c0                        movzx    eax, al
  10027490:  c1 ea 18                        shr      edx, 0x18
  10027493:  33 c8                           xor      ecx, eax
  10027495:  69 c1 93 01 00 01               imul     eax, ecx, 0x1000193
  1002749B:  b9 0c c6 08 10                  mov      ecx, 0x1008c60c
  100274A0:  33 c2                           xor      eax, edx
  100274A2:  69 c0 93 01 00 01               imul     eax, eax, 0x1000193
  100274A8:  50                              push     eax
  100274A9:  8d 45 0c                        lea      eax, [ebp + 0xc]
  100274AC:  50                              push     eax
  100274AD:  8d 45 b4                        lea      eax, [ebp - 0x4c]
  100274B0:  50                              push     eax
  100274B1:  e8 2a ed fd ff                  call     0x100061e0
  100274B6:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  100274B9:  85 c0                           test     eax, eax
  100274BB:  75 4c                           jne      0x10027509
  100274BD:  89 45 a4                        mov      dword ptr [ebp - 0x5c], eax
  100274C0:  89 45 a8                        mov      dword ptr [ebp - 0x58], eax
  100274C3:  89 45 ac                        mov      dword ptr [ebp - 0x54], eax
  100274C6:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  100274C9:  b9 0c c6 08 10                  mov      ecx, 0x1008c60c
  100274CE:  8d 45 0c                        lea      eax, [ebp + 0xc]
  100274D1:  50                              push     eax
  100274D2:  8d 45 b4                        lea      eax, [ebp - 0x4c]
  100274D5:  50                              push     eax
  100274D6:  e8 05 ee fd ff                  call     0x100062e0
  100274DB:  8b 30                           mov      esi, dword ptr [eax]
  100274DD:  8d 45 a4                        lea      eax, [ebp - 0x5c]
  100274E0:  83 c6 0c                        add      esi, 0xc
  100274E3:  3b f0                           cmp      esi, eax
  100274E5:  74 1b                           je       0x10027502
  100274E7:  8b ce                           mov      ecx, esi
  100274E9:  e8 72 fc fd ff                  call     0x10007160
  100274EE:  c7 06 00 00 00 00               mov      dword ptr [esi], 0
  100274F4:  c7 46 04 00 00 00 00            mov      dword ptr [esi + 4], 0
  100274FB:  c7 46 08 00 00 00 00            mov      dword ptr [esi + 8], 0
  10027502:  c7 45 fc ff ff ff ff            mov      dword ptr [ebp - 4], 0xffffffff
  10027509:  8d 45 0c                        lea      eax, [ebp + 0xc]
  1002750C:  b9 0c c6 08 10                  mov      ecx, 0x1008c60c
  10027511:  50                              push     eax
  10027512:  8d 45 b4                        lea      eax, [ebp - 0x4c]
  10027515:  50                              push     eax
  10027516:  e8 c5 ed fd ff                  call     0x100062e0
  1002751B:  b9 0c c6 08 10                  mov      ecx, 0x1008c60c
  10027520:  8b 30                           mov      esi, dword ptr [eax]
  10027522:  8d 45 0c                        lea      eax, [ebp + 0xc]
  10027525:  50                              push     eax
  10027526:  8d 45 b4                        lea      eax, [ebp - 0x4c]
  10027529:  50                              push     eax
  1002752A:  8b 76 0c                        mov      esi, dword ptr [esi + 0xc]
  1002752D:  e8 ae ed fd ff                  call     0x100062e0
  10027532:  8b 7d 14                        mov      edi, dword ptr [ebp + 0x14]
  10027535:  8b 00                           mov      eax, dword ptr [eax]
  10027537:  3b 70 10                        cmp      esi, dword ptr [eax + 0x10]
  1002753A:  74 24                           je       0x10027560
  1002753C:  0f 1f 40 00                     nop      dword ptr [eax]
  10027540:  39 3e                           cmp      dword ptr [esi], edi
  10027542:  7f 1c                           jg       0x10027560
  10027544:  8d 45 0c                        lea      eax, [ebp + 0xc]
  10027547:  b9 0c c6 08 10                  mov      ecx, 0x1008c60c
  1002754C:  50                              push     eax
  1002754D:  8d 45 b4                        lea      eax, [ebp - 0x4c]
  10027550:  83 c6 30                        add      esi, 0x30
  10027553:  50                              push     eax
  10027554:  e8 87 ed fd ff                  call     0x100062e0
  10027559:  8b 00                           mov      eax, dword ptr [eax]
  1002755B:  3b 70 10                        cmp      esi, dword ptr [eax + 0x10]
  1002755E:  75 e0                           jne      0x10027540
  10027560:  8d 45 0c                        lea      eax, [ebp + 0xc]
  10027563:  b9 0c c6 08 10                  mov      ecx, 0x1008c60c
  10027568:  50                              push     eax
  10027569:  8d 45 9c                        lea      eax, [ebp - 0x64]
  1002756C:  50                              push     eax
  1002756D:  e8 6e ed fd ff                  call     0x100062e0
  10027572:  8b 18                           mov      ebx, dword ptr [eax]
  10027574:  89 7d c0                        mov      dword ptr [ebp - 0x40], edi
  10027577:  8b 7d b0                        mov      edi, dword ptr [ebp - 0x50]
  1002757A:  89 7d c4                        mov      dword ptr [ebp - 0x3c], edi
  1002757D:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  10027584:  8b 4d bc                        mov      ecx, dword ptr [ebp - 0x44]
  10027587:  c7 45 fc 01 00 00 00            mov      dword ptr [ebp - 4], 1
  1002758E:  8b 49 24                        mov      ecx, dword ptr [ecx + 0x24]
  10027591:  85 c9                           test     ecx, ecx
  10027593:  74 0b                           je       0x100275a0
  10027595:  8b 01                           mov      eax, dword ptr [ecx]
  10027597:  8d 55 c8                        lea      edx, [ebp - 0x38]
  1002759A:  52                              push     edx
  1002759B:  ff 10                           call     dword ptr [eax]
  1002759D:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  100275A0:  8d 45 c0                        lea      eax, [ebp - 0x40]
  100275A3:  c7 45 fc 02 00 00 00            mov      dword ptr [ebp - 4], 2
  100275AA:  50                              push     eax
  100275AB:  56                              push     esi
  100275AC:  8d 45 bc                        lea      eax, [ebp - 0x44]
  100275AF:  50                              push     eax
  100275B0:  8d 4b 0c                        lea      ecx, [ebx + 0xc]
  100275B3:  e8 88 fe fd ff                  call     0x10007440
  100275B8:  8b 4d ec                        mov      ecx, dword ptr [ebp - 0x14]
  100275BB:  c7 45 fc ff ff ff ff            mov      dword ptr [ebp - 4], 0xffffffff
  100275C2:  85 c9                           test     ecx, ecx
  100275C4:  74 18                           je       0x100275de
  100275C6:  8b 11                           mov      edx, dword ptr [ecx]
  100275C8:  8d 45 c8                        lea      eax, [ebp - 0x38]
  100275CB:  3b c8                           cmp      ecx, eax
  100275CD:  0f 95 c0                        setne    al
  100275D0:  0f b6 c0                        movzx    eax, al
  100275D3:  50                              push     eax
  100275D4:  ff 52 10                        call     dword ptr [edx + 0x10]
  100275D7:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  100275DE:  57                              push     edi
  100275DF:  e8 3c e6 ff ff                  call     0x10025c20
  100275E4:  83 c4 04                        add      esp, 4
  100275E7:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  100275EA:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  100275F1:  59                              pop      ecx
  100275F2:  5f                              pop      edi
  100275F3:  5e                              pop      esi
  100275F4:  5b                              pop      ebx
  100275F5:  8b 4d f0                        mov      ecx, dword ptr [ebp - 0x10]
  100275F8:  33 cd                           xor      ecx, ebp
  100275FA:  e8 b8 4d 00 00                  call     0x1002c3b7
  100275FF:  8b e5                           mov      esp, ebp
  10027601:  5d                              pop      ebp
  10027602:  c3                              ret      


; === UI::RegisterKeydownCallback ===
; RVA: 0x00027610  Size: 255 bytes
; Exports: ?RegisterKeydownCallback@UI@GW@@YAXPAUHookEntry@2@ABV?$function@$$A6AXPAUHookStatus@GW@@I@Z@std@@@Z
;
  10027610:  55                              push     ebp
  10027611:  8b ec                           mov      ebp, esp
  10027613:  6a ff                           push     -1
  10027615:  68 fd b3 04 10                  push     0x1004b3fd
  1002761A:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  10027620:  50                              push     eax
  10027621:  83 ec 5c                        sub      esp, 0x5c
  10027624:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  10027629:  33 c5                           xor      eax, ebp
  1002762B:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  1002762E:  53                              push     ebx
  1002762F:  56                              push     esi
  10027630:  57                              push     edi
  10027631:  50                              push     eax
  10027632:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10027635:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  1002763B:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  1002763E:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10027641:  8b 48 24                        mov      ecx, dword ptr [eax + 0x24]
  10027644:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1002764B:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  10027652:  85 c9                           test     ecx, ecx
  10027654:  74 0b                           je       0x10027661
  10027656:  8b 01                           mov      eax, dword ptr [ecx]
  10027658:  8d 55 c8                        lea      edx, [ebp - 0x38]
  1002765B:  52                              push     edx
  1002765C:  ff 10                           call     dword ptr [eax]
  1002765E:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  10027661:  c7 45 fc 01 00 00 00            mov      dword ptr [ebp - 4], 1
  10027668:  c7 45 bc 00 00 00 00            mov      dword ptr [ebp - 0x44], 0
  1002766F:  6a 30                           push     0x30
  10027671:  c6 45 fc 02                     mov      byte ptr [ebp - 4], 2
  10027675:  e8 e3 49 00 00                  call     0x1002c05d
  1002767A:  8b f0                           mov      esi, eax
  1002767C:  83 c4 04                        add      esp, 4
  1002767F:  89 75 c4                        mov      dword ptr [ebp - 0x3c], esi
  10027682:  8d 7e 08                        lea      edi, [esi + 8]
  10027685:  c7 06 a0 46 05 10               mov      dword ptr [esi], 0x100546a0
  1002768B:  89 7d c0                        mov      dword ptr [ebp - 0x40], edi
  1002768E:  c7 47 24 00 00 00 00            mov      dword ptr [edi + 0x24], 0
  10027695:  8b 4d ec                        mov      ecx, dword ptr [ebp - 0x14]
  10027698:  c6 45 fc 04                     mov      byte ptr [ebp - 4], 4
  1002769C:  85 c9                           test     ecx, ecx
  1002769E:  74 08                           je       0x100276a8
  100276A0:  8b 01                           mov      eax, dword ptr [ecx]
  100276A2:  57                              push     edi
  100276A3:  ff 10                           call     dword ptr [eax]
  100276A5:  89 47 24                        mov      dword ptr [edi + 0x24], eax
  100276A8:  89 75 bc                        mov      dword ptr [ebp - 0x44], esi
  100276AB:  68 00 80 ff ff                  push     0xffff8000
  100276B0:  8d 45 98                        lea      eax, [ebp - 0x68]
  100276B3:  c6 45 fc 05                     mov      byte ptr [ebp - 4], 5
  100276B7:  50                              push     eax
  100276B8:  6a 20                           push     0x20
  100276BA:  53                              push     ebx
  100276BB:  e8 70 fd ff ff                  call     0x10027430  ; UI::RegisterFrameUIMessageCallback
  100276C0:  8b 4d bc                        mov      ecx, dword ptr [ebp - 0x44]
  100276C3:  83 c4 10                        add      esp, 0x10
  100276C6:  85 c9                           test     ecx, ecx
  100276C8:  74 11                           je       0x100276db
  100276CA:  8b 11                           mov      edx, dword ptr [ecx]
  100276CC:  8d 45 98                        lea      eax, [ebp - 0x68]
  100276CF:  3b c8                           cmp      ecx, eax
  100276D1:  0f 95 c0                        setne    al
  100276D4:  0f b6 c0                        movzx    eax, al
  100276D7:  50                              push     eax
  100276D8:  ff 52 10                        call     dword ptr [edx + 0x10]
  100276DB:  8b 4d ec                        mov      ecx, dword ptr [ebp - 0x14]
  100276DE:  85 c9                           test     ecx, ecx
  100276E0:  74 11                           je       0x100276f3
  100276E2:  8b 11                           mov      edx, dword ptr [ecx]
  100276E4:  8d 45 c8                        lea      eax, [ebp - 0x38]
  100276E7:  3b c8                           cmp      ecx, eax
  100276E9:  0f 95 c0                        setne    al
  100276EC:  0f b6 c0                        movzx    eax, al
  100276EF:  50                              push     eax
  100276F0:  ff 52 10                        call     dword ptr [edx + 0x10]
  100276F3:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  100276F6:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  100276FD:  59                              pop      ecx
  100276FE:  5f                              pop      edi
  100276FF:  5e                              pop      esi
  10027700:  5b                              pop      ebx
  10027701:  8b 4d f0                        mov      ecx, dword ptr [ebp - 0x10]
  10027704:  33 cd                           xor      ecx, ebp
  10027706:  e8 ac 4c 00 00                  call     0x1002c3b7
  1002770B:  8b e5                           mov      esp, ebp
  1002770D:  5d                              pop      ebp
  1002770E:  c3                              ret      


; === UI::RegisterKeyupCallback ===
; RVA: 0x00027710  Size: 255 bytes
; Exports: ?RegisterKeyupCallback@UI@GW@@YAXPAUHookEntry@2@ABV?$function@$$A6AXPAUHookStatus@GW@@I@Z@std@@@Z
;
  10027710:  55                              push     ebp
  10027711:  8b ec                           mov      ebp, esp
  10027713:  6a ff                           push     -1
  10027715:  68 fd b3 04 10                  push     0x1004b3fd
  1002771A:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  10027720:  50                              push     eax
  10027721:  83 ec 5c                        sub      esp, 0x5c
  10027724:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  10027729:  33 c5                           xor      eax, ebp
  1002772B:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  1002772E:  53                              push     ebx
  1002772F:  56                              push     esi
  10027730:  57                              push     edi
  10027731:  50                              push     eax
  10027732:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10027735:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  1002773B:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  1002773E:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10027741:  8b 48 24                        mov      ecx, dword ptr [eax + 0x24]
  10027744:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1002774B:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  10027752:  85 c9                           test     ecx, ecx
  10027754:  74 0b                           je       0x10027761
  10027756:  8b 01                           mov      eax, dword ptr [ecx]
  10027758:  8d 55 c8                        lea      edx, [ebp - 0x38]
  1002775B:  52                              push     edx
  1002775C:  ff 10                           call     dword ptr [eax]
  1002775E:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  10027761:  c7 45 fc 01 00 00 00            mov      dword ptr [ebp - 4], 1
  10027768:  c7 45 bc 00 00 00 00            mov      dword ptr [ebp - 0x44], 0
  1002776F:  6a 30                           push     0x30
  10027771:  c6 45 fc 02                     mov      byte ptr [ebp - 4], 2
  10027775:  e8 e3 48 00 00                  call     0x1002c05d
  1002777A:  8b f0                           mov      esi, eax
  1002777C:  83 c4 04                        add      esp, 4
  1002777F:  89 75 c4                        mov      dword ptr [ebp - 0x3c], esi
  10027782:  8d 7e 08                        lea      edi, [esi + 8]
  10027785:  c7 06 84 46 05 10               mov      dword ptr [esi], 0x10054684
  1002778B:  89 7d c0                        mov      dword ptr [ebp - 0x40], edi
  1002778E:  c7 47 24 00 00 00 00            mov      dword ptr [edi + 0x24], 0
  10027795:  8b 4d ec                        mov      ecx, dword ptr [ebp - 0x14]
  10027798:  c6 45 fc 04                     mov      byte ptr [ebp - 4], 4
  1002779C:  85 c9                           test     ecx, ecx
  1002779E:  74 08                           je       0x100277a8
  100277A0:  8b 01                           mov      eax, dword ptr [ecx]
  100277A2:  57                              push     edi
  100277A3:  ff 10                           call     dword ptr [eax]
  100277A5:  89 47 24                        mov      dword ptr [edi + 0x24], eax
  100277A8:  89 75 bc                        mov      dword ptr [ebp - 0x44], esi
  100277AB:  68 00 80 ff ff                  push     0xffff8000
  100277B0:  8d 45 98                        lea      eax, [ebp - 0x68]
  100277B3:  c6 45 fc 05                     mov      byte ptr [ebp - 4], 5
  100277B7:  50                              push     eax
  100277B8:  6a 22                           push     0x22
  100277BA:  53                              push     ebx
  100277BB:  e8 70 fc ff ff                  call     0x10027430  ; UI::RegisterFrameUIMessageCallback
  100277C0:  8b 4d bc                        mov      ecx, dword ptr [ebp - 0x44]
  100277C3:  83 c4 10                        add      esp, 0x10
  100277C6:  85 c9                           test     ecx, ecx
  100277C8:  74 11                           je       0x100277db
  100277CA:  8b 11                           mov      edx, dword ptr [ecx]
  100277CC:  8d 45 98                        lea      eax, [ebp - 0x68]
  100277CF:  3b c8                           cmp      ecx, eax
  100277D1:  0f 95 c0                        setne    al
  100277D4:  0f b6 c0                        movzx    eax, al
  100277D7:  50                              push     eax
  100277D8:  ff 52 10                        call     dword ptr [edx + 0x10]
  100277DB:  8b 4d ec                        mov      ecx, dword ptr [ebp - 0x14]
  100277DE:  85 c9                           test     ecx, ecx
  100277E0:  74 11                           je       0x100277f3
  100277E2:  8b 11                           mov      edx, dword ptr [ecx]
  100277E4:  8d 45 c8                        lea      eax, [ebp - 0x38]
  100277E7:  3b c8                           cmp      ecx, eax
  100277E9:  0f 95 c0                        setne    al
  100277EC:  0f b6 c0                        movzx    eax, al
  100277EF:  50                              push     eax
  100277F0:  ff 52 10                        call     dword ptr [edx + 0x10]
  100277F3:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  100277F6:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  100277FD:  59                              pop      ecx
  100277FE:  5f                              pop      edi
  100277FF:  5e                              pop      esi
  10027800:  5b                              pop      ebx
  10027801:  8b 4d f0                        mov      ecx, dword ptr [ebp - 0x10]
  10027804:  33 cd                           xor      ecx, ebp
  10027806:  e8 ac 4b 00 00                  call     0x1002c3b7
  1002780B:  8b e5                           mov      esp, ebp
  1002780D:  5d                              pop      ebp
  1002780E:  c3                              ret      


; === UI::RegisterUIMessageCallback ===
; RVA: 0x00027810  Size: 467 bytes
; Exports: ?RegisterUIMessageCallback@UI@GW@@YAXPAUHookEntry@2@W4UIMessage@12@ABV?$function@$$A6AXPAUHookStatus@GW@@W4UIMessage@UI@2@PAX2@Z@std@@H@Z
;
  10027810:  55                              push     ebp
  10027811:  8b ec                           mov      ebp, esp
  10027813:  6a ff                           push     -1
  10027815:  68 7d a7 04 10                  push     0x1004a77d
  1002781A:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  10027820:  50                              push     eax
  10027821:  83 ec 58                        sub      esp, 0x58
  10027824:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  10027829:  33 c5                           xor      eax, ebp
  1002782B:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  1002782E:  53                              push     ebx
  1002782F:  56                              push     esi
  10027830:  57                              push     edi
  10027831:  50                              push     eax
  10027832:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10027835:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  1002783B:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  1002783E:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10027841:  8b 4d 10                        mov      ecx, dword ptr [ebp + 0x10]
  10027844:  50                              push     eax
  10027845:  89 45 b0                        mov      dword ptr [ebp - 0x50], eax
  10027848:  89 4d bc                        mov      dword ptr [ebp - 0x44], ecx
  1002784B:  e8 e0 03 00 00                  call     0x10027c30  ; UI::RemoveUIMessageCallback
  10027850:  0f b6 45 0c                     movzx    eax, byte ptr [ebp + 0xc]
  10027854:  83 c4 08                        add      esp, 8
  10027857:  35 c5 9d 1c 81                  xor      eax, 0x811c9dc5
  1002785C:  69 c8 93 01 00 01               imul     ecx, eax, 0x1000193
  10027862:  0f b6 45 0d                     movzx    eax, byte ptr [ebp + 0xd]
  10027866:  33 c8                           xor      ecx, eax
  10027868:  0f b6 45 0e                     movzx    eax, byte ptr [ebp + 0xe]
  1002786C:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  10027872:  33 c8                           xor      ecx, eax
  10027874:  0f b6 45 0f                     movzx    eax, byte ptr [ebp + 0xf]
  10027878:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  1002787E:  33 c8                           xor      ecx, eax
  10027880:  69 c1 93 01 00 01               imul     eax, ecx, 0x1000193
  10027886:  b9 ec c5 08 10                  mov      ecx, 0x1008c5ec
  1002788B:  50                              push     eax
  1002788C:  8d 45 0c                        lea      eax, [ebp + 0xc]
  1002788F:  50                              push     eax
  10027890:  8d 45 b4                        lea      eax, [ebp - 0x4c]
  10027893:  50                              push     eax
  10027894:  e8 47 e9 fd ff                  call     0x100061e0
  10027899:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  1002789C:  85 c0                           test     eax, eax
  1002789E:  75 4c                           jne      0x100278ec
  100278A0:  89 45 a4                        mov      dword ptr [ebp - 0x5c], eax
  100278A3:  89 45 a8                        mov      dword ptr [ebp - 0x58], eax
  100278A6:  89 45 ac                        mov      dword ptr [ebp - 0x54], eax
  100278A9:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  100278AC:  b9 ec c5 08 10                  mov      ecx, 0x1008c5ec
  100278B1:  8d 45 0c                        lea      eax, [ebp + 0xc]
  100278B4:  50                              push     eax
  100278B5:  8d 45 b4                        lea      eax, [ebp - 0x4c]
  100278B8:  50                              push     eax
  100278B9:  e8 22 ea fd ff                  call     0x100062e0
  100278BE:  8b 30                           mov      esi, dword ptr [eax]
  100278C0:  8d 45 a4                        lea      eax, [ebp - 0x5c]
  100278C3:  83 c6 0c                        add      esi, 0xc
  100278C6:  3b f0                           cmp      esi, eax
  100278C8:  74 1b                           je       0x100278e5
  100278CA:  8b ce                           mov      ecx, esi
  100278CC:  e8 8f f8 fd ff                  call     0x10007160
  100278D1:  c7 06 00 00 00 00               mov      dword ptr [esi], 0
  100278D7:  c7 46 04 00 00 00 00            mov      dword ptr [esi + 4], 0
  100278DE:  c7 46 08 00 00 00 00            mov      dword ptr [esi + 8], 0
  100278E5:  c7 45 fc ff ff ff ff            mov      dword ptr [ebp - 4], 0xffffffff
  100278EC:  8d 45 0c                        lea      eax, [ebp + 0xc]
  100278EF:  b9 ec c5 08 10                  mov      ecx, 0x1008c5ec
  100278F4:  50                              push     eax
  100278F5:  8d 45 b4                        lea      eax, [ebp - 0x4c]
  100278F8:  50                              push     eax
  100278F9:  e8 e2 e9 fd ff                  call     0x100062e0
  100278FE:  b9 ec c5 08 10                  mov      ecx, 0x1008c5ec
  10027903:  8b 30                           mov      esi, dword ptr [eax]
  10027905:  8d 45 0c                        lea      eax, [ebp + 0xc]
  10027908:  50                              push     eax
  10027909:  8d 45 b4                        lea      eax, [ebp - 0x4c]
  1002790C:  50                              push     eax
  1002790D:  8b 76 0c                        mov      esi, dword ptr [esi + 0xc]
  10027910:  e8 cb e9 fd ff                  call     0x100062e0
  10027915:  8b 7d 14                        mov      edi, dword ptr [ebp + 0x14]
  10027918:  8b 00                           mov      eax, dword ptr [eax]
  1002791A:  3b 70 10                        cmp      esi, dword ptr [eax + 0x10]
  1002791D:  74 21                           je       0x10027940
  1002791F:  90                              nop      
  10027920:  39 3e                           cmp      dword ptr [esi], edi
  10027922:  7f 1c                           jg       0x10027940
  10027924:  8d 45 0c                        lea      eax, [ebp + 0xc]
  10027927:  b9 ec c5 08 10                  mov      ecx, 0x1008c5ec
  1002792C:  50                              push     eax
  1002792D:  8d 45 b4                        lea      eax, [ebp - 0x4c]
  10027930:  83 c6 30                        add      esi, 0x30
  10027933:  50                              push     eax
  10027934:  e8 a7 e9 fd ff                  call     0x100062e0
  10027939:  8b 00                           mov      eax, dword ptr [eax]
  1002793B:  3b 70 10                        cmp      esi, dword ptr [eax + 0x10]
  1002793E:  75 e0                           jne      0x10027920
  10027940:  8d 45 0c                        lea      eax, [ebp + 0xc]
  10027943:  b9 ec c5 08 10                  mov      ecx, 0x1008c5ec
  10027948:  50                              push     eax
  10027949:  8d 45 9c                        lea      eax, [ebp - 0x64]
  1002794C:  50                              push     eax
  1002794D:  e8 8e e9 fd ff                  call     0x100062e0
  10027952:  8b 18                           mov      ebx, dword ptr [eax]
  10027954:  89 7d c0                        mov      dword ptr [ebp - 0x40], edi
  10027957:  8b 7d b0                        mov      edi, dword ptr [ebp - 0x50]
  1002795A:  89 7d c4                        mov      dword ptr [ebp - 0x3c], edi
  1002795D:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  10027964:  8b 4d bc                        mov      ecx, dword ptr [ebp - 0x44]
  10027967:  c7 45 fc 01 00 00 00            mov      dword ptr [ebp - 4], 1
  1002796E:  8b 49 24                        mov      ecx, dword ptr [ecx + 0x24]
  10027971:  85 c9                           test     ecx, ecx
  10027973:  74 0b                           je       0x10027980
  10027975:  8b 01                           mov      eax, dword ptr [ecx]
  10027977:  8d 55 c8                        lea      edx, [ebp - 0x38]
  1002797A:  52                              push     edx
  1002797B:  ff 10                           call     dword ptr [eax]
  1002797D:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  10027980:  8d 45 c0                        lea      eax, [ebp - 0x40]
  10027983:  c7 45 fc 02 00 00 00            mov      dword ptr [ebp - 4], 2
  1002798A:  50                              push     eax
  1002798B:  56                              push     esi
  1002798C:  8d 45 bc                        lea      eax, [ebp - 0x44]
  1002798F:  50                              push     eax
  10027990:  8d 4b 0c                        lea      ecx, [ebx + 0xc]
  10027993:  e8 a8 fa fd ff                  call     0x10007440
  10027998:  8b 4d ec                        mov      ecx, dword ptr [ebp - 0x14]
  1002799B:  c7 45 fc ff ff ff ff            mov      dword ptr [ebp - 4], 0xffffffff
  100279A2:  85 c9                           test     ecx, ecx
  100279A4:  74 18                           je       0x100279be
  100279A6:  8b 11                           mov      edx, dword ptr [ecx]
  100279A8:  8d 45 c8                        lea      eax, [ebp - 0x38]
  100279AB:  3b c8                           cmp      ecx, eax
  100279AD:  0f 95 c0                        setne    al
  100279B0:  0f b6 c0                        movzx    eax, al
  100279B3:  50                              push     eax
  100279B4:  ff 52 10                        call     dword ptr [edx + 0x10]
  100279B7:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  100279BE:  57                              push     edi
  100279BF:  e8 5c e2 ff ff                  call     0x10025c20
  100279C4:  83 c4 04                        add      esp, 4
  100279C7:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  100279CA:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  100279D1:  59                              pop      ecx
  100279D2:  5f                              pop      edi
  100279D3:  5e                              pop      esi
  100279D4:  5b                              pop      ebx
  100279D5:  8b 4d f0                        mov      ecx, dword ptr [ebp - 0x10]
  100279D8:  33 cd                           xor      ecx, ebp
  100279DA:  e8 d8 49 00 00                  call     0x1002c3b7
  100279DF:  8b e5                           mov      esp, ebp
  100279E1:  5d                              pop      ebp
  100279E2:  c3                              ret      


; === UI::RemoveCreateUIComponentCallback ===
; RVA: 0x000279F0  Size: 243 bytes
; Exports: ?RemoveCreateUIComponentCallback@UI@GW@@YAXPAUHookEntry@2@@Z
;
  100279F0:  55                              push     ebp
  100279F1:  8b ec                           mov      ebp, esp
  100279F3:  a1 e0 c5 08 10                  mov      eax, dword ptr [0x1008c5e0]
  100279F8:  53                              push     ebx
  100279F9:  8b 1d e4 c5 08 10               mov      ebx, dword ptr [0x1008c5e4]
  100279FF:  3b c3                           cmp      eax, ebx
  10027A01:  0f 84 d9 00 00 00               je       0x10027ae0
  10027A07:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10027A0A:  57                              push     edi
  10027A0B:  0f 1f 44 00 00                  nop      dword ptr [eax + eax]
  10027A10:  8d 78 30                        lea      edi, [eax + 0x30]
  10027A13:  39 48 04                        cmp      dword ptr [eax + 4], ecx
  10027A16:  74 0a                           je       0x10027a22
  10027A18:  8b c7                           mov      eax, edi
  10027A1A:  3b c3                           cmp      eax, ebx
  10027A1C:  75 f2                           jne      0x10027a10
  10027A1E:  5f                              pop      edi
  10027A1F:  5b                              pop      ebx
  10027A20:  5d                              pop      ebp
  10027A21:  c3                              ret      
  10027A22:  56                              push     esi
  10027A23:  3b fb                           cmp      edi, ebx
  10027A25:  0f 84 85 00 00 00               je       0x10027ab0
  10027A2B:  8d 77 fc                        lea      esi, [edi - 4]
  10027A2E:  66 90                           nop      
  10027A30:  8b 07                           mov      eax, dword ptr [edi]
  10027A32:  8d 4e dc                        lea      ecx, [esi - 0x24]
  10027A35:  89 46 d4                        mov      dword ptr [esi - 0x2c], eax
  10027A38:  8b 46 08                        mov      eax, dword ptr [esi + 8]
  10027A3B:  89 46 d8                        mov      dword ptr [esi - 0x28], eax
  10027A3E:  8d 46 0c                        lea      eax, [esi + 0xc]
  10027A41:  3b c8                           cmp      ecx, eax
  10027A43:  74 5b                           je       0x10027aa0
  10027A45:  8b 0e                           mov      ecx, dword ptr [esi]
  10027A47:  85 c9                           test     ecx, ecx
  10027A49:  74 1a                           je       0x10027a65
  10027A4B:  8b 11                           mov      edx, dword ptr [ecx]
  10027A4D:  8d 46 dc                        lea      eax, [esi - 0x24]
  10027A50:  3b c8                           cmp      ecx, eax
  10027A52:  0f 95 c0                        setne    al
  10027A55:  0f b6 c0                        movzx    eax, al
  10027A58:  50                              push     eax
  10027A59:  ff 52 10                        call     dword ptr [edx + 0x10]
  10027A5C:  c7 06 00 00 00 00               mov      dword ptr [esi], 0
  10027A62:  8d 46 0c                        lea      eax, [esi + 0xc]
  10027A65:  8b 4e 30                        mov      ecx, dword ptr [esi + 0x30]
  10027A68:  85 c9                           test     ecx, ecx
  10027A6A:  74 34                           je       0x10027aa0
  10027A6C:  3b c8                           cmp      ecx, eax
  10027A6E:  75 27                           jne      0x10027a97
  10027A70:  8b 01                           mov      eax, dword ptr [ecx]
  10027A72:  8b 50 04                        mov      edx, dword ptr [eax + 4]
  10027A75:  8d 46 dc                        lea      eax, [esi - 0x24]
  10027A78:  50                              push     eax
  10027A79:  ff d2                           call     edx
  10027A7B:  89 06                           mov      dword ptr [esi], eax
  10027A7D:  8b 4e 30                        mov      ecx, dword ptr [esi + 0x30]
  10027A80:  85 c9                           test     ecx, ecx
  10027A82:  74 1c                           je       0x10027aa0
  10027A84:  8b 11                           mov      edx, dword ptr [ecx]
  10027A86:  8d 46 0c                        lea      eax, [esi + 0xc]
  10027A89:  3b c8                           cmp      ecx, eax
  10027A8B:  0f 95 c0                        setne    al
  10027A8E:  0f b6 c0                        movzx    eax, al
  10027A91:  50                              push     eax
  10027A92:  ff 52 10                        call     dword ptr [edx + 0x10]
  10027A95:  eb 02                           jmp      0x10027a99
  10027A97:  89 0e                           mov      dword ptr [esi], ecx
  10027A99:  c7 46 30 00 00 00 00            mov      dword ptr [esi + 0x30], 0
  10027AA0:  83 c7 30                        add      edi, 0x30
  10027AA3:  83 c6 30                        add      esi, 0x30
  10027AA6:  3b fb                           cmp      edi, ebx
  10027AA8:  75 86                           jne      0x10027a30
  10027AAA:  8b 1d e4 c5 08 10               mov      ebx, dword ptr [0x1008c5e4]
  10027AB0:  8b 4b fc                        mov      ecx, dword ptr [ebx - 4]
  10027AB3:  8d 73 d8                        lea      esi, [ebx - 0x28]
  10027AB6:  85 c9                           test     ecx, ecx
  10027AB8:  74 1b                           je       0x10027ad5
  10027ABA:  8b 11                           mov      edx, dword ptr [ecx]
  10027ABC:  3b ce                           cmp      ecx, esi
  10027ABE:  0f 95 c0                        setne    al
  10027AC1:  0f b6 c0                        movzx    eax, al
  10027AC4:  50                              push     eax
  10027AC5:  ff 52 10                        call     dword ptr [edx + 0x10]
  10027AC8:  c7 46 24 00 00 00 00            mov      dword ptr [esi + 0x24], 0
  10027ACF:  8b 1d e4 c5 08 10               mov      ebx, dword ptr [0x1008c5e4]
  10027AD5:  83 eb 30                        sub      ebx, 0x30
  10027AD8:  5e                              pop      esi
  10027AD9:  89 1d e4 c5 08 10               mov      dword ptr [0x1008c5e4], ebx
  10027ADF:  5f                              pop      edi
  10027AE0:  5b                              pop      ebx
  10027AE1:  5d                              pop      ebp
  10027AE2:  c3                              ret      


; === UI::RemoveFrameUIMessageCallback ===
; RVA: 0x00027AF0  Size: 296 bytes
; Exports: ?RemoveFrameUIMessageCallback@UI@GW@@YAXPAUHookEntry@2@@Z
;
  10027AF0:  55                              push     ebp
  10027AF1:  8b ec                           mov      ebp, esp
  10027AF3:  83 ec 0c                        sub      esp, 0xc
  10027AF6:  56                              push     esi
  10027AF7:  57                              push     edi
  10027AF8:  8b 3d 10 c6 08 10               mov      edi, dword ptr [0x1008c610]
  10027AFE:  89 7d f4                        mov      dword ptr [ebp - 0xc], edi
  10027B01:  8b 37                           mov      esi, dword ptr [edi]
  10027B03:  3b f7                           cmp      esi, edi
  10027B05:  0f 84 fc 00 00 00               je       0x10027c07
  10027B0B:  53                              push     ebx
  10027B0C:  0f 1f 40 00                     nop      dword ptr [eax]
  10027B10:  8b 56 10                        mov      edx, dword ptr [esi + 0x10]
  10027B13:  8b 46 0c                        mov      eax, dword ptr [esi + 0xc]
  10027B16:  89 55 f8                        mov      dword ptr [ebp - 8], edx
  10027B19:  3b c2                           cmp      eax, edx
  10027B1B:  0f 84 db 00 00 00               je       0x10027bfc
  10027B21:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  10027B24:  8d 48 30                        lea      ecx, [eax + 0x30]
  10027B27:  89 4d fc                        mov      dword ptr [ebp - 4], ecx
  10027B2A:  39 58 04                        cmp      dword ptr [eax + 4], ebx
  10027B2D:  74 0b                           je       0x10027b3a
  10027B2F:  8b c1                           mov      eax, ecx
  10027B31:  3b c2                           cmp      eax, edx
  10027B33:  75 ef                           jne      0x10027b24
  10027B35:  e9 c2 00 00 00                  jmp      0x10027bfc
  10027B3A:  3b ca                           cmp      ecx, edx
  10027B3C:  0f 84 94 00 00 00               je       0x10027bd6
  10027B42:  8b 7d f8                        mov      edi, dword ptr [ebp - 8]
  10027B45:  8d 59 fc                        lea      ebx, [ecx - 4]
  10027B48:  8b 01                           mov      eax, dword ptr [ecx]
  10027B4A:  8d 53 0c                        lea      edx, [ebx + 0xc]
  10027B4D:  89 43 d4                        mov      dword ptr [ebx - 0x2c], eax
  10027B50:  8b 43 08                        mov      eax, dword ptr [ebx + 8]
  10027B53:  89 43 d8                        mov      dword ptr [ebx - 0x28], eax
  10027B56:  8d 43 dc                        lea      eax, [ebx - 0x24]
  10027B59:  3b c2                           cmp      eax, edx
  10027B5B:  74 65                           je       0x10027bc2
  10027B5D:  8b 03                           mov      eax, dword ptr [ebx]
  10027B5F:  85 c0                           test     eax, eax
  10027B61:  74 1f                           je       0x10027b82
  10027B63:  8b 10                           mov      edx, dword ptr [eax]
  10027B65:  8d 4b dc                        lea      ecx, [ebx - 0x24]
  10027B68:  3b c1                           cmp      eax, ecx
  10027B6A:  8b 0b                           mov      ecx, dword ptr [ebx]
  10027B6C:  0f 95 c0                        setne    al
  10027B6F:  0f b6 c0                        movzx    eax, al
  10027B72:  50                              push     eax
  10027B73:  ff 52 10                        call     dword ptr [edx + 0x10]
  10027B76:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10027B79:  8d 53 0c                        lea      edx, [ebx + 0xc]
  10027B7C:  c7 03 00 00 00 00               mov      dword ptr [ebx], 0
  10027B82:  8b 43 30                        mov      eax, dword ptr [ebx + 0x30]
  10027B85:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  10027B88:  85 c0                           test     eax, eax
  10027B8A:  74 36                           je       0x10027bc2
  10027B8C:  3b c2                           cmp      eax, edx
  10027B8E:  75 7d                           jne      0x10027c0d
  10027B90:  8b 00                           mov      eax, dword ptr [eax]
  10027B92:  8b 4d f8                        mov      ecx, dword ptr [ebp - 8]
  10027B95:  8b 50 04                        mov      edx, dword ptr [eax + 4]
  10027B98:  8d 43 dc                        lea      eax, [ebx - 0x24]
  10027B9B:  50                              push     eax
  10027B9C:  ff d2                           call     edx
  10027B9E:  89 03                           mov      dword ptr [ebx], eax
  10027BA0:  8b 4b 30                        mov      ecx, dword ptr [ebx + 0x30]
  10027BA3:  85 c9                           test     ecx, ecx
  10027BA5:  74 18                           je       0x10027bbf
  10027BA7:  8b 11                           mov      edx, dword ptr [ecx]
  10027BA9:  8d 43 0c                        lea      eax, [ebx + 0xc]
  10027BAC:  3b c8                           cmp      ecx, eax
  10027BAE:  0f 95 c0                        setne    al
  10027BB1:  0f b6 c0                        movzx    eax, al
  10027BB4:  50                              push     eax
  10027BB5:  ff 52 10                        call     dword ptr [edx + 0x10]
  10027BB8:  c7 43 30 00 00 00 00            mov      dword ptr [ebx + 0x30], 0
  10027BBF:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10027BC2:  83 c1 30                        add      ecx, 0x30
  10027BC5:  83 c3 30                        add      ebx, 0x30
  10027BC8:  89 4d fc                        mov      dword ptr [ebp - 4], ecx
  10027BCB:  3b cf                           cmp      ecx, edi
  10027BCD:  0f 85 75 ff ff ff               jne      0x10027b48
  10027BD3:  8b 7d f4                        mov      edi, dword ptr [ebp - 0xc]
  10027BD6:  8b 5e 10                        mov      ebx, dword ptr [esi + 0x10]
  10027BD9:  83 eb 28                        sub      ebx, 0x28
  10027BDC:  8b 4b 24                        mov      ecx, dword ptr [ebx + 0x24]
  10027BDF:  85 c9                           test     ecx, ecx
  10027BE1:  74 15                           je       0x10027bf8
  10027BE3:  8b 11                           mov      edx, dword ptr [ecx]
  10027BE5:  3b cb                           cmp      ecx, ebx
  10027BE7:  0f 95 c0                        setne    al
  10027BEA:  0f b6 c0                        movzx    eax, al
  10027BED:  50                              push     eax
  10027BEE:  ff 52 10                        call     dword ptr [edx + 0x10]
  10027BF1:  c7 43 24 00 00 00 00            mov      dword ptr [ebx + 0x24], 0
  10027BF8:  83 46 10 d0                     add      dword ptr [esi + 0x10], -0x30
  10027BFC:  8b 36                           mov      esi, dword ptr [esi]
  10027BFE:  3b f7                           cmp      esi, edi
  10027C00:  0f 85 0a ff ff ff               jne      0x10027b10
  10027C06:  5b                              pop      ebx
  10027C07:  5f                              pop      edi
  10027C08:  5e                              pop      esi
  10027C09:  8b e5                           mov      esp, ebp
  10027C0B:  5d                              pop      ebp
  10027C0C:  c3                              ret      
  10027C0D:  89 03                           mov      dword ptr [ebx], eax
  10027C0F:  c7 43 30 00 00 00 00            mov      dword ptr [ebx + 0x30], 0
  10027C16:  eb aa                           jmp      0x10027bc2


; === UI::RemoveKeydownCallback, UI::RemoveKeyupCallback ===
; RVA: 0x00027C20  Size: 368 bytes
; Exports: ?RemoveKeydownCallback@UI@GW@@YAXPAUHookEntry@2@@Z, ?RemoveKeyupCallback@UI@GW@@YAXPAUHookEntry@2@@Z
;
  10027C20:  e9 cb fe ff ff                  jmp      0x10027af0
  10027C25:  cc                              int3     
  10027C26:  cc                              int3     
  10027C27:  cc                              int3     
  10027C28:  cc                              int3     
  10027C29:  cc                              int3     
  10027C2A:  cc                              int3     
  10027C2B:  cc                              int3     
  10027C2C:  cc                              int3     
  10027C2D:  cc                              int3     
  10027C2E:  cc                              int3     
  10027C2F:  cc                              int3     
  10027C30:  55                              push     ebp
  10027C31:  8b ec                           mov      ebp, esp
  10027C33:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10027C36:  83 ec 0c                        sub      esp, 0xc
  10027C39:  53                              push     ebx
  10027C3A:  56                              push     esi
  10027C3B:  57                              push     edi
  10027C3C:  85 c0                           test     eax, eax
  10027C3E:  75 29                           jne      0x10027c69
  10027C40:  8b 3d f0 c5 08 10               mov      edi, dword ptr [0x1008c5f0]
  10027C46:  8b 37                           mov      esi, dword ptr [edi]
  10027C48:  3b f7                           cmp      esi, edi
  10027C4A:  74 16                           je       0x10027c62
  10027C4C:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  10027C4F:  90                              nop      
  10027C50:  ff 76 08                        push     dword ptr [esi + 8]
  10027C53:  53                              push     ebx
  10027C54:  e8 d7 ff ff ff                  call     0x10027c30  ; UI::RemoveUIMessageCallback
  10027C59:  8b 36                           mov      esi, dword ptr [esi]
  10027C5B:  83 c4 08                        add      esp, 8
  10027C5E:  3b f7                           cmp      esi, edi
  10027C60:  75 ee                           jne      0x10027c50
  10027C62:  5f                              pop      edi
  10027C63:  5e                              pop      esi
  10027C64:  5b                              pop      ebx
  10027C65:  8b e5                           mov      esp, ebp
  10027C67:  5d                              pop      ebp
  10027C68:  c3                              ret      
  10027C69:  0f b6 c0                        movzx    eax, al
  10027C6C:  35 c5 9d 1c 81                  xor      eax, 0x811c9dc5
  10027C71:  69 c8 93 01 00 01               imul     ecx, eax, 0x1000193
  10027C77:  0f b6 45 0d                     movzx    eax, byte ptr [ebp + 0xd]
  10027C7B:  33 c8                           xor      ecx, eax
  10027C7D:  0f b6 45 0e                     movzx    eax, byte ptr [ebp + 0xe]
  10027C81:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  10027C87:  33 c8                           xor      ecx, eax
  10027C89:  0f b6 45 0f                     movzx    eax, byte ptr [ebp + 0xf]
  10027C8D:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  10027C93:  33 c8                           xor      ecx, eax
  10027C95:  69 c1 93 01 00 01               imul     eax, ecx, 0x1000193
  10027C9B:  b9 ec c5 08 10                  mov      ecx, 0x1008c5ec
  10027CA0:  50                              push     eax
  10027CA1:  8d 45 0c                        lea      eax, [ebp + 0xc]
  10027CA4:  50                              push     eax
  10027CA5:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10027CA8:  50                              push     eax
  10027CA9:  e8 32 e5 fd ff                  call     0x100061e0
  10027CAE:  8b 1d f0 c5 08 10               mov      ebx, dword ptr [0x1008c5f0]
  10027CB4:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  10027CB7:  85 c0                           test     eax, eax
  10027CB9:  0f 45 d8                        cmovne   ebx, eax
  10027CBC:  89 5d fc                        mov      dword ptr [ebp - 4], ebx
  10027CBF:  3b 1d f0 c5 08 10               cmp      ebx, dword ptr [0x1008c5f0]
  10027CC5:  74 9b                           je       0x10027c62
  10027CC7:  8b 7b 0c                        mov      edi, dword ptr [ebx + 0xc]
  10027CCA:  8b 4b 10                        mov      ecx, dword ptr [ebx + 0x10]
  10027CCD:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  10027CD0:  8b c7                           mov      eax, edi
  10027CD2:  3b f9                           cmp      edi, ecx
  10027CD4:  74 8c                           je       0x10027c62
  10027CD6:  83 c7 30                        add      edi, 0x30
  10027CD9:  39 50 04                        cmp      dword ptr [eax + 4], edx
  10027CDC:  75 f2                           jne      0x10027cd0
  10027CDE:  8b c1                           mov      eax, ecx
  10027CE0:  89 45 0c                        mov      dword ptr [ebp + 0xc], eax
  10027CE3:  3b f8                           cmp      edi, eax
  10027CE5:  74 7e                           je       0x10027d65
  10027CE7:  8d 77 fc                        lea      esi, [edi - 4]
  10027CEA:  66 0f 1f 44 00 00               nop      word ptr [eax + eax]
  10027CF0:  8b 07                           mov      eax, dword ptr [edi]
  10027CF2:  8d 5e 0c                        lea      ebx, [esi + 0xc]
  10027CF5:  89 46 d4                        mov      dword ptr [esi - 0x2c], eax
  10027CF8:  8b 46 08                        mov      eax, dword ptr [esi + 8]
  10027CFB:  89 46 d8                        mov      dword ptr [esi - 0x28], eax
  10027CFE:  8d 46 dc                        lea      eax, [esi - 0x24]
  10027D01:  3b c3                           cmp      eax, ebx
  10027D03:  74 52                           je       0x10027d57
  10027D05:  8b 0e                           mov      ecx, dword ptr [esi]
  10027D07:  85 c9                           test     ecx, ecx
  10027D09:  74 14                           je       0x10027d1f
  10027D0B:  8b 11                           mov      edx, dword ptr [ecx]
  10027D0D:  3b c8                           cmp      ecx, eax
  10027D0F:  0f 95 c0                        setne    al
  10027D12:  0f b6 c0                        movzx    eax, al
  10027D15:  50                              push     eax
  10027D16:  ff 52 10                        call     dword ptr [edx + 0x10]
  10027D19:  c7 06 00 00 00 00               mov      dword ptr [esi], 0
  10027D1F:  8b 4e 30                        mov      ecx, dword ptr [esi + 0x30]
  10027D22:  85 c9                           test     ecx, ecx
  10027D24:  74 31                           je       0x10027d57
  10027D26:  3b cb                           cmp      ecx, ebx
  10027D28:  75 24                           jne      0x10027d4e
  10027D2A:  8b 01                           mov      eax, dword ptr [ecx]
  10027D2C:  8b 50 04                        mov      edx, dword ptr [eax + 4]
  10027D2F:  8d 46 dc                        lea      eax, [esi - 0x24]
  10027D32:  50                              push     eax
  10027D33:  ff d2                           call     edx
  10027D35:  89 06                           mov      dword ptr [esi], eax
  10027D37:  8b 4e 30                        mov      ecx, dword ptr [esi + 0x30]
  10027D3A:  85 c9                           test     ecx, ecx
  10027D3C:  74 19                           je       0x10027d57
  10027D3E:  8b 11                           mov      edx, dword ptr [ecx]
  10027D40:  3b cb                           cmp      ecx, ebx
  10027D42:  0f 95 c0                        setne    al
  10027D45:  0f b6 c0                        movzx    eax, al
  10027D48:  50                              push     eax
  10027D49:  ff 52 10                        call     dword ptr [edx + 0x10]
  10027D4C:  eb 02                           jmp      0x10027d50
  10027D4E:  89 0e                           mov      dword ptr [esi], ecx
  10027D50:  c7 46 30 00 00 00 00            mov      dword ptr [esi + 0x30], 0
  10027D57:  83 c7 30                        add      edi, 0x30
  10027D5A:  83 c6 30                        add      esi, 0x30
  10027D5D:  3b 7d 0c                        cmp      edi, dword ptr [ebp + 0xc]
  10027D60:  75 8e                           jne      0x10027cf0
  10027D62:  8b 5d fc                        mov      ebx, dword ptr [ebp - 4]
  10027D65:  8b 73 10                        mov      esi, dword ptr [ebx + 0x10]
  10027D68:  83 ee 28                        sub      esi, 0x28
  10027D6B:  8b 4e 24                        mov      ecx, dword ptr [esi + 0x24]
  10027D6E:  85 c9                           test     ecx, ecx
  10027D70:  74 15                           je       0x10027d87
  10027D72:  8b 11                           mov      edx, dword ptr [ecx]
  10027D74:  3b ce                           cmp      ecx, esi
  10027D76:  0f 95 c0                        setne    al
  10027D79:  0f b6 c0                        movzx    eax, al
  10027D7C:  50                              push     eax
  10027D7D:  ff 52 10                        call     dword ptr [edx + 0x10]
  10027D80:  c7 46 24 00 00 00 00            mov      dword ptr [esi + 0x24], 0
  10027D87:  83 43 10 d0                     add      dword ptr [ebx + 0x10], -0x30
  10027D8B:  e9 37 ff ff ff                  jmp      0x10027cc7


; === UI::RemoveUIMessageCallback ===
; RVA: 0x00027C30  Size: 352 bytes
; Exports: ?RemoveUIMessageCallback@UI@GW@@YAXPAUHookEntry@2@W4UIMessage@12@@Z
;
  10027C30:  55                              push     ebp
  10027C31:  8b ec                           mov      ebp, esp
  10027C33:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10027C36:  83 ec 0c                        sub      esp, 0xc
  10027C39:  53                              push     ebx
  10027C3A:  56                              push     esi
  10027C3B:  57                              push     edi
  10027C3C:  85 c0                           test     eax, eax
  10027C3E:  75 29                           jne      0x10027c69
  10027C40:  8b 3d f0 c5 08 10               mov      edi, dword ptr [0x1008c5f0]
  10027C46:  8b 37                           mov      esi, dword ptr [edi]
  10027C48:  3b f7                           cmp      esi, edi
  10027C4A:  74 16                           je       0x10027c62
  10027C4C:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  10027C4F:  90                              nop      
  10027C50:  ff 76 08                        push     dword ptr [esi + 8]
  10027C53:  53                              push     ebx
  10027C54:  e8 d7 ff ff ff                  call     0x10027c30  ; UI::RemoveUIMessageCallback
  10027C59:  8b 36                           mov      esi, dword ptr [esi]
  10027C5B:  83 c4 08                        add      esp, 8
  10027C5E:  3b f7                           cmp      esi, edi
  10027C60:  75 ee                           jne      0x10027c50
  10027C62:  5f                              pop      edi
  10027C63:  5e                              pop      esi
  10027C64:  5b                              pop      ebx
  10027C65:  8b e5                           mov      esp, ebp
  10027C67:  5d                              pop      ebp
  10027C68:  c3                              ret      
  10027C69:  0f b6 c0                        movzx    eax, al
  10027C6C:  35 c5 9d 1c 81                  xor      eax, 0x811c9dc5
  10027C71:  69 c8 93 01 00 01               imul     ecx, eax, 0x1000193
  10027C77:  0f b6 45 0d                     movzx    eax, byte ptr [ebp + 0xd]
  10027C7B:  33 c8                           xor      ecx, eax
  10027C7D:  0f b6 45 0e                     movzx    eax, byte ptr [ebp + 0xe]
  10027C81:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  10027C87:  33 c8                           xor      ecx, eax
  10027C89:  0f b6 45 0f                     movzx    eax, byte ptr [ebp + 0xf]
  10027C8D:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  10027C93:  33 c8                           xor      ecx, eax
  10027C95:  69 c1 93 01 00 01               imul     eax, ecx, 0x1000193
  10027C9B:  b9 ec c5 08 10                  mov      ecx, 0x1008c5ec
  10027CA0:  50                              push     eax
  10027CA1:  8d 45 0c                        lea      eax, [ebp + 0xc]
  10027CA4:  50                              push     eax
  10027CA5:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10027CA8:  50                              push     eax
  10027CA9:  e8 32 e5 fd ff                  call     0x100061e0
  10027CAE:  8b 1d f0 c5 08 10               mov      ebx, dword ptr [0x1008c5f0]
  10027CB4:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  10027CB7:  85 c0                           test     eax, eax
  10027CB9:  0f 45 d8                        cmovne   ebx, eax
  10027CBC:  89 5d fc                        mov      dword ptr [ebp - 4], ebx
  10027CBF:  3b 1d f0 c5 08 10               cmp      ebx, dword ptr [0x1008c5f0]
  10027CC5:  74 9b                           je       0x10027c62
  10027CC7:  8b 7b 0c                        mov      edi, dword ptr [ebx + 0xc]
  10027CCA:  8b 4b 10                        mov      ecx, dword ptr [ebx + 0x10]
  10027CCD:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  10027CD0:  8b c7                           mov      eax, edi
  10027CD2:  3b f9                           cmp      edi, ecx
  10027CD4:  74 8c                           je       0x10027c62
  10027CD6:  83 c7 30                        add      edi, 0x30
  10027CD9:  39 50 04                        cmp      dword ptr [eax + 4], edx
  10027CDC:  75 f2                           jne      0x10027cd0
  10027CDE:  8b c1                           mov      eax, ecx
  10027CE0:  89 45 0c                        mov      dword ptr [ebp + 0xc], eax
  10027CE3:  3b f8                           cmp      edi, eax
  10027CE5:  74 7e                           je       0x10027d65
  10027CE7:  8d 77 fc                        lea      esi, [edi - 4]
  10027CEA:  66 0f 1f 44 00 00               nop      word ptr [eax + eax]
  10027CF0:  8b 07                           mov      eax, dword ptr [edi]
  10027CF2:  8d 5e 0c                        lea      ebx, [esi + 0xc]
  10027CF5:  89 46 d4                        mov      dword ptr [esi - 0x2c], eax
  10027CF8:  8b 46 08                        mov      eax, dword ptr [esi + 8]
  10027CFB:  89 46 d8                        mov      dword ptr [esi - 0x28], eax
  10027CFE:  8d 46 dc                        lea      eax, [esi - 0x24]
  10027D01:  3b c3                           cmp      eax, ebx
  10027D03:  74 52                           je       0x10027d57
  10027D05:  8b 0e                           mov      ecx, dword ptr [esi]
  10027D07:  85 c9                           test     ecx, ecx
  10027D09:  74 14                           je       0x10027d1f
  10027D0B:  8b 11                           mov      edx, dword ptr [ecx]
  10027D0D:  3b c8                           cmp      ecx, eax
  10027D0F:  0f 95 c0                        setne    al
  10027D12:  0f b6 c0                        movzx    eax, al
  10027D15:  50                              push     eax
  10027D16:  ff 52 10                        call     dword ptr [edx + 0x10]
  10027D19:  c7 06 00 00 00 00               mov      dword ptr [esi], 0
  10027D1F:  8b 4e 30                        mov      ecx, dword ptr [esi + 0x30]
  10027D22:  85 c9                           test     ecx, ecx
  10027D24:  74 31                           je       0x10027d57
  10027D26:  3b cb                           cmp      ecx, ebx
  10027D28:  75 24                           jne      0x10027d4e
  10027D2A:  8b 01                           mov      eax, dword ptr [ecx]
  10027D2C:  8b 50 04                        mov      edx, dword ptr [eax + 4]
  10027D2F:  8d 46 dc                        lea      eax, [esi - 0x24]
  10027D32:  50                              push     eax
  10027D33:  ff d2                           call     edx
  10027D35:  89 06                           mov      dword ptr [esi], eax
  10027D37:  8b 4e 30                        mov      ecx, dword ptr [esi + 0x30]
  10027D3A:  85 c9                           test     ecx, ecx
  10027D3C:  74 19                           je       0x10027d57
  10027D3E:  8b 11                           mov      edx, dword ptr [ecx]
  10027D40:  3b cb                           cmp      ecx, ebx
  10027D42:  0f 95 c0                        setne    al
  10027D45:  0f b6 c0                        movzx    eax, al
  10027D48:  50                              push     eax
  10027D49:  ff 52 10                        call     dword ptr [edx + 0x10]
  10027D4C:  eb 02                           jmp      0x10027d50
  10027D4E:  89 0e                           mov      dword ptr [esi], ecx
  10027D50:  c7 46 30 00 00 00 00            mov      dword ptr [esi + 0x30], 0
  10027D57:  83 c7 30                        add      edi, 0x30
  10027D5A:  83 c6 30                        add      esi, 0x30
  10027D5D:  3b 7d 0c                        cmp      edi, dword ptr [ebp + 0xc]
  10027D60:  75 8e                           jne      0x10027cf0
  10027D62:  8b 5d fc                        mov      ebx, dword ptr [ebp - 4]
  10027D65:  8b 73 10                        mov      esi, dword ptr [ebx + 0x10]
  10027D68:  83 ee 28                        sub      esi, 0x28
  10027D6B:  8b 4e 24                        mov      ecx, dword ptr [esi + 0x24]
  10027D6E:  85 c9                           test     ecx, ecx
  10027D70:  74 15                           je       0x10027d87
  10027D72:  8b 11                           mov      edx, dword ptr [ecx]
  10027D74:  3b ce                           cmp      ecx, esi
  10027D76:  0f 95 c0                        setne    al
  10027D79:  0f b6 c0                        movzx    eax, al
  10027D7C:  50                              push     eax
  10027D7D:  ff 52 10                        call     dword ptr [edx + 0x10]
  10027D80:  c7 46 24 00 00 00 00            mov      dword ptr [esi + 0x24], 0
  10027D87:  83 43 10 d0                     add      dword ptr [ebx + 0x10], -0x30
  10027D8B:  e9 37 ff ff ff                  jmp      0x10027cc7


; === UI::SelectDropdownOption, SelectDropdownOption ===
; RVA: 0x00027D90  Size: 27 bytes
; Exports: ?SelectDropdownOption@UI@GW@@YA_NPAUFrame@12@I@Z, SelectDropdownOption
;
  10027D90:  55                              push     ebp
  10027D91:  8b ec                           mov      ebp, esp
  10027D93:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10027D96:  85 c9                           test     ecx, ecx
  10027D98:  74 0d                           je       0x10027da7
  10027D9A:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10027D9D:  83 c1 fc                        add      ecx, -4
  10027DA0:  e8 fb f8 fe ff                  call     0x100176a0  ; DropdownFrame::SelectOption, DropdownFrame::SetValue
  10027DA5:  5d                              pop      ebp
  10027DA6:  c3                              ret      
  10027DA7:  32 c0                           xor      al, al
  10027DA9:  5d                              pop      ebp
  10027DAA:  c3                              ret      


; === UI::SendFrameUIMessage ===
; RVA: 0x00027F20  Size: 892 bytes
; Exports: ?SendFrameUIMessage@UI@GW@@YA_NPAUFrame@12@W4UIMessage@12@PAX2@Z
;
  10027F20:  55                              push     ebp
  10027F21:  8b ec                           mov      ebp, esp
  10027F23:  83 ec 24                        sub      esp, 0x24
  10027F26:  83 3d 54 c5 08 10 00            cmp      dword ptr [0x1008c554], 0
  10027F2D:  53                              push     ebx
  10027F2E:  0f 84 82 01 00 00               je       0x100280b6
  10027F34:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  10027F37:  85 db                           test     ebx, ebx
  10027F39:  0f 84 77 01 00 00               je       0x100280b6
  10027F3F:  8b 55 0c                        mov      edx, dword ptr [ebp + 0xc]
  10027F42:  0f b6 c2                        movzx    eax, dl
  10027F45:  35 c5 9d 1c 81                  xor      eax, 0x811c9dc5
  10027F4A:  69 c8 93 01 00 01               imul     ecx, eax, 0x1000193
  10027F50:  8b c2                           mov      eax, edx
  10027F52:  c1 e8 08                        shr      eax, 8
  10027F55:  0f b6 c0                        movzx    eax, al
  10027F58:  57                              push     edi
  10027F59:  33 c8                           xor      ecx, eax
  10027F5B:  8b c2                           mov      eax, edx
  10027F5D:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  10027F63:  c1 e8 10                        shr      eax, 0x10
  10027F66:  0f b6 c0                        movzx    eax, al
  10027F69:  33 c8                           xor      ecx, eax
  10027F6B:  8b c2                           mov      eax, edx
  10027F6D:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  10027F73:  c1 e8 18                        shr      eax, 0x18
  10027F76:  33 c8                           xor      ecx, eax
  10027F78:  69 c1 93 01 00 01               imul     eax, ecx, 0x1000193
  10027F7E:  b9 0c c6 08 10                  mov      ecx, 0x1008c60c
  10027F83:  50                              push     eax
  10027F84:  8d 45 0c                        lea      eax, [ebp + 0xc]
  10027F87:  50                              push     eax
  10027F88:  8d 45 e4                        lea      eax, [ebp - 0x1c]
  10027F8B:  50                              push     eax
  10027F8C:  e8 4f e2 fd ff                  call     0x100061e0
  10027F91:  8b 3d 10 c6 08 10               mov      edi, dword ptr [0x1008c610]
  10027F97:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  10027F9A:  85 c0                           test     eax, eax
  10027F9C:  0f 45 f8                        cmovne   edi, eax
  10027F9F:  3b 3d 10 c6 08 10               cmp      edi, dword ptr [0x1008c610]
  10027FA5:  75 29                           jne      0x10027fd0
  10027FA7:  e8 a4 2a ff ff                  call     0x1001aa50  ; Hook::EnterHook
  10027FAC:  ff 75 14                        push     dword ptr [ebp + 0x14]
  10027FAF:  8d 8b a8 00 00 00               lea      ecx, [ebx + 0xa8]
  10027FB5:  33 d2                           xor      edx, edx
  10027FB7:  ff 75 10                        push     dword ptr [ebp + 0x10]
  10027FBA:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10027FBD:  ff 15 54 c5 08 10               call     dword ptr [0x1008c554]
  10027FC3:  e8 b8 2a ff ff                  call     0x1001aa80  ; Hook::LeaveHook
  10027FC8:  5f                              pop      edi
  10027FC9:  b0 01                           mov      al, 1
  10027FCB:  5b                              pop      ebx
  10027FCC:  8b e5                           mov      esp, ebp
  10027FCE:  5d                              pop      ebp
  10027FCF:  c3                              ret      
  10027FD0:  32 c0                           xor      al, al
  10027FD2:  c7 45 e0 00 00 00 00            mov      dword ptr [ebp - 0x20], 0
  10027FD9:  88 45 dc                        mov      byte ptr [ebp - 0x24], al
  10027FDC:  56                              push     esi
  10027FDD:  8b 77 0c                        mov      esi, dword ptr [edi + 0xc]
  10027FE0:  8b 7f 10                        mov      edi, dword ptr [edi + 0x10]
  10027FE3:  3b f7                           cmp      esi, edi
  10027FE5:  74 51                           je       0x10028038
  10027FE7:  83 3e 00                        cmp      dword ptr [esi], 0
  10027FEA:  7f 49                           jg       0x10028035
  10027FEC:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10027FEF:  8b 4e 2c                        mov      ecx, dword ptr [esi + 0x2c]
  10027FF2:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  10027FF5:  8b 45 14                        mov      eax, dword ptr [ebp + 0x14]
  10027FF8:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  10027FFB:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  10027FFE:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  10028001:  8d 45 dc                        lea      eax, [ebp - 0x24]
  10028004:  89 5d ec                        mov      dword ptr [ebp - 0x14], ebx
  10028007:  89 45 e8                        mov      dword ptr [ebp - 0x18], eax
  1002800A:  85 c9                           test     ecx, ecx
  1002800C:  0f 84 ab 00 00 00               je       0x100280bd
  10028012:  8b 01                           mov      eax, dword ptr [ecx]
  10028014:  8d 55 f8                        lea      edx, [ebp - 8]
  10028017:  52                              push     edx
  10028018:  8d 55 f4                        lea      edx, [ebp - 0xc]
  1002801B:  52                              push     edx
  1002801C:  8d 55 f0                        lea      edx, [ebp - 0x10]
  1002801F:  52                              push     edx
  10028020:  8d 55 ec                        lea      edx, [ebp - 0x14]
  10028023:  52                              push     edx
  10028024:  8d 55 e8                        lea      edx, [ebp - 0x18]
  10028027:  52                              push     edx
  10028028:  ff 50 08                        call     dword ptr [eax + 8]
  1002802B:  ff 45 e0                        inc      dword ptr [ebp - 0x20]
  1002802E:  83 c6 30                        add      esi, 0x30
  10028031:  3b f7                           cmp      esi, edi
  10028033:  75 b2                           jne      0x10027fe7
  10028035:  8a 45 dc                        mov      al, byte ptr [ebp - 0x24]
  10028038:  84 c0                           test     al, al
  1002803A:  0f 94 45 ff                     sete     byte ptr [ebp - 1]
  1002803E:  84 c0                           test     al, al
  10028040:  75 21                           jne      0x10028063
  10028042:  e8 09 2a ff ff                  call     0x1001aa50  ; Hook::EnterHook
  10028047:  ff 75 14                        push     dword ptr [ebp + 0x14]
  1002804A:  8d 8b a8 00 00 00               lea      ecx, [ebx + 0xa8]
  10028050:  33 d2                           xor      edx, edx
  10028052:  ff 75 10                        push     dword ptr [ebp + 0x10]
  10028055:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028058:  ff 15 54 c5 08 10               call     dword ptr [0x1008c554]
  1002805E:  e8 1d 2a ff ff                  call     0x1001aa80  ; Hook::LeaveHook
  10028063:  3b f7                           cmp      esi, edi
  10028065:  74 45                           je       0x100280ac
  10028067:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  1002806A:  8b 4e 2c                        mov      ecx, dword ptr [esi + 0x2c]
  1002806D:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  10028070:  8b 45 14                        mov      eax, dword ptr [ebp + 0x14]
  10028073:  89 45 e8                        mov      dword ptr [ebp - 0x18], eax
  10028076:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  10028079:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  1002807C:  8d 45 dc                        lea      eax, [ebp - 0x24]
  1002807F:  89 5d f4                        mov      dword ptr [ebp - 0xc], ebx
  10028082:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  10028085:  85 c9                           test     ecx, ecx
  10028087:  74 34                           je       0x100280bd
  10028089:  8b 01                           mov      eax, dword ptr [ecx]
  1002808B:  8d 55 e8                        lea      edx, [ebp - 0x18]
  1002808E:  52                              push     edx
  1002808F:  8d 55 ec                        lea      edx, [ebp - 0x14]
  10028092:  52                              push     edx
  10028093:  8d 55 f0                        lea      edx, [ebp - 0x10]
  10028096:  52                              push     edx
  10028097:  8d 55 f4                        lea      edx, [ebp - 0xc]
  1002809A:  52                              push     edx
  1002809B:  8d 55 f8                        lea      edx, [ebp - 8]
  1002809E:  52                              push     edx
  1002809F:  ff 50 08                        call     dword ptr [eax + 8]
  100280A2:  ff 45 e0                        inc      dword ptr [ebp - 0x20]
  100280A5:  83 c6 30                        add      esi, 0x30
  100280A8:  3b f7                           cmp      esi, edi
  100280AA:  75 bb                           jne      0x10028067
  100280AC:  8a 45 ff                        mov      al, byte ptr [ebp - 1]
  100280AF:  5e                              pop      esi
  100280B0:  5f                              pop      edi
  100280B1:  5b                              pop      ebx
  100280B2:  8b e5                           mov      esp, ebp
  100280B4:  5d                              pop      ebp
  100280B5:  c3                              ret      
  100280B6:  32 c0                           xor      al, al
  100280B8:  5b                              pop      ebx
  100280B9:  8b e5                           mov      esp, ebp
  100280BB:  5d                              pop      ebp
  100280BC:  c3                              ret      
  100280BD:  e8 1b 36 00 00                  call     0x1002b6dd
  100280C2:  cc                              int3     
  100280C3:  cc                              int3     
  100280C4:  cc                              int3     
  100280C5:  cc                              int3     
  100280C6:  cc                              int3     
  100280C7:  cc                              int3     
  100280C8:  cc                              int3     
  100280C9:  cc                              int3     
  100280CA:  cc                              int3     
  100280CB:  cc                              int3     
  100280CC:  cc                              int3     
  100280CD:  cc                              int3     
  100280CE:  cc                              int3     
  100280CF:  cc                              int3     
  100280D0:  55                              push     ebp
  100280D1:  8b ec                           mov      ebp, esp
  100280D3:  83 ec 1c                        sub      esp, 0x1c
  100280D6:  53                              push     ebx
  100280D7:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  100280DA:  0f b6 c3                        movzx    eax, bl
  100280DD:  35 c5 9d 1c 81                  xor      eax, 0x811c9dc5
  100280E2:  c6 45 e4 00                     mov      byte ptr [ebp - 0x1c], 0
  100280E6:  69 c8 93 01 00 01               imul     ecx, eax, 0x1000193
  100280EC:  8b c3                           mov      eax, ebx
  100280EE:  c1 e8 08                        shr      eax, 8
  100280F1:  0f b6 c0                        movzx    eax, al
  100280F4:  56                              push     esi
  100280F5:  57                              push     edi
  100280F6:  33 c8                           xor      ecx, eax
  100280F8:  c7 45 e8 00 00 00 00            mov      dword ptr [ebp - 0x18], 0
  100280FF:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  10028105:  8b c3                           mov      eax, ebx
  10028107:  c1 e8 10                        shr      eax, 0x10
  1002810A:  8b f3                           mov      esi, ebx
  1002810C:  0f b6 c0                        movzx    eax, al
  1002810F:  81 e6 00 00 00 30               and      esi, 0x30000000
  10028115:  89 75 ec                        mov      dword ptr [ebp - 0x14], esi
  10028118:  33 c8                           xor      ecx, eax
  1002811A:  8b c3                           mov      eax, ebx
  1002811C:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  10028122:  c1 e8 18                        shr      eax, 0x18
  10028125:  33 c8                           xor      ecx, eax
  10028127:  69 c1 93 01 00 01               imul     eax, ecx, 0x1000193
  1002812D:  b9 ec c5 08 10                  mov      ecx, 0x1008c5ec
  10028132:  50                              push     eax
  10028133:  8d 45 08                        lea      eax, [ebp + 8]
  10028136:  50                              push     eax
  10028137:  8d 45 f0                        lea      eax, [ebp - 0x10]
  1002813A:  50                              push     eax
  1002813B:  e8 a0 e0 fd ff                  call     0x100061e0
  10028140:  8b 3d f0 c5 08 10               mov      edi, dword ptr [0x1008c5f0]
  10028146:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  10028149:  85 c0                           test     eax, eax
  1002814B:  0f 45 f8                        cmovne   edi, eax
  1002814E:  3b 3d f0 c5 08 10               cmp      edi, dword ptr [0x1008c5f0]
  10028154:  75 21                           jne      0x10028177
  10028156:  81 fe 00 00 00 30               cmp      esi, 0x30000000
  1002815C:  74 10                           je       0x1002816e
  1002815E:  ff 75 10                        push     dword ptr [ebp + 0x10]
  10028161:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028164:  53                              push     ebx
  10028165:  ff 15 24 c5 08 10               call     dword ptr [0x1008c524]
  1002816B:  83 c4 0c                        add      esp, 0xc
  1002816E:  5f                              pop      edi
  1002816F:  5e                              pop      esi
  10028170:  b0 01                           mov      al, 1
  10028172:  5b                              pop      ebx
  10028173:  8b e5                           mov      esp, ebp
  10028175:  5d                              pop      ebp
  10028176:  c3                              ret      
  10028177:  8b 77 0c                        mov      esi, dword ptr [edi + 0xc]
  1002817A:  8b 7f 10                        mov      edi, dword ptr [edi + 0x10]
  1002817D:  3b f7                           cmp      esi, edi
  1002817F:  74 44                           je       0x100281c5
  10028181:  83 3e 00                        cmp      dword ptr [esi], 0
  10028184:  7f 3f                           jg       0x100281c5
  10028186:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  10028189:  8b 4e 2c                        mov      ecx, dword ptr [esi + 0x2c]
  1002818C:  89 45 08                        mov      dword ptr [ebp + 8], eax
  1002818F:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10028192:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10028195:  8d 45 e4                        lea      eax, [ebp - 0x1c]
  10028198:  89 5d f8                        mov      dword ptr [ebp - 8], ebx
  1002819B:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  1002819E:  85 c9                           test     ecx, ecx
  100281A0:  0f 84 b2 00 00 00               je       0x10028258
  100281A6:  8b 01                           mov      eax, dword ptr [ecx]
  100281A8:  8d 55 08                        lea      edx, [ebp + 8]
  100281AB:  52                              push     edx
  100281AC:  8d 55 fc                        lea      edx, [ebp - 4]
  100281AF:  52                              push     edx
  100281B0:  8d 55 f8                        lea      edx, [ebp - 8]
  100281B3:  52                              push     edx
  100281B4:  8d 55 f4                        lea      edx, [ebp - 0xc]
  100281B7:  52                              push     edx
  100281B8:  ff 50 08                        call     dword ptr [eax + 8]
  100281BB:  ff 45 e8                        inc      dword ptr [ebp - 0x18]
  100281BE:  83 c6 30                        add      esi, 0x30
  100281C1:  3b f7                           cmp      esi, edi
  100281C3:  75 bc                           jne      0x10028181
  100281C5:  8a 45 e4                        mov      al, byte ptr [ebp - 0x1c]
  100281C8:  84 c0                           test     al, al
  100281CA:  0f 94 45 0b                     sete     byte ptr [ebp + 0xb]
  100281CE:  84 c0                           test     al, al
  100281D0:  75 1d                           jne      0x100281ef
  100281D2:  81 7d ec 00 00 00 30            cmp      dword ptr [ebp - 0x14], 0x30000000
  100281D9:  74 10                           je       0x100281eb
  100281DB:  ff 75 10                        push     dword ptr [ebp + 0x10]
  100281DE:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  100281E1:  53                              push     ebx
  100281E2:  ff 15 24 c5 08 10               call     dword ptr [0x1008c524]
  100281E8:  83 c4 0c                        add      esp, 0xc
  100281EB:  c6 45 0b 01                     mov      byte ptr [ebp + 0xb], 1
  100281EF:  81 fb 8c 00 00 10               cmp      ebx, 0x1000008c
  100281F5:  75 18                           jne      0x1002820f
  100281F7:  6a 00                           push     0
  100281F9:  e8 c2 53 ff ff                  call     0x1001d5c0  ; Map::GetMapInfo, GetMapInfo
  100281FE:  83 c4 04                        add      esp, 4
  10028201:  f7 40 10 01 00 04 00            test     dword ptr [eax + 0x10], 0x40001
  10028208:  0f 95 05 d8 c5 08 10            setne    byte ptr [0x1008c5d8]
  1002820F:  3b f7                           cmp      esi, edi
  10028211:  74 3b                           je       0x1002824e
  10028213:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  10028216:  8b 4e 2c                        mov      ecx, dword ptr [esi + 0x2c]
  10028219:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  1002821C:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  1002821F:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  10028222:  8d 45 e4                        lea      eax, [ebp - 0x1c]
  10028225:  89 5d f8                        mov      dword ptr [ebp - 8], ebx
  10028228:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1002822B:  85 c9                           test     ecx, ecx
  1002822D:  74 29                           je       0x10028258
  1002822F:  8b 01                           mov      eax, dword ptr [ecx]
  10028231:  8d 55 ec                        lea      edx, [ebp - 0x14]
  10028234:  52                              push     edx
  10028235:  8d 55 f4                        lea      edx, [ebp - 0xc]
  10028238:  52                              push     edx
  10028239:  8d 55 f8                        lea      edx, [ebp - 8]
  1002823C:  52                              push     edx
  1002823D:  8d 55 fc                        lea      edx, [ebp - 4]
  10028240:  52                              push     edx
  10028241:  ff 50 08                        call     dword ptr [eax + 8]
  10028244:  ff 45 e8                        inc      dword ptr [ebp - 0x18]
  10028247:  83 c6 30                        add      esi, 0x30
  1002824A:  3b f7                           cmp      esi, edi
  1002824C:  75 c5                           jne      0x10028213
  1002824E:  8a 45 0b                        mov      al, byte ptr [ebp + 0xb]
  10028251:  5f                              pop      edi
  10028252:  5e                              pop      esi
  10028253:  5b                              pop      ebx
  10028254:  8b e5                           mov      esp, ebp
  10028256:  5d                              pop      ebp
  10028257:  c3                              ret      
  10028258:  e8 80 34 00 00                  call     0x1002b6dd
  1002825D:  cc                              int3     
  1002825E:  cc                              int3     
  1002825F:  cc                              int3     
  10028260:  55                              push     ebp
  10028261:  8b ec                           mov      ebp, esp
  10028263:  ff 75 08                        push     dword ptr [ebp + 8]
  10028266:  e8 35 e2 ff ff                  call     0x100264a0
  1002826B:  83 c4 04                        add      esp, 4
  1002826E:  85 c0                           test     eax, eax
  10028270:  74 26                           je       0x10028298
  10028272:  8b 00                           mov      eax, dword ptr [eax]
  10028274:  25 00 ff 00 00                  and      eax, 0xff00
  10028279:  3d 00 04 00 00                  cmp      eax, 0x400
  1002827E:  75 18                           jne      0x10028298
  10028280:  ff 75 08                        push     dword ptr [ebp + 8]
  10028283:  e8 98 e2 ff ff                  call     0x10026520
  10028288:  83 c4 04                        add      esp, 4
  1002828B:  85 c0                           test     eax, eax
  1002828D:  74 09                           je       0x10028298
  1002828F:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  10028292:  89 08                           mov      dword ptr [eax], ecx
  10028294:  b0 01                           mov      al, 1
  10028296:  5d                              pop      ebp
  10028297:  c3                              ret      
  10028298:  32 c0                           xor      al, al
  1002829A:  5d                              pop      ebp
  1002829B:  c3                              ret      


; === UI::SendUIMessage ===
; RVA: 0x000280D0  Size: 460 bytes
; Exports: ?SendUIMessage@UI@GW@@YA_NW4UIMessage@12@PAX1@Z
;
  100280D0:  55                              push     ebp
  100280D1:  8b ec                           mov      ebp, esp
  100280D3:  83 ec 1c                        sub      esp, 0x1c
  100280D6:  53                              push     ebx
  100280D7:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  100280DA:  0f b6 c3                        movzx    eax, bl
  100280DD:  35 c5 9d 1c 81                  xor      eax, 0x811c9dc5
  100280E2:  c6 45 e4 00                     mov      byte ptr [ebp - 0x1c], 0
  100280E6:  69 c8 93 01 00 01               imul     ecx, eax, 0x1000193
  100280EC:  8b c3                           mov      eax, ebx
  100280EE:  c1 e8 08                        shr      eax, 8
  100280F1:  0f b6 c0                        movzx    eax, al
  100280F4:  56                              push     esi
  100280F5:  57                              push     edi
  100280F6:  33 c8                           xor      ecx, eax
  100280F8:  c7 45 e8 00 00 00 00            mov      dword ptr [ebp - 0x18], 0
  100280FF:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  10028105:  8b c3                           mov      eax, ebx
  10028107:  c1 e8 10                        shr      eax, 0x10
  1002810A:  8b f3                           mov      esi, ebx
  1002810C:  0f b6 c0                        movzx    eax, al
  1002810F:  81 e6 00 00 00 30               and      esi, 0x30000000
  10028115:  89 75 ec                        mov      dword ptr [ebp - 0x14], esi
  10028118:  33 c8                           xor      ecx, eax
  1002811A:  8b c3                           mov      eax, ebx
  1002811C:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  10028122:  c1 e8 18                        shr      eax, 0x18
  10028125:  33 c8                           xor      ecx, eax
  10028127:  69 c1 93 01 00 01               imul     eax, ecx, 0x1000193
  1002812D:  b9 ec c5 08 10                  mov      ecx, 0x1008c5ec
  10028132:  50                              push     eax
  10028133:  8d 45 08                        lea      eax, [ebp + 8]
  10028136:  50                              push     eax
  10028137:  8d 45 f0                        lea      eax, [ebp - 0x10]
  1002813A:  50                              push     eax
  1002813B:  e8 a0 e0 fd ff                  call     0x100061e0
  10028140:  8b 3d f0 c5 08 10               mov      edi, dword ptr [0x1008c5f0]
  10028146:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  10028149:  85 c0                           test     eax, eax
  1002814B:  0f 45 f8                        cmovne   edi, eax
  1002814E:  3b 3d f0 c5 08 10               cmp      edi, dword ptr [0x1008c5f0]
  10028154:  75 21                           jne      0x10028177
  10028156:  81 fe 00 00 00 30               cmp      esi, 0x30000000
  1002815C:  74 10                           je       0x1002816e
  1002815E:  ff 75 10                        push     dword ptr [ebp + 0x10]
  10028161:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028164:  53                              push     ebx
  10028165:  ff 15 24 c5 08 10               call     dword ptr [0x1008c524]
  1002816B:  83 c4 0c                        add      esp, 0xc
  1002816E:  5f                              pop      edi
  1002816F:  5e                              pop      esi
  10028170:  b0 01                           mov      al, 1
  10028172:  5b                              pop      ebx
  10028173:  8b e5                           mov      esp, ebp
  10028175:  5d                              pop      ebp
  10028176:  c3                              ret      
  10028177:  8b 77 0c                        mov      esi, dword ptr [edi + 0xc]
  1002817A:  8b 7f 10                        mov      edi, dword ptr [edi + 0x10]
  1002817D:  3b f7                           cmp      esi, edi
  1002817F:  74 44                           je       0x100281c5
  10028181:  83 3e 00                        cmp      dword ptr [esi], 0
  10028184:  7f 3f                           jg       0x100281c5
  10028186:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  10028189:  8b 4e 2c                        mov      ecx, dword ptr [esi + 0x2c]
  1002818C:  89 45 08                        mov      dword ptr [ebp + 8], eax
  1002818F:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10028192:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10028195:  8d 45 e4                        lea      eax, [ebp - 0x1c]
  10028198:  89 5d f8                        mov      dword ptr [ebp - 8], ebx
  1002819B:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  1002819E:  85 c9                           test     ecx, ecx
  100281A0:  0f 84 b2 00 00 00               je       0x10028258
  100281A6:  8b 01                           mov      eax, dword ptr [ecx]
  100281A8:  8d 55 08                        lea      edx, [ebp + 8]
  100281AB:  52                              push     edx
  100281AC:  8d 55 fc                        lea      edx, [ebp - 4]
  100281AF:  52                              push     edx
  100281B0:  8d 55 f8                        lea      edx, [ebp - 8]
  100281B3:  52                              push     edx
  100281B4:  8d 55 f4                        lea      edx, [ebp - 0xc]
  100281B7:  52                              push     edx
  100281B8:  ff 50 08                        call     dword ptr [eax + 8]
  100281BB:  ff 45 e8                        inc      dword ptr [ebp - 0x18]
  100281BE:  83 c6 30                        add      esi, 0x30
  100281C1:  3b f7                           cmp      esi, edi
  100281C3:  75 bc                           jne      0x10028181
  100281C5:  8a 45 e4                        mov      al, byte ptr [ebp - 0x1c]
  100281C8:  84 c0                           test     al, al
  100281CA:  0f 94 45 0b                     sete     byte ptr [ebp + 0xb]
  100281CE:  84 c0                           test     al, al
  100281D0:  75 1d                           jne      0x100281ef
  100281D2:  81 7d ec 00 00 00 30            cmp      dword ptr [ebp - 0x14], 0x30000000
  100281D9:  74 10                           je       0x100281eb
  100281DB:  ff 75 10                        push     dword ptr [ebp + 0x10]
  100281DE:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  100281E1:  53                              push     ebx
  100281E2:  ff 15 24 c5 08 10               call     dword ptr [0x1008c524]
  100281E8:  83 c4 0c                        add      esp, 0xc
  100281EB:  c6 45 0b 01                     mov      byte ptr [ebp + 0xb], 1
  100281EF:  81 fb 8c 00 00 10               cmp      ebx, 0x1000008c
  100281F5:  75 18                           jne      0x1002820f
  100281F7:  6a 00                           push     0
  100281F9:  e8 c2 53 ff ff                  call     0x1001d5c0  ; Map::GetMapInfo, GetMapInfo
  100281FE:  83 c4 04                        add      esp, 4
  10028201:  f7 40 10 01 00 04 00            test     dword ptr [eax + 0x10], 0x40001
  10028208:  0f 95 05 d8 c5 08 10            setne    byte ptr [0x1008c5d8]
  1002820F:  3b f7                           cmp      esi, edi
  10028211:  74 3b                           je       0x1002824e
  10028213:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  10028216:  8b 4e 2c                        mov      ecx, dword ptr [esi + 0x2c]
  10028219:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  1002821C:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  1002821F:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  10028222:  8d 45 e4                        lea      eax, [ebp - 0x1c]
  10028225:  89 5d f8                        mov      dword ptr [ebp - 8], ebx
  10028228:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1002822B:  85 c9                           test     ecx, ecx
  1002822D:  74 29                           je       0x10028258
  1002822F:  8b 01                           mov      eax, dword ptr [ecx]
  10028231:  8d 55 ec                        lea      edx, [ebp - 0x14]
  10028234:  52                              push     edx
  10028235:  8d 55 f4                        lea      edx, [ebp - 0xc]
  10028238:  52                              push     edx
  10028239:  8d 55 f8                        lea      edx, [ebp - 8]
  1002823C:  52                              push     edx
  1002823D:  8d 55 fc                        lea      edx, [ebp - 4]
  10028240:  52                              push     edx
  10028241:  ff 50 08                        call     dword ptr [eax + 8]
  10028244:  ff 45 e8                        inc      dword ptr [ebp - 0x18]
  10028247:  83 c6 30                        add      esi, 0x30
  1002824A:  3b f7                           cmp      esi, edi
  1002824C:  75 c5                           jne      0x10028213
  1002824E:  8a 45 0b                        mov      al, byte ptr [ebp + 0xb]
  10028251:  5f                              pop      edi
  10028252:  5e                              pop      esi
  10028253:  5b                              pop      ebx
  10028254:  8b e5                           mov      esp, ebp
  10028256:  5d                              pop      ebp
  10028257:  c3                              ret      
  10028258:  e8 80 34 00 00                  call     0x1002b6dd
  1002825D:  cc                              int3     
  1002825E:  cc                              int3     
  1002825F:  cc                              int3     
  10028260:  55                              push     ebp
  10028261:  8b ec                           mov      ebp, esp
  10028263:  ff 75 08                        push     dword ptr [ebp + 8]
  10028266:  e8 35 e2 ff ff                  call     0x100264a0
  1002826B:  83 c4 04                        add      esp, 4
  1002826E:  85 c0                           test     eax, eax
  10028270:  74 26                           je       0x10028298
  10028272:  8b 00                           mov      eax, dword ptr [eax]
  10028274:  25 00 ff 00 00                  and      eax, 0xff00
  10028279:  3d 00 04 00 00                  cmp      eax, 0x400
  1002827E:  75 18                           jne      0x10028298
  10028280:  ff 75 08                        push     dword ptr [ebp + 8]
  10028283:  e8 98 e2 ff ff                  call     0x10026520
  10028288:  83 c4 04                        add      esp, 4
  1002828B:  85 c0                           test     eax, eax
  1002828D:  74 09                           je       0x10028298
  1002828F:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  10028292:  89 08                           mov      dword ptr [eax], ecx
  10028294:  b0 01                           mov      al, 1
  10028296:  5d                              pop      ebp
  10028297:  c3                              ret      
  10028298:  32 c0                           xor      al, al
  1002829A:  5d                              pop      ebp
  1002829B:  c3                              ret      


; === UI::SetCommandLinePref, SetCommandLinePref_UInt ===
; RVA: 0x00028260  Size: 60 bytes
; Exports: ?SetCommandLinePref@UI@GW@@YA_NPB_WI@Z, SetCommandLinePref_UInt
;
  10028260:  55                              push     ebp
  10028261:  8b ec                           mov      ebp, esp
  10028263:  ff 75 08                        push     dword ptr [ebp + 8]
  10028266:  e8 35 e2 ff ff                  call     0x100264a0
  1002826B:  83 c4 04                        add      esp, 4
  1002826E:  85 c0                           test     eax, eax
  10028270:  74 26                           je       0x10028298
  10028272:  8b 00                           mov      eax, dword ptr [eax]
  10028274:  25 00 ff 00 00                  and      eax, 0xff00
  10028279:  3d 00 04 00 00                  cmp      eax, 0x400
  1002827E:  75 18                           jne      0x10028298
  10028280:  ff 75 08                        push     dword ptr [ebp + 8]
  10028283:  e8 98 e2 ff ff                  call     0x10026520
  10028288:  83 c4 04                        add      esp, 4
  1002828B:  85 c0                           test     eax, eax
  1002828D:  74 09                           je       0x10028298
  1002828F:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  10028292:  89 08                           mov      dword ptr [eax], ecx
  10028294:  b0 01                           mov      al, 1
  10028296:  5d                              pop      ebp
  10028297:  c3                              ret      
  10028298:  32 c0                           xor      al, al
  1002829A:  5d                              pop      ebp
  1002829B:  c3                              ret      


; === UI::SetCommandLinePref, SetCommandLinePref_String ===
; RVA: 0x000282A0  Size: 72 bytes
; Exports: ?SetCommandLinePref@UI@GW@@YA_NPB_WPA_W@Z, SetCommandLinePref_String
;
  100282A0:  55                              push     ebp
  100282A1:  8b ec                           mov      ebp, esp
  100282A3:  ff 75 08                        push     dword ptr [ebp + 8]
  100282A6:  e8 f5 e1 ff ff                  call     0x100264a0
  100282AB:  83 c4 04                        add      esp, 4
  100282AE:  85 c0                           test     eax, eax
  100282B0:  74 32                           je       0x100282e4
  100282B2:  8b 00                           mov      eax, dword ptr [eax]
  100282B4:  25 00 ff 00 00                  and      eax, 0xff00
  100282B9:  3d 00 03 00 00                  cmp      eax, 0x300
  100282BE:  75 24                           jne      0x100282e4
  100282C0:  ff 75 08                        push     dword ptr [ebp + 8]
  100282C3:  e8 58 e2 ff ff                  call     0x10026520
  100282C8:  83 c4 04                        add      esp, 4
  100282CB:  85 c0                           test     eax, eax
  100282CD:  74 15                           je       0x100282e4
  100282CF:  68 04 01 00 00                  push     0x104
  100282D4:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  100282D7:  50                              push     eax
  100282D8:  e8 f3 91 00 00                  call     0x100314d0
  100282DD:  83 c4 0c                        add      esp, 0xc
  100282E0:  b0 01                           mov      al, 1
  100282E2:  5d                              pop      ebp
  100282E3:  c3                              ret      
  100282E4:  32 c0                           xor      al, al
  100282E6:  5d                              pop      ebp
  100282E7:  c3                              ret      


; === UI::SetFrameDisabled, SetFrameDisabled ===
; RVA: 0x000282F0  Size: 55 bytes
; Exports: ?SetFrameDisabled@UI@GW@@YA_NPAUFrame@12@_N@Z, SetFrameDisabled
;
  100282F0:  55                              push     ebp
  100282F1:  8b ec                           mov      ebp, esp
  100282F3:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100282F6:  85 c0                           test     eax, eax
  100282F8:  74 29                           je       0x10028323
  100282FA:  8d 88 8c 01 00 00               lea      ecx, [eax + 0x18c]
  10028300:  8b 01                           mov      eax, dword ptr [ecx]
  10028302:  c1 e8 04                        shr      eax, 4
  10028305:  24 01                           and      al, 1
  10028307:  3a 45 0c                        cmp      al, byte ptr [ebp + 0xc]
  1002830A:  74 13                           je       0x1002831f
  1002830C:  a1 58 c5 08 10                  mov      eax, dword ptr [0x1008c558]
  10028311:  85 c0                           test     eax, eax
  10028313:  74 0e                           je       0x10028323
  10028315:  6a 10                           push     0x10
  10028317:  6a 00                           push     0
  10028319:  6a 00                           push     0
  1002831B:  33 d2                           xor      edx, edx
  1002831D:  ff d0                           call     eax
  1002831F:  b0 01                           mov      al, 1
  10028321:  5d                              pop      ebp
  10028322:  c3                              ret      
  10028323:  32 c0                           xor      al, al
  10028325:  5d                              pop      ebp
  10028326:  c3                              ret      


; === UI::SetFrameTitle, SetFrameTitle ===
; RVA: 0x00028330  Size: 53 bytes
; Exports: ?SetFrameTitle@UI@GW@@YA_NPAUFrame@12@PB_W@Z, SetFrameTitle
;
  10028330:  55                              push     ebp
  10028331:  8b ec                           mov      ebp, esp
  10028333:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10028336:  85 c9                           test     ecx, ecx
  10028338:  74 27                           je       0x10028361
  1002833A:  8b 15 38 c5 08 10               mov      edx, dword ptr [0x1008c538]
  10028340:  85 d2                           test     edx, edx
  10028342:  74 1d                           je       0x10028361
  10028344:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10028347:  85 c0                           test     eax, eax
  10028349:  74 16                           je       0x10028361
  1002834B:  66 83 38 00                     cmp      word ptr [eax], 0
  1002834F:  74 10                           je       0x10028361
  10028351:  50                              push     eax
  10028352:  ff b1 bc 00 00 00               push     dword ptr [ecx + 0xbc]
  10028358:  ff d2                           call     edx
  1002835A:  83 c4 08                        add      esp, 8
  1002835D:  b0 01                           mov      al, 1
  1002835F:  5d                              pop      ebp
  10028360:  c3                              ret      
  10028361:  32 c0                           xor      al, al
  10028363:  5d                              pop      ebp
  10028364:  c3                              ret      


; === UI::SetFrameVisible, SetFrameVisible ===
; RVA: 0x00028370  Size: 60 bytes
; Exports: ?SetFrameVisible@UI@GW@@YA_NPAUFrame@12@_N@Z, SetFrameVisible
;
  10028370:  55                              push     ebp
  10028371:  8b ec                           mov      ebp, esp
  10028373:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10028376:  85 c0                           test     eax, eax
  10028378:  74 2e                           je       0x100283a8
  1002837A:  8d 88 8c 01 00 00               lea      ecx, [eax + 0x18c]
  10028380:  8b 01                           mov      eax, dword ptr [ecx]
  10028382:  c1 e8 09                        shr      eax, 9
  10028385:  f6 d0                           not      al
  10028387:  24 01                           and      al, 1
  10028389:  3a 45 0c                        cmp      al, byte ptr [ebp + 0xc]
  1002838C:  74 16                           je       0x100283a4
  1002838E:  a1 58 c5 08 10                  mov      eax, dword ptr [0x1008c558]
  10028393:  85 c0                           test     eax, eax
  10028395:  74 11                           je       0x100283a8
  10028397:  68 00 02 00 00                  push     0x200
  1002839C:  6a 00                           push     0
  1002839E:  6a 00                           push     0
  100283A0:  33 d2                           xor      edx, edx
  100283A2:  ff d0                           call     eax
  100283A4:  b0 01                           mov      al, 1
  100283A6:  5d                              pop      ebp
  100283A7:  c3                              ret      
  100283A8:  32 c0                           xor      al, al
  100283AA:  5d                              pop      ebp
  100283AB:  c3                              ret      


; === UI::SetOpenLinks ===
; RVA: 0x000283B0  Size: 13 bytes
; Exports: ?SetOpenLinks@UI@GW@@YAX_N@Z
;
  100283B0:  55                              push     ebp
  100283B1:  8b ec                           mov      ebp, esp
  100283B3:  8a 45 08                        mov      al, byte ptr [ebp + 8]
  100283B6:  a2 0b c5 08 10                  mov      byte ptr [0x1008c50b], al
  100283BB:  5d                              pop      ebp
  100283BC:  c3                              ret      


; === UI::SetPreference ===
; RVA: 0x000284B0  Size: 1888 bytes
; Exports: ?SetPreference@UI@GW@@YA_NW4EnumPreference@12@I@Z
;
  100284B0:  55                              push     ebp
  100284B1:  8b ec                           mov      ebp, esp
  100284B3:  51                              push     ecx
  100284B4:  53                              push     ebx
  100284B5:  56                              push     esi
  100284B6:  57                              push     edi
  100284B7:  e8 44 1c ff ff                  call     0x1001a100  ; GameThread::IsInGameThread, IsInGameThread
  100284BC:  84 c0                           test     al, al
  100284BE:  75 2d                           jne      0x100284ed
  100284C0:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  100284C3:  8b 55 0c                        mov      edx, dword ptr [ebp + 0xc]
  100284C6:  6a 00                           push     0
  100284C8:  83 ec 28                        sub      esp, 0x28
  100284CB:  8b c4                           mov      eax, esp
  100284CD:  c7 00 f8 45 05 10               mov      dword ptr [eax], 0x100545f8
  100284D3:  89 48 04                        mov      dword ptr [eax + 4], ecx
  100284D6:  89 50 08                        mov      dword ptr [eax + 8], edx
  100284D9:  89 40 24                        mov      dword ptr [eax + 0x24], eax
  100284DC:  e8 5f 1b ff ff                  call     0x1001a040  ; GameThread::Enqueue
  100284E1:  83 c4 2c                        add      esp, 0x2c
  100284E4:  b0 01                           mov      al, 1
  100284E6:  5f                              pop      edi
  100284E7:  5e                              pop      esi
  100284E8:  5b                              pop      ebx
  100284E9:  8b e5                           mov      esp, ebp
  100284EB:  5d                              pop      ebp
  100284EC:  c3                              ret      
  100284ED:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  100284F0:  8d 46 ff                        lea      eax, [esi - 1]
  100284F3:  83 f8 06                        cmp      eax, 6
  100284F6:  77 55                           ja       0x1002854d
  100284F8:  ff 24 85 b8 85 02 10            jmp      dword ptr [eax*4 + 0x100285b8]
  100284FF:  b9 90 43 05 10                  mov      ecx, 0x10054390
  10028504:  eb 28                           jmp      0x1002852e
  10028506:  b9 a4 43 05 10                  mov      ecx, 0x100543a4
  1002850B:  eb 21                           jmp      0x1002852e
  1002850D:  b9 c4 43 05 10                  mov      ecx, 0x100543c4
  10028512:  eb 1a                           jmp      0x1002852e
  10028514:  b9 e4 43 05 10                  mov      ecx, 0x100543e4
  10028519:  eb 13                           jmp      0x1002852e
  1002851B:  b9 04 44 05 10                  mov      ecx, 0x10054404
  10028520:  eb 0c                           jmp      0x1002852e
  10028522:  b9 20 44 05 10                  mov      ecx, 0x10054420
  10028527:  eb 05                           jmp      0x1002852e
  10028529:  b9 3c 44 05 10                  mov      ecx, 0x1005443c
  1002852E:  a1 a4 a2 08 10                  mov      eax, dword ptr [0x1008a2a4]
  10028533:  85 c0                           test     eax, eax
  10028535:  74 16                           je       0x1002854d
  10028537:  6a 01                           push     1
  10028539:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  1002853C:  51                              push     ecx
  1002853D:  50                              push     eax
  1002853E:  e8 7d fe ff ff                  call     0x100283c0
  10028543:  83 c4 10                        add      esp, 0x10
  10028546:  5f                              pop      edi
  10028547:  5e                              pop      esi
  10028548:  5b                              pop      ebx
  10028549:  8b e5                           mov      esp, ebp
  1002854B:  5d                              pop      ebp
  1002854C:  c3                              ret      
  1002854D:  8b 1d b0 c5 08 10               mov      ebx, dword ptr [0x1008c5b0]
  10028553:  85 db                           test     ebx, ebx
  10028555:  74 58                           je       0x100285af
  10028557:  a1 94 c5 08 10                  mov      eax, dword ptr [0x1008c594]
  1002855C:  85 c0                           test     eax, eax
  1002855E:  74 4f                           je       0x100285af
  10028560:  83 38 01                        cmp      dword ptr [eax], 1
  10028563:  75 4a                           jne      0x100285af
  10028565:  83 3d ac c5 08 10 00            cmp      dword ptr [0x1008c5ac], 0
  1002856C:  74 41                           je       0x100285af
  1002856E:  83 fe 08                        cmp      esi, 8
  10028571:  73 3c                           jae      0x100285af
  10028573:  8b 0d 6c c5 08 10               mov      ecx, dword ptr [0x1008c56c]
  10028579:  85 c9                           test     ecx, ecx
  1002857B:  74 32                           je       0x100285af
  1002857D:  8b 55 0c                        mov      edx, dword ptr [ebp + 0xc]
  10028580:  8d 04 b6                        lea      eax, [esi + esi*4]
  10028583:  8b 7c 81 08                     mov      edi, dword ptr [ecx + eax*4 + 8]
  10028587:  8b 4c 81 04                     mov      ecx, dword ptr [ecx + eax*4 + 4]
  1002858B:  33 c0                           xor      eax, eax
  1002858D:  85 c9                           test     ecx, ecx
  1002858F:  74 0a                           je       0x1002859b
  10028591:  39 14 87                        cmp      dword ptr [edi + eax*4], edx
  10028594:  74 09                           je       0x1002859f
  10028596:  40                              inc      eax
  10028597:  3b c1                           cmp      eax, ecx
  10028599:  72 f6                           jb       0x10028591
  1002859B:  3b c1                           cmp      eax, ecx
  1002859D:  74 10                           je       0x100285af
  1002859F:  52                              push     edx
  100285A0:  56                              push     esi
  100285A1:  ff d3                           call     ebx
  100285A3:  83 c4 08                        add      esp, 8
  100285A6:  b0 01                           mov      al, 1
  100285A8:  5f                              pop      edi
  100285A9:  5e                              pop      esi
  100285AA:  5b                              pop      ebx
  100285AB:  8b e5                           mov      esp, ebp
  100285AD:  5d                              pop      ebp
  100285AE:  c3                              ret      
  100285AF:  5f                              pop      edi
  100285B0:  5e                              pop      esi
  100285B1:  32 c0                           xor      al, al
  100285B3:  5b                              pop      ebx
  100285B4:  8b e5                           mov      esp, ebp
  100285B6:  5d                              pop      ebp
  100285B7:  c3                              ret      
  100285B8:  06                              push     es
  100285B9:  85 02                           test     dword ptr [edx], eax
  100285BB:  10 14 85 02 10 1b 85            adc      byte ptr [eax*4 - 0x7ae4effe], dl
  100285C2:  02 10                           add      dl, byte ptr [eax]
  100285C4:  22 85 02 10 0d 85               and      al, byte ptr [ebp - 0x7af2effe]
  100285CA:  02 10                           add      dl, byte ptr [eax]
  100285CC:  ff 84 02 10 29 85 02            inc      dword ptr [edx + eax + 0x2852910]
  100285D3:  10 cc                           adc      ah, cl
  100285D5:  cc                              int3     
  100285D6:  cc                              int3     
  100285D7:  cc                              int3     
  100285D8:  cc                              int3     
  100285D9:  cc                              int3     
  100285DA:  cc                              int3     
  100285DB:  cc                              int3     
  100285DC:  cc                              int3     
  100285DD:  cc                              int3     
  100285DE:  cc                              int3     
  100285DF:  cc                              int3     
  100285E0:  55                              push     ebp
  100285E1:  8b ec                           mov      ebp, esp
  100285E3:  83 ec 0c                        sub      esp, 0xc
  100285E6:  83 3d a0 c5 08 10 00            cmp      dword ptr [0x1008c5a0], 0
  100285ED:  56                              push     esi
  100285EE:  57                              push     edi
  100285EF:  0f 84 0d 01 00 00               je       0x10028702
  100285F5:  a1 94 c5 08 10                  mov      eax, dword ptr [0x1008c594]
  100285FA:  85 c0                           test     eax, eax
  100285FC:  0f 84 00 01 00 00               je       0x10028702
  10028602:  83 38 01                        cmp      dword ptr [eax], 1
  10028605:  0f 85 f7 00 00 00               jne      0x10028702
  1002860B:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  1002860E:  83 ff 6c                        cmp      edi, 0x6c
  10028611:  0f 83 eb 00 00 00               jae      0x10028702
  10028617:  e8 e4 1a ff ff                  call     0x1001a100  ; GameThread::IsInGameThread, IsInGameThread
  1002861C:  84 c0                           test     al, al
  1002861E:  75 2f                           jne      0x1002864f
  10028620:  8a 45 0c                        mov      al, byte ptr [ebp + 0xc]
  10028623:  6a 00                           push     0
  10028625:  83 ec 28                        sub      esp, 0x28
  10028628:  88 45 f8                        mov      byte ptr [ebp - 8], al
  1002862B:  8b 45 f8                        mov      eax, dword ptr [ebp - 8]
  1002862E:  8b cc                           mov      ecx, esp
  10028630:  c7 01 68 46 05 10               mov      dword ptr [ecx], 0x10054668
  10028636:  89 79 04                        mov      dword ptr [ecx + 4], edi
  10028639:  89 41 08                        mov      dword ptr [ecx + 8], eax
  1002863C:  89 49 24                        mov      dword ptr [ecx + 0x24], ecx
  1002863F:  e8 fc 19 ff ff                  call     0x1001a040  ; GameThread::Enqueue
  10028644:  83 c4 2c                        add      esp, 0x2c
  10028647:  b0 01                           mov      al, 1
  10028649:  5f                              pop      edi
  1002864A:  5e                              pop      esi
  1002864B:  8b e5                           mov      esp, ebp
  1002864D:  5d                              pop      ebp
  1002864E:  c3                              ret      
  1002864F:  8d 47 bf                        lea      eax, [edi - 0x41]
  10028652:  83 f8 23                        cmp      eax, 0x23
  10028655:  0f 87 e4 00 00 00               ja       0x1002873f
  1002865B:  0f b6 80 74 87 02 10            movzx    eax, byte ptr [eax + 0x10028774]
  10028662:  ff 24 85 54 87 02 10            jmp      dword ptr [eax*4 + 0x10028754]
  10028669:  be 1c 45 05 10                  mov      esi, 0x1005451c
  1002866E:  eb 28                           jmp      0x10028698
  10028670:  be 30 45 05 10                  mov      esi, 0x10054530
  10028675:  eb 21                           jmp      0x10028698
  10028677:  be 4c 45 05 10                  mov      esi, 0x1005454c
  1002867C:  eb 1a                           jmp      0x10028698
  1002867E:  be 74 45 05 10                  mov      esi, 0x10054574
  10028683:  eb 13                           jmp      0x10028698
  10028685:  be 84 45 05 10                  mov      esi, 0x10054584
  1002868A:  eb 0c                           jmp      0x10028698
  1002868C:  be 94 45 05 10                  mov      esi, 0x10054594
  10028691:  eb 05                           jmp      0x10028698
  10028693:  be ac 45 05 10                  mov      esi, 0x100545ac
  10028698:  a1 a4 a2 08 10                  mov      eax, dword ptr [0x1008a2a4]
  1002869D:  85 c0                           test     eax, eax
  1002869F:  0f 84 9a 00 00 00               je       0x1002873f
  100286A5:  0f b6 7d 0c                     movzx    edi, byte ptr [ebp + 0xc]
  100286A9:  8d 4d fc                        lea      ecx, [ebp - 4]
  100286AC:  51                              push     ecx
  100286AD:  50                              push     eax
  100286AE:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  100286B5:  e8 f6 f6 ff ff                  call     0x10027db0
  100286BA:  83 c4 08                        add      esp, 8
  100286BD:  85 c0                           test     eax, eax
  100286BF:  74 41                           je       0x10028702
  100286C1:  83 3d 64 c5 08 10 00            cmp      dword ptr [0x1008c564], 0
  100286C8:  74 38                           je       0x10028702
  100286CA:  6a ff                           push     -1
  100286CC:  56                              push     esi
  100286CD:  e8 7e 22 ff ff                  call     0x1001a950  ; GW::HashWString
  100286D2:  8b f0                           mov      esi, eax
  100286D4:  83 c4 08                        add      esp, 8
  100286D7:  a1 64 c5 08 10                  mov      eax, dword ptr [0x1008c564]
  100286DC:  8b 08                           mov      ecx, dword ptr [eax]
  100286DE:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  100286E1:  8d 14 81                        lea      edx, [ecx + eax*4]
  100286E4:  3b ca                           cmp      ecx, edx
  100286E6:  74 1a                           je       0x10028702
  100286E8:  8b 01                           mov      eax, dword ptr [ecx]
  100286EA:  85 c0                           test     eax, eax
  100286EC:  74 0d                           je       0x100286fb
  100286EE:  83 f8 ff                        cmp      eax, -1
  100286F1:  74 08                           je       0x100286fb
  100286F3:  39 b0 34 01 00 00               cmp      dword ptr [eax + 0x134], esi
  100286F9:  74 0f                           je       0x1002870a
  100286FB:  83 c1 04                        add      ecx, 4
  100286FE:  3b ca                           cmp      ecx, edx
  10028700:  75 e6                           jne      0x100286e8
  10028702:  32 c0                           xor      al, al
  10028704:  5f                              pop      edi
  10028705:  5e                              pop      esi
  10028706:  8b e5                           mov      esp, ebp
  10028708:  5d                              pop      ebp
  10028709:  c3                              ret      
  1002870A:  8d 48 fc                        lea      ecx, [eax - 4]
  1002870D:  85 c9                           test     ecx, ecx
  1002870F:  74 f1                           je       0x10028702
  10028711:  57                              push     edi
  10028712:  e8 99 f2 fe ff                  call     0x100179b0  ; CheckboxFrame::SetValue
  10028717:  84 c0                           test     al, al
  10028719:  74 e7                           je       0x10028702
  1002871B:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  1002871E:  85 c0                           test     eax, eax
  10028720:  74 2a                           je       0x1002874c
  10028722:  8b 0d 48 c5 08 10               mov      ecx, dword ptr [0x1008c548]
  10028728:  85 c9                           test     ecx, ecx
  1002872A:  74 20                           je       0x1002874c
  1002872C:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  10028732:  ff d1                           call     ecx
  10028734:  83 c4 04                        add      esp, 4
  10028737:  b0 01                           mov      al, 1
  10028739:  5f                              pop      edi
  1002873A:  5e                              pop      esi
  1002873B:  8b e5                           mov      esp, ebp
  1002873D:  5d                              pop      ebp
  1002873E:  c3                              ret      
  1002873F:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028742:  57                              push     edi
  10028743:  ff 15 a0 c5 08 10               call     dword ptr [0x1008c5a0]
  10028749:  83 c4 08                        add      esp, 8
  1002874C:  5f                              pop      edi
  1002874D:  b0 01                           mov      al, 1
  1002874F:  5e                              pop      esi
  10028750:  8b e5                           mov      esp, ebp
  10028752:  5d                              pop      ebp
  10028753:  c3                              ret      
  10028754:  69 86 02 10 77 86 02 10 93 86   imul     eax, dword ptr [esi - 0x7988effe], 0x86931002
  1002875E:  02 10                           add      dl, byte ptr [eax]
  10028760:  70 86                           jo       0x100286e8
  10028762:  02 10                           add      dl, byte ptr [eax]
  10028764:  85 86 02 10 8c 86               test     dword ptr [esi - 0x7973effe], eax
  1002876A:  02 10                           add      dl, byte ptr [eax]
  1002876C:  7e 86                           jle      0x100286f4
  1002876E:  02 10                           add      dl, byte ptr [eax]
  10028770:  3f                              aas      
  10028771:  87 02                           xchg     dword ptr [edx], eax
  10028773:  10 00                           adc      byte ptr [eax], al
  10028775:  07                              pop      es
  10028776:  07                              pop      es
  10028777:  07                              pop      es
  10028778:  07                              pop      es
  10028779:  07                              pop      es
  1002877A:  07                              pop      es
  1002877B:  07                              pop      es
  1002877C:  07                              pop      es
  1002877D:  07                              pop      es
  1002877E:  07                              pop      es
  1002877F:  07                              pop      es
  10028780:  07                              pop      es
  10028781:  07                              pop      es
  10028782:  07                              pop      es
  10028783:  07                              pop      es
  10028784:  07                              pop      es
  10028785:  01 07                           add      dword ptr [edi], eax
  10028787:  02 07                           add      al, byte ptr [edi]
  10028789:  07                              pop      es
  1002878A:  07                              pop      es
  1002878B:  07                              pop      es
  1002878C:  07                              pop      es
  1002878D:  07                              pop      es
  1002878E:  07                              pop      es
  1002878F:  07                              pop      es
  10028790:  07                              pop      es
  10028791:  03 07                           add      eax, dword ptr [edi]
  10028793:  07                              pop      es
  10028794:  04 05                           add      al, 5
  10028796:  07                              pop      es
  10028797:  06                              push     es
  10028798:  cc                              int3     
  10028799:  cc                              int3     
  1002879A:  cc                              int3     
  1002879B:  cc                              int3     
  1002879C:  cc                              int3     
  1002879D:  cc                              int3     
  1002879E:  cc                              int3     
  1002879F:  cc                              int3     
  100287A0:  55                              push     ebp
  100287A1:  8b ec                           mov      ebp, esp
  100287A3:  51                              push     ecx
  100287A4:  a1 94 c5 08 10                  mov      eax, dword ptr [0x1008c594]
  100287A9:  53                              push     ebx
  100287AA:  56                              push     esi
  100287AB:  57                              push     edi
  100287AC:  85 c0                           test     eax, eax
  100287AE:  0f 84 42 01 00 00               je       0x100288f6
  100287B4:  83 38 01                        cmp      dword ptr [eax], 1
  100287B7:  0f 85 39 01 00 00               jne      0x100288f6
  100287BD:  e8 3e 19 ff ff                  call     0x1001a100  ; GameThread::IsInGameThread, IsInGameThread
  100287C2:  84 c0                           test     al, al
  100287C4:  75 2d                           jne      0x100287f3
  100287C6:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  100287C9:  8b 55 0c                        mov      edx, dword ptr [ebp + 0xc]
  100287CC:  6a 00                           push     0
  100287CE:  83 ec 28                        sub      esp, 0x28
  100287D1:  8b c4                           mov      eax, esp
  100287D3:  c7 00 14 46 05 10               mov      dword ptr [eax], 0x10054614
  100287D9:  89 48 04                        mov      dword ptr [eax + 4], ecx
  100287DC:  89 50 08                        mov      dword ptr [eax + 8], edx
  100287DF:  89 40 24                        mov      dword ptr [eax + 0x24], eax
  100287E2:  e8 59 18 ff ff                  call     0x1001a040  ; GameThread::Enqueue
  100287E7:  83 c4 2c                        add      esp, 0x2c
  100287EA:  b0 01                           mov      al, 1
  100287EC:  5f                              pop      edi
  100287ED:  5e                              pop      esi
  100287EE:  5b                              pop      ebx
  100287EF:  8b e5                           mov      esp, ebp
  100287F1:  5d                              pop      ebp
  100287F2:  c3                              ret      
  100287F3:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  100287F6:  8b 15 a4 a2 08 10               mov      edx, dword ptr [0x1008a2a4]
  100287FC:  8d 46 f6                        lea      eax, [esi - 0xa]
  100287FF:  83 f8 1d                        cmp      eax, 0x1d
  10028802:  77 61                           ja       0x10028865
  10028804:  0f b6 80 4c 8b 02 10            movzx    eax, byte ptr [eax + 0x10028b4c]
  1002880B:  ff 24 85 30 8b 02 10            jmp      dword ptr [eax*4 + 0x10028b30]
  10028812:  a1 a0 a2 08 10                  mov      eax, dword ptr [0x1008a2a0]
  10028817:  b9 54 44 05 10                  mov      ecx, 0x10054454
  1002881C:  eb 2d                           jmp      0x1002884b
  1002881E:  a1 a0 a2 08 10                  mov      eax, dword ptr [0x1008a2a0]
  10028823:  b9 78 44 05 10                  mov      ecx, 0x10054478
  10028828:  eb 21                           jmp      0x1002884b
  1002882A:  a1 a0 a2 08 10                  mov      eax, dword ptr [0x1008a2a0]
  1002882F:  b9 a8 44 05 10                  mov      ecx, 0x100544a8
  10028834:  eb 15                           jmp      0x1002884b
  10028836:  b9 c4 44 05 10                  mov      ecx, 0x100544c4
  1002883B:  eb 0c                           jmp      0x10028849
  1002883D:  b9 e4 44 05 10                  mov      ecx, 0x100544e4
  10028842:  eb 05                           jmp      0x10028849
  10028844:  b9 fc 44 05 10                  mov      ecx, 0x100544fc
  10028849:  8b c2                           mov      eax, edx
  1002884B:  85 c0                           test     eax, eax
  1002884D:  74 16                           je       0x10028865
  1002884F:  6a 00                           push     0
  10028851:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028854:  51                              push     ecx
  10028855:  50                              push     eax
  10028856:  e8 65 fb ff ff                  call     0x100283c0
  1002885B:  83 c4 10                        add      esp, 0x10
  1002885E:  5f                              pop      edi
  1002885F:  5e                              pop      esi
  10028860:  5b                              pop      ebx
  10028861:  8b e5                           mov      esp, ebp
  10028863:  5d                              pop      ebp
  10028864:  c3                              ret      
  10028865:  83 fe 08                        cmp      esi, 8
  10028868:  0f 85 e0 00 00 00               jne      0x1002894e
  1002886E:  85 d2                           test     edx, edx
  10028870:  0f 84 d8 00 00 00               je       0x1002894e
  10028876:  8d 45 fc                        lea      eax, [ebp - 4]
  10028879:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10028880:  50                              push     eax
  10028881:  52                              push     edx
  10028882:  e8 29 f5 ff ff                  call     0x10027db0
  10028887:  83 c4 08                        add      esp, 8
  1002888A:  85 c0                           test     eax, eax
  1002888C:  74 4c                           je       0x100288da
  1002888E:  83 3d 64 c5 08 10 00            cmp      dword ptr [0x1008c564], 0
  10028895:  74 43                           je       0x100288da
  10028897:  6a ff                           push     -1
  10028899:  68 c0 45 05 10                  push     0x100545c0
  1002889E:  e8 ad 20 ff ff                  call     0x1001a950  ; GW::HashWString
  100288A3:  8b f0                           mov      esi, eax
  100288A5:  83 c4 08                        add      esp, 8
  100288A8:  a1 64 c5 08 10                  mov      eax, dword ptr [0x1008c564]
  100288AD:  8b 08                           mov      ecx, dword ptr [eax]
  100288AF:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  100288B2:  8d 14 81                        lea      edx, [ecx + eax*4]
  100288B5:  3b ca                           cmp      ecx, edx
  100288B7:  74 21                           je       0x100288da
  100288B9:  0f 1f 80 00 00 00 00            nop      dword ptr [eax]
  100288C0:  8b 01                           mov      eax, dword ptr [ecx]
  100288C2:  85 c0                           test     eax, eax
  100288C4:  74 0d                           je       0x100288d3
  100288C6:  83 f8 ff                        cmp      eax, -1
  100288C9:  74 08                           je       0x100288d3
  100288CB:  39 b0 34 01 00 00               cmp      dword ptr [eax + 0x134], esi
  100288D1:  74 2c                           je       0x100288ff
  100288D3:  83 c1 04                        add      ecx, 4
  100288D6:  3b ca                           cmp      ecx, edx
  100288D8:  75 e6                           jne      0x100288c0
  100288DA:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  100288DD:  85 c0                           test     eax, eax
  100288DF:  74 15                           je       0x100288f6
  100288E1:  8b 0d 48 c5 08 10               mov      ecx, dword ptr [0x1008c548]
  100288E7:  85 c9                           test     ecx, ecx
  100288E9:  74 0b                           je       0x100288f6
  100288EB:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  100288F1:  ff d1                           call     ecx
  100288F3:  83 c4 04                        add      esp, 4
  100288F6:  32 c0                           xor      al, al
  100288F8:  5f                              pop      edi
  100288F9:  5e                              pop      esi
  100288FA:  5b                              pop      ebx
  100288FB:  8b e5                           mov      esp, ebp
  100288FD:  5d                              pop      ebp
  100288FE:  c3                              ret      
  100288FF:  8d 48 fc                        lea      ecx, [eax - 4]
  10028902:  85 c9                           test     ecx, ecx
  10028904:  74 d4                           je       0x100288da
  10028906:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028909:  e8 82 f1 fe ff                  call     0x10017a90  ; SliderFrame::SetValue
  1002890E:  84 c0                           test     al, al
  10028910:  74 c8                           je       0x100288da
  10028912:  8b 75 fc                        mov      esi, dword ptr [ebp - 4]
  10028915:  a1 48 c5 08 10                  mov      eax, dword ptr [0x1008c548]
  1002891A:  85 f6                           test     esi, esi
  1002891C:  74 27                           je       0x10028945
  1002891E:  85 c0                           test     eax, eax
  10028920:  74 10                           je       0x10028932
  10028922:  ff b6 bc 00 00 00               push     dword ptr [esi + 0xbc]
  10028928:  ff d0                           call     eax
  1002892A:  a1 48 c5 08 10                  mov      eax, dword ptr [0x1008c548]
  1002892F:  83 c4 04                        add      esp, 4
  10028932:  85 f6                           test     esi, esi
  10028934:  74 0f                           je       0x10028945
  10028936:  85 c0                           test     eax, eax
  10028938:  74 0b                           je       0x10028945
  1002893A:  ff b6 bc 00 00 00               push     dword ptr [esi + 0xbc]
  10028940:  ff d0                           call     eax
  10028942:  83 c4 04                        add      esp, 4
  10028945:  b0 01                           mov      al, 1
  10028947:  5f                              pop      edi
  10028948:  5e                              pop      esi
  10028949:  5b                              pop      ebx
  1002894A:  8b e5                           mov      esp, ebp
  1002894C:  5d                              pop      ebp
  1002894D:  c3                              ret      
  1002894E:  8d 46 ed                        lea      eax, [esi - 0x13]
  10028951:  83 f8 13                        cmp      eax, 0x13
  10028954:  0f 87 54 01 00 00               ja       0x10028aae
  1002895A:  0f b6 80 8c 8b 02 10            movzx    eax, byte ptr [eax + 0x10028b8c]
  10028961:  ff 24 85 6c 8b 02 10            jmp      dword ptr [eax*4 + 0x10028b6c]
  10028968:  bb 02 00 00 00                  mov      ebx, 2
  1002896D:  eb 28                           jmp      0x10028997
  1002896F:  bb 04 00 00 00                  mov      ebx, 4
  10028974:  eb 21                           jmp      0x10028997
  10028976:  bb 06 00 00 00                  mov      ebx, 6
  1002897B:  eb 1a                           jmp      0x10028997
  1002897D:  bb 08 00 00 00                  mov      ebx, 8
  10028982:  eb 13                           jmp      0x10028997
  10028984:  bb 0a 00 00 00                  mov      ebx, 0xa
  10028989:  eb 0c                           jmp      0x10028997
  1002898B:  bb 0c 00 00 00                  mov      ebx, 0xc
  10028990:  eb 05                           jmp      0x10028997
  10028992:  bb 11 00 00 00                  mov      ebx, 0x11
  10028997:  8b 3d a8 a2 08 10               mov      edi, dword ptr [0x1008a2a8]
  1002899D:  85 ff                           test     edi, edi
  1002899F:  0f 84 09 01 00 00               je       0x10028aae
  100289A5:  8d 45 fc                        lea      eax, [ebp - 4]
  100289A8:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  100289AF:  50                              push     eax
  100289B0:  57                              push     edi
  100289B1:  e8 fa f3 ff ff                  call     0x10027db0
  100289B6:  83 c4 08                        add      esp, 8
  100289B9:  85 c0                           test     eax, eax
  100289BB:  0f 84 19 ff ff ff               je       0x100288da
  100289C1:  57                              push     edi
  100289C2:  8b c8                           mov      ecx, eax
  100289C4:  e8 07 e8 fe ff                  call     0x100171d0  ; TabsFrame::GetTabByLabel
  100289C9:  8b 0d 34 c5 08 10               mov      ecx, dword ptr [0x1008c534]
  100289CF:  85 c9                           test     ecx, ecx
  100289D1:  74 1f                           je       0x100289f2
  100289D3:  85 c0                           test     eax, eax
  100289D5:  74 1b                           je       0x100289f2
  100289D7:  6a 00                           push     0
  100289D9:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  100289DF:  ff d1                           call     ecx
  100289E1:  50                              push     eax
  100289E2:  e8 29 dd ff ff                  call     0x10026710  ; UI::GetFrameById
  100289E7:  8b 0d 34 c5 08 10               mov      ecx, dword ptr [0x1008c534]
  100289ED:  83 c4 0c                        add      esp, 0xc
  100289F0:  eb 02                           jmp      0x100289f4
  100289F2:  33 c0                           xor      eax, eax
  100289F4:  85 c9                           test     ecx, ecx
  100289F6:  74 1f                           je       0x10028a17
  100289F8:  85 c0                           test     eax, eax
  100289FA:  74 1b                           je       0x10028a17
  100289FC:  6a 00                           push     0
  100289FE:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  10028A04:  ff d1                           call     ecx
  10028A06:  50                              push     eax
  10028A07:  e8 04 dd ff ff                  call     0x10026710  ; UI::GetFrameById
  10028A0C:  8b 0d 34 c5 08 10               mov      ecx, dword ptr [0x1008c534]
  10028A12:  83 c4 0c                        add      esp, 0xc
  10028A15:  eb 02                           jmp      0x10028a19
  10028A17:  33 c0                           xor      eax, eax
  10028A19:  85 c9                           test     ecx, ecx
  10028A1B:  74 1f                           je       0x10028a3c
  10028A1D:  85 c0                           test     eax, eax
  10028A1F:  74 1b                           je       0x10028a3c
  10028A21:  6a 00                           push     0
  10028A23:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  10028A29:  ff d1                           call     ecx
  10028A2B:  50                              push     eax
  10028A2C:  e8 df dc ff ff                  call     0x10026710  ; UI::GetFrameById
  10028A31:  8b 0d 34 c5 08 10               mov      ecx, dword ptr [0x1008c534]
  10028A37:  83 c4 0c                        add      esp, 0xc
  10028A3A:  eb 02                           jmp      0x10028a3e
  10028A3C:  33 c0                           xor      eax, eax
  10028A3E:  85 c9                           test     ecx, ecx
  10028A40:  0f 84 94 fe ff ff               je       0x100288da
  10028A46:  85 c0                           test     eax, eax
  10028A48:  0f 84 8c fe ff ff               je       0x100288da
  10028A4E:  53                              push     ebx
  10028A4F:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  10028A55:  ff d1                           call     ecx
  10028A57:  50                              push     eax
  10028A58:  e8 b3 dc ff ff                  call     0x10026710  ; UI::GetFrameById
  10028A5D:  83 c4 0c                        add      esp, 0xc
  10028A60:  8d 48 fc                        lea      ecx, [eax - 4]
  10028A63:  f7 d8                           neg      eax
  10028A65:  1b c0                           sbb      eax, eax
  10028A67:  23 c1                           and      eax, ecx
  10028A69:  0f 84 6b fe ff ff               je       0x100288da
  10028A6F:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028A72:  8b c8                           mov      ecx, eax
  10028A74:  e8 17 f0 fe ff                  call     0x10017a90  ; SliderFrame::SetValue
  10028A79:  84 c0                           test     al, al
  10028A7B:  0f 84 59 fe ff ff               je       0x100288da
  10028A81:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  10028A84:  85 c0                           test     eax, eax
  10028A86:  0f 84 b9 fe ff ff               je       0x10028945
  10028A8C:  8b 0d 48 c5 08 10               mov      ecx, dword ptr [0x1008c548]
  10028A92:  85 c9                           test     ecx, ecx
  10028A94:  0f 84 ab fe ff ff               je       0x10028945
  10028A9A:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  10028AA0:  ff d1                           call     ecx
  10028AA2:  83 c4 04                        add      esp, 4
  10028AA5:  b0 01                           mov      al, 1
  10028AA7:  5f                              pop      edi
  10028AA8:  5e                              pop      esi
  10028AA9:  5b                              pop      ebx
  10028AAA:  8b e5                           mov      esp, ebp
  10028AAC:  5d                              pop      ebp
  10028AAD:  c3                              ret      
  10028AAE:  8b 0d 70 c5 08 10               mov      ecx, dword ptr [0x1008c570]
  10028AB4:  85 c9                           test     ecx, ecx
  10028AB6:  74 30                           je       0x10028ae8
  10028AB8:  a1 94 c5 08 10                  mov      eax, dword ptr [0x1008c594]
  10028ABD:  85 c0                           test     eax, eax
  10028ABF:  74 27                           je       0x10028ae8
  10028AC1:  83 38 01                        cmp      dword ptr [eax], 1
  10028AC4:  75 22                           jne      0x10028ae8
  10028AC6:  83 fe 2b                        cmp      esi, 0x2b
  10028AC9:  73 1d                           jae      0x10028ae8
  10028ACB:  8d 04 76                        lea      eax, [esi + esi*2]
  10028ACE:  f6 44 c1 04 01                  test     byte ptr [ecx + eax*8 + 4], 1
  10028AD3:  74 13                           je       0x10028ae8
  10028AD5:  8b 44 c1 10                     mov      eax, dword ptr [ecx + eax*8 + 0x10]
  10028AD9:  85 c0                           test     eax, eax
  10028ADB:  74 0b                           je       0x10028ae8
  10028ADD:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028AE0:  56                              push     esi
  10028AE1:  ff d0                           call     eax
  10028AE3:  83 c4 08                        add      esp, 8
  10028AE6:  eb 03                           jmp      0x10028aeb
  10028AE8:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10028AEB:  8b 0d b8 c5 08 10               mov      ecx, dword ptr [0x1008c5b8]
  10028AF1:  85 c9                           test     ecx, ecx
  10028AF3:  0f 84 fd fd ff ff               je       0x100288f6
  10028AF9:  83 fe 2b                        cmp      esi, 0x2b
  10028AFC:  0f 83 f4 fd ff ff               jae      0x100288f6
  10028B02:  50                              push     eax
  10028B03:  56                              push     esi
  10028B04:  ff d1                           call     ecx
  10028B06:  83 c4 08                        add      esp, 8
  10028B09:  6a 00                           push     0
  10028B0B:  83 ec 28                        sub      esp, 0x28
  10028B0E:  8b c4                           mov      eax, esp
  10028B10:  c7 00 30 46 05 10               mov      dword ptr [eax], 0x10054630
  10028B16:  89 70 04                        mov      dword ptr [eax + 4], esi
  10028B19:  89 40 24                        mov      dword ptr [eax + 0x24], eax
  10028B1C:  e8 1f 15 ff ff                  call     0x1001a040  ; GameThread::Enqueue
  10028B21:  83 c4 2c                        add      esp, 0x2c
  10028B24:  b0 01                           mov      al, 1
  10028B26:  5f                              pop      edi
  10028B27:  5e                              pop      esi
  10028B28:  5b                              pop      ebx
  10028B29:  8b e5                           mov      esp, ebp
  10028B2B:  5d                              pop      ebp
  10028B2C:  c3                              ret      
  10028B2D:  0f 1f 00                        nop      dword ptr [eax]
  10028B30:  12 88 02 10 1e 88               adc      cl, byte ptr [eax - 0x77e1effe]
  10028B36:  02 10                           add      dl, byte ptr [eax]
  10028B38:  3d 88 02 10 44                  cmp      eax, 0x44100288
  10028B3D:  88 02                           mov      byte ptr [edx], al
  10028B3F:  10 36                           adc      byte ptr [esi], dh
  10028B41:  88 02                           mov      byte ptr [edx], al
  10028B43:  10 2a                           adc      byte ptr [edx], ch
  10028B45:  88 02                           mov      byte ptr [edx], al
  10028B47:  10 65 88                        adc      byte ptr [ebp - 0x78], ah
  10028B4A:  02 10                           add      dl, byte ptr [eax]
  10028B4C:  00 01                           add      byte ptr [ecx], al
  10028B4E:  06                              push     es
  10028B4F:  02 06                           add      al, byte ptr [esi]
  10028B51:  06                              push     es
  10028B52:  06                              push     es
  10028B53:  06                              push     es
  10028B54:  06                              push     es
  10028B55:  06                              push     es
  10028B56:  06                              push     es
  10028B57:  03 06                           add      eax, dword ptr [esi]
  10028B59:  06                              push     es
  10028B5A:  06                              push     es
  10028B5B:  06                              push     es
  10028B5C:  06                              push     es
  10028B5D:  06                              push     es
  10028B5E:  06                              push     es
  10028B5F:  06                              push     es
  10028B60:  06                              push     es
  10028B61:  06                              push     es
  10028B62:  06                              push     es
  10028B63:  06                              push     es
  10028B64:  06                              push     es
  10028B65:  06                              push     es
  10028B66:  06                              push     es
  10028B67:  04 06                           add      al, 6
  10028B69:  05 66 90 92 89                  add      eax, 0x89929066
  10028B6E:  02 10                           add      dl, byte ptr [eax]
  10028B70:  76 89                           jbe      0x10028afb
  10028B72:  02 10                           add      dl, byte ptr [eax]
  10028B74:  84 89 02 10 7d 89               test     byte ptr [ecx - 0x7682effe], cl
  10028B7A:  02 10                           add      dl, byte ptr [eax]
  10028B7C:  6f                              outsd    dx, dword ptr [esi]
  10028B7D:  89 02                           mov      dword ptr [edx], eax
  10028B7F:  10 8b 89 02 10 68               adc      byte ptr [ebx + 0x68100289], cl
  10028B85:  89 02                           mov      dword ptr [edx], eax
  10028B87:  10 ae 8a 02 10 00               adc      byte ptr [esi + 0x10028a], ch
  10028B8D:  07                              pop      es
  10028B8E:  07                              pop      es
  10028B8F:  07                              pop      es
  10028B90:  01 02                           add      dword ptr [edx], eax
  10028B92:  03 04 05 07 07 07 07            add      eax, dword ptr [eax + 0x7070707]
  10028B99:  07                              pop      es
  10028B9A:  07                              pop      es
  10028B9B:  07                              pop      es
  10028B9C:  07                              pop      es
  10028B9D:  07                              pop      es
  10028B9E:  07                              pop      es
  10028B9F:  06                              push     es
  10028BA0:  55                              push     ebp
  10028BA1:  8b ec                           mov      ebp, esp
  10028BA3:  51                              push     ecx
  10028BA4:  83 3d a8 c5 08 10 00            cmp      dword ptr [0x1008c5a8], 0
  10028BAB:  56                              push     esi
  10028BAC:  74 5b                           je       0x10028c09
  10028BAE:  a1 94 c5 08 10                  mov      eax, dword ptr [0x1008c594]
  10028BB3:  85 c0                           test     eax, eax
  10028BB5:  74 52                           je       0x10028c09
  10028BB7:  83 38 01                        cmp      dword ptr [eax], 1
  10028BBA:  75 4d                           jne      0x10028c09
  10028BBC:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10028BBF:  83 fe 03                        cmp      esi, 3
  10028BC2:  73 45                           jae      0x10028c09
  10028BC4:  e8 37 15 ff ff                  call     0x1001a100  ; GameThread::IsInGameThread, IsInGameThread
  10028BC9:  84 c0                           test     al, al
  10028BCB:  75 28                           jne      0x10028bf5
  10028BCD:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  10028BD0:  6a 00                           push     0
  10028BD2:  83 ec 28                        sub      esp, 0x28
  10028BD5:  8b c4                           mov      eax, esp
  10028BD7:  c7 00 4c 46 05 10               mov      dword ptr [eax], 0x1005464c
  10028BDD:  89 70 04                        mov      dword ptr [eax + 4], esi
  10028BE0:  89 48 08                        mov      dword ptr [eax + 8], ecx
  10028BE3:  89 40 24                        mov      dword ptr [eax + 0x24], eax
  10028BE6:  e8 55 14 ff ff                  call     0x1001a040  ; GameThread::Enqueue
  10028BEB:  83 c4 2c                        add      esp, 0x2c
  10028BEE:  b0 01                           mov      al, 1
  10028BF0:  5e                              pop      esi
  10028BF1:  8b e5                           mov      esp, ebp
  10028BF3:  5d                              pop      ebp
  10028BF4:  c3                              ret      
  10028BF5:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028BF8:  56                              push     esi
  10028BF9:  ff 15 a8 c5 08 10               call     dword ptr [0x1008c5a8]
  10028BFF:  83 c4 08                        add      esp, 8
  10028C02:  b0 01                           mov      al, 1
  10028C04:  5e                              pop      esi
  10028C05:  8b e5                           mov      esp, ebp
  10028C07:  5d                              pop      ebp
  10028C08:  c3                              ret      
  10028C09:  32 c0                           xor      al, al
  10028C0B:  5e                              pop      esi
  10028C0C:  8b e5                           mov      esp, ebp
  10028C0E:  5d                              pop      ebp
  10028C0F:  c3                              ret      


; === UI::SetPreference ===
; RVA: 0x000285E0  Size: 1584 bytes
; Exports: ?SetPreference@UI@GW@@YA_NW4FlagPreference@12@_N@Z
;
  100285E0:  55                              push     ebp
  100285E1:  8b ec                           mov      ebp, esp
  100285E3:  83 ec 0c                        sub      esp, 0xc
  100285E6:  83 3d a0 c5 08 10 00            cmp      dword ptr [0x1008c5a0], 0
  100285ED:  56                              push     esi
  100285EE:  57                              push     edi
  100285EF:  0f 84 0d 01 00 00               je       0x10028702
  100285F5:  a1 94 c5 08 10                  mov      eax, dword ptr [0x1008c594]
  100285FA:  85 c0                           test     eax, eax
  100285FC:  0f 84 00 01 00 00               je       0x10028702
  10028602:  83 38 01                        cmp      dword ptr [eax], 1
  10028605:  0f 85 f7 00 00 00               jne      0x10028702
  1002860B:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  1002860E:  83 ff 6c                        cmp      edi, 0x6c
  10028611:  0f 83 eb 00 00 00               jae      0x10028702
  10028617:  e8 e4 1a ff ff                  call     0x1001a100  ; GameThread::IsInGameThread, IsInGameThread
  1002861C:  84 c0                           test     al, al
  1002861E:  75 2f                           jne      0x1002864f
  10028620:  8a 45 0c                        mov      al, byte ptr [ebp + 0xc]
  10028623:  6a 00                           push     0
  10028625:  83 ec 28                        sub      esp, 0x28
  10028628:  88 45 f8                        mov      byte ptr [ebp - 8], al
  1002862B:  8b 45 f8                        mov      eax, dword ptr [ebp - 8]
  1002862E:  8b cc                           mov      ecx, esp
  10028630:  c7 01 68 46 05 10               mov      dword ptr [ecx], 0x10054668
  10028636:  89 79 04                        mov      dword ptr [ecx + 4], edi
  10028639:  89 41 08                        mov      dword ptr [ecx + 8], eax
  1002863C:  89 49 24                        mov      dword ptr [ecx + 0x24], ecx
  1002863F:  e8 fc 19 ff ff                  call     0x1001a040  ; GameThread::Enqueue
  10028644:  83 c4 2c                        add      esp, 0x2c
  10028647:  b0 01                           mov      al, 1
  10028649:  5f                              pop      edi
  1002864A:  5e                              pop      esi
  1002864B:  8b e5                           mov      esp, ebp
  1002864D:  5d                              pop      ebp
  1002864E:  c3                              ret      
  1002864F:  8d 47 bf                        lea      eax, [edi - 0x41]
  10028652:  83 f8 23                        cmp      eax, 0x23
  10028655:  0f 87 e4 00 00 00               ja       0x1002873f
  1002865B:  0f b6 80 74 87 02 10            movzx    eax, byte ptr [eax + 0x10028774]
  10028662:  ff 24 85 54 87 02 10            jmp      dword ptr [eax*4 + 0x10028754]
  10028669:  be 1c 45 05 10                  mov      esi, 0x1005451c
  1002866E:  eb 28                           jmp      0x10028698
  10028670:  be 30 45 05 10                  mov      esi, 0x10054530
  10028675:  eb 21                           jmp      0x10028698
  10028677:  be 4c 45 05 10                  mov      esi, 0x1005454c
  1002867C:  eb 1a                           jmp      0x10028698
  1002867E:  be 74 45 05 10                  mov      esi, 0x10054574
  10028683:  eb 13                           jmp      0x10028698
  10028685:  be 84 45 05 10                  mov      esi, 0x10054584
  1002868A:  eb 0c                           jmp      0x10028698
  1002868C:  be 94 45 05 10                  mov      esi, 0x10054594
  10028691:  eb 05                           jmp      0x10028698
  10028693:  be ac 45 05 10                  mov      esi, 0x100545ac
  10028698:  a1 a4 a2 08 10                  mov      eax, dword ptr [0x1008a2a4]
  1002869D:  85 c0                           test     eax, eax
  1002869F:  0f 84 9a 00 00 00               je       0x1002873f
  100286A5:  0f b6 7d 0c                     movzx    edi, byte ptr [ebp + 0xc]
  100286A9:  8d 4d fc                        lea      ecx, [ebp - 4]
  100286AC:  51                              push     ecx
  100286AD:  50                              push     eax
  100286AE:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  100286B5:  e8 f6 f6 ff ff                  call     0x10027db0
  100286BA:  83 c4 08                        add      esp, 8
  100286BD:  85 c0                           test     eax, eax
  100286BF:  74 41                           je       0x10028702
  100286C1:  83 3d 64 c5 08 10 00            cmp      dword ptr [0x1008c564], 0
  100286C8:  74 38                           je       0x10028702
  100286CA:  6a ff                           push     -1
  100286CC:  56                              push     esi
  100286CD:  e8 7e 22 ff ff                  call     0x1001a950  ; GW::HashWString
  100286D2:  8b f0                           mov      esi, eax
  100286D4:  83 c4 08                        add      esp, 8
  100286D7:  a1 64 c5 08 10                  mov      eax, dword ptr [0x1008c564]
  100286DC:  8b 08                           mov      ecx, dword ptr [eax]
  100286DE:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  100286E1:  8d 14 81                        lea      edx, [ecx + eax*4]
  100286E4:  3b ca                           cmp      ecx, edx
  100286E6:  74 1a                           je       0x10028702
  100286E8:  8b 01                           mov      eax, dword ptr [ecx]
  100286EA:  85 c0                           test     eax, eax
  100286EC:  74 0d                           je       0x100286fb
  100286EE:  83 f8 ff                        cmp      eax, -1
  100286F1:  74 08                           je       0x100286fb
  100286F3:  39 b0 34 01 00 00               cmp      dword ptr [eax + 0x134], esi
  100286F9:  74 0f                           je       0x1002870a
  100286FB:  83 c1 04                        add      ecx, 4
  100286FE:  3b ca                           cmp      ecx, edx
  10028700:  75 e6                           jne      0x100286e8
  10028702:  32 c0                           xor      al, al
  10028704:  5f                              pop      edi
  10028705:  5e                              pop      esi
  10028706:  8b e5                           mov      esp, ebp
  10028708:  5d                              pop      ebp
  10028709:  c3                              ret      
  1002870A:  8d 48 fc                        lea      ecx, [eax - 4]
  1002870D:  85 c9                           test     ecx, ecx
  1002870F:  74 f1                           je       0x10028702
  10028711:  57                              push     edi
  10028712:  e8 99 f2 fe ff                  call     0x100179b0  ; CheckboxFrame::SetValue
  10028717:  84 c0                           test     al, al
  10028719:  74 e7                           je       0x10028702
  1002871B:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  1002871E:  85 c0                           test     eax, eax
  10028720:  74 2a                           je       0x1002874c
  10028722:  8b 0d 48 c5 08 10               mov      ecx, dword ptr [0x1008c548]
  10028728:  85 c9                           test     ecx, ecx
  1002872A:  74 20                           je       0x1002874c
  1002872C:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  10028732:  ff d1                           call     ecx
  10028734:  83 c4 04                        add      esp, 4
  10028737:  b0 01                           mov      al, 1
  10028739:  5f                              pop      edi
  1002873A:  5e                              pop      esi
  1002873B:  8b e5                           mov      esp, ebp
  1002873D:  5d                              pop      ebp
  1002873E:  c3                              ret      
  1002873F:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028742:  57                              push     edi
  10028743:  ff 15 a0 c5 08 10               call     dword ptr [0x1008c5a0]
  10028749:  83 c4 08                        add      esp, 8
  1002874C:  5f                              pop      edi
  1002874D:  b0 01                           mov      al, 1
  1002874F:  5e                              pop      esi
  10028750:  8b e5                           mov      esp, ebp
  10028752:  5d                              pop      ebp
  10028753:  c3                              ret      
  10028754:  69 86 02 10 77 86 02 10 93 86   imul     eax, dword ptr [esi - 0x7988effe], 0x86931002
  1002875E:  02 10                           add      dl, byte ptr [eax]
  10028760:  70 86                           jo       0x100286e8
  10028762:  02 10                           add      dl, byte ptr [eax]
  10028764:  85 86 02 10 8c 86               test     dword ptr [esi - 0x7973effe], eax
  1002876A:  02 10                           add      dl, byte ptr [eax]
  1002876C:  7e 86                           jle      0x100286f4
  1002876E:  02 10                           add      dl, byte ptr [eax]
  10028770:  3f                              aas      
  10028771:  87 02                           xchg     dword ptr [edx], eax
  10028773:  10 00                           adc      byte ptr [eax], al
  10028775:  07                              pop      es
  10028776:  07                              pop      es
  10028777:  07                              pop      es
  10028778:  07                              pop      es
  10028779:  07                              pop      es
  1002877A:  07                              pop      es
  1002877B:  07                              pop      es
  1002877C:  07                              pop      es
  1002877D:  07                              pop      es
  1002877E:  07                              pop      es
  1002877F:  07                              pop      es
  10028780:  07                              pop      es
  10028781:  07                              pop      es
  10028782:  07                              pop      es
  10028783:  07                              pop      es
  10028784:  07                              pop      es
  10028785:  01 07                           add      dword ptr [edi], eax
  10028787:  02 07                           add      al, byte ptr [edi]
  10028789:  07                              pop      es
  1002878A:  07                              pop      es
  1002878B:  07                              pop      es
  1002878C:  07                              pop      es
  1002878D:  07                              pop      es
  1002878E:  07                              pop      es
  1002878F:  07                              pop      es
  10028790:  07                              pop      es
  10028791:  03 07                           add      eax, dword ptr [edi]
  10028793:  07                              pop      es
  10028794:  04 05                           add      al, 5
  10028796:  07                              pop      es
  10028797:  06                              push     es
  10028798:  cc                              int3     
  10028799:  cc                              int3     
  1002879A:  cc                              int3     
  1002879B:  cc                              int3     
  1002879C:  cc                              int3     
  1002879D:  cc                              int3     
  1002879E:  cc                              int3     
  1002879F:  cc                              int3     
  100287A0:  55                              push     ebp
  100287A1:  8b ec                           mov      ebp, esp
  100287A3:  51                              push     ecx
  100287A4:  a1 94 c5 08 10                  mov      eax, dword ptr [0x1008c594]
  100287A9:  53                              push     ebx
  100287AA:  56                              push     esi
  100287AB:  57                              push     edi
  100287AC:  85 c0                           test     eax, eax
  100287AE:  0f 84 42 01 00 00               je       0x100288f6
  100287B4:  83 38 01                        cmp      dword ptr [eax], 1
  100287B7:  0f 85 39 01 00 00               jne      0x100288f6
  100287BD:  e8 3e 19 ff ff                  call     0x1001a100  ; GameThread::IsInGameThread, IsInGameThread
  100287C2:  84 c0                           test     al, al
  100287C4:  75 2d                           jne      0x100287f3
  100287C6:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  100287C9:  8b 55 0c                        mov      edx, dword ptr [ebp + 0xc]
  100287CC:  6a 00                           push     0
  100287CE:  83 ec 28                        sub      esp, 0x28
  100287D1:  8b c4                           mov      eax, esp
  100287D3:  c7 00 14 46 05 10               mov      dword ptr [eax], 0x10054614
  100287D9:  89 48 04                        mov      dword ptr [eax + 4], ecx
  100287DC:  89 50 08                        mov      dword ptr [eax + 8], edx
  100287DF:  89 40 24                        mov      dword ptr [eax + 0x24], eax
  100287E2:  e8 59 18 ff ff                  call     0x1001a040  ; GameThread::Enqueue
  100287E7:  83 c4 2c                        add      esp, 0x2c
  100287EA:  b0 01                           mov      al, 1
  100287EC:  5f                              pop      edi
  100287ED:  5e                              pop      esi
  100287EE:  5b                              pop      ebx
  100287EF:  8b e5                           mov      esp, ebp
  100287F1:  5d                              pop      ebp
  100287F2:  c3                              ret      
  100287F3:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  100287F6:  8b 15 a4 a2 08 10               mov      edx, dword ptr [0x1008a2a4]
  100287FC:  8d 46 f6                        lea      eax, [esi - 0xa]
  100287FF:  83 f8 1d                        cmp      eax, 0x1d
  10028802:  77 61                           ja       0x10028865
  10028804:  0f b6 80 4c 8b 02 10            movzx    eax, byte ptr [eax + 0x10028b4c]
  1002880B:  ff 24 85 30 8b 02 10            jmp      dword ptr [eax*4 + 0x10028b30]
  10028812:  a1 a0 a2 08 10                  mov      eax, dword ptr [0x1008a2a0]
  10028817:  b9 54 44 05 10                  mov      ecx, 0x10054454
  1002881C:  eb 2d                           jmp      0x1002884b
  1002881E:  a1 a0 a2 08 10                  mov      eax, dword ptr [0x1008a2a0]
  10028823:  b9 78 44 05 10                  mov      ecx, 0x10054478
  10028828:  eb 21                           jmp      0x1002884b
  1002882A:  a1 a0 a2 08 10                  mov      eax, dword ptr [0x1008a2a0]
  1002882F:  b9 a8 44 05 10                  mov      ecx, 0x100544a8
  10028834:  eb 15                           jmp      0x1002884b
  10028836:  b9 c4 44 05 10                  mov      ecx, 0x100544c4
  1002883B:  eb 0c                           jmp      0x10028849
  1002883D:  b9 e4 44 05 10                  mov      ecx, 0x100544e4
  10028842:  eb 05                           jmp      0x10028849
  10028844:  b9 fc 44 05 10                  mov      ecx, 0x100544fc
  10028849:  8b c2                           mov      eax, edx
  1002884B:  85 c0                           test     eax, eax
  1002884D:  74 16                           je       0x10028865
  1002884F:  6a 00                           push     0
  10028851:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028854:  51                              push     ecx
  10028855:  50                              push     eax
  10028856:  e8 65 fb ff ff                  call     0x100283c0
  1002885B:  83 c4 10                        add      esp, 0x10
  1002885E:  5f                              pop      edi
  1002885F:  5e                              pop      esi
  10028860:  5b                              pop      ebx
  10028861:  8b e5                           mov      esp, ebp
  10028863:  5d                              pop      ebp
  10028864:  c3                              ret      
  10028865:  83 fe 08                        cmp      esi, 8
  10028868:  0f 85 e0 00 00 00               jne      0x1002894e
  1002886E:  85 d2                           test     edx, edx
  10028870:  0f 84 d8 00 00 00               je       0x1002894e
  10028876:  8d 45 fc                        lea      eax, [ebp - 4]
  10028879:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10028880:  50                              push     eax
  10028881:  52                              push     edx
  10028882:  e8 29 f5 ff ff                  call     0x10027db0
  10028887:  83 c4 08                        add      esp, 8
  1002888A:  85 c0                           test     eax, eax
  1002888C:  74 4c                           je       0x100288da
  1002888E:  83 3d 64 c5 08 10 00            cmp      dword ptr [0x1008c564], 0
  10028895:  74 43                           je       0x100288da
  10028897:  6a ff                           push     -1
  10028899:  68 c0 45 05 10                  push     0x100545c0
  1002889E:  e8 ad 20 ff ff                  call     0x1001a950  ; GW::HashWString
  100288A3:  8b f0                           mov      esi, eax
  100288A5:  83 c4 08                        add      esp, 8
  100288A8:  a1 64 c5 08 10                  mov      eax, dword ptr [0x1008c564]
  100288AD:  8b 08                           mov      ecx, dword ptr [eax]
  100288AF:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  100288B2:  8d 14 81                        lea      edx, [ecx + eax*4]
  100288B5:  3b ca                           cmp      ecx, edx
  100288B7:  74 21                           je       0x100288da
  100288B9:  0f 1f 80 00 00 00 00            nop      dword ptr [eax]
  100288C0:  8b 01                           mov      eax, dword ptr [ecx]
  100288C2:  85 c0                           test     eax, eax
  100288C4:  74 0d                           je       0x100288d3
  100288C6:  83 f8 ff                        cmp      eax, -1
  100288C9:  74 08                           je       0x100288d3
  100288CB:  39 b0 34 01 00 00               cmp      dword ptr [eax + 0x134], esi
  100288D1:  74 2c                           je       0x100288ff
  100288D3:  83 c1 04                        add      ecx, 4
  100288D6:  3b ca                           cmp      ecx, edx
  100288D8:  75 e6                           jne      0x100288c0
  100288DA:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  100288DD:  85 c0                           test     eax, eax
  100288DF:  74 15                           je       0x100288f6
  100288E1:  8b 0d 48 c5 08 10               mov      ecx, dword ptr [0x1008c548]
  100288E7:  85 c9                           test     ecx, ecx
  100288E9:  74 0b                           je       0x100288f6
  100288EB:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  100288F1:  ff d1                           call     ecx
  100288F3:  83 c4 04                        add      esp, 4
  100288F6:  32 c0                           xor      al, al
  100288F8:  5f                              pop      edi
  100288F9:  5e                              pop      esi
  100288FA:  5b                              pop      ebx
  100288FB:  8b e5                           mov      esp, ebp
  100288FD:  5d                              pop      ebp
  100288FE:  c3                              ret      
  100288FF:  8d 48 fc                        lea      ecx, [eax - 4]
  10028902:  85 c9                           test     ecx, ecx
  10028904:  74 d4                           je       0x100288da
  10028906:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028909:  e8 82 f1 fe ff                  call     0x10017a90  ; SliderFrame::SetValue
  1002890E:  84 c0                           test     al, al
  10028910:  74 c8                           je       0x100288da
  10028912:  8b 75 fc                        mov      esi, dword ptr [ebp - 4]
  10028915:  a1 48 c5 08 10                  mov      eax, dword ptr [0x1008c548]
  1002891A:  85 f6                           test     esi, esi
  1002891C:  74 27                           je       0x10028945
  1002891E:  85 c0                           test     eax, eax
  10028920:  74 10                           je       0x10028932
  10028922:  ff b6 bc 00 00 00               push     dword ptr [esi + 0xbc]
  10028928:  ff d0                           call     eax
  1002892A:  a1 48 c5 08 10                  mov      eax, dword ptr [0x1008c548]
  1002892F:  83 c4 04                        add      esp, 4
  10028932:  85 f6                           test     esi, esi
  10028934:  74 0f                           je       0x10028945
  10028936:  85 c0                           test     eax, eax
  10028938:  74 0b                           je       0x10028945
  1002893A:  ff b6 bc 00 00 00               push     dword ptr [esi + 0xbc]
  10028940:  ff d0                           call     eax
  10028942:  83 c4 04                        add      esp, 4
  10028945:  b0 01                           mov      al, 1
  10028947:  5f                              pop      edi
  10028948:  5e                              pop      esi
  10028949:  5b                              pop      ebx
  1002894A:  8b e5                           mov      esp, ebp
  1002894C:  5d                              pop      ebp
  1002894D:  c3                              ret      
  1002894E:  8d 46 ed                        lea      eax, [esi - 0x13]
  10028951:  83 f8 13                        cmp      eax, 0x13
  10028954:  0f 87 54 01 00 00               ja       0x10028aae
  1002895A:  0f b6 80 8c 8b 02 10            movzx    eax, byte ptr [eax + 0x10028b8c]
  10028961:  ff 24 85 6c 8b 02 10            jmp      dword ptr [eax*4 + 0x10028b6c]
  10028968:  bb 02 00 00 00                  mov      ebx, 2
  1002896D:  eb 28                           jmp      0x10028997
  1002896F:  bb 04 00 00 00                  mov      ebx, 4
  10028974:  eb 21                           jmp      0x10028997
  10028976:  bb 06 00 00 00                  mov      ebx, 6
  1002897B:  eb 1a                           jmp      0x10028997
  1002897D:  bb 08 00 00 00                  mov      ebx, 8
  10028982:  eb 13                           jmp      0x10028997
  10028984:  bb 0a 00 00 00                  mov      ebx, 0xa
  10028989:  eb 0c                           jmp      0x10028997
  1002898B:  bb 0c 00 00 00                  mov      ebx, 0xc
  10028990:  eb 05                           jmp      0x10028997
  10028992:  bb 11 00 00 00                  mov      ebx, 0x11
  10028997:  8b 3d a8 a2 08 10               mov      edi, dword ptr [0x1008a2a8]
  1002899D:  85 ff                           test     edi, edi
  1002899F:  0f 84 09 01 00 00               je       0x10028aae
  100289A5:  8d 45 fc                        lea      eax, [ebp - 4]
  100289A8:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  100289AF:  50                              push     eax
  100289B0:  57                              push     edi
  100289B1:  e8 fa f3 ff ff                  call     0x10027db0
  100289B6:  83 c4 08                        add      esp, 8
  100289B9:  85 c0                           test     eax, eax
  100289BB:  0f 84 19 ff ff ff               je       0x100288da
  100289C1:  57                              push     edi
  100289C2:  8b c8                           mov      ecx, eax
  100289C4:  e8 07 e8 fe ff                  call     0x100171d0  ; TabsFrame::GetTabByLabel
  100289C9:  8b 0d 34 c5 08 10               mov      ecx, dword ptr [0x1008c534]
  100289CF:  85 c9                           test     ecx, ecx
  100289D1:  74 1f                           je       0x100289f2
  100289D3:  85 c0                           test     eax, eax
  100289D5:  74 1b                           je       0x100289f2
  100289D7:  6a 00                           push     0
  100289D9:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  100289DF:  ff d1                           call     ecx
  100289E1:  50                              push     eax
  100289E2:  e8 29 dd ff ff                  call     0x10026710  ; UI::GetFrameById
  100289E7:  8b 0d 34 c5 08 10               mov      ecx, dword ptr [0x1008c534]
  100289ED:  83 c4 0c                        add      esp, 0xc
  100289F0:  eb 02                           jmp      0x100289f4
  100289F2:  33 c0                           xor      eax, eax
  100289F4:  85 c9                           test     ecx, ecx
  100289F6:  74 1f                           je       0x10028a17
  100289F8:  85 c0                           test     eax, eax
  100289FA:  74 1b                           je       0x10028a17
  100289FC:  6a 00                           push     0
  100289FE:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  10028A04:  ff d1                           call     ecx
  10028A06:  50                              push     eax
  10028A07:  e8 04 dd ff ff                  call     0x10026710  ; UI::GetFrameById
  10028A0C:  8b 0d 34 c5 08 10               mov      ecx, dword ptr [0x1008c534]
  10028A12:  83 c4 0c                        add      esp, 0xc
  10028A15:  eb 02                           jmp      0x10028a19
  10028A17:  33 c0                           xor      eax, eax
  10028A19:  85 c9                           test     ecx, ecx
  10028A1B:  74 1f                           je       0x10028a3c
  10028A1D:  85 c0                           test     eax, eax
  10028A1F:  74 1b                           je       0x10028a3c
  10028A21:  6a 00                           push     0
  10028A23:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  10028A29:  ff d1                           call     ecx
  10028A2B:  50                              push     eax
  10028A2C:  e8 df dc ff ff                  call     0x10026710  ; UI::GetFrameById
  10028A31:  8b 0d 34 c5 08 10               mov      ecx, dword ptr [0x1008c534]
  10028A37:  83 c4 0c                        add      esp, 0xc
  10028A3A:  eb 02                           jmp      0x10028a3e
  10028A3C:  33 c0                           xor      eax, eax
  10028A3E:  85 c9                           test     ecx, ecx
  10028A40:  0f 84 94 fe ff ff               je       0x100288da
  10028A46:  85 c0                           test     eax, eax
  10028A48:  0f 84 8c fe ff ff               je       0x100288da
  10028A4E:  53                              push     ebx
  10028A4F:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  10028A55:  ff d1                           call     ecx
  10028A57:  50                              push     eax
  10028A58:  e8 b3 dc ff ff                  call     0x10026710  ; UI::GetFrameById
  10028A5D:  83 c4 0c                        add      esp, 0xc
  10028A60:  8d 48 fc                        lea      ecx, [eax - 4]
  10028A63:  f7 d8                           neg      eax
  10028A65:  1b c0                           sbb      eax, eax
  10028A67:  23 c1                           and      eax, ecx
  10028A69:  0f 84 6b fe ff ff               je       0x100288da
  10028A6F:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028A72:  8b c8                           mov      ecx, eax
  10028A74:  e8 17 f0 fe ff                  call     0x10017a90  ; SliderFrame::SetValue
  10028A79:  84 c0                           test     al, al
  10028A7B:  0f 84 59 fe ff ff               je       0x100288da
  10028A81:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  10028A84:  85 c0                           test     eax, eax
  10028A86:  0f 84 b9 fe ff ff               je       0x10028945
  10028A8C:  8b 0d 48 c5 08 10               mov      ecx, dword ptr [0x1008c548]
  10028A92:  85 c9                           test     ecx, ecx
  10028A94:  0f 84 ab fe ff ff               je       0x10028945
  10028A9A:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  10028AA0:  ff d1                           call     ecx
  10028AA2:  83 c4 04                        add      esp, 4
  10028AA5:  b0 01                           mov      al, 1
  10028AA7:  5f                              pop      edi
  10028AA8:  5e                              pop      esi
  10028AA9:  5b                              pop      ebx
  10028AAA:  8b e5                           mov      esp, ebp
  10028AAC:  5d                              pop      ebp
  10028AAD:  c3                              ret      
  10028AAE:  8b 0d 70 c5 08 10               mov      ecx, dword ptr [0x1008c570]
  10028AB4:  85 c9                           test     ecx, ecx
  10028AB6:  74 30                           je       0x10028ae8
  10028AB8:  a1 94 c5 08 10                  mov      eax, dword ptr [0x1008c594]
  10028ABD:  85 c0                           test     eax, eax
  10028ABF:  74 27                           je       0x10028ae8
  10028AC1:  83 38 01                        cmp      dword ptr [eax], 1
  10028AC4:  75 22                           jne      0x10028ae8
  10028AC6:  83 fe 2b                        cmp      esi, 0x2b
  10028AC9:  73 1d                           jae      0x10028ae8
  10028ACB:  8d 04 76                        lea      eax, [esi + esi*2]
  10028ACE:  f6 44 c1 04 01                  test     byte ptr [ecx + eax*8 + 4], 1
  10028AD3:  74 13                           je       0x10028ae8
  10028AD5:  8b 44 c1 10                     mov      eax, dword ptr [ecx + eax*8 + 0x10]
  10028AD9:  85 c0                           test     eax, eax
  10028ADB:  74 0b                           je       0x10028ae8
  10028ADD:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028AE0:  56                              push     esi
  10028AE1:  ff d0                           call     eax
  10028AE3:  83 c4 08                        add      esp, 8
  10028AE6:  eb 03                           jmp      0x10028aeb
  10028AE8:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10028AEB:  8b 0d b8 c5 08 10               mov      ecx, dword ptr [0x1008c5b8]
  10028AF1:  85 c9                           test     ecx, ecx
  10028AF3:  0f 84 fd fd ff ff               je       0x100288f6
  10028AF9:  83 fe 2b                        cmp      esi, 0x2b
  10028AFC:  0f 83 f4 fd ff ff               jae      0x100288f6
  10028B02:  50                              push     eax
  10028B03:  56                              push     esi
  10028B04:  ff d1                           call     ecx
  10028B06:  83 c4 08                        add      esp, 8
  10028B09:  6a 00                           push     0
  10028B0B:  83 ec 28                        sub      esp, 0x28
  10028B0E:  8b c4                           mov      eax, esp
  10028B10:  c7 00 30 46 05 10               mov      dword ptr [eax], 0x10054630
  10028B16:  89 70 04                        mov      dword ptr [eax + 4], esi
  10028B19:  89 40 24                        mov      dword ptr [eax + 0x24], eax
  10028B1C:  e8 1f 15 ff ff                  call     0x1001a040  ; GameThread::Enqueue
  10028B21:  83 c4 2c                        add      esp, 0x2c
  10028B24:  b0 01                           mov      al, 1
  10028B26:  5f                              pop      edi
  10028B27:  5e                              pop      esi
  10028B28:  5b                              pop      ebx
  10028B29:  8b e5                           mov      esp, ebp
  10028B2B:  5d                              pop      ebp
  10028B2C:  c3                              ret      
  10028B2D:  0f 1f 00                        nop      dword ptr [eax]
  10028B30:  12 88 02 10 1e 88               adc      cl, byte ptr [eax - 0x77e1effe]
  10028B36:  02 10                           add      dl, byte ptr [eax]
  10028B38:  3d 88 02 10 44                  cmp      eax, 0x44100288
  10028B3D:  88 02                           mov      byte ptr [edx], al
  10028B3F:  10 36                           adc      byte ptr [esi], dh
  10028B41:  88 02                           mov      byte ptr [edx], al
  10028B43:  10 2a                           adc      byte ptr [edx], ch
  10028B45:  88 02                           mov      byte ptr [edx], al
  10028B47:  10 65 88                        adc      byte ptr [ebp - 0x78], ah
  10028B4A:  02 10                           add      dl, byte ptr [eax]
  10028B4C:  00 01                           add      byte ptr [ecx], al
  10028B4E:  06                              push     es
  10028B4F:  02 06                           add      al, byte ptr [esi]
  10028B51:  06                              push     es
  10028B52:  06                              push     es
  10028B53:  06                              push     es
  10028B54:  06                              push     es
  10028B55:  06                              push     es
  10028B56:  06                              push     es
  10028B57:  03 06                           add      eax, dword ptr [esi]
  10028B59:  06                              push     es
  10028B5A:  06                              push     es
  10028B5B:  06                              push     es
  10028B5C:  06                              push     es
  10028B5D:  06                              push     es
  10028B5E:  06                              push     es
  10028B5F:  06                              push     es
  10028B60:  06                              push     es
  10028B61:  06                              push     es
  10028B62:  06                              push     es
  10028B63:  06                              push     es
  10028B64:  06                              push     es
  10028B65:  06                              push     es
  10028B66:  06                              push     es
  10028B67:  04 06                           add      al, 6
  10028B69:  05 66 90 92 89                  add      eax, 0x89929066
  10028B6E:  02 10                           add      dl, byte ptr [eax]
  10028B70:  76 89                           jbe      0x10028afb
  10028B72:  02 10                           add      dl, byte ptr [eax]
  10028B74:  84 89 02 10 7d 89               test     byte ptr [ecx - 0x7682effe], cl
  10028B7A:  02 10                           add      dl, byte ptr [eax]
  10028B7C:  6f                              outsd    dx, dword ptr [esi]
  10028B7D:  89 02                           mov      dword ptr [edx], eax
  10028B7F:  10 8b 89 02 10 68               adc      byte ptr [ebx + 0x68100289], cl
  10028B85:  89 02                           mov      dword ptr [edx], eax
  10028B87:  10 ae 8a 02 10 00               adc      byte ptr [esi + 0x10028a], ch
  10028B8D:  07                              pop      es
  10028B8E:  07                              pop      es
  10028B8F:  07                              pop      es
  10028B90:  01 02                           add      dword ptr [edx], eax
  10028B92:  03 04 05 07 07 07 07            add      eax, dword ptr [eax + 0x7070707]
  10028B99:  07                              pop      es
  10028B9A:  07                              pop      es
  10028B9B:  07                              pop      es
  10028B9C:  07                              pop      es
  10028B9D:  07                              pop      es
  10028B9E:  07                              pop      es
  10028B9F:  06                              push     es
  10028BA0:  55                              push     ebp
  10028BA1:  8b ec                           mov      ebp, esp
  10028BA3:  51                              push     ecx
  10028BA4:  83 3d a8 c5 08 10 00            cmp      dword ptr [0x1008c5a8], 0
  10028BAB:  56                              push     esi
  10028BAC:  74 5b                           je       0x10028c09
  10028BAE:  a1 94 c5 08 10                  mov      eax, dword ptr [0x1008c594]
  10028BB3:  85 c0                           test     eax, eax
  10028BB5:  74 52                           je       0x10028c09
  10028BB7:  83 38 01                        cmp      dword ptr [eax], 1
  10028BBA:  75 4d                           jne      0x10028c09
  10028BBC:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10028BBF:  83 fe 03                        cmp      esi, 3
  10028BC2:  73 45                           jae      0x10028c09
  10028BC4:  e8 37 15 ff ff                  call     0x1001a100  ; GameThread::IsInGameThread, IsInGameThread
  10028BC9:  84 c0                           test     al, al
  10028BCB:  75 28                           jne      0x10028bf5
  10028BCD:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  10028BD0:  6a 00                           push     0
  10028BD2:  83 ec 28                        sub      esp, 0x28
  10028BD5:  8b c4                           mov      eax, esp
  10028BD7:  c7 00 4c 46 05 10               mov      dword ptr [eax], 0x1005464c
  10028BDD:  89 70 04                        mov      dword ptr [eax + 4], esi
  10028BE0:  89 48 08                        mov      dword ptr [eax + 8], ecx
  10028BE3:  89 40 24                        mov      dword ptr [eax + 0x24], eax
  10028BE6:  e8 55 14 ff ff                  call     0x1001a040  ; GameThread::Enqueue
  10028BEB:  83 c4 2c                        add      esp, 0x2c
  10028BEE:  b0 01                           mov      al, 1
  10028BF0:  5e                              pop      esi
  10028BF1:  8b e5                           mov      esp, ebp
  10028BF3:  5d                              pop      ebp
  10028BF4:  c3                              ret      
  10028BF5:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028BF8:  56                              push     esi
  10028BF9:  ff 15 a8 c5 08 10               call     dword ptr [0x1008c5a8]
  10028BFF:  83 c4 08                        add      esp, 8
  10028C02:  b0 01                           mov      al, 1
  10028C04:  5e                              pop      esi
  10028C05:  8b e5                           mov      esp, ebp
  10028C07:  5d                              pop      ebp
  10028C08:  c3                              ret      
  10028C09:  32 c0                           xor      al, al
  10028C0B:  5e                              pop      esi
  10028C0C:  8b e5                           mov      esp, ebp
  10028C0E:  5d                              pop      ebp
  10028C0F:  c3                              ret      


; === UI::SetPreference ===
; RVA: 0x000287A0  Size: 1136 bytes
; Exports: ?SetPreference@UI@GW@@YA_NW4NumberPreference@12@I@Z
;
  100287A0:  55                              push     ebp
  100287A1:  8b ec                           mov      ebp, esp
  100287A3:  51                              push     ecx
  100287A4:  a1 94 c5 08 10                  mov      eax, dword ptr [0x1008c594]
  100287A9:  53                              push     ebx
  100287AA:  56                              push     esi
  100287AB:  57                              push     edi
  100287AC:  85 c0                           test     eax, eax
  100287AE:  0f 84 42 01 00 00               je       0x100288f6
  100287B4:  83 38 01                        cmp      dword ptr [eax], 1
  100287B7:  0f 85 39 01 00 00               jne      0x100288f6
  100287BD:  e8 3e 19 ff ff                  call     0x1001a100  ; GameThread::IsInGameThread, IsInGameThread
  100287C2:  84 c0                           test     al, al
  100287C4:  75 2d                           jne      0x100287f3
  100287C6:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  100287C9:  8b 55 0c                        mov      edx, dword ptr [ebp + 0xc]
  100287CC:  6a 00                           push     0
  100287CE:  83 ec 28                        sub      esp, 0x28
  100287D1:  8b c4                           mov      eax, esp
  100287D3:  c7 00 14 46 05 10               mov      dword ptr [eax], 0x10054614
  100287D9:  89 48 04                        mov      dword ptr [eax + 4], ecx
  100287DC:  89 50 08                        mov      dword ptr [eax + 8], edx
  100287DF:  89 40 24                        mov      dword ptr [eax + 0x24], eax
  100287E2:  e8 59 18 ff ff                  call     0x1001a040  ; GameThread::Enqueue
  100287E7:  83 c4 2c                        add      esp, 0x2c
  100287EA:  b0 01                           mov      al, 1
  100287EC:  5f                              pop      edi
  100287ED:  5e                              pop      esi
  100287EE:  5b                              pop      ebx
  100287EF:  8b e5                           mov      esp, ebp
  100287F1:  5d                              pop      ebp
  100287F2:  c3                              ret      
  100287F3:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  100287F6:  8b 15 a4 a2 08 10               mov      edx, dword ptr [0x1008a2a4]
  100287FC:  8d 46 f6                        lea      eax, [esi - 0xa]
  100287FF:  83 f8 1d                        cmp      eax, 0x1d
  10028802:  77 61                           ja       0x10028865
  10028804:  0f b6 80 4c 8b 02 10            movzx    eax, byte ptr [eax + 0x10028b4c]
  1002880B:  ff 24 85 30 8b 02 10            jmp      dword ptr [eax*4 + 0x10028b30]
  10028812:  a1 a0 a2 08 10                  mov      eax, dword ptr [0x1008a2a0]
  10028817:  b9 54 44 05 10                  mov      ecx, 0x10054454
  1002881C:  eb 2d                           jmp      0x1002884b
  1002881E:  a1 a0 a2 08 10                  mov      eax, dword ptr [0x1008a2a0]
  10028823:  b9 78 44 05 10                  mov      ecx, 0x10054478
  10028828:  eb 21                           jmp      0x1002884b
  1002882A:  a1 a0 a2 08 10                  mov      eax, dword ptr [0x1008a2a0]
  1002882F:  b9 a8 44 05 10                  mov      ecx, 0x100544a8
  10028834:  eb 15                           jmp      0x1002884b
  10028836:  b9 c4 44 05 10                  mov      ecx, 0x100544c4
  1002883B:  eb 0c                           jmp      0x10028849
  1002883D:  b9 e4 44 05 10                  mov      ecx, 0x100544e4
  10028842:  eb 05                           jmp      0x10028849
  10028844:  b9 fc 44 05 10                  mov      ecx, 0x100544fc
  10028849:  8b c2                           mov      eax, edx
  1002884B:  85 c0                           test     eax, eax
  1002884D:  74 16                           je       0x10028865
  1002884F:  6a 00                           push     0
  10028851:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028854:  51                              push     ecx
  10028855:  50                              push     eax
  10028856:  e8 65 fb ff ff                  call     0x100283c0
  1002885B:  83 c4 10                        add      esp, 0x10
  1002885E:  5f                              pop      edi
  1002885F:  5e                              pop      esi
  10028860:  5b                              pop      ebx
  10028861:  8b e5                           mov      esp, ebp
  10028863:  5d                              pop      ebp
  10028864:  c3                              ret      
  10028865:  83 fe 08                        cmp      esi, 8
  10028868:  0f 85 e0 00 00 00               jne      0x1002894e
  1002886E:  85 d2                           test     edx, edx
  10028870:  0f 84 d8 00 00 00               je       0x1002894e
  10028876:  8d 45 fc                        lea      eax, [ebp - 4]
  10028879:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10028880:  50                              push     eax
  10028881:  52                              push     edx
  10028882:  e8 29 f5 ff ff                  call     0x10027db0
  10028887:  83 c4 08                        add      esp, 8
  1002888A:  85 c0                           test     eax, eax
  1002888C:  74 4c                           je       0x100288da
  1002888E:  83 3d 64 c5 08 10 00            cmp      dword ptr [0x1008c564], 0
  10028895:  74 43                           je       0x100288da
  10028897:  6a ff                           push     -1
  10028899:  68 c0 45 05 10                  push     0x100545c0
  1002889E:  e8 ad 20 ff ff                  call     0x1001a950  ; GW::HashWString
  100288A3:  8b f0                           mov      esi, eax
  100288A5:  83 c4 08                        add      esp, 8
  100288A8:  a1 64 c5 08 10                  mov      eax, dword ptr [0x1008c564]
  100288AD:  8b 08                           mov      ecx, dword ptr [eax]
  100288AF:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  100288B2:  8d 14 81                        lea      edx, [ecx + eax*4]
  100288B5:  3b ca                           cmp      ecx, edx
  100288B7:  74 21                           je       0x100288da
  100288B9:  0f 1f 80 00 00 00 00            nop      dword ptr [eax]
  100288C0:  8b 01                           mov      eax, dword ptr [ecx]
  100288C2:  85 c0                           test     eax, eax
  100288C4:  74 0d                           je       0x100288d3
  100288C6:  83 f8 ff                        cmp      eax, -1
  100288C9:  74 08                           je       0x100288d3
  100288CB:  39 b0 34 01 00 00               cmp      dword ptr [eax + 0x134], esi
  100288D1:  74 2c                           je       0x100288ff
  100288D3:  83 c1 04                        add      ecx, 4
  100288D6:  3b ca                           cmp      ecx, edx
  100288D8:  75 e6                           jne      0x100288c0
  100288DA:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  100288DD:  85 c0                           test     eax, eax
  100288DF:  74 15                           je       0x100288f6
  100288E1:  8b 0d 48 c5 08 10               mov      ecx, dword ptr [0x1008c548]
  100288E7:  85 c9                           test     ecx, ecx
  100288E9:  74 0b                           je       0x100288f6
  100288EB:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  100288F1:  ff d1                           call     ecx
  100288F3:  83 c4 04                        add      esp, 4
  100288F6:  32 c0                           xor      al, al
  100288F8:  5f                              pop      edi
  100288F9:  5e                              pop      esi
  100288FA:  5b                              pop      ebx
  100288FB:  8b e5                           mov      esp, ebp
  100288FD:  5d                              pop      ebp
  100288FE:  c3                              ret      
  100288FF:  8d 48 fc                        lea      ecx, [eax - 4]
  10028902:  85 c9                           test     ecx, ecx
  10028904:  74 d4                           je       0x100288da
  10028906:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028909:  e8 82 f1 fe ff                  call     0x10017a90  ; SliderFrame::SetValue
  1002890E:  84 c0                           test     al, al
  10028910:  74 c8                           je       0x100288da
  10028912:  8b 75 fc                        mov      esi, dword ptr [ebp - 4]
  10028915:  a1 48 c5 08 10                  mov      eax, dword ptr [0x1008c548]
  1002891A:  85 f6                           test     esi, esi
  1002891C:  74 27                           je       0x10028945
  1002891E:  85 c0                           test     eax, eax
  10028920:  74 10                           je       0x10028932
  10028922:  ff b6 bc 00 00 00               push     dword ptr [esi + 0xbc]
  10028928:  ff d0                           call     eax
  1002892A:  a1 48 c5 08 10                  mov      eax, dword ptr [0x1008c548]
  1002892F:  83 c4 04                        add      esp, 4
  10028932:  85 f6                           test     esi, esi
  10028934:  74 0f                           je       0x10028945
  10028936:  85 c0                           test     eax, eax
  10028938:  74 0b                           je       0x10028945
  1002893A:  ff b6 bc 00 00 00               push     dword ptr [esi + 0xbc]
  10028940:  ff d0                           call     eax
  10028942:  83 c4 04                        add      esp, 4
  10028945:  b0 01                           mov      al, 1
  10028947:  5f                              pop      edi
  10028948:  5e                              pop      esi
  10028949:  5b                              pop      ebx
  1002894A:  8b e5                           mov      esp, ebp
  1002894C:  5d                              pop      ebp
  1002894D:  c3                              ret      
  1002894E:  8d 46 ed                        lea      eax, [esi - 0x13]
  10028951:  83 f8 13                        cmp      eax, 0x13
  10028954:  0f 87 54 01 00 00               ja       0x10028aae
  1002895A:  0f b6 80 8c 8b 02 10            movzx    eax, byte ptr [eax + 0x10028b8c]
  10028961:  ff 24 85 6c 8b 02 10            jmp      dword ptr [eax*4 + 0x10028b6c]
  10028968:  bb 02 00 00 00                  mov      ebx, 2
  1002896D:  eb 28                           jmp      0x10028997
  1002896F:  bb 04 00 00 00                  mov      ebx, 4
  10028974:  eb 21                           jmp      0x10028997
  10028976:  bb 06 00 00 00                  mov      ebx, 6
  1002897B:  eb 1a                           jmp      0x10028997
  1002897D:  bb 08 00 00 00                  mov      ebx, 8
  10028982:  eb 13                           jmp      0x10028997
  10028984:  bb 0a 00 00 00                  mov      ebx, 0xa
  10028989:  eb 0c                           jmp      0x10028997
  1002898B:  bb 0c 00 00 00                  mov      ebx, 0xc
  10028990:  eb 05                           jmp      0x10028997
  10028992:  bb 11 00 00 00                  mov      ebx, 0x11
  10028997:  8b 3d a8 a2 08 10               mov      edi, dword ptr [0x1008a2a8]
  1002899D:  85 ff                           test     edi, edi
  1002899F:  0f 84 09 01 00 00               je       0x10028aae
  100289A5:  8d 45 fc                        lea      eax, [ebp - 4]
  100289A8:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  100289AF:  50                              push     eax
  100289B0:  57                              push     edi
  100289B1:  e8 fa f3 ff ff                  call     0x10027db0
  100289B6:  83 c4 08                        add      esp, 8
  100289B9:  85 c0                           test     eax, eax
  100289BB:  0f 84 19 ff ff ff               je       0x100288da
  100289C1:  57                              push     edi
  100289C2:  8b c8                           mov      ecx, eax
  100289C4:  e8 07 e8 fe ff                  call     0x100171d0  ; TabsFrame::GetTabByLabel
  100289C9:  8b 0d 34 c5 08 10               mov      ecx, dword ptr [0x1008c534]
  100289CF:  85 c9                           test     ecx, ecx
  100289D1:  74 1f                           je       0x100289f2
  100289D3:  85 c0                           test     eax, eax
  100289D5:  74 1b                           je       0x100289f2
  100289D7:  6a 00                           push     0
  100289D9:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  100289DF:  ff d1                           call     ecx
  100289E1:  50                              push     eax
  100289E2:  e8 29 dd ff ff                  call     0x10026710  ; UI::GetFrameById
  100289E7:  8b 0d 34 c5 08 10               mov      ecx, dword ptr [0x1008c534]
  100289ED:  83 c4 0c                        add      esp, 0xc
  100289F0:  eb 02                           jmp      0x100289f4
  100289F2:  33 c0                           xor      eax, eax
  100289F4:  85 c9                           test     ecx, ecx
  100289F6:  74 1f                           je       0x10028a17
  100289F8:  85 c0                           test     eax, eax
  100289FA:  74 1b                           je       0x10028a17
  100289FC:  6a 00                           push     0
  100289FE:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  10028A04:  ff d1                           call     ecx
  10028A06:  50                              push     eax
  10028A07:  e8 04 dd ff ff                  call     0x10026710  ; UI::GetFrameById
  10028A0C:  8b 0d 34 c5 08 10               mov      ecx, dword ptr [0x1008c534]
  10028A12:  83 c4 0c                        add      esp, 0xc
  10028A15:  eb 02                           jmp      0x10028a19
  10028A17:  33 c0                           xor      eax, eax
  10028A19:  85 c9                           test     ecx, ecx
  10028A1B:  74 1f                           je       0x10028a3c
  10028A1D:  85 c0                           test     eax, eax
  10028A1F:  74 1b                           je       0x10028a3c
  10028A21:  6a 00                           push     0
  10028A23:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  10028A29:  ff d1                           call     ecx
  10028A2B:  50                              push     eax
  10028A2C:  e8 df dc ff ff                  call     0x10026710  ; UI::GetFrameById
  10028A31:  8b 0d 34 c5 08 10               mov      ecx, dword ptr [0x1008c534]
  10028A37:  83 c4 0c                        add      esp, 0xc
  10028A3A:  eb 02                           jmp      0x10028a3e
  10028A3C:  33 c0                           xor      eax, eax
  10028A3E:  85 c9                           test     ecx, ecx
  10028A40:  0f 84 94 fe ff ff               je       0x100288da
  10028A46:  85 c0                           test     eax, eax
  10028A48:  0f 84 8c fe ff ff               je       0x100288da
  10028A4E:  53                              push     ebx
  10028A4F:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  10028A55:  ff d1                           call     ecx
  10028A57:  50                              push     eax
  10028A58:  e8 b3 dc ff ff                  call     0x10026710  ; UI::GetFrameById
  10028A5D:  83 c4 0c                        add      esp, 0xc
  10028A60:  8d 48 fc                        lea      ecx, [eax - 4]
  10028A63:  f7 d8                           neg      eax
  10028A65:  1b c0                           sbb      eax, eax
  10028A67:  23 c1                           and      eax, ecx
  10028A69:  0f 84 6b fe ff ff               je       0x100288da
  10028A6F:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028A72:  8b c8                           mov      ecx, eax
  10028A74:  e8 17 f0 fe ff                  call     0x10017a90  ; SliderFrame::SetValue
  10028A79:  84 c0                           test     al, al
  10028A7B:  0f 84 59 fe ff ff               je       0x100288da
  10028A81:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  10028A84:  85 c0                           test     eax, eax
  10028A86:  0f 84 b9 fe ff ff               je       0x10028945
  10028A8C:  8b 0d 48 c5 08 10               mov      ecx, dword ptr [0x1008c548]
  10028A92:  85 c9                           test     ecx, ecx
  10028A94:  0f 84 ab fe ff ff               je       0x10028945
  10028A9A:  ff b0 bc 00 00 00               push     dword ptr [eax + 0xbc]
  10028AA0:  ff d1                           call     ecx
  10028AA2:  83 c4 04                        add      esp, 4
  10028AA5:  b0 01                           mov      al, 1
  10028AA7:  5f                              pop      edi
  10028AA8:  5e                              pop      esi
  10028AA9:  5b                              pop      ebx
  10028AAA:  8b e5                           mov      esp, ebp
  10028AAC:  5d                              pop      ebp
  10028AAD:  c3                              ret      
  10028AAE:  8b 0d 70 c5 08 10               mov      ecx, dword ptr [0x1008c570]
  10028AB4:  85 c9                           test     ecx, ecx
  10028AB6:  74 30                           je       0x10028ae8
  10028AB8:  a1 94 c5 08 10                  mov      eax, dword ptr [0x1008c594]
  10028ABD:  85 c0                           test     eax, eax
  10028ABF:  74 27                           je       0x10028ae8
  10028AC1:  83 38 01                        cmp      dword ptr [eax], 1
  10028AC4:  75 22                           jne      0x10028ae8
  10028AC6:  83 fe 2b                        cmp      esi, 0x2b
  10028AC9:  73 1d                           jae      0x10028ae8
  10028ACB:  8d 04 76                        lea      eax, [esi + esi*2]
  10028ACE:  f6 44 c1 04 01                  test     byte ptr [ecx + eax*8 + 4], 1
  10028AD3:  74 13                           je       0x10028ae8
  10028AD5:  8b 44 c1 10                     mov      eax, dword ptr [ecx + eax*8 + 0x10]
  10028AD9:  85 c0                           test     eax, eax
  10028ADB:  74 0b                           je       0x10028ae8
  10028ADD:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028AE0:  56                              push     esi
  10028AE1:  ff d0                           call     eax
  10028AE3:  83 c4 08                        add      esp, 8
  10028AE6:  eb 03                           jmp      0x10028aeb
  10028AE8:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10028AEB:  8b 0d b8 c5 08 10               mov      ecx, dword ptr [0x1008c5b8]
  10028AF1:  85 c9                           test     ecx, ecx
  10028AF3:  0f 84 fd fd ff ff               je       0x100288f6
  10028AF9:  83 fe 2b                        cmp      esi, 0x2b
  10028AFC:  0f 83 f4 fd ff ff               jae      0x100288f6
  10028B02:  50                              push     eax
  10028B03:  56                              push     esi
  10028B04:  ff d1                           call     ecx
  10028B06:  83 c4 08                        add      esp, 8
  10028B09:  6a 00                           push     0
  10028B0B:  83 ec 28                        sub      esp, 0x28
  10028B0E:  8b c4                           mov      eax, esp
  10028B10:  c7 00 30 46 05 10               mov      dword ptr [eax], 0x10054630
  10028B16:  89 70 04                        mov      dword ptr [eax + 4], esi
  10028B19:  89 40 24                        mov      dword ptr [eax + 0x24], eax
  10028B1C:  e8 1f 15 ff ff                  call     0x1001a040  ; GameThread::Enqueue
  10028B21:  83 c4 2c                        add      esp, 0x2c
  10028B24:  b0 01                           mov      al, 1
  10028B26:  5f                              pop      edi
  10028B27:  5e                              pop      esi
  10028B28:  5b                              pop      ebx
  10028B29:  8b e5                           mov      esp, ebp
  10028B2B:  5d                              pop      ebp
  10028B2C:  c3                              ret      
  10028B2D:  0f 1f 00                        nop      dword ptr [eax]
  10028B30:  12 88 02 10 1e 88               adc      cl, byte ptr [eax - 0x77e1effe]
  10028B36:  02 10                           add      dl, byte ptr [eax]
  10028B38:  3d 88 02 10 44                  cmp      eax, 0x44100288
  10028B3D:  88 02                           mov      byte ptr [edx], al
  10028B3F:  10 36                           adc      byte ptr [esi], dh
  10028B41:  88 02                           mov      byte ptr [edx], al
  10028B43:  10 2a                           adc      byte ptr [edx], ch
  10028B45:  88 02                           mov      byte ptr [edx], al
  10028B47:  10 65 88                        adc      byte ptr [ebp - 0x78], ah
  10028B4A:  02 10                           add      dl, byte ptr [eax]
  10028B4C:  00 01                           add      byte ptr [ecx], al
  10028B4E:  06                              push     es
  10028B4F:  02 06                           add      al, byte ptr [esi]
  10028B51:  06                              push     es
  10028B52:  06                              push     es
  10028B53:  06                              push     es
  10028B54:  06                              push     es
  10028B55:  06                              push     es
  10028B56:  06                              push     es
  10028B57:  03 06                           add      eax, dword ptr [esi]
  10028B59:  06                              push     es
  10028B5A:  06                              push     es
  10028B5B:  06                              push     es
  10028B5C:  06                              push     es
  10028B5D:  06                              push     es
  10028B5E:  06                              push     es
  10028B5F:  06                              push     es
  10028B60:  06                              push     es
  10028B61:  06                              push     es
  10028B62:  06                              push     es
  10028B63:  06                              push     es
  10028B64:  06                              push     es
  10028B65:  06                              push     es
  10028B66:  06                              push     es
  10028B67:  04 06                           add      al, 6
  10028B69:  05 66 90 92 89                  add      eax, 0x89929066
  10028B6E:  02 10                           add      dl, byte ptr [eax]
  10028B70:  76 89                           jbe      0x10028afb
  10028B72:  02 10                           add      dl, byte ptr [eax]
  10028B74:  84 89 02 10 7d 89               test     byte ptr [ecx - 0x7682effe], cl
  10028B7A:  02 10                           add      dl, byte ptr [eax]
  10028B7C:  6f                              outsd    dx, dword ptr [esi]
  10028B7D:  89 02                           mov      dword ptr [edx], eax
  10028B7F:  10 8b 89 02 10 68               adc      byte ptr [ebx + 0x68100289], cl
  10028B85:  89 02                           mov      dword ptr [edx], eax
  10028B87:  10 ae 8a 02 10 00               adc      byte ptr [esi + 0x10028a], ch
  10028B8D:  07                              pop      es
  10028B8E:  07                              pop      es
  10028B8F:  07                              pop      es
  10028B90:  01 02                           add      dword ptr [edx], eax
  10028B92:  03 04 05 07 07 07 07            add      eax, dword ptr [eax + 0x7070707]
  10028B99:  07                              pop      es
  10028B9A:  07                              pop      es
  10028B9B:  07                              pop      es
  10028B9C:  07                              pop      es
  10028B9D:  07                              pop      es
  10028B9E:  07                              pop      es
  10028B9F:  06                              push     es
  10028BA0:  55                              push     ebp
  10028BA1:  8b ec                           mov      ebp, esp
  10028BA3:  51                              push     ecx
  10028BA4:  83 3d a8 c5 08 10 00            cmp      dword ptr [0x1008c5a8], 0
  10028BAB:  56                              push     esi
  10028BAC:  74 5b                           je       0x10028c09
  10028BAE:  a1 94 c5 08 10                  mov      eax, dword ptr [0x1008c594]
  10028BB3:  85 c0                           test     eax, eax
  10028BB5:  74 52                           je       0x10028c09
  10028BB7:  83 38 01                        cmp      dword ptr [eax], 1
  10028BBA:  75 4d                           jne      0x10028c09
  10028BBC:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10028BBF:  83 fe 03                        cmp      esi, 3
  10028BC2:  73 45                           jae      0x10028c09
  10028BC4:  e8 37 15 ff ff                  call     0x1001a100  ; GameThread::IsInGameThread, IsInGameThread
  10028BC9:  84 c0                           test     al, al
  10028BCB:  75 28                           jne      0x10028bf5
  10028BCD:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  10028BD0:  6a 00                           push     0
  10028BD2:  83 ec 28                        sub      esp, 0x28
  10028BD5:  8b c4                           mov      eax, esp
  10028BD7:  c7 00 4c 46 05 10               mov      dword ptr [eax], 0x1005464c
  10028BDD:  89 70 04                        mov      dword ptr [eax + 4], esi
  10028BE0:  89 48 08                        mov      dword ptr [eax + 8], ecx
  10028BE3:  89 40 24                        mov      dword ptr [eax + 0x24], eax
  10028BE6:  e8 55 14 ff ff                  call     0x1001a040  ; GameThread::Enqueue
  10028BEB:  83 c4 2c                        add      esp, 0x2c
  10028BEE:  b0 01                           mov      al, 1
  10028BF0:  5e                              pop      esi
  10028BF1:  8b e5                           mov      esp, ebp
  10028BF3:  5d                              pop      ebp
  10028BF4:  c3                              ret      
  10028BF5:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028BF8:  56                              push     esi
  10028BF9:  ff 15 a8 c5 08 10               call     dword ptr [0x1008c5a8]
  10028BFF:  83 c4 08                        add      esp, 8
  10028C02:  b0 01                           mov      al, 1
  10028C04:  5e                              pop      esi
  10028C05:  8b e5                           mov      esp, ebp
  10028C07:  5d                              pop      ebp
  10028C08:  c3                              ret      
  10028C09:  32 c0                           xor      al, al
  10028C0B:  5e                              pop      esi
  10028C0C:  8b e5                           mov      esp, ebp
  10028C0E:  5d                              pop      ebp
  10028C0F:  c3                              ret      


; === UI::SetPreference ===
; RVA: 0x00028BA0  Size: 112 bytes
; Exports: ?SetPreference@UI@GW@@YA_NW4StringPreference@12@PA_W@Z
;
  10028BA0:  55                              push     ebp
  10028BA1:  8b ec                           mov      ebp, esp
  10028BA3:  51                              push     ecx
  10028BA4:  83 3d a8 c5 08 10 00            cmp      dword ptr [0x1008c5a8], 0
  10028BAB:  56                              push     esi
  10028BAC:  74 5b                           je       0x10028c09
  10028BAE:  a1 94 c5 08 10                  mov      eax, dword ptr [0x1008c594]
  10028BB3:  85 c0                           test     eax, eax
  10028BB5:  74 52                           je       0x10028c09
  10028BB7:  83 38 01                        cmp      dword ptr [eax], 1
  10028BBA:  75 4d                           jne      0x10028c09
  10028BBC:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10028BBF:  83 fe 03                        cmp      esi, 3
  10028BC2:  73 45                           jae      0x10028c09
  10028BC4:  e8 37 15 ff ff                  call     0x1001a100  ; GameThread::IsInGameThread, IsInGameThread
  10028BC9:  84 c0                           test     al, al
  10028BCB:  75 28                           jne      0x10028bf5
  10028BCD:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  10028BD0:  6a 00                           push     0
  10028BD2:  83 ec 28                        sub      esp, 0x28
  10028BD5:  8b c4                           mov      eax, esp
  10028BD7:  c7 00 4c 46 05 10               mov      dword ptr [eax], 0x1005464c
  10028BDD:  89 70 04                        mov      dword ptr [eax + 4], esi
  10028BE0:  89 48 08                        mov      dword ptr [eax + 8], ecx
  10028BE3:  89 40 24                        mov      dword ptr [eax + 0x24], eax
  10028BE6:  e8 55 14 ff ff                  call     0x1001a040  ; GameThread::Enqueue
  10028BEB:  83 c4 2c                        add      esp, 0x2c
  10028BEE:  b0 01                           mov      al, 1
  10028BF0:  5e                              pop      esi
  10028BF1:  8b e5                           mov      esp, ebp
  10028BF3:  5d                              pop      ebp
  10028BF4:  c3                              ret      
  10028BF5:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028BF8:  56                              push     esi
  10028BF9:  ff 15 a8 c5 08 10               call     dword ptr [0x1008c5a8]
  10028BFF:  83 c4 08                        add      esp, 8
  10028C02:  b0 01                           mov      al, 1
  10028C04:  5e                              pop      esi
  10028C05:  8b e5                           mov      esp, ebp
  10028C07:  5d                              pop      ebp
  10028C08:  c3                              ret      
  10028C09:  32 c0                           xor      al, al
  10028C0B:  5e                              pop      esi
  10028C0C:  8b e5                           mov      esp, ebp
  10028C0E:  5d                              pop      ebp
  10028C0F:  c3                              ret      


; === UI::SetWindowPosition, SetWindowPosition ===
; RVA: 0x00028C10  Size: 39 bytes
; Exports: ?SetWindowPosition@UI@GW@@YA_NW4WindowID@12@PAUWindowPosition@12@@Z, SetWindowPosition
;
  10028C10:  55                              push     ebp
  10028C11:  8b ec                           mov      ebp, esp
  10028C13:  a1 4c c5 08 10                  mov      eax, dword ptr [0x1008c54c]
  10028C18:  85 c0                           test     eax, eax
  10028C1A:  74 17                           je       0x10028c33
  10028C1C:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10028C1F:  83 f9 69                        cmp      ecx, 0x69
  10028C22:  73 0f                           jae      0x10028c33
  10028C24:  6a 00                           push     0
  10028C26:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10028C29:  51                              push     ecx
  10028C2A:  ff d0                           call     eax
  10028C2C:  83 c4 0c                        add      esp, 0xc
  10028C2F:  b0 01                           mov      al, 1
  10028C31:  5d                              pop      ebp
  10028C32:  c3                              ret      
  10028C33:  32 c0                           xor      al, al
  10028C35:  5d                              pop      ebp
  10028C36:  c3                              ret      


; === UI::SetWindowVisible ===
; RVA: 0x00028C40  Size: 114 bytes
; Exports: ?SetWindowVisible@UI@GW@@YA_NW4WindowID@12@_N@Z
;
  10028C40:  55                              push     ebp
  10028C41:  8b ec                           mov      ebp, esp
  10028C43:  8b 15 cc c5 08 10               mov      edx, dword ptr [0x1008c5cc]
  10028C49:  83 ec 14                        sub      esp, 0x14
  10028C4C:  85 d2                           test     edx, edx
  10028C4E:  74 5c                           je       0x10028cac
  10028C50:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10028C53:  83 f9 69                        cmp      ecx, 0x69
  10028C56:  73 54                           jae      0x10028cac
  10028C58:  8d 04 89                        lea      eax, [ecx + ecx*4]
  10028C5B:  8d 14 82                        lea      edx, [edx + eax*4]
  10028C5E:  85 d2                           test     edx, edx
  10028C60:  74 4a                           je       0x10028cac
  10028C62:  8a 02                           mov      al, byte ptr [edx]
  10028C64:  53                              push     ebx
  10028C65:  8a 5d 0c                        mov      bl, byte ptr [ebp + 0xc]
  10028C68:  24 01                           and      al, 1
  10028C6A:  3a c3                           cmp      al, bl
  10028C6C:  74 30                           je       0x10028c9e
  10028C6E:  8b 42 10                        mov      eax, dword ptr [edx + 0x10]
  10028C71:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10028C74:  0f 10 02                        movups   xmm0, xmmword ptr [edx]
  10028C77:  0f 11 45 ec                     movups   xmmword ptr [ebp - 0x14], xmm0
  10028C7B:  84 db                           test     bl, bl
  10028C7D:  74 06                           je       0x10028c85
  10028C7F:  83 4d ec 01                     or       dword ptr [ebp - 0x14], 1
  10028C83:  eb 04                           jmp      0x10028c89
  10028C85:  83 65 ec fe                     and      dword ptr [ebp - 0x14], 0xfffffffe
  10028C89:  a1 4c c5 08 10                  mov      eax, dword ptr [0x1008c54c]
  10028C8E:  85 c0                           test     eax, eax
  10028C90:  74 13                           je       0x10028ca5
  10028C92:  6a 00                           push     0
  10028C94:  8d 55 ec                        lea      edx, [ebp - 0x14]
  10028C97:  52                              push     edx
  10028C98:  51                              push     ecx
  10028C99:  ff d0                           call     eax
  10028C9B:  83 c4 0c                        add      esp, 0xc
  10028C9E:  b0 01                           mov      al, 1
  10028CA0:  5b                              pop      ebx
  10028CA1:  8b e5                           mov      esp, ebp
  10028CA3:  5d                              pop      ebp
  10028CA4:  c3                              ret      
  10028CA5:  32 c0                           xor      al, al
  10028CA7:  5b                              pop      ebx
  10028CA8:  8b e5                           mov      esp, ebp
  10028CAA:  5d                              pop      ebp
  10028CAB:  c3                              ret      
  10028CAC:  32 c0                           xor      al, al
  10028CAE:  8b e5                           mov      esp, ebp
  10028CB0:  5d                              pop      ebp
  10028CB1:  c3                              ret      


; === UI::TriggerFrameRedraw ===
; RVA: 0x00028CC0  Size: 39 bytes
; Exports: ?TriggerFrameRedraw@UI@GW@@YA_NPAUFrame@12@@Z
;
  10028CC0:  55                              push     ebp
  10028CC1:  8b ec                           mov      ebp, esp
  10028CC3:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10028CC6:  85 c9                           test     ecx, ecx
  10028CC8:  74 19                           je       0x10028ce3
  10028CCA:  a1 28 c5 08 10                  mov      eax, dword ptr [0x1008c528]
  10028CCF:  85 c0                           test     eax, eax
  10028CD1:  74 10                           je       0x10028ce3
  10028CD3:  6a 01                           push     1
  10028CD5:  81 c1 d0 00 00 00               add      ecx, 0xd0
  10028CDB:  33 d2                           xor      edx, edx
  10028CDD:  ff d0                           call     eax
  10028CDF:  b0 01                           mov      al, 1
  10028CE1:  5d                              pop      ebp
  10028CE2:  c3                              ret      
  10028CE3:  32 c0                           xor      al, al
  10028CE5:  5d                              pop      ebp
  10028CE6:  c3                              ret      


; === UI::UInt32ToEncStr ===
; RVA: 0x00028CF0  Size: 183 bytes
; Exports: ?UInt32ToEncStr@UI@GW@@YA_NIPA_WI@Z
;
  10028CF0:  55                              push     ebp
  10028CF1:  8b ec                           mov      ebp, esp
  10028CF3:  53                              push     ebx
  10028CF4:  8b 5d 10                        mov      ebx, dword ptr [ebp + 0x10]
  10028CF7:  56                              push     esi
  10028CF8:  57                              push     edi
  10028CF9:  85 db                           test     ebx, ebx
  10028CFB:  0f 84 9f 00 00 00               je       0x10028da0
  10028D01:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10028D04:  33 ff                           xor      edi, edi
  10028D06:  b9 01 00 00 00                  mov      ecx, 1
  10028D0B:  81 fe ff 7e 00 00               cmp      esi, 0x7eff
  10028D11:  76 14                           jbe      0x10028d27
  10028D13:  69 c9 00 7f 00 00               imul     ecx, ecx, 0x7f00
  10028D19:  33 d2                           xor      edx, edx
  10028D1B:  8b c6                           mov      eax, esi
  10028D1D:  47                              inc      edi
  10028D1E:  f7 f1                           div      ecx
  10028D20:  3d ff 7e 00 00                  cmp      eax, 0x7eff
  10028D25:  77 ec                           ja       0x10028d13
  10028D27:  8d 47 02                        lea      eax, [edi + 2]
  10028D2A:  3b c3                           cmp      eax, ebx
  10028D2C:  77 72                           ja       0x10028da0
  10028D2E:  33 ff                           xor      edi, edi
  10028D30:  83 f9 01                        cmp      ecx, 1
  10028D33:  76 36                           jbe      0x10028d6b
  10028D35:  8b 5d 0c                        mov      ebx, dword ptr [ebp + 0xc]
  10028D38:  c7 45 10 00 7f 00 00            mov      dword ptr [ebp + 0x10], 0x7f00
  10028D3F:  90                              nop      
  10028D40:  33 d2                           xor      edx, edx
  10028D42:  8b c6                           mov      eax, esi
  10028D44:  f7 f1                           div      ecx
  10028D46:  33 d2                           xor      edx, edx
  10028D48:  f7 75 10                        div      dword ptr [ebp + 0x10]
  10028D4B:  b8 11 08 04 02                  mov      eax, 0x2040811
  10028D50:  81 ea 00 7f 00 00               sub      edx, 0x7f00
  10028D56:  66 89 14 7b                     mov      word ptr [ebx + edi*2], dx
  10028D5A:  47                              inc      edi
  10028D5B:  f7 e1                           mul      ecx
  10028D5D:  2b ca                           sub      ecx, edx
  10028D5F:  d1 e9                           shr      ecx, 1
  10028D61:  03 ca                           add      ecx, edx
  10028D63:  c1 e9 0e                        shr      ecx, 0xe
  10028D66:  83 f9 01                        cmp      ecx, 1
  10028D69:  77 d5                           ja       0x10028d40
  10028D6B:  b8 11 08 04 02                  mov      eax, 0x2040811
  10028D70:  f7 e6                           mul      esi
  10028D72:  8b c6                           mov      eax, esi
  10028D74:  2b c2                           sub      eax, edx
  10028D76:  d1 e8                           shr      eax, 1
  10028D78:  03 c2                           add      eax, edx
  10028D7A:  c1 e8 0e                        shr      eax, 0xe
  10028D7D:  69 c0 00 7f 00 00               imul     eax, eax, 0x7f00
  10028D83:  2b f0                           sub      esi, eax
  10028D85:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10028D88:  81 c6 00 01 00 00               add      esi, 0x100
  10028D8E:  33 c9                           xor      ecx, ecx
  10028D90:  66 89 34 78                     mov      word ptr [eax + edi*2], si
  10028D94:  66 89 4c 78 02                  mov      word ptr [eax + edi*2 + 2], cx
  10028D99:  b0 01                           mov      al, 1
  10028D9B:  5f                              pop      edi
  10028D9C:  5e                              pop      esi
  10028D9D:  5b                              pop      ebx
  10028D9E:  5d                              pop      ebp
  10028D9F:  c3                              ret      
  10028DA0:  5f                              pop      edi
  10028DA1:  5e                              pop      esi
  10028DA2:  32 c0                           xor      al, al
  10028DA4:  5b                              pop      ebx
  10028DA5:  5d                              pop      ebp
  10028DA6:  c3                              ret      


; === WindowPosition::xAxis ===
; RVA: 0x00029930  Size: 503 bytes
; Exports: ?xAxis@WindowPosition@UI@GW@@QBE?AUVec2f@3@M_N@Z
;
  10029930:  55                              push     ebp
  10029931:  8b ec                           mov      ebp, esp
  10029933:  83 ec 0c                        sub      esp, 0xc
  10029936:  53                              push     ebx
  10029937:  56                              push     esi
  10029938:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  1002993B:  57                              push     edi
  1002993C:  8b f9                           mov      edi, ecx
  1002993E:  c7 06 00 00 00 00               mov      dword ptr [esi], 0
  10029944:  c7 46 04 00 00 00 00            mov      dword ptr [esi + 4], 0
  1002994B:  e8 30 7c ff ff                  call     0x10021580  ; Render::GetViewportWidth
  10029950:  66 0f 6e c0                     movd     xmm0, eax
  10029954:  f3 0f e6 c0                     cvtdq2pd xmm0, xmm0
  10029958:  c1 e8 1f                        shr      eax, 0x1f
  1002995B:  f2 0f 58 04 c5 c0 c5 04 10      addsd    xmm0, qword ptr [eax*8 + 0x1004c5c0]
  10029964:  8b 07                           mov      eax, dword ptr [edi]
  10029966:  83 f0 01                        xor      eax, 1
  10029969:  66 0f 5a d0                     cvtpd2ps xmm2, xmm0
  1002996D:  f3 0f 11 55 fc                  movss    dword ptr [ebp - 4], xmm2
  10029972:  0f 28 ca                        movaps   xmm1, xmm2
  10029975:  f3 0f 59 0d c4 37 05 10         mulss    xmm1, dword ptr [0x100537c4]
  1002997D:  f3 0f 11 4d f8                  movss    dword ptr [ebp - 8], xmm1
  10029982:  83 f8 30                        cmp      eax, 0x30
  10029985:  77 76                           ja       0x100299fd
  10029987:  0f b6 80 34 9b 02 10            movzx    eax, byte ptr [eax + 0x10029b34]
  1002998E:  ff 24 85 28 9b 02 10            jmp      dword ptr [eax*4 + 0x10029b28]
  10029995:  f3 0f 10 45 0c                  movss    xmm0, dword ptr [ebp + 0xc]
  1002999A:  0f 28 ca                        movaps   xmm1, xmm2
  1002999D:  f3 0f 59 47 04                  mulss    xmm0, dword ptr [edi + 4]
  100299A2:  51                              push     ecx
  100299A3:  f3 0f 5c c8                     subss    xmm1, xmm0
  100299A7:  f3 0f 11 0c 24                  movss    dword ptr [esp], xmm1
  100299AC:  e8 8f c4 00 00                  call     0x10035e40
  100299B1:  f3 0f 10 4d fc                  movss    xmm1, dword ptr [ebp - 4]
  100299B6:  d9 5d 08                        fstp     dword ptr [ebp + 8]
  100299B9:  f3 0f 10 45 08                  movss    xmm0, dword ptr [ebp + 8]
  100299BE:  f3 0f 11 45 08                  movss    dword ptr [ebp + 8], xmm0
  100299C3:  f3 0f 10 45 0c                  movss    xmm0, dword ptr [ebp + 0xc]
  100299C8:  f3 0f 59 47 0c                  mulss    xmm0, dword ptr [edi + 0xc]
  100299CD:  f3 0f 5c c8                     subss    xmm1, xmm0
  100299D1:  eb 56                           jmp      0x10029a29
  100299D3:  f3 0f 10 45 0c                  movss    xmm0, dword ptr [ebp + 0xc]
  100299D8:  f3 0f 59 47 04                  mulss    xmm0, dword ptr [edi + 4]
  100299DD:  51                              push     ecx
  100299DE:  f3 0f 5c c8                     subss    xmm1, xmm0
  100299E2:  f3 0f 11 0c 24                  movss    dword ptr [esp], xmm1
  100299E7:  e8 54 c4 00 00                  call     0x10035e40
  100299EC:  f3 0f 10 4d 0c                  movss    xmm1, dword ptr [ebp + 0xc]
  100299F1:  f3 0f 59 4f 0c                  mulss    xmm1, dword ptr [edi + 0xc]
  100299F6:  f3 0f 58 4d f8                  addss    xmm1, dword ptr [ebp - 8]
  100299FB:  eb 1f                           jmp      0x10029a1c
  100299FD:  f3 0f 10 45 0c                  movss    xmm0, dword ptr [ebp + 0xc]
  10029A02:  f3 0f 59 47 04                  mulss    xmm0, dword ptr [edi + 4]
  10029A07:  51                              push     ecx
  10029A08:  f3 0f 11 04 24                  movss    dword ptr [esp], xmm0
  10029A0D:  e8 2e c4 00 00                  call     0x10035e40
  10029A12:  f3 0f 10 4d 0c                  movss    xmm1, dword ptr [ebp + 0xc]
  10029A17:  f3 0f 59 4f 0c                  mulss    xmm1, dword ptr [edi + 0xc]
  10029A1C:  d9 5d 08                        fstp     dword ptr [ebp + 8]
  10029A1F:  f3 0f 10 45 08                  movss    xmm0, dword ptr [ebp + 8]
  10029A24:  f3 0f 11 45 08                  movss    dword ptr [ebp + 8], xmm0
  10029A29:  83 c4 04                        add      esp, 4
  10029A2C:  8b de                           mov      ebx, esi
  10029A2E:  51                              push     ecx
  10029A2F:  f3 0f 11 0c 24                  movss    dword ptr [esp], xmm1
  10029A34:  e8 07 c4 00 00                  call     0x10035e40
  10029A39:  f3 0f 10 45 08                  movss    xmm0, dword ptr [ebp + 8]
  10029A3E:  83 c4 04                        add      esp, 4
  10029A41:  80 7d 10 00                     cmp      byte ptr [ebp + 0x10], 0
  10029A45:  d9 5d f8                        fstp     dword ptr [ebp - 8]
  10029A48:  f3 0f 11 03                     movss    dword ptr [ebx], xmm0
  10029A4C:  f3 0f 10 45 f8                  movss    xmm0, dword ptr [ebp - 8]
  10029A51:  f3 0f 11 46 04                  movss    dword ptr [esi + 4], xmm0
  10029A56:  0f 84 c0 00 00 00               je       0x10029b1c
  10029A5C:  f3 0f 10 06                     movss    xmm0, dword ptr [esi]
  10029A60:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10029A63:  f3 0f 5f 05 10 c6 04 10         maxss    xmm0, dword ptr [0x1004c610]
  10029A6B:  6a 00                           push     0
  10029A6D:  51                              push     ecx
  10029A6E:  8b cf                           mov      ecx, edi
  10029A70:  f3 0f 11 06                     movss    dword ptr [esi], xmm0
  10029A74:  f3 0f 10 45 0c                  movss    xmm0, dword ptr [ebp + 0xc]
  10029A79:  f3 0f 11 04 24                  movss    dword ptr [esp], xmm0
  10029A7E:  50                              push     eax
  10029A7F:  e8 ac fe ff ff                  call     0x10029930  ; WindowPosition::xAxis
  10029A84:  6a 00                           push     0
  10029A86:  51                              push     ecx
  10029A87:  8b cf                           mov      ecx, edi
  10029A89:  f3 0f 10 40 04                  movss    xmm0, dword ptr [eax + 4]
  10029A8E:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10029A91:  f3 0f 11 45 10                  movss    dword ptr [ebp + 0x10], xmm0
  10029A96:  f3 0f 10 45 0c                  movss    xmm0, dword ptr [ebp + 0xc]
  10029A9B:  f3 0f 11 04 24                  movss    dword ptr [esp], xmm0
  10029AA0:  50                              push     eax
  10029AA1:  e8 8a fe ff ff                  call     0x10029930  ; WindowPosition::xAxis
  10029AA6:  f3 0f 10 4d 10                  movss    xmm1, dword ptr [ebp + 0x10]
  10029AAB:  f3 0f 10 45 fc                  movss    xmm0, dword ptr [ebp - 4]
  10029AB0:  6a 00                           push     0
  10029AB2:  f3 0f 5c 08                     subss    xmm1, dword ptr [eax]
  10029AB6:  51                              push     ecx
  10029AB7:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10029ABA:  8b cf                           mov      ecx, edi
  10029ABC:  f3 0f 5c c1                     subss    xmm0, xmm1
  10029AC0:  f3 0f 5d 06                     minss    xmm0, dword ptr [esi]
  10029AC4:  f3 0f 11 06                     movss    dword ptr [esi], xmm0
  10029AC8:  f3 0f 10 46 04                  movss    xmm0, dword ptr [esi + 4]
  10029ACD:  f3 0f 5d 45 fc                  minss    xmm0, dword ptr [ebp - 4]
  10029AD2:  f3 0f 11 46 04                  movss    dword ptr [esi + 4], xmm0
  10029AD7:  f3 0f 10 45 0c                  movss    xmm0, dword ptr [ebp + 0xc]
  10029ADC:  f3 0f 11 04 24                  movss    dword ptr [esp], xmm0
  10029AE1:  50                              push     eax
  10029AE2:  e8 49 fe ff ff                  call     0x10029930  ; WindowPosition::xAxis
  10029AE7:  6a 00                           push     0
  10029AE9:  51                              push     ecx
  10029AEA:  8b cf                           mov      ecx, edi
  10029AEC:  f3 0f 10 40 04                  movss    xmm0, dword ptr [eax + 4]
  10029AF1:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10029AF4:  f3 0f 11 45 10                  movss    dword ptr [ebp + 0x10], xmm0
  10029AF9:  f3 0f 10 45 0c                  movss    xmm0, dword ptr [ebp + 0xc]
  10029AFE:  f3 0f 11 04 24                  movss    dword ptr [esp], xmm0
  10029B03:  50                              push     eax
  10029B04:  e8 27 fe ff ff                  call     0x10029930  ; WindowPosition::xAxis
  10029B09:  f3 0f 10 45 10                  movss    xmm0, dword ptr [ebp + 0x10]
  10029B0E:  f3 0f 5c 00                     subss    xmm0, dword ptr [eax]
  10029B12:  f3 0f 5f 46 04                  maxss    xmm0, dword ptr [esi + 4]
  10029B17:  f3 0f 11 46 04                  movss    dword ptr [esi + 4], xmm0
  10029B1C:  5f                              pop      edi
  10029B1D:  8b c6                           mov      eax, esi
  10029B1F:  5e                              pop      esi
  10029B20:  5b                              pop      ebx
  10029B21:  8b e5                           mov      esp, ebp
  10029B23:  5d                              pop      ebp
  10029B24:  c2 0c 00                        ret      0xc


; === WindowPosition::yAxis ===
; RVA: 0x00029B70  Size: 401 bytes
; Exports: ?yAxis@WindowPosition@UI@GW@@QBE?AUVec2f@3@M_N@Z
;
  10029B70:  55                              push     ebp
  10029B71:  8b ec                           mov      ebp, esp
  10029B73:  83 ec 08                        sub      esp, 8
  10029B76:  56                              push     esi
  10029B77:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10029B7A:  57                              push     edi
  10029B7B:  8b f9                           mov      edi, ecx
  10029B7D:  e8 de 79 ff ff                  call     0x10021560  ; Render::GetViewportHeight
  10029B82:  c7 06 00 00 00 00               mov      dword ptr [esi], 0
  10029B88:  0f 57 ed                        xorps    xmm5, xmm5
  10029B8B:  c7 46 04 00 00 00 00            mov      dword ptr [esi + 4], 0
  10029B92:  66 0f 6e c0                     movd     xmm0, eax
  10029B96:  f3 0f e6 c0                     cvtdq2pd xmm0, xmm0
  10029B9A:  c1 e8 1f                        shr      eax, 0x1f
  10029B9D:  f2 0f 58 04 c5 c0 c5 04 10      addsd    xmm0, qword ptr [eax*8 + 0x1004c5c0]
  10029BA6:  8b 07                           mov      eax, dword ptr [edi]
  10029BA8:  83 f0 01                        xor      eax, 1
  10029BAB:  66 0f 5a c8                     cvtpd2ps xmm1, xmm0
  10029BAF:  f3 0f 11 4d 08                  movss    dword ptr [ebp + 8], xmm1
  10029BB4:  83 f8 30                        cmp      eax, 0x30
  10029BB7:  77 5d                           ja       0x10029c16
  10029BB9:  0f b6 80 10 9d 02 10            movzx    eax, byte ptr [eax + 0x10029d10]
  10029BC0:  ff 24 85 04 9d 02 10            jmp      dword ptr [eax*4 + 0x10029d04]
  10029BC7:  f3 0f 10 65 0c                  movss    xmm4, dword ptr [ebp + 0xc]
  10029BCC:  0f 28 d9                        movaps   xmm3, xmm1
  10029BCF:  0f 28 c4                        movaps   xmm0, xmm4
  10029BD2:  0f 28 d1                        movaps   xmm2, xmm1
  10029BD5:  f3 0f 59 47 08                  mulss    xmm0, dword ptr [edi + 8]
  10029BDA:  f3 0f 5c d8                     subss    xmm3, xmm0
  10029BDE:  0f 28 c4                        movaps   xmm0, xmm4
  10029BE1:  f3 0f 59 47 10                  mulss    xmm0, dword ptr [edi + 0x10]
  10029BE6:  f3 0f 5c d0                     subss    xmm2, xmm0
  10029BEA:  eb 3f                           jmp      0x10029c2b
  10029BEC:  f3 0f 10 65 0c                  movss    xmm4, dword ptr [ebp + 0xc]
  10029BF1:  f3 0f 59 0d c4 37 05 10         mulss    xmm1, dword ptr [0x100537c4]
  10029BF9:  0f 28 c4                        movaps   xmm0, xmm4
  10029BFC:  f3 0f 59 47 08                  mulss    xmm0, dword ptr [edi + 8]
  10029C01:  0f 28 d4                        movaps   xmm2, xmm4
  10029C04:  f3 0f 59 57 10                  mulss    xmm2, dword ptr [edi + 0x10]
  10029C09:  0f 28 d9                        movaps   xmm3, xmm1
  10029C0C:  f3 0f 5c d8                     subss    xmm3, xmm0
  10029C10:  f3 0f 58 d1                     addss    xmm2, xmm1
  10029C14:  eb 15                           jmp      0x10029c2b
  10029C16:  f3 0f 10 65 0c                  movss    xmm4, dword ptr [ebp + 0xc]
  10029C1B:  0f 28 dc                        movaps   xmm3, xmm4
  10029C1E:  0f 28 d4                        movaps   xmm2, xmm4
  10029C21:  f3 0f 59 5f 08                  mulss    xmm3, dword ptr [edi + 8]
  10029C26:  f3 0f 59 57 10                  mulss    xmm2, dword ptr [edi + 0x10]
  10029C2B:  80 7d 10 00                     cmp      byte ptr [ebp + 0x10], 0
  10029C2F:  8b c6                           mov      eax, esi
  10029C31:  f3 0f 11 18                     movss    dword ptr [eax], xmm3
  10029C35:  f3 0f 11 56 04                  movss    dword ptr [esi + 4], xmm2
  10029C3A:  0f 84 b7 00 00 00               je       0x10029cf7
  10029C40:  f3 0f 10 06                     movss    xmm0, dword ptr [esi]
  10029C44:  8d 45 f8                        lea      eax, [ebp - 8]
  10029C47:  6a 00                           push     0
  10029C49:  f3 0f 5f c5                     maxss    xmm0, xmm5
  10029C4D:  51                              push     ecx
  10029C4E:  f3 0f 11 24 24                  movss    dword ptr [esp], xmm4
  10029C53:  8b cf                           mov      ecx, edi
  10029C55:  50                              push     eax
  10029C56:  f3 0f 11 06                     movss    dword ptr [esi], xmm0
  10029C5A:  e8 11 ff ff ff                  call     0x10029b70  ; WindowPosition::yAxis
  10029C5F:  6a 00                           push     0
  10029C61:  51                              push     ecx
  10029C62:  8b cf                           mov      ecx, edi
  10029C64:  f3 0f 10 40 04                  movss    xmm0, dword ptr [eax + 4]
  10029C69:  8d 45 f8                        lea      eax, [ebp - 8]
  10029C6C:  f3 0f 11 45 10                  movss    dword ptr [ebp + 0x10], xmm0
  10029C71:  f3 0f 10 45 0c                  movss    xmm0, dword ptr [ebp + 0xc]
  10029C76:  f3 0f 11 04 24                  movss    dword ptr [esp], xmm0
  10029C7B:  50                              push     eax
  10029C7C:  e8 ef fe ff ff                  call     0x10029b70  ; WindowPosition::yAxis
  10029C81:  f3 0f 10 4d 10                  movss    xmm1, dword ptr [ebp + 0x10]
  10029C86:  f3 0f 10 45 08                  movss    xmm0, dword ptr [ebp + 8]
  10029C8B:  6a 00                           push     0
  10029C8D:  f3 0f 5c 08                     subss    xmm1, dword ptr [eax]
  10029C91:  51                              push     ecx
  10029C92:  8d 45 f8                        lea      eax, [ebp - 8]
  10029C95:  8b cf                           mov      ecx, edi
  10029C97:  f3 0f 5c c1                     subss    xmm0, xmm1
  10029C9B:  f3 0f 5d 06                     minss    xmm0, dword ptr [esi]
  10029C9F:  f3 0f 11 06                     movss    dword ptr [esi], xmm0
  10029CA3:  f3 0f 10 46 04                  movss    xmm0, dword ptr [esi + 4]
  10029CA8:  f3 0f 5d 45 08                  minss    xmm0, dword ptr [ebp + 8]
  10029CAD:  f3 0f 11 46 04                  movss    dword ptr [esi + 4], xmm0
  10029CB2:  f3 0f 10 45 0c                  movss    xmm0, dword ptr [ebp + 0xc]
  10029CB7:  f3 0f 11 04 24                  movss    dword ptr [esp], xmm0
  10029CBC:  50                              push     eax
  10029CBD:  e8 ae fe ff ff                  call     0x10029b70  ; WindowPosition::yAxis
  10029CC2:  6a 00                           push     0
  10029CC4:  51                              push     ecx
  10029CC5:  8b cf                           mov      ecx, edi
  10029CC7:  f3 0f 10 40 04                  movss    xmm0, dword ptr [eax + 4]
  10029CCC:  8d 45 f8                        lea      eax, [ebp - 8]
  10029CCF:  f3 0f 11 45 10                  movss    dword ptr [ebp + 0x10], xmm0
  10029CD4:  f3 0f 10 45 0c                  movss    xmm0, dword ptr [ebp + 0xc]
  10029CD9:  f3 0f 11 04 24                  movss    dword ptr [esp], xmm0
  10029CDE:  50                              push     eax
  10029CDF:  e8 8c fe ff ff                  call     0x10029b70  ; WindowPosition::yAxis
  10029CE4:  f3 0f 10 45 10                  movss    xmm0, dword ptr [ebp + 0x10]
  10029CE9:  f3 0f 5c 00                     subss    xmm0, dword ptr [eax]
  10029CED:  f3 0f 5f 46 04                  maxss    xmm0, dword ptr [esi + 4]
  10029CF2:  f3 0f 11 46 04                  movss    dword ptr [esi + 4], xmm0
  10029CF7:  5f                              pop      edi
  10029CF8:  8b c6                           mov      eax, esi
  10029CFA:  5e                              pop      esi
  10029CFB:  8b e5                           mov      esp, ebp
  10029CFD:  5d                              pop      ebp
  10029CFE:  c2 0c 00                        ret      0xc


