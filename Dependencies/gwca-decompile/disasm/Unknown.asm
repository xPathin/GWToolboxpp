; Module: Unknown
; Functions: 82
; Total code size: 3085 bytes
;

; === CountAllegianceInRange ===
; RVA: 0x00003260  Size: 27 bytes
; Exports: CountAllegianceInRange
;
  10003260:  55                              push     ebp
  10003261:  8b ec                           mov      ebp, esp
  10003263:  f3 0f 10 45 0c                  movss    xmm0, dword ptr [ebp + 0xc]
  10003268:  51                              push     ecx
  10003269:  f3 0f 11 04 24                  movss    dword ptr [esp], xmm0
  1000326E:  ff 75 08                        push     dword ptr [ebp + 8]
  10003271:  e8 4a ec ff ff                  call     0x10001ec0  ; Agents::CountAllegianceInRange
  10003276:  83 c4 08                        add      esp, 8
  10003279:  5d                              pop      ebp
  1000327A:  c3                              ret      


; === GetAgentEncNameByAgent ===
; RVA: 0x00003280  Size: 9 bytes
; Exports: GetAgentEncNameByAgent
;
  10003280:  55                              push     ebp
  10003281:  8b ec                           mov      ebp, esp
  10003283:  5d                              pop      ebp
  10003284:  e9 d7 ed ff ff                  jmp      0x10002060


; === GetAgentEncNameById ===
; RVA: 0x00003290  Size: 9 bytes
; Exports: GetAgentEncNameById
;
  10003290:  55                              push     ebp
  10003291:  8b ec                           mov      ebp, esp
  10003293:  5d                              pop      ebp
  10003294:  e9 37 ed ff ff                  jmp      0x10001fd0


; === GetControlledCharacter ===
; RVA: 0x000032A0  Size: 25 bytes
; Exports: GetControlledCharacter
;
  100032A0:  e9 ab ef ff ff                  jmp      0x10002250
  100032A5:  cc                              int3     
  100032A6:  cc                              int3     
  100032A7:  cc                              int3     
  100032A8:  cc                              int3     
  100032A9:  cc                              int3     
  100032AA:  cc                              int3     
  100032AB:  cc                              int3     
  100032AC:  cc                              int3     
  100032AD:  cc                              int3     
  100032AE:  cc                              int3     
  100032AF:  cc                              int3     
  100032B0:  55                              push     ebp
  100032B1:  8b ec                           mov      ebp, esp
  100032B3:  5d                              pop      ebp
  100032B4:  e9 87 f2 ff ff                  jmp      0x10002540


; === GetIsAgentTargettable ===
; RVA: 0x000032B0  Size: 9 bytes
; Exports: GetIsAgentTargettable
;
  100032B0:  55                              push     ebp
  100032B1:  8b ec                           mov      ebp, esp
  100032B3:  5d                              pop      ebp
  100032B4:  e9 87 f2 ff ff                  jmp      0x10002540


; === GetPlayerByID ===
; RVA: 0x000032C0  Size: 9 bytes
; Exports: GetPlayerByID
;
  100032C0:  55                              push     ebp
  100032C1:  8b ec                           mov      ebp, esp
  100032C3:  5d                              pop      ebp
  100032C4:  e9 17 f4 ff ff                  jmp      0x100026e0


; === GetTargetAsAgentLiving ===
; RVA: 0x000032D0  Size: 25 bytes
; Exports: GetTargetAsAgentLiving
;
  100032D0:  e9 7b f4 ff ff                  jmp      0x10002750
  100032D5:  cc                              int3     
  100032D6:  cc                              int3     
  100032D7:  cc                              int3     
  100032D8:  cc                              int3     
  100032D9:  cc                              int3     
  100032DA:  cc                              int3     
  100032DB:  cc                              int3     
  100032DC:  cc                              int3     
  100032DD:  cc                              int3     
  100032DE:  cc                              int3     
  100032DF:  cc                              int3     
  100032E0:  55                              push     ebp
  100032E1:  8b ec                           mov      ebp, esp
  100032E3:  5d                              pop      ebp
  100032E4:  e9 e7 f6 ff ff                  jmp      0x100029d0


; === InteractAgent ===
; RVA: 0x000032E0  Size: 9 bytes
; Exports: InteractAgent
;
  100032E0:  55                              push     ebp
  100032E1:  8b ec                           mov      ebp, esp
  100032E3:  5d                              pop      ebp
  100032E4:  e9 e7 f6 ff ff                  jmp      0x100029d0


; === ComputeCamPos ===
; RVA: 0x00003660  Size: 69 bytes
; Exports: ComputeCamPos
;
  10003660:  55                              push     ebp
  10003661:  8b ec                           mov      ebp, esp
  10003663:  83 ec 0c                        sub      esp, 0xc
  10003666:  f3 0f 10 45 08                  movss    xmm0, dword ptr [ebp + 8]
  1000366B:  8d 45 f4                        lea      eax, [ebp - 0xc]
  1000366E:  51                              push     ecx
  1000366F:  f3 0f 11 04 24                  movss    dword ptr [esp], xmm0
  10003674:  50                              push     eax
  10003675:  e8 36 fd ff ff                  call     0x100033b0  ; CameraMgr::ComputeCamPos
  1000367A:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  1000367D:  83 c4 08                        add      esp, 8
  10003680:  f3 0f 10 45 f4                  movss    xmm0, dword ptr [ebp - 0xc]
  10003685:  f3 0f 11 00                     movss    dword ptr [eax], xmm0
  10003689:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  1000368C:  f3 0f 10 45 f8                  movss    xmm0, dword ptr [ebp - 8]
  10003691:  f3 0f 11 00                     movss    dword ptr [eax], xmm0
  10003695:  8b 45 14                        mov      eax, dword ptr [ebp + 0x14]
  10003698:  f3 0f 10 45 fc                  movss    xmm0, dword ptr [ebp - 4]
  1000369D:  f3 0f 11 00                     movss    dword ptr [eax], xmm0
  100036A1:  8b e5                           mov      esp, ebp
  100036A3:  5d                              pop      ebp
  100036A4:  c3                              ret      


; === SendChat ===
; RVA: 0x00005610  Size: 9 bytes
; Exports: SendChat
;
  10005610:  55                              push     ebp
  10005611:  8b ec                           mov      ebp, esp
  10005613:  5d                              pop      ebp
  10005614:  e9 e7 f9 ff ff                  jmp      0x10005000


; === SendWhisper ===
; RVA: 0x00005620  Size: 9 bytes
; Exports: SendWhisper
;
  10005620:  55                              push     ebp
  10005621:  8b ec                           mov      ebp, esp
  10005623:  5d                              pop      ebp
  10005624:  e9 b7 fa ff ff                  jmp      0x100050e0


; === SetMessageColor ===
; RVA: 0x00005630  Size: 63 bytes
; Exports: SetMessageColor
;
  10005630:  55                              push     ebp
  10005631:  8b ec                           mov      ebp, esp
  10005633:  51                              push     ecx
  10005634:  8b 0d e4 c0 08 10               mov      ecx, dword ptr [0x1008c0e4]
  1000563A:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1000563D:  89 45 08                        mov      dword ptr [ebp + 8], eax
  10005640:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10005647:  85 c9                           test     ecx, ecx
  10005649:  74 0a                           je       0x10005655
  1000564B:  50                              push     eax
  1000564C:  8d 45 fc                        lea      eax, [ebp - 4]
  1000564F:  50                              push     eax
  10005650:  ff d1                           call     ecx
  10005652:  83 c4 08                        add      esp, 8
  10005655:  8d 45 08                        lea      eax, [ebp + 8]
  10005658:  b9 4c c1 08 10                  mov      ecx, 0x1008c14c
  1000565D:  50                              push     eax
  1000565E:  e8 4d ec ff ff                  call     0x100042b0
  10005663:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  10005666:  89 08                           mov      dword ptr [eax], ecx
  10005668:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  1000566B:  8b e5                           mov      esp, ebp
  1000566D:  5d                              pop      ebp
  1000566E:  c3                              ret      


; === SetSenderColor ===
; RVA: 0x00005670  Size: 63 bytes
; Exports: SetSenderColor
;
  10005670:  55                              push     ebp
  10005671:  8b ec                           mov      ebp, esp
  10005673:  51                              push     ecx
  10005674:  8b 0d dc c0 08 10               mov      ecx, dword ptr [0x1008c0dc]
  1000567A:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1000567D:  89 45 08                        mov      dword ptr [ebp + 8], eax
  10005680:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10005687:  85 c9                           test     ecx, ecx
  10005689:  74 0a                           je       0x10005695
  1000568B:  50                              push     eax
  1000568C:  8d 45 fc                        lea      eax, [ebp - 4]
  1000568F:  50                              push     eax
  10005690:  ff d1                           call     ecx
  10005692:  83 c4 08                        add      esp, 8
  10005695:  8d 45 08                        lea      eax, [ebp + 8]
  10005698:  b9 44 c1 08 10                  mov      ecx, 0x1008c144
  1000569D:  50                              push     eax
  1000569E:  e8 0d ec ff ff                  call     0x100042b0
  100056A3:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  100056A6:  89 08                           mov      dword ptr [eax], ecx
  100056A8:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  100056AB:  8b e5                           mov      esp, ebp
  100056AD:  5d                              pop      ebp
  100056AE:  c3                              ret      


; === WriteChat ===
; RVA: 0x000056B0  Size: 21 bytes
; Exports: WriteChat
;
  100056B0:  e9 db fb ff ff                  jmp      0x10005290
  100056B5:  cc                              int3     
  100056B6:  cc                              int3     
  100056B7:  cc                              int3     
  100056B8:  cc                              int3     
  100056B9:  cc                              int3     
  100056BA:  cc                              int3     
  100056BB:  cc                              int3     
  100056BC:  cc                              int3     
  100056BD:  cc                              int3     
  100056BE:  cc                              int3     
  100056BF:  cc                              int3     
  100056C0:  e9 db fc ff ff                  jmp      0x100053a0


