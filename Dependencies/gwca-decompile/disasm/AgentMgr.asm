; Module: AgentMgr
; Functions: 29
; Total code size: 2271 bytes
;

; === Agents::ChangeTarget, ChangeTargetById ===
; RVA: 0x00001E50  Size: 42 bytes
; Exports: ?ChangeTarget@Agents@GW@@YA_NI@Z, ChangeTargetById
;
  10001E50:  55                              push     ebp
  10001E51:  8b ec                           mov      ebp, esp
  10001E53:  83 ec 08                        sub      esp, 8
  10001E56:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10001E59:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  10001E5C:  8d 45 f8                        lea      eax, [ebp - 8]
  10001E5F:  6a 00                           push     0
  10001E61:  50                              push     eax
  10001E62:  68 0b 00 00 30                  push     0x3000000b
  10001E67:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10001E6E:  e8 5d 62 02 00                  call     0x100280d0  ; UI::SendUIMessage
  10001E73:  83 c4 0c                        add      esp, 0xc
  10001E76:  8b e5                           mov      esp, ebp
  10001E78:  5d                              pop      ebp
  10001E79:  c3                              ret      


; === Agents::ChangeTarget, ChangeTargetByAgent ===
; RVA: 0x00001E80  Size: 55 bytes
; Exports: ?ChangeTarget@Agents@GW@@YA_NPBUAgent@2@@Z, ChangeTargetByAgent
;
  10001E80:  55                              push     ebp
  10001E81:  8b ec                           mov      ebp, esp
  10001E83:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10001E86:  83 ec 08                        sub      esp, 8
  10001E89:  85 c0                           test     eax, eax
  10001E8B:  74 24                           je       0x10001eb1
  10001E8D:  8b 40 2c                        mov      eax, dword ptr [eax + 0x2c]
  10001E90:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  10001E93:  8d 45 f8                        lea      eax, [ebp - 8]
  10001E96:  6a 00                           push     0
  10001E98:  50                              push     eax
  10001E99:  68 0b 00 00 30                  push     0x3000000b
  10001E9E:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10001EA5:  e8 26 62 02 00                  call     0x100280d0  ; UI::SendUIMessage
  10001EAA:  83 c4 0c                        add      esp, 0xc
  10001EAD:  8b e5                           mov      esp, ebp
  10001EAF:  5d                              pop      ebp
  10001EB0:  c3                              ret      
  10001EB1:  32 c0                           xor      al, al
  10001EB3:  8b e5                           mov      esp, ebp
  10001EB5:  5d                              pop      ebp
  10001EB6:  c3                              ret      


; === Agents::CountAllegianceInRange ===
; RVA: 0x00001EC0  Size: 161 bytes
; Exports: ?CountAllegianceInRange@Agents@GW@@YAIW4Allegiance@Constants@2@M@Z
;
  10001EC0:  55                              push     ebp
  10001EC1:  8b ec                           mov      ebp, esp
  10001EC3:  57                              push     edi
  10001EC4:  e8 87 03 00 00                  call     0x10002250  ; Agents::GetControlledCharacter
  10001EC9:  8b f8                           mov      edi, eax
  10001ECB:  85 ff                           test     edi, edi
  10001ECD:  74 7c                           je       0x10001f4b
  10001ECF:  a1 a4 c0 08 10                  mov      eax, dword ptr [0x1008c0a4]
  10001ED4:  85 c0                           test     eax, eax
  10001ED6:  74 05                           je       0x10001edd
  10001ED8:  83 38 00                        cmp      dword ptr [eax], 0
  10001EDB:  75 02                           jne      0x10001edf
  10001EDD:  33 c0                           xor      eax, eax
  10001EDF:  33 d2                           xor      edx, edx
  10001EE1:  85 c0                           test     eax, eax
  10001EE3:  74 66                           je       0x10001f4b
  10001EE5:  8b 08                           mov      ecx, dword ptr [eax]
  10001EE7:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  10001EEA:  56                              push     esi
  10001EEB:  8d 34 81                        lea      esi, [ecx + eax*4]
  10001EEE:  3b ce                           cmp      ecx, esi
  10001EF0:  74 53                           je       0x10001f45
  10001EF2:  f3 0f 10 55 0c                  movss    xmm2, dword ptr [ebp + 0xc]
  10001EF7:  53                              push     ebx
  10001EF8:  8a 5d 08                        mov      bl, byte ptr [ebp + 8]
  10001EFB:  0f 1f 44 00 00                  nop      dword ptr [eax + eax]
  10001F00:  8b 01                           mov      eax, dword ptr [ecx]
  10001F02:  85 c0                           test     eax, eax
  10001F04:  74 37                           je       0x10001f3d
  10001F06:  f6 80 9c 00 00 00 db            test     byte ptr [eax + 0x9c], 0xdb
  10001F0D:  74 2e                           je       0x10001f3d
  10001F0F:  38 98 b5 01 00 00               cmp      byte ptr [eax + 0x1b5], bl
  10001F15:  75 26                           jne      0x10001f3d
  10001F17:  f3 0f 10 4f 74                  movss    xmm1, dword ptr [edi + 0x74]
  10001F1C:  f3 0f 10 47 78                  movss    xmm0, dword ptr [edi + 0x78]
  10001F21:  f3 0f 5c 40 78                  subss    xmm0, dword ptr [eax + 0x78]
  10001F26:  f3 0f 5c 48 74                  subss    xmm1, dword ptr [eax + 0x74]
  10001F2B:  f3 0f 59 c0                     mulss    xmm0, xmm0
  10001F2F:  f3 0f 59 c9                     mulss    xmm1, xmm1
  10001F33:  f3 0f 58 c1                     addss    xmm0, xmm1
  10001F37:  0f 2f d0                        comiss   xmm2, xmm0
  10001F3A:  72 01                           jb       0x10001f3d
  10001F3C:  42                              inc      edx
  10001F3D:  83 c1 04                        add      ecx, 4
  10001F40:  3b ce                           cmp      ecx, esi
  10001F42:  75 bc                           jne      0x10001f00
  10001F44:  5b                              pop      ebx
  10001F45:  5e                              pop      esi
  10001F46:  8b c2                           mov      eax, edx
  10001F48:  5f                              pop      edi
  10001F49:  5d                              pop      ebp
  10001F4A:  c3                              ret      
  10001F4B:  33 c0                           xor      eax, eax
  10001F4D:  5f                              pop      edi
  10001F4E:  5d                              pop      ebp
  10001F4F:  c3                              ret      
  10001F50:  a1 a4 c0 08 10                  mov      eax, dword ptr [0x1008c0a4]
  10001F55:  85 c0                           test     eax, eax
  10001F57:  74 05                           je       0x10001f5e
  10001F59:  83 38 00                        cmp      dword ptr [eax], 0
  10001F5C:  75 02                           jne      0x10001f60
  10001F5E:  33 c0                           xor      eax, eax
  10001F60:  c3                              ret      


; === Agents::GetAgentArray ===
; RVA: 0x00001F50  Size: 17 bytes
; Exports: ?GetAgentArray@Agents@GW@@YAPAV?$Array@PAUAgent@GW@@@2@XZ
;
  10001F50:  a1 a4 c0 08 10                  mov      eax, dword ptr [0x1008c0a4]
  10001F55:  85 c0                           test     eax, eax
  10001F57:  74 05                           je       0x10001f5e
  10001F59:  83 38 00                        cmp      dword ptr [eax], 0
  10001F5C:  75 02                           jne      0x10001f60
  10001F5E:  33 c0                           xor      eax, eax
  10001F60:  c3                              ret      


