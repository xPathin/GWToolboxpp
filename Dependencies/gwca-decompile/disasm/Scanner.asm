; Module: Scanner
; Functions: 14
; Total code size: 2530 bytes
;

; === Scanner::Find ===
; RVA: 0x00021D10  Size: 72 bytes
; Exports: ?Find@Scanner@GW@@YAIPBD0HW4ScannerSection@2@@Z
;
  10021D10:  55                              push     ebp
  10021D11:  8b ec                           mov      ebp, esp
  10021D13:  0f b6 4d 14                     movzx    ecx, byte ptr [ebp + 0x14]
  10021D17:  8b 04 cd 88 c4 08 10            mov      eax, dword ptr [ecx*8 + 0x1008c488]
  10021D1E:  8b 14 cd 84 c4 08 10            mov      edx, dword ptr [ecx*8 + 0x1008c484]
  10021D25:  8b 0d 80 c4 08 10               mov      ecx, dword ptr [0x1008c480]
  10021D2B:  03 c1                           add      eax, ecx
  10021D2D:  50                              push     eax
  10021D2E:  8d 04 11                        lea      eax, [ecx + edx]
  10021D31:  b9 60 c4 08 10                  mov      ecx, 0x1008c460
  10021D36:  50                              push     eax
  10021D37:  ff 75 10                        push     dword ptr [ebp + 0x10]
  10021D3A:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10021D3D:  ff 75 08                        push     dword ptr [ebp + 8]
  10021D40:  e8 db 14 ff ff                  call     0x10013220
  10021D45:  8b c8                           mov      ecx, eax
  10021D47:  33 c0                           xor      eax, eax
  10021D49:  8b d1                           mov      edx, ecx
  10021D4B:  2b 15 80 c4 08 10               sub      edx, dword ptr [0x1008c480]
  10021D51:  85 c9                           test     ecx, ecx
  10021D53:  0f 45 c2                        cmovne   eax, edx
  10021D56:  5d                              pop      ebp
  10021D57:  c3                              ret      


; === Scanner::FindAssertion ===
; RVA: 0x00021D60  Size: 44 bytes
; Exports: ?FindAssertion@Scanner@GW@@YAIPBD0IH@Z
;
  10021D60:  55                              push     ebp
  10021D61:  8b ec                           mov      ebp, esp
  10021D63:  ff 75 14                        push     dword ptr [ebp + 0x14]
  10021D66:  b9 60 c4 08 10                  mov      ecx, 0x1008c460
  10021D6B:  ff 75 10                        push     dword ptr [ebp + 0x10]
  10021D6E:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10021D71:  ff 75 08                        push     dword ptr [ebp + 8]
  10021D74:  e8 e7 0f ff ff                  call     0x10012d60
  10021D79:  8b c8                           mov      ecx, eax
  10021D7B:  33 c0                           xor      eax, eax
  10021D7D:  8b d1                           mov      edx, ecx
  10021D7F:  2b 15 80 c4 08 10               sub      edx, dword ptr [0x1008c480]
  10021D85:  85 c9                           test     ecx, ecx
  10021D87:  0f 45 c2                        cmovne   eax, edx
  10021D8A:  5d                              pop      ebp
  10021D8B:  c3                              ret      


; === Scanner::FindInRange ===
; RVA: 0x00021D90  Size: 61 bytes
; Exports: ?FindInRange@Scanner@GW@@YAIPBD0HKK@Z
;
  10021D90:  55                              push     ebp
  10021D91:  8b ec                           mov      ebp, esp
  10021D93:  8b 45 18                        mov      eax, dword ptr [ebp + 0x18]
  10021D96:  b9 60 c4 08 10                  mov      ecx, 0x1008c460
  10021D9B:  03 05 80 c4 08 10               add      eax, dword ptr [0x1008c480]
  10021DA1:  50                              push     eax
  10021DA2:  8b 45 14                        mov      eax, dword ptr [ebp + 0x14]
  10021DA5:  03 05 80 c4 08 10               add      eax, dword ptr [0x1008c480]
  10021DAB:  50                              push     eax
  10021DAC:  ff 75 10                        push     dword ptr [ebp + 0x10]
  10021DAF:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10021DB2:  ff 75 08                        push     dword ptr [ebp + 8]
  10021DB5:  e8 66 14 ff ff                  call     0x10013220
  10021DBA:  8b c8                           mov      ecx, eax
  10021DBC:  33 c0                           xor      eax, eax
  10021DBE:  8b d1                           mov      edx, ecx
  10021DC0:  2b 15 80 c4 08 10               sub      edx, dword ptr [0x1008c480]
  10021DC6:  85 c9                           test     ecx, ecx
  10021DC8:  0f 45 c2                        cmovne   eax, edx
  10021DCB:  5d                              pop      ebp
  10021DCC:  c3                              ret      