; === WriteChatEnc ===
; RVA: 0x000056C0  Size: 22 bytes
; Exports: WriteChatEnc
;
  100056C0:  e9 db fc ff ff                  jmp      0x100053a0
  100056C5:  cc                              int3     
  100056C6:  cc                              int3     
  100056C7:  cc                              int3     
  100056C8:  cc                              int3     
  100056C9:  cc                              int3     
  100056CA:  cc                              int3     
  100056CB:  cc                              int3     
  100056CC:  cc                              int3     
  100056CD:  cc                              int3     
  100056CE:  cc                              int3     
  100056CF:  cc                              int3     
  100056D0:  b8 78 c1 08 10                  mov      eax, 0x1008c178
  100056D5:  c3                              ret      


; === DropBuff ===
; RVA: 0x00005CF0  Size: 9 bytes
; Exports: DropBuff
;
  10005CF0:  55                              push     ebp
  10005CF1:  8b ec                           mov      ebp, esp
  10005CF3:  5d                              pop      ebp
  10005CF4:  e9 97 fc ff ff                  jmp      0x10005990


; === MultiLineTextLabelFrame::GetDecodedLabel ===
; RVA: 0x00016A80  Size: 62 bytes
; Exports: ?GetDecodedLabel@MultiLineTextLabelFrame@GW@@QAEPB_WXZ
;
  10016A80:  56                              push     esi
  10016A81:  51                              push     ecx
  10016A82:  e8 59 fd 00 00                  call     0x100267e0  ; UI::GetFrameContext
  10016A87:  83 c4 04                        add      esp, 4
  10016A8A:  85 c0                           test     eax, eax
  10016A8C:  74 2c                           je       0x10016aba
  10016A8E:  8b 50 08                        mov      edx, dword ptr [eax + 8]
  10016A91:  85 d2                           test     edx, edx
  10016A93:  74 25                           je       0x10016aba
  10016A95:  8b 30                           mov      esi, dword ptr [eax]
  10016A97:  8b ce                           mov      ecx, esi
  10016A99:  57                              push     edi
  10016A9A:  8d 79 02                        lea      edi, [ecx + 2]
  10016A9D:  0f 1f 00                        nop      dword ptr [eax]
  10016AA0:  66 8b 01                        mov      ax, word ptr [ecx]
  10016AA3:  83 c1 02                        add      ecx, 2
  10016AA6:  66 85 c0                        test     ax, ax
  10016AA9:  75 f5                           jne      0x10016aa0
  10016AAB:  2b cf                           sub      ecx, edi
  10016AAD:  d1 f9                           sar      ecx, 1
  10016AAF:  41                              inc      ecx
  10016AB0:  5f                              pop      edi
  10016AB1:  3b d1                           cmp      edx, ecx
  10016AB3:  76 05                           jbe      0x10016aba
  10016AB5:  8d 04 4e                        lea      eax, [esi + ecx*2]
  10016AB8:  5e                              pop      esi
  10016AB9:  c3                              ret      
  10016ABA:  33 c0                           xor      eax, eax
  10016ABC:  5e                              pop      esi
  10016ABD:  c3                              ret      


; === MultiLineTextLabelFrame::GetEncodedLabel ===
; RVA: 0x00016B00  Size: 25 bytes
; Exports: ?GetEncodedLabel@MultiLineTextLabelFrame@GW@@QAEPB_WXZ
;
  10016B00:  51                              push     ecx
  10016B01:  e8 da fc 00 00                  call     0x100267e0  ; UI::GetFrameContext
  10016B06:  83 c4 04                        add      esp, 4
  10016B09:  85 c0                           test     eax, eax
  10016B0B:  74 09                           je       0x10016b16
  10016B0D:  83 78 08 00                     cmp      dword ptr [eax + 8], 0
  10016B11:  74 03                           je       0x10016b16
  10016B13:  8b 00                           mov      eax, dword ptr [eax]
  10016B15:  c3                              ret      
  10016B16:  33 c0                           xor      eax, eax
  10016B18:  c3                              ret      


; === MultiLineTextLabelFrame::SetLabel ===
; RVA: 0x00017870  Size: 40 bytes
; Exports: ?SetLabel@MultiLineTextLabelFrame@GW@@QAE_NPB_W@Z
;
  10017870:  55                              push     ebp
  10017871:  8b ec                           mov      ebp, esp
  10017873:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10017876:  85 c0                           test     eax, eax
  10017878:  74 18                           je       0x10017892
  1001787A:  6a 00                           push     0
  1001787C:  50                              push     eax
  1001787D:  6a 62                           push     0x62
  1001787F:  51                              push     ecx
  10017880:  e8 9b 06 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10017885:  83 c4 10                        add      esp, 0x10
  10017888:  84 c0                           test     al, al
  1001788A:  74 06                           je       0x10017892
  1001788C:  b0 01                           mov      al, 1
  1001788E:  5d                              pop      ebp
  1001788F:  c2 04 00                        ret      4
  10017892:  32 c0                           xor      al, al
  10017894:  5d                              pop      ebp
  10017895:  c2 04 00                        ret      4


; === GetFriendByName ===
; RVA: 0x00018DE0  Size: 151 bytes
; Exports: GetFriendByName
;
  10018DE0:  55                              push     ebp
  10018DE1:  8b ec                           mov      ebp, esp
  10018DE3:  51                              push     ecx
  10018DE4:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10018DE7:  53                              push     ebx
  10018DE8:  8b 5d 0c                        mov      ebx, dword ptr [ebp + 0xc]
  10018DEB:  85 c9                           test     ecx, ecx
  10018DED:  75 0b                           jne      0x10018dfa
  10018DEF:  85 db                           test     ebx, ebx
  10018DF1:  75 07                           jne      0x10018dfa
  10018DF3:  33 c0                           xor      eax, eax
  10018DF5:  5b                              pop      ebx
  10018DF6:  8b e5                           mov      esp, ebp
  10018DF8:  5d                              pop      ebp
  10018DF9:  c3                              ret      
  10018DFA:  a1 fc c1 08 10                  mov      eax, dword ptr [0x1008c1fc]
  10018DFF:  85 c0                           test     eax, eax
  10018E01:  74 f0                           je       0x10018df3
  10018E03:  56                              push     esi
  10018E04:  57                              push     edi
  10018E05:  8b 38                           mov      edi, dword ptr [eax]
  10018E07:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  10018E0A:  8d 14 87                        lea      edx, [edi + eax*4]
  10018E0D:  89 55 fc                        mov      dword ptr [ebp - 4], edx
  10018E10:  3b fa                           cmp      edi, edx
  10018E12:  74 5a                           je       0x10018e6e
  10018E14:  8b 37                           mov      esi, dword ptr [edi]
  10018E16:  85 f6                           test     esi, esi
  10018E18:  74 3f                           je       0x10018e59
  10018E1A:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  10018E1D:  85 c0                           test     eax, eax
  10018E1F:  74 04                           je       0x10018e25
  10018E21:  39 06                           cmp      dword ptr [esi], eax
  10018E23:  75 34                           jne      0x10018e59
  10018E25:  85 c9                           test     ecx, ecx
  10018E27:  74 16                           je       0x10018e3f
  10018E29:  6a 14                           push     0x14
  10018E2B:  51                              push     ecx
  10018E2C:  8d 46 18                        lea      eax, [esi + 0x18]
  10018E2F:  50                              push     eax
  10018E30:  e8 6b d5 01 00                  call     0x100363a0
  10018E35:  83 c4 0c                        add      esp, 0xc
  10018E38:  85 c0                           test     eax, eax
  10018E3A:  74 29                           je       0x10018e65
  10018E3C:  8b 55 fc                        mov      edx, dword ptr [ebp - 4]
  10018E3F:  85 db                           test     ebx, ebx
  10018E41:  74 16                           je       0x10018e59
  10018E43:  6a 14                           push     0x14
  10018E45:  8d 46 40                        lea      eax, [esi + 0x40]
  10018E48:  53                              push     ebx
  10018E49:  50                              push     eax
  10018E4A:  e8 51 d5 01 00                  call     0x100363a0
  10018E4F:  83 c4 0c                        add      esp, 0xc
  10018E52:  85 c0                           test     eax, eax
  10018E54:  74 0f                           je       0x10018e65
  10018E56:  8b 55 fc                        mov      edx, dword ptr [ebp - 4]
  10018E59:  83 c7 04                        add      edi, 4
  10018E5C:  3b fa                           cmp      edi, edx
  10018E5E:  74 0e                           je       0x10018e6e
  10018E60:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10018E63:  eb af                           jmp      0x10018e14
  10018E65:  5f                              pop      edi
  10018E66:  8b c6                           mov      eax, esi
  10018E68:  5e                              pop      esi
  10018E69:  5b                              pop      ebx
  10018E6A:  8b e5                           mov      esp, ebp
  10018E6C:  5d                              pop      ebp
  10018E6D:  c3                              ret      
  10018E6E:  5f                              pop      edi
  10018E6F:  5e                              pop      esi
  10018E70:  33 c0                           xor      eax, eax
  10018E72:  5b                              pop      ebx
  10018E73:  8b e5                           mov      esp, ebp
  10018E75:  5d                              pop      ebp
  10018E76:  c3                              ret      


; === GetFriendByUuid ===
; RVA: 0x00018E80  Size: 9 bytes
; Exports: GetFriendByUuid
;
  10018E80:  55                              push     ebp
  10018E81:  8b ec                           mov      ebp, esp
  10018E83:  5d                              pop      ebp
  10018E84:  e9 97 f4 ff ff                  jmp      0x10018320