; === Agents::GetAgentByID, GetAgentByID ===
; RVA: 0x00001F70  Size: 83 bytes
; Exports: ?GetAgentByID@Agents@GW@@YAPAUAgent@2@I@Z, GetAgentByID
;
  10001F70:  55                              push     ebp
  10001F71:  8b ec                           mov      ebp, esp
  10001F73:  56                              push     esi
  10001F74:  57                              push     edi
  10001F75:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  10001F78:  85 ff                           test     edi, edi
  10001F7A:  74 41                           je       0x10001fbd
  10001F7C:  8b 35 a4 c0 08 10               mov      esi, dword ptr [0x1008c0a4]
  10001F82:  85 f6                           test     esi, esi
  10001F84:  74 05                           je       0x10001f8b
  10001F86:  83 3e 00                        cmp      dword ptr [esi], 0
  10001F89:  75 02                           jne      0x10001f8d
  10001F8B:  33 f6                           xor      esi, esi
  10001F8D:  85 f6                           test     esi, esi
  10001F8F:  74 2c                           je       0x10001fbd
  10001F91:  3b 7e 08                        cmp      edi, dword ptr [esi + 8]
  10001F94:  73 27                           jae      0x10001fbd
  10001F96:  83 3e 00                        cmp      dword ptr [esi], 0
  10001F99:  75 19                           jne      0x10001fb4
  10001F9B:  68 80 c4 04 10                  push     0x1004c480  ; "GW::BaseArray<struct GW::Agent *>::at"
  10001FA0:  6a 1e                           push     0x1e
  10001FA2:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  10001FA7:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  10001FAC:  e8 bf 38 00 00                  call     0x10005870  ; GW::FatalAssert
  10001FB1:  83 c4 10                        add      esp, 0x10
  10001FB4:  8b 06                           mov      eax, dword ptr [esi]
  10001FB6:  8b 04 b8                        mov      eax, dword ptr [eax + edi*4]
  10001FB9:  5f                              pop      edi
  10001FBA:  5e                              pop      esi
  10001FBB:  5d                              pop      ebp
  10001FBC:  c3                              ret      
  10001FBD:  5f                              pop      edi
  10001FBE:  33 c0                           xor      eax, eax
  10001FC0:  5e                              pop      esi
  10001FC1:  5d                              pop      ebp
  10001FC2:  c3                              ret      


; === Agents::GetAgentEncName ===
; RVA: 0x00001FD0  Size: 135 bytes
; Exports: ?GetAgentEncName@Agents@GW@@YAPA_WI@Z
;
  10001FD0:  55                              push     ebp
  10001FD1:  8b ec                           mov      ebp, esp
  10001FD3:  56                              push     esi
  10001FD4:  57                              push     edi
  10001FD5:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  10001FD8:  85 ff                           test     edi, edi
  10001FDA:  74 4c                           je       0x10002028
  10001FDC:  8b 35 a4 c0 08 10               mov      esi, dword ptr [0x1008c0a4]
  10001FE2:  85 f6                           test     esi, esi
  10001FE4:  74 05                           je       0x10001feb
  10001FE6:  83 3e 00                        cmp      dword ptr [esi], 0
  10001FE9:  75 02                           jne      0x10001fed
  10001FEB:  33 f6                           xor      esi, esi
  10001FED:  85 f6                           test     esi, esi
  10001FEF:  74 37                           je       0x10002028
  10001FF1:  3b 7e 08                        cmp      edi, dword ptr [esi + 8]
  10001FF4:  73 32                           jae      0x10002028
  10001FF6:  83 3e 00                        cmp      dword ptr [esi], 0
  10001FF9:  75 19                           jne      0x10002014
  10001FFB:  68 80 c4 04 10                  push     0x1004c480  ; "GW::BaseArray<struct GW::Agent *>::at"
  10002000:  6a 1e                           push     0x1e
  10002002:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  10002007:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  1000200C:  e8 5f 38 00 00                  call     0x10005870  ; GW::FatalAssert
  10002011:  83 c4 10                        add      esp, 0x10
  10002014:  8b 06                           mov      eax, dword ptr [esi]
  10002016:  8b 04 b8                        mov      eax, dword ptr [eax + edi*4]
  10002019:  85 c0                           test     eax, eax
  1000201B:  74 0b                           je       0x10002028
  1000201D:  5f                              pop      edi
  1000201E:  5e                              pop      esi
  1000201F:  89 45 08                        mov      dword ptr [ebp + 8], eax
  10002022:  5d                              pop      ebp
  10002023:  e9 38 00 00 00                  jmp      0x10002060
  10002028:  e8 73 70 01 00                  call     0x100190a0  ; GW::GetWorldContext
  1000202D:  83 b8 cc 07 00 00 00            cmp      dword ptr [eax + 0x7cc], 0
  10002034:  74 1b                           je       0x10002051
  10002036:  3b b8 d4 07 00 00               cmp      edi, dword ptr [eax + 0x7d4]
  1000203C:  73 13                           jae      0x10002051
  1000203E:  57                              push     edi
  1000203F:  8d 88 cc 07 00 00               lea      ecx, [eax + 0x7cc]
  10002045:  e8 66 fc ff ff                  call     0x10001cb0
  1000204A:  5f                              pop      edi
  1000204B:  5e                              pop      esi
  1000204C:  8b 40 34                        mov      eax, dword ptr [eax + 0x34]
  1000204F:  5d                              pop      ebp
  10002050:  c3                              ret      
  10002051:  5f                              pop      edi
  10002052:  33 c0                           xor      eax, eax
  10002054:  5e                              pop      esi
  10002055:  5d                              pop      ebp
  10002056:  c3                              ret      