; === Scanner::FindNthUseOfString ===
; RVA: 0x00021DD0  Size: 872 bytes
; Exports: ?FindNthUseOfString@Scanner@GW@@YAIPBDIHW4ScannerSection@2@@Z
;
  10021DD0:  55                              push     ebp
  10021DD1:  8b ec                           mov      ebp, esp
  10021DD3:  6a ff                           push     -1
  10021DD5:  68 3d b2 04 10                  push     0x1004b23d
  10021DDA:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  10021DE0:  50                              push     eax
  10021DE1:  83 ec 28                        sub      esp, 0x28
  10021DE4:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  10021DE9:  33 c5                           xor      eax, ebp
  10021DEB:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  10021DEE:  56                              push     esi
  10021DEF:  50                              push     eax
  10021DF0:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10021DF3:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  10021DF9:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10021DFC:  8b c6                           mov      eax, esi
  10021DFE:  8d 50 01                        lea      edx, [eax + 1]
  10021E01:  8a 08                           mov      cl, byte ptr [eax]
  10021E03:  40                              inc      eax
  10021E04:  84 c9                           test     cl, cl
  10021E06:  75 f9                           jne      0x10021e01
  10021E08:  2b c2                           sub      eax, edx
  10021E0A:  8d 4d d8                        lea      ecx, [ebp - 0x28]
  10021E0D:  6a 78                           push     0x78
  10021E0F:  40                              inc      eax
  10021E10:  50                              push     eax
  10021E11:  e8 aa fd ff ff                  call     0x10021bc0
  10021E16:  83 7d ec 0f                     cmp      dword ptr [ebp - 0x14], 0xf
  10021E1A:  8d 55 d8                        lea      edx, [ebp - 0x28]
  10021E1D:  a1 90 c4 08 10                  mov      eax, dword ptr [0x1008c490]
  10021E22:  b9 60 c4 08 10                  mov      ecx, 0x1008c460
  10021E27:  0f 47 55 d8                     cmova    edx, dword ptr [ebp - 0x28]
  10021E2B:  03 05 80 c4 08 10               add      eax, dword ptr [0x1008c480]
  10021E31:  50                              push     eax
  10021E32:  a1 8c c4 08 10                  mov      eax, dword ptr [0x1008c48c]
  10021E37:  03 05 80 c4 08 10               add      eax, dword ptr [0x1008c480]
  10021E3D:  50                              push     eax
  10021E3E:  6a 00                           push     0
  10021E40:  52                              push     edx
  10021E41:  56                              push     esi
  10021E42:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10021E49:  e8 d2 13 ff ff                  call     0x10013220
  10021E4E:  85 c0                           test     eax, eax
  10021E50:  0f 84 b9 00 00 00               je       0x10021f0f
  10021E56:  8b 15 80 c4 08 10               mov      edx, dword ptr [0x1008c480]
  10021E5C:  2b c2                           sub      eax, edx
  10021E5E:  0f 84 ab 00 00 00               je       0x10021f0f
  10021E64:  03 d0                           add      edx, eax
  10021E66:  b9 60 c4 08 10                  mov      ecx, 0x1008c460
  10021E6B:  8d 42 9c                        lea      eax, [edx - 0x64]
  10021E6E:  50                              push     eax
  10021E6F:  52                              push     edx
  10021E70:  6a 01                           push     1
  10021E72:  68 90 18 05 10                  push     0x10051890
  10021E77:  68 cc 37 05 10                  push     0x100537cc
  10021E7C:  e8 9f 13 ff ff                  call     0x10013220
  10021E81:  8b c8                           mov      ecx, eax
  10021E83:  33 d2                           xor      edx, edx
  10021E85:  2b 0d 80 c4 08 10               sub      ecx, dword ptr [0x1008c480]
  10021E8B:  85 c0                           test     eax, eax
  10021E8D:  0f 45 d1                        cmovne   edx, ecx
  10021E90:  0f b6 c2                        movzx    eax, dl
  10021E93:  35 c5 9d 1c 81                  xor      eax, 0x811c9dc5
  10021E98:  89 55 d4                        mov      dword ptr [ebp - 0x2c], edx
  10021E9B:  69 c8 93 01 00 01               imul     ecx, eax, 0x1000193
  10021EA1:  8b c2                           mov      eax, edx
  10021EA3:  c1 e8 08                        shr      eax, 8
  10021EA6:  0f b6 c0                        movzx    eax, al
  10021EA9:  33 c8                           xor      ecx, eax
  10021EAB:  8b c2                           mov      eax, edx
  10021EAD:  c1 e8 10                        shr      eax, 0x10
  10021EB0:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  10021EB6:  0f b6 c0                        movzx    eax, al
  10021EB9:  c1 ea 18                        shr      edx, 0x18
  10021EBC:  33 c8                           xor      ecx, eax
  10021EBE:  69 c1 93 01 00 01               imul     eax, ecx, 0x1000193
  10021EC4:  b9 a0 c4 08 10                  mov      ecx, 0x1008c4a0
  10021EC9:  33 c2                           xor      eax, edx
  10021ECB:  69 c0 93 01 00 01               imul     eax, eax, 0x1000193
  10021ED1:  50                              push     eax
  10021ED2:  8d 45 d4                        lea      eax, [ebp - 0x2c]
  10021ED5:  50                              push     eax
  10021ED6:  8d 45 cc                        lea      eax, [ebp - 0x34]
  10021ED9:  50                              push     eax
  10021EDA:  e8 01 43 fe ff                  call     0x100061e0
  10021EDF:  8b 15 a4 c4 08 10               mov      edx, dword ptr [0x1008c4a4]
  10021EE5:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  10021EE8:  85 c0                           test     eax, eax
  10021EEA:  0f 45 d0                        cmovne   edx, eax
  10021EED:  3b 15 a4 c4 08 10               cmp      edx, dword ptr [0x1008c4a4]
  10021EF3:  74 1a                           je       0x10021f0f
  10021EF5:  8b 42 10                        mov      eax, dword ptr [edx + 0x10]
  10021EF8:  8b 72 0c                        mov      esi, dword ptr [edx + 0xc]
  10021EFB:  2b c6                           sub      eax, esi
  10021EFD:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  10021F00:  c1 f8 02                        sar      eax, 2
  10021F03:  3b c1                           cmp      eax, ecx
  10021F05:  76 08                           jbe      0x10021f0f
  10021F07:  8b 34 8e                        mov      esi, dword ptr [esi + ecx*4]
  10021F0A:  03 75 10                        add      esi, dword ptr [ebp + 0x10]
  10021F0D:  eb 02                           jmp      0x10021f11
  10021F0F:  33 f6                           xor      esi, esi
  10021F11:  8b 4d ec                        mov      ecx, dword ptr [ebp - 0x14]
  10021F14:  83 f9 0f                        cmp      ecx, 0xf
  10021F17:  76 28                           jbe      0x10021f41
  10021F19:  8b 55 d8                        mov      edx, dword ptr [ebp - 0x28]
  10021F1C:  41                              inc      ecx
  10021F1D:  8b c2                           mov      eax, edx
  10021F1F:  81 f9 00 10 00 00               cmp      ecx, 0x1000
  10021F25:  72 10                           jb       0x10021f37
  10021F27:  8b 50 fc                        mov      edx, dword ptr [eax - 4]
  10021F2A:  83 c1 23                        add      ecx, 0x23
  10021F2D:  2b c2                           sub      eax, edx
  10021F2F:  83 c0 fc                        add      eax, -4
  10021F32:  83 f8 1f                        cmp      eax, 0x1f
  10021F35:  77 26                           ja       0x10021f5d
  10021F37:  51                              push     ecx
  10021F38:  52                              push     edx
  10021F39:  e8 4f a1 00 00                  call     0x1002c08d
  10021F3E:  83 c4 08                        add      esp, 8
  10021F41:  8b c6                           mov      eax, esi
  10021F43:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  10021F46:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  10021F4D:  59                              pop      ecx
  10021F4E:  5e                              pop      esi
  10021F4F:  8b 4d f0                        mov      ecx, dword ptr [ebp - 0x10]
  10021F52:  33 cd                           xor      ecx, ebp
  10021F54:  e8 5e a4 00 00                  call     0x1002c3b7
  10021F59:  8b e5                           mov      esp, ebp
  10021F5B:  5d                              pop      ebp
  10021F5C:  c3                              ret      
  10021F5D:  6a 00                           push     0
  10021F5F:  6a 00                           push     0
  10021F61:  6a 00                           push     0
  10021F63:  6a 00                           push     0
  10021F65:  6a 00                           push     0
  10021F67:  e8 63 ef 00 00                  call     0x10030ecf
  10021F6C:  cc                              int3     
  10021F6D:  cc                              int3     
  10021F6E:  cc                              int3     
  10021F6F:  cc                              int3     
  10021F70:  55                              push     ebp
  10021F71:  8b ec                           mov      ebp, esp
  10021F73:  6a ff                           push     -1
  10021F75:  68 3d b2 04 10                  push     0x1004b23d
  10021F7A:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  10021F80:  50                              push     eax
  10021F81:  83 ec 28                        sub      esp, 0x28
  10021F84:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  10021F89:  33 c5                           xor      eax, ebp
  10021F8B:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  10021F8E:  56                              push     esi
  10021F8F:  50                              push     eax
  10021F90:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10021F93:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  10021F99:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10021F9C:  8b c6                           mov      eax, esi
  10021F9E:  8d 50 02                        lea      edx, [eax + 2]
  10021FA1:  66 8b 08                        mov      cx, word ptr [eax]
  10021FA4:  83 c0 02                        add      eax, 2
  10021FA7:  66 85 c9                        test     cx, cx
  10021FAA:  75 f5                           jne      0x10021fa1
  10021FAC:  2b c2                           sub      eax, edx
  10021FAE:  8d 4d d8                        lea      ecx, [ebp - 0x28]
  10021FB1:  d1 f8                           sar      eax, 1
  10021FB3:  6a 78                           push     0x78
  10021FB5:  8d 04 45 01 00 00 00            lea      eax, [eax*2 + 1]
  10021FBC:  50                              push     eax
  10021FBD:  e8 fe fb ff ff                  call     0x10021bc0
  10021FC2:  83 7d ec 0f                     cmp      dword ptr [ebp - 0x14], 0xf
  10021FC6:  8d 55 d8                        lea      edx, [ebp - 0x28]
  10021FC9:  a1 90 c4 08 10                  mov      eax, dword ptr [0x1008c490]
  10021FCE:  b9 60 c4 08 10                  mov      ecx, 0x1008c460
  10021FD3:  0f 47 55 d8                     cmova    edx, dword ptr [ebp - 0x28]
  10021FD7:  03 05 80 c4 08 10               add      eax, dword ptr [0x1008c480]
  10021FDD:  50                              push     eax
  10021FDE:  a1 8c c4 08 10                  mov      eax, dword ptr [0x1008c48c]
  10021FE3:  03 05 80 c4 08 10               add      eax, dword ptr [0x1008c480]
  10021FE9:  50                              push     eax
  10021FEA:  6a 00                           push     0
  10021FEC:  52                              push     edx
  10021FED:  56                              push     esi
  10021FEE:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10021FF5:  e8 26 12 ff ff                  call     0x10013220
  10021FFA:  85 c0                           test     eax, eax
  10021FFC:  0f 84 bc 00 00 00               je       0x100220be
  10022002:  8b 15 80 c4 08 10               mov      edx, dword ptr [0x1008c480]
  10022008:  2b c2                           sub      eax, edx
  1002200A:  0f 84 ae 00 00 00               je       0x100220be
  10022010:  03 d0                           add      edx, eax
  10022012:  b9 60 c4 08 10                  mov      ecx, 0x1008c460
  10022017:  8d 82 d8 fe ff ff               lea      eax, [edx - 0x128]
  1002201D:  50                              push     eax
  1002201E:  52                              push     edx
  1002201F:  6a 02                           push     2
  10022021:  68 78 22 05 10                  push     0x10052278
  10022026:  68 d0 37 05 10                  push     0x100537d0
  1002202B:  e8 f0 11 ff ff                  call     0x10013220
  10022030:  8b c8                           mov      ecx, eax
  10022032:  33 d2                           xor      edx, edx
  10022034:  2b 0d 80 c4 08 10               sub      ecx, dword ptr [0x1008c480]
  1002203A:  85 c0                           test     eax, eax
  1002203C:  0f 45 d1                        cmovne   edx, ecx
  1002203F:  0f b6 c2                        movzx    eax, dl
  10022042:  35 c5 9d 1c 81                  xor      eax, 0x811c9dc5
  10022047:  89 55 d4                        mov      dword ptr [ebp - 0x2c], edx
  1002204A:  69 c8 93 01 00 01               imul     ecx, eax, 0x1000193
  10022050:  8b c2                           mov      eax, edx
  10022052:  c1 e8 08                        shr      eax, 8
  10022055:  0f b6 c0                        movzx    eax, al
  10022058:  33 c8                           xor      ecx, eax
  1002205A:  8b c2                           mov      eax, edx
  1002205C:  c1 e8 10                        shr      eax, 0x10
  1002205F:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  10022065:  0f b6 c0                        movzx    eax, al
  10022068:  c1 ea 18                        shr      edx, 0x18
  1002206B:  33 c8                           xor      ecx, eax
  1002206D:  69 c1 93 01 00 01               imul     eax, ecx, 0x1000193
  10022073:  b9 a0 c4 08 10                  mov      ecx, 0x1008c4a0
  10022078:  33 c2                           xor      eax, edx
  1002207A:  69 c0 93 01 00 01               imul     eax, eax, 0x1000193
  10022080:  50                              push     eax
  10022081:  8d 45 d4                        lea      eax, [ebp - 0x2c]
  10022084:  50                              push     eax
  10022085:  8d 45 cc                        lea      eax, [ebp - 0x34]
  10022088:  50                              push     eax
  10022089:  e8 52 41 fe ff                  call     0x100061e0
  1002208E:  8b 15 a4 c4 08 10               mov      edx, dword ptr [0x1008c4a4]
  10022094:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  10022097:  85 c0                           test     eax, eax
  10022099:  0f 45 d0                        cmovne   edx, eax
  1002209C:  3b 15 a4 c4 08 10               cmp      edx, dword ptr [0x1008c4a4]
  100220A2:  74 1a                           je       0x100220be
  100220A4:  8b 42 10                        mov      eax, dword ptr [edx + 0x10]
  100220A7:  8b 72 0c                        mov      esi, dword ptr [edx + 0xc]
  100220AA:  2b c6                           sub      eax, esi
  100220AC:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  100220AF:  c1 f8 02                        sar      eax, 2
  100220B2:  3b c1                           cmp      eax, ecx
  100220B4:  76 08                           jbe      0x100220be
  100220B6:  8b 34 8e                        mov      esi, dword ptr [esi + ecx*4]
  100220B9:  03 75 10                        add      esi, dword ptr [ebp + 0x10]
  100220BC:  eb 02                           jmp      0x100220c0
  100220BE:  33 f6                           xor      esi, esi
  100220C0:  8b 4d ec                        mov      ecx, dword ptr [ebp - 0x14]
  100220C3:  83 f9 0f                        cmp      ecx, 0xf
  100220C6:  76 28                           jbe      0x100220f0
  100220C8:  8b 55 d8                        mov      edx, dword ptr [ebp - 0x28]
  100220CB:  41                              inc      ecx
  100220CC:  8b c2                           mov      eax, edx
  100220CE:  81 f9 00 10 00 00               cmp      ecx, 0x1000
  100220D4:  72 10                           jb       0x100220e6
  100220D6:  8b 50 fc                        mov      edx, dword ptr [eax - 4]
  100220D9:  83 c1 23                        add      ecx, 0x23
  100220DC:  2b c2                           sub      eax, edx
  100220DE:  83 c0 fc                        add      eax, -4
  100220E1:  83 f8 1f                        cmp      eax, 0x1f
  100220E4:  77 26                           ja       0x1002210c
  100220E6:  51                              push     ecx
  100220E7:  52                              push     edx
  100220E8:  e8 a0 9f 00 00                  call     0x1002c08d
  100220ED:  83 c4 08                        add      esp, 8
  100220F0:  8b c6                           mov      eax, esi
  100220F2:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  100220F5:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  100220FC:  59                              pop      ecx
  100220FD:  5e                              pop      esi
  100220FE:  8b 4d f0                        mov      ecx, dword ptr [ebp - 0x10]
  10022101:  33 cd                           xor      ecx, ebp
  10022103:  e8 af a2 00 00                  call     0x1002c3b7
  10022108:  8b e5                           mov      esp, ebp
  1002210A:  5d                              pop      ebp
  1002210B:  c3                              ret      
  1002210C:  6a 00                           push     0
  1002210E:  6a 00                           push     0
  10022110:  6a 00                           push     0
  10022112:  6a 00                           push     0
  10022114:  6a 00                           push     0
  10022116:  e8 b4 ed 00 00                  call     0x10030ecf
  1002211B:  cc                              int3     
  1002211C:  cc                              int3     
  1002211D:  cc                              int3     
  1002211E:  cc                              int3     
  1002211F:  cc                              int3     
  10022120:  55                              push     ebp
  10022121:  8b ec                           mov      ebp, esp
  10022123:  ff 75 10                        push     dword ptr [ebp + 0x10]
  10022126:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10022129:  6a 00                           push     0
  1002212B:  ff 75 08                        push     dword ptr [ebp + 8]
  1002212E:  e8 9d fc ff ff                  call     0x10021dd0  ; Scanner::FindNthUseOfString
  10022133:  83 c4 10                        add      esp, 0x10
  10022136:  5d                              pop      ebp
  10022137:  c3                              ret      