; === GetNumberOfFriends ===
; RVA: 0x00018E90  Size: 137 bytes
; Exports: GetNumberOfFriends
;
  10018E90:  55                              push     ebp
  10018E91:  8b ec                           mov      ebp, esp
  10018E93:  8b 0d fc c1 08 10               mov      ecx, dword ptr [0x1008c1fc]
  10018E99:  85 c9                           test     ecx, ecx
  10018E9B:  74 24                           je       0x10018ec1
  10018E9D:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10018EA0:  48                              dec      eax
  10018EA1:  83 f8 03                        cmp      eax, 3
  10018EA4:  77 1b                           ja       0x10018ec1
  10018EA6:  ff 24 85 c8 8e 01 10            jmp      dword ptr [eax*4 + 0x10018ec8]
  10018EAD:  8b 41 24                        mov      eax, dword ptr [ecx + 0x24]
  10018EB0:  5d                              pop      ebp
  10018EB1:  c3                              ret      
  10018EB2:  8b 41 28                        mov      eax, dword ptr [ecx + 0x28]
  10018EB5:  5d                              pop      ebp
  10018EB6:  c3                              ret      
  10018EB7:  8b 41 2c                        mov      eax, dword ptr [ecx + 0x2c]
  10018EBA:  5d                              pop      ebp
  10018EBB:  c3                              ret      
  10018EBC:  8b 41 30                        mov      eax, dword ptr [ecx + 0x30]
  10018EBF:  5d                              pop      ebp
  10018EC0:  c3                              ret      
  10018EC1:  33 c0                           xor      eax, eax
  10018EC3:  5d                              pop      ebp
  10018EC4:  c3                              ret      
  10018EC5:  0f 1f 00                        nop      dword ptr [eax]
  10018EC8:  ad                              lodsd    eax, dword ptr [esi]
  10018EC9:  8e 01                           mov      es, word ptr [ecx]
  10018ECB:  10 b2 8e 01 10 b7               adc      byte ptr [edx - 0x48effe72], dh
  10018ED1:  8e 01                           mov      es, word ptr [ecx]
  10018ED3:  10 bc 8e 01 10 cc cc            adc      byte ptr [esi + ecx*4 - 0x3333efff], bh
  10018EDA:  cc                              int3     
  10018EDB:  cc                              int3     
  10018EDC:  cc                              int3     
  10018EDD:  cc                              int3     
  10018EDE:  cc                              int3     
  10018EDF:  cc                              int3     
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


; === Enqueue ===
; RVA: 0x0001A470  Size: 361 bytes
; Exports: Enqueue
;
  1001A470:  55                              push     ebp
  1001A471:  8b ec                           mov      ebp, esp
  1001A473:  83 ec 28                        sub      esp, 0x28
  1001A476:  80 3d 6c c2 08 10 00            cmp      byte ptr [0x1008c26c], 0
  1001A47D:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001A480:  89 45 dc                        mov      dword ptr [ebp - 0x24], eax
  1001A483:  8d 45 d8                        lea      eax, [ebp - 0x28]
  1001A486:  56                              push     esi
  1001A487:  c7 45 d8 20 25 05 10            mov      dword ptr [ebp - 0x28], 0x10052520
  1001A48E:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001A491:  75 0e                           jne      0x1001a4a1
  1001A493:  6a 00                           push     0
  1001A495:  8b c8                           mov      ecx, eax
  1001A497:  e8 74 74 fe ff                  call     0x10001910
  1001A49C:  5e                              pop      esi
  1001A49D:  8b e5                           mov      esp, ebp
  1001A49F:  5d                              pop      ebp
  1001A4A0:  c3                              ret      
  1001A4A1:  68 4c c2 08 10                  push     0x1008c24c
  1001A4A6:  ff 15 34 c0 04 10               call     dword ptr [0x1004c034]
  1001A4AC:  80 7d 0c 00                     cmp      byte ptr [ebp + 0xc], 0
  1001A4B0:  75 1b                           jne      0x1001a4cd
  1001A4B2:  80 3d 6d c2 08 10 00            cmp      byte ptr [0x1008c26d], 0
  1001A4B9:  74 12                           je       0x1001a4cd
  1001A4BB:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001A4BE:  85 c9                           test     ecx, ecx
  1001A4C0:  0f 84 a5 00 00 00               je       0x1001a56b
  1001A4C6:  8b 01                           mov      eax, dword ptr [ecx]
  1001A4C8:  ff 50 08                        call     dword ptr [eax + 8]
  1001A4CB:  eb 76                           jmp      0x1001a543
  1001A4CD:  8b 35 74 c2 08 10               mov      esi, dword ptr [0x1008c274]
  1001A4D3:  3b 35 78 c2 08 10               cmp      esi, dword ptr [0x1008c278]
  1001A4D9:  74 59                           je       0x1001a534
  1001A4DB:  c7 46 24 00 00 00 00            mov      dword ptr [esi + 0x24], 0
  1001A4E2:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001A4E5:  85 c9                           test     ecx, ecx
  1001A4E7:  74 42                           je       0x1001a52b
  1001A4E9:  8d 45 d8                        lea      eax, [ebp - 0x28]
  1001A4EC:  3b c8                           cmp      ecx, eax
  1001A4EE:  75 31                           jne      0x1001a521
  1001A4F0:  8b 01                           mov      eax, dword ptr [ecx]
  1001A4F2:  56                              push     esi
  1001A4F3:  ff 50 04                        call     dword ptr [eax + 4]
  1001A4F6:  89 46 24                        mov      dword ptr [esi + 0x24], eax
  1001A4F9:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001A4FC:  85 c9                           test     ecx, ecx
  1001A4FE:  74 2b                           je       0x1001a52b
  1001A500:  8b 11                           mov      edx, dword ptr [ecx]
  1001A502:  8d 45 d8                        lea      eax, [ebp - 0x28]
  1001A505:  3b c8                           cmp      ecx, eax
  1001A507:  0f 95 c0                        setne    al
  1001A50A:  0f b6 c0                        movzx    eax, al
  1001A50D:  50                              push     eax
  1001A50E:  ff 52 10                        call     dword ptr [edx + 0x10]
  1001A511:  83 05 74 c2 08 10 28            add      dword ptr [0x1008c274], 0x28
  1001A518:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001A51F:  eb 22                           jmp      0x1001a543
  1001A521:  89 4e 24                        mov      dword ptr [esi + 0x24], ecx
  1001A524:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001A52B:  83 05 74 c2 08 10 28            add      dword ptr [0x1008c274], 0x28
  1001A532:  eb 0f                           jmp      0x1001a543
  1001A534:  8d 45 d8                        lea      eax, [ebp - 0x28]
  1001A537:  b9 70 c2 08 10                  mov      ecx, 0x1008c270
  1001A53C:  50                              push     eax
  1001A53D:  56                              push     esi
  1001A53E:  e8 cd f5 ff ff                  call     0x10019b10
  1001A543:  68 4c c2 08 10                  push     0x1008c24c
  1001A548:  ff 15 38 c0 04 10               call     dword ptr [0x1004c038]
  1001A54E:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001A551:  85 c9                           test     ecx, ecx
  1001A553:  74 11                           je       0x1001a566
  1001A555:  8b 11                           mov      edx, dword ptr [ecx]
  1001A557:  8d 45 d8                        lea      eax, [ebp - 0x28]
  1001A55A:  3b c8                           cmp      ecx, eax
  1001A55C:  0f 95 c0                        setne    al
  1001A55F:  0f b6 c0                        movzx    eax, al
  1001A562:  50                              push     eax
  1001A563:  ff 52 10                        call     dword ptr [edx + 0x10]
  1001A566:  5e                              pop      esi
  1001A567:  8b e5                           mov      esp, ebp
  1001A569:  5d                              pop      ebp
  1001A56A:  c3                              ret      
  1001A56B:  e8 6d 11 01 00                  call     0x1002b6dd
  1001A570:  cc                              int3     
  1001A571:  cc                              int3     
  1001A572:  cc                              int3     
  1001A573:  cc                              int3     
  1001A574:  cc                              int3     
  1001A575:  cc                              int3     
  1001A576:  cc                              int3     
  1001A577:  cc                              int3     
  1001A578:  cc                              int3     
  1001A579:  cc                              int3     
  1001A57A:  cc                              int3     
  1001A57B:  cc                              int3     
  1001A57C:  cc                              int3     
  1001A57D:  cc                              int3     
  1001A57E:  cc                              int3     
  1001A57F:  cc                              int3     
  1001A580:  55                              push     ebp
  1001A581:  8b ec                           mov      ebp, esp
  1001A583:  83 ec 2c                        sub      esp, 0x2c
  1001A586:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1001A58B:  33 c5                           xor      eax, ebp
  1001A58D:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001A590:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  1001A593:  ff 75 10                        push     dword ptr [ebp + 0x10]
  1001A596:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001A599:  89 45 d8                        mov      dword ptr [ebp - 0x28], eax
  1001A59C:  8d 45 d4                        lea      eax, [ebp - 0x2c]
  1001A59F:  50                              push     eax
  1001A5A0:  51                              push     ecx
  1001A5A1:  c7 45 d4 3c 25 05 10            mov      dword ptr [ebp - 0x2c], 0x1005253c
  1001A5A8:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  1001A5AB:  e8 b0 fb ff ff                  call     0x1001a160  ; GameThread::RegisterGameThreadCallback
  1001A5B0:  8b 4d f8                        mov      ecx, dword ptr [ebp - 8]
  1001A5B3:  83 c4 0c                        add      esp, 0xc
  1001A5B6:  85 c9                           test     ecx, ecx
  1001A5B8:  74 11                           je       0x1001a5cb
  1001A5BA:  8b 11                           mov      edx, dword ptr [ecx]
  1001A5BC:  8d 45 d4                        lea      eax, [ebp - 0x2c]
  1001A5BF:  3b c8                           cmp      ecx, eax
  1001A5C1:  0f 95 c0                        setne    al
  1001A5C4:  0f b6 c0                        movzx    eax, al
  1001A5C7:  50                              push     eax
  1001A5C8:  ff 52 10                        call     dword ptr [edx + 0x10]
  1001A5CB:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001A5CE:  33 cd                           xor      ecx, ebp
  1001A5D0:  e8 e2 1d 01 00                  call     0x1002c3b7
  1001A5D5:  8b e5                           mov      esp, ebp
  1001A5D7:  5d                              pop      ebp
  1001A5D8:  c3                              ret      