; === Agents::GetAgentEncName ===
; RVA: 0x00002060  Size: 417 bytes
; Exports: ?GetAgentEncName@Agents@GW@@YAPA_WPBUAgent@2@@Z
;
  10002060:  55                              push     ebp
  10002061:  8b ec                           mov      ebp, esp
  10002063:  53                              push     ebx
  10002064:  56                              push     esi
  10002065:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10002068:  57                              push     edi
  10002069:  85 f6                           test     esi, esi
  1000206B:  0f 84 89 01 00 00               je       0x100021fa
  10002071:  8b 8e 9c 00 00 00               mov      ecx, dword ptr [esi + 0x9c]
  10002077:  f6 c1 db                        test     cl, 0xdb
  1000207A:  0f 84 c5 00 00 00               je       0x10002145
  10002080:  83 be 84 01 00 00 00            cmp      dword ptr [esi + 0x184], 0
  10002087:  74 5e                           je       0x100020e7
  10002089:  e8 12 70 01 00                  call     0x100190a0  ; GW::GetWorldContext
  1000208E:  85 c0                           test     eax, eax
  10002090:  0f 84 64 01 00 00               je       0x100021fa
  10002096:  83 b8 0c 08 00 00 00            cmp      dword ptr [eax + 0x80c], 0
  1000209D:  8d b8 0c 08 00 00               lea      edi, [eax + 0x80c]
  100020A3:  0f 84 51 01 00 00               je       0x100021fa
  100020A9:  85 ff                           test     edi, edi
  100020AB:  0f 84 49 01 00 00               je       0x100021fa
  100020B1:  8b 9e 84 01 00 00               mov      ebx, dword ptr [esi + 0x184]
  100020B7:  3b 5f 08                        cmp      ebx, dword ptr [edi + 8]
  100020BA:  72 19                           jb       0x100020d5
  100020BC:  68 a8 c4 04 10                  push     0x1004c4a8  ; "GW::BaseArray<struct GW::Player>::at"
  100020C1:  6a 1e                           push     0x1e
  100020C3:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  100020C8:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  100020CD:  e8 9e 37 00 00                  call     0x10005870  ; GW::FatalAssert
  100020D2:  83 c4 10                        add      esp, 0x10
  100020D5:  8d 04 9b                        lea      eax, [ebx + ebx*4]
  100020D8:  c1 e0 04                        shl      eax, 4
  100020DB:  03 07                           add      eax, dword ptr [edi]
  100020DD:  74 08                           je       0x100020e7
  100020DF:  8b 40 24                        mov      eax, dword ptr [eax + 0x24]
  100020E2:  5f                              pop      edi
  100020E3:  5e                              pop      esi
  100020E4:  5b                              pop      ebx
  100020E5:  5d                              pop      ebp
  100020E6:  c3                              ret      
  100020E7:  e8 b4 6f 01 00                  call     0x100190a0  ; GW::GetWorldContext
  100020EC:  8b f8                           mov      edi, eax
  100020EE:  8b 46 2c                        mov      eax, dword ptr [esi + 0x2c]
  100020F1:  3b 87 d4 07 00 00               cmp      eax, dword ptr [edi + 0x7d4]
  100020F7:  0f 83 fd 00 00 00               jae      0x100021fa
  100020FD:  50                              push     eax
  100020FE:  8d 8f cc 07 00 00               lea      ecx, [edi + 0x7cc]
  10002104:  e8 a7 fb ff ff                  call     0x10001cb0
  10002109:  83 78 34 00                     cmp      dword ptr [eax + 0x34], 0
  1000210D:  74 16                           je       0x10002125
  1000210F:  ff 76 2c                        push     dword ptr [esi + 0x2c]
  10002112:  8d 8f cc 07 00 00               lea      ecx, [edi + 0x7cc]
  10002118:  e8 93 fb ff ff                  call     0x10001cb0
  1000211D:  8b 40 34                        mov      eax, dword ptr [eax + 0x34]
  10002120:  5f                              pop      edi
  10002121:  5e                              pop      esi
  10002122:  5b                              pop      ebx
  10002123:  5d                              pop      ebp
  10002124:  c3                              ret      
  10002125:  0f b7 86 f4 00 00 00            movzx    eax, word ptr [esi + 0xf4]
  1000212C:  50                              push     eax
  1000212D:  e8 3e 05 00 00                  call     0x10002670  ; Agents::GetNPCByID, GetNPCByID
  10002132:  83 c4 04                        add      esp, 4
  10002135:  85 c0                           test     eax, eax
  10002137:  0f 84 bd 00 00 00               je       0x100021fa
  1000213D:  8b 40 20                        mov      eax, dword ptr [eax + 0x20]
  10002140:  5f                              pop      edi
  10002141:  5e                              pop      esi
  10002142:  5b                              pop      ebx
  10002143:  5d                              pop      ebp
  10002144:  c3                              ret      
  10002145:  8b c1                           mov      eax, ecx
  10002147:  c1 e8 09                        shr      eax, 9
  1000214A:  a8 01                           test     al, 1
  1000214C:  0f 84 8a 00 00 00               je       0x100021dc
  10002152:  e8 29 6e 01 00                  call     0x10018f80  ; GW::GetAgentContext
  10002157:  8b d8                           mov      ebx, eax
  10002159:  e8 72 6e 01 00                  call     0x10018fd0  ; GW::GetGameContext
  1000215E:  8b 78 38                        mov      edi, dword ptr [eax + 0x38]
  10002161:  85 db                           test     ebx, ebx
  10002163:  0f 84 91 00 00 00               je       0x100021fa
  10002169:  85 ff                           test     edi, edi
  1000216B:  0f 84 89 00 00 00               je       0x100021fa
  10002171:  83 bb 98 00 00 00 00            cmp      dword ptr [ebx + 0x98], 0
  10002178:  8b 76 2c                        mov      esi, dword ptr [esi + 0x2c]
  1000217B:  74 08                           je       0x10002185
  1000217D:  3b b3 a0 00 00 00               cmp      esi, dword ptr [ebx + 0xa0]
  10002183:  72 19                           jb       0x1000219e
  10002185:  68 7c c5 04 10                  push     0x1004c57c  ; "GW::BaseArray<struct GW::AgentSummaryInfo>::at"
  1000218A:  6a 1e                           push     0x1e
  1000218C:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  10002191:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  10002196:  e8 d5 36 00 00                  call     0x10005870  ; GW::FatalAssert
  1000219B:  83 c4 10                        add      esp, 0x10
  1000219E:  8b 83 98 00 00 00               mov      eax, dword ptr [ebx + 0x98]
  100021A4:  8d 0c 76                        lea      ecx, [esi + esi*2]
  100021A7:  8b 74 88 08                     mov      esi, dword ptr [eax + ecx*4 + 8]
  100021AB:  85 f6                           test     esi, esi
  100021AD:  74 4b                           je       0x100021fa
  100021AF:  8b 46 10                        mov      eax, dword ptr [esi + 0x10]
  100021B2:  85 c0                           test     eax, eax
  100021B4:  75 46                           jne      0x100021fc
  100021B6:  8b 76 08                        mov      esi, dword ptr [esi + 8]
  100021B9:  39 77 08                        cmp      dword ptr [edi + 8], esi
  100021BC:  76 3c                           jbe      0x100021fa
  100021BE:  56                              push     esi
  100021BF:  8b cf                           mov      ecx, edi
  100021C1:  e8 3a fb ff ff                  call     0x10001d00
  100021C6:  83 78 0c 00                     cmp      dword ptr [eax + 0xc], 0
  100021CA:  74 2e                           je       0x100021fa
  100021CC:  56                              push     esi
  100021CD:  8b cf                           mov      ecx, edi
  100021CF:  e8 2c fb ff ff                  call     0x10001d00
  100021D4:  5f                              pop      edi
  100021D5:  5e                              pop      esi
  100021D6:  5b                              pop      ebx
  100021D7:  8b 40 0c                        mov      eax, dword ptr [eax + 0xc]
  100021DA:  5d                              pop      ebp
  100021DB:  c3                              ret      
  100021DC:  c1 e9 0a                        shr      ecx, 0xa
  100021DF:  f6 c1 01                        test     cl, 1
  100021E2:  74 16                           je       0x100021fa
  100021E4:  ff b6 c8 00 00 00               push     dword ptr [esi + 0xc8]
  100021EA:  e8 41 99 01 00                  call     0x1001bb30  ; Items::GetItemById
  100021EF:  83 c4 04                        add      esp, 4
  100021F2:  85 c0                           test     eax, eax
  100021F4:  0f 85 23 ff ff ff               jne      0x1000211d
  100021FA:  33 c0                           xor      eax, eax
  100021FC:  5f                              pop      edi
  100021FD:  5e                              pop      esi
  100021FE:  5b                              pop      ebx
  100021FF:  5d                              pop      ebp
  10002200:  c3                              ret      