; === Scanner::FindNthUseOfString ===
; RVA: 0x00021F70  Size: 456 bytes
; Exports: ?FindNthUseOfString@Scanner@GW@@YAIPB_WIHW4ScannerSection@2@@Z
;
  10021F70:  55                              push     ebp
  10021F71:  8b ec                           mov      ebp, esp
  10021F73:  6a ff                           push     -1
  10021F75:  68 3d b2 04 10                  push     0x1004b23d
  10021F7A:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  10021F80:  50                              push     eax
  10021F81:  83 ec 28                        sub      esp, 0x28
  10021F84:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  10021F89:  33 c5                           xor      eax, ebp
  10021F8B:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  10021F8E:  56                              push     esi
  10021F8F:  50                              push     eax
  10021F90:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10021F93:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  10021F99:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10021F9C:  8b c6                           mov      eax, esi
  10021F9E:  8d 50 02                        lea      edx, [eax + 2]
  10021FA1:  66 8b 08                        mov      cx, word ptr [eax]
  10021FA4:  83 c0 02                        add      eax, 2
  10021FA7:  66 85 c9                        test     cx, cx
  10021FAA:  75 f5                           jne      0x10021fa1
  10021FAC:  2b c2                           sub      eax, edx
  10021FAE:  8d 4d d8                        lea      ecx, [ebp - 0x28]
  10021FB1:  d1 f8                           sar      eax, 1
  10021FB3:  6a 78                           push     0x78
  10021FB5:  8d 04 45 01 00 00 00            lea      eax, [eax*2 + 1]
  10021FBC:  50                              push     eax
  10021FBD:  e8 fe fb ff ff                  call     0x10021bc0
  10021FC2:  83 7d ec 0f                     cmp      dword ptr [ebp - 0x14], 0xf
  10021FC6:  8d 55 d8                        lea      edx, [ebp - 0x28]
  10021FC9:  a1 90 c4 08 10                  mov      eax, dword ptr [0x1008c490]
  10021FCE:  b9 60 c4 08 10                  mov      ecx, 0x1008c460
  10021FD3:  0f 47 55 d8                     cmova    edx, dword ptr [ebp - 0x28]
  10021FD7:  03 05 80 c4 08 10               add      eax, dword ptr [0x1008c480]
  10021FDD:  50                              push     eax
  10021FDE:  a1 8c c4 08 10                  mov      eax, dword ptr [0x1008c48c]
  10021FE3:  03 05 80 c4 08 10               add      eax, dword ptr [0x1008c480]
  10021FE9:  50                              push     eax
  10021FEA:  6a 00                           push     0
  10021FEC:  52                              push     edx
  10021FED:  56                              push     esi
  10021FEE:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10021FF5:  e8 26 12 ff ff                  call     0x10013220
  10021FFA:  85 c0                           test     eax, eax
  10021FFC:  0f 84 bc 00 00 00               je       0x100220be
  10022002:  8b 15 80 c4 08 10               mov      edx, dword ptr [0x1008c480]
  10022008:  2b c2                           sub      eax, edx
  1002200A:  0f 84 ae 00 00 00               je       0x100220be
  10022010:  03 d0                           add      edx, eax
  10022012:  b9 60 c4 08 10                  mov      ecx, 0x1008c460
  10022017:  8d 82 d8 fe ff ff               lea      eax, [edx - 0x128]
  1002201D:  50                              push     eax
  1002201E:  52                              push     edx
  1002201F:  6a 02                           push     2
  10022021:  68 78 22 05 10                  push     0x10052278
  10022026:  68 d0 37 05 10                  push     0x100537d0
  1002202B:  e8 f0 11 ff ff                  call     0x10013220
  10022030:  8b c8                           mov      ecx, eax
  10022032:  33 d2                           xor      edx, edx
  10022034:  2b 0d 80 c4 08 10               sub      ecx, dword ptr [0x1008c480]
  1002203A:  85 c0                           test     eax, eax
  1002203C:  0f 45 d1                        cmovne   edx, ecx
  1002203F:  0f b6 c2                        movzx    eax, dl
  10022042:  35 c5 9d 1c 81                  xor      eax, 0x811c9dc5
  10022047:  89 55 d4                        mov      dword ptr [ebp - 0x2c], edx
  1002204A:  69 c8 93 01 00 01               imul     ecx, eax, 0x1000193
  10022050:  8b c2                           mov      eax, edx
  10022052:  c1 e8 08                        shr      eax, 8
  10022055:  0f b6 c0                        movzx    eax, al
  10022058:  33 c8                           xor      ecx, eax
  1002205A:  8b c2                           mov      eax, edx
  1002205C:  c1 e8 10                        shr      eax, 0x10
  1002205F:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  10022065:  0f b6 c0                        movzx    eax, al
  10022068:  c1 ea 18                        shr      edx, 0x18
  1002206B:  33 c8                           xor      ecx, eax
  1002206D:  69 c1 93 01 00 01               imul     eax, ecx, 0x1000193
  10022073:  b9 a0 c4 08 10                  mov      ecx, 0x1008c4a0
  10022078:  33 c2                           xor      eax, edx
  1002207A:  69 c0 93 01 00 01               imul     eax, eax, 0x1000193
  10022080:  50                              push     eax
  10022081:  8d 45 d4                        lea      eax, [ebp - 0x2c]
  10022084:  50                              push     eax
  10022085:  8d 45 cc                        lea      eax, [ebp - 0x34]
  10022088:  50                              push     eax
  10022089:  e8 52 41 fe ff                  call     0x100061e0
  1002208E:  8b 15 a4 c4 08 10               mov      edx, dword ptr [0x1008c4a4]
  10022094:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  10022097:  85 c0                           test     eax, eax
  10022099:  0f 45 d0                        cmovne   edx, eax
  1002209C:  3b 15 a4 c4 08 10               cmp      edx, dword ptr [0x1008c4a4]
  100220A2:  74 1a                           je       0x100220be
  100220A4:  8b 42 10                        mov      eax, dword ptr [edx + 0x10]
  100220A7:  8b 72 0c                        mov      esi, dword ptr [edx + 0xc]
  100220AA:  2b c6                           sub      eax, esi
  100220AC:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  100220AF:  c1 f8 02                        sar      eax, 2
  100220B2:  3b c1                           cmp      eax, ecx
  100220B4:  76 08                           jbe      0x100220be
  100220B6:  8b 34 8e                        mov      esi, dword ptr [esi + ecx*4]
  100220B9:  03 75 10                        add      esi, dword ptr [ebp + 0x10]
  100220BC:  eb 02                           jmp      0x100220c0
  100220BE:  33 f6                           xor      esi, esi
  100220C0:  8b 4d ec                        mov      ecx, dword ptr [ebp - 0x14]
  100220C3:  83 f9 0f                        cmp      ecx, 0xf
  100220C6:  76 28                           jbe      0x100220f0
  100220C8:  8b 55 d8                        mov      edx, dword ptr [ebp - 0x28]
  100220CB:  41                              inc      ecx
  100220CC:  8b c2                           mov      eax, edx
  100220CE:  81 f9 00 10 00 00               cmp      ecx, 0x1000
  100220D4:  72 10                           jb       0x100220e6
  100220D6:  8b 50 fc                        mov      edx, dword ptr [eax - 4]
  100220D9:  83 c1 23                        add      ecx, 0x23
  100220DC:  2b c2                           sub      eax, edx
  100220DE:  83 c0 fc                        add      eax, -4
  100220E1:  83 f8 1f                        cmp      eax, 0x1f
  100220E4:  77 26                           ja       0x1002210c
  100220E6:  51                              push     ecx
  100220E7:  52                              push     edx
  100220E8:  e8 a0 9f 00 00                  call     0x1002c08d
  100220ED:  83 c4 08                        add      esp, 8
  100220F0:  8b c6                           mov      eax, esi
  100220F2:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  100220F5:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  100220FC:  59                              pop      ecx
  100220FD:  5e                              pop      esi
  100220FE:  8b 4d f0                        mov      ecx, dword ptr [ebp - 0x10]
  10022101:  33 cd                           xor      ecx, ebp
  10022103:  e8 af a2 00 00                  call     0x1002c3b7
  10022108:  8b e5                           mov      esp, ebp
  1002210A:  5d                              pop      ebp
  1002210B:  c3                              ret      
  1002210C:  6a 00                           push     0
  1002210E:  6a 00                           push     0
  10022110:  6a 00                           push     0
  10022112:  6a 00                           push     0
  10022114:  6a 00                           push     0
  10022116:  e8 b4 ed 00 00                  call     0x10030ecf
  1002211B:  cc                              int3     
  1002211C:  cc                              int3     
  1002211D:  cc                              int3     
  1002211E:  cc                              int3     
  1002211F:  cc                              int3     
  10022120:  55                              push     ebp
  10022121:  8b ec                           mov      ebp, esp
  10022123:  ff 75 10                        push     dword ptr [ebp + 0x10]
  10022126:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10022129:  6a 00                           push     0
  1002212B:  ff 75 08                        push     dword ptr [ebp + 8]
  1002212E:  e8 9d fc ff ff                  call     0x10021dd0  ; Scanner::FindNthUseOfString
  10022133:  83 c4 10                        add      esp, 0x10
  10022136:  5d                              pop      ebp
  10022137:  c3                              ret      


