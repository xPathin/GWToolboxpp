; Module: EffectMgr
; Functions: 12
; Total code size: 772 bytes
;

; === Effects::DropBuff ===
; RVA: 0x00005990  Size: 210 bytes
; Exports: ?DropBuff@Effects@GW@@YA_NI@Z
;
  10005990:  55                              push     ebp
  10005991:  8b ec                           mov      ebp, esp
  10005993:  83 ec 34                        sub      esp, 0x34
  10005996:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1000599B:  33 c5                           xor      eax, ebp
  1000599D:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  100059A0:  56                              push     esi
  100059A1:  57                              push     edi
  100059A2:  e8 f9 36 01 00                  call     0x100190a0  ; GW::GetWorldContext
  100059A7:  85 c0                           test     eax, eax
  100059A9:  74 48                           je       0x100059f3
  100059AB:  05 08 05 00 00                  add      eax, 0x508
  100059B0:  83 38 00                        cmp      dword ptr [eax], 0
  100059B3:  74 3e                           je       0x100059f3
  100059B5:  85 c0                           test     eax, eax
  100059B7:  74 3a                           je       0x100059f3
  100059B9:  8b 10                           mov      edx, dword ptr [eax]
  100059BB:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  100059BE:  8d 04 c0                        lea      eax, [eax + eax*8]
  100059C1:  8d 3c 82                        lea      edi, [edx + eax*4]
  100059C4:  3b d7                           cmp      edx, edi
  100059C6:  74 2b                           je       0x100059f3
  100059C8:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  100059CB:  0f 1f 44 00 00                  nop      dword ptr [eax + eax]
  100059D0:  8b 4a 0c                        mov      ecx, dword ptr [edx + 0xc]
  100059D3:  8b 42 04                        mov      eax, dword ptr [edx + 4]
  100059D6:  c1 e1 04                        shl      ecx, 4
  100059D9:  03 c8                           add      ecx, eax
  100059DB:  3b c1                           cmp      eax, ecx
  100059DD:  74 0d                           je       0x100059ec
  100059DF:  90                              nop      
  100059E0:  39 70 08                        cmp      dword ptr [eax + 8], esi
  100059E3:  74 20                           je       0x10005a05
  100059E5:  83 c0 10                        add      eax, 0x10
  100059E8:  3b c1                           cmp      eax, ecx
  100059EA:  75 f4                           jne      0x100059e0
  100059EC:  83 c2 24                        add      edx, 0x24
  100059EF:  3b d7                           cmp      edx, edi
  100059F1:  75 dd                           jne      0x100059d0
  100059F3:  5f                              pop      edi
  100059F4:  32 c0                           xor      al, al
  100059F6:  5e                              pop      esi
  100059F7:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  100059FA:  33 cd                           xor      ecx, ebp
  100059FC:  e8 b6 69 02 00                  call     0x1002c3b7
  10005A01:  8b e5                           mov      esp, ebp
  10005A03:  5d                              pop      ebp
  10005A04:  c3                              ret      
  10005A05:  0f 10 00                        movups   xmm0, xmmword ptr [eax]
  10005A08:  a1 90 c1 08 10                  mov      eax, dword ptr [0x1008c190]
  10005A0D:  8b 0a                           mov      ecx, dword ptr [edx]
  10005A0F:  c7 45 cc 00 00 00 00            mov      dword ptr [ebp - 0x34], 0
  10005A16:  c7 45 d0 00 00 00 00            mov      dword ptr [ebp - 0x30], 0
  10005A1D:  89 4d d4                        mov      dword ptr [ebp - 0x2c], ecx
  10005A20:  c7 45 e8 00 00 00 00            mov      dword ptr [ebp - 0x18], 0
  10005A27:  c7 45 ec 01 00 00 00            mov      dword ptr [ebp - 0x14], 1
  10005A2E:  c7 45 f8 01 00 00 00            mov      dword ptr [ebp - 8], 1
  10005A35:  0f 11 45 d8                     movups   xmmword ptr [ebp - 0x28], xmm0
  10005A39:  0f 57 c0                        xorps    xmm0, xmm0
  10005A3C:  66 0f 13 45 f0                  movlpd   qword ptr [ebp - 0x10], xmm0
  10005A41:  85 c0                           test     eax, eax
  10005A43:  74 ae                           je       0x100059f3
  10005A45:  8d 4d e8                        lea      ecx, [ebp - 0x18]
  10005A48:  33 d2                           xor      edx, edx
  10005A4A:  51                              push     ecx
  10005A4B:  8d 4d cc                        lea      ecx, [ebp - 0x34]
  10005A4E:  ff d0                           call     eax
  10005A50:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10005A53:  b0 01                           mov      al, 1
  10005A55:  5f                              pop      edi
  10005A56:  33 cd                           xor      ecx, ebp
  10005A58:  5e                              pop      esi
  10005A59:  e8 59 69 02 00                  call     0x1002c3b7
  10005A5E:  8b e5                           mov      esp, ebp
  10005A60:  5d                              pop      ebp
  10005A61:  c3                              ret      