; === Agents::GetAgentIdByLoginNumber, GetAgentIdByLoginNumber ===
; RVA: 0x00002210  Size: 26 bytes
; Exports: ?GetAgentIdByLoginNumber@Agents@GW@@YAII@Z, GetAgentIdByLoginNumber
;
  10002210:  55                              push     ebp
  10002211:  8b ec                           mov      ebp, esp
  10002213:  ff 75 08                        push     dword ptr [ebp + 8]
  10002216:  e8 05 e5 01 00                  call     0x10020720  ; PlayerMgr::GetPlayerByID
  1000221B:  83 c4 04                        add      esp, 4
  1000221E:  85 c0                           test     eax, eax
  10002220:  74 04                           je       0x10002226
  10002222:  8b 00                           mov      eax, dword ptr [eax]
  10002224:  5d                              pop      ebp
  10002225:  c3                              ret      
  10002226:  33 c0                           xor      eax, eax
  10002228:  5d                              pop      ebp
  10002229:  c3                              ret      


; === Agents::GetAmountOfPlayersInInstance, GetAmountOfPlayersInInstance ===
; RVA: 0x00002230  Size: 29 bytes
; Exports: ?GetAmountOfPlayersInInstance@Agents@GW@@YAIXZ, GetAmountOfPlayersInInstance
;
  10002230:  e8 6b 6e 01 00                  call     0x100190a0  ; GW::GetWorldContext
  10002235:  85 c0                           test     eax, eax
  10002237:  74 11                           je       0x1000224a
  10002239:  83 b8 0c 08 00 00 00            cmp      dword ptr [eax + 0x80c], 0
  10002240:  74 08                           je       0x1000224a
  10002242:  8b 80 14 08 00 00               mov      eax, dword ptr [eax + 0x814]
  10002248:  48                              dec      eax
  10002249:  c3                              ret      
  1000224A:  33 c0                           xor      eax, eax
  1000224C:  c3                              ret      


; === Agents::GetControlledCharacter ===
; RVA: 0x00002250  Size: 116 bytes
; Exports: ?GetControlledCharacter@Agents@GW@@YAPAUAgentLiving@2@XZ
;
  10002250:  56                              push     esi
  10002251:  57                              push     edi
  10002252:  e8 49 6e 01 00                  call     0x100190a0  ; GW::GetWorldContext
  10002257:  85 c0                           test     eax, eax
  10002259:  74 64                           je       0x100022bf
  1000225B:  8b b8 80 06 00 00               mov      edi, dword ptr [eax + 0x680]
  10002261:  85 ff                           test     edi, edi
  10002263:  74 5a                           je       0x100022bf
  10002265:  8b 7f 14                        mov      edi, dword ptr [edi + 0x14]
  10002268:  85 ff                           test     edi, edi
  1000226A:  74 53                           je       0x100022bf
  1000226C:  8b 35 a4 c0 08 10               mov      esi, dword ptr [0x1008c0a4]
  10002272:  85 f6                           test     esi, esi
  10002274:  74 05                           je       0x1000227b
  10002276:  83 3e 00                        cmp      dword ptr [esi], 0
  10002279:  75 02                           jne      0x1000227d
  1000227B:  33 f6                           xor      esi, esi
  1000227D:  85 f6                           test     esi, esi
  1000227F:  74 3e                           je       0x100022bf
  10002281:  3b 7e 08                        cmp      edi, dword ptr [esi + 8]
  10002284:  73 39                           jae      0x100022bf
  10002286:  83 3e 00                        cmp      dword ptr [esi], 0
  10002289:  75 19                           jne      0x100022a4
  1000228B:  68 80 c4 04 10                  push     0x1004c480  ; "GW::BaseArray<struct GW::Agent *>::at"
  10002290:  6a 1e                           push     0x1e
  10002292:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  10002297:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  1000229C:  e8 cf 35 00 00                  call     0x10005870  ; GW::FatalAssert
  100022A1:  83 c4 10                        add      esp, 0x10
  100022A4:  8b 06                           mov      eax, dword ptr [esi]
  100022A6:  8b 04 b8                        mov      eax, dword ptr [eax + edi*4]
  100022A9:  85 c0                           test     eax, eax
  100022AB:  74 12                           je       0x100022bf
  100022AD:  f6 80 9c 00 00 00 db            test     byte ptr [eax + 0x9c], 0xdb
  100022B4:  b9 00 00 00 00                  mov      ecx, 0
  100022B9:  5f                              pop      edi
  100022BA:  0f 44 c1                        cmove    eax, ecx
  100022BD:  5e                              pop      esi
  100022BE:  c3                              ret      
  100022BF:  5f                              pop      edi
  100022C0:  33 c0                           xor      eax, eax
  100022C2:  5e                              pop      esi
  100022C3:  c3                              ret      


; === Agents::GetControlledCharacterId, GetControlledCharacterId ===
; RVA: 0x000022D0  Size: 26 bytes
; Exports: ?GetControlledCharacterId@Agents@GW@@YAIXZ, GetControlledCharacterId
;
  100022D0:  e8 cb 6d 01 00                  call     0x100190a0  ; GW::GetWorldContext
  100022D5:  85 c0                           test     eax, eax
  100022D7:  74 0e                           je       0x100022e7
  100022D9:  8b 80 80 06 00 00               mov      eax, dword ptr [eax + 0x680]
  100022DF:  85 c0                           test     eax, eax
  100022E1:  74 04                           je       0x100022e7
  100022E3:  8b 40 14                        mov      eax, dword ptr [eax + 0x14]
  100022E6:  c3                              ret      
  100022E7:  33 c0                           xor      eax, eax
  100022E9:  c3                              ret      


; === Agents::GetEvaluatedTargetId, GetEvaluatedTargetId ===
; RVA: 0x00002520  Size: 6 bytes
; Exports: ?GetEvaluatedTargetId@Agents@GW@@YAIXZ, GetEvaluatedTargetId
;
  10002520:  a1 8c c0 08 10                  mov      eax, dword ptr [0x1008c08c]
  10002525:  c3                              ret      


; === Agents::GetHeroAgentID, GetHeroAgentID ===
; RVA: 0x00002530  Size: 9 bytes
; Exports: ?GetHeroAgentID@Agents@GW@@YAII@Z, GetHeroAgentID
;
  10002530:  55                              push     ebp
  10002531:  8b ec                           mov      ebp, esp
  10002533:  5d                              pop      ebp
  10002534:  e9 27 cf 01 00                  jmp      0x1001f460