; === Scanner::FindUseOfString ===
; RVA: 0x00022120  Size: 24 bytes
; Exports: ?FindUseOfString@Scanner@GW@@YAIPBDHW4ScannerSection@2@@Z
;
  10022120:  55                              push     ebp
  10022121:  8b ec                           mov      ebp, esp
  10022123:  ff 75 10                        push     dword ptr [ebp + 0x10]
  10022126:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10022129:  6a 00                           push     0
  1002212B:  ff 75 08                        push     dword ptr [ebp + 8]
  1002212E:  e8 9d fc ff ff                  call     0x10021dd0  ; Scanner::FindNthUseOfString
  10022133:  83 c4 10                        add      esp, 0x10
  10022136:  5d                              pop      ebp
  10022137:  c3                              ret      


; === Scanner::FindUseOfString ===
; RVA: 0x00022140  Size: 24 bytes
; Exports: ?FindUseOfString@Scanner@GW@@YAIPB_WHW4ScannerSection@2@@Z
;
  10022140:  55                              push     ebp
  10022141:  8b ec                           mov      ebp, esp
  10022143:  ff 75 10                        push     dword ptr [ebp + 0x10]
  10022146:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10022149:  6a 00                           push     0
  1002214B:  ff 75 08                        push     dword ptr [ebp + 8]
  1002214E:  e8 1d fe ff ff                  call     0x10021f70  ; Scanner::FindNthUseOfString
  10022153:  83 c4 10                        add      esp, 0x10
  10022156:  5d                              pop      ebp
  10022157:  c3                              ret      


