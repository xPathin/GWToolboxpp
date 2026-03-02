; Module: GWCA
; Functions: 29
; Total code size: 2945 bytes
;

; === GW::LogMessage, GW::RegisterLogHandler ===
; RVA: 0x00003380  Size: 3 bytes
; Exports: ?LogMessage@GW@@YAXW4LogLevel@1@PBDI11ZZ, ?RegisterLogHandler@GW@@YAXP6AXPAXW4LogLevel@1@PBD2I2@Z0@Z
;
  10003380:  c2 00 00                        ret      0


; === GW::FatalAssert ===
; RVA: 0x00005870  Size: 40 bytes
; Exports: ?FatalAssert@GW@@YAXPBD0I0@Z
;
  10005870:  55                              push     ebp
  10005871:  8b ec                           mov      ebp, esp
  10005873:  a1 80 c1 08 10                  mov      eax, dword ptr [0x1008c180]
  10005878:  85 c0                           test     eax, eax
  1000587A:  74 17                           je       0x10005893
  1000587C:  ff 75 14                        push     dword ptr [ebp + 0x14]
  1000587F:  ff 75 10                        push     dword ptr [ebp + 0x10]
  10005882:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10005885:  ff 75 08                        push     dword ptr [ebp + 8]
  10005888:  ff 35 84 c1 08 10               push     dword ptr [0x1008c184]
  1000588E:  ff d0                           call     eax
  10005890:  83 c4 14                        add      esp, 0x14
  10005893:  e9 5e 05 03 00                  jmp      0x10035df6


; === GW::RegisterPanicHandler ===
; RVA: 0x000058A0  Size: 21 bytes
; Exports: ?RegisterPanicHandler@GW@@YAXP6AXPAXPBD1I1@Z0@Z
;
  100058A0:  55                              push     ebp
  100058A1:  8b ec                           mov      ebp, esp
  100058A3:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100058A6:  a3 80 c1 08 10                  mov      dword ptr [0x1008c180], eax
  100058AB:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  100058AE:  a3 84 c1 08 10                  mov      dword ptr [0x1008c184], eax
  100058B3:  5d                              pop      ebp
  100058B4:  c3                              ret      


; === GW::DisableHooks ===
; RVA: 0x00018EE0  Size: 57 bytes
; Exports: ?DisableHooks@GW@@YAXXZ
;
  10018EE0:  56                              push     esi
  10018EE1:  57                              push     edi
  10018EE2:  6a 00                           push     0
  10018EE4:  e8 47 1b 00 00                  call     0x1001aa30  ; Hook::DisableHooks
  10018EE9:  8b 3d 30 c2 08 10               mov      edi, dword ptr [0x1008c230]
  10018EEF:  83 c4 04                        add      esp, 4
  10018EF2:  8b 35 2c c2 08 10               mov      esi, dword ptr [0x1008c22c]
  10018EF8:  3b f7                           cmp      esi, edi
  10018EFA:  74 16                           je       0x10018f12
  10018EFC:  0f 1f 40 00                     nop      dword ptr [eax]
  10018F00:  8b 06                           mov      eax, dword ptr [esi]
  10018F02:  8b 40 14                        mov      eax, dword ptr [eax + 0x14]
  10018F05:  85 c0                           test     eax, eax
  10018F07:  74 02                           je       0x10018f0b
  10018F09:  ff d0                           call     eax
  10018F0B:  83 c6 04                        add      esi, 4
  10018F0E:  3b f7                           cmp      esi, edi
  10018F10:  75 ee                           jne      0x10018f00
  10018F12:  5f                              pop      edi
  10018F13:  5e                              pop      esi
  10018F14:  e9 f7 55 00 00                  jmp      0x1001e510


; === GW::EnableHooks ===
; RVA: 0x00018F20  Size: 63 bytes
; Exports: ?EnableHooks@GW@@YAXXZ
;
  10018F20:  80 3d 44 c2 08 10 00            cmp      byte ptr [0x1008c244], 0
  10018F27:  74 35                           je       0x10018f5e
  10018F29:  56                              push     esi
  10018F2A:  57                              push     edi
  10018F2B:  6a 00                           push     0
  10018F2D:  e8 0e 1b 00 00                  call     0x1001aa40  ; Hook::EnableHooks
  10018F32:  8b 3d 30 c2 08 10               mov      edi, dword ptr [0x1008c230]
  10018F38:  83 c4 04                        add      esp, 4
  10018F3B:  8b 35 2c c2 08 10               mov      esi, dword ptr [0x1008c22c]
  10018F41:  3b f7                           cmp      esi, edi
  10018F43:  74 12                           je       0x10018f57
  10018F45:  8b 06                           mov      eax, dword ptr [esi]
  10018F47:  8b 40 10                        mov      eax, dword ptr [eax + 0x10]
  10018F4A:  85 c0                           test     eax, eax
  10018F4C:  74 02                           je       0x10018f50
  10018F4E:  ff d0                           call     eax
  10018F50:  83 c6 04                        add      esi, 4
  10018F53:  3b f7                           cmp      esi, edi
  10018F55:  75 ee                           jne      0x10018f45
  10018F57:  5f                              pop      edi
  10018F58:  5e                              pop      esi
  10018F59:  e9 32 56 00 00                  jmp      0x1001e590
  10018F5E:  c3                              ret      


; === GW::GetAccountContext ===
; RVA: 0x00018F60  Size: 23 bytes
; Exports: ?GetAccountContext@GW@@YAPAUAccountContext@1@XZ
;
  10018F60:  a1 48 c2 08 10                  mov      eax, dword ptr [0x1008c248]
  10018F65:  85 c0                           test     eax, eax
  10018F67:  74 0b                           je       0x10018f74
  10018F69:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  10018F6C:  85 c0                           test     eax, eax
  10018F6E:  74 04                           je       0x10018f74
  10018F70:  8b 40 28                        mov      eax, dword ptr [eax + 0x28]
  10018F73:  c3                              ret      
  10018F74:  33 c0                           xor      eax, eax
  10018F76:  c3                              ret      


; === GW::GetAgentContext ===
; RVA: 0x00018F80  Size: 23 bytes
; Exports: ?GetAgentContext@GW@@YAPAUAgentContext@1@XZ
;
  10018F80:  a1 48 c2 08 10                  mov      eax, dword ptr [0x1008c248]
  10018F85:  85 c0                           test     eax, eax
  10018F87:  74 0b                           je       0x10018f94
  10018F89:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  10018F8C:  85 c0                           test     eax, eax
  10018F8E:  74 04                           je       0x10018f94
  10018F90:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  10018F93:  c3                              ret      
  10018F94:  33 c0                           xor      eax, eax
  10018F96:  c3                              ret      


; === GW::GetAvailableChars, GetAvailableChars ===
; RVA: 0x00018FA0  Size: 6 bytes
; Exports: ?GetAvailableChars@GW@@YAPAV?$Array@UCharacterInformation@GW@@@1@XZ, GetAvailableChars
;
  10018FA0:  a1 40 c2 08 10                  mov      eax, dword ptr [0x1008c240]
  10018FA5:  c3                              ret      


; === GW::GetCharContext ===
; RVA: 0x00018FB0  Size: 23 bytes
; Exports: ?GetCharContext@GW@@YAPAUCharContext@1@XZ
;
  10018FB0:  a1 48 c2 08 10                  mov      eax, dword ptr [0x1008c248]
  10018FB5:  85 c0                           test     eax, eax
  10018FB7:  74 0b                           je       0x10018fc4
  10018FB9:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  10018FBC:  85 c0                           test     eax, eax
  10018FBE:  74 04                           je       0x10018fc4
  10018FC0:  8b 40 44                        mov      eax, dword ptr [eax + 0x44]
  10018FC3:  c3                              ret      
  10018FC4:  33 c0                           xor      eax, eax
  10018FC6:  c3                              ret      