; === Effects::GetAgentBuffs ===
; RVA: 0x00005A70  Size: 80 bytes
; Exports: ?GetAgentBuffs@Effects@GW@@YAPAV?$Array@UBuff@GW@@@2@I@Z
;
  10005A70:  55                              push     ebp
  10005A71:  8b ec                           mov      ebp, esp
  10005A73:  e8 28 36 01 00                  call     0x100190a0  ; GW::GetWorldContext
  10005A78:  85 c0                           test     eax, eax
  10005A7A:  74 40                           je       0x10005abc
  10005A7C:  83 b8 08 05 00 00 00            cmp      dword ptr [eax + 0x508], 0
  10005A83:  8d 88 08 05 00 00               lea      ecx, [eax + 0x508]
  10005A89:  74 31                           je       0x10005abc
  10005A8B:  85 c9                           test     ecx, ecx
  10005A8D:  74 2d                           je       0x10005abc
  10005A8F:  8b 01                           mov      eax, dword ptr [ecx]
  10005A91:  8b 49 08                        mov      ecx, dword ptr [ecx + 8]
  10005A94:  8d 0c c9                        lea      ecx, [ecx + ecx*8]
  10005A97:  8d 14 88                        lea      edx, [eax + ecx*4]
  10005A9A:  3b c2                           cmp      eax, edx
  10005A9C:  74 1e                           je       0x10005abc
  10005A9E:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10005AA1:  39 08                           cmp      dword ptr [eax], ecx
  10005AA3:  74 0b                           je       0x10005ab0
  10005AA5:  83 c0 24                        add      eax, 0x24
  10005AA8:  3b c2                           cmp      eax, edx
  10005AAA:  75 f5                           jne      0x10005aa1
  10005AAC:  33 c0                           xor      eax, eax
  10005AAE:  5d                              pop      ebp
  10005AAF:  c3                              ret      
  10005AB0:  85 c0                           test     eax, eax
  10005AB2:  74 08                           je       0x10005abc
  10005AB4:  83 c0 04                        add      eax, 4
  10005AB7:  83 38 00                        cmp      dword ptr [eax], 0
  10005ABA:  75 02                           jne      0x10005abe
  10005ABC:  33 c0                           xor      eax, eax
  10005ABE:  5d                              pop      ebp
  10005ABF:  c3                              ret      


; === Effects::GetAgentEffects ===
; RVA: 0x00005AC0  Size: 80 bytes
; Exports: ?GetAgentEffects@Effects@GW@@YAPAV?$Array@UEffect@GW@@@2@I@Z
;
  10005AC0:  55                              push     ebp
  10005AC1:  8b ec                           mov      ebp, esp
  10005AC3:  e8 d8 35 01 00                  call     0x100190a0  ; GW::GetWorldContext
  10005AC8:  85 c0                           test     eax, eax
  10005ACA:  74 40                           je       0x10005b0c
  10005ACC:  83 b8 08 05 00 00 00            cmp      dword ptr [eax + 0x508], 0
  10005AD3:  8d 88 08 05 00 00               lea      ecx, [eax + 0x508]
  10005AD9:  74 31                           je       0x10005b0c
  10005ADB:  85 c9                           test     ecx, ecx
  10005ADD:  74 2d                           je       0x10005b0c
  10005ADF:  8b 01                           mov      eax, dword ptr [ecx]
  10005AE1:  8b 49 08                        mov      ecx, dword ptr [ecx + 8]
  10005AE4:  8d 0c c9                        lea      ecx, [ecx + ecx*8]
  10005AE7:  8d 14 88                        lea      edx, [eax + ecx*4]
  10005AEA:  3b c2                           cmp      eax, edx
  10005AEC:  74 1e                           je       0x10005b0c
  10005AEE:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10005AF1:  39 08                           cmp      dword ptr [eax], ecx
  10005AF3:  74 0b                           je       0x10005b00
  10005AF5:  83 c0 24                        add      eax, 0x24
  10005AF8:  3b c2                           cmp      eax, edx
  10005AFA:  75 f5                           jne      0x10005af1
  10005AFC:  33 c0                           xor      eax, eax
  10005AFE:  5d                              pop      ebp
  10005AFF:  c3                              ret      
  10005B00:  85 c0                           test     eax, eax
  10005B02:  74 08                           je       0x10005b0c
  10005B04:  83 c0 14                        add      eax, 0x14
  10005B07:  83 38 00                        cmp      dword ptr [eax], 0
  10005B0A:  75 02                           jne      0x10005b0e
  10005B0C:  33 c0                           xor      eax, eax
  10005B0E:  5d                              pop      ebp
  10005B0F:  c3                              ret      