; === Scanner::FunctionFromNearCall ===
; RVA: 0x00022160  Size: 120 bytes
; Exports: ?FunctionFromNearCall@Scanner@GW@@YAII_N@Z
;
  10022160:  55                              push     ebp
  10022161:  8b ec                           mov      ebp, esp
  10022163:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10022166:  56                              push     esi
  10022167:  85 c9                           test     ecx, ecx
  10022169:  74 68                           je       0x100221d3
  1002216B:  3b 0d 84 c4 08 10               cmp      ecx, dword ptr [0x1008c484]
  10022171:  76 60                           jbe      0x100221d3
  10022173:  3b 0d 88 c4 08 10               cmp      ecx, dword ptr [0x1008c488]
  10022179:  73 58                           jae      0x100221d3
  1002217B:  8b 11                           mov      edx, dword ptr [ecx]
  1002217D:  0f b6 c2                        movzx    eax, dl
  10022180:  2d e8 00 00 00                  sub      eax, 0xe8
  10022185:  74 15                           je       0x1002219c
  10022187:  83 e8 01                        sub      eax, 1
  1002218A:  74 10                           je       0x1002219c
  1002218C:  83 e8 02                        sub      eax, 2
  1002218F:  75 42                           jne      0x100221d3
  10022191:  c1 ea 08                        shr      edx, 8
  10022194:  0f be f2                        movsx    esi, dl
  10022197:  83 c6 02                        add      esi, 2
  1002219A:  eb 06                           jmp      0x100221a2
  1002219C:  8b 71 01                        mov      esi, dword ptr [ecx + 1]
  1002219F:  83 c6 05                        add      esi, 5
  100221A2:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  100221A5:  03 f1                           add      esi, ecx
  100221A7:  84 c0                           test     al, al
  100221A9:  74 14                           je       0x100221bf
  100221AB:  85 f6                           test     esi, esi
  100221AD:  74 24                           je       0x100221d3
  100221AF:  3b 35 84 c4 08 10               cmp      esi, dword ptr [0x1008c484]
  100221B5:  76 1c                           jbe      0x100221d3
  100221B7:  3b 35 88 c4 08 10               cmp      esi, dword ptr [0x1008c488]
  100221BD:  73 14                           jae      0x100221d3
  100221BF:  50                              push     eax
  100221C0:  56                              push     esi
  100221C1:  e8 9a ff ff ff                  call     0x10022160  ; Scanner::FunctionFromNearCall
  100221C6:  83 c4 08                        add      esp, 8
  100221C9:  85 c0                           test     eax, eax
  100221CB:  0f 45 f0                        cmovne   esi, eax
  100221CE:  8b c6                           mov      eax, esi
  100221D0:  5e                              pop      esi
  100221D1:  5d                              pop      ebp
  100221D2:  c3                              ret      
  100221D3:  33 c0                           xor      eax, eax
  100221D5:  5e                              pop      esi
  100221D6:  5d                              pop      ebp
  100221D7:  c3                              ret      


