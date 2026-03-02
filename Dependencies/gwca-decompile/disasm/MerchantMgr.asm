; Module: MerchantMgr
; Functions: 3
; Total code size: 1161 bytes
;

; === Merchant::GetMerchantItems ===
; RVA: 0x0001EA40  Size: 627 bytes
; Exports: ?GetMerchantItems@Merchant@GW@@YAIW4TransactionType@12@IPAI@Z
;
  1001EA40:  55                              push     ebp
  1001EA41:  8b ec                           mov      ebp, esp
  1001EA43:  83 ec 10                        sub      esp, 0x10
  1001EA46:  8d 45 10                        lea      eax, [ebp + 0x10]
  1001EA49:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001EA50:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  1001EA53:  8d 45 fc                        lea      eax, [ebp - 4]
  1001EA56:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  1001EA59:  8d 45 0c                        lea      eax, [ebp + 0xc]
  1001EA5C:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  1001EA5F:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001EA62:  48                              dec      eax
  1001EA63:  83 f8 0c                        cmp      eax, 0xc
  1001EA66:  0f 87 6b 01 00 00               ja       0x1001ebd7
  1001EA6C:  0f b6 80 f4 eb 01 10            movzx    eax, byte ptr [eax + 0x1001ebf4]
  1001EA73:  56                              push     esi
  1001EA74:  57                              push     edi
  1001EA75:  ff 24 85 e0 eb 01 10            jmp      dword ptr [eax*4 + 0x1001ebe0]
  1001EA7C:  68 3c 31 05 10                  push     0x1005313c
  1001EA81:  e8 fa 7c 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001EA86:  6a 00                           push     0
  1001EA88:  50                              push     eax
  1001EA89:  e8 62 79 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001EA8E:  83 c4 0c                        add      esp, 0xc
  1001EA91:  85 c0                           test     eax, eax
  1001EA93:  74 0e                           je       0x1001eaa3
  1001EA95:  68 4c 31 05 10                  push     0x1005314c
  1001EA9A:  8b c8                           mov      ecx, eax
  1001EA9C:  e8 2f 87 ff ff                  call     0x100171d0  ; TabsFrame::GetTabByLabel
  1001EAA1:  eb 02                           jmp      0x1001eaa5
  1001EAA3:  33 c0                           xor      eax, eax
  1001EAA5:  6a 06                           push     6
  1001EAA7:  50                              push     eax
  1001EAA8:  e8 43 79 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001EAAD:  6a 02                           push     2
  1001EAAF:  50                              push     eax
  1001EAB0:  e8 3b 79 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001EAB5:  8b f8                           mov      edi, eax
  1001EAB7:  83 c4 10                        add      esp, 0x10
  1001EABA:  be 01 00 00 00                  mov      esi, 1
  1001EABF:  85 ff                           test     edi, edi
  1001EAC1:  0f 84 0e 01 00 00               je       0x1001ebd5
  1001EAC7:  83 fe 05                        cmp      esi, 5
  1001EACA:  0f 87 05 01 00 00               ja       0x1001ebd5
  1001EAD0:  8d 46 07                        lea      eax, [esi + 7]
  1001EAD3:  8b cf                           mov      ecx, edi
  1001EAD5:  50                              push     eax
  1001EAD6:  e8 d5 80 ff ff                  call     0x10016bb0  ; ScrollableFrame::GetItemFrameId
  1001EADB:  50                              push     eax
  1001EADC:  e8 2f 7c 00 00                  call     0x10026710  ; UI::GetFrameById
  1001EAE1:  83 c4 04                        add      esp, 4
  1001EAE4:  8d 4d f0                        lea      ecx, [ebp - 0x10]
  1001EAE7:  50                              push     eax
  1001EAE8:  e8 c3 fe ff ff                  call     0x1001e9b0
  1001EAED:  46                              inc      esi
  1001EAEE:  eb d7                           jmp      0x1001eac7
  1001EAF0:  68 3c 31 05 10                  push     0x1005313c
  1001EAF5:  e8 86 7c 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001EAFA:  6a 00                           push     0
  1001EAFC:  50                              push     eax
  1001EAFD:  e8 ee 78 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001EB02:  83 c4 0c                        add      esp, 0xc
  1001EB05:  85 c0                           test     eax, eax
  1001EB07:  74 0e                           je       0x1001eb17
  1001EB09:  68 58 31 05 10                  push     0x10053158
  1001EB0E:  8b c8                           mov      ecx, eax
  1001EB10:  e8 bb 86 ff ff                  call     0x100171d0  ; TabsFrame::GetTabByLabel
  1001EB15:  eb 02                           jmp      0x1001eb19
  1001EB17:  33 c0                           xor      eax, eax
  1001EB19:  6a 02                           push     2
  1001EB1B:  50                              push     eax
  1001EB1C:  e8 cf 78 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001EB21:  6a 02                           push     2
  1001EB23:  50                              push     eax
  1001EB24:  e8 c7 78 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001EB29:  8b f8                           mov      edi, eax
  1001EB2B:  83 c4 10                        add      esp, 0x10
  1001EB2E:  be 01 00 00 00                  mov      esi, 1
  1001EB33:  85 ff                           test     edi, edi
  1001EB35:  0f 84 9a 00 00 00               je       0x1001ebd5
  1001EB3B:  0f 1f 44 00 00                  nop      dword ptr [eax + eax]
  1001EB40:  83 fe 05                        cmp      esi, 5
  1001EB43:  0f 87 8c 00 00 00               ja       0x1001ebd5
  1001EB49:  8d 46 07                        lea      eax, [esi + 7]
  1001EB4C:  8b cf                           mov      ecx, edi
  1001EB4E:  50                              push     eax
  1001EB4F:  e8 5c 80 ff ff                  call     0x10016bb0  ; ScrollableFrame::GetItemFrameId
  1001EB54:  50                              push     eax
  1001EB55:  e8 b6 7b 00 00                  call     0x10026710  ; UI::GetFrameById
  1001EB5A:  83 c4 04                        add      esp, 4
  1001EB5D:  8d 4d f0                        lea      ecx, [ebp - 0x10]
  1001EB60:  50                              push     eax
  1001EB61:  e8 4a fe ff ff                  call     0x1001e9b0
  1001EB66:  46                              inc      esi
  1001EB67:  eb d7                           jmp      0x1001eb40
  1001EB69:  68 3c 31 05 10                  push     0x1005313c
  1001EB6E:  e8 0d 7c 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001EB73:  6a 00                           push     0
  1001EB75:  50                              push     eax
  1001EB76:  e8 75 78 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001EB7B:  83 c4 0c                        add      esp, 0xc
  1001EB7E:  85 c0                           test     eax, eax
  1001EB80:  74 10                           je       0x1001eb92
  1001EB82:  68 50 31 05 10                  push     0x10053150
  1001EB87:  8b c8                           mov      ecx, eax
  1001EB89:  e8 42 86 ff ff                  call     0x100171d0  ; TabsFrame::GetTabByLabel
  1001EB8E:  6a 12                           push     0x12
  1001EB90:  eb 31                           jmp      0x1001ebc3
  1001EB92:  33 c0                           xor      eax, eax
  1001EB94:  6a 12                           push     0x12
  1001EB96:  eb 2b                           jmp      0x1001ebc3
  1001EB98:  68 3c 31 05 10                  push     0x1005313c
  1001EB9D:  e8 de 7b 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001EBA2:  6a 00                           push     0
  1001EBA4:  50                              push     eax
  1001EBA5:  e8 46 78 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001EBAA:  83 c4 0c                        add      esp, 0xc
  1001EBAD:  85 c0                           test     eax, eax
  1001EBAF:  74 0e                           je       0x1001ebbf
  1001EBB1:  68 54 31 05 10                  push     0x10053154
  1001EBB6:  8b c8                           mov      ecx, eax
  1001EBB8:  e8 13 86 ff ff                  call     0x100171d0  ; TabsFrame::GetTabByLabel
  1001EBBD:  eb 02                           jmp      0x1001ebc1
  1001EBBF:  33 c0                           xor      eax, eax
  1001EBC1:  6a 02                           push     2
  1001EBC3:  50                              push     eax
  1001EBC4:  e8 27 78 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001EBC9:  83 c4 08                        add      esp, 8
  1001EBCC:  8d 4d f0                        lea      ecx, [ebp - 0x10]
  1001EBCF:  50                              push     eax
  1001EBD0:  e8 db fd ff ff                  call     0x1001e9b0
  1001EBD5:  5f                              pop      edi
  1001EBD6:  5e                              pop      esi
  1001EBD7:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  1001EBDA:  8b e5                           mov      esp, ebp
  1001EBDC:  5d                              pop      ebp
  1001EBDD:  c3                              ret      
  1001EBDE:  66 90                           nop      
  1001EBE0:  98                              cwde     
  1001EBE1:  eb 01                           jmp      0x1001ebe4
  1001EBE3:  10 f0                           adc      al, dh
  1001EBE5:  ea 01 10 69 eb 01 10            ljmp     0x1001:0xeb691001
  1001EBEC:  7c ea                           jl       0x1001ebd8
  1001EBEE:  01 10                           add      dword ptr [eax], edx
  1001EBF0:  d5 eb                           aad      0xeb
  1001EBF2:  01 10                           add      dword ptr [eax], edx
  1001EBF4:  00 04 04                        add      byte ptr [esp + eax], al
  1001EBF7:  04 04                           add      al, 4
  1001EBF9:  04 04                           add      al, 4
  1001EBFB:  04 04                           add      al, 4
  1001EBFD:  04 01                           add      al, 1
  1001EBFF:  02 03                           add      al, byte ptr [ebx]
  1001EC01:  cc                              int3     
  1001EC02:  cc                              int3     
  1001EC03:  cc                              int3     
  1001EC04:  cc                              int3     
  1001EC05:  cc                              int3     
  1001EC06:  cc                              int3     
  1001EC07:  cc                              int3     
  1001EC08:  cc                              int3     
  1001EC09:  cc                              int3     
  1001EC0A:  cc                              int3     
  1001EC0B:  cc                              int3     
  1001EC0C:  cc                              int3     
  1001EC0D:  cc                              int3     
  1001EC0E:  cc                              int3     
  1001EC0F:  cc                              int3     
  1001EC10:  55                              push     ebp
  1001EC11:  8b ec                           mov      ebp, esp
  1001EC13:  83 ec 08                        sub      esp, 8
  1001EC16:  56                              push     esi
  1001EC17:  57                              push     edi
  1001EC18:  e8 33 be ff ff                  call     0x1001aa50  ; Hook::EnterHook
  1001EC1D:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  1001EC20:  8b 47 08                        mov      eax, dword ptr [edi + 8]
  1001EC23:  85 c0                           test     eax, eax
  1001EC25:  74 04                           je       0x1001ec2b
  1001EC27:  8b 00                           mov      eax, dword ptr [eax]
  1001EC29:  eb 02                           jmp      0x1001ec2d
  1001EC2B:  33 c0                           xor      eax, eax
  1001EC2D:  83 7f 04 31                     cmp      dword ptr [edi + 4], 0x31
  1001EC31:  8b 75 0c                        mov      esi, dword ptr [ebp + 0xc]
  1001EC34:  75 64                           jne      0x1001ec9a
  1001EC36:  85 c0                           test     eax, eax
  1001EC38:  74 60                           je       0x1001ec9a
  1001EC3A:  85 f6                           test     esi, esi
  1001EC3C:  74 5c                           je       0x1001ec9a
  1001EC3E:  83 7e 04 0e                     cmp      dword ptr [esi + 4], 0xe
  1001EC42:  75 56                           jne      0x1001ec9a
  1001EC44:  83 7e 08 07                     cmp      dword ptr [esi + 8], 7
  1001EC48:  75 50                           jne      0x1001ec9a
  1001EC4A:  ff 37                           push     dword ptr [edi]
  1001EC4C:  e8 bf 7a 00 00                  call     0x10026710  ; UI::GetFrameById
  1001EC51:  6a 12                           push     0x12
  1001EC53:  50                              push     eax
  1001EC54:  c7 45 08 00 00 00 00            mov      dword ptr [ebp + 8], 0
  1001EC5B:  e8 90 77 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001EC60:  83 c4 0c                        add      esp, 0xc
  1001EC63:  85 c0                           test     eax, eax
  1001EC65:  74 33                           je       0x1001ec9a
  1001EC67:  8d 4d 08                        lea      ecx, [ebp + 8]
  1001EC6A:  51                              push     ecx
  1001EC6B:  8b c8                           mov      ecx, eax
  1001EC6D:  e8 8e 84 ff ff                  call     0x10017100  ; ScrollableFrame::GetSelectedValue
  1001EC72:  84 c0                           test     al, al
  1001EC74:  74 24                           je       0x1001ec9a
  1001EC76:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001EC79:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001EC7C:  8d 45 f8                        lea      eax, [ebp - 8]
  1001EC7F:  6a 00                           push     0
  1001EC81:  50                              push     eax
  1001EC82:  68 06 00 00 30                  push     0x30000006
  1001EC87:  c7 45 f8 0c 00 00 00            mov      dword ptr [ebp - 8], 0xc
  1001EC8E:  e8 3d 94 00 00                  call     0x100280d0  ; UI::SendUIMessage
  1001EC93:  83 c4 0c                        add      esp, 0xc
  1001EC96:  84 c0                           test     al, al
  1001EC98:  74 0e                           je       0x1001eca8
  1001EC9A:  ff 75 10                        push     dword ptr [ebp + 0x10]
  1001EC9D:  56                              push     esi
  1001EC9E:  57                              push     edi
  1001EC9F:  ff 15 c4 c3 08 10               call     dword ptr [0x1008c3c4]
  1001ECA5:  83 c4 0c                        add      esp, 0xc
  1001ECA8:  e8 d3 bd ff ff                  call     0x1001aa80  ; Hook::LeaveHook
  1001ECAD:  5f                              pop      edi
  1001ECAE:  5e                              pop      esi
  1001ECAF:  8b e5                           mov      esp, ebp
  1001ECB1:  5d                              pop      ebp
  1001ECB2:  c3                              ret      