; === RegisterGameThreadCallback ===
; RVA: 0x0001A580  Size: 89 bytes
; Exports: RegisterGameThreadCallback
;
  1001A580:  55                              push     ebp
  1001A581:  8b ec                           mov      ebp, esp
  1001A583:  83 ec 2c                        sub      esp, 0x2c
  1001A586:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1001A58B:  33 c5                           xor      eax, ebp
  1001A58D:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001A590:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  1001A593:  ff 75 10                        push     dword ptr [ebp + 0x10]
  1001A596:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001A599:  89 45 d8                        mov      dword ptr [ebp - 0x28], eax
  1001A59C:  8d 45 d4                        lea      eax, [ebp - 0x2c]
  1001A59F:  50                              push     eax
  1001A5A0:  51                              push     ecx
  1001A5A1:  c7 45 d4 3c 25 05 10            mov      dword ptr [ebp - 0x2c], 0x1005253c
  1001A5A8:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  1001A5AB:  e8 b0 fb ff ff                  call     0x1001a160  ; GameThread::RegisterGameThreadCallback
  1001A5B0:  8b 4d f8                        mov      ecx, dword ptr [ebp - 8]
  1001A5B3:  83 c4 0c                        add      esp, 0xc
  1001A5B6:  85 c9                           test     ecx, ecx
  1001A5B8:  74 11                           je       0x1001a5cb
  1001A5BA:  8b 11                           mov      edx, dword ptr [ecx]
  1001A5BC:  8d 45 d4                        lea      eax, [ebp - 0x2c]
  1001A5BF:  3b c8                           cmp      ecx, eax
  1001A5C1:  0f 95 c0                        setne    al
  1001A5C4:  0f b6 c0                        movzx    eax, al
  1001A5C7:  50                              push     eax
  1001A5C8:  ff 52 10                        call     dword ptr [edx + 0x10]
  1001A5CB:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001A5CE:  33 cd                           xor      ecx, ebp
  1001A5D0:  e8 e2 1d 01 00                  call     0x1002c3b7
  1001A5D5:  8b e5                           mov      esp, ebp
  1001A5D7:  5d                              pop      ebp
  1001A5D8:  c3                              ret      


; === RemoveGameThreadCallback ===
; RVA: 0x0001A5E0  Size: 99 bytes
; Exports: RemoveGameThreadCallback
;
  1001A5E0:  e9 6b fc ff ff                  jmp      0x1001a250
  1001A5E5:  cc                              int3     
  1001A5E6:  cc                              int3     
  1001A5E7:  cc                              int3     
  1001A5E8:  cc                              int3     
  1001A5E9:  cc                              int3     
  1001A5EA:  cc                              int3     
  1001A5EB:  cc                              int3     
  1001A5EC:  cc                              int3     
  1001A5ED:  cc                              int3     
  1001A5EE:  cc                              int3     
  1001A5EF:  cc                              int3     
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


; === GetCurrentGH ===
; RVA: 0x0001A7C0  Size: 101 bytes
; Exports: GetCurrentGH
;
  1001A7C0:  e9 2b fe ff ff                  jmp      0x1001a5f0
  1001A7C5:  cc                              int3     
  1001A7C6:  cc                              int3     
  1001A7C7:  cc                              int3     
  1001A7C8:  cc                              int3     
  1001A7C9:  cc                              int3     
  1001A7CA:  cc                              int3     
  1001A7CB:  cc                              int3     
  1001A7CC:  cc                              int3     
  1001A7CD:  cc                              int3     
  1001A7CE:  cc                              int3     
  1001A7CF:  cc                              int3     
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


; === Item::GetIsMaterial ===
; RVA: 0x0001BAA0  Size: 36 bytes
; Exports: ?GetIsMaterial@Item@GW@@QBE_NXZ
;
  1001BAA0:  80 79 20 0b                     cmp      byte ptr [ecx + 0x20], 0xb
  1001BAA4:  75 1b                           jne      0x1001bac1
  1001BAA6:  8b 41 1c                        mov      eax, dword ptr [ecx + 0x1c]
  1001BAA9:  3d e2 79 00 00                  cmp      eax, 0x79e2
  1001BAAE:  74 11                           je       0x1001bac1
  1001BAB0:  3d e3 79 00 00                  cmp      eax, 0x79e3
  1001BAB5:  74 0a                           je       0x1001bac1
  1001BAB7:  3d e4 79 00 00                  cmp      eax, 0x79e4
  1001BABC:  74 03                           je       0x1001bac1
  1001BABE:  b0 01                           mov      al, 1
  1001BAC0:  c3                              ret      
  1001BAC1:  32 c0                           xor      al, al
  1001BAC3:  c3                              ret      


; === Item::GetIsZcoin ===
; RVA: 0x0001BAF0  Size: 29 bytes
; Exports: ?GetIsZcoin@Item@GW@@QBE_NXZ
;
  1001BAF0:  8b 41 1c                        mov      eax, dword ptr [ecx + 0x1c]
  1001BAF3:  3d e2 79 00 00                  cmp      eax, 0x79e2
  1001BAF8:  74 10                           je       0x1001bb0a
  1001BAFA:  3d e3 79 00 00                  cmp      eax, 0x79e3
  1001BAFF:  74 09                           je       0x1001bb0a
  1001BB01:  3d e4 79 00 00                  cmp      eax, 0x79e4
  1001BB06:  0f 94 c0                        sete     al
  1001BB09:  c3                              ret      
  1001BB0A:  b0 01                           mov      al, 1
  1001BB0C:  c3                              ret      


; === CountItemByModelId ===
; RVA: 0x0001D030  Size: 9 bytes
; Exports: CountItemByModelId
;
  1001D030:  55                              push     ebp
  1001D031:  8b ec                           mov      ebp, esp
  1001D033:  5d                              pop      ebp
  1001D034:  e9 37 e4 ff ff                  jmp      0x1001b470


; === DepositGold ===
; RVA: 0x0001D040  Size: 9 bytes
; Exports: DepositGold
;
  1001D040:  55                              push     ebp
  1001D041:  8b ec                           mov      ebp, esp
  1001D043:  5d                              pop      ebp
  1001D044:  e9 a7 e4 ff ff                  jmp      0x1001b4f0


; === DestroyItem ===
; RVA: 0x0001D050  Size: 9 bytes
; Exports: DestroyItem
;
  1001D050:  55                              push     ebp
  1001D051:  8b ec                           mov      ebp, esp
  1001D053:  5d                              pop      ebp
  1001D054:  e9 97 e5 ff ff                  jmp      0x1001b5f0


; === DropGold ===
; RVA: 0x0001D060  Size: 9 bytes
; Exports: DropGold
;
  1001D060:  55                              push     ebp
  1001D061:  8b ec                           mov      ebp, esp
  1001D063:  5d                              pop      ebp
  1001D064:  e9 47 e6 ff ff                  jmp      0x1001b6b0


; === DropItem ===
; RVA: 0x0001D070  Size: 9 bytes
; Exports: DropItem
;
  1001D070:  55                              push     ebp
  1001D071:  8b ec                           mov      ebp, esp
  1001D073:  5d                              pop      ebp
  1001D074:  e9 a7 e6 ff ff                  jmp      0x1001b720


; === EquipItem ===
; RVA: 0x0001D080  Size: 156 bytes
; Exports: EquipItem
;
  1001D080:  55                              push     ebp
  1001D081:  8b ec                           mov      ebp, esp
  1001D083:  83 ec 08                        sub      esp, 8
  1001D086:  56                              push     esi
  1001D087:  8b 75 0c                        mov      esi, dword ptr [ebp + 0xc]
  1001D08A:  57                              push     edi
  1001D08B:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  1001D08E:  85 ff                           test     edi, edi
  1001D090:  74 0c                           je       0x1001d09e
  1001D092:  8b 47 0c                        mov      eax, dword ptr [edi + 0xc]
  1001D095:  85 c0                           test     eax, eax
  1001D097:  74 3a                           je       0x1001d0d3
  1001D099:  83 38 04                        cmp      dword ptr [eax], 4
  1001D09C:  75 35                           jne      0x1001d0d3
  1001D09E:  e8 bd 03 00 00                  call     0x1001d460  ; Map::GetInstanceType, GetInstanceType
  1001D0A3:  85 c0                           test     eax, eax
  1001D0A5:  75 6d                           jne      0x1001d114
  1001D0A7:  e8 f4 04 00 00                  call     0x1001d5a0  ; Map::GetMapID, GetMapID
  1001D0AC:  50                              push     eax
  1001D0AD:  e8 0e 05 00 00                  call     0x1001d5c0  ; Map::GetMapInfo, GetMapInfo
  1001D0B2:  83 c4 04                        add      esp, 4
  1001D0B5:  85 c0                           test     eax, eax
  1001D0B7:  74 06                           je       0x1001d0bf
  1001D0B9:  83 78 08 07                     cmp      dword ptr [eax + 8], 7
  1001D0BD:  74 55                           je       0x1001d114
  1001D0BF:  6a 00                           push     0
  1001D0C1:  e8 5a 36 00 00                  call     0x10020720  ; PlayerMgr::GetPlayerByID
  1001D0C6:  83 c4 04                        add      esp, 4
  1001D0C9:  85 c0                           test     eax, eax
  1001D0CB:  74 47                           je       0x1001d114
  1001D0CD:  f6 40 34 02                     test     byte ptr [eax + 0x34], 2
  1001D0D1:  75 41                           jne      0x1001d114
  1001D0D3:  85 f6                           test     esi, esi
  1001D0D5:  75 07                           jne      0x1001d0de
  1001D0D7:  e8 f4 51 fe ff                  call     0x100022d0  ; Agents::GetControlledCharacterId, GetControlledCharacterId
  1001D0DC:  8b f0                           mov      esi, eax
  1001D0DE:  85 ff                           test     edi, edi
  1001D0E0:  74 32                           je       0x1001d114
  1001D0E2:  85 f6                           test     esi, esi
  1001D0E4:  74 2e                           je       0x1001d114
  1001D0E6:  56                              push     esi
  1001D0E7:  e8 84 4e fe ff                  call     0x10001f70  ; Agents::GetAgentByID, GetAgentByID
  1001D0EC:  83 c4 04                        add      esp, 4
  1001D0EF:  85 c0                           test     eax, eax
  1001D0F1:  74 21                           je       0x1001d114
  1001D0F3:  8b 07                           mov      eax, dword ptr [edi]
  1001D0F5:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  1001D0F8:  8d 45 f8                        lea      eax, [ebp - 8]
  1001D0FB:  6a 00                           push     0
  1001D0FD:  50                              push     eax
  1001D0FE:  68 aa 01 00 10                  push     0x100001aa
  1001D103:  89 75 fc                        mov      dword ptr [ebp - 4], esi
  1001D106:  e8 c5 af 00 00                  call     0x100280d0  ; UI::SendUIMessage
  1001D10B:  83 c4 0c                        add      esp, 0xc
  1001D10E:  5f                              pop      edi
  1001D10F:  5e                              pop      esi
  1001D110:  8b e5                           mov      esp, ebp
  1001D112:  5d                              pop      ebp
  1001D113:  c3                              ret      
  1001D114:  5f                              pop      edi
  1001D115:  32 c0                           xor      al, al
  1001D117:  5e                              pop      esi
  1001D118:  8b e5                           mov      esp, ebp
  1001D11A:  5d                              pop      ebp
  1001D11B:  c3                              ret      