; === Scanner::GetGameTlsIndex ===
; RVA: 0x000221E0  Size: 6 bytes
; Exports: ?GetGameTlsIndex@Scanner@GW@@YAKXZ
;
  100221E0:  a1 9c c4 08 10                  mov      eax, dword ptr [0x1008c49c]
  100221E5:  c3                              ret      


; === Scanner::GetSectionAddressRange ===
; RVA: 0x000221F0  Size: 24 bytes
; Exports: ?GetSectionAddressRange@Scanner@GW@@YAXW4ScannerSection@2@PAI1@Z
;
  100221F0:  55                              push     ebp
  100221F1:  8b ec                           mov      ebp, esp
  100221F3:  ff 75 10                        push     dword ptr [ebp + 0x10]
  100221F6:  b9 60 c4 08 10                  mov      ecx, 0x1008c460
  100221FB:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  100221FE:  ff 75 08                        push     dword ptr [ebp + 8]
  10022201:  e8 3a 11 ff ff                  call     0x10013340
  10022206:  5d                              pop      ebp
  10022207:  c3                              ret      


; === Scanner::Initialize ===
; RVA: 0x00022210  Size: 693 bytes
; Exports: ?Initialize@Scanner@GW@@YAXPAUHINSTANCE__@@@Z
;
  10022210:  55                              push     ebp
  10022211:  8b ec                           mov      ebp, esp
  10022213:  81 ec 28 02 00 00               sub      esp, 0x228
  10022219:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1002221E:  33 c5                           xor      eax, ebp
  10022220:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10022223:  56                              push     esi
  10022224:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10022227:  89 b5 f8 fd ff ff               mov      dword ptr [ebp - 0x208], esi
  1002222D:  85 f6                           test     esi, esi
  1002222F:  74 17                           je       0x10022248
  10022231:  68 ff 00 00 00                  push     0xff
  10022236:  8d 85 fc fd ff ff               lea      eax, [ebp - 0x204]
  1002223C:  50                              push     eax
  1002223D:  56                              push     esi
  1002223E:  ff 15 64 c0 04 10               call     dword ptr [0x1004c064]
  10022244:  85 c0                           test     eax, eax
  10022246:  75 1c                           jne      0x10022264
  10022248:  68 d8 37 05 10                  push     0x100537d8  ; "GW::Scanner::Initialize"
  1002224D:  68 c8 00 00 00                  push     0xc8
  10022252:  68 f0 37 05 10                  push     0x100537f0  ; "C:\GitRepositories\GWCA\Source\Scanner.cpp"
  10022257:  68 20 38 05 10                  push     0x10053820  ; "hModule && GetModuleFileNameW(hModule, filename, _countof..."
  1002225C:  e8 0f 36 fe ff                  call     0x10005870  ; GW::FatalAssert
  10022261:  83 c4 10                        add      esp, 0x10
  10022264:  8d 85 fc fd ff ff               lea      eax, [ebp - 0x204]
  1002226A:  68 60 c4 08 10                  push     0x1008c460
  1002226F:  50                              push     eax
  10022270:  e8 2b 01 ff ff                  call     0x100123a0
  10022275:  83 c4 08                        add      esp, 8
  10022278:  84 c0                           test     al, al
  1002227A:  75 1c                           jne      0x10022298
  1002227C:  68 d8 37 05 10                  push     0x100537d8  ; "GW::Scanner::Initialize"
  10022281:  68 c9 00 00 00                  push     0xc9
  10022286:  68 f0 37 05 10                  push     0x100537f0  ; "C:\GitRepositories\GWCA\Source\Scanner.cpp"
  1002228B:  68 68 38 05 10                  push     0x10053868  ; "FileScanner::CreateFromPath(filename, &fileScanner)"
  10022290:  e8 db 35 fe ff                  call     0x10005870  ; GW::FatalAssert
  10022295:  83 c4 10                        add      esp, 0x10
  10022298:  53                              push     ebx
  10022299:  57                              push     edi
  1002229A:  56                              push     esi
  1002229B:  ff 15 c0 c1 04 10               call     dword ptr [0x1004c1c0]
  100222A1:  8b f8                           mov      edi, eax
  100222A3:  33 db                           xor      ebx, ebx
  100222A5:  33 c0                           xor      eax, eax
  100222A7:  89 bd f0 fd ff ff               mov      dword ptr [ebp - 0x210], edi
  100222AD:  8d 97 f8 00 00 00               lea      edx, [edi + 0xf8]
  100222B3:  66 3b 47 06                     cmp      ax, word ptr [edi + 6]
  100222B7:  73 75                           jae      0x1002232e
  100222B9:  0f 1f 80 00 00 00 00            nop      dword ptr [eax]
  100222C0:  81 3a 2e 74 65 78               cmp      dword ptr [edx], 0x7865742e
  100222C6:  75 12                           jne      0x100222da
  100222C8:  80 7a 04 74                     cmp      byte ptr [edx + 4], 0x74
  100222CC:  75 0c                           jne      0x100222da
  100222CE:  b8 84 c4 08 10                  mov      eax, 0x1008c484
  100222D3:  bf 88 c4 08 10                  mov      edi, 0x1008c488
  100222D8:  eb 34                           jmp      0x1002230e
  100222DA:  81 3a 2e 72 64 61               cmp      dword ptr [edx], 0x6164722e
  100222E0:  75 14                           jne      0x100222f6
  100222E2:  66 81 7a 04 74 61               cmp      word ptr [edx + 4], 0x6174
  100222E8:  75 0c                           jne      0x100222f6
  100222EA:  b8 8c c4 08 10                  mov      eax, 0x1008c48c
  100222EF:  bf 90 c4 08 10                  mov      edi, 0x1008c490
  100222F4:  eb 18                           jmp      0x1002230e
  100222F6:  81 3a 2e 64 61 74               cmp      dword ptr [edx], 0x7461642e
  100222FC:  75 24                           jne      0x10022322
  100222FE:  80 7a 04 61                     cmp      byte ptr [edx + 4], 0x61
  10022302:  75 1e                           jne      0x10022322
  10022304:  b8 94 c4 08 10                  mov      eax, 0x1008c494
  10022309:  bf 98 c4 08 10                  mov      edi, 0x1008c498
  1002230E:  8b 4a 0c                        mov      ecx, dword ptr [edx + 0xc]
  10022311:  03 ce                           add      ecx, esi
  10022313:  89 08                           mov      dword ptr [eax], ecx
  10022315:  8b 42 08                        mov      eax, dword ptr [edx + 8]
  10022318:  03 c1                           add      eax, ecx
  1002231A:  89 07                           mov      dword ptr [edi], eax
  1002231C:  8b bd f0 fd ff ff               mov      edi, dword ptr [ebp - 0x210]
  10022322:  0f b7 47 06                     movzx    eax, word ptr [edi + 6]
  10022326:  43                              inc      ebx
  10022327:  83 c2 28                        add      edx, 0x28
  1002232A:  3b d8                           cmp      ebx, eax
  1002232C:  7c 92                           jl       0x100222c0
  1002232E:  8b 0d 84 c4 08 10               mov      ecx, dword ptr [0x1008c484]
  10022334:  85 c9                           test     ecx, ecx
  10022336:  0f 84 55 01 00 00               je       0x10022491
  1002233C:  83 3d 88 c4 08 10 00            cmp      dword ptr [0x1008c488], 0
  10022343:  0f 84 48 01 00 00               je       0x10022491
  10022349:  8b 9f a0 00 00 00               mov      ebx, dword ptr [edi + 0xa0]
  1002234F:  85 db                           test     ebx, ebx
  10022351:  0f 84 08 01 00 00               je       0x1002245f
  10022357:  8b 87 a4 00 00 00               mov      eax, dword ptr [edi + 0xa4]
  1002235D:  85 c0                           test     eax, eax
  1002235F:  0f 84 fa 00 00 00               je       0x1002245f
  10022365:  8b d6                           mov      edx, esi
  10022367:  03 da                           add      ebx, edx
  10022369:  03 c3                           add      eax, ebx
  1002236B:  89 85 f4 fd ff ff               mov      dword ptr [ebp - 0x20c], eax
  10022371:  3b d8                           cmp      ebx, eax
  10022373:  0f 83 e4 00 00 00               jae      0x1002245d
  10022379:  0f 1f 80 00 00 00 00            nop      dword ptr [eax]
  10022380:  8d 43 04                        lea      eax, [ebx + 4]
  10022383:  89 85 e0 fd ff ff               mov      dword ptr [ebp - 0x220], eax
  10022389:  8b 00                           mov      eax, dword ptr [eax]
  1002238B:  85 c0                           test     eax, eax
  1002238D:  0f 84 b6 00 00 00               je       0x10022449
  10022393:  83 c0 f8                        add      eax, -8
  10022396:  be 00 00 00 00                  mov      esi, 0
  1002239B:  d1 e8                           shr      eax, 1
  1002239D:  89 85 e4 fd ff ff               mov      dword ptr [ebp - 0x21c], eax
  100223A3:  0f 84 8c 00 00 00               je       0x10022435
  100223A9:  0f 1f 80 00 00 00 00            nop      dword ptr [eax]
  100223B0:  0f b7 4c 73 08                  movzx    ecx, word ptr [ebx + esi*2 + 8]
  100223B5:  8b f9                           mov      edi, ecx
  100223B7:  81 e1 00 f0 00 00               and      ecx, 0xf000
  100223BD:  81 e7 ff 0f 00 00               and      edi, 0xfff
  100223C3:  03 3b                           add      edi, dword ptr [ebx]
  100223C5:  03 fa                           add      edi, edx
  100223C7:  89 bd e8 fd ff ff               mov      dword ptr [ebp - 0x218], edi
  100223CD:  81 f9 00 30 00 00               cmp      ecx, 0x3000
  100223D3:  75 53                           jne      0x10022428
  100223D5:  8b 8d f0 fd ff ff               mov      ecx, dword ptr [ebp - 0x210]
  100223DB:  8b 07                           mov      eax, dword ptr [edi]
  100223DD:  2b 41 34                        sub      eax, dword ptr [ecx + 0x34]
  100223E0:  b9 a0 c4 08 10                  mov      ecx, 0x1008c4a0
  100223E5:  03 c2                           add      eax, edx
  100223E7:  89 85 ec fd ff ff               mov      dword ptr [ebp - 0x214], eax
  100223ED:  8d 85 ec fd ff ff               lea      eax, [ebp - 0x214]
  100223F3:  50                              push     eax
  100223F4:  8d 85 d8 fd ff ff               lea      eax, [ebp - 0x228]
  100223FA:  50                              push     eax
  100223FB:  e8 b0 f5 ff ff                  call     0x100219b0
  10022400:  8b 08                           mov      ecx, dword ptr [eax]
  10022402:  8b 41 10                        mov      eax, dword ptr [ecx + 0x10]
  10022405:  83 c1 0c                        add      ecx, 0xc
  10022408:  3b 41 08                        cmp      eax, dword ptr [ecx + 8]
  1002240B:  74 08                           je       0x10022415
  1002240D:  89 38                           mov      dword ptr [eax], edi
  1002240F:  83 41 04 04                     add      dword ptr [ecx + 4], 4
  10022413:  eb 0d                           jmp      0x10022422
  10022415:  8d 95 e8 fd ff ff               lea      edx, [ebp - 0x218]
  1002241B:  52                              push     edx
  1002241C:  50                              push     eax
  1002241D:  e8 0e f5 fd ff                  call     0x10001930
  10022422:  8b 95 f8 fd ff ff               mov      edx, dword ptr [ebp - 0x208]
  10022428:  46                              inc      esi
  10022429:  3b b5 e4 fd ff ff               cmp      esi, dword ptr [ebp - 0x21c]
  1002242F:  0f 82 7b ff ff ff               jb       0x100223b0
  10022435:  8b 85 e0 fd ff ff               mov      eax, dword ptr [ebp - 0x220]
  1002243B:  03 18                           add      ebx, dword ptr [eax]
  1002243D:  3b 9d f4 fd ff ff               cmp      ebx, dword ptr [ebp - 0x20c]
  10022443:  0f 82 37 ff ff ff               jb       0x10022380
  10022449:  8b 0d 84 c4 08 10               mov      ecx, dword ptr [0x1008c484]
  1002244F:  8b b5 f8 fd ff ff               mov      esi, dword ptr [ebp - 0x208]
  10022455:  8b bd f0 fd ff ff               mov      edi, dword ptr [ebp - 0x210]
  1002245B:  eb 02                           jmp      0x1002245f
  1002245D:  8b f2                           mov      esi, edx
  1002245F:  a1 60 c4 08 10                  mov      eax, dword ptr [0x1008c460]
  10022464:  2b c1                           sub      eax, ecx
  10022466:  a3 80 c4 08 10                  mov      dword ptr [0x1008c480], eax
  1002246B:  8b 87 c0 00 00 00               mov      eax, dword ptr [edi + 0xc0]
  10022471:  5f                              pop      edi
  10022472:  5b                              pop      ebx
  10022473:  85 c0                           test     eax, eax
  10022475:  74 1a                           je       0x10022491
  10022477:  8b 44 30 08                     mov      eax, dword ptr [eax + esi + 8]
  1002247B:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1002247E:  33 cd                           xor      ecx, ebp
  10022480:  5e                              pop      esi
  10022481:  8b 00                           mov      eax, dword ptr [eax]
  10022483:  a3 9c c4 08 10                  mov      dword ptr [0x1008c49c], eax
  10022488:  e8 2a 9f 00 00                  call     0x1002c3b7
  1002248D:  8b e5                           mov      esp, ebp
  1002248F:  5d                              pop      ebp
  10022490:  c3                              ret      
  10022491:  68 84 f4 07 10                  push     0x1007f484
  10022496:  8d 85 f4 fd ff ff               lea      eax, [ebp - 0x20c]
  1002249C:  c7 85 f4 fd ff ff 01 00 00 00   mov      dword ptr [ebp - 0x20c], 1
  100224A6:  50                              push     eax
  100224A7:  e8 df ad 00 00                  call     0x1002d28b
  100224AC:  cc                              int3     
  100224AD:  cc                              int3     
  100224AE:  cc                              int3     
  100224AF:  cc                              int3     
  100224B0:  55                              push     ebp
  100224B1:  8b ec                           mov      ebp, esp
  100224B3:  ff 75 08                        push     dword ptr [ebp + 8]
  100224B6:  ff 15 4c c0 04 10               call     dword ptr [0x1004c04c]
  100224BC:  89 45 08                        mov      dword ptr [ebp + 8], eax
  100224BF:  5d                              pop      ebp
  100224C0:  e9 4b fd ff ff                  jmp      0x10022210