; === Merchant::RequestQuote ===
; RVA: 0x0001ED40  Size: 459 bytes
; Exports: ?RequestQuote@Merchant@GW@@YA_NW4TransactionType@12@I@Z
;
  1001ED40:  55                              push     ebp
  1001ED41:  8b ec                           mov      ebp, esp
  1001ED43:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001ED46:  53                              push     ebx
  1001ED47:  8b 5d 0c                        mov      ebx, dword ptr [ebp + 0xc]
  1001ED4A:  56                              push     esi
  1001ED4B:  57                              push     edi
  1001ED4C:  83 e8 0c                        sub      eax, 0xc
  1001ED4F:  0f 84 bd 00 00 00               je       0x1001ee12
  1001ED55:  83 e8 01                        sub      eax, 1
  1001ED58:  0f 85 a6 01 00 00               jne      0x1001ef04
  1001ED5E:  68 3c 31 05 10                  push     0x1005313c
  1001ED63:  e8 18 7a 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001ED68:  6a 00                           push     0
  1001ED6A:  50                              push     eax
  1001ED6B:  e8 80 76 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001ED70:  8b f0                           mov      esi, eax
  1001ED72:  83 c4 0c                        add      esp, 0xc
  1001ED75:  85 f6                           test     esi, esi
  1001ED77:  0f 84 87 01 00 00               je       0x1001ef04
  1001ED7D:  68 4c 31 05 10                  push     0x1005314c
  1001ED82:  8b ce                           mov      ecx, esi
  1001ED84:  e8 47 84 ff ff                  call     0x100171d0  ; TabsFrame::GetTabByLabel
  1001ED89:  50                              push     eax
  1001ED8A:  8b ce                           mov      ecx, esi
  1001ED8C:  e8 3f 79 ff ff                  call     0x100166d0  ; TabsFrame::ChooseTab
  1001ED91:  84 c0                           test     al, al
  1001ED93:  0f 84 6b 01 00 00               je       0x1001ef04
  1001ED99:  68 3c 31 05 10                  push     0x1005313c
  1001ED9E:  e8 dd 79 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001EDA3:  6a 00                           push     0
  1001EDA5:  50                              push     eax
  1001EDA6:  e8 45 76 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001EDAB:  83 c4 0c                        add      esp, 0xc
  1001EDAE:  85 c0                           test     eax, eax
  1001EDB0:  74 0b                           je       0x1001edbd
  1001EDB2:  8b c8                           mov      ecx, eax
  1001EDB4:  e8 47 7c ff ff                  call     0x10016a00  ; TabsFrame::GetCurrentTab
  1001EDB9:  8b f0                           mov      esi, eax
  1001EDBB:  eb 02                           jmp      0x1001edbf
  1001EDBD:  33 f6                           xor      esi, esi
  1001EDBF:  53                              push     ebx
  1001EDC0:  e8 6b cd ff ff                  call     0x1001bb30  ; Items::GetItemById
  1001EDC5:  8b f8                           mov      edi, eax
  1001EDC7:  83 c4 04                        add      esp, 4
  1001EDCA:  85 ff                           test     edi, edi
  1001EDCC:  0f 84 32 01 00 00               je       0x1001ef04
  1001EDD2:  83 7f 0c 00                     cmp      dword ptr [edi + 0xc], 0
  1001EDD6:  0f 84 28 01 00 00               je       0x1001ef04
  1001EDDC:  6a 06                           push     6
  1001EDDE:  56                              push     esi
  1001EDDF:  e8 0c 76 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001EDE4:  6a 02                           push     2
  1001EDE6:  50                              push     eax
  1001EDE7:  e8 04 76 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001EDEC:  8b 4f 0c                        mov      ecx, dword ptr [edi + 0xc]
  1001EDEF:  83 c4 10                        add      esp, 0x10
  1001EDF2:  8b 49 04                        mov      ecx, dword ptr [ecx + 4]
  1001EDF5:  83 c1 08                        add      ecx, 8
  1001EDF8:  51                              push     ecx
  1001EDF9:  8b c8                           mov      ecx, eax
  1001EDFB:  e8 b0 7d ff ff                  call     0x10016bb0  ; ScrollableFrame::GetItemFrameId
  1001EE00:  50                              push     eax
  1001EE01:  e8 0a 79 00 00                  call     0x10026710  ; UI::GetFrameById
  1001EE06:  8b f8                           mov      edi, eax
  1001EE08:  83 c4 04                        add      esp, 4
  1001EE0B:  b8 02 00 00 00                  mov      eax, 2
  1001EE10:  eb 73                           jmp      0x1001ee85
  1001EE12:  68 3c 31 05 10                  push     0x1005313c
  1001EE17:  e8 64 79 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001EE1C:  6a 00                           push     0
  1001EE1E:  50                              push     eax
  1001EE1F:  e8 cc 75 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001EE24:  8b f0                           mov      esi, eax
  1001EE26:  83 c4 0c                        add      esp, 0xc
  1001EE29:  85 f6                           test     esi, esi
  1001EE2B:  0f 84 d3 00 00 00               je       0x1001ef04
  1001EE31:  68 50 31 05 10                  push     0x10053150
  1001EE36:  8b ce                           mov      ecx, esi
  1001EE38:  e8 93 83 ff ff                  call     0x100171d0  ; TabsFrame::GetTabByLabel
  1001EE3D:  50                              push     eax
  1001EE3E:  8b ce                           mov      ecx, esi
  1001EE40:  e8 8b 78 ff ff                  call     0x100166d0  ; TabsFrame::ChooseTab
  1001EE45:  84 c0                           test     al, al
  1001EE47:  0f 84 b7 00 00 00               je       0x1001ef04
  1001EE4D:  68 3c 31 05 10                  push     0x1005313c
  1001EE52:  e8 29 79 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001EE57:  6a 00                           push     0
  1001EE59:  50                              push     eax
  1001EE5A:  e8 91 75 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001EE5F:  83 c4 0c                        add      esp, 0xc
  1001EE62:  85 c0                           test     eax, eax
  1001EE64:  74 0b                           je       0x1001ee71
  1001EE66:  8b c8                           mov      ecx, eax
  1001EE68:  e8 93 7b ff ff                  call     0x10016a00  ; TabsFrame::GetCurrentTab
  1001EE6D:  8b f0                           mov      esi, eax
  1001EE6F:  eb 02                           jmp      0x1001ee73
  1001EE71:  33 f6                           xor      esi, esi
  1001EE73:  6a 12                           push     0x12
  1001EE75:  56                              push     esi
  1001EE76:  e8 75 75 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001EE7B:  8b f8                           mov      edi, eax
  1001EE7D:  83 c4 08                        add      esp, 8
  1001EE80:  b8 0e 00 00 00                  mov      eax, 0xe
  1001EE85:  50                              push     eax
  1001EE86:  56                              push     esi
  1001EE87:  e8 64 75 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001EE8C:  68 3c 31 05 10                  push     0x1005313c
  1001EE91:  8b f0                           mov      esi, eax
  1001EE93:  e8 e8 78 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001EE98:  6a 00                           push     0
  1001EE9A:  50                              push     eax
  1001EE9B:  e8 50 75 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001EEA0:  83 c4 14                        add      esp, 0x14
  1001EEA3:  85 c0                           test     eax, eax
  1001EEA5:  74 09                           je       0x1001eeb0
  1001EEA7:  8b c8                           mov      ecx, eax
  1001EEA9:  e8 52 7b ff ff                  call     0x10016a00  ; TabsFrame::GetCurrentTab
  1001EEAE:  eb 02                           jmp      0x1001eeb2
  1001EEB0:  33 c0                           xor      eax, eax
  1001EEB2:  50                              push     eax
  1001EEB3:  e8 28 79 00 00                  call     0x100267e0  ; UI::GetFrameContext
  1001EEB8:  83 c4 04                        add      esp, 4
  1001EEBB:  85 c0                           test     eax, eax
  1001EEBD:  74 12                           je       0x1001eed1
  1001EEBF:  39 58 04                        cmp      dword ptr [eax + 4], ebx
  1001EEC2:  75 0d                           jne      0x1001eed1
  1001EEC4:  83 78 08 00                     cmp      dword ptr [eax + 8], 0
  1001EEC8:  74 07                           je       0x1001eed1
  1001EECA:  5f                              pop      edi
  1001EECB:  5e                              pop      esi
  1001EECC:  b0 01                           mov      al, 1
  1001EECE:  5b                              pop      ebx
  1001EECF:  5d                              pop      ebp
  1001EED0:  c3                              ret      
  1001EED1:  85 ff                           test     edi, edi
  1001EED3:  74 2f                           je       0x1001ef04
  1001EED5:  53                              push     ebx
  1001EED6:  8b cf                           mov      ecx, edi
  1001EED8:  e8 d3 7c ff ff                  call     0x10016bb0  ; ScrollableFrame::GetItemFrameId
  1001EEDD:  85 c0                           test     eax, eax
  1001EEDF:  74 23                           je       0x1001ef04
  1001EEE1:  50                              push     eax
  1001EEE2:  e8 29 78 00 00                  call     0x10026710  ; UI::GetFrameById
  1001EEE7:  83 c4 04                        add      esp, 4
  1001EEEA:  8b c8                           mov      ecx, eax
  1001EEEC:  6a 08                           push     8
  1001EEEE:  e8 bd 85 ff ff                  call     0x100174b0  ; ButtonFrame::MouseAction
  1001EEF3:  84 c0                           test     al, al
  1001EEF5:  74 0d                           je       0x1001ef04
  1001EEF7:  56                              push     esi
  1001EEF8:  e8 33 71 00 00                  call     0x10026030  ; UI::ButtonClick, ButtonClick
  1001EEFD:  83 c4 04                        add      esp, 4
  1001EF00:  84 c0                           test     al, al
  1001EF02:  75 c6                           jne      0x1001eeca
  1001EF04:  5f                              pop      edi
  1001EF05:  5e                              pop      esi
  1001EF06:  32 c0                           xor      al, al
  1001EF08:  5b                              pop      ebx
  1001EF09:  5d                              pop      ebp
  1001EF0A:  c3                              ret      