; === GetItemById ===
; RVA: 0x0001D120  Size: 9 bytes
; Exports: GetItemById
;
  1001D120:  55                              push     ebp
  1001D121:  8b ec                           mov      ebp, esp
  1001D123:  5d                              pop      ebp
  1001D124:  e9 07 ea ff ff                  jmp      0x1001bb30


; === GetItemByModelId ===
; RVA: 0x0001D130  Size: 9 bytes
; Exports: GetItemByModelId
;
  1001D130:  55                              push     ebp
  1001D131:  8b ec                           mov      ebp, esp
  1001D133:  5d                              pop      ebp
  1001D134:  e9 57 ea ff ff                  jmp      0x1001bb90


; === GetItemBySlot ===
; RVA: 0x0001D140  Size: 50 bytes
; Exports: GetItemBySlot
;
  1001D140:  55                              push     ebp
  1001D141:  8b ec                           mov      ebp, esp
  1001D143:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001D146:  85 c0                           test     eax, eax
  1001D148:  74 24                           je       0x1001d16e
  1001D14A:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  1001D14D:  85 c9                           test     ecx, ecx
  1001D14F:  74 1d                           je       0x1001d16e
  1001D151:  83 78 18 00                     cmp      dword ptr [eax + 0x18], 0
  1001D155:  8d 50 18                        lea      edx, [eax + 0x18]
  1001D158:  74 14                           je       0x1001d16e
  1001D15A:  3b 48 20                        cmp      ecx, dword ptr [eax + 0x20]
  1001D15D:  77 0f                           ja       0x1001d16e
  1001D15F:  8d 41 ff                        lea      eax, [ecx - 1]
  1001D162:  8b ca                           mov      ecx, edx
  1001D164:  50                              push     eax
  1001D165:  e8 26 e2 ff ff                  call     0x1001b390
  1001D16A:  8b 00                           mov      eax, dword ptr [eax]
  1001D16C:  5d                              pop      ebp
  1001D16D:  c3                              ret      
  1001D16E:  33 c0                           xor      eax, eax
  1001D170:  5d                              pop      ebp
  1001D171:  c3                              ret      


; === GetStoragePage ===
; RVA: 0x0001D180  Size: 14 bytes
; Exports: GetStoragePage
;
  1001D180:  6a 14                           push     0x14
  1001D182:  e8 e9 97 00 00                  call     0x10026970  ; UI::GetPreference, GetPreference_Number
  1001D187:  83 c4 04                        add      esp, 4
  1001D18A:  0f b6 c0                        movzx    eax, al
  1001D18D:  c3                              ret      


; === IdentifyItem ===
; RVA: 0x0001D190  Size: 9 bytes
; Exports: IdentifyItem
;
  1001D190:  55                              push     ebp
  1001D191:  8b ec                           mov      ebp, esp
  1001D193:  5d                              pop      ebp
  1001D194:  e9 87 ee ff ff                  jmp      0x1001c020


; === SalvageMaterials ===
; RVA: 0x0001D1A0  Size: 25 bytes
; Exports: SalvageMaterials
;
  1001D1A0:  e9 6b f9 ff ff                  jmp      0x1001cb10
  1001D1A5:  cc                              int3     
  1001D1A6:  cc                              int3     
  1001D1A7:  cc                              int3     
  1001D1A8:  cc                              int3     
  1001D1A9:  cc                              int3     
  1001D1AA:  cc                              int3     
  1001D1AB:  cc                              int3     
  1001D1AC:  cc                              int3     
  1001D1AD:  cc                              int3     
  1001D1AE:  cc                              int3     
  1001D1AF:  cc                              int3     
  1001D1B0:  55                              push     ebp
  1001D1B1:  8b ec                           mov      ebp, esp
  1001D1B3:  5d                              pop      ebp
  1001D1B4:  e9 27 fa ff ff                  jmp      0x1001cbe0


; === SalvageStart ===
; RVA: 0x0001D1B0  Size: 9 bytes
; Exports: SalvageStart
;
  1001D1B0:  55                              push     ebp
  1001D1B1:  8b ec                           mov      ebp, esp
  1001D1B3:  5d                              pop      ebp
  1001D1B4:  e9 27 fa ff ff                  jmp      0x1001cbe0


; === UseItem ===
; RVA: 0x0001D1C0  Size: 9 bytes
; Exports: UseItem
;
  1001D1C0:  55                              push     ebp
  1001D1C1:  8b ec                           mov      ebp, esp
  1001D1C3:  5d                              pop      ebp
  1001D1C4:  e9 c7 fb ff ff                  jmp      0x1001cd90


; === WithdrawGold ===
; RVA: 0x0001D1D0  Size: 9 bytes
; Exports: WithdrawGold
;
  1001D1D0:  55                              push     ebp
  1001D1D1:  8b ec                           mov      ebp, esp
  1001D1D3:  5d                              pop      ebp
  1001D1D4:  e9 57 fd ff ff                  jmp      0x1001cf30


; === CreateMapContext ===
; RVA: 0x0001DA40  Size: 105 bytes
; Exports: CreateMapContext
;
  1001DA40:  55                              push     ebp
  1001DA41:  8b ec                           mov      ebp, esp
  1001DA43:  83 ec 2c                        sub      esp, 0x2c
  1001DA46:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1001DA4B:  33 c5                           xor      eax, ebp
  1001DA4D:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001DA50:  83 3d 30 c3 08 10 00            cmp      dword ptr [0x1008c330], 0
  1001DA57:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001DA5A:  74 3d                           je       0x1001da99
  1001DA5C:  85 c0                           test     eax, eax
  1001DA5E:  74 39                           je       0x1001da99
  1001DA60:  6a 04                           push     4
  1001DA62:  8d 4d f4                        lea      ecx, [ebp - 0xc]
  1001DA65:  51                              push     ecx
  1001DA66:  50                              push     eax
  1001DA67:  e8 84 b2 00 00                  call     0x10028cf0  ; UI::UInt32ToEncStr
  1001DA6C:  83 c4 0c                        add      esp, 0xc
  1001DA6F:  84 c0                           test     al, al
  1001DA71:  74 26                           je       0x1001da99
  1001DA73:  a1 30 c3 08 10                  mov      eax, dword ptr [0x1008c330]
  1001DA78:  8d 4d d4                        lea      ecx, [ebp - 0x2c]
  1001DA7B:  51                              push     ecx
  1001DA7C:  6a 00                           push     0
  1001DA7E:  6a 00                           push     0
  1001DA80:  8d 4d f4                        lea      ecx, [ebp - 0xc]
  1001DA83:  6a 00                           push     0
  1001DA85:  51                              push     ecx
  1001DA86:  ff d0                           call     eax
  1001DA88:  83 c4 14                        add      esp, 0x14
  1001DA8B:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001DA8E:  33 cd                           xor      ecx, ebp
  1001DA90:  e8 22 e9 00 00                  call     0x1002c3b7
  1001DA95:  8b e5                           mov      esp, ebp
  1001DA97:  5d                              pop      ebp
  1001DA98:  c3                              ret      
  1001DA99:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  1001DA9C:  33 c0                           xor      eax, eax
  1001DA9E:  33 cd                           xor      ecx, ebp
  1001DAA0:  e8 12 e9 00 00                  call     0x1002c3b7
  1001DAA5:  8b e5                           mov      esp, ebp
  1001DAA7:  5d                              pop      ebp
  1001DAA8:  c3                              ret      


; === GetIsInCinematic ===
; RVA: 0x0001DAB0  Size: 27 bytes
; Exports: GetIsInCinematic
;
  1001DAB0:  e8 1b b5 ff ff                  call     0x10018fd0  ; GW::GetGameContext
  1001DAB5:  85 c0                           test     eax, eax
  1001DAB7:  74 0f                           je       0x1001dac8
  1001DAB9:  8b 40 30                        mov      eax, dword ptr [eax + 0x30]
  1001DABC:  85 c0                           test     eax, eax
  1001DABE:  74 08                           je       0x1001dac8
  1001DAC0:  83 78 04 00                     cmp      dword ptr [eax + 4], 0
  1001DAC4:  0f 95 c0                        setne    al
  1001DAC7:  c3                              ret      
  1001DAC8:  32 c0                           xor      al, al
  1001DACA:  c3                              ret      


; === GetIsMapUnlocked ===
; RVA: 0x0001DAD0  Size: 70 bytes
; Exports: GetIsMapUnlocked
;
  1001DAD0:  55                              push     ebp
  1001DAD1:  8b ec                           mov      ebp, esp
  1001DAD3:  e8 c8 b5 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  1001DAD8:  85 c0                           test     eax, eax
  1001DADA:  74 36                           je       0x1001db12
  1001DADC:  05 0c 06 00 00                  add      eax, 0x60c
  1001DAE1:  83 38 00                        cmp      dword ptr [eax], 0
  1001DAE4:  74 2c                           je       0x1001db12
  1001DAE6:  85 c0                           test     eax, eax
  1001DAE8:  74 28                           je       0x1001db12
  1001DAEA:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001DAED:  56                              push     esi
  1001DAEE:  8b f1                           mov      esi, ecx
  1001DAF0:  c1 ee 05                        shr      esi, 5
  1001DAF3:  3b 70 08                        cmp      esi, dword ptr [eax + 8]
  1001DAF6:  72 05                           jb       0x1001dafd
  1001DAF8:  32 c0                           xor      al, al
  1001DAFA:  5e                              pop      esi
  1001DAFB:  5d                              pop      ebp
  1001DAFC:  c3                              ret      
  1001DAFD:  8b 00                           mov      eax, dword ptr [eax]
  1001DAFF:  83 e1 1f                        and      ecx, 0x1f
  1001DB02:  ba 01 00 00 00                  mov      edx, 1
  1001DB07:  d3 e2                           shl      edx, cl
  1001DB09:  85 14 b0                        test     dword ptr [eax + esi*4], edx
  1001DB0C:  5e                              pop      esi
  1001DB0D:  0f 95 c0                        setne    al
  1001DB10:  5d                              pop      ebp
  1001DB11:  c3                              ret      
  1001DB12:  32 c0                           xor      al, al
  1001DB14:  5d                              pop      ebp
  1001DB15:  c3                              ret      