; === Scanner::Initialize ===
; RVA: 0x000224B0  Size: 21 bytes
; Exports: ?Initialize@Scanner@GW@@YAXPBD@Z
;
  100224B0:  55                              push     ebp
  100224B1:  8b ec                           mov      ebp, esp
  100224B3:  ff 75 08                        push     dword ptr [ebp + 8]
  100224B6:  ff 15 4c c0 04 10               call     dword ptr [0x1004c04c]
  100224BC:  89 45 08                        mov      dword ptr [ebp + 8], eax
  100224BF:  5d                              pop      ebp
  100224C0:  e9 4b fd ff ff                  jmp      0x10022210


; === Scanner::IsValidPtr ===
; RVA: 0x000224D0  Size: 40 bytes
; Exports: ?IsValidPtr@Scanner@GW@@YA_NIW4ScannerSection@2@@Z
;
  100224D0:  55                              push     ebp
  100224D1:  8b ec                           mov      ebp, esp
  100224D3:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100224D6:  85 c0                           test     eax, eax
  100224D8:  74 1a                           je       0x100224f4
  100224DA:  0f b6 4d 0c                     movzx    ecx, byte ptr [ebp + 0xc]
  100224DE:  3b 04 cd 84 c4 08 10            cmp      eax, dword ptr [ecx*8 + 0x1008c484]
  100224E5:  76 0d                           jbe      0x100224f4
  100224E7:  3b 04 cd 88 c4 08 10            cmp      eax, dword ptr [ecx*8 + 0x1008c488]
  100224EE:  73 04                           jae      0x100224f4
  100224F0:  b0 01                           mov      al, 1
  100224F2:  5d                              pop      ebp
  100224F3:  c3                              ret      
  100224F4:  32 c0                           xor      al, al
  100224F6:  5d                              pop      ebp
  100224F7:  c3                              ret      