; === Effects::GetAgentEffectsArray, GetAgentEffectsArray ===
; RVA: 0x00005B10  Size: 64 bytes
; Exports: ?GetAgentEffectsArray@Effects@GW@@YAPAUAgentEffects@2@I@Z, GetAgentEffectsArray
;
  10005B10:  55                              push     ebp
  10005B11:  8b ec                           mov      ebp, esp
  10005B13:  e8 88 35 01 00                  call     0x100190a0  ; GW::GetWorldContext
  10005B18:  85 c0                           test     eax, eax
  10005B1A:  74 30                           je       0x10005b4c
  10005B1C:  83 b8 08 05 00 00 00            cmp      dword ptr [eax + 0x508], 0
  10005B23:  8d 88 08 05 00 00               lea      ecx, [eax + 0x508]
  10005B29:  74 21                           je       0x10005b4c
  10005B2B:  85 c9                           test     ecx, ecx
  10005B2D:  74 1d                           je       0x10005b4c
  10005B2F:  8b 01                           mov      eax, dword ptr [ecx]
  10005B31:  8b 49 08                        mov      ecx, dword ptr [ecx + 8]
  10005B34:  8d 0c c9                        lea      ecx, [ecx + ecx*8]
  10005B37:  8d 14 88                        lea      edx, [eax + ecx*4]
  10005B3A:  3b c2                           cmp      eax, edx
  10005B3C:  74 0e                           je       0x10005b4c
  10005B3E:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10005B41:  39 08                           cmp      dword ptr [eax], ecx
  10005B43:  74 09                           je       0x10005b4e
  10005B45:  83 c0 24                        add      eax, 0x24
  10005B48:  3b c2                           cmp      eax, edx
  10005B4A:  75 f5                           jne      0x10005b41
  10005B4C:  33 c0                           xor      eax, eax
  10005B4E:  5d                              pop      ebp
  10005B4F:  c3                              ret      


; === Effects::GetAlcoholLevel, GetAlcoholLevel ===
; RVA: 0x00005B50  Size: 57 bytes
; Exports: ?GetAlcoholLevel@Effects@GW@@YAIXZ, GetAlcoholLevel
;
  10005B50:  55                              push     ebp
  10005B51:  8b ec                           mov      ebp, esp
  10005B53:  51                              push     ecx
  10005B54:  f3 0f 10 05 8c c1 08 10         movss    xmm0, dword ptr [0x1008c18c]
  10005B5C:  f3 0f 59 05 84 cc 04 10         mulss    xmm0, dword ptr [0x1004cc84]
  10005B64:  51                              push     ecx
  10005B65:  f3 0f 11 45 fc                  movss    dword ptr [ebp - 4], xmm0
  10005B6A:  d9 45 fc                        fld      dword ptr [ebp - 4]
  10005B6D:  d9 1c 24                        fstp     dword ptr [esp]
  10005B70:  e8 cb 02 03 00                  call     0x10035e40
  10005B75:  83 c4 04                        add      esp, 4
  10005B78:  d9 5d fc                        fstp     dword ptr [ebp - 4]
  10005B7B:  f3 0f 10 45 fc                  movss    xmm0, dword ptr [ebp - 4]
  10005B80:  e8 5b 6a 02 00                  call     0x1002c5e0
  10005B85:  8b e5                           mov      esp, ebp
  10005B87:  5d                              pop      ebp
  10005B88:  c3                              ret      