; === GW::GetGameContext ===
; RVA: 0x00018FD0  Size: 31 bytes
; Exports: ?GetGameContext@GW@@YAPAUGameContext@1@XZ
;
  10018FD0:  a1 48 c2 08 10                  mov      eax, dword ptr [0x1008c248]
  10018FD5:  85 c0                           test     eax, eax
  10018FD7:  74 04                           je       0x10018fdd
  10018FD9:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  10018FDC:  c3                              ret      
  10018FDD:  33 c0                           xor      eax, eax
  10018FDF:  c3                              ret      
  10018FE0:  a1 3c c2 08 10                  mov      eax, dword ptr [0x1008c23c]
  10018FE5:  85 c0                           test     eax, eax
  10018FE7:  74 03                           je       0x10018fec
  10018FE9:  8b 00                           mov      eax, dword ptr [eax]
  10018FEB:  c3                              ret      
  10018FEC:  33 c0                           xor      eax, eax
  10018FEE:  c3                              ret      


; === GW::GetGameplayContext ===
; RVA: 0x00018FE0  Size: 15 bytes
; Exports: ?GetGameplayContext@GW@@YAPAUGameplayContext@1@XZ
;
  10018FE0:  a1 3c c2 08 10                  mov      eax, dword ptr [0x1008c23c]
  10018FE5:  85 c0                           test     eax, eax
  10018FE7:  74 03                           je       0x10018fec
  10018FE9:  8b 00                           mov      eax, dword ptr [eax]
  10018FEB:  c3                              ret      
  10018FEC:  33 c0                           xor      eax, eax
  10018FEE:  c3                              ret      


; === GW::GetGuildContext ===
; RVA: 0x00018FF0  Size: 23 bytes
; Exports: ?GetGuildContext@GW@@YAPAUGuildContext@1@XZ
;
  10018FF0:  a1 48 c2 08 10                  mov      eax, dword ptr [0x1008c248]
  10018FF5:  85 c0                           test     eax, eax
  10018FF7:  74 0b                           je       0x10019004
  10018FF9:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  10018FFC:  85 c0                           test     eax, eax
  10018FFE:  74 04                           je       0x10019004
  10019000:  8b 40 3c                        mov      eax, dword ptr [eax + 0x3c]
  10019003:  c3                              ret      
  10019004:  33 c0                           xor      eax, eax
  10019006:  c3                              ret      


; === GW::GetItemContext ===
; RVA: 0x00019010  Size: 23 bytes
; Exports: ?GetItemContext@GW@@YAPAUItemContext@1@XZ
;
  10019010:  a1 48 c2 08 10                  mov      eax, dword ptr [0x1008c248]
  10019015:  85 c0                           test     eax, eax
  10019017:  74 0b                           je       0x10019024
  10019019:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  1001901C:  85 c0                           test     eax, eax
  1001901E:  74 04                           je       0x10019024
  10019020:  8b 40 40                        mov      eax, dword ptr [eax + 0x40]
  10019023:  c3                              ret      
  10019024:  33 c0                           xor      eax, eax
  10019026:  c3                              ret      


; === GW::GetMapContext ===
; RVA: 0x00019030  Size: 23 bytes
; Exports: ?GetMapContext@GW@@YAPAUMapContext@1@XZ
;
  10019030:  a1 48 c2 08 10                  mov      eax, dword ptr [0x1008c248]
  10019035:  85 c0                           test     eax, eax
  10019037:  74 0b                           je       0x10019044
  10019039:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  1001903C:  85 c0                           test     eax, eax
  1001903E:  74 04                           je       0x10019044
  10019040:  8b 40 14                        mov      eax, dword ptr [eax + 0x14]
  10019043:  c3                              ret      
  10019044:  33 c0                           xor      eax, eax
  10019046:  c3                              ret      


; === GW::GetPartyContext ===
; RVA: 0x00019050  Size: 23 bytes
; Exports: ?GetPartyContext@GW@@YAPAUPartyContext@1@XZ
;
  10019050:  a1 48 c2 08 10                  mov      eax, dword ptr [0x1008c248]
  10019055:  85 c0                           test     eax, eax
  10019057:  74 0b                           je       0x10019064
  10019059:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  1001905C:  85 c0                           test     eax, eax
  1001905E:  74 04                           je       0x10019064
  10019060:  8b 40 4c                        mov      eax, dword ptr [eax + 0x4c]
  10019063:  c3                              ret      
  10019064:  33 c0                           xor      eax, eax
  10019066:  c3                              ret      


; === GW::GetPreGameContext ===
; RVA: 0x00019070  Size: 15 bytes
; Exports: ?GetPreGameContext@GW@@YAPAUPreGameContext@1@XZ
;
  10019070:  a1 38 c2 08 10                  mov      eax, dword ptr [0x1008c238]
  10019075:  85 c0                           test     eax, eax
  10019077:  74 03                           je       0x1001907c
  10019079:  8b 00                           mov      eax, dword ptr [eax]
  1001907B:  c3                              ret      
  1001907C:  33 c0                           xor      eax, eax
  1001907E:  c3                              ret      


; === GW::GetWorldContext ===
; RVA: 0x000190A0  Size: 23 bytes
; Exports: ?GetWorldContext@GW@@YAPAUWorldContext@1@XZ
;
  100190A0:  a1 48 c2 08 10                  mov      eax, dword ptr [0x1008c248]
  100190A5:  85 c0                           test     eax, eax
  100190A7:  74 0b                           je       0x100190b4
  100190A9:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  100190AC:  85 c0                           test     eax, eax
  100190AE:  74 04                           je       0x100190b4
  100190B0:  8b 40 2c                        mov      eax, dword ptr [eax + 0x2c]
  100190B3:  c3                              ret      
  100190B4:  33 c0                           xor      eax, eax
  100190B6:  c3                              ret      