; === Scanner::ToFunctionStart ===
; RVA: 0x00022500  Size: 73 bytes
; Exports: ?ToFunctionStart@Scanner@GW@@YAIII@Z
;
  10022500:  55                              push     ebp
  10022501:  8b ec                           mov      ebp, esp
  10022503:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  10022506:  85 d2                           test     edx, edx
  10022508:  74 3b                           je       0x10022545
  1002250A:  8b 0d 80 c4 08 10               mov      ecx, dword ptr [0x1008c480]
  10022510:  8b c1                           mov      eax, ecx
  10022512:  2b 45 0c                        sub      eax, dword ptr [ebp + 0xc]
  10022515:  03 c2                           add      eax, edx
  10022517:  50                              push     eax
  10022518:  8d 04 11                        lea      eax, [ecx + edx]
  1002251B:  b9 60 c4 08 10                  mov      ecx, 0x1008c460
  10022520:  50                              push     eax
  10022521:  6a 00                           push     0
  10022523:  68 10 c3 04 10                  push     0x1004c310
  10022528:  68 d4 37 05 10                  push     0x100537d4
  1002252D:  e8 ee 0c ff ff                  call     0x10013220
  10022532:  8b c8                           mov      ecx, eax
  10022534:  33 c0                           xor      eax, eax
  10022536:  8b d1                           mov      edx, ecx
  10022538:  2b 15 80 c4 08 10               sub      edx, dword ptr [0x1008c480]
  1002253E:  85 c9                           test     ecx, ecx
  10022540:  0f 45 c2                        cmovne   eax, edx
  10022543:  5d                              pop      ebp
  10022544:  c3                              ret      
  10022545:  33 c0                           xor      eax, eax
  10022547:  5d                              pop      ebp
  10022548:  c3                              ret      


