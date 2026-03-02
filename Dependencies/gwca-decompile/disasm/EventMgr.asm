; Module: EventMgr
; Functions: 2
; Total code size: 839 bytes
;

; === EventMgr::RegisterEventCallback ===
; RVA: 0x00006BD0  Size: 471 bytes
; Exports: ?RegisterEventCallback@EventMgr@GW@@YAXPAUHookEntry@2@W4EventID@12@ABV?$function@$$A6AXPAUHookStatus@GW@@W4EventID@EventMgr@2@PAXI@Z@std@@H@Z
;
  10006BD0:  55                              push     ebp
  10006BD1:  8b ec                           mov      ebp, esp
  10006BD3:  6a ff                           push     -1
  10006BD5:  68 7d a7 04 10                  push     0x1004a77d
  10006BDA:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  10006BE0:  50                              push     eax
  10006BE1:  83 ec 58                        sub      esp, 0x58
  10006BE4:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  10006BE9:  33 c5                           xor      eax, ebp
  10006BEB:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  10006BEE:  53                              push     ebx
  10006BEF:  56                              push     esi
  10006BF0:  57                              push     edi
  10006BF1:  50                              push     eax
  10006BF2:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10006BF5:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  10006BFB:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10006BFE:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10006C01:  8b 4d 10                        mov      ecx, dword ptr [ebp + 0x10]
  10006C04:  50                              push     eax
  10006C05:  89 45 b0                        mov      dword ptr [ebp - 0x50], eax
  10006C08:  89 4d bc                        mov      dword ptr [ebp - 0x44], ecx
  10006C0B:  e8 a0 01 00 00                  call     0x10006db0  ; EventMgr::RemoveEventCallback
  10006C10:  0f b6 45 0c                     movzx    eax, byte ptr [ebp + 0xc]
  10006C14:  83 c4 08                        add      esp, 8
  10006C17:  35 c5 9d 1c 81                  xor      eax, 0x811c9dc5
  10006C1C:  69 c8 93 01 00 01               imul     ecx, eax, 0x1000193
  10006C22:  0f b6 45 0d                     movzx    eax, byte ptr [ebp + 0xd]
  10006C26:  33 c8                           xor      ecx, eax
  10006C28:  0f b6 45 0e                     movzx    eax, byte ptr [ebp + 0xe]
  10006C2C:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  10006C32:  33 c8                           xor      ecx, eax
  10006C34:  0f b6 45 0f                     movzx    eax, byte ptr [ebp + 0xf]
  10006C38:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  10006C3E:  33 c8                           xor      ecx, eax
  10006C40:  69 c1 93 01 00 01               imul     eax, ecx, 0x1000193
  10006C46:  b9 a8 c1 08 10                  mov      ecx, 0x1008c1a8
  10006C4B:  50                              push     eax
  10006C4C:  8d 45 0c                        lea      eax, [ebp + 0xc]
  10006C4F:  50                              push     eax
  10006C50:  8d 45 b4                        lea      eax, [ebp - 0x4c]
  10006C53:  50                              push     eax
  10006C54:  e8 87 f5 ff ff                  call     0x100061e0
  10006C59:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  10006C5C:  85 c0                           test     eax, eax
  10006C5E:  75 4c                           jne      0x10006cac
  10006C60:  89 45 a4                        mov      dword ptr [ebp - 0x5c], eax
  10006C63:  89 45 a8                        mov      dword ptr [ebp - 0x58], eax
  10006C66:  89 45 ac                        mov      dword ptr [ebp - 0x54], eax
  10006C69:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10006C6C:  b9 a8 c1 08 10                  mov      ecx, 0x1008c1a8
  10006C71:  8d 45 0c                        lea      eax, [ebp + 0xc]
  10006C74:  50                              push     eax
  10006C75:  8d 45 b4                        lea      eax, [ebp - 0x4c]
  10006C78:  50                              push     eax
  10006C79:  e8 62 f6 ff ff                  call     0x100062e0
  10006C7E:  8b 30                           mov      esi, dword ptr [eax]
  10006C80:  8d 45 a4                        lea      eax, [ebp - 0x5c]
  10006C83:  83 c6 0c                        add      esi, 0xc
  10006C86:  3b f0                           cmp      esi, eax
  10006C88:  74 1b                           je       0x10006ca5
  10006C8A:  8b ce                           mov      ecx, esi
  10006C8C:  e8 cf 04 00 00                  call     0x10007160
  10006C91:  c7 06 00 00 00 00               mov      dword ptr [esi], 0
  10006C97:  c7 46 04 00 00 00 00            mov      dword ptr [esi + 4], 0
  10006C9E:  c7 46 08 00 00 00 00            mov      dword ptr [esi + 8], 0
  10006CA5:  c7 45 fc ff ff ff ff            mov      dword ptr [ebp - 4], 0xffffffff
  10006CAC:  8d 45 0c                        lea      eax, [ebp + 0xc]
  10006CAF:  b9 a8 c1 08 10                  mov      ecx, 0x1008c1a8
  10006CB4:  50                              push     eax
  10006CB5:  8d 45 b4                        lea      eax, [ebp - 0x4c]
  10006CB8:  50                              push     eax
  10006CB9:  e8 22 f6 ff ff                  call     0x100062e0
  10006CBE:  b9 a8 c1 08 10                  mov      ecx, 0x1008c1a8
  10006CC3:  8b 30                           mov      esi, dword ptr [eax]
  10006CC5:  8d 45 0c                        lea      eax, [ebp + 0xc]
  10006CC8:  50                              push     eax
  10006CC9:  8d 45 b4                        lea      eax, [ebp - 0x4c]
  10006CCC:  50                              push     eax
  10006CCD:  8b 76 0c                        mov      esi, dword ptr [esi + 0xc]
  10006CD0:  e8 0b f6 ff ff                  call     0x100062e0
  10006CD5:  8b 7d 14                        mov      edi, dword ptr [ebp + 0x14]
  10006CD8:  8b 00                           mov      eax, dword ptr [eax]
  10006CDA:  3b 70 10                        cmp      esi, dword ptr [eax + 0x10]
  10006CDD:  74 21                           je       0x10006d00
  10006CDF:  90                              nop      
  10006CE0:  39 3e                           cmp      dword ptr [esi], edi
  10006CE2:  7f 1c                           jg       0x10006d00
  10006CE4:  8d 45 0c                        lea      eax, [ebp + 0xc]
  10006CE7:  b9 a8 c1 08 10                  mov      ecx, 0x1008c1a8
  10006CEC:  50                              push     eax
  10006CED:  8d 45 b4                        lea      eax, [ebp - 0x4c]
  10006CF0:  83 c6 30                        add      esi, 0x30
  10006CF3:  50                              push     eax
  10006CF4:  e8 e7 f5 ff ff                  call     0x100062e0
  10006CF9:  8b 00                           mov      eax, dword ptr [eax]
  10006CFB:  3b 70 10                        cmp      esi, dword ptr [eax + 0x10]
  10006CFE:  75 e0                           jne      0x10006ce0
  10006D00:  8d 45 0c                        lea      eax, [ebp + 0xc]
  10006D03:  b9 a8 c1 08 10                  mov      ecx, 0x1008c1a8
  10006D08:  50                              push     eax
  10006D09:  8d 45 9c                        lea      eax, [ebp - 0x64]
  10006D0C:  50                              push     eax
  10006D0D:  e8 ce f5 ff ff                  call     0x100062e0
  10006D12:  8b 18                           mov      ebx, dword ptr [eax]
  10006D14:  89 7d c0                        mov      dword ptr [ebp - 0x40], edi
  10006D17:  8b 7d b0                        mov      edi, dword ptr [ebp - 0x50]
  10006D1A:  89 7d c4                        mov      dword ptr [ebp - 0x3c], edi
  10006D1D:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  10006D24:  8b 4d bc                        mov      ecx, dword ptr [ebp - 0x44]
  10006D27:  c7 45 fc 01 00 00 00            mov      dword ptr [ebp - 4], 1
  10006D2E:  8b 49 24                        mov      ecx, dword ptr [ecx + 0x24]
  10006D31:  85 c9                           test     ecx, ecx
  10006D33:  74 0b                           je       0x10006d40
  10006D35:  8b 01                           mov      eax, dword ptr [ecx]
  10006D37:  8d 55 c8                        lea      edx, [ebp - 0x38]
  10006D3A:  52                              push     edx
  10006D3B:  ff 10                           call     dword ptr [eax]
  10006D3D:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  10006D40:  8d 45 c0                        lea      eax, [ebp - 0x40]
  10006D43:  c7 45 fc 02 00 00 00            mov      dword ptr [ebp - 4], 2
  10006D4A:  50                              push     eax
  10006D4B:  56                              push     esi
  10006D4C:  8d 45 bc                        lea      eax, [ebp - 0x44]
  10006D4F:  50                              push     eax
  10006D50:  8d 4b 0c                        lea      ecx, [ebx + 0xc]
  10006D53:  e8 e8 06 00 00                  call     0x10007440
  10006D58:  8b 4d ec                        mov      ecx, dword ptr [ebp - 0x14]
  10006D5B:  c7 45 fc ff ff ff ff            mov      dword ptr [ebp - 4], 0xffffffff
  10006D62:  85 c9                           test     ecx, ecx
  10006D64:  74 18                           je       0x10006d7e
  10006D66:  8b 11                           mov      edx, dword ptr [ecx]
  10006D68:  8d 45 c8                        lea      eax, [ebp - 0x38]
  10006D6B:  3b c8                           cmp      ecx, eax
  10006D6D:  0f 95 c0                        setne    al
  10006D70:  0f b6 c0                        movzx    eax, al
  10006D73:  50                              push     eax
  10006D74:  ff 52 10                        call     dword ptr [edx + 0x10]
  10006D77:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  10006D7E:  8b 45 04                        mov      eax, dword ptr [ebp + 4]
  10006D81:  50                              push     eax
  10006D82:  57                              push     edi
  10006D83:  e8 b8 fa ff ff                  call     0x10006840
  10006D88:  83 c4 08                        add      esp, 8
  10006D8B:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  10006D8E:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  10006D95:  59                              pop      ecx
  10006D96:  5f                              pop      edi
  10006D97:  5e                              pop      esi
  10006D98:  5b                              pop      ebx
  10006D99:  8b 4d f0                        mov      ecx, dword ptr [ebp - 0x10]
  10006D9C:  33 cd                           xor      ecx, ebp
  10006D9E:  e8 14 56 02 00                  call     0x1002c3b7
  10006DA3:  8b e5                           mov      esp, ebp
  10006DA5:  5d                              pop      ebp
  10006DA6:  c3                              ret      