; === Agents::GetIsAgentTargettable ===
; RVA: 0x00002540  Size: 172 bytes
; Exports: ?GetIsAgentTargettable@Agents@GW@@YA_NPBUAgent@2@@Z
;
  10002540:  55                              push     ebp
  10002541:  8b ec                           mov      ebp, esp
  10002543:  56                              push     esi
  10002544:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10002547:  57                              push     edi
  10002548:  85 f6                           test     esi, esi
  1000254A:  74 3a                           je       0x10002586
  1000254C:  f6 86 9c 00 00 00 db            test     byte ptr [esi + 0x9c], 0xdb
  10002553:  8b c6                           mov      eax, esi
  10002555:  b9 00 00 00 00                  mov      ecx, 0
  1000255A:  0f 44 c1                        cmove    eax, ecx
  1000255D:  85 c0                           test     eax, eax
  1000255F:  74 2b                           je       0x1000258c
  10002561:  39 88 84 01 00 00               cmp      dword ptr [eax + 0x184], ecx
  10002567:  75 30                           jne      0x10002599
  10002569:  0f b7 80 f4 00 00 00            movzx    eax, word ptr [eax + 0xf4]
  10002570:  50                              push     eax
  10002571:  e8 fa 00 00 00                  call     0x10002670  ; Agents::GetNPCByID, GetNPCByID
  10002576:  83 c4 04                        add      esp, 4
  10002579:  85 c0                           test     eax, eax
  1000257B:  74 09                           je       0x10002586
  1000257D:  f7 40 10 00 00 01 00            test     dword ptr [eax + 0x10], 0x10000
  10002584:  74 13                           je       0x10002599
  10002586:  5f                              pop      edi
  10002587:  32 c0                           xor      al, al
  10002589:  5e                              pop      esi
  1000258A:  5d                              pop      ebp
  1000258B:  c3                              ret      
  1000258C:  56                              push     esi
  1000258D:  e8 ce fa ff ff                  call     0x10002060  ; Agents::GetAgentEncName
  10002592:  83 c4 04                        add      esp, 4
  10002595:  85 c0                           test     eax, eax
  10002597:  74 06                           je       0x1000259f
  10002599:  5f                              pop      edi
  1000259A:  b0 01                           mov      al, 1
  1000259C:  5e                              pop      esi
  1000259D:  5d                              pop      ebp
  1000259E:  c3                              ret      
  1000259F:  e8 dc 69 01 00                  call     0x10018f80  ; GW::GetAgentContext
  100025A4:  8b 76 2c                        mov      esi, dword ptr [esi + 0x2c]
  100025A7:  8b f8                           mov      edi, eax
  100025A9:  39 b7 f0 00 00 00               cmp      dword ptr [edi + 0xf0], esi
  100025AF:  76 d5                           jbe      0x10002586
  100025B1:  83 bf e8 00 00 00 00            cmp      dword ptr [edi + 0xe8], 0
  100025B8:  74 08                           je       0x100025c2
  100025BA:  3b b7 f0 00 00 00               cmp      esi, dword ptr [edi + 0xf0]
  100025C0:  72 19                           jb       0x100025db
  100025C2:  68 4c c5 04 10                  push     0x1004c54c  ; "GW::BaseArray<struct GW::AgentMovement *>::at"
  100025C7:  6a 1e                           push     0x1e
  100025C9:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  100025CE:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  100025D3:  e8 98 32 00 00                  call     0x10005870  ; GW::FatalAssert
  100025D8:  83 c4 10                        add      esp, 0x10
  100025DB:  8b 87 e8 00 00 00               mov      eax, dword ptr [edi + 0xe8]
  100025E1:  5f                              pop      edi
  100025E2:  83 3c b0 00                     cmp      dword ptr [eax + esi*4], 0
  100025E6:  5e                              pop      esi
  100025E7:  0f 95 c0                        setne    al
  100025EA:  5d                              pop      ebp
  100025EB:  c3                              ret      


; === Agents::GetMapAgentArray ===
; RVA: 0x000025F0  Size: 15 bytes
; Exports: ?GetMapAgentArray@Agents@GW@@YAPAV?$Array@UMapAgent@GW@@@2@XZ
;
  100025F0:  e8 ab 6a 01 00                  call     0x100190a0  ; GW::GetWorldContext
  100025F5:  8d 48 7c                        lea      ecx, [eax + 0x7c]
  100025F8:  f7 d8                           neg      eax
  100025FA:  1b c0                           sbb      eax, eax
  100025FC:  23 c1                           and      eax, ecx
  100025FE:  c3                              ret      


; === Agents::GetMapAgentByID, GetMapAgentByID ===
; RVA: 0x00002600  Size: 102 bytes
; Exports: ?GetMapAgentByID@Agents@GW@@YAPAUMapAgent@2@I@Z, GetMapAgentByID
;
  10002600:  55                              push     ebp
  10002601:  8b ec                           mov      ebp, esp
  10002603:  56                              push     esi
  10002604:  57                              push     edi
  10002605:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  10002608:  85 ff                           test     edi, edi
  1000260A:  74 3e                           je       0x1000264a
  1000260C:  e8 8f 6a 01 00                  call     0x100190a0  ; GW::GetWorldContext
  10002611:  8b f0                           mov      esi, eax
  10002613:  8d 4e 7c                        lea      ecx, [esi + 0x7c]
  10002616:  f7 de                           neg      esi
  10002618:  1b f6                           sbb      esi, esi
  1000261A:  23 f1                           and      esi, ecx
  1000261C:  74 2c                           je       0x1000264a
  1000261E:  3b 7e 08                        cmp      edi, dword ptr [esi + 8]
  10002621:  73 27                           jae      0x1000264a
  10002623:  83 3e 00                        cmp      dword ptr [esi], 0
  10002626:  75 19                           jne      0x10002641
  10002628:  68 d0 c4 04 10                  push     0x1004c4d0  ; "GW::BaseArray<struct GW::MapAgent>::at"
  1000262D:  6a 1e                           push     0x1e
  1000262F:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  10002634:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  10002639:  e8 32 32 00 00                  call     0x10005870  ; GW::FatalAssert
  1000263E:  83 c4 10                        add      esp, 0x10
  10002641:  6b c7 34                        imul     eax, edi, 0x34
  10002644:  5f                              pop      edi
  10002645:  03 06                           add      eax, dword ptr [esi]
  10002647:  5e                              pop      esi
  10002648:  5d                              pop      ebp
  10002649:  c3                              ret      
  1000264A:  5f                              pop      edi
  1000264B:  33 c0                           xor      eax, eax
  1000264D:  5e                              pop      esi
  1000264E:  5d                              pop      ebp
  1000264F:  c3                              ret      
  10002650:  e8 4b 6a 01 00                  call     0x100190a0  ; GW::GetWorldContext
  10002655:  85 c0                           test     eax, eax
  10002657:  74 0a                           je       0x10002663
  10002659:  05 fc 07 00 00                  add      eax, 0x7fc
  1000265E:  83 38 00                        cmp      dword ptr [eax], 0
  10002661:  75 02                           jne      0x10002665
  10002663:  33 c0                           xor      eax, eax
  10002665:  c3                              ret      


; === Agents::GetNPCArray ===
; RVA: 0x00002650  Size: 22 bytes
; Exports: ?GetNPCArray@Agents@GW@@YAPAV?$Array@UNPC@GW@@@2@XZ
;
  10002650:  e8 4b 6a 01 00                  call     0x100190a0  ; GW::GetWorldContext
  10002655:  85 c0                           test     eax, eax
  10002657:  74 0a                           je       0x10002663
  10002659:  05 fc 07 00 00                  add      eax, 0x7fc
  1000265E:  83 38 00                        cmp      dword ptr [eax], 0
  10002661:  75 02                           jne      0x10002665
  10002663:  33 c0                           xor      eax, eax
  10002665:  c3                              ret      