; === GW::Initialize ===
; RVA: 0x000190C0  Size: 1391 bytes
; Exports: ?Initialize@GW@@YA_NXZ
;
  100190C0:  55                              push     ebp
  100190C1:  8b ec                           mov      ebp, esp
  100190C3:  51                              push     ecx
  100190C4:  80 3d 44 c2 08 10 00            cmp      byte ptr [0x1008c244], 0
  100190CB:  56                              push     esi
  100190CC:  57                              push     edi
  100190CD:  0f 85 54 05 00 00               jne      0x10019627
  100190D3:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  100190D8:  c7 45 fc 2c a1 08 10            mov      dword ptr [ebp - 4], 0x1008a12c
  100190DF:  3b 05 34 c2 08 10               cmp      eax, dword ptr [0x1008c234]
  100190E5:  74 15                           je       0x100190fc
  100190E7:  c7 00 2c a1 08 10               mov      dword ptr [eax], 0x1008a12c
  100190ED:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  100190F2:  83 c0 04                        add      eax, 4
  100190F5:  a3 30 c2 08 10                  mov      dword ptr [0x1008c230], eax
  100190FA:  eb 14                           jmp      0x10019110
  100190FC:  8d 4d fc                        lea      ecx, [ebp - 4]
  100190FF:  51                              push     ecx
  10019100:  50                              push     eax
  10019101:  b9 2c c2 08 10                  mov      ecx, 0x1008c22c
  10019106:  e8 25 88 fe ff                  call     0x10001930
  1001910B:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  10019110:  c7 45 fc c0 a0 08 10            mov      dword ptr [ebp - 4], 0x1008a0c0
  10019117:  3b 05 34 c2 08 10               cmp      eax, dword ptr [0x1008c234]
  1001911D:  74 15                           je       0x10019134
  1001911F:  c7 00 c0 a0 08 10               mov      dword ptr [eax], 0x1008a0c0
  10019125:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  1001912A:  83 c0 04                        add      eax, 4
  1001912D:  a3 30 c2 08 10                  mov      dword ptr [0x1008c230], eax
  10019132:  eb 14                           jmp      0x10019148
  10019134:  8d 4d fc                        lea      ecx, [ebp - 4]
  10019137:  51                              push     ecx
  10019138:  50                              push     eax
  10019139:  b9 2c c2 08 10                  mov      ecx, 0x1008c22c
  1001913E:  e8 ed 87 fe ff                  call     0x10001930
  10019143:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  10019148:  c7 45 fc 24 a2 08 10            mov      dword ptr [ebp - 4], 0x1008a224
  1001914F:  3b 05 34 c2 08 10               cmp      eax, dword ptr [0x1008c234]
  10019155:  74 15                           je       0x1001916c
  10019157:  c7 00 24 a2 08 10               mov      dword ptr [eax], 0x1008a224
  1001915D:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  10019162:  83 c0 04                        add      eax, 4
  10019165:  a3 30 c2 08 10                  mov      dword ptr [0x1008c230], eax
  1001916A:  eb 14                           jmp      0x10019180
  1001916C:  8d 4d fc                        lea      ecx, [ebp - 4]
  1001916F:  51                              push     ecx
  10019170:  50                              push     eax
  10019171:  b9 2c c2 08 10                  mov      ecx, 0x1008c22c
  10019176:  e8 b5 87 fe ff                  call     0x10001930
  1001917B:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  10019180:  c7 45 fc 88 a2 08 10            mov      dword ptr [ebp - 4], 0x1008a288
  10019187:  3b 05 34 c2 08 10               cmp      eax, dword ptr [0x1008c234]
  1001918D:  74 15                           je       0x100191a4
  1001918F:  c7 00 88 a2 08 10               mov      dword ptr [eax], 0x1008a288
  10019195:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  1001919A:  83 c0 04                        add      eax, 4
  1001919D:  a3 30 c2 08 10                  mov      dword ptr [0x1008c230], eax
  100191A2:  eb 14                           jmp      0x100191b8
  100191A4:  8d 4d fc                        lea      ecx, [ebp - 4]
  100191A7:  51                              push     ecx
  100191A8:  50                              push     eax
  100191A9:  b9 2c c2 08 10                  mov      ecx, 0x1008c22c
  100191AE:  e8 7d 87 fe ff                  call     0x10001930
  100191B3:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  100191B8:  c7 45 fc 18 a0 08 10            mov      dword ptr [ebp - 4], 0x1008a018
  100191BF:  3b 05 34 c2 08 10               cmp      eax, dword ptr [0x1008c234]
  100191C5:  74 15                           je       0x100191dc
  100191C7:  c7 00 18 a0 08 10               mov      dword ptr [eax], 0x1008a018
  100191CD:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  100191D2:  83 c0 04                        add      eax, 4
  100191D5:  a3 30 c2 08 10                  mov      dword ptr [0x1008c230], eax
  100191DA:  eb 14                           jmp      0x100191f0
  100191DC:  8d 4d fc                        lea      ecx, [ebp - 4]
  100191DF:  51                              push     ecx
  100191E0:  50                              push     eax
  100191E1:  b9 2c c2 08 10                  mov      ecx, 0x1008c22c
  100191E6:  e8 45 87 fe ff                  call     0x10001930
  100191EB:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  100191F0:  c7 45 fc 00 a0 08 10            mov      dword ptr [ebp - 4], 0x1008a000
  100191F7:  3b 05 34 c2 08 10               cmp      eax, dword ptr [0x1008c234]
  100191FD:  74 15                           je       0x10019214
  100191FF:  c7 00 00 a0 08 10               mov      dword ptr [eax], 0x1008a000
  10019205:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  1001920A:  83 c0 04                        add      eax, 4
  1001920D:  a3 30 c2 08 10                  mov      dword ptr [0x1008c230], eax
  10019212:  eb 14                           jmp      0x10019228
  10019214:  8d 4d fc                        lea      ecx, [ebp - 4]
  10019217:  51                              push     ecx
  10019218:  50                              push     eax
  10019219:  b9 2c c2 08 10                  mov      ecx, 0x1008c22c
  1001921E:  e8 0d 87 fe ff                  call     0x10001930
  10019223:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  10019228:  c7 45 fc 14 a1 08 10            mov      dword ptr [ebp - 4], 0x1008a114
  1001922F:  3b 05 34 c2 08 10               cmp      eax, dword ptr [0x1008c234]
  10019235:  74 15                           je       0x1001924c
  10019237:  c7 00 14 a1 08 10               mov      dword ptr [eax], 0x1008a114
  1001923D:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  10019242:  83 c0 04                        add      eax, 4
  10019245:  a3 30 c2 08 10                  mov      dword ptr [0x1008c230], eax
  1001924A:  eb 14                           jmp      0x10019260
  1001924C:  8d 4d fc                        lea      ecx, [ebp - 4]
  1001924F:  51                              push     ecx
  10019250:  50                              push     eax
  10019251:  b9 2c c2 08 10                  mov      ecx, 0x1008c22c
  10019256:  e8 d5 86 fe ff                  call     0x10001930
  1001925B:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  10019260:  c7 45 fc 30 a0 08 10            mov      dword ptr [ebp - 4], 0x1008a030
  10019267:  3b 05 34 c2 08 10               cmp      eax, dword ptr [0x1008c234]
  1001926D:  74 15                           je       0x10019284
  1001926F:  c7 00 30 a0 08 10               mov      dword ptr [eax], 0x1008a030
  10019275:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  1001927A:  83 c0 04                        add      eax, 4
  1001927D:  a3 30 c2 08 10                  mov      dword ptr [0x1008c230], eax
  10019282:  eb 14                           jmp      0x10019298
  10019284:  8d 4d fc                        lea      ecx, [ebp - 4]
  10019287:  51                              push     ecx
  10019288:  50                              push     eax
  10019289:  b9 2c c2 08 10                  mov      ecx, 0x1008c22c
  1001928E:  e8 9d 86 fe ff                  call     0x10001930
  10019293:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  10019298:  c7 45 fc fc a0 08 10            mov      dword ptr [ebp - 4], 0x1008a0fc
  1001929F:  3b 05 34 c2 08 10               cmp      eax, dword ptr [0x1008c234]
  100192A5:  74 15                           je       0x100192bc
  100192A7:  c7 00 fc a0 08 10               mov      dword ptr [eax], 0x1008a0fc
  100192AD:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  100192B2:  83 c0 04                        add      eax, 4
  100192B5:  a3 30 c2 08 10                  mov      dword ptr [0x1008c230], eax
  100192BA:  eb 14                           jmp      0x100192d0
  100192BC:  8d 4d fc                        lea      ecx, [ebp - 4]
  100192BF:  51                              push     ecx
  100192C0:  50                              push     eax
  100192C1:  b9 2c c2 08 10                  mov      ecx, 0x1008c22c
  100192C6:  e8 65 86 fe ff                  call     0x10001930
  100192CB:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  100192D0:  c7 45 fc 58 a2 08 10            mov      dword ptr [ebp - 4], 0x1008a258
  100192D7:  3b 05 34 c2 08 10               cmp      eax, dword ptr [0x1008c234]
  100192DD:  74 15                           je       0x100192f4
  100192DF:  c7 00 58 a2 08 10               mov      dword ptr [eax], 0x1008a258
  100192E5:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  100192EA:  83 c0 04                        add      eax, 4
  100192ED:  a3 30 c2 08 10                  mov      dword ptr [0x1008c230], eax
  100192F2:  eb 14                           jmp      0x10019308
  100192F4:  8d 4d fc                        lea      ecx, [ebp - 4]
  100192F7:  51                              push     ecx
  100192F8:  50                              push     eax
  100192F9:  b9 2c c2 08 10                  mov      ecx, 0x1008c22c
  100192FE:  e8 2d 86 fe ff                  call     0x10001930
  10019303:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  10019308:  c7 45 fc d8 a0 08 10            mov      dword ptr [ebp - 4], 0x1008a0d8
  1001930F:  3b 05 34 c2 08 10               cmp      eax, dword ptr [0x1008c234]
  10019315:  74 15                           je       0x1001932c
  10019317:  c7 00 d8 a0 08 10               mov      dword ptr [eax], 0x1008a0d8
  1001931D:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  10019322:  83 c0 04                        add      eax, 4
  10019325:  a3 30 c2 08 10                  mov      dword ptr [0x1008c230], eax
  1001932A:  eb 14                           jmp      0x10019340
  1001932C:  8d 4d fc                        lea      ecx, [ebp - 4]
  1001932F:  51                              push     ecx
  10019330:  50                              push     eax
  10019331:  b9 2c c2 08 10                  mov      ecx, 0x1008c22c
  10019336:  e8 f5 85 fe ff                  call     0x10001930
  1001933B:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  10019340:  c7 45 fc 60 a1 08 10            mov      dword ptr [ebp - 4], 0x1008a160
  10019347:  3b 05 34 c2 08 10               cmp      eax, dword ptr [0x1008c234]
  1001934D:  74 15                           je       0x10019364
  1001934F:  c7 00 60 a1 08 10               mov      dword ptr [eax], 0x1008a160
  10019355:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  1001935A:  83 c0 04                        add      eax, 4
  1001935D:  a3 30 c2 08 10                  mov      dword ptr [0x1008c230], eax
  10019362:  eb 14                           jmp      0x10019378
  10019364:  8d 4d fc                        lea      ecx, [ebp - 4]
  10019367:  51                              push     ecx
  10019368:  50                              push     eax
  10019369:  b9 2c c2 08 10                  mov      ecx, 0x1008c22c
  1001936E:  e8 bd 85 fe ff                  call     0x10001930
  10019373:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  10019378:  c7 45 fc 70 a2 08 10            mov      dword ptr [ebp - 4], 0x1008a270
  1001937F:  3b 05 34 c2 08 10               cmp      eax, dword ptr [0x1008c234]
  10019385:  74 15                           je       0x1001939c
  10019387:  c7 00 70 a2 08 10               mov      dword ptr [eax], 0x1008a270
  1001938D:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  10019392:  83 c0 04                        add      eax, 4
  10019395:  a3 30 c2 08 10                  mov      dword ptr [0x1008c230], eax
  1001939A:  eb 14                           jmp      0x100193b0
  1001939C:  8d 4d fc                        lea      ecx, [ebp - 4]
  1001939F:  51                              push     ecx
  100193A0:  50                              push     eax
  100193A1:  b9 2c c2 08 10                  mov      ecx, 0x1008c22c
  100193A6:  e8 85 85 fe ff                  call     0x10001930
  100193AB:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  100193B0:  c7 45 fc 5c a0 08 10            mov      dword ptr [ebp - 4], 0x1008a05c
  100193B7:  3b 05 34 c2 08 10               cmp      eax, dword ptr [0x1008c234]
  100193BD:  74 15                           je       0x100193d4
  100193BF:  c7 00 5c a0 08 10               mov      dword ptr [eax], 0x1008a05c
  100193C5:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  100193CA:  83 c0 04                        add      eax, 4
  100193CD:  a3 30 c2 08 10                  mov      dword ptr [0x1008c230], eax
  100193D2:  eb 14                           jmp      0x100193e8
  100193D4:  8d 4d fc                        lea      ecx, [ebp - 4]
  100193D7:  51                              push     ecx
  100193D8:  50                              push     eax
  100193D9:  b9 2c c2 08 10                  mov      ecx, 0x1008c22c
  100193DE:  e8 4d 85 fe ff                  call     0x10001930
  100193E3:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  100193E8:  c7 45 fc f0 a1 08 10            mov      dword ptr [ebp - 4], 0x1008a1f0
  100193EF:  3b 05 34 c2 08 10               cmp      eax, dword ptr [0x1008c234]
  100193F5:  74 15                           je       0x1001940c
  100193F7:  c7 00 f0 a1 08 10               mov      dword ptr [eax], 0x1008a1f0
  100193FD:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  10019402:  83 c0 04                        add      eax, 4
  10019405:  a3 30 c2 08 10                  mov      dword ptr [0x1008c230], eax
  1001940A:  eb 14                           jmp      0x10019420
  1001940C:  8d 4d fc                        lea      ecx, [ebp - 4]
  1001940F:  51                              push     ecx
  10019410:  50                              push     eax
  10019411:  b9 2c c2 08 10                  mov      ecx, 0x1008c22c
  10019416:  e8 15 85 fe ff                  call     0x10001930
  1001941B:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  10019420:  c7 45 fc 48 a1 08 10            mov      dword ptr [ebp - 4], 0x1008a148
  10019427:  3b 05 34 c2 08 10               cmp      eax, dword ptr [0x1008c234]
  1001942D:  74 15                           je       0x10019444
  1001942F:  c7 00 48 a1 08 10               mov      dword ptr [eax], 0x1008a148
  10019435:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  1001943A:  83 c0 04                        add      eax, 4
  1001943D:  a3 30 c2 08 10                  mov      dword ptr [0x1008c230], eax
  10019442:  eb 14                           jmp      0x10019458
  10019444:  8d 4d fc                        lea      ecx, [ebp - 4]
  10019447:  51                              push     ecx
  10019448:  50                              push     eax
  10019449:  b9 2c c2 08 10                  mov      ecx, 0x1008c22c
  1001944E:  e8 dd 84 fe ff                  call     0x10001930
  10019453:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  10019458:  c7 45 fc 3c a2 08 10            mov      dword ptr [ebp - 4], 0x1008a23c
  1001945F:  3b 05 34 c2 08 10               cmp      eax, dword ptr [0x1008c234]
  10019465:  74 15                           je       0x1001947c
  10019467:  c7 00 3c a2 08 10               mov      dword ptr [eax], 0x1008a23c
  1001946D:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  10019472:  83 c0 04                        add      eax, 4
  10019475:  a3 30 c2 08 10                  mov      dword ptr [0x1008c230], eax
  1001947A:  eb 14                           jmp      0x10019490
  1001947C:  8d 4d fc                        lea      ecx, [ebp - 4]
  1001947F:  51                              push     ecx
  10019480:  50                              push     eax
  10019481:  b9 2c c2 08 10                  mov      ecx, 0x1008c22c
  10019486:  e8 a5 84 fe ff                  call     0x10001930
  1001948B:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  10019490:  c7 45 fc a4 a0 08 10            mov      dword ptr [ebp - 4], 0x1008a0a4
  10019497:  3b 05 34 c2 08 10               cmp      eax, dword ptr [0x1008c234]
  1001949D:  74 15                           je       0x100194b4
  1001949F:  c7 00 a4 a0 08 10               mov      dword ptr [eax], 0x1008a0a4
  100194A5:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  100194AA:  83 c0 04                        add      eax, 4
  100194AD:  a3 30 c2 08 10                  mov      dword ptr [0x1008c230], eax
  100194B2:  eb 14                           jmp      0x100194c8
  100194B4:  8d 4d fc                        lea      ecx, [ebp - 4]
  100194B7:  51                              push     ecx
  100194B8:  50                              push     eax
  100194B9:  b9 2c c2 08 10                  mov      ecx, 0x1008c22c
  100194BE:  e8 6d 84 fe ff                  call     0x10001930
  100194C3:  a1 30 c2 08 10                  mov      eax, dword ptr [0x1008c230]
  100194C8:  c7 45 fc 08 a2 08 10            mov      dword ptr [ebp - 4], 0x1008a208
  100194CF:  3b 05 34 c2 08 10               cmp      eax, dword ptr [0x1008c234]
  100194D5:  74 0f                           je       0x100194e6
  100194D7:  c7 00 08 a2 08 10               mov      dword ptr [eax], 0x1008a208
  100194DD:  83 05 30 c2 08 10 04            add      dword ptr [0x1008c230], 4
  100194E4:  eb 0f                           jmp      0x100194f5
  100194E6:  8d 55 fc                        lea      edx, [ebp - 4]
  100194E9:  b9 2c c2 08 10                  mov      ecx, 0x1008c22c
  100194EE:  52                              push     edx
  100194EF:  50                              push     eax
  100194F0:  e8 3b 84 fe ff                  call     0x10001930
  100194F5:  6a 00                           push     0
  100194F7:  e8 b4 8f 00 00                  call     0x100224b0  ; Scanner::Initialize
  100194FC:  e8 6f 15 00 00                  call     0x1001aa70  ; Hook::Initialize
  10019501:  6a f7                           push     -9
  10019503:  6a 00                           push     0
  10019505:  68 a4 23 05 10                  push     0x100523a4  ; "!s_context"
  1001950A:  68 b0 23 05 10                  push     0x100523b0  ; "GmContext.cpp"
  1001950F:  e8 4c 88 00 00                  call     0x10021d60  ; Scanner::FindAssertion
  10019514:  8b f0                           mov      esi, eax
  10019516:  83 c4 14                        add      esp, 0x14
  10019519:  85 f6                           test     esi, esi
  1001951B:  74 17                           je       0x10019534
  1001951D:  6a 02                           push     2
  1001951F:  ff 36                           push     dword ptr [esi]
  10019521:  e8 aa 8f 00 00                  call     0x100224d0  ; Scanner::IsValidPtr
  10019526:  83 c4 08                        add      esp, 8
  10019529:  84 c0                           test     al, al
  1001952B:  74 07                           je       0x10019534
  1001952D:  8b 06                           mov      eax, dword ptr [esi]
  1001952F:  a3 3c c2 08 10                  mov      dword ptr [0x1008c23c], eax
  10019534:  6a 34                           push     0x34
  10019536:  6a 00                           push     0
  10019538:  68 c0 23 05 10                  push     0x100523c0  ; "!s_scene"
  1001953D:  68 cc 23 05 10                  push     0x100523cc  ; "UiPregame.cpp"
  10019542:  e8 19 88 00 00                  call     0x10021d60  ; Scanner::FindAssertion
  10019547:  8b f0                           mov      esi, eax
  10019549:  83 c4 10                        add      esp, 0x10
  1001954C:  85 f6                           test     esi, esi
  1001954E:  74 17                           je       0x10019567
  10019550:  6a 02                           push     2
  10019552:  ff 36                           push     dword ptr [esi]
  10019554:  e8 77 8f 00 00                  call     0x100224d0  ; Scanner::IsValidPtr
  10019559:  83 c4 08                        add      esp, 8
  1001955C:  84 c0                           test     al, al
  1001955E:  74 07                           je       0x10019567
  10019560:  8b 06                           mov      eax, dword ptr [esi]
  10019562:  a3 38 c2 08 10                  mov      dword ptr [0x1008c238], eax
  10019567:  6a 00                           push     0
  10019569:  6a 02                           push     2
  1001956B:  68 dc 23 05 10                  push     0x100523dc  ; "xx????xxxxxxx"
  10019570:  68 ec 23 05 10                  push     0x100523ec
  10019575:  e8 96 87 00 00                  call     0x10021d10  ; Scanner::Find
  1001957A:  8b f0                           mov      esi, eax
  1001957C:  83 c4 10                        add      esp, 0x10
  1001957F:  85 f6                           test     esi, esi
  10019581:  74 17                           je       0x1001959a
  10019583:  6a 02                           push     2
  10019585:  ff 36                           push     dword ptr [esi]
  10019587:  e8 44 8f 00 00                  call     0x100224d0  ; Scanner::IsValidPtr
  1001958C:  83 c4 08                        add      esp, 8
  1001958F:  84 c0                           test     al, al
  10019591:  74 07                           je       0x1001959a
  10019593:  8b 06                           mov      eax, dword ptr [esi]
  10019595:  a3 40 c2 08 10                  mov      dword ptr [0x1008c240], eax
  1001959A:  8b 3d 30 c2 08 10               mov      edi, dword ptr [0x1008c230]
  100195A0:  8b 35 2c c2 08 10               mov      esi, dword ptr [0x1008c22c]
  100195A6:  3b f7                           cmp      esi, edi
  100195A8:  74 18                           je       0x100195c2
  100195AA:  66 0f 1f 44 00 00               nop      word ptr [eax + eax]
  100195B0:  8b 06                           mov      eax, dword ptr [esi]
  100195B2:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  100195B5:  85 c0                           test     eax, eax
  100195B7:  74 02                           je       0x100195bb
  100195B9:  ff d0                           call     eax
  100195BB:  83 c6 04                        add      esi, 4
  100195BE:  3b f7                           cmp      esi, edi
  100195C0:  75 ee                           jne      0x100195b0
  100195C2:  6a 00                           push     0
  100195C4:  83 ec 28                        sub      esp, 0x28
  100195C7:  8b c4                           mov      eax, esp
  100195C9:  c7 00 28 24 05 10               mov      dword ptr [eax], 0x10052428
  100195CF:  c7 40 04 30 96 01 10            mov      dword ptr [eax + 4], 0x10019630
  100195D6:  89 40 24                        mov      dword ptr [eax + 0x24], eax
  100195D9:  e8 62 0a 00 00                  call     0x1001a040  ; GameThread::Enqueue
  100195DE:  e8 fc 79 01 00                  call     0x10030fdf
  100195E3:  50                              push     eax
  100195E4:  e8 1a 79 01 00                  call     0x10030f03
  100195E9:  6a 00                           push     0
  100195EB:  c6 05 44 c2 08 10 01            mov      byte ptr [0x1008c244], 1
  100195F2:  e8 49 14 00 00                  call     0x1001aa40  ; Hook::EnableHooks
  100195F7:  8b 3d 30 c2 08 10               mov      edi, dword ptr [0x1008c230]
  100195FD:  83 c4 34                        add      esp, 0x34
  10019600:  8b 35 2c c2 08 10               mov      esi, dword ptr [0x1008c22c]
  10019606:  3b f7                           cmp      esi, edi
  10019608:  74 18                           je       0x10019622
  1001960A:  66 0f 1f 44 00 00               nop      word ptr [eax + eax]
  10019610:  8b 06                           mov      eax, dword ptr [esi]
  10019612:  8b 40 10                        mov      eax, dword ptr [eax + 0x10]
  10019615:  85 c0                           test     eax, eax
  10019617:  74 02                           je       0x1001961b
  10019619:  ff d0                           call     eax
  1001961B:  83 c6 04                        add      esi, 4
  1001961E:  3b f7                           cmp      esi, edi
  10019620:  75 ee                           jne      0x10019610
  10019622:  e8 69 4f 00 00                  call     0x1001e590  ; MemoryPatcher::EnableHooks
  10019627:  5f                              pop      edi
  10019628:  b0 01                           mov      al, 1
  1001962A:  5e                              pop      esi
  1001962B:  8b e5                           mov      esp, ebp
  1001962D:  5d                              pop      ebp
  1001962E:  c3                              ret      