; === GetIsObserving ===
; RVA: 0x0001DB20  Size: 28 bytes
; Exports: GetIsObserving
;
  1001DB20:  e8 8b b4 ff ff                  call     0x10018fb0  ; GW::GetCharContext
  1001DB25:  85 c0                           test     eax, eax
  1001DB27:  74 10                           je       0x1001db39
  1001DB29:  8b 88 2c 02 00 00               mov      ecx, dword ptr [eax + 0x22c]
  1001DB2F:  3b 88 28 02 00 00               cmp      ecx, dword ptr [eax + 0x228]
  1001DB35:  0f 95 c0                        setne    al
  1001DB38:  c3                              ret      
  1001DB39:  32 c0                           xor      al, al
  1001DB3B:  c3                              ret      


; === GetWorldMapContext ===
; RVA: 0x0001DB40  Size: 25 bytes
; Exports: GetWorldMapContext
;
  1001DB40:  e9 2b fb ff ff                  jmp      0x1001d670
  1001DB45:  cc                              int3     
  1001DB46:  cc                              int3     
  1001DB47:  cc                              int3     
  1001DB48:  cc                              int3     
  1001DB49:  cc                              int3     
  1001DB4A:  cc                              int3     
  1001DB4B:  cc                              int3     
  1001DB4C:  cc                              int3     
  1001DB4D:  cc                              int3     
  1001DB4E:  cc                              int3     
  1001DB4F:  cc                              int3     
  1001DB50:  55                              push     ebp
  1001DB51:  8b ec                           mov      ebp, esp
  1001DB53:  5d                              pop      ebp
  1001DB54:  e9 c7 fb ff ff                  jmp      0x1001d720


; === LanguageFromDistrict ===
; RVA: 0x0001DB50  Size: 9 bytes
; Exports: LanguageFromDistrict
;
  1001DB50:  55                              push     ebp
  1001DB51:  8b ec                           mov      ebp, esp
  1001DB53:  5d                              pop      ebp
  1001DB54:  e9 c7 fb ff ff                  jmp      0x1001d720


; === QueryAltitude ===
; RVA: 0x0001DB60  Size: 265 bytes
; Exports: QueryAltitude
;
  1001DB60:  55                              push     ebp
  1001DB61:  8b ec                           mov      ebp, esp
  1001DB63:  83 ec 0c                        sub      esp, 0xc
  1001DB66:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001DB69:  57                              push     edi
  1001DB6A:  8b 7d 14                        mov      edi, dword ptr [ebp + 0x14]
  1001DB6D:  f3 0f 10 10                     movss    xmm2, dword ptr [eax]
  1001DB71:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  1001DB74:  f3 0f 11 55 f4                  movss    dword ptr [ebp - 0xc], xmm2
  1001DB79:  f3 0f 10 08                     movss    xmm1, dword ptr [eax]
  1001DB7D:  33 c0                           xor      eax, eax
  1001DB7F:  f3 0f 11 4d f8                  movss    dword ptr [ebp - 8], xmm1
  1001DB84:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1001DB87:  85 ff                           test     edi, edi
  1001DB89:  75 14                           jne      0x1001db9f
  1001DB8B:  e8 a0 b4 ff ff                  call     0x10019030  ; GW::GetMapContext
  1001DB90:  f3 0f 10 4d f8                  movss    xmm1, dword ptr [ebp - 8]
  1001DB95:  8b f8                           mov      edi, eax
  1001DB97:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  1001DB9A:  f3 0f 10 55 f4                  movss    xmm2, dword ptr [ebp - 0xc]
  1001DB9F:  83 3d 38 c3 08 10 00            cmp      dword ptr [0x1008c338], 0
  1001DBA6:  0f 57 c0                        xorps    xmm0, xmm0
  1001DBA9:  0f 84 ab 00 00 00               je       0x1001dc5a
  1001DBAF:  85 ff                           test     edi, edi
  1001DBB1:  0f 84 a3 00 00 00               je       0x1001dc5a
  1001DBB7:  f3 0f 10 5d 10                  movss    xmm3, dword ptr [ebp + 0x10]
  1001DBBC:  0f 2f d8                        comiss   xmm3, xmm0
  1001DBBF:  0f 86 95 00 00 00               jbe      0x1001dc5a
  1001DBC5:  8b 4f 74                        mov      ecx, dword ptr [edi + 0x74]
  1001DBC8:  85 c9                           test     ecx, ecx
  1001DBCA:  0f 84 8a 00 00 00               je       0x1001dc5a
  1001DBD0:  8b 09                           mov      ecx, dword ptr [ecx]
  1001DBD2:  85 c9                           test     ecx, ecx
  1001DBD4:  0f 84 80 00 00 00               je       0x1001dc5a
  1001DBDA:  39 41 20                        cmp      dword ptr [ecx + 0x20], eax
  1001DBDD:  76 7b                           jbe      0x1001dc5a
  1001DBDF:  0f 2f 57 04                     comiss   xmm2, dword ptr [edi + 4]
  1001DBE3:  72 75                           jb       0x1001dc5a
  1001DBE5:  0f 2f 4f 08                     comiss   xmm1, dword ptr [edi + 8]
  1001DBE9:  72 6f                           jb       0x1001dc5a
  1001DBEB:  f3 0f 10 47 0c                  movss    xmm0, dword ptr [edi + 0xc]
  1001DBF0:  0f 2f c2                        comiss   xmm0, xmm2
  1001DBF3:  72 65                           jb       0x1001dc5a
  1001DBF5:  f3 0f 10 47 10                  movss    xmm0, dword ptr [edi + 0x10]
  1001DBFA:  0f 2f c1                        comiss   xmm0, xmm1
  1001DBFD:  72 5b                           jb       0x1001dc5a
  1001DBFF:  53                              push     ebx
  1001DC00:  e8 cb b3 ff ff                  call     0x10018fd0  ; GW::GetGameContext
  1001DC05:  8b d8                           mov      ebx, eax
  1001DC07:  85 db                           test     ebx, ebx
  1001DC09:  75 0c                           jne      0x1001dc17
  1001DC0B:  5b                              pop      ebx
  1001DC0C:  89 45 08                        mov      dword ptr [ebp + 8], eax
  1001DC0F:  d9 45 08                        fld      dword ptr [ebp + 8]
  1001DC12:  5f                              pop      edi
  1001DC13:  8b e5                           mov      esp, ebp
  1001DC15:  5d                              pop      ebp
  1001DC16:  c3                              ret      
  1001DC17:  f3 0f 10 45 10                  movss    xmm0, dword ptr [ebp + 0x10]
  1001DC1C:  8d 45 08                        lea      eax, [ebp + 8]
  1001DC1F:  56                              push     esi
  1001DC20:  8b 73 14                        mov      esi, dword ptr [ebx + 0x14]
  1001DC23:  6a 00                           push     0
  1001DC25:  50                              push     eax
  1001DC26:  51                              push     ecx
  1001DC27:  8d 45 f4                        lea      eax, [ebp - 0xc]
  1001DC2A:  f3 0f 11 04 24                  movss    dword ptr [esp], xmm0
  1001DC2F:  c7 45 08 00 00 00 00            mov      dword ptr [ebp + 8], 0
  1001DC36:  50                              push     eax
  1001DC37:  89 7b 14                        mov      dword ptr [ebx + 0x14], edi
  1001DC3A:  ff 15 38 c3 08 10               call     dword ptr [0x1008c338]
  1001DC40:  83 c4 10                        add      esp, 0x10
  1001DC43:  89 73 14                        mov      dword ptr [ebx + 0x14], esi
  1001DC46:  f3 0f 10 45 08                  movss    xmm0, dword ptr [ebp + 8]
  1001DC4B:  f3 0f 11 45 08                  movss    dword ptr [ebp + 8], xmm0
  1001DC50:  d9 45 08                        fld      dword ptr [ebp + 8]
  1001DC53:  5e                              pop      esi
  1001DC54:  5b                              pop      ebx
  1001DC55:  5f                              pop      edi
  1001DC56:  8b e5                           mov      esp, ebp
  1001DC58:  5d                              pop      ebp
  1001DC59:  c3                              ret      
  1001DC5A:  c7 45 08 00 00 00 00            mov      dword ptr [ebp + 8], 0
  1001DC61:  d9 45 08                        fld      dword ptr [ebp + 8]
  1001DC64:  5f                              pop      edi
  1001DC65:  8b e5                           mov      esp, ebp
  1001DC67:  5d                              pop      ebp
  1001DC68:  c3                              ret      


; === RegionFromDistrict ===
; RVA: 0x0001DC70  Size: 9 bytes
; Exports: RegionFromDistrict
;
  1001DC70:  55                              push     ebp
  1001DC71:  8b ec                           mov      ebp, esp
  1001DC73:  5d                              pop      ebp
  1001DC74:  e9 67 fc ff ff                  jmp      0x1001d8e0


; === GetActiveTitleId ===
; RVA: 0x000209C0  Size: 25 bytes
; Exports: GetActiveTitleId
;
  100209C0:  e9 2b fc ff ff                  jmp      0x100205f0
  100209C5:  cc                              int3     
  100209C6:  cc                              int3     
  100209C7:  cc                              int3     
  100209C8:  cc                              int3     
  100209C9:  cc                              int3     
  100209CA:  cc                              int3     
  100209CB:  cc                              int3     
  100209CC:  cc                              int3     
  100209CD:  cc                              int3     
  100209CE:  cc                              int3     
  100209CF:  cc                              int3     
  100209D0:  55                              push     ebp
  100209D1:  8b ec                           mov      ebp, esp
  100209D3:  5d                              pop      ebp
  100209D4:  e9 87 ff ff ff                  jmp      0x10020960


; === SetPlayerName ===
; RVA: 0x000209D0  Size: 9 bytes
; Exports: SetPlayerName
;
  100209D0:  55                              push     ebp
  100209D1:  8b ec                           mov      ebp, esp
  100209D3:  5d                              pop      ebp
  100209D4:  e9 87 ff ff ff                  jmp      0x10020960