; === Agents::GetNPCByID, GetNPCByID ===
; RVA: 0x00002670  Size: 53 bytes
; Exports: ?GetNPCByID@Agents@GW@@YAPAUNPC@2@I@Z, GetNPCByID
;
  10002670:  55                              push     ebp
  10002671:  8b ec                           mov      ebp, esp
  10002673:  e8 28 6a 01 00                  call     0x100190a0  ; GW::GetWorldContext
  10002678:  85 c0                           test     eax, eax
  1000267A:  74 25                           je       0x100026a1
  1000267C:  83 b8 fc 07 00 00 00            cmp      dword ptr [eax + 0x7fc], 0
  10002683:  8d 88 fc 07 00 00               lea      ecx, [eax + 0x7fc]
  10002689:  74 16                           je       0x100026a1
  1000268B:  85 c9                           test     ecx, ecx
  1000268D:  74 12                           je       0x100026a1
  1000268F:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10002692:  3b 41 08                        cmp      eax, dword ptr [ecx + 8]
  10002695:  73 0a                           jae      0x100026a1
  10002697:  8d 04 40                        lea      eax, [eax + eax*2]
  1000269A:  c1 e0 04                        shl      eax, 4
  1000269D:  03 01                           add      eax, dword ptr [ecx]
  1000269F:  5d                              pop      ebp
  100026A0:  c3                              ret      
  100026A1:  33 c0                           xor      eax, eax
  100026A3:  5d                              pop      ebp
  100026A4:  c3                              ret      


; === Agents::GetObservingId, GetObservingId ===
; RVA: 0x000026B0  Size: 15 bytes
; Exports: ?GetObservingId@Agents@GW@@YAIXZ, GetObservingId
;
  100026B0:  e8 2b 0e 00 00                  call     0x100034e0  ; CameraMgr::GetCamera, GetCamera
  100026B5:  85 c0                           test     eax, eax
  100026B7:  74 03                           je       0x100026bc
  100026B9:  8b 00                           mov      eax, dword ptr [eax]
  100026BB:  c3                              ret      
  100026BC:  33 c0                           xor      eax, eax
  100026BE:  c3                              ret      


; === Agents::GetPlayerArray, PlayerMgr::GetPlayerArray ===
; RVA: 0x000026C0  Size: 22 bytes
; Exports: ?GetPlayerArray@Agents@GW@@YAPAV?$Array@UPlayer@GW@@@2@XZ, ?GetPlayerArray@PlayerMgr@GW@@YAPAV?$Array@UPlayer@GW@@@2@XZ
;
  100026C0:  e8 db 69 01 00                  call     0x100190a0  ; GW::GetWorldContext
  100026C5:  85 c0                           test     eax, eax
  100026C7:  74 0a                           je       0x100026d3
  100026C9:  05 0c 08 00 00                  add      eax, 0x80c
  100026CE:  83 38 00                        cmp      dword ptr [eax], 0
  100026D1:  75 02                           jne      0x100026d5
  100026D3:  33 c0                           xor      eax, eax
  100026D5:  c3                              ret      


; === Agents::GetPlayerByID ===
; RVA: 0x000026E0  Size: 93 bytes
; Exports: ?GetPlayerByID@Agents@GW@@YAPAUAgent@2@I@Z
;
  100026E0:  55                              push     ebp
  100026E1:  8b ec                           mov      ebp, esp
  100026E3:  56                              push     esi
  100026E4:  57                              push     edi
  100026E5:  ff 75 08                        push     dword ptr [ebp + 8]
  100026E8:  e8 e3 df 01 00                  call     0x100206d0  ; PlayerMgr::GetPlayerAgentId, GetPlayerAgentId
  100026ED:  8b f8                           mov      edi, eax
  100026EF:  83 c4 04                        add      esp, 4
  100026F2:  85 ff                           test     edi, edi
  100026F4:  74 41                           je       0x10002737
  100026F6:  8b 35 a4 c0 08 10               mov      esi, dword ptr [0x1008c0a4]
  100026FC:  85 f6                           test     esi, esi
  100026FE:  74 05                           je       0x10002705
  10002700:  83 3e 00                        cmp      dword ptr [esi], 0
  10002703:  75 02                           jne      0x10002707
  10002705:  33 f6                           xor      esi, esi
  10002707:  85 f6                           test     esi, esi
  10002709:  74 2c                           je       0x10002737
  1000270B:  3b 7e 08                        cmp      edi, dword ptr [esi + 8]
  1000270E:  73 27                           jae      0x10002737
  10002710:  83 3e 00                        cmp      dword ptr [esi], 0
  10002713:  75 19                           jne      0x1000272e
  10002715:  68 80 c4 04 10                  push     0x1004c480  ; "GW::BaseArray<struct GW::Agent *>::at"
  1000271A:  6a 1e                           push     0x1e
  1000271C:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  10002721:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  10002726:  e8 45 31 00 00                  call     0x10005870  ; GW::FatalAssert
  1000272B:  83 c4 10                        add      esp, 0x10
  1000272E:  8b 06                           mov      eax, dword ptr [esi]
  10002730:  8b 04 b8                        mov      eax, dword ptr [eax + edi*4]
  10002733:  5f                              pop      edi
  10002734:  5e                              pop      esi
  10002735:  5d                              pop      ebp
  10002736:  c3                              ret      
  10002737:  5f                              pop      edi
  10002738:  33 c0                           xor      eax, eax
  1000273A:  5e                              pop      esi
  1000273B:  5d                              pop      ebp
  1000273C:  c3                              ret      


; === Agents::GetPlayerNameByLoginNumber, GetPlayerNameByLoginNumber ===
; RVA: 0x00002740  Size: 9 bytes
; Exports: ?GetPlayerNameByLoginNumber@Agents@GW@@YAPA_WI@Z, GetPlayerNameByLoginNumber
;
  10002740:  55                              push     ebp
  10002741:  8b ec                           mov      ebp, esp
  10002743:  5d                              pop      ebp
  10002744:  e9 07 e1 01 00                  jmp      0x10020850