; === GW::Terminate ===
; RVA: 0x00019670  Size: 135 bytes
; Exports: ?Terminate@GW@@YAXXZ
;
  10019670:  80 3d 44 c2 08 10 00            cmp      byte ptr [0x1008c244], 0
  10019677:  74 7d                           je       0x100196f6
  10019679:  56                              push     esi
  1001967A:  57                              push     edi
  1001967B:  e8 60 f8 ff ff                  call     0x10018ee0  ; GW::DisableHooks
  10019680:  8b 3d 30 c2 08 10               mov      edi, dword ptr [0x1008c230]
  10019686:  8b 35 2c c2 08 10               mov      esi, dword ptr [0x1008c22c]
  1001968C:  3b f7                           cmp      esi, edi
  1001968E:  74 12                           je       0x100196a2
  10019690:  8b 06                           mov      eax, dword ptr [esi]
  10019692:  8b 40 0c                        mov      eax, dword ptr [eax + 0xc]
  10019695:  85 c0                           test     eax, eax
  10019697:  74 02                           je       0x1001969b
  10019699:  ff d0                           call     eax
  1001969B:  83 c6 04                        add      esi, 4
  1001969E:  3b f7                           cmp      esi, edi
  100196A0:  75 ee                           jne      0x10019690
  100196A2:  8b 3d 28 c0 04 10               mov      edi, dword ptr [0x1004c028]
  100196A8:  33 f6                           xor      esi, esi
  100196AA:  66 0f 1f 44 00 00               nop      word ptr [eax + eax]
  100196B0:  e8 ab 13 00 00                  call     0x1001aa60  ; Hook::GetInHookCount
  100196B5:  85 c0                           test     eax, eax
  100196B7:  74 0a                           je       0x100196c3
  100196B9:  6a 10                           push     0x10
  100196BB:  ff d7                           call     edi
  100196BD:  46                              inc      esi
  100196BE:  83 fe 0a                        cmp      esi, 0xa
  100196C1:  72 ed                           jb       0x100196b0
  100196C3:  e8 98 13 00 00                  call     0x1001aa60  ; Hook::GetInHookCount
  100196C8:  5f                              pop      edi
  100196C9:  5e                              pop      esi
  100196CA:  85 c0                           test     eax, eax
  100196CC:  74 1c                           je       0x100196ea
  100196CE:  68 fc 23 05 10                  push     0x100523fc  ; "GW::Terminate"
  100196D3:  68 a6 00 00 00                  push     0xa6
  100196D8:  68 70 23 05 10                  push     0x10052370  ; "C:\GitRepositories\GWCA\Source\GWCA.cpp"
  100196DD:  68 0c 24 05 10                  push     0x1005240c  ; "!Hook::GetInHookCount()"
  100196E2:  e8 89 c1 fe ff                  call     0x10005870  ; GW::FatalAssert
  100196E7:  83 c4 10                        add      esp, 0x10
  100196EA:  e8 21 13 00 00                  call     0x1001aa10  ; Hook::Deinitialize
  100196EF:  c6 05 44 c2 08 10 00            mov      byte ptr [0x1008c244], 0
  100196F6:  c3                              ret      