; === EventMgr::RemoveEventCallback ===
; RVA: 0x00006DB0  Size: 368 bytes
; Exports: ?RemoveEventCallback@EventMgr@GW@@YAXPAUHookEntry@2@W4EventID@12@@Z
;
  10006DB0:  55                              push     ebp
  10006DB1:  8b ec                           mov      ebp, esp
  10006DB3:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10006DB6:  83 ec 0c                        sub      esp, 0xc
  10006DB9:  53                              push     ebx
  10006DBA:  56                              push     esi
  10006DBB:  57                              push     edi
  10006DBC:  3d ff ff 00 00                  cmp      eax, 0xffff
  10006DC1:  75 28                           jne      0x10006deb
  10006DC3:  8b 3d ac c1 08 10               mov      edi, dword ptr [0x1008c1ac]
  10006DC9:  8b 37                           mov      esi, dword ptr [edi]
  10006DCB:  3b f7                           cmp      esi, edi
  10006DCD:  74 15                           je       0x10006de4
  10006DCF:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  10006DD2:  ff 76 08                        push     dword ptr [esi + 8]
  10006DD5:  53                              push     ebx
  10006DD6:  e8 d5 ff ff ff                  call     0x10006db0  ; EventMgr::RemoveEventCallback
  10006DDB:  8b 36                           mov      esi, dword ptr [esi]
  10006DDD:  83 c4 08                        add      esp, 8
  10006DE0:  3b f7                           cmp      esi, edi
  10006DE2:  75 ee                           jne      0x10006dd2
  10006DE4:  5f                              pop      edi
  10006DE5:  5e                              pop      esi
  10006DE6:  5b                              pop      ebx
  10006DE7:  8b e5                           mov      esp, ebp
  10006DE9:  5d                              pop      ebp
  10006DEA:  c3                              ret      
  10006DEB:  0f b6 c0                        movzx    eax, al
  10006DEE:  35 c5 9d 1c 81                  xor      eax, 0x811c9dc5
  10006DF3:  69 c8 93 01 00 01               imul     ecx, eax, 0x1000193
  10006DF9:  0f b6 45 0d                     movzx    eax, byte ptr [ebp + 0xd]
  10006DFD:  33 c8                           xor      ecx, eax
  10006DFF:  0f b6 45 0e                     movzx    eax, byte ptr [ebp + 0xe]
  10006E03:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  10006E09:  33 c8                           xor      ecx, eax
  10006E0B:  0f b6 45 0f                     movzx    eax, byte ptr [ebp + 0xf]
  10006E0F:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  10006E15:  33 c8                           xor      ecx, eax
  10006E17:  69 c1 93 01 00 01               imul     eax, ecx, 0x1000193
  10006E1D:  b9 a8 c1 08 10                  mov      ecx, 0x1008c1a8
  10006E22:  50                              push     eax
  10006E23:  8d 45 0c                        lea      eax, [ebp + 0xc]
  10006E26:  50                              push     eax
  10006E27:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10006E2A:  50                              push     eax
  10006E2B:  e8 b0 f3 ff ff                  call     0x100061e0
  10006E30:  8b 1d ac c1 08 10               mov      ebx, dword ptr [0x1008c1ac]
  10006E36:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  10006E39:  85 c0                           test     eax, eax
  10006E3B:  0f 45 d8                        cmovne   ebx, eax
  10006E3E:  89 5d fc                        mov      dword ptr [ebp - 4], ebx
  10006E41:  3b 1d ac c1 08 10               cmp      ebx, dword ptr [0x1008c1ac]
  10006E47:  74 9b                           je       0x10006de4
  10006E49:  0f 1f 80 00 00 00 00            nop      dword ptr [eax]
  10006E50:  8b 7b 0c                        mov      edi, dword ptr [ebx + 0xc]
  10006E53:  8b 4b 10                        mov      ecx, dword ptr [ebx + 0x10]
  10006E56:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  10006E59:  0f 1f 80 00 00 00 00            nop      dword ptr [eax]
  10006E60:  8b c7                           mov      eax, edi
  10006E62:  3b f9                           cmp      edi, ecx
  10006E64:  0f 84 7a ff ff ff               je       0x10006de4
  10006E6A:  83 c7 30                        add      edi, 0x30
  10006E6D:  39 50 04                        cmp      dword ptr [eax + 4], edx
  10006E70:  75 ee                           jne      0x10006e60
  10006E72:  8b c1                           mov      eax, ecx
  10006E74:  89 45 0c                        mov      dword ptr [ebp + 0xc], eax
  10006E77:  3b f8                           cmp      edi, eax
  10006E79:  74 7a                           je       0x10006ef5
  10006E7B:  8d 77 fc                        lea      esi, [edi - 4]
  10006E7E:  66 90                           nop      
  10006E80:  8b 07                           mov      eax, dword ptr [edi]
  10006E82:  8d 5e 0c                        lea      ebx, [esi + 0xc]
  10006E85:  89 46 d4                        mov      dword ptr [esi - 0x2c], eax
  10006E88:  8b 46 08                        mov      eax, dword ptr [esi + 8]
  10006E8B:  89 46 d8                        mov      dword ptr [esi - 0x28], eax
  10006E8E:  8d 46 dc                        lea      eax, [esi - 0x24]
  10006E91:  3b c3                           cmp      eax, ebx
  10006E93:  74 52                           je       0x10006ee7
  10006E95:  8b 0e                           mov      ecx, dword ptr [esi]
  10006E97:  85 c9                           test     ecx, ecx
  10006E99:  74 14                           je       0x10006eaf
  10006E9B:  8b 11                           mov      edx, dword ptr [ecx]
  10006E9D:  3b c8                           cmp      ecx, eax
  10006E9F:  0f 95 c0                        setne    al
  10006EA2:  0f b6 c0                        movzx    eax, al
  10006EA5:  50                              push     eax
  10006EA6:  ff 52 10                        call     dword ptr [edx + 0x10]
  10006EA9:  c7 06 00 00 00 00               mov      dword ptr [esi], 0
  10006EAF:  8b 4e 30                        mov      ecx, dword ptr [esi + 0x30]
  10006EB2:  85 c9                           test     ecx, ecx
  10006EB4:  74 31                           je       0x10006ee7
  10006EB6:  3b cb                           cmp      ecx, ebx
  10006EB8:  75 24                           jne      0x10006ede
  10006EBA:  8b 01                           mov      eax, dword ptr [ecx]
  10006EBC:  8b 50 04                        mov      edx, dword ptr [eax + 4]
  10006EBF:  8d 46 dc                        lea      eax, [esi - 0x24]
  10006EC2:  50                              push     eax
  10006EC3:  ff d2                           call     edx
  10006EC5:  89 06                           mov      dword ptr [esi], eax
  10006EC7:  8b 4e 30                        mov      ecx, dword ptr [esi + 0x30]
  10006ECA:  85 c9                           test     ecx, ecx
  10006ECC:  74 19                           je       0x10006ee7
  10006ECE:  8b 11                           mov      edx, dword ptr [ecx]
  10006ED0:  3b cb                           cmp      ecx, ebx
  10006ED2:  0f 95 c0                        setne    al
  10006ED5:  0f b6 c0                        movzx    eax, al
  10006ED8:  50                              push     eax
  10006ED9:  ff 52 10                        call     dword ptr [edx + 0x10]
  10006EDC:  eb 02                           jmp      0x10006ee0
  10006EDE:  89 0e                           mov      dword ptr [esi], ecx
  10006EE0:  c7 46 30 00 00 00 00            mov      dword ptr [esi + 0x30], 0
  10006EE7:  83 c7 30                        add      edi, 0x30
  10006EEA:  83 c6 30                        add      esi, 0x30
  10006EED:  3b 7d 0c                        cmp      edi, dword ptr [ebp + 0xc]
  10006EF0:  75 8e                           jne      0x10006e80
  10006EF2:  8b 5d fc                        mov      ebx, dword ptr [ebp - 4]
  10006EF5:  8b 73 10                        mov      esi, dword ptr [ebx + 0x10]
  10006EF8:  83 ee 28                        sub      esi, 0x28
  10006EFB:  8b 4e 24                        mov      ecx, dword ptr [esi + 0x24]
  10006EFE:  85 c9                           test     ecx, ecx
  10006F00:  74 15                           je       0x10006f17
  10006F02:  8b 11                           mov      edx, dword ptr [ecx]
  10006F04:  3b ce                           cmp      ecx, esi
  10006F06:  0f 95 c0                        setne    al
  10006F09:  0f b6 c0                        movzx    eax, al
  10006F0C:  50                              push     eax
  10006F0D:  ff 52 10                        call     dword ptr [edx + 0x10]
  10006F10:  c7 46 24 00 00 00 00            mov      dword ptr [esi + 0x24], 0
  10006F17:  83 43 10 d0                     add      dword ptr [ebx + 0x10], -0x30
  10006F1B:  e9 30 ff ff ff                  jmp      0x10006e50