; === Agents::GetTargetAsAgentLiving ===
; RVA: 0x00002750  Size: 100 bytes
; Exports: ?GetTargetAsAgentLiving@Agents@GW@@YAPAUAgentLiving@2@XZ
;
  10002750:  56                              push     esi
  10002751:  57                              push     edi
  10002752:  8b 3d 88 c0 08 10               mov      edi, dword ptr [0x1008c088]
  10002758:  85 ff                           test     edi, edi
  1000275A:  74 53                           je       0x100027af
  1000275C:  8b 35 a4 c0 08 10               mov      esi, dword ptr [0x1008c0a4]
  10002762:  85 f6                           test     esi, esi
  10002764:  74 05                           je       0x1000276b
  10002766:  83 3e 00                        cmp      dword ptr [esi], 0
  10002769:  75 02                           jne      0x1000276d
  1000276B:  33 f6                           xor      esi, esi
  1000276D:  85 f6                           test     esi, esi
  1000276F:  74 3e                           je       0x100027af
  10002771:  3b 7e 08                        cmp      edi, dword ptr [esi + 8]
  10002774:  73 39                           jae      0x100027af
  10002776:  83 3e 00                        cmp      dword ptr [esi], 0
  10002779:  75 19                           jne      0x10002794
  1000277B:  68 80 c4 04 10                  push     0x1004c480  ; "GW::BaseArray<struct GW::Agent *>::at"
  10002780:  6a 1e                           push     0x1e
  10002782:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  10002787:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  1000278C:  e8 df 30 00 00                  call     0x10005870  ; GW::FatalAssert
  10002791:  83 c4 10                        add      esp, 0x10
  10002794:  8b 06                           mov      eax, dword ptr [esi]
  10002796:  8b 04 b8                        mov      eax, dword ptr [eax + edi*4]
  10002799:  85 c0                           test     eax, eax
  1000279B:  74 12                           je       0x100027af
  1000279D:  f6 80 9c 00 00 00 db            test     byte ptr [eax + 0x9c], 0xdb
  100027A4:  b9 00 00 00 00                  mov      ecx, 0
  100027A9:  5f                              pop      edi
  100027AA:  0f 44 c1                        cmove    eax, ecx
  100027AD:  5e                              pop      esi
  100027AE:  c3                              ret      
  100027AF:  5f                              pop      edi
  100027B0:  33 c0                           xor      eax, eax
  100027B2:  5e                              pop      esi
  100027B3:  c3                              ret      


; === Agents::GetTargetId, GetTargetId ===
; RVA: 0x000027C0  Size: 6 bytes
; Exports: ?GetTargetId@Agents@GW@@YAIXZ, GetTargetId
;
  100027C0:  a1 88 c0 08 10                  mov      eax, dword ptr [0x1008c088]
  100027C5:  c3                              ret      


; === Agents::InteractAgent ===
; RVA: 0x000029D0  Size: 209 bytes
; Exports: ?InteractAgent@Agents@GW@@YA_NPBUAgent@2@_N@Z
;
  100029D0:  55                              push     ebp
  100029D1:  8b ec                           mov      ebp, esp
  100029D3:  83 ec 10                        sub      esp, 0x10
  100029D6:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  100029DB:  33 c5                           xor      eax, ebp
  100029DD:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  100029E0:  56                              push     esi
  100029E1:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  100029E4:  56                              push     esi
  100029E5:  e8 56 fb ff ff                  call     0x10002540  ; Agents::GetIsAgentTargettable
  100029EA:  83 c4 04                        add      esp, 4
  100029ED:  84 c0                           test     al, al
  100029EF:  0f 84 9b 00 00 00               je       0x10002a90
  100029F5:  8b 46 2c                        mov      eax, dword ptr [esi + 0x2c]
  100029F8:  8b 8e 9c 00 00 00               mov      ecx, dword ptr [esi + 0x9c]
  100029FE:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  10002A01:  8a 45 0c                        mov      al, byte ptr [ebp + 0xc]
  10002A04:  34 01                           xor      al, 1
  10002A06:  88 45 f8                        mov      byte ptr [ebp - 8], al
  10002A09:  8b c1                           mov      eax, ecx
  10002A0B:  c1 e8 0a                        shr      eax, 0xa
  10002A0E:  a8 01                           test     al, 1
  10002A10:  74 29                           je       0x10002a3b
  10002A12:  c7 45 f0 03 00 00 00            mov      dword ptr [ebp - 0x10], 3
  10002A19:  6a 00                           push     0
  10002A1B:  8d 45 f0                        lea      eax, [ebp - 0x10]
  10002A1E:  50                              push     eax
  10002A1F:  68 20 00 00 30                  push     0x30000020
  10002A24:  e8 a7 56 02 00                  call     0x100280d0  ; UI::SendUIMessage
  10002A29:  83 c4 0c                        add      esp, 0xc
  10002A2C:  5e                              pop      esi
  10002A2D:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10002A30:  33 cd                           xor      ecx, ebp
  10002A32:  e8 80 99 02 00                  call     0x1002c3b7
  10002A37:  8b e5                           mov      esp, ebp
  10002A39:  5d                              pop      ebp
  10002A3A:  c3                              ret      
  10002A3B:  8b c1                           mov      eax, ecx
  10002A3D:  c1 e8 09                        shr      eax, 9
  10002A40:  a8 01                           test     al, 1
  10002A42:  74 09                           je       0x10002a4d
  10002A44:  c7 45 f0 05 00 00 00            mov      dword ptr [ebp - 0x10], 5
  10002A4B:  eb cc                           jmp      0x10002a19
  10002A4D:  f6 c1 db                        test     cl, 0xdb
  10002A50:  b8 00 00 00 00                  mov      eax, 0
  10002A55:  0f 44 f0                        cmove    esi, eax
  10002A58:  85 f6                           test     esi, esi
  10002A5A:  74 34                           je       0x10002a90
  10002A5C:  8a 86 b5 01 00 00               mov      al, byte ptr [esi + 0x1b5]
  10002A62:  3c 03                           cmp      al, 3
  10002A64:  75 09                           jne      0x10002a6f
  10002A66:  c7 45 f0 00 00 00 00            mov      dword ptr [ebp - 0x10], 0
  10002A6D:  eb aa                           jmp      0x10002a19
  10002A6F:  6a 00                           push     0
  10002A71:  3c 06                           cmp      al, 6
  10002A73:  8d 45 f0                        lea      eax, [ebp - 0x10]
  10002A76:  50                              push     eax
  10002A77:  68 20 00 00 30                  push     0x30000020
  10002A7C:  75 09                           jne      0x10002a87
  10002A7E:  c7 45 f0 02 00 00 00            mov      dword ptr [ebp - 0x10], 2
  10002A85:  eb 9d                           jmp      0x10002a24
  10002A87:  c7 45 f0 01 00 00 00            mov      dword ptr [ebp - 0x10], 1
  10002A8E:  eb 94                           jmp      0x10002a24
  10002A90:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10002A93:  32 c0                           xor      al, al
  10002A95:  33 cd                           xor      ecx, ebp
  10002A97:  5e                              pop      esi
  10002A98:  e8 1a 99 02 00                  call     0x1002c3b7
  10002A9D:  8b e5                           mov      esp, ebp
  10002A9F:  5d                              pop      ebp
  10002AA0:  c3                              ret      


; === Agents::IsObserving, IsObserving ===
; RVA: 0x00002AB0  Size: 62 bytes
; Exports: ?IsObserving@Agents@GW@@YA_NXZ, IsObserving
;
  10002AB0:  e8 ab aa 01 00                  call     0x1001d560  ; Map::GetIsObserving
  10002AB5:  84 c0                           test     al, al
  10002AB7:  75 32                           jne      0x10002aeb
  10002AB9:  56                              push     esi
  10002ABA:  e8 e1 65 01 00                  call     0x100190a0  ; GW::GetWorldContext
  10002ABF:  85 c0                           test     eax, eax
  10002AC1:  74 0f                           je       0x10002ad2
  10002AC3:  8b 80 80 06 00 00               mov      eax, dword ptr [eax + 0x680]
  10002AC9:  85 c0                           test     eax, eax
  10002ACB:  74 05                           je       0x10002ad2
  10002ACD:  8b 70 14                        mov      esi, dword ptr [eax + 0x14]
  10002AD0:  eb 02                           jmp      0x10002ad4
  10002AD2:  33 f6                           xor      esi, esi
  10002AD4:  e8 07 0a 00 00                  call     0x100034e0  ; CameraMgr::GetCamera, GetCamera
  10002AD9:  85 c0                           test     eax, eax
  10002ADB:  74 04                           je       0x10002ae1
  10002ADD:  8b 00                           mov      eax, dword ptr [eax]
  10002ADF:  eb 02                           jmp      0x10002ae3
  10002AE1:  33 c0                           xor      eax, eax
  10002AE3:  3b f0                           cmp      esi, eax
  10002AE5:  5e                              pop      esi
  10002AE6:  74 03                           je       0x10002aeb
  10002AE8:  b0 01                           mov      al, 1
  10002AEA:  c3                              ret      
  10002AEB:  32 c0                           xor      al, al
  10002AED:  c3                              ret      