; === GW::GetDistance ===
; RVA: 0x00019770  Size: 102 bytes
; Exports: ?GetDistance@GW@@YAMABUVec2f@1@0@Z
;
  10019770:  55                              push     ebp
  10019771:  8b ec                           mov      ebp, esp
  10019773:  83 e4 f8                        and      esp, 0xfffffff8
  10019776:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10019779:  83 ec 08                        sub      esp, 8
  1001977C:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  1001977F:  f3 0f 10 09                     movss    xmm1, dword ptr [ecx]
  10019783:  f3 0f 10 41 04                  movss    xmm0, dword ptr [ecx + 4]
  10019788:  f3 0f 5c 40 04                  subss    xmm0, dword ptr [eax + 4]
  1001978D:  f3 0f 5c 08                     subss    xmm1, dword ptr [eax]
  10019791:  f3 0f 59 c0                     mulss    xmm0, xmm0
  10019795:  f3 0f 59 c9                     mulss    xmm1, xmm1
  10019799:  f3 0f 58 c1                     addss    xmm0, xmm1
  1001979D:  0f 57 c9                        xorps    xmm1, xmm1
  100197A0:  0f 5a c0                        cvtps2pd xmm0, xmm0
  100197A3:  66 0f 2e c8                     ucomisd  xmm1, xmm0
  100197A7:  77 16                           ja       0x100197bf
  100197A9:  f2 0f 51 c0                     sqrtsd   xmm0, xmm0
  100197AD:  f2 0f 5a c0                     cvtsd2ss xmm0, xmm0
  100197B1:  f3 0f 11 44 24 04               movss    dword ptr [esp + 4], xmm0
  100197B7:  d9 44 24 04                     fld      dword ptr [esp + 4]
  100197BB:  8b e5                           mov      esp, ebp
  100197BD:  5d                              pop      ebp
  100197BE:  c3                              ret      
  100197BF:  e8 0c 7c 01 00                  call     0x100313d0
  100197C4:  f2 0f 5a c0                     cvtsd2ss xmm0, xmm0
  100197C8:  f3 0f 11 44 24 04               movss    dword ptr [esp + 4], xmm0
  100197CE:  d9 44 24 04                     fld      dword ptr [esp + 4]
  100197D2:  8b e5                           mov      esp, ebp
  100197D4:  5d                              pop      ebp
  100197D5:  c3                              ret      