; === GetActiveQuest ===
; RVA: 0x00021000  Size: 25 bytes
; Exports: GetActiveQuest
;
  10021000:  e9 8b fc ff ff                  jmp      0x10020c90
  10021005:  cc                              int3     
  10021006:  cc                              int3     
  10021007:  cc                              int3     
  10021008:  cc                              int3     
  10021009:  cc                              int3     
  1002100A:  cc                              int3     
  1002100B:  cc                              int3     
  1002100C:  cc                              int3     
  1002100D:  cc                              int3     
  1002100E:  cc                              int3     
  1002100F:  cc                              int3     
  10021010:  55                              push     ebp
  10021011:  8b ec                           mov      ebp, esp
  10021013:  5d                              pop      ebp
  10021014:  e9 37 fd ff ff                  jmp      0x10020d50


; === GetQuestEntryGroupName ===
; RVA: 0x00021010  Size: 9 bytes
; Exports: GetQuestEntryGroupName
;
  10021010:  55                              push     ebp
  10021011:  8b ec                           mov      ebp, esp
  10021013:  5d                              pop      ebp
  10021014:  e9 37 fd ff ff                  jmp      0x10020d50


; === GetQuestLog ===
; RVA: 0x00021020  Size: 56 bytes
; Exports: GetQuestLog
;
  10021020:  55                              push     ebp
  10021021:  8b ec                           mov      ebp, esp
  10021023:  e8 78 80 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  10021028:  85 c0                           test     eax, eax
  1002102A:  74 0a                           je       0x10021036
  1002102C:  05 2c 05 00 00                  add      eax, 0x52c
  10021031:  83 38 00                        cmp      dword ptr [eax], 0
  10021034:  75 02                           jne      0x10021038
  10021036:  33 c0                           xor      eax, eax
  10021038:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1002103B:  85 c9                           test     ecx, ecx
  1002103D:  74 0d                           je       0x1002104c
  1002103F:  85 c0                           test     eax, eax
  10021041:  74 05                           je       0x10021048
  10021043:  8b 50 08                        mov      edx, dword ptr [eax + 8]
  10021046:  eb 02                           jmp      0x1002104a
  10021048:  33 d2                           xor      edx, edx
  1002104A:  89 11                           mov      dword ptr [ecx], edx
  1002104C:  85 c0                           test     eax, eax
  1002104E:  74 04                           je       0x10021054
  10021050:  8b 00                           mov      eax, dword ptr [eax]
  10021052:  5d                              pop      ebp
  10021053:  c3                              ret      
  10021054:  33 c0                           xor      eax, eax
  10021056:  5d                              pop      ebp
  10021057:  c3                              ret      


; === SkillbarSkill::GetRecharge ===
; RVA: 0x00022550  Size: 24 bytes
; Exports: ?GetRecharge@SkillbarSkill@GW@@QBEIXZ
;
  10022550:  83 79 08 00                     cmp      dword ptr [ecx + 8], 0
  10022554:  75 03                           jne      0x10022559
  10022556:  33 c0                           xor      eax, eax
  10022558:  c3                              ret      
  10022559:  56                              push     esi
  1002255A:  8b 71 08                        mov      esi, dword ptr [ecx + 8]
  1002255D:  e8 be bb ff ff                  call     0x1001e120  ; MemoryMgr::GetSkillTimer
  10022562:  2b f0                           sub      esi, eax
  10022564:  8b c6                           mov      eax, esi
  10022566:  5e                              pop      esi
  10022567:  c3                              ret      


; === Skillbar::GetSkillById ===
; RVA: 0x00022570  Size: 44 bytes
; Exports: ?GetSkillById@Skillbar@GW@@QAEPAUSkillbarSkill@2@W4SkillID@Constants@2@PAI@Z
;
  10022570:  55                              push     ebp
  10022571:  8b ec                           mov      ebp, esp
  10022573:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  10022576:  33 c0                           xor      eax, eax
  10022578:  39 51 10                        cmp      dword ptr [ecx + 0x10], edx
  1002257B:  74 0f                           je       0x1002258c
  1002257D:  40                              inc      eax
  1002257E:  83 c1 14                        add      ecx, 0x14
  10022581:  83 f8 08                        cmp      eax, 8
  10022584:  72 f2                           jb       0x10022578
  10022586:  33 c0                           xor      eax, eax
  10022588:  5d                              pop      ebp
  10022589:  c2 08 00                        ret      8
  1002258C:  8b 55 0c                        mov      edx, dword ptr [ebp + 0xc]
  1002258F:  85 d2                           test     edx, edx
  10022591:  74 02                           je       0x10022595
  10022593:  89 02                           mov      dword ptr [edx], eax
  10022595:  8d 41 04                        lea      eax, [ecx + 4]
  10022598:  5d                              pop      ebp
  10022599:  c2 08 00                        ret      8


; === Effect::GetTimeElapsed ===
; RVA: 0x000225A0  Size: 13 bytes
; Exports: ?GetTimeElapsed@Effect@GW@@QBEKXZ
;
  100225A0:  56                              push     esi
  100225A1:  8b 71 14                        mov      esi, dword ptr [ecx + 0x14]
  100225A4:  e8 77 bb ff ff                  call     0x1001e120  ; MemoryMgr::GetSkillTimer
  100225A9:  2b c6                           sub      eax, esi
  100225AB:  5e                              pop      esi
  100225AC:  c3                              ret      


; === Effect::GetTimeRemaining ===
; RVA: 0x000225B0  Size: 41 bytes
; Exports: ?GetTimeRemaining@Effect@GW@@QBEKXZ
;
  100225B0:  53                              push     ebx
  100225B1:  56                              push     esi
  100225B2:  57                              push     edi
  100225B3:  8b f9                           mov      edi, ecx
  100225B5:  8b 77 14                        mov      esi, dword ptr [edi + 0x14]
  100225B8:  e8 63 bb ff ff                  call     0x1001e120  ; MemoryMgr::GetSkillTimer
  100225BD:  f3 0f 10 47 10                  movss    xmm0, dword ptr [edi + 0x10]
  100225C2:  8b d8                           mov      ebx, eax
  100225C4:  f3 0f 59 05 a0 39 05 10         mulss    xmm0, dword ptr [0x100539a0]
  100225CC:  2b de                           sub      ebx, esi
  100225CE:  e8 0d a0 00 00                  call     0x1002c5e0
  100225D3:  5f                              pop      edi
  100225D4:  5e                              pop      esi
  100225D5:  2b c3                           sub      eax, ebx
  100225D7:  5b                              pop      ebx
  100225D8:  c3                              ret      


; === GetHeroSkillbar ===
; RVA: 0x00023F00  Size: 9 bytes
; Exports: GetHeroSkillbar
;
  10023F00:  55                              push     ebp
  10023F01:  8b ec                           mov      ebp, esp
  10023F03:  5d                              pop      ebp
  10023F04:  e9 07 f4 ff ff                  jmp      0x10023310


; === GetIsSkillLearnt ===
; RVA: 0x00023F10  Size: 9 bytes
; Exports: GetIsSkillLearnt
;
  10023F10:  55                              push     ebp
  10023F11:  8b ec                           mov      ebp, esp
  10023F13:  5d                              pop      ebp
  10023F14:  e9 87 f4 ff ff                  jmp      0x100233a0


; === GetIsSkillUnlocked ===
; RVA: 0x00023F20  Size: 9 bytes
; Exports: GetIsSkillUnlocked
;
  10023F20:  55                              push     ebp
  10023F21:  8b ec                           mov      ebp, esp
  10023F23:  5d                              pop      ebp
  10023F24:  e9 d7 f4 ff ff                  jmp      0x10023400


; === GetPlayerSkillbar ===
; RVA: 0x00023F30  Size: 25 bytes
; Exports: GetPlayerSkillbar
;
  10023F30:  e9 2b f5 ff ff                  jmp      0x10023460
  10023F35:  cc                              int3     
  10023F36:  cc                              int3     
  10023F37:  cc                              int3     
  10023F38:  cc                              int3     
  10023F39:  cc                              int3     
  10023F3A:  cc                              int3     
  10023F3B:  cc                              int3     
  10023F3C:  cc                              int3     
  10023F3D:  cc                              int3     
  10023F3E:  cc                              int3     
  10023F3F:  cc                              int3     
  10023F40:  55                              push     ebp
  10023F41:  8b ec                           mov      ebp, esp
  10023F43:  5d                              pop      ebp
  10023F44:  e9 57 fb ff ff                  jmp      0x10023aa0


; === LoadSkillTemplateForAgent ===
; RVA: 0x00023F40  Size: 9 bytes
; Exports: LoadSkillTemplateForAgent
;
  10023F40:  55                              push     ebp
  10023F41:  8b ec                           mov      ebp, esp
  10023F43:  5d                              pop      ebp
  10023F44:  e9 57 fb ff ff                  jmp      0x10023aa0


; === UseSkill ===
; RVA: 0x00023F50  Size: 9 bytes
; Exports: UseSkill
;
  10023F50:  55                              push     ebp
  10023F51:  8b ec                           mov      ebp, esp
  10023F53:  5d                              pop      ebp
  10023F54:  e9 37 fc ff ff                  jmp      0x10023b90


; === IsItemOffered ===
; RVA: 0x00025060  Size: 9 bytes
; Exports: IsItemOffered
;
  10025060:  55                              push     ebp
  10025061:  8b ec                           mov      ebp, esp
  10025063:  5d                              pop      ebp
  10025064:  e9 37 fe ff ff                  jmp      0x10024ea0


; === OfferItem ===
; RVA: 0x00025070  Size: 9 bytes
; Exports: OfferItem
;
  10025070:  55                              push     ebp
  10025071:  8b ec                           mov      ebp, esp
  10025073:  5d                              pop      ebp
  10025074:  e9 b7 fe ff ff                  jmp      0x10024f30


; === RemoveOfferedItem ===
; RVA: 0x00025080  Size: 9 bytes
; Exports: RemoveOfferedItem
;
  10025080:  55                              push     ebp
  10025081:  8b ec                           mov      ebp, esp
  10025083:  5d                              pop      ebp
  10025084:  e9 57 ff ff ff                  jmp      0x10024fe0