; === Effects::GetDrunkAf, GetDrunkAf ===
; RVA: 0x00005B90  Size: 45 bytes
; Exports: ?GetDrunkAf@Effects@GW@@YAXMI@Z, GetDrunkAf
;
  10005B90:  55                              push     ebp
  10005B91:  8b ec                           mov      ebp, esp
  10005B93:  83 ec 08                        sub      esp, 8
  10005B96:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10005B99:  f3 0f 10 45 08                  movss    xmm0, dword ptr [ebp + 8]
  10005B9E:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  10005BA1:  8d 45 f8                        lea      eax, [ebp - 8]
  10005BA4:  6a 00                           push     0
  10005BA6:  50                              push     eax
  10005BA7:  68 34 00 00 10                  push     0x10000034
  10005BAC:  f3 0f 11 45 fc                  movss    dword ptr [ebp - 4], xmm0
  10005BB1:  e8 1a 25 02 00                  call     0x100280d0  ; UI::SendUIMessage
  10005BB6:  83 c4 0c                        add      esp, 0xc
  10005BB9:  8b e5                           mov      esp, ebp
  10005BBB:  5d                              pop      ebp
  10005BBC:  c3                              ret      


; === Effects::GetPartyEffectsArray ===
; RVA: 0x00005BC0  Size: 22 bytes
; Exports: ?GetPartyEffectsArray@Effects@GW@@YAPAV?$Array@UAgentEffects@GW@@@2@XZ
;
  10005BC0:  e8 db 34 01 00                  call     0x100190a0  ; GW::GetWorldContext
  10005BC5:  85 c0                           test     eax, eax
  10005BC7:  74 0a                           je       0x10005bd3
  10005BC9:  05 08 05 00 00                  add      eax, 0x508
  10005BCE:  83 38 00                        cmp      dword ptr [eax], 0
  10005BD1:  75 02                           jne      0x10005bd5
  10005BD3:  33 c0                           xor      eax, eax
  10005BD5:  c3                              ret      


; === Effects::GetPlayerBuffBySkillId, GetPlayerBuffBySkillId ===
; RVA: 0x00005BE0  Size: 55 bytes
; Exports: ?GetPlayerBuffBySkillId@Effects@GW@@YAPAUBuff@2@W4SkillID@Constants@2@@Z, GetPlayerBuffBySkillId
;
  10005BE0:  55                              push     ebp
  10005BE1:  8b ec                           mov      ebp, esp
  10005BE3:  e8 e8 c6 ff ff                  call     0x100022d0  ; Agents::GetControlledCharacterId, GetControlledCharacterId
  10005BE8:  50                              push     eax
  10005BE9:  e8 82 fe ff ff                  call     0x10005a70  ; Effects::GetAgentBuffs
  10005BEE:  8b c8                           mov      ecx, eax
  10005BF0:  83 c4 04                        add      esp, 4
  10005BF3:  85 c9                           test     ecx, ecx
  10005BF5:  74 1c                           je       0x10005c13
  10005BF7:  8b 01                           mov      eax, dword ptr [ecx]
  10005BF9:  8b 49 08                        mov      ecx, dword ptr [ecx + 8]
  10005BFC:  c1 e1 04                        shl      ecx, 4
  10005BFF:  03 c8                           add      ecx, eax
  10005C01:  3b c1                           cmp      eax, ecx
  10005C03:  74 0e                           je       0x10005c13
  10005C05:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  10005C08:  39 10                           cmp      dword ptr [eax], edx
  10005C0A:  74 09                           je       0x10005c15
  10005C0C:  83 c0 10                        add      eax, 0x10
  10005C0F:  3b c1                           cmp      eax, ecx
  10005C11:  75 f5                           jne      0x10005c08
  10005C13:  33 c0                           xor      eax, eax
  10005C15:  5d                              pop      ebp
  10005C16:  c3                              ret      


; === Effects::GetPlayerBuffs ===
; RVA: 0x00005C20  Size: 15 bytes
; Exports: ?GetPlayerBuffs@Effects@GW@@YAPAV?$Array@UBuff@GW@@@2@XZ
;
  10005C20:  e8 ab c6 ff ff                  call     0x100022d0  ; Agents::GetControlledCharacterId, GetControlledCharacterId
  10005C25:  50                              push     eax
  10005C26:  e8 45 fe ff ff                  call     0x10005a70  ; Effects::GetAgentBuffs
  10005C2B:  83 c4 04                        add      esp, 4
  10005C2E:  c3                              ret      