; === GW::GetDistance ===
; RVA: 0x000197E0  Size: 116 bytes
; Exports: ?GetDistance@GW@@YAMUVec3f@1@0@Z
;
  100197E0:  55                              push     ebp
  100197E1:  8b ec                           mov      ebp, esp
  100197E3:  83 e4 f8                        and      esp, 0xfffffff8
  100197E6:  f3 0f 10 4d 08                  movss    xmm1, dword ptr [ebp + 8]
  100197EB:  83 ec 08                        sub      esp, 8
  100197EE:  f3 0f 10 55 0c                  movss    xmm2, dword ptr [ebp + 0xc]
  100197F3:  f3 0f 5c 55 18                  subss    xmm2, dword ptr [ebp + 0x18]
  100197F8:  f3 0f 5c 4d 14                  subss    xmm1, dword ptr [ebp + 0x14]
  100197FD:  f3 0f 10 45 10                  movss    xmm0, dword ptr [ebp + 0x10]
  10019802:  f3 0f 5c 45 1c                  subss    xmm0, dword ptr [ebp + 0x1c]
  10019807:  f3 0f 59 d2                     mulss    xmm2, xmm2
  1001980B:  f3 0f 59 c9                     mulss    xmm1, xmm1
  1001980F:  f3 0f 59 c0                     mulss    xmm0, xmm0
  10019813:  f3 0f 58 d1                     addss    xmm2, xmm1
  10019817:  0f 57 c9                        xorps    xmm1, xmm1
  1001981A:  f3 0f 58 d0                     addss    xmm2, xmm0
  1001981E:  0f 5a c2                        cvtps2pd xmm0, xmm2
  10019821:  66 0f 2e c8                     ucomisd  xmm1, xmm0
  10019825:  77 16                           ja       0x1001983d
  10019827:  f2 0f 51 c0                     sqrtsd   xmm0, xmm0
  1001982B:  f2 0f 5a c0                     cvtsd2ss xmm0, xmm0
  1001982F:  f3 0f 11 44 24 04               movss    dword ptr [esp + 4], xmm0
  10019835:  d9 44 24 04                     fld      dword ptr [esp + 4]
  10019839:  8b e5                           mov      esp, ebp
  1001983B:  5d                              pop      ebp
  1001983C:  c3                              ret      
  1001983D:  e8 8e 7b 01 00                  call     0x100313d0
  10019842:  f2 0f 5a c0                     cvtsd2ss xmm0, xmm0
  10019846:  f3 0f 11 44 24 04               movss    dword ptr [esp + 4], xmm0
  1001984C:  d9 44 24 04                     fld      dword ptr [esp + 4]
  10019850:  8b e5                           mov      esp, ebp
  10019852:  5d                              pop      ebp
  10019853:  c3                              ret      


; === GW::GetNorm ===
; RVA: 0x00019860  Size: 88 bytes
; Exports: ?GetNorm@GW@@YAMUVec2f@1@@Z
;
  10019860:  55                              push     ebp
  10019861:  8b ec                           mov      ebp, esp
  10019863:  83 e4 f8                        and      esp, 0xfffffff8
  10019866:  f3 0f 10 4d 0c                  movss    xmm1, dword ptr [ebp + 0xc]
  1001986B:  83 ec 08                        sub      esp, 8
  1001986E:  f3 0f 10 45 08                  movss    xmm0, dword ptr [ebp + 8]
  10019873:  f3 0f 59 c9                     mulss    xmm1, xmm1
  10019877:  f3 0f 59 c0                     mulss    xmm0, xmm0
  1001987B:  f3 0f 58 c8                     addss    xmm1, xmm0
  1001987F:  0f 5a c1                        cvtps2pd xmm0, xmm1
  10019882:  0f 57 c9                        xorps    xmm1, xmm1
  10019885:  66 0f 2e c8                     ucomisd  xmm1, xmm0
  10019889:  77 16                           ja       0x100198a1
  1001988B:  f2 0f 51 c0                     sqrtsd   xmm0, xmm0
  1001988F:  f2 0f 5a c0                     cvtsd2ss xmm0, xmm0
  10019893:  f3 0f 11 44 24 04               movss    dword ptr [esp + 4], xmm0
  10019899:  d9 44 24 04                     fld      dword ptr [esp + 4]
  1001989D:  8b e5                           mov      esp, ebp
  1001989F:  5d                              pop      ebp
  100198A0:  c3                              ret      
  100198A1:  e8 2a 7b 01 00                  call     0x100313d0
  100198A6:  f2 0f 5a c0                     cvtsd2ss xmm0, xmm0
  100198AA:  f3 0f 11 44 24 04               movss    dword ptr [esp + 4], xmm0
  100198B0:  d9 44 24 04                     fld      dword ptr [esp + 4]
  100198B4:  8b e5                           mov      esp, ebp
  100198B6:  5d                              pop      ebp
  100198B7:  c3                              ret      