; === Merchant::TransactItems ===
; RVA: 0x0001EF10  Size: 75 bytes
; Exports: ?TransactItems@Merchant@GW@@YA_NXZ
;
  1001EF10:  68 5c 31 05 10                  push     0x1005315c
  1001EF15:  e8 66 78 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001EF1A:  8b d0                           mov      edx, eax
  1001EF1C:  83 c4 04                        add      esp, 4
  1001EF1F:  85 d2                           test     edx, edx
  1001EF21:  74 0e                           je       0x1001ef31
  1001EF23:  8b 8a 8c 01 00 00               mov      ecx, dword ptr [edx + 0x18c]
  1001EF29:  c1 e9 04                        shr      ecx, 4
  1001EF2C:  f6 c1 01                        test     cl, 1
  1001EF2F:  74 13                           je       0x1001ef44
  1001EF31:  68 6c 31 05 10                  push     0x1005316c
  1001EF36:  e8 45 78 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  1001EF3B:  8b d0                           mov      edx, eax
  1001EF3D:  83 c4 04                        add      esp, 4
  1001EF40:  85 d2                           test     edx, edx
  1001EF42:  74 14                           je       0x1001ef58
  1001EF44:  8b 82 8c 01 00 00               mov      eax, dword ptr [edx + 0x18c]
  1001EF4A:  c1 e8 04                        shr      eax, 4
  1001EF4D:  a8 01                           test     al, 1
  1001EF4F:  75 07                           jne      0x1001ef58
  1001EF51:  8b ca                           mov      ecx, edx
  1001EF53:  e9 e8 77 ff ff                  jmp      0x10016740
  1001EF58:  32 c0                           xor      al, al
  1001EF5A:  c3                              ret      