; === EncStrToUInt32 ===
; RVA: 0x00029D50  Size: 9 bytes
; Exports: EncStrToUInt32
;
  10029D50:  55                              push     ebp
  10029D51:  8b ec                           mov      ebp, esp
  10029D53:  5d                              pop      ebp
  10029D54:  e9 a7 c3 ff ff                  jmp      0x10026100


; === GetFrameById ===
; RVA: 0x00029D60  Size: 9 bytes
; Exports: GetFrameById
;
  10029D60:  55                              push     ebp
  10029D61:  8b ec                           mov      ebp, esp
  10029D63:  5d                              pop      ebp
  10029D64:  e9 a7 c9 ff ff                  jmp      0x10026710


; === GetFrameByLabel ===
; RVA: 0x00029D70  Size: 86 bytes
; Exports: GetFrameByLabel
;
  10029D70:  55                              push     ebp
  10029D71:  8b ec                           mov      ebp, esp
  10029D73:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10029D76:  85 c0                           test     eax, eax
  10029D78:  74 48                           je       0x10029dc2
  10029D7A:  83 3d 64 c5 08 10 00            cmp      dword ptr [0x1008c564], 0
  10029D81:  74 3f                           je       0x10029dc2
  10029D83:  56                              push     esi
  10029D84:  6a ff                           push     -1
  10029D86:  50                              push     eax
  10029D87:  e8 c4 0b ff ff                  call     0x1001a950  ; GW::HashWString
  10029D8C:  8b 15 64 c5 08 10               mov      edx, dword ptr [0x1008c564]
  10029D92:  83 c4 08                        add      esp, 8
  10029D95:  8b f0                           mov      esi, eax
  10029D97:  8b 0a                           mov      ecx, dword ptr [edx]
  10029D99:  8b 52 08                        mov      edx, dword ptr [edx + 8]
  10029D9C:  8d 14 91                        lea      edx, [ecx + edx*4]
  10029D9F:  3b ca                           cmp      ecx, edx
  10029DA1:  74 1a                           je       0x10029dbd
  10029DA3:  8b 01                           mov      eax, dword ptr [ecx]
  10029DA5:  85 c0                           test     eax, eax
  10029DA7:  74 0d                           je       0x10029db6
  10029DA9:  83 f8 ff                        cmp      eax, -1
  10029DAC:  74 08                           je       0x10029db6
  10029DAE:  39 b0 34 01 00 00               cmp      dword ptr [eax + 0x134], esi
  10029DB4:  74 09                           je       0x10029dbf
  10029DB6:  83 c1 04                        add      ecx, 4
  10029DB9:  3b ca                           cmp      ecx, edx
  10029DBB:  75 e6                           jne      0x10029da3
  10029DBD:  33 c0                           xor      eax, eax
  10029DBF:  5e                              pop      esi
  10029DC0:  5d                              pop      ebp
  10029DC1:  c3                              ret      
  10029DC2:  33 c0                           xor      eax, eax
  10029DC4:  5d                              pop      ebp
  10029DC5:  c3                              ret      


; === GetFrameContext ===
; RVA: 0x00029DD0  Size: 9 bytes
; Exports: GetFrameContext
;
  10029DD0:  55                              push     ebp
  10029DD1:  8b ec                           mov      ebp, esp
  10029DD3:  5d                              pop      ebp
  10029DD4:  e9 07 ca ff ff                  jmp      0x100267e0


; === IsInControllerCursorMode ===
; RVA: 0x00029DE0  Size: 87 bytes
; Exports: IsInControllerCursorMode
;
  10029DE0:  e9 ab ce ff ff                  jmp      0x10026c90
  10029DE5:  cc                              int3     
  10029DE6:  cc                              int3     
  10029DE7:  cc                              int3     
  10029DE8:  cc                              int3     
  10029DE9:  cc                              int3     
  10029DEA:  cc                              int3     
  10029DEB:  cc                              int3     
  10029DEC:  cc                              int3     
  10029DED:  cc                              int3     
  10029DEE:  cc                              int3     
  10029DEF:  cc                              int3     
  10029DF0:  55                              push     ebp
  10029DF1:  8b ec                           mov      ebp, esp
  10029DF3:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  10029DF6:  85 d2                           test     edx, edx
  10029DF8:  75 04                           jne      0x10029dfe
  10029DFA:  32 c0                           xor      al, al
  10029DFC:  5d                              pop      ebp
  10029DFD:  c3                              ret      
  10029DFE:  8b c2                           mov      eax, edx
  10029E00:  56                              push     esi
  10029E01:  8d 70 02                        lea      esi, [eax + 2]
  10029E04:  66 8b 08                        mov      cx, word ptr [eax]
  10029E07:  83 c0 02                        add      eax, 2
  10029E0A:  66 85 c9                        test     cx, cx
  10029E0D:  75 f5                           jne      0x10029e04
  10029E0F:  2b c6                           sub      eax, esi
  10029E11:  89 55 08                        mov      dword ptr [ebp + 8], edx
  10029E14:  d1 f8                           sar      eax, 1
  10029E16:  40                              inc      eax
  10029E17:  8d 34 42                        lea      esi, [edx + eax*2]
  10029E1A:  8d 45 08                        lea      eax, [ebp + 8]
  10029E1D:  56                              push     esi
  10029E1E:  50                              push     eax
  10029E1F:  e8 3c c3 ff ff                  call     0x10026160
  10029E24:  83 c4 08                        add      esp, 8
  10029E27:  84 c0                           test     al, al
  10029E29:  75 03                           jne      0x10029e2e
  10029E2B:  5e                              pop      esi
  10029E2C:  5d                              pop      ebp
  10029E2D:  c3                              ret      
  10029E2E:  39 75 08                        cmp      dword ptr [ebp + 8], esi
  10029E31:  5e                              pop      esi
  10029E32:  0f 94 c0                        sete     al
  10029E35:  5d                              pop      ebp
  10029E36:  c3                              ret      


; === IsValidEncStr ===
; RVA: 0x00029DF0  Size: 71 bytes
; Exports: IsValidEncStr
;
  10029DF0:  55                              push     ebp
  10029DF1:  8b ec                           mov      ebp, esp
  10029DF3:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  10029DF6:  85 d2                           test     edx, edx
  10029DF8:  75 04                           jne      0x10029dfe
  10029DFA:  32 c0                           xor      al, al
  10029DFC:  5d                              pop      ebp
  10029DFD:  c3                              ret      
  10029DFE:  8b c2                           mov      eax, edx
  10029E00:  56                              push     esi
  10029E01:  8d 70 02                        lea      esi, [eax + 2]
  10029E04:  66 8b 08                        mov      cx, word ptr [eax]
  10029E07:  83 c0 02                        add      eax, 2
  10029E0A:  66 85 c9                        test     cx, cx
  10029E0D:  75 f5                           jne      0x10029e04
  10029E0F:  2b c6                           sub      eax, esi
  10029E11:  89 55 08                        mov      dword ptr [ebp + 8], edx
  10029E14:  d1 f8                           sar      eax, 1
  10029E16:  40                              inc      eax
  10029E17:  8d 34 42                        lea      esi, [edx + eax*2]
  10029E1A:  8d 45 08                        lea      eax, [ebp + 8]
  10029E1D:  56                              push     esi
  10029E1E:  50                              push     eax
  10029E1F:  e8 3c c3 ff ff                  call     0x10026160
  10029E24:  83 c4 08                        add      esp, 8
  10029E27:  84 c0                           test     al, al
  10029E29:  75 03                           jne      0x10029e2e
  10029E2B:  5e                              pop      esi
  10029E2C:  5d                              pop      ebp
  10029E2D:  c3                              ret      
  10029E2E:  39 75 08                        cmp      dword ptr [ebp + 8], esi
  10029E31:  5e                              pop      esi
  10029E32:  0f 94 c0                        sete     al
  10029E35:  5d                              pop      ebp
  10029E36:  c3                              ret      


; === SendUIMessage ===
; RVA: 0x00029E40  Size: 9 bytes
; Exports: SendUIMessage
;
  10029E40:  55                              push     ebp
  10029E41:  8b ec                           mov      ebp, esp
  10029E43:  5d                              pop      ebp
  10029E44:  e9 87 e2 ff ff                  jmp      0x100280d0


; === SetPreference_Enum ===
; RVA: 0x00029E50  Size: 9 bytes
; Exports: SetPreference_Enum
;
  10029E50:  55                              push     ebp
  10029E51:  8b ec                           mov      ebp, esp
  10029E53:  5d                              pop      ebp
  10029E54:  e9 57 e6 ff ff                  jmp      0x100284b0


; === SetPreference_Flag ===
; RVA: 0x00029E60  Size: 9 bytes
; Exports: SetPreference_Flag
;
  10029E60:  55                              push     ebp
  10029E61:  8b ec                           mov      ebp, esp
  10029E63:  5d                              pop      ebp
  10029E64:  e9 77 e7 ff ff                  jmp      0x100285e0


; === SetPreference_Number ===
; RVA: 0x00029E70  Size: 9 bytes
; Exports: SetPreference_Number
;
  10029E70:  55                              push     ebp
  10029E71:  8b ec                           mov      ebp, esp
  10029E73:  5d                              pop      ebp
  10029E74:  e9 27 e9 ff ff                  jmp      0x100287a0


; === SetPreference_String ===
; RVA: 0x00029E80  Size: 9 bytes
; Exports: SetPreference_String
;
  10029E80:  55                              push     ebp
  10029E81:  8b ec                           mov      ebp, esp
  10029E83:  5d                              pop      ebp
  10029E84:  e9 17 ed ff ff                  jmp      0x10028ba0


; === SetWindowVisible ===
; RVA: 0x00029E90  Size: 9 bytes
; Exports: SetWindowVisible
;
  10029E90:  55                              push     ebp
  10029E91:  8b ec                           mov      ebp, esp
  10029E93:  5d                              pop      ebp
  10029E94:  e9 a7 ed ff ff                  jmp      0x10028c40


; === UInt32ToEncStr ===
; RVA: 0x00029EA0  Size: 9 bytes
; Exports: UInt32ToEncStr
;
  10029EA0:  55                              push     ebp
  10029EA1:  8b ec                           mov      ebp, esp
  10029EA3:  5d                              pop      ebp
  10029EA4:  e9 47 ee ff ff                  jmp      0x10028cf0