; === GW::GetNorm ===
; RVA: 0x000198C0  Size: 101 bytes
; Exports: ?GetNorm@GW@@YAMUVec3f@1@@Z
;
  100198C0:  55                              push     ebp
  100198C1:  8b ec                           mov      ebp, esp
  100198C3:  83 e4 f8                        and      esp, 0xfffffff8
  100198C6:  f3 0f 10 4d 0c                  movss    xmm1, dword ptr [ebp + 0xc]
  100198CB:  83 ec 08                        sub      esp, 8
  100198CE:  f3 0f 10 45 08                  movss    xmm0, dword ptr [ebp + 8]
  100198D3:  f3 0f 59 c0                     mulss    xmm0, xmm0
  100198D7:  f3 0f 59 c9                     mulss    xmm1, xmm1
  100198DB:  f3 0f 58 c8                     addss    xmm1, xmm0
  100198DF:  f3 0f 10 45 10                  movss    xmm0, dword ptr [ebp + 0x10]
  100198E4:  f3 0f 59 c0                     mulss    xmm0, xmm0
  100198E8:  f3 0f 58 c8                     addss    xmm1, xmm0
  100198EC:  0f 5a c1                        cvtps2pd xmm0, xmm1
  100198EF:  0f 57 c9                        xorps    xmm1, xmm1
  100198F2:  66 0f 2e c8                     ucomisd  xmm1, xmm0
  100198F6:  77 16                           ja       0x1001990e
  100198F8:  f2 0f 51 c0                     sqrtsd   xmm0, xmm0
  100198FC:  f2 0f 5a c0                     cvtsd2ss xmm0, xmm0
  10019900:  f3 0f 11 44 24 04               movss    dword ptr [esp + 4], xmm0
  10019906:  d9 44 24 04                     fld      dword ptr [esp + 4]
  1001990A:  8b e5                           mov      esp, ebp
  1001990C:  5d                              pop      ebp
  1001990D:  c3                              ret      
  1001990E:  e8 bd 7a 01 00                  call     0x100313d0
  10019913:  f2 0f 5a c0                     cvtsd2ss xmm0, xmm0
  10019917:  f3 0f 11 44 24 04               movss    dword ptr [esp + 4], xmm0
  1001991D:  d9 44 24 04                     fld      dword ptr [esp + 4]
  10019921:  8b e5                           mov      esp, ebp
  10019923:  5d                              pop      ebp
  10019924:  c3                              ret      


; === GW::Rotate ===
; RVA: 0x00019930  Size: 101 bytes
; Exports: ?Rotate@GW@@YA?AUVec2f@1@U21@M@Z
;
  10019930:  55                              push     ebp
  10019931:  8b ec                           mov      ebp, esp
  10019933:  51                              push     ecx
  10019934:  f3 0f 10 45 14                  movss    xmm0, dword ptr [ebp + 0x14]
  10019939:  0f 5a c0                        cvtps2pd xmm0, xmm0
  1001993C:  e8 bf 78 01 00                  call     0x10031200
  10019941:  f2 0f 5a c0                     cvtsd2ss xmm0, xmm0
  10019945:  f3 0f 11 45 fc                  movss    dword ptr [ebp - 4], xmm0
  1001994A:  f3 0f 10 45 14                  movss    xmm0, dword ptr [ebp + 0x14]
  1001994F:  0f 5a c0                        cvtps2pd xmm0, xmm0
  10019952:  e8 e9 76 01 00                  call     0x10031040
  10019957:  f3 0f 10 6d fc                  movss    xmm5, dword ptr [ebp - 4]
  1001995C:  0f 57 e4                        xorps    xmm4, xmm4
  1001995F:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10019962:  f2 0f 5a e0                     cvtsd2ss xmm4, xmm0
  10019966:  0f 28 c5                        movaps   xmm0, xmm5
  10019969:  f3 0f 59 6d 0c                  mulss    xmm5, dword ptr [ebp + 0xc]
  1001996E:  f3 0f 59 45 10                  mulss    xmm0, dword ptr [ebp + 0x10]
  10019973:  0f 28 d4                        movaps   xmm2, xmm4
  10019976:  f3 0f 59 55 0c                  mulss    xmm2, dword ptr [ebp + 0xc]
  1001997B:  f3 0f 59 65 10                  mulss    xmm4, dword ptr [ebp + 0x10]
  10019980:  f3 0f 5c d0                     subss    xmm2, xmm0
  10019984:  f3 0f 58 e5                     addss    xmm4, xmm5
  10019988:  f3 0f 11 10                     movss    dword ptr [eax], xmm2
  1001998C:  f3 0f 11 60 04                  movss    dword ptr [eax + 4], xmm4
  10019991:  8b e5                           mov      esp, ebp
  10019993:  5d                              pop      ebp
  10019994:  c3                              ret      


; === GW::Hash16 ===
; RVA: 0x0001A7D0  Size: 85 bytes
; Exports: ?Hash16@GW@@YAIG@Z
;
  1001A7D0:  55                              push     ebp
  1001A7D1:  8b ec                           mov      ebp, esp
  1001A7D3:  0f b6 0d f3 a0 08 10            movzx    ecx, byte ptr [0x1008a0f3]
  1001A7DA:  66 8b 55 08                     mov      dx, word ptr [ebp + 8]
  1001A7DE:  56                              push     esi
  1001A7DF:  0f b6 c2                        movzx    eax, dl
  1001A7E2:  8b 34 8d 60 25 05 10            mov      esi, dword ptr [ecx*4 + 0x10052560]
  1001A7E9:  33 34 85 60 25 05 10            xor      esi, dword ptr [eax*4 + 0x10052560]
  1001A7F0:  a1 f0 a0 08 10                  mov      eax, dword ptr [0x1008a0f0]
  1001A7F5:  c1 e8 06                        shr      eax, 6
  1001A7F8:  33 f0                           xor      esi, eax
  1001A7FA:  0f b7 c2                        movzx    eax, dx
  1001A7FD:  03 35 f0 a0 08 10               add      esi, dword ptr [0x1008a0f0]
  1001A803:  c1 e8 08                        shr      eax, 8
  1001A806:  8b ce                           mov      ecx, esi
  1001A808:  c1 e9 18                        shr      ecx, 0x18
  1001A80B:  8b 04 85 60 25 05 10            mov      eax, dword ptr [eax*4 + 0x10052560]
  1001A812:  33 04 8d 60 25 05 10            xor      eax, dword ptr [ecx*4 + 0x10052560]
  1001A819:  8b ce                           mov      ecx, esi
  1001A81B:  c1 e9 06                        shr      ecx, 6
  1001A81E:  33 c1                           xor      eax, ecx
  1001A820:  03 c6                           add      eax, esi
  1001A822:  5e                              pop      esi
  1001A823:  5d                              pop      ebp
  1001A824:  c3                              ret      