; === Effects::GetPlayerEffectBySkillId, GetPlayerEffectBySkillId ===
; RVA: 0x00005C30  Size: 63 bytes
; Exports: ?GetPlayerEffectBySkillId@Effects@GW@@YAPAUEffect@2@W4SkillID@Constants@2@@Z, GetPlayerEffectBySkillId
;
  10005C30:  55                              push     ebp
  10005C31:  8b ec                           mov      ebp, esp
  10005C33:  e8 98 c6 ff ff                  call     0x100022d0  ; Agents::GetControlledCharacterId, GetControlledCharacterId
  10005C38:  50                              push     eax
  10005C39:  e8 82 fe ff ff                  call     0x10005ac0  ; Effects::GetAgentEffects
  10005C3E:  8b c8                           mov      ecx, eax
  10005C40:  83 c4 04                        add      esp, 4
  10005C43:  85 c9                           test     ecx, ecx
  10005C45:  74 24                           je       0x10005c6b
  10005C47:  8b 01                           mov      eax, dword ptr [ecx]
  10005C49:  8b 49 08                        mov      ecx, dword ptr [ecx + 8]
  10005C4C:  8d 0c 49                        lea      ecx, [ecx + ecx*2]
  10005C4F:  8d 14 c8                        lea      edx, [eax + ecx*8]
  10005C52:  3b c2                           cmp      eax, edx
  10005C54:  74 15                           je       0x10005c6b
  10005C56:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10005C59:  0f 1f 80 00 00 00 00            nop      dword ptr [eax]
  10005C60:  39 08                           cmp      dword ptr [eax], ecx
  10005C62:  74 09                           je       0x10005c6d
  10005C64:  83 c0 18                        add      eax, 0x18
  10005C67:  3b c2                           cmp      eax, edx
  10005C69:  75 f5                           jne      0x10005c60
  10005C6B:  33 c0                           xor      eax, eax
  10005C6D:  5d                              pop      ebp
  10005C6E:  c3                              ret      


; === Effects::GetPlayerEffects ===
; RVA: 0x00005C70  Size: 15 bytes
; Exports: ?GetPlayerEffects@Effects@GW@@YAPAV?$Array@UEffect@GW@@@2@XZ
;
  10005C70:  e8 5b c6 ff ff                  call     0x100022d0  ; Agents::GetControlledCharacterId, GetControlledCharacterId
  10005C75:  50                              push     eax
  10005C76:  e8 45 fe ff ff                  call     0x10005ac0  ; Effects::GetAgentEffects
  10005C7B:  83 c4 04                        add      esp, 4
  10005C7E:  c3                              ret      


; === Effects::GetPlayerEffectsArray, GetPlayerEffectsArray ===
; RVA: 0x00005C80  Size: 66 bytes
; Exports: ?GetPlayerEffectsArray@Effects@GW@@YAPAUAgentEffects@2@XZ, GetPlayerEffectsArray
;
  10005C80:  56                              push     esi
  10005C81:  e8 4a c6 ff ff                  call     0x100022d0  ; Agents::GetControlledCharacterId, GetControlledCharacterId
  10005C86:  8b f0                           mov      esi, eax
  10005C88:  e8 13 34 01 00                  call     0x100190a0  ; GW::GetWorldContext
  10005C8D:  85 c0                           test     eax, eax
  10005C8F:  74 2d                           je       0x10005cbe
  10005C91:  83 b8 08 05 00 00 00            cmp      dword ptr [eax + 0x508], 0
  10005C98:  8d 88 08 05 00 00               lea      ecx, [eax + 0x508]
  10005C9E:  74 1e                           je       0x10005cbe
  10005CA0:  85 c9                           test     ecx, ecx
  10005CA2:  74 1a                           je       0x10005cbe
  10005CA4:  8b 01                           mov      eax, dword ptr [ecx]
  10005CA6:  8b 49 08                        mov      ecx, dword ptr [ecx + 8]
  10005CA9:  8d 0c c9                        lea      ecx, [ecx + ecx*8]
  10005CAC:  8d 0c 88                        lea      ecx, [eax + ecx*4]
  10005CAF:  3b c1                           cmp      eax, ecx
  10005CB1:  74 0b                           je       0x10005cbe
  10005CB3:  39 30                           cmp      dword ptr [eax], esi
  10005CB5:  74 09                           je       0x10005cc0
  10005CB7:  83 c0 24                        add      eax, 0x24
  10005CBA:  3b c1                           cmp      eax, ecx
  10005CBC:  75 f5                           jne      0x10005cb3
  10005CBE:  33 c0                           xor      eax, eax
  10005CC0:  5e                              pop      esi
  10005CC1:  c3                              ret      