; === Agents::Move, Move ===
; RVA: 0x00002AF0  Size: 41 bytes
; Exports: ?Move@Agents@GW@@YA_NMMI@Z, Move
;
  10002AF0:  55                              push     ebp
  10002AF1:  8b ec                           mov      ebp, esp
  10002AF3:  f3 0f 10 4d 08                  movss    xmm1, dword ptr [ebp + 8]
  10002AF8:  83 ec 0c                        sub      esp, 0xc
  10002AFB:  f3 0f 10 45 0c                  movss    xmm0, dword ptr [ebp + 0xc]
  10002B00:  8b c4                           mov      eax, esp
  10002B02:  8b 4d 10                        mov      ecx, dword ptr [ebp + 0x10]
  10002B05:  0f 14 c8                        unpcklps xmm1, xmm0
  10002B08:  66 0f d6 08                     movq     qword ptr [eax], xmm1
  10002B0C:  89 48 08                        mov      dword ptr [eax + 8], ecx
  10002B0F:  e8 0c 00 00 00                  call     0x10002b20  ; Agents::Move
  10002B14:  83 c4 0c                        add      esp, 0xc
  10002B17:  5d                              pop      ebp
  10002B18:  c3                              ret      


; === Agents::Move ===
; RVA: 0x00002B20  Size: 155 bytes
; Exports: ?Move@Agents@GW@@YA_NUGamePos@2@@Z
;
  10002B20:  55                              push     ebp
  10002B21:  8b ec                           mov      ebp, esp
  10002B23:  83 ec 14                        sub      esp, 0x14
  10002B26:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  10002B2B:  33 c5                           xor      eax, ebp
  10002B2D:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10002B30:  83 3d 98 c0 08 10 00            cmp      dword ptr [0x1008c098], 0
  10002B37:  74 72                           je       0x10002bab
  10002B39:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  10002B3C:  0f 57 c0                        xorps    xmm0, xmm0
  10002B3F:  66 0f d6 45 f0                  movq     qword ptr [ebp - 0x10], xmm0
  10002B44:  f3 0f 10 45 08                  movss    xmm0, dword ptr [ebp + 8]
  10002B49:  f3 0f 11 45 ec                  movss    dword ptr [ebp - 0x14], xmm0
  10002B4E:  f3 0f 10 45 0c                  movss    xmm0, dword ptr [ebp + 0xc]
  10002B53:  f3 0f 11 45 f0                  movss    dword ptr [ebp - 0x10], xmm0
  10002B58:  66 0f 6e c0                     movd     xmm0, eax
  10002B5C:  f3 0f e6 c0                     cvtdq2pd xmm0, xmm0
  10002B60:  c1 e8 1f                        shr      eax, 0x1f
  10002B63:  c7 45 f8 00 00 00 00            mov      dword ptr [ebp - 8], 0
  10002B6A:  f2 0f 58 04 c5 c0 c5 04 10      addsd    xmm0, qword ptr [eax*8 + 0x1004c5c0]
  10002B73:  66 0f 5a c0                     cvtpd2ps xmm0, xmm0
  10002B77:  f3 0f 11 45 f4                  movss    dword ptr [ebp - 0xc], xmm0
  10002B7C:  e8 cf f6 ff ff                  call     0x10002250  ; Agents::GetControlledCharacter
  10002B81:  85 c0                           test     eax, eax
  10002B83:  74 26                           je       0x10002bab
  10002B85:  83 b8 58 01 00 00 00            cmp      dword ptr [eax + 0x158], 0
  10002B8C:  74 1d                           je       0x10002bab
  10002B8E:  8d 45 ec                        lea      eax, [ebp - 0x14]
  10002B91:  50                              push     eax
  10002B92:  ff 15 98 c0 08 10               call     dword ptr [0x1008c098]
  10002B98:  83 c4 04                        add      esp, 4
  10002B9B:  b0 01                           mov      al, 1
  10002B9D:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10002BA0:  33 cd                           xor      ecx, ebp
  10002BA2:  e8 10 98 02 00                  call     0x1002c3b7
  10002BA7:  8b e5                           mov      esp, ebp
  10002BA9:  5d                              pop      ebp
  10002BAA:  c3                              ret      
  10002BAB:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10002BAE:  32 c0                           xor      al, al
  10002BB0:  33 cd                           xor      ecx, ebp
  10002BB2:  e8 00 98 02 00                  call     0x1002c3b7
  10002BB7:  8b e5                           mov      esp, ebp
  10002BB9:  5d                              pop      ebp
  10002BBA:  c3                              ret      


; === Agents::SendDialog, SendDialog ===
; RVA: 0x00002E10  Size: 73 bytes
; Exports: ?SendDialog@Agents@GW@@YA_NI@Z, SendDialog
;
  10002E10:  55                              push     ebp
  10002E11:  8b ec                           mov      ebp, esp
  10002E13:  83 ec 0c                        sub      esp, 0xc
  10002E16:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10002E19:  56                              push     esi
  10002E1A:  50                              push     eax
  10002E1B:  e8 20 f5 ff ff                  call     0x10002340
  10002E20:  8b 45 f4                        mov      eax, dword ptr [ebp - 0xc]
  10002E23:  83 c4 04                        add      esp, 4
  10002E26:  8b 4d f8                        mov      ecx, dword ptr [ebp - 8]
  10002E29:  3b c1                           cmp      eax, ecx
  10002E2B:  74 14                           je       0x10002e41
  10002E2D:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  10002E30:  8b 30                           mov      esi, dword ptr [eax]
  10002E32:  39 96 c4 01 00 00               cmp      dword ptr [esi + 0x1c4], edx
  10002E38:  74 09                           je       0x10002e43
  10002E3A:  83 c0 04                        add      eax, 4
  10002E3D:  3b c1                           cmp      eax, ecx
  10002E3F:  75 ef                           jne      0x10002e30
  10002E41:  33 f6                           xor      esi, esi
  10002E43:  8d 4d f4                        lea      ecx, [ebp - 0xc]
  10002E46:  e8 e5 ed ff ff                  call     0x10001c30
  10002E4B:  56                              push     esi
  10002E4C:  e8 df 31 02 00                  call     0x10026030  ; UI::ButtonClick, ButtonClick
  10002E51:  83 c4 04                        add      esp, 4
  10002E54:  5e                              pop      esi
  10002E55:  8b e5                           mov      esp, ebp
  10002E57:  5d                              pop      ebp
  10002E58:  c3                              ret      