; === GW::Hash32 ===
; RVA: 0x0001A830  Size: 155 bytes
; Exports: ?Hash32@GW@@YAII@Z
;
  1001A830:  55                              push     ebp
  1001A831:  8b ec                           mov      ebp, esp
  1001A833:  0f b6 0d f3 a0 08 10            movzx    ecx, byte ptr [0x1008a0f3]
  1001A83A:  53                              push     ebx
  1001A83B:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  1001A83E:  56                              push     esi
  1001A83F:  8b 34 8d 60 25 05 10            mov      esi, dword ptr [ecx*4 + 0x10052560]
  1001A846:  0f b6 c3                        movzx    eax, bl
  1001A849:  33 34 85 60 25 05 10            xor      esi, dword ptr [eax*4 + 0x10052560]
  1001A850:  a1 f0 a0 08 10                  mov      eax, dword ptr [0x1008a0f0]
  1001A855:  c1 e8 06                        shr      eax, 6
  1001A858:  33 f0                           xor      esi, eax
  1001A85A:  8b c3                           mov      eax, ebx
  1001A85C:  03 35 f0 a0 08 10               add      esi, dword ptr [0x1008a0f0]
  1001A862:  c1 e8 08                        shr      eax, 8
  1001A865:  8b ce                           mov      ecx, esi
  1001A867:  0f b6 c0                        movzx    eax, al
  1001A86A:  c1 e9 18                        shr      ecx, 0x18
  1001A86D:  8b 14 85 60 25 05 10            mov      edx, dword ptr [eax*4 + 0x10052560]
  1001A874:  8b c6                           mov      eax, esi
  1001A876:  33 14 8d 60 25 05 10            xor      edx, dword ptr [ecx*4 + 0x10052560]
  1001A87D:  c1 e8 06                        shr      eax, 6
  1001A880:  33 d0                           xor      edx, eax
  1001A882:  8b c3                           mov      eax, ebx
  1001A884:  c1 e8 10                        shr      eax, 0x10
  1001A887:  03 f2                           add      esi, edx
  1001A889:  0f b6 c0                        movzx    eax, al
  1001A88C:  8b ce                           mov      ecx, esi
  1001A88E:  c1 e9 18                        shr      ecx, 0x18
  1001A891:  c1 eb 18                        shr      ebx, 0x18
  1001A894:  8b 14 85 60 25 05 10            mov      edx, dword ptr [eax*4 + 0x10052560]
  1001A89B:  8b c6                           mov      eax, esi
  1001A89D:  33 14 8d 60 25 05 10            xor      edx, dword ptr [ecx*4 + 0x10052560]
  1001A8A4:  c1 e8 06                        shr      eax, 6
  1001A8A7:  33 d0                           xor      edx, eax
  1001A8A9:  03 f2                           add      esi, edx
  1001A8AB:  8b c6                           mov      eax, esi
  1001A8AD:  8b ce                           mov      ecx, esi
  1001A8AF:  c1 e8 18                        shr      eax, 0x18
  1001A8B2:  c1 e9 06                        shr      ecx, 6
  1001A8B5:  8b 04 85 60 25 05 10            mov      eax, dword ptr [eax*4 + 0x10052560]
  1001A8BC:  33 04 9d 60 25 05 10            xor      eax, dword ptr [ebx*4 + 0x10052560]
  1001A8C3:  33 c1                           xor      eax, ecx
  1001A8C5:  03 c6                           add      eax, esi
  1001A8C7:  5e                              pop      esi
  1001A8C8:  5b                              pop      ebx
  1001A8C9:  5d                              pop      ebp
  1001A8CA:  c3                              ret      


; === GW::Hash8 ===
; RVA: 0x0001A8D0  Size: 47 bytes
; Exports: ?Hash8@GW@@YAIE@Z
;
  1001A8D0:  55                              push     ebp
  1001A8D1:  8b ec                           mov      ebp, esp
  1001A8D3:  0f b6 05 f3 a0 08 10            movzx    eax, byte ptr [0x1008a0f3]
  1001A8DA:  0f b6 4d 08                     movzx    ecx, byte ptr [ebp + 8]
  1001A8DE:  8b 04 85 60 25 05 10            mov      eax, dword ptr [eax*4 + 0x10052560]
  1001A8E5:  33 04 8d 60 25 05 10            xor      eax, dword ptr [ecx*4 + 0x10052560]
  1001A8EC:  8b 0d f0 a0 08 10               mov      ecx, dword ptr [0x1008a0f0]
  1001A8F2:  c1 e9 06                        shr      ecx, 6
  1001A8F5:  33 c1                           xor      eax, ecx
  1001A8F7:  03 05 f0 a0 08 10               add      eax, dword ptr [0x1008a0f0]
  1001A8FD:  5d                              pop      ebp
  1001A8FE:  c3                              ret      


; === GW::Hash ===
; RVA: 0x0001A900  Size: 65 bytes
; Exports: ?Hash@GW@@YAIPBXI@Z
;
  1001A900:  55                              push     ebp
  1001A901:  8b ec                           mov      ebp, esp
  1001A903:  a1 f0 a0 08 10                  mov      eax, dword ptr [0x1008a0f0]
  1001A908:  53                              push     ebx
  1001A909:  8b 5d 0c                        mov      ebx, dword ptr [ebp + 0xc]
  1001A90C:  57                              push     edi
  1001A90D:  33 ff                           xor      edi, edi
  1001A90F:  85 db                           test     ebx, ebx
  1001A911:  74 2a                           je       0x1001a93d
  1001A913:  56                              push     esi
  1001A914:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001A917:  8b d0                           mov      edx, eax
  1001A919:  c1 ea 18                        shr      edx, 0x18
  1001A91C:  0f b6 0c 39                     movzx    ecx, byte ptr [ecx + edi]
  1001A920:  47                              inc      edi
  1001A921:  8b 34 8d 60 25 05 10            mov      esi, dword ptr [ecx*4 + 0x10052560]
  1001A928:  8b c8                           mov      ecx, eax
  1001A92A:  33 34 95 60 25 05 10            xor      esi, dword ptr [edx*4 + 0x10052560]
  1001A931:  c1 e9 06                        shr      ecx, 6
  1001A934:  33 f1                           xor      esi, ecx
  1001A936:  03 c6                           add      eax, esi
  1001A938:  3b fb                           cmp      edi, ebx
  1001A93A:  72 d8                           jb       0x1001a914
  1001A93C:  5e                              pop      esi
  1001A93D:  5f                              pop      edi
  1001A93E:  5b                              pop      ebx
  1001A93F:  5d                              pop      ebp
  1001A940:  c3                              ret      


; === GW::HashWString ===
; RVA: 0x0001A950  Size: 124 bytes
; Exports: ?HashWString@GW@@YAIPB_WI@Z
;
  1001A950:  55                              push     ebp
  1001A951:  8b ec                           mov      ebp, esp
  1001A953:  83 ec 08                        sub      esp, 8
  1001A956:  a1 f4 a0 08 10                  mov      eax, dword ptr [0x1008a0f4]
  1001A95B:  53                              push     ebx
  1001A95C:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  1001A95F:  56                              push     esi
  1001A960:  8b 35 f0 a0 08 10               mov      esi, dword ptr [0x1008a0f0]
  1001A966:  57                              push     edi
  1001A967:  33 ff                           xor      edi, edi
  1001A969:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001A96C:  a1 f8 a0 08 10                  mov      eax, dword ptr [0x1008a0f8]
  1001A971:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  1001A974:  39 7d 0c                        cmp      dword ptr [ebp + 0xc], edi
  1001A977:  76 4a                           jbe      0x1001a9c3
  1001A979:  0f 1f 80 00 00 00 00            nop      dword ptr [eax]
  1001A980:  85 db                           test     ebx, ebx
  1001A982:  74 3f                           je       0x1001a9c3
  1001A984:  0f b7 04 7b                     movzx    eax, word ptr [ebx + edi*2]
  1001A988:  66 85 c0                        test     ax, ax
  1001A98B:  74 36                           je       0x1001a9c3
  1001A98D:  8b c8                           mov      ecx, eax
  1001A98F:  8d 41 9f                        lea      eax, [ecx - 0x61]
  1001A992:  83 f8 19                        cmp      eax, 0x19
  1001A995:  8d 51 e0                        lea      edx, [ecx - 0x20]
  1001A998:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  1001A99B:  0f 47 d1                        cmova    edx, ecx
  1001A99E:  c1 e0 03                        shl      eax, 3
  1001A9A1:  33 c2                           xor      eax, edx
  1001A9A3:  47                              inc      edi
  1001A9A4:  8b 55 f8                        mov      edx, dword ptr [ebp - 8]
  1001A9A7:  8b c8                           mov      ecx, eax
  1001A9A9:  83 e1 0f                        and      ecx, 0xf
  1001A9AC:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001A9AF:  03 14 8d 60 29 05 10            add      edx, dword ptr [ecx*4 + 0x10052960]
  1001A9B6:  89 55 f8                        mov      dword ptr [ebp - 8], edx
  1001A9B9:  8d 0c 02                        lea      ecx, [edx + eax]
  1001A9BC:  33 f1                           xor      esi, ecx
  1001A9BE:  3b 7d 0c                        cmp      edi, dword ptr [ebp + 0xc]
  1001A9C1:  72 bd                           jb       0x1001a980
  1001A9C3:  5f                              pop      edi
  1001A9C4:  8b c6                           mov      eax, esi
  1001A9C6:  5e                              pop      esi
  1001A9C7:  5b                              pop      ebx
  1001A9C8:  8b e5                           mov      esp, ebp
  1001A9CA:  5d                              pop      ebp
  1001A9CB:  c3                              ret      


