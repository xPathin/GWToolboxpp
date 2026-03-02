; Module: Frame
; Functions: 72
; Total code size: 5712 bytes
;

; === ScrollableFrame::AddItem ===
; RVA: 0x000165A0  Size: 59 bytes
; Exports: ?AddItem@ScrollableFrame@GW@@QAE_NIIP6AXPAUInteractionMessage@UI@2@PAX1@Z@Z
;
  100165A0:  55                              push     ebp
  100165A1:  8b ec                           mov      ebp, esp
  100165A3:  83 ec 14                        sub      esp, 0x14
  100165A6:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100165A9:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  100165AC:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  100165AF:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  100165B2:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  100165B5:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  100165B8:  8d 45 fc                        lea      eax, [ebp - 4]
  100165BB:  50                              push     eax
  100165BC:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  100165BF:  8d 45 ec                        lea      eax, [ebp - 0x14]
  100165C2:  50                              push     eax
  100165C3:  6a 57                           push     0x57
  100165C5:  51                              push     ecx
  100165C6:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  100165CD:  e8 4e 19 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  100165D2:  83 c4 10                        add      esp, 0x10
  100165D5:  8b e5                           mov      esp, ebp
  100165D7:  5d                              pop      ebp
  100165D8:  c2 0c 00                        ret      0xc


; === DropdownFrame::AddOption ===
; RVA: 0x000165E0  Size: 68 bytes
; Exports: ?AddOption@DropdownFrame@GW@@QAE_NPB_WI@Z
;
  100165E0:  55                              push     ebp
  100165E1:  8b ec                           mov      ebp, esp
  100165E3:  83 ec 08                        sub      esp, 8
  100165E6:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  100165E9:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  100165EC:  89 55 f8                        mov      dword ptr [ebp - 8], edx
  100165EF:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  100165F2:  85 d2                           test     edx, edx
  100165F4:  74 26                           je       0x1001661c
  100165F6:  6a 00                           push     0
  100165F8:  8d 45 f8                        lea      eax, [ebp - 8]
  100165FB:  50                              push     eax
  100165FC:  8d 41 04                        lea      eax, [ecx + 4]
  100165FF:  f7 d9                           neg      ecx
  10016601:  6a 57                           push     0x57
  10016603:  1b c9                           sbb      ecx, ecx
  10016605:  23 c8                           and      ecx, eax
  10016607:  51                              push     ecx
  10016608:  e8 13 19 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  1001660D:  83 c4 10                        add      esp, 0x10
  10016610:  84 c0                           test     al, al
  10016612:  74 08                           je       0x1001661c
  10016614:  b0 01                           mov      al, 1
  10016616:  8b e5                           mov      esp, ebp
  10016618:  5d                              pop      ebp
  10016619:  c2 08 00                        ret      8
  1001661C:  32 c0                           xor      al, al
  1001661E:  8b e5                           mov      esp, ebp
  10016620:  5d                              pop      ebp
  10016621:  c2 08 00                        ret      8


; === TabsFrame::AddTab ===
; RVA: 0x00016630  Size: 76 bytes
; Exports: ?AddTab@TabsFrame@GW@@QAEPAUFrame@UI@2@PB_WIIP6AXPAUInteractionMessage@42@PAX2@Z2@Z
;
  10016630:  55                              push     ebp
  10016631:  8b ec                           mov      ebp, esp
  10016633:  83 ec 14                        sub      esp, 0x14
  10016636:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10016639:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  1001663C:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  1001663F:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  10016642:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  10016645:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  10016648:  8b 45 14                        mov      eax, dword ptr [ebp + 0x14]
  1001664B:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  1001664E:  8b 45 18                        mov      eax, dword ptr [ebp + 0x18]
  10016651:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10016654:  8d 45 08                        lea      eax, [ebp + 8]
  10016657:  50                              push     eax
  10016658:  8d 45 ec                        lea      eax, [ebp - 0x14]
  1001665B:  c7 45 08 00 00 00 00            mov      dword ptr [ebp + 8], 0
  10016662:  50                              push     eax
  10016663:  6a 56                           push     0x56
  10016665:  51                              push     ecx
  10016666:  e8 b5 18 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  1001666B:  ff 75 08                        push     dword ptr [ebp + 8]
  1001666E:  e8 9d 00 01 00                  call     0x10026710  ; UI::GetFrameById
  10016673:  83 c4 14                        add      esp, 0x14
  10016676:  8b e5                           mov      esp, ebp
  10016678:  5d                              pop      ebp
  10016679:  c2 14 00                        ret      0x14


; === TabsFrame::ChooseTab ===
; RVA: 0x00016680  Size: 66 bytes
; Exports: ?ChooseTab@TabsFrame@GW@@QAE_NI@Z
;
  10016680:  55                              push     ebp
  10016681:  8b ec                           mov      ebp, esp
  10016683:  51                              push     ecx
  10016684:  56                              push     esi
  10016685:  8d 45 fc                        lea      eax, [ebp - 4]
  10016688:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001668F:  50                              push     eax
  10016690:  ff 75 08                        push     dword ptr [ebp + 8]
  10016693:  8b f1                           mov      esi, ecx
  10016695:  6a 5a                           push     0x5a
  10016697:  56                              push     esi
  10016698:  e8 83 18 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  1001669D:  83 c4 10                        add      esp, 0x10
  100166A0:  84 c0                           test     al, al
  100166A2:  75 07                           jne      0x100166ab
  100166A4:  5e                              pop      esi
  100166A5:  8b e5                           mov      esp, ebp
  100166A7:  5d                              pop      ebp
  100166A8:  c2 04 00                        ret      4
  100166AB:  6a 00                           push     0
  100166AD:  ff 75 08                        push     dword ptr [ebp + 8]
  100166B0:  6a 5d                           push     0x5d
  100166B2:  56                              push     esi
  100166B3:  e8 68 18 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  100166B8:  83 c4 10                        add      esp, 0x10
  100166BB:  5e                              pop      esi
  100166BC:  8b e5                           mov      esp, ebp
  100166BE:  5d                              pop      ebp
  100166BF:  c2 04 00                        ret      4


; === TabsFrame::ChooseTab ===
; RVA: 0x000166D0  Size: 81 bytes
; Exports: ?ChooseTab@TabsFrame@GW@@QAE_NPAUFrame@UI@2@@Z
;
  100166D0:  55                              push     ebp
  100166D1:  8b ec                           mov      ebp, esp
  100166D3:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100166D6:  56                              push     esi
  100166D7:  8b f1                           mov      esi, ecx
  100166D9:  57                              push     edi
  100166DA:  85 c0                           test     eax, eax
  100166DC:  74 3b                           je       0x10016719
  100166DE:  8b b8 b8 00 00 00               mov      edi, dword ptr [eax + 0xb8]
  100166E4:  8d 45 08                        lea      eax, [ebp + 8]
  100166E7:  50                              push     eax
  100166E8:  57                              push     edi
  100166E9:  6a 5a                           push     0x5a
  100166EB:  56                              push     esi
  100166EC:  c7 45 08 00 00 00 00            mov      dword ptr [ebp + 8], 0
  100166F3:  e8 28 18 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  100166F8:  83 c4 10                        add      esp, 0x10
  100166FB:  84 c0                           test     al, al
  100166FD:  74 1a                           je       0x10016719
  100166FF:  6a 00                           push     0
  10016701:  57                              push     edi
  10016702:  6a 5d                           push     0x5d
  10016704:  56                              push     esi
  10016705:  e8 16 18 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  1001670A:  83 c4 10                        add      esp, 0x10
  1001670D:  84 c0                           test     al, al
  1001670F:  74 08                           je       0x10016719
  10016711:  5f                              pop      edi
  10016712:  b0 01                           mov      al, 1
  10016714:  5e                              pop      esi
  10016715:  5d                              pop      ebp
  10016716:  c2 04 00                        ret      4
  10016719:  5f                              pop      edi
  1001671A:  32 c0                           xor      al, al
  1001671C:  5e                              pop      esi
  1001671D:  5d                              pop      ebp
  1001671E:  c2 04 00                        ret      4


; === ScrollableFrame::ClearItems ===
; RVA: 0x00016730  Size: 51 bytes
; Exports: ?ClearItems@ScrollableFrame@GW@@QAE_NXZ
;
  10016730:  6a 00                           push     0
  10016732:  6a 00                           push     0
  10016734:  6a 56                           push     0x56
  10016736:  51                              push     ecx
  10016737:  e8 e4 17 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  1001673C:  83 c4 10                        add      esp, 0x10
  1001673F:  c3                              ret      
  10016740:  56                              push     esi
  10016741:  6a 06                           push     6
  10016743:  8b f1                           mov      esi, ecx
  10016745:  e8 66 0d 00 00                  call     0x100174b0  ; ButtonFrame::MouseAction
  1001674A:  84 c0                           test     al, al
  1001674C:  74 11                           je       0x1001675f
  1001674E:  6a 07                           push     7
  10016750:  8b ce                           mov      ecx, esi
  10016752:  e8 59 0d 00 00                  call     0x100174b0  ; ButtonFrame::MouseAction
  10016757:  84 c0                           test     al, al
  10016759:  74 04                           je       0x1001675f
  1001675B:  b0 01                           mov      al, 1
  1001675D:  5e                              pop      esi
  1001675E:  c3                              ret      
  1001675F:  32 c0                           xor      al, al
  10016761:  5e                              pop      esi
  10016762:  c3                              ret      


; === ButtonFrame::Click ===
; RVA: 0x00016740  Size: 35 bytes
; Exports: ?Click@ButtonFrame@GW@@QAE_NXZ
;
  10016740:  56                              push     esi
  10016741:  6a 06                           push     6
  10016743:  8b f1                           mov      esi, ecx
  10016745:  e8 66 0d 00 00                  call     0x100174b0  ; ButtonFrame::MouseAction
  1001674A:  84 c0                           test     al, al
  1001674C:  74 11                           je       0x1001675f
  1001674E:  6a 07                           push     7
  10016750:  8b ce                           mov      ecx, esi
  10016752:  e8 59 0d 00 00                  call     0x100174b0  ; ButtonFrame::MouseAction
  10016757:  84 c0                           test     al, al
  10016759:  74 04                           je       0x1001675f
  1001675B:  b0 01                           mov      al, 1
  1001675D:  5e                              pop      esi
  1001675E:  c3                              ret      
  1001675F:  32 c0                           xor      al, al
  10016761:  5e                              pop      esi
  10016762:  c3                              ret      


; === ButtonFrame::Create ===
; RVA: 0x00016770  Size: 126 bytes
; Exports: ?Create@ButtonFrame@GW@@SAPAU12@IIIPB_W0@Z
;
  10016770:  55                              push     ebp
  10016771:  8b ec                           mov      ebp, esp
  10016773:  53                              push     ebx
  10016774:  56                              push     esi
  10016775:  e8 26 fd ff ff                  call     0x100164a0
  1001677A:  8b 1d d0 c1 08 10               mov      ebx, dword ptr [0x1008c1d0]
  10016780:  8b 75 10                        mov      esi, dword ptr [ebp + 0x10]
  10016783:  85 db                           test     ebx, ebx
  10016785:  75 06                           jne      0x1001678d
  10016787:  5e                              pop      esi
  10016788:  33 c0                           xor      eax, eax
  1001678A:  5b                              pop      ebx
  1001678B:  5d                              pop      ebp
  1001678C:  c3                              ret      
  1001678D:  57                              push     edi
  1001678E:  ff 75 08                        push     dword ptr [ebp + 8]
  10016791:  e8 7a ff 00 00                  call     0x10026710  ; UI::GetFrameById
  10016796:  8b f8                           mov      edi, eax
  10016798:  83 c4 04                        add      esp, 4
  1001679B:  85 ff                           test     edi, edi
  1001679D:  74 48                           je       0x100167e7
  1001679F:  56                              push     esi
  100167A0:  57                              push     edi
  100167A1:  e8 4a fc 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  100167A6:  83 c4 08                        add      esp, 8
  100167A9:  85 c0                           test     eax, eax
  100167AB:  74 12                           je       0x100167bf
  100167AD:  0f 1f 00                        nop      dword ptr [eax]
  100167B0:  46                              inc      esi
  100167B1:  56                              push     esi
  100167B2:  57                              push     edi
  100167B3:  e8 38 fc 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  100167B8:  83 c4 08                        add      esp, 8
  100167BB:  85 c0                           test     eax, eax
  100167BD:  75 f1                           jne      0x100167b0
  100167BF:  ff 75 18                        push     dword ptr [ebp + 0x18]
  100167C2:  ff 75 14                        push     dword ptr [ebp + 0x14]
  100167C5:  53                              push     ebx
  100167C6:  56                              push     esi
  100167C7:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  100167CA:  ff 75 08                        push     dword ptr [ebp + 8]
  100167CD:  e8 7e f8 00 00                  call     0x10026050  ; UI::CreateUIComponent
  100167D2:  83 c4 18                        add      esp, 0x18
  100167D5:  85 c0                           test     eax, eax
  100167D7:  74 0e                           je       0x100167e7
  100167D9:  50                              push     eax
  100167DA:  e8 31 ff 00 00                  call     0x10026710  ; UI::GetFrameById
  100167DF:  83 c4 04                        add      esp, 4
  100167E2:  5f                              pop      edi
  100167E3:  5e                              pop      esi
  100167E4:  5b                              pop      ebx
  100167E5:  5d                              pop      ebp
  100167E6:  c3                              ret      
  100167E7:  5f                              pop      edi
  100167E8:  5e                              pop      esi
  100167E9:  33 c0                           xor      eax, eax
  100167EB:  5b                              pop      ebx
  100167EC:  5d                              pop      ebp
  100167ED:  c3                              ret      


; === CheckboxFrame::Create ===
; RVA: 0x000167F0  Size: 43 bytes
; Exports: ?Create@CheckboxFrame@GW@@SAPAU12@IIIPB_W0@Z
;
  100167F0:  55                              push     ebp
  100167F1:  8b ec                           mov      ebp, esp
  100167F3:  ff 75 18                        push     dword ptr [ebp + 0x18]
  100167F6:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  100167F9:  ff 75 14                        push     dword ptr [ebp + 0x14]
  100167FC:  0d 00 80 00 00                  or       eax, 0x8000
  10016801:  ff 75 10                        push     dword ptr [ebp + 0x10]
  10016804:  50                              push     eax
  10016805:  ff 75 08                        push     dword ptr [ebp + 8]
  10016808:  e8 63 ff ff ff                  call     0x10016770  ; ButtonFrame::Create
  1001680D:  83 c4 14                        add      esp, 0x14
  10016810:  8d 48 fc                        lea      ecx, [eax - 4]
  10016813:  f7 d8                           neg      eax
  10016815:  1b c0                           sbb      eax, eax
  10016817:  23 c1                           and      eax, ecx
  10016819:  5d                              pop      ebp
  1001681A:  c3                              ret      


; === ScrollableFrame::Create ===
; RVA: 0x00016820  Size: 184 bytes
; Exports: ?Create@ScrollableFrame@GW@@SAPAU12@IIIPAUScrollablePageContext@12@PB_W@Z
;
  10016820:  55                              push     ebp
  10016821:  8b ec                           mov      ebp, esp
  10016823:  83 ec 0c                        sub      esp, 0xc
  10016826:  53                              push     ebx
  10016827:  e8 74 fc ff ff                  call     0x100164a0
  1001682C:  a1 dc c1 08 10                  mov      eax, dword ptr [0x1008c1dc]
  10016831:  8d 5d f4                        lea      ebx, [ebp - 0xc]
  10016834:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  10016837:  8b 45 14                        mov      eax, dword ptr [ebp + 0x14]
  1001683A:  85 c0                           test     eax, eax
  1001683C:  c7 45 f4 00 00 00 00            mov      dword ptr [ebp - 0xc], 0
  10016843:  0f 45 d8                        cmovne   ebx, eax
  10016846:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001684D:  83 7b 04 00                     cmp      dword ptr [ebx + 4], 0
  10016851:  75 07                           jne      0x1001685a
  10016853:  33 c0                           xor      eax, eax
  10016855:  5b                              pop      ebx
  10016856:  8b e5                           mov      esp, ebp
  10016858:  5d                              pop      ebp
  10016859:  c3                              ret      
  1001685A:  a1 d8 c1 08 10                  mov      eax, dword ptr [0x1008c1d8]
  1001685F:  89 45 14                        mov      dword ptr [ebp + 0x14], eax
  10016862:  56                              push     esi
  10016863:  8b 75 10                        mov      esi, dword ptr [ebp + 0x10]
  10016866:  85 c0                           test     eax, eax
  10016868:  75 06                           jne      0x10016870
  1001686A:  5e                              pop      esi
  1001686B:  5b                              pop      ebx
  1001686C:  8b e5                           mov      esp, ebp
  1001686E:  5d                              pop      ebp
  1001686F:  c3                              ret      
  10016870:  57                              push     edi
  10016871:  ff 75 08                        push     dword ptr [ebp + 8]
  10016874:  e8 97 fe 00 00                  call     0x10026710  ; UI::GetFrameById
  10016879:  8b f8                           mov      edi, eax
  1001687B:  83 c4 04                        add      esp, 4
  1001687E:  85 ff                           test     edi, edi
  10016880:  74 4d                           je       0x100168cf
  10016882:  56                              push     esi
  10016883:  57                              push     edi
  10016884:  e8 67 fb 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  10016889:  83 c4 08                        add      esp, 8
  1001688C:  85 c0                           test     eax, eax
  1001688E:  74 0f                           je       0x1001689f
  10016890:  46                              inc      esi
  10016891:  56                              push     esi
  10016892:  57                              push     edi
  10016893:  e8 58 fb 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  10016898:  83 c4 08                        add      esp, 8
  1001689B:  85 c0                           test     eax, eax
  1001689D:  75 f1                           jne      0x10016890
  1001689F:  ff 75 18                        push     dword ptr [ebp + 0x18]
  100168A2:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  100168A5:  53                              push     ebx
  100168A6:  ff 75 14                        push     dword ptr [ebp + 0x14]
  100168A9:  0d 00 00 02 00                  or       eax, 0x20000
  100168AE:  56                              push     esi
  100168AF:  50                              push     eax
  100168B0:  ff 75 08                        push     dword ptr [ebp + 8]
  100168B3:  e8 98 f7 00 00                  call     0x10026050  ; UI::CreateUIComponent
  100168B8:  83 c4 18                        add      esp, 0x18
  100168BB:  85 c0                           test     eax, eax
  100168BD:  74 10                           je       0x100168cf
  100168BF:  50                              push     eax
  100168C0:  e8 4b fe 00 00                  call     0x10026710  ; UI::GetFrameById
  100168C5:  83 c4 04                        add      esp, 4
  100168C8:  5f                              pop      edi
  100168C9:  5e                              pop      esi
  100168CA:  5b                              pop      ebx
  100168CB:  8b e5                           mov      esp, ebp
  100168CD:  5d                              pop      ebp
  100168CE:  c3                              ret      
  100168CF:  5f                              pop      edi
  100168D0:  5e                              pop      esi
  100168D1:  33 c0                           xor      eax, eax
  100168D3:  5b                              pop      ebx
  100168D4:  8b e5                           mov      esp, ebp
  100168D6:  5d                              pop      ebp
  100168D7:  c3                              ret      


; === TextLabelFrame::Create ===
; RVA: 0x000168E0  Size: 126 bytes
; Exports: ?Create@TextLabelFrame@GW@@SAPAU12@IIIPB_W0@Z
;
  100168E0:  55                              push     ebp
  100168E1:  8b ec                           mov      ebp, esp
  100168E3:  53                              push     ebx
  100168E4:  56                              push     esi
  100168E5:  e8 b6 fb ff ff                  call     0x100164a0
  100168EA:  8b 1d d4 c1 08 10               mov      ebx, dword ptr [0x1008c1d4]
  100168F0:  8b 75 10                        mov      esi, dword ptr [ebp + 0x10]
  100168F3:  85 db                           test     ebx, ebx
  100168F5:  75 06                           jne      0x100168fd
  100168F7:  5e                              pop      esi
  100168F8:  33 c0                           xor      eax, eax
  100168FA:  5b                              pop      ebx
  100168FB:  5d                              pop      ebp
  100168FC:  c3                              ret      
  100168FD:  57                              push     edi
  100168FE:  ff 75 08                        push     dword ptr [ebp + 8]
  10016901:  e8 0a fe 00 00                  call     0x10026710  ; UI::GetFrameById
  10016906:  8b f8                           mov      edi, eax
  10016908:  83 c4 04                        add      esp, 4
  1001690B:  85 ff                           test     edi, edi
  1001690D:  74 48                           je       0x10016957
  1001690F:  56                              push     esi
  10016910:  57                              push     edi
  10016911:  e8 da fa 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  10016916:  83 c4 08                        add      esp, 8
  10016919:  85 c0                           test     eax, eax
  1001691B:  74 12                           je       0x1001692f
  1001691D:  0f 1f 00                        nop      dword ptr [eax]
  10016920:  46                              inc      esi
  10016921:  56                              push     esi
  10016922:  57                              push     edi
  10016923:  e8 c8 fa 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  10016928:  83 c4 08                        add      esp, 8
  1001692B:  85 c0                           test     eax, eax
  1001692D:  75 f1                           jne      0x10016920
  1001692F:  ff 75 18                        push     dword ptr [ebp + 0x18]
  10016932:  ff 75 14                        push     dword ptr [ebp + 0x14]
  10016935:  53                              push     ebx
  10016936:  56                              push     esi
  10016937:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  1001693A:  ff 75 08                        push     dword ptr [ebp + 8]
  1001693D:  e8 0e f7 00 00                  call     0x10026050  ; UI::CreateUIComponent
  10016942:  83 c4 18                        add      esp, 0x18
  10016945:  85 c0                           test     eax, eax
  10016947:  74 0e                           je       0x10016957
  10016949:  50                              push     eax
  1001694A:  e8 c1 fd 00 00                  call     0x10026710  ; UI::GetFrameById
  1001694F:  83 c4 04                        add      esp, 4
  10016952:  5f                              pop      edi
  10016953:  5e                              pop      esi
  10016954:  5b                              pop      ebx
  10016955:  5d                              pop      ebp
  10016956:  c3                              ret      
  10016957:  5f                              pop      edi
  10016958:  5e                              pop      esi
  10016959:  33 c0                           xor      eax, eax
  1001695B:  5b                              pop      ebx
  1001695C:  5d                              pop      ebp
  1001695D:  c3                              ret      


; === TabsFrame::DisableTab ===
; RVA: 0x00016960  Size: 23 bytes
; Exports: ?DisableTab@TabsFrame@GW@@QAE_NI@Z
;
  10016960:  55                              push     ebp
  10016961:  8b ec                           mov      ebp, esp
  10016963:  6a 00                           push     0
  10016965:  ff 75 08                        push     dword ptr [ebp + 8]
  10016968:  6a 57                           push     0x57
  1001696A:  51                              push     ecx
  1001696B:  e8 b0 15 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10016970:  83 c4 10                        add      esp, 0x10
  10016973:  5d                              pop      ebp
  10016974:  c2 04 00                        ret      4


; === ButtonFrame::DoubleClick ===
; RVA: 0x00016980  Size: 8 bytes
; Exports: ?DoubleClick@ButtonFrame@GW@@QAE_NXZ
;
  10016980:  6a 09                           push     9
  10016982:  e8 29 0b 00 00                  call     0x100174b0  ; ButtonFrame::MouseAction
  10016987:  c3                              ret      


; === TabsFrame::EnableTab, ScrollableFrame::RemoveItem ===
; RVA: 0x00016990  Size: 23 bytes
; Exports: ?EnableTab@TabsFrame@GW@@QAE_NI@Z, ?RemoveItem@ScrollableFrame@GW@@QAE_NI@Z
;
  10016990:  55                              push     ebp
  10016991:  8b ec                           mov      ebp, esp
  10016993:  6a 00                           push     0
  10016995:  ff 75 08                        push     dword ptr [ebp + 8]
  10016998:  6a 58                           push     0x58
  1001699A:  51                              push     ecx
  1001699B:  e8 80 15 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  100169A0:  83 c4 10                        add      esp, 0x10
  100169A3:  5d                              pop      ebp
  100169A4:  c2 04 00                        ret      4


; === DropdownFrame::GetCount ===
; RVA: 0x000169B0  Size: 45 bytes
; Exports: ?GetCount@DropdownFrame@GW@@QAE_NPAI@Z
;
  100169B0:  55                              push     ebp
  100169B1:  8b ec                           mov      ebp, esp
  100169B3:  8d 41 04                        lea      eax, [ecx + 4]
  100169B6:  f7 d9                           neg      ecx
  100169B8:  1b c9                           sbb      ecx, ecx
  100169BA:  23 c8                           and      ecx, eax
  100169BC:  51                              push     ecx
  100169BD:  e8 1e fe 00 00                  call     0x100267e0  ; UI::GetFrameContext
  100169C2:  83 c4 04                        add      esp, 4
  100169C5:  85 c0                           test     eax, eax
  100169C7:  74 0e                           je       0x100169d7
  100169C9:  8b 48 08                        mov      ecx, dword ptr [eax + 8]
  100169CC:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100169CF:  89 08                           mov      dword ptr [eax], ecx
  100169D1:  b0 01                           mov      al, 1
  100169D3:  5d                              pop      ebp
  100169D4:  c2 04 00                        ret      4
  100169D7:  32 c0                           xor      al, al
  100169D9:  5d                              pop      ebp
  100169DA:  c2 04 00                        ret      4


; === ScrollableFrame::GetCount ===
; RVA: 0x000169E0  Size: 26 bytes
; Exports: ?GetCount@ScrollableFrame@GW@@QAE_NPAI@Z
;
  100169E0:  55                              push     ebp
  100169E1:  8b ec                           mov      ebp, esp
  100169E3:  6a 00                           push     0
  100169E5:  6a 00                           push     0
  100169E7:  e8 f4 01 00 00                  call     0x10016be0  ; ScrollableFrame::GetItems
  100169EC:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  100169EF:  85 c9                           test     ecx, ecx
  100169F1:  89 01                           mov      dword ptr [ecx], eax
  100169F3:  0f 95 c0                        setne    al
  100169F6:  5d                              pop      ebp
  100169F7:  c2 04 00                        ret      4


; === TabsFrame::GetCurrentTab ===
; RVA: 0x00016A00  Size: 89 bytes
; Exports: ?GetCurrentTab@TabsFrame@GW@@QAEPAUFrame@UI@2@XZ
;
  10016A00:  55                              push     ebp
  10016A01:  8b ec                           mov      ebp, esp
  10016A03:  83 ec 08                        sub      esp, 8
  10016A06:  56                              push     esi
  10016A07:  8d 45 fc                        lea      eax, [ebp - 4]
  10016A0A:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10016A11:  50                              push     eax
  10016A12:  6a 00                           push     0
  10016A14:  8b f1                           mov      esi, ecx
  10016A16:  6a 59                           push     0x59
  10016A18:  56                              push     esi
  10016A19:  e8 02 15 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10016A1E:  83 c4 10                        add      esp, 0x10
  10016A21:  84 c0                           test     al, al
  10016A23:  74 2d                           je       0x10016a52
  10016A25:  8d 45 f8                        lea      eax, [ebp - 8]
  10016A28:  c7 45 f8 00 00 00 00            mov      dword ptr [ebp - 8], 0
  10016A2F:  50                              push     eax
  10016A30:  ff 75 fc                        push     dword ptr [ebp - 4]
  10016A33:  6a 5a                           push     0x5a
  10016A35:  56                              push     esi
  10016A36:  e8 e5 14 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10016A3B:  83 c4 10                        add      esp, 0x10
  10016A3E:  84 c0                           test     al, al
  10016A40:  74 10                           je       0x10016a52
  10016A42:  ff 75 f8                        push     dword ptr [ebp - 8]
  10016A45:  e8 c6 fc 00 00                  call     0x10026710  ; UI::GetFrameById
  10016A4A:  83 c4 04                        add      esp, 4
  10016A4D:  5e                              pop      esi
  10016A4E:  8b e5                           mov      esp, ebp
  10016A50:  5d                              pop      ebp
  10016A51:  c3                              ret      
  10016A52:  33 c0                           xor      eax, eax
  10016A54:  5e                              pop      esi
  10016A55:  8b e5                           mov      esp, ebp
  10016A57:  5d                              pop      ebp
  10016A58:  c3                              ret      


; === TabsFrame::GetCurrentTabIndex ===
; RVA: 0x00016A60  Size: 23 bytes
; Exports: ?GetCurrentTabIndex@TabsFrame@GW@@QAE_NPAI@Z
;
  10016A60:  55                              push     ebp
  10016A61:  8b ec                           mov      ebp, esp
  10016A63:  ff 75 08                        push     dword ptr [ebp + 8]
  10016A66:  6a 00                           push     0
  10016A68:  6a 59                           push     0x59
  10016A6A:  51                              push     ecx
  10016A6B:  e8 b0 14 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10016A70:  83 c4 10                        add      esp, 0x10
  10016A73:  5d                              pop      ebp
  10016A74:  c2 04 00                        ret      4


; === TextLabelFrame::GetDecodedLabel ===
; RVA: 0x00016AC0  Size: 62 bytes
; Exports: ?GetDecodedLabel@TextLabelFrame@GW@@QAEPB_WXZ
;
  10016AC0:  56                              push     esi
  10016AC1:  51                              push     ecx
  10016AC2:  e8 19 fd 00 00                  call     0x100267e0  ; UI::GetFrameContext
  10016AC7:  83 c4 04                        add      esp, 4
  10016ACA:  85 c0                           test     eax, eax
  10016ACC:  74 2c                           je       0x10016afa
  10016ACE:  8b 50 0c                        mov      edx, dword ptr [eax + 0xc]
  10016AD1:  85 d2                           test     edx, edx
  10016AD3:  74 25                           je       0x10016afa
  10016AD5:  8b 70 04                        mov      esi, dword ptr [eax + 4]
  10016AD8:  8b ce                           mov      ecx, esi
  10016ADA:  57                              push     edi
  10016ADB:  8d 79 02                        lea      edi, [ecx + 2]
  10016ADE:  66 90                           nop      
  10016AE0:  66 8b 01                        mov      ax, word ptr [ecx]
  10016AE3:  83 c1 02                        add      ecx, 2
  10016AE6:  66 85 c0                        test     ax, ax
  10016AE9:  75 f5                           jne      0x10016ae0
  10016AEB:  2b cf                           sub      ecx, edi
  10016AED:  d1 f9                           sar      ecx, 1
  10016AEF:  41                              inc      ecx
  10016AF0:  5f                              pop      edi
  10016AF1:  3b d1                           cmp      edx, ecx
  10016AF3:  76 05                           jbe      0x10016afa
  10016AF5:  8d 04 4e                        lea      eax, [esi + ecx*2]
  10016AF8:  5e                              pop      esi
  10016AF9:  c3                              ret      
  10016AFA:  33 c0                           xor      eax, eax
  10016AFC:  5e                              pop      esi
  10016AFD:  c3                              ret      


; === TextLabelFrame::GetEncodedLabel ===
; RVA: 0x00016B20  Size: 26 bytes
; Exports: ?GetEncodedLabel@TextLabelFrame@GW@@QAEPB_WXZ
;
  10016B20:  51                              push     ecx
  10016B21:  e8 ba fc 00 00                  call     0x100267e0  ; UI::GetFrameContext
  10016B26:  83 c4 04                        add      esp, 4
  10016B29:  85 c0                           test     eax, eax
  10016B2B:  74 0a                           je       0x10016b37
  10016B2D:  83 78 0c 00                     cmp      dword ptr [eax + 0xc], 0
  10016B31:  74 04                           je       0x10016b37
  10016B33:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  10016B36:  c3                              ret      
  10016B37:  33 c0                           xor      eax, eax
  10016B39:  c3                              ret      


; === ScrollableFrame::GetFirstChildFrameId ===
; RVA: 0x00016B40  Size: 74 bytes
; Exports: ?GetFirstChildFrameId@ScrollableFrame@GW@@QAEIPAI@Z
;
  10016B40:  55                              push     ebp
  10016B41:  8b ec                           mov      ebp, esp
  10016B43:  83 ec 10                        sub      esp, 0x10
  10016B46:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10016B49:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10016B4C:  8d 45 08                        lea      eax, [ebp + 8]
  10016B4F:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  10016B52:  8d 45 f0                        lea      eax, [ebp - 0x10]
  10016B55:  6a 00                           push     0
  10016B57:  50                              push     eax
  10016B58:  6a 59                           push     0x59
  10016B5A:  51                              push     ecx
  10016B5B:  c7 45 f0 02 00 00 00            mov      dword ptr [ebp - 0x10], 2
  10016B62:  c7 45 f4 00 00 00 00            mov      dword ptr [ebp - 0xc], 0
  10016B69:  c7 45 08 00 00 00 00            mov      dword ptr [ebp + 8], 0
  10016B70:  e8 ab 13 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10016B75:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10016B78:  33 d2                           xor      edx, edx
  10016B7A:  83 c4 10                        add      esp, 0x10
  10016B7D:  84 c0                           test     al, al
  10016B7F:  0f 44 ca                        cmove    ecx, edx
  10016B82:  8b c1                           mov      eax, ecx
  10016B84:  8b e5                           mov      esp, ebp
  10016B86:  5d                              pop      ebp
  10016B87:  c2 04 00                        ret      4


; === TabsFrame::GetIsTabEnabled, ScrollableFrame::GetItemRect ===
; RVA: 0x00016B90  Size: 24 bytes
; Exports: ?GetIsTabEnabled@TabsFrame@GW@@QAE_NIPAI@Z, ?GetItemRect@ScrollableFrame@GW@@QAE_NIQAM@Z
;
  10016B90:  55                              push     ebp
  10016B91:  8b ec                           mov      ebp, esp
  10016B93:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  10016B96:  ff 75 08                        push     dword ptr [ebp + 8]
  10016B99:  6a 5c                           push     0x5c
  10016B9B:  51                              push     ecx
  10016B9C:  e8 7f 13 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10016BA1:  83 c4 10                        add      esp, 0x10
  10016BA4:  5d                              pop      ebp
  10016BA5:  c2 08 00                        ret      8


; === ScrollableFrame::GetItemFrameId ===
; RVA: 0x00016BB0  Size: 38 bytes
; Exports: ?GetItemFrameId@ScrollableFrame@GW@@QAEII@Z
;
  10016BB0:  55                              push     ebp
  10016BB1:  8b ec                           mov      ebp, esp
  10016BB3:  51                              push     ecx
  10016BB4:  8d 45 fc                        lea      eax, [ebp - 4]
  10016BB7:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10016BBE:  50                              push     eax
  10016BBF:  ff 75 08                        push     dword ptr [ebp + 8]
  10016BC2:  6a 5b                           push     0x5b
  10016BC4:  51                              push     ecx
  10016BC5:  e8 56 13 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10016BCA:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  10016BCD:  83 c4 10                        add      esp, 0x10
  10016BD0:  8b e5                           mov      esp, ebp
  10016BD2:  5d                              pop      ebp
  10016BD3:  c2 04 00                        ret      4


; === ScrollableFrame::GetItems ===
; RVA: 0x00016BE0  Size: 216 bytes
; Exports: ?GetItems@ScrollableFrame@GW@@QAEIPAII@Z
;
  10016BE0:  55                              push     ebp
  10016BE1:  8b ec                           mov      ebp, esp
  10016BE3:  83 ec 18                        sub      esp, 0x18
  10016BE6:  8b c1                           mov      eax, ecx
  10016BE8:  c7 45 e8 02 00 00 00            mov      dword ptr [ebp - 0x18], 2
  10016BEF:  56                              push     esi
  10016BF0:  33 f6                           xor      esi, esi
  10016BF2:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  10016BF5:  8d 4d fc                        lea      ecx, [ebp - 4]
  10016BF8:  89 75 ec                        mov      dword ptr [ebp - 0x14], esi
  10016BFB:  89 4d f0                        mov      dword ptr [ebp - 0x10], ecx
  10016BFE:  8d 4d e8                        lea      ecx, [ebp - 0x18]
  10016C01:  56                              push     esi
  10016C02:  51                              push     ecx
  10016C03:  6a 59                           push     0x59
  10016C05:  50                              push     eax
  10016C06:  89 75 f4                        mov      dword ptr [ebp - 0xc], esi
  10016C09:  89 75 fc                        mov      dword ptr [ebp - 4], esi
  10016C0C:  e8 0f 13 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10016C11:  83 c4 10                        add      esp, 0x10
  10016C14:  84 c0                           test     al, al
  10016C16:  0f 84 93 00 00 00               je       0x10016caf
  10016C1C:  8b 55 fc                        mov      edx, dword ptr [ebp - 4]
  10016C1F:  85 d2                           test     edx, edx
  10016C21:  0f 84 88 00 00 00               je       0x10016caf
  10016C27:  53                              push     ebx
  10016C28:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  10016C2B:  57                              push     edi
  10016C2C:  0f 1f 40 00                     nop      dword ptr [eax]
  10016C30:  52                              push     edx
  10016C31:  e8 da fa 00 00                  call     0x10026710  ; UI::GetFrameById
  10016C36:  8b f8                           mov      edi, eax
  10016C38:  83 c4 04                        add      esp, 4
  10016C3B:  85 ff                           test     edi, edi
  10016C3D:  74 65                           je       0x10016ca4
  10016C3F:  8b 87 b8 00 00 00               mov      eax, dword ptr [edi + 0xb8]
  10016C45:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  10016C48:  8d 45 08                        lea      eax, [ebp + 8]
  10016C4B:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  10016C4E:  8d 45 e8                        lea      eax, [ebp - 0x18]
  10016C51:  6a 00                           push     0
  10016C53:  50                              push     eax
  10016C54:  6a 59                           push     0x59
  10016C56:  ff 75 f8                        push     dword ptr [ebp - 8]
  10016C59:  c7 45 e8 00 00 00 00            mov      dword ptr [ebp - 0x18], 0
  10016C60:  c7 45 f4 00 00 00 00            mov      dword ptr [ebp - 0xc], 0
  10016C67:  c7 45 08 00 00 00 00            mov      dword ptr [ebp + 8], 0
  10016C6E:  e8 ad 12 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10016C73:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  10016C76:  33 c9                           xor      ecx, ecx
  10016C78:  83 c4 10                        add      esp, 0x10
  10016C7B:  84 c0                           test     al, al
  10016C7D:  8b 87 8c 01 00 00               mov      eax, dword ptr [edi + 0x18c]
  10016C83:  0f 44 d1                        cmove    edx, ecx
  10016C86:  c1 e8 09                        shr      eax, 9
  10016C89:  a8 01                           test     al, 1
  10016C8B:  75 13                           jne      0x10016ca0
  10016C8D:  85 db                           test     ebx, ebx
  10016C8F:  74 0e                           je       0x10016c9f
  10016C91:  3b 75 0c                        cmp      esi, dword ptr [ebp + 0xc]
  10016C94:  73 09                           jae      0x10016c9f
  10016C96:  8b 8f b8 00 00 00               mov      ecx, dword ptr [edi + 0xb8]
  10016C9C:  89 0c b3                        mov      dword ptr [ebx + esi*4], ecx
  10016C9F:  46                              inc      esi
  10016CA0:  85 d2                           test     edx, edx
  10016CA2:  75 8c                           jne      0x10016c30
  10016CA4:  5f                              pop      edi
  10016CA5:  5b                              pop      ebx
  10016CA6:  8b c6                           mov      eax, esi
  10016CA8:  5e                              pop      esi
  10016CA9:  8b e5                           mov      esp, ebp
  10016CAB:  5d                              pop      ebp
  10016CAC:  c2 08 00                        ret      8
  10016CAF:  8b c6                           mov      eax, esi
  10016CB1:  5e                              pop      esi
  10016CB2:  8b e5                           mov      esp, ebp
  10016CB4:  5d                              pop      ebp
  10016CB5:  c2 08 00                        ret      8


; === ButtonFrame::GetLabel ===
; RVA: 0x00016CC0  Size: 42 bytes
; Exports: ?GetLabel@ButtonFrame@GW@@QAE_NPAPB_W@Z
;
  10016CC0:  55                              push     ebp
  10016CC1:  8b ec                           mov      ebp, esp
  10016CC3:  51                              push     ecx
  10016CC4:  e8 17 fb 00 00                  call     0x100267e0  ; UI::GetFrameContext
  10016CC9:  83 c4 04                        add      esp, 4
  10016CCC:  85 c0                           test     eax, eax
  10016CCE:  74 14                           je       0x10016ce4
  10016CD0:  83 78 0c 00                     cmp      dword ptr [eax + 0xc], 0
  10016CD4:  74 0e                           je       0x10016ce4
  10016CD6:  8b 48 04                        mov      ecx, dword ptr [eax + 4]
  10016CD9:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10016CDC:  89 08                           mov      dword ptr [eax], ecx
  10016CDE:  b0 01                           mov      al, 1
  10016CE0:  5d                              pop      ebp
  10016CE1:  c2 04 00                        ret      4
  10016CE4:  32 c0                           xor      al, al
  10016CE6:  5d                              pop      ebp
  10016CE7:  c2 04 00                        ret      4


; === ScrollableFrame::GetLastChildFrameId ===
; RVA: 0x00016CF0  Size: 74 bytes
; Exports: ?GetLastChildFrameId@ScrollableFrame@GW@@QAEIPAI@Z
;
  10016CF0:  55                              push     ebp
  10016CF1:  8b ec                           mov      ebp, esp
  10016CF3:  83 ec 10                        sub      esp, 0x10
  10016CF6:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10016CF9:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10016CFC:  8d 45 08                        lea      eax, [ebp + 8]
  10016CFF:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  10016D02:  8d 45 f0                        lea      eax, [ebp - 0x10]
  10016D05:  6a 00                           push     0
  10016D07:  50                              push     eax
  10016D08:  6a 59                           push     0x59
  10016D0A:  51                              push     ecx
  10016D0B:  c7 45 f0 03 00 00 00            mov      dword ptr [ebp - 0x10], 3
  10016D12:  c7 45 f4 00 00 00 00            mov      dword ptr [ebp - 0xc], 0
  10016D19:  c7 45 08 00 00 00 00            mov      dword ptr [ebp + 8], 0
  10016D20:  e8 fb 11 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10016D25:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10016D28:  33 d2                           xor      edx, edx
  10016D2A:  83 c4 10                        add      esp, 0x10
  10016D2D:  84 c0                           test     al, al
  10016D2F:  0f 44 ca                        cmove    ecx, edx
  10016D32:  8b c1                           mov      eax, ecx
  10016D34:  8b e5                           mov      esp, ebp
  10016D36:  5d                              pop      ebp
  10016D37:  c2 04 00                        ret      4


; === ScrollableFrame::GetNextChildFrameId ===
; RVA: 0x00016D40  Size: 73 bytes
; Exports: ?GetNextChildFrameId@ScrollableFrame@GW@@QAEIIPAI@Z
;
  10016D40:  55                              push     ebp
  10016D41:  8b ec                           mov      ebp, esp
  10016D43:  83 ec 10                        sub      esp, 0x10
  10016D46:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10016D49:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  10016D4C:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10016D4F:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10016D52:  8d 45 08                        lea      eax, [ebp + 8]
  10016D55:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  10016D58:  8d 45 f0                        lea      eax, [ebp - 0x10]
  10016D5B:  6a 00                           push     0
  10016D5D:  50                              push     eax
  10016D5E:  6a 59                           push     0x59
  10016D60:  51                              push     ecx
  10016D61:  c7 45 f0 00 00 00 00            mov      dword ptr [ebp - 0x10], 0
  10016D68:  c7 45 08 00 00 00 00            mov      dword ptr [ebp + 8], 0
  10016D6F:  e8 ac 11 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10016D74:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10016D77:  33 d2                           xor      edx, edx
  10016D79:  83 c4 10                        add      esp, 0x10
  10016D7C:  84 c0                           test     al, al
  10016D7E:  0f 44 ca                        cmove    ecx, edx
  10016D81:  8b c1                           mov      eax, ecx
  10016D83:  8b e5                           mov      esp, ebp
  10016D85:  5d                              pop      ebp
  10016D86:  c2 08 00                        ret      8


; === DropdownFrame::GetOptionIndex ===
; RVA: 0x00016D90  Size: 201 bytes
; Exports: ?GetOptionIndex@DropdownFrame@GW@@QAE_NIPAI@Z
;
  10016D90:  55                              push     ebp
  10016D91:  8b ec                           mov      ebp, esp
  10016D93:  6a ff                           push     -1
  10016D95:  68 ad ad 04 10                  push     0x1004adad
  10016D9A:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  10016DA0:  50                              push     eax
  10016DA1:  83 ec 0c                        sub      esp, 0xc
  10016DA4:  53                              push     ebx
  10016DA5:  56                              push     esi
  10016DA6:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  10016DAB:  33 c5                           xor      eax, ebp
  10016DAD:  50                              push     eax
  10016DAE:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10016DB1:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  10016DB7:  8b f1                           mov      esi, ecx
  10016DB9:  8d 45 e8                        lea      eax, [ebp - 0x18]
  10016DBC:  50                              push     eax
  10016DBD:  e8 5e 01 00 00                  call     0x10016f20  ; DropdownFrame::GetOptions
  10016DC2:  8d 46 04                        lea      eax, [esi + 4]
  10016DC5:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10016DCC:  f7 de                           neg      esi
  10016DCE:  1b f6                           sbb      esi, esi
  10016DD0:  23 f0                           and      esi, eax
  10016DD2:  56                              push     esi
  10016DD3:  e8 08 fa 00 00                  call     0x100267e0  ; UI::GetFrameContext
  10016DD8:  83 c4 04                        add      esp, 4
  10016DDB:  85 c0                           test     eax, eax
  10016DDD:  74 1e                           je       0x10016dfd
  10016DDF:  8b 08                           mov      ecx, dword ptr [eax]
  10016DE1:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  10016DE4:  c1 e0 05                        shl      eax, 5
  10016DE7:  03 c1                           add      eax, ecx
  10016DE9:  3b c8                           cmp      ecx, eax
  10016DEB:  74 10                           je       0x10016dfd
  10016DED:  0f 1f 00                        nop      dword ptr [eax]
  10016DF0:  83 79 08 00                     cmp      dword ptr [ecx + 8], 0
  10016DF4:  75 20                           jne      0x10016e16
  10016DF6:  83 c1 20                        add      ecx, 0x20
  10016DF9:  3b c8                           cmp      ecx, eax
  10016DFB:  75 f3                           jne      0x10016df0
  10016DFD:  8b 45 ec                        mov      eax, dword ptr [ebp - 0x14]
  10016E00:  2b 45 e8                        sub      eax, dword ptr [ebp - 0x18]
  10016E03:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10016E06:  c1 f8 02                        sar      eax, 2
  10016E09:  3b c1                           cmp      eax, ecx
  10016E0B:  76 2d                           jbe      0x10016e3a
  10016E0D:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10016E10:  b3 01                           mov      bl, 1
  10016E12:  89 08                           mov      dword ptr [eax], ecx
  10016E14:  eb 26                           jmp      0x10016e3c
  10016E16:  8b 45 ec                        mov      eax, dword ptr [ebp - 0x14]
  10016E19:  33 c9                           xor      ecx, ecx
  10016E1B:  8b 55 e8                        mov      edx, dword ptr [ebp - 0x18]
  10016E1E:  2b c2                           sub      eax, edx
  10016E20:  c1 f8 02                        sar      eax, 2
  10016E23:  85 c0                           test     eax, eax
  10016E25:  74 13                           je       0x10016e3a
  10016E27:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10016E2A:  66 0f 1f 44 00 00               nop      word ptr [eax + eax]
  10016E30:  39 34 8a                        cmp      dword ptr [edx + ecx*4], esi
  10016E33:  74 d8                           je       0x10016e0d
  10016E35:  41                              inc      ecx
  10016E36:  3b c8                           cmp      ecx, eax
  10016E38:  72 f6                           jb       0x10016e30
  10016E3A:  32 db                           xor      bl, bl
  10016E3C:  8d 4d e8                        lea      ecx, [ebp - 0x18]
  10016E3F:  e8 ec ad fe ff                  call     0x10001c30
  10016E44:  8a c3                           mov      al, bl
  10016E46:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  10016E49:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  10016E50:  59                              pop      ecx
  10016E51:  5e                              pop      esi
  10016E52:  5b                              pop      ebx
  10016E53:  8b e5                           mov      esp, ebp
  10016E55:  5d                              pop      ebp
  10016E56:  c2 08 00                        ret      8


; === DropdownFrame::GetOptionValue ===
; RVA: 0x00016E60  Size: 177 bytes
; Exports: ?GetOptionValue@DropdownFrame@GW@@QAE_NIPAI@Z
;
  10016E60:  55                              push     ebp
  10016E61:  8b ec                           mov      ebp, esp
  10016E63:  6a ff                           push     -1
  10016E65:  68 dd ad 04 10                  push     0x1004addd
  10016E6A:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  10016E70:  50                              push     eax
  10016E71:  83 ec 0c                        sub      esp, 0xc
  10016E74:  53                              push     ebx
  10016E75:  56                              push     esi
  10016E76:  57                              push     edi
  10016E77:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  10016E7C:  33 c5                           xor      eax, ebp
  10016E7E:  50                              push     eax
  10016E7F:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10016E82:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  10016E88:  8b f1                           mov      esi, ecx
  10016E8A:  8d 45 e8                        lea      eax, [ebp - 0x18]
  10016E8D:  50                              push     eax
  10016E8E:  e8 8d 00 00 00                  call     0x10016f20  ; DropdownFrame::GetOptions
  10016E93:  8b 45 ec                        mov      eax, dword ptr [ebp - 0x14]
  10016E96:  2b 45 e8                        sub      eax, dword ptr [ebp - 0x18]
  10016E99:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  10016E9C:  c1 f8 02                        sar      eax, 2
  10016E9F:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10016EA6:  3b c7                           cmp      eax, edi
  10016EA8:  77 04                           ja       0x10016eae
  10016EAA:  32 db                           xor      bl, bl
  10016EAC:  eb 38                           jmp      0x10016ee6
  10016EAE:  8d 46 04                        lea      eax, [esi + 4]
  10016EB1:  f7 de                           neg      esi
  10016EB3:  1b f6                           sbb      esi, esi
  10016EB5:  23 f0                           and      esi, eax
  10016EB7:  56                              push     esi
  10016EB8:  e8 23 f9 00 00                  call     0x100267e0  ; UI::GetFrameContext
  10016EBD:  83 c4 04                        add      esp, 4
  10016EC0:  85 c0                           test     eax, eax
  10016EC2:  74 1b                           je       0x10016edf
  10016EC4:  8b 08                           mov      ecx, dword ptr [eax]
  10016EC6:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  10016EC9:  c1 e0 05                        shl      eax, 5
  10016ECC:  03 c1                           add      eax, ecx
  10016ECE:  3b c8                           cmp      ecx, eax
  10016ED0:  74 0d                           je       0x10016edf
  10016ED2:  83 79 08 00                     cmp      dword ptr [ecx + 8], 0
  10016ED6:  75 2c                           jne      0x10016f04
  10016ED8:  83 c1 20                        add      ecx, 0x20
  10016EDB:  3b c8                           cmp      ecx, eax
  10016EDD:  75 f3                           jne      0x10016ed2
  10016EDF:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10016EE2:  89 38                           mov      dword ptr [eax], edi
  10016EE4:  b3 01                           mov      bl, 1
  10016EE6:  8d 4d e8                        lea      ecx, [ebp - 0x18]
  10016EE9:  e8 42 ad fe ff                  call     0x10001c30
  10016EEE:  8a c3                           mov      al, bl
  10016EF0:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  10016EF3:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  10016EFA:  59                              pop      ecx
  10016EFB:  5f                              pop      edi
  10016EFC:  5e                              pop      esi
  10016EFD:  5b                              pop      ebx
  10016EFE:  8b e5                           mov      esp, ebp
  10016F00:  5d                              pop      ebp
  10016F01:  c2 08 00                        ret      8
  10016F04:  8b 45 e8                        mov      eax, dword ptr [ebp - 0x18]
  10016F07:  8b 0c b8                        mov      ecx, dword ptr [eax + edi*4]
  10016F0A:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10016F0D:  89 08                           mov      dword ptr [eax], ecx
  10016F0F:  eb d3                           jmp      0x10016ee4


; === DropdownFrame::GetOptions ===
; RVA: 0x00016F20  Size: 307 bytes
; Exports: ?GetOptions@DropdownFrame@GW@@QAE?AV?$vector@IV?$allocator@I@std@@@std@@XZ
;
  10016F20:  55                              push     ebp
  10016F21:  8b ec                           mov      ebp, esp
  10016F23:  6a ff                           push     -1
  10016F25:  68 1e ae 04 10                  push     0x1004ae1e
  10016F2A:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  10016F30:  50                              push     eax
  10016F31:  83 ec 10                        sub      esp, 0x10
  10016F34:  53                              push     ebx
  10016F35:  56                              push     esi
  10016F36:  57                              push     edi
  10016F37:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  10016F3C:  33 c5                           xor      eax, ebp
  10016F3E:  50                              push     eax
  10016F3F:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10016F42:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  10016F48:  8b f9                           mov      edi, ecx
  10016F4A:  c7 45 e4 01 00 00 00            mov      dword ptr [ebp - 0x1c], 1
  10016F51:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10016F54:  c7 06 00 00 00 00               mov      dword ptr [esi], 0
  10016F5A:  c7 46 04 00 00 00 00            mov      dword ptr [esi + 4], 0
  10016F61:  c7 46 08 00 00 00 00            mov      dword ptr [esi + 8], 0
  10016F68:  8d 47 04                        lea      eax, [edi + 4]
  10016F6B:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10016F72:  f7 df                           neg      edi
  10016F74:  c7 45 e4 01 00 00 00            mov      dword ptr [ebp - 0x1c], 1
  10016F7B:  1b ff                           sbb      edi, edi
  10016F7D:  23 f8                           and      edi, eax
  10016F7F:  57                              push     edi
  10016F80:  e8 5b f8 00 00                  call     0x100267e0  ; UI::GetFrameContext
  10016F85:  83 c4 04                        add      esp, 4
  10016F88:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  10016F8B:  85 c0                           test     eax, eax
  10016F8D:  0f 84 aa 00 00 00               je       0x1001703d
  10016F93:  57                              push     edi
  10016F94:  e8 47 f8 00 00                  call     0x100267e0  ; UI::GetFrameContext
  10016F99:  8b c8                           mov      ecx, eax
  10016F9B:  83 c4 04                        add      esp, 4
  10016F9E:  85 c9                           test     ecx, ecx
  10016FA0:  74 1b                           je       0x10016fbd
  10016FA2:  8b 01                           mov      eax, dword ptr [ecx]
  10016FA4:  8b 49 08                        mov      ecx, dword ptr [ecx + 8]
  10016FA7:  c1 e1 05                        shl      ecx, 5
  10016FAA:  03 c8                           add      ecx, eax
  10016FAC:  3b c1                           cmp      eax, ecx
  10016FAE:  74 0d                           je       0x10016fbd
  10016FB0:  83 78 08 00                     cmp      dword ptr [eax + 8], 0
  10016FB4:  75 52                           jne      0x10017008
  10016FB6:  83 c0 20                        add      eax, 0x20
  10016FB9:  3b c1                           cmp      eax, ecx
  10016FBB:  75 f3                           jne      0x10016fb0
  10016FBD:  32 d2                           xor      dl, dl
  10016FBF:  8b 4d ec                        mov      ecx, dword ptr [ebp - 0x14]
  10016FC2:  33 db                           xor      ebx, ebx
  10016FC4:  88 55 f3                        mov      byte ptr [ebp - 0xd], dl
  10016FC7:  89 5d e8                        mov      dword ptr [ebp - 0x18], ebx
  10016FCA:  8b 41 08                        mov      eax, dword ptr [ecx + 8]
  10016FCD:  85 c0                           test     eax, eax
  10016FCF:  74 6c                           je       0x1001703d
  10016FD1:  33 ff                           xor      edi, edi
  10016FD3:  84 d2                           test     dl, dl
  10016FD5:  74 35                           je       0x1001700c
  10016FD7:  83 39 00                        cmp      dword ptr [ecx], 0
  10016FDA:  74 04                           je       0x10016fe0
  10016FDC:  3b f8                           cmp      edi, eax
  10016FDE:  72 1c                           jb       0x10016ffc
  10016FE0:  68 68 21 05 10                  push     0x10052168  ; "GW::BaseArray<struct `anonymous namespace'::DropdownOptio..."
  10016FE5:  6a 1e                           push     0x1e
  10016FE7:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  10016FEC:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  10016FF1:  e8 7a e8 fe ff                  call     0x10005870  ; GW::FatalAssert
  10016FF6:  8b 4d ec                        mov      ecx, dword ptr [ebp - 0x14]
  10016FF9:  83 c4 10                        add      esp, 0x10
  10016FFC:  8b 01                           mov      eax, dword ptr [ecx]
  10016FFE:  c1 e7 05                        shl      edi, 5
  10017001:  83 c0 08                        add      eax, 8
  10017004:  03 c7                           add      eax, edi
  10017006:  eb 07                           jmp      0x1001700f
  10017008:  b2 01                           mov      dl, 1
  1001700A:  eb b3                           jmp      0x10016fbf
  1001700C:  8d 45 e8                        lea      eax, [ebp - 0x18]
  1001700F:  8b 4e 04                        mov      ecx, dword ptr [esi + 4]
  10017012:  3b 4e 08                        cmp      ecx, dword ptr [esi + 8]
  10017015:  74 0a                           je       0x10017021
  10017017:  8b 00                           mov      eax, dword ptr [eax]
  10017019:  89 01                           mov      dword ptr [ecx], eax
  1001701B:  83 46 04 04                     add      dword ptr [esi + 4], 4
  1001701F:  eb 09                           jmp      0x1001702a
  10017021:  50                              push     eax
  10017022:  51                              push     ecx
  10017023:  8b ce                           mov      ecx, esi
  10017025:  e8 06 a9 fe ff                  call     0x10001930
  1001702A:  8b 4d ec                        mov      ecx, dword ptr [ebp - 0x14]
  1001702D:  43                              inc      ebx
  1001702E:  8a 55 f3                        mov      dl, byte ptr [ebp - 0xd]
  10017031:  8b fb                           mov      edi, ebx
  10017033:  89 5d e8                        mov      dword ptr [ebp - 0x18], ebx
  10017036:  8b 41 08                        mov      eax, dword ptr [ecx + 8]
  10017039:  3b f8                           cmp      edi, eax
  1001703B:  72 96                           jb       0x10016fd3
  1001703D:  8b c6                           mov      eax, esi
  1001703F:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  10017042:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  10017049:  59                              pop      ecx
  1001704A:  5f                              pop      edi
  1001704B:  5e                              pop      esi
  1001704C:  5b                              pop      ebx
  1001704D:  8b e5                           mov      esp, ebp
  1001704F:  5d                              pop      ebp
  10017050:  c2 04 00                        ret      4


; === ScrollableFrame::GetPage ===
; RVA: 0x00017060  Size: 20 bytes
; Exports: ?GetPage@ScrollableFrame@GW@@QAEPAUFrame@UI@2@XZ
;
  10017060:  6a 00                           push     0
  10017062:  51                              push     ecx
  10017063:  e8 88 f3 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  10017068:  6a 00                           push     0
  1001706A:  50                              push     eax
  1001706B:  e8 80 f3 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  10017070:  83 c4 10                        add      esp, 0x10
  10017073:  c3                              ret      


; === ScrollableFrame::GetPrevChildFrameId ===
; RVA: 0x00017080  Size: 73 bytes
; Exports: ?GetPrevChildFrameId@ScrollableFrame@GW@@QAEIIPAI@Z
;
  10017080:  55                              push     ebp
  10017081:  8b ec                           mov      ebp, esp
  10017083:  83 ec 10                        sub      esp, 0x10
  10017086:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10017089:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  1001708C:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  1001708F:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10017092:  8d 45 08                        lea      eax, [ebp + 8]
  10017095:  89 45 f8                        mov      dword ptr [ebp - 8], eax
  10017098:  8d 45 f0                        lea      eax, [ebp - 0x10]
  1001709B:  6a 00                           push     0
  1001709D:  50                              push     eax
  1001709E:  6a 59                           push     0x59
  100170A0:  51                              push     ecx
  100170A1:  c7 45 f0 01 00 00 00            mov      dword ptr [ebp - 0x10], 1
  100170A8:  c7 45 08 00 00 00 00            mov      dword ptr [ebp + 8], 0
  100170AF:  e8 6c 0e 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  100170B4:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  100170B7:  33 d2                           xor      edx, edx
  100170B9:  83 c4 10                        add      esp, 0x10
  100170BC:  84 c0                           test     al, al
  100170BE:  0f 44 ca                        cmove    ecx, edx
  100170C1:  8b c1                           mov      eax, ecx
  100170C3:  8b e5                           mov      esp, ebp
  100170C5:  5d                              pop      ebp
  100170C6:  c2 08 00                        ret      8


; === DropdownFrame::GetSelectedIndex ===
; RVA: 0x000170D0  Size: 45 bytes
; Exports: ?GetSelectedIndex@DropdownFrame@GW@@QAE_NPAI@Z
;
  100170D0:  55                              push     ebp
  100170D1:  8b ec                           mov      ebp, esp
  100170D3:  8d 41 04                        lea      eax, [ecx + 4]
  100170D6:  f7 d9                           neg      ecx
  100170D8:  1b c9                           sbb      ecx, ecx
  100170DA:  23 c8                           and      ecx, eax
  100170DC:  51                              push     ecx
  100170DD:  e8 fe f6 00 00                  call     0x100267e0  ; UI::GetFrameContext
  100170E2:  83 c4 04                        add      esp, 4
  100170E5:  85 c0                           test     eax, eax
  100170E7:  74 0e                           je       0x100170f7
  100170E9:  8b 48 58                        mov      ecx, dword ptr [eax + 0x58]
  100170EC:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100170EF:  89 08                           mov      dword ptr [eax], ecx
  100170F1:  b0 01                           mov      al, 1
  100170F3:  5d                              pop      ebp
  100170F4:  c2 04 00                        ret      4
  100170F7:  32 c0                           xor      al, al
  100170F9:  5d                              pop      ebp
  100170FA:  c2 04 00                        ret      4


; === ScrollableFrame::GetSelectedValue ===
; RVA: 0x00017100  Size: 65 bytes
; Exports: ?GetSelectedValue@ScrollableFrame@GW@@QAE_NPAI@Z
;
  10017100:  55                              push     ebp
  10017101:  8b ec                           mov      ebp, esp
  10017103:  83 ec 08                        sub      esp, 8
  10017106:  8d 45 f8                        lea      eax, [ebp - 8]
  10017109:  0f 57 c0                        xorps    xmm0, xmm0
  1001710C:  50                              push     eax
  1001710D:  6a 00                           push     0
  1001710F:  6a 67                           push     0x67
  10017111:  51                              push     ecx
  10017112:  66 0f 13 45 f8                  movlpd   qword ptr [ebp - 8], xmm0
  10017117:  e8 04 0e 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  1001711C:  83 c4 10                        add      esp, 0x10
  1001711F:  84 c0                           test     al, al
  10017121:  74 16                           je       0x10017139
  10017123:  83 7d f8 00                     cmp      dword ptr [ebp - 8], 0
  10017127:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001712A:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  1001712D:  89 01                           mov      dword ptr [ecx], eax
  1001712F:  74 08                           je       0x10017139
  10017131:  b0 01                           mov      al, 1
  10017133:  8b e5                           mov      esp, ebp
  10017135:  5d                              pop      ebp
  10017136:  c2 04 00                        ret      4
  10017139:  32 c0                           xor      al, al
  1001713B:  8b e5                           mov      esp, ebp
  1001713D:  5d                              pop      ebp
  1001713E:  c2 04 00                        ret      4


; === ScrollableFrame::GetSortHandler ===
; RVA: 0x00017150  Size: 36 bytes
; Exports: ?GetSortHandler@ScrollableFrame@GW@@QAEP6AHII@ZXZ
;
  10017150:  6a 00                           push     0
  10017152:  51                              push     ecx
  10017153:  e8 98 f2 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  10017158:  6a 00                           push     0
  1001715A:  50                              push     eax
  1001715B:  e8 90 f2 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  10017160:  50                              push     eax
  10017161:  e8 7a f6 00 00                  call     0x100267e0  ; UI::GetFrameContext
  10017166:  83 c4 14                        add      esp, 0x14
  10017169:  85 c0                           test     eax, eax
  1001716B:  74 04                           je       0x10017171
  1001716D:  8b 40 0c                        mov      eax, dword ptr [eax + 0xc]
  10017170:  c3                              ret      
  10017171:  33 c0                           xor      eax, eax
  10017173:  c3                              ret      


; === TabsFrame::GetTabButton ===
; RVA: 0x00017180  Size: 65 bytes
; Exports: ?GetTabButton@TabsFrame@GW@@QAEPAUButtonFrame@2@PAUFrame@UI@2@@Z
;
  10017180:  55                              push     ebp
  10017181:  8b ec                           mov      ebp, esp
  10017183:  56                              push     esi
  10017184:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10017187:  57                              push     edi
  10017188:  8b f9                           mov      edi, ecx
  1001718A:  85 f6                           test     esi, esi
  1001718C:  74 2b                           je       0x100171b9
  1001718E:  ff b6 b8 00 00 00               push     dword ptr [esi + 0xb8]
  10017194:  57                              push     edi
  10017195:  e8 56 f2 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001719A:  83 c4 08                        add      esp, 8
  1001719D:  3b c6                           cmp      eax, esi
  1001719F:  75 18                           jne      0x100171b9
  100171A1:  8b 86 b8 00 00 00               mov      eax, dword ptr [esi + 0xb8]
  100171A7:  f7 d0                           not      eax
  100171A9:  50                              push     eax
  100171AA:  57                              push     edi
  100171AB:  e8 40 f2 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  100171B0:  83 c4 08                        add      esp, 8
  100171B3:  5f                              pop      edi
  100171B4:  5e                              pop      esi
  100171B5:  5d                              pop      ebp
  100171B6:  c2 04 00                        ret      4
  100171B9:  5f                              pop      edi
  100171BA:  33 c0                           xor      eax, eax
  100171BC:  5e                              pop      esi
  100171BD:  5d                              pop      ebp
  100171BE:  c2 04 00                        ret      4


; === TabsFrame::GetTabByLabel ===
; RVA: 0x000171D0  Size: 234 bytes
; Exports: ?GetTabByLabel@TabsFrame@GW@@QAEPAUFrame@UI@2@PB_W@Z
;
  100171D0:  55                              push     ebp
  100171D1:  8b ec                           mov      ebp, esp
  100171D3:  83 ec 08                        sub      esp, 8
  100171D6:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100171D9:  53                              push     ebx
  100171DA:  56                              push     esi
  100171DB:  8b f1                           mov      esi, ecx
  100171DD:  89 75 f8                        mov      dword ptr [ebp - 8], esi
  100171E0:  57                              push     edi
  100171E1:  85 c0                           test     eax, eax
  100171E3:  0f 84 bb 00 00 00               je       0x100172a4
  100171E9:  66 83 38 00                     cmp      word ptr [eax], 0
  100171ED:  0f 84 b1 00 00 00               je       0x100172a4
  100171F3:  33 ff                           xor      edi, edi
  100171F5:  8d 45 fc                        lea      eax, [ebp - 4]
  100171F8:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  100171FF:  50                              push     eax
  10017200:  57                              push     edi
  10017201:  6a 5a                           push     0x5a
  10017203:  56                              push     esi
  10017204:  e8 17 0d 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10017209:  83 c4 10                        add      esp, 0x10
  1001720C:  84 c0                           test     al, al
  1001720E:  0f 84 86 00 00 00               je       0x1001729a
  10017214:  ff 75 fc                        push     dword ptr [ebp - 4]
  10017217:  e8 f4 f4 00 00                  call     0x10026710  ; UI::GetFrameById
  1001721C:  8b d8                           mov      ebx, eax
  1001721E:  83 c4 04                        add      esp, 4
  10017221:  85 db                           test     ebx, ebx
  10017223:  74 75                           je       0x1001729a
  10017225:  ff b3 b8 00 00 00               push     dword ptr [ebx + 0xb8]
  1001722B:  56                              push     esi
  1001722C:  e8 bf f1 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  10017231:  83 c4 08                        add      esp, 8
  10017234:  3b c3                           cmp      eax, ebx
  10017236:  75 62                           jne      0x1001729a
  10017238:  8b 83 b8 00 00 00               mov      eax, dword ptr [ebx + 0xb8]
  1001723E:  f7 d0                           not      eax
  10017240:  50                              push     eax
  10017241:  56                              push     esi
  10017242:  e8 a9 f1 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  10017247:  83 c4 08                        add      esp, 8
  1001724A:  85 c0                           test     eax, eax
  1001724C:  74 4c                           je       0x1001729a
  1001724E:  50                              push     eax
  1001724F:  33 f6                           xor      esi, esi
  10017251:  e8 8a f5 00 00                  call     0x100267e0  ; UI::GetFrameContext
  10017256:  83 c4 04                        add      esp, 4
  10017259:  85 c0                           test     eax, eax
  1001725B:  74 08                           je       0x10017265
  1001725D:  39 70 0c                        cmp      dword ptr [eax + 0xc], esi
  10017260:  74 03                           je       0x10017265
  10017262:  8b 70 04                        mov      esi, dword ptr [eax + 4]
  10017265:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10017268:  66 8b 0e                        mov      cx, word ptr [esi]
  1001726B:  66 3b 08                        cmp      cx, word ptr [eax]
  1001726E:  75 1e                           jne      0x1001728e
  10017270:  66 85 c9                        test     cx, cx
  10017273:  74 15                           je       0x1001728a
  10017275:  66 8b 4e 02                     mov      cx, word ptr [esi + 2]
  10017279:  66 3b 48 02                     cmp      cx, word ptr [eax + 2]
  1001727D:  75 0f                           jne      0x1001728e
  1001727F:  83 c6 04                        add      esi, 4
  10017282:  83 c0 04                        add      eax, 4
  10017285:  66 85 c9                        test     cx, cx
  10017288:  75 de                           jne      0x10017268
  1001728A:  33 c0                           xor      eax, eax
  1001728C:  eb 05                           jmp      0x10017293
  1001728E:  1b c0                           sbb      eax, eax
  10017290:  83 c8 01                        or       eax, 1
  10017293:  85 c0                           test     eax, eax
  10017295:  74 18                           je       0x100172af
  10017297:  8b 75 f8                        mov      esi, dword ptr [ebp - 8]
  1001729A:  47                              inc      edi
  1001729B:  83 ff 0a                        cmp      edi, 0xa
  1001729E:  0f 82 51 ff ff ff               jb       0x100171f5
  100172A4:  5f                              pop      edi
  100172A5:  5e                              pop      esi
  100172A6:  33 c0                           xor      eax, eax
  100172A8:  5b                              pop      ebx
  100172A9:  8b e5                           mov      esp, ebp
  100172AB:  5d                              pop      ebp
  100172AC:  c2 04 00                        ret      4
  100172AF:  5f                              pop      edi
  100172B0:  5e                              pop      esi
  100172B1:  8b c3                           mov      eax, ebx
  100172B3:  5b                              pop      ebx
  100172B4:  8b e5                           mov      esp, ebp
  100172B6:  5d                              pop      ebp
  100172B7:  c2 04 00                        ret      4


; === TabsFrame::GetTabFrameId ===
; RVA: 0x000172C0  Size: 24 bytes
; Exports: ?GetTabFrameId@TabsFrame@GW@@QAE_NIPAI@Z
;
  100172C0:  55                              push     ebp
  100172C1:  8b ec                           mov      ebp, esp
  100172C3:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  100172C6:  ff 75 08                        push     dword ptr [ebp + 8]
  100172C9:  6a 5a                           push     0x5a
  100172CB:  51                              push     ecx
  100172CC:  e8 4f 0c 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  100172D1:  83 c4 10                        add      esp, 0x10
  100172D4:  5d                              pop      ebp
  100172D5:  c2 08 00                        ret      8


; === CheckboxFrame::GetValue ===
; RVA: 0x000172E0  Size: 50 bytes
; Exports: ?GetValue@CheckboxFrame@GW@@UAEIXZ
;
  100172E0:  55                              push     ebp
  100172E1:  8b ec                           mov      ebp, esp
  100172E3:  51                              push     ecx
  100172E4:  8d 45 fc                        lea      eax, [ebp - 4]
  100172E7:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  100172EE:  50                              push     eax
  100172EF:  8d 41 04                        lea      eax, [ecx + 4]
  100172F2:  f7 d9                           neg      ecx
  100172F4:  6a 00                           push     0
  100172F6:  1b c9                           sbb      ecx, ecx
  100172F8:  23 c8                           and      ecx, eax
  100172FA:  6a 58                           push     0x58
  100172FC:  51                              push     ecx
  100172FD:  e8 1e 0c 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10017302:  33 c0                           xor      eax, eax
  10017304:  83 c4 10                        add      esp, 0x10
  10017307:  83 7d fc 01                     cmp      dword ptr [ebp - 4], 1
  1001730B:  0f 94 c0                        sete     al
  1001730E:  8b e5                           mov      esp, ebp
  10017310:  5d                              pop      ebp
  10017311:  c3                              ret      


; === DropdownFrame::GetValue ===
; RVA: 0x00017320  Size: 71 bytes
; Exports: ?GetValue@DropdownFrame@GW@@UAEIXZ
;
  10017320:  55                              push     ebp
  10017321:  8b ec                           mov      ebp, esp
  10017323:  51                              push     ecx
  10017324:  56                              push     esi
  10017325:  8b f1                           mov      esi, ecx
  10017327:  8b d6                           mov      edx, esi
  10017329:  f7 da                           neg      edx
  1001732B:  8d 46 04                        lea      eax, [esi + 4]
  1001732E:  1b d2                           sbb      edx, edx
  10017330:  23 d0                           and      edx, eax
  10017332:  52                              push     edx
  10017333:  e8 a8 f4 00 00                  call     0x100267e0  ; UI::GetFrameContext
  10017338:  83 c4 04                        add      esp, 4
  1001733B:  85 c0                           test     eax, eax
  1001733D:  74 21                           je       0x10017360
  1001733F:  8d 4d fc                        lea      ecx, [ebp - 4]
  10017342:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10017349:  51                              push     ecx
  1001734A:  ff 70 58                        push     dword ptr [eax + 0x58]
  1001734D:  8b ce                           mov      ecx, esi
  1001734F:  e8 0c fb ff ff                  call     0x10016e60  ; DropdownFrame::GetOptionValue
  10017354:  84 c0                           test     al, al
  10017356:  74 08                           je       0x10017360
  10017358:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  1001735B:  5e                              pop      esi
  1001735C:  8b e5                           mov      esp, ebp
  1001735E:  5d                              pop      ebp
  1001735F:  c3                              ret      
  10017360:  33 c0                           xor      eax, eax
  10017362:  5e                              pop      esi
  10017363:  8b e5                           mov      esp, ebp
  10017365:  5d                              pop      ebp
  10017366:  c3                              ret      


; === EditableTextFrame::GetValue ===
; RVA: 0x00017370  Size: 20 bytes
; Exports: ?GetValue@EditableTextFrame@GW@@QAEPB_WXZ
;
  10017370:  51                              push     ecx
  10017371:  e8 6a f4 00 00                  call     0x100267e0  ; UI::GetFrameContext
  10017376:  83 c4 04                        add      esp, 4
  10017379:  85 c0                           test     eax, eax
  1001737B:  74 04                           je       0x10017381
  1001737D:  8b 40 48                        mov      eax, dword ptr [eax + 0x48]
  10017380:  c3                              ret      
  10017381:  33 c0                           xor      eax, eax
  10017383:  c3                              ret      


; === ProgressBar::GetValue ===
; RVA: 0x00017390  Size: 44 bytes
; Exports: ?GetValue@ProgressBar@GW@@UAEIXZ
;
  10017390:  55                              push     ebp
  10017391:  8b ec                           mov      ebp, esp
  10017393:  51                              push     ecx
  10017394:  8d 45 fc                        lea      eax, [ebp - 4]
  10017397:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001739E:  50                              push     eax
  1001739F:  8d 41 04                        lea      eax, [ecx + 4]
  100173A2:  f7 d9                           neg      ecx
  100173A4:  6a 00                           push     0
  100173A6:  1b c9                           sbb      ecx, ecx
  100173A8:  23 c8                           and      ecx, eax
  100173AA:  6a 56                           push     0x56
  100173AC:  51                              push     ecx
  100173AD:  e8 6e 0b 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  100173B2:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  100173B5:  83 c4 10                        add      esp, 0x10
  100173B8:  8b e5                           mov      esp, ebp
  100173BA:  5d                              pop      ebp
  100173BB:  c3                              ret      


; === SliderFrame::GetValue, ProgressBar::SetValue ===
; RVA: 0x000173C0  Size: 32 bytes
; Exports: ?GetValue@SliderFrame@GW@@QAE_NPAI@Z, ?SetValue@ProgressBar@GW@@UAE_NI@Z
;
  100173C0:  55                              push     ebp
  100173C1:  8b ec                           mov      ebp, esp
  100173C3:  8d 41 04                        lea      eax, [ecx + 4]
  100173C6:  f7 d9                           neg      ecx
  100173C8:  6a 00                           push     0
  100173CA:  ff 75 08                        push     dword ptr [ebp + 8]
  100173CD:  1b c9                           sbb      ecx, ecx
  100173CF:  23 c8                           and      ecx, eax
  100173D1:  6a 58                           push     0x58
  100173D3:  51                              push     ecx
  100173D4:  e8 47 0b 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  100173D9:  83 c4 10                        add      esp, 0x10
  100173DC:  5d                              pop      ebp
  100173DD:  c2 04 00                        ret      4


; === SliderFrame::GetValue ===
; RVA: 0x000173E0  Size: 53 bytes
; Exports: ?GetValue@SliderFrame@GW@@UAEIXZ
;
  100173E0:  55                              push     ebp
  100173E1:  8b ec                           mov      ebp, esp
  100173E3:  51                              push     ecx
  100173E4:  6a 00                           push     0
  100173E6:  8d 45 fc                        lea      eax, [ebp - 4]
  100173E9:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  100173F0:  50                              push     eax
  100173F1:  8d 41 04                        lea      eax, [ecx + 4]
  100173F4:  f7 d9                           neg      ecx
  100173F6:  6a 58                           push     0x58
  100173F8:  1b c9                           sbb      ecx, ecx
  100173FA:  23 c8                           and      ecx, eax
  100173FC:  51                              push     ecx
  100173FD:  e8 1e 0b 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10017402:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10017405:  33 d2                           xor      edx, edx
  10017407:  83 c4 10                        add      esp, 0x10
  1001740A:  84 c0                           test     al, al
  1001740C:  0f 44 ca                        cmove    ecx, edx
  1001740F:  8b c1                           mov      eax, ecx
  10017411:  8b e5                           mov      esp, ebp
  10017413:  5d                              pop      ebp
  10017414:  c3                              ret      


; === DropdownFrame::HasValueMapping ===
; RVA: 0x00017420  Size: 55 bytes
; Exports: ?HasValueMapping@DropdownFrame@GW@@QAE_NXZ
;
  10017420:  8d 41 04                        lea      eax, [ecx + 4]
  10017423:  f7 d9                           neg      ecx
  10017425:  1b c9                           sbb      ecx, ecx
  10017427:  23 c8                           and      ecx, eax
  10017429:  51                              push     ecx
  1001742A:  e8 b1 f3 00 00                  call     0x100267e0  ; UI::GetFrameContext
  1001742F:  83 c4 04                        add      esp, 4
  10017432:  85 c0                           test     eax, eax
  10017434:  74 1b                           je       0x10017451
  10017436:  8b 08                           mov      ecx, dword ptr [eax]
  10017438:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  1001743B:  c1 e0 05                        shl      eax, 5
  1001743E:  03 c1                           add      eax, ecx
  10017440:  3b c8                           cmp      ecx, eax
  10017442:  74 0d                           je       0x10017451
  10017444:  83 79 08 00                     cmp      dword ptr [ecx + 8], 0
  10017448:  75 0a                           jne      0x10017454
  1001744A:  83 c1 20                        add      ecx, 0x20
  1001744D:  3b c8                           cmp      ecx, eax
  1001744F:  75 f3                           jne      0x10017444
  10017451:  32 c0                           xor      al, al
  10017453:  c3                              ret      
  10017454:  b0 01                           mov      al, 1
  10017456:  c3                              ret      


; === CheckboxFrame::IsChecked ===
; RVA: 0x00017460  Size: 48 bytes
; Exports: ?IsChecked@CheckboxFrame@GW@@QAE_NXZ
;
  10017460:  55                              push     ebp
  10017461:  8b ec                           mov      ebp, esp
  10017463:  51                              push     ecx
  10017464:  8d 45 fc                        lea      eax, [ebp - 4]
  10017467:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001746E:  50                              push     eax
  1001746F:  8d 41 04                        lea      eax, [ecx + 4]
  10017472:  f7 d9                           neg      ecx
  10017474:  6a 00                           push     0
  10017476:  1b c9                           sbb      ecx, ecx
  10017478:  23 c8                           and      ecx, eax
  1001747A:  6a 58                           push     0x58
  1001747C:  51                              push     ecx
  1001747D:  e8 9e 0a 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10017482:  83 c4 10                        add      esp, 0x10
  10017485:  83 7d fc 01                     cmp      dword ptr [ebp - 4], 1
  10017489:  0f 94 c0                        sete     al
  1001748C:  8b e5                           mov      esp, ebp
  1001748E:  5d                              pop      ebp
  1001748F:  c3                              ret      


; === EditableTextFrame::IsReadOnly ===
; RVA: 0x00017490  Size: 32 bytes
; Exports: ?IsReadOnly@EditableTextFrame@GW@@QAE_NXZ
;
  10017490:  55                              push     ebp
  10017491:  8b ec                           mov      ebp, esp
  10017493:  51                              push     ecx
  10017494:  6a 00                           push     0
  10017496:  8d 45 ff                        lea      eax, [ebp - 1]
  10017499:  c6 45 ff 00                     mov      byte ptr [ebp - 1], 0
  1001749D:  50                              push     eax
  1001749E:  6a 56                           push     0x56
  100174A0:  51                              push     ecx
  100174A1:  e8 7a 0a 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  100174A6:  8a 45 ff                        mov      al, byte ptr [ebp - 1]
  100174A9:  83 c4 10                        add      esp, 0x10
  100174AC:  8b e5                           mov      esp, ebp
  100174AE:  5d                              pop      ebp
  100174AF:  c3                              ret      


; === ButtonFrame::MouseAction ===
; RVA: 0x000174B0  Size: 177 bytes
; Exports: ?MouseAction@ButtonFrame@GW@@QAE_NW4ActionState@UIPacket@UI@2@@Z
;
  100174B0:  55                              push     ebp
  100174B1:  8b ec                           mov      ebp, esp
  100174B3:  83 ec 24                        sub      esp, 0x24
  100174B6:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  100174BB:  33 c5                           xor      eax, ebp
  100174BD:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  100174C0:  56                              push     esi
  100174C1:  8b f1                           mov      esi, ecx
  100174C3:  8b 86 8c 01 00 00               mov      eax, dword ptr [esi + 0x18c]
  100174C9:  25 14 02 00 00                  and      eax, 0x214
  100174CE:  83 f8 04                        cmp      eax, 4
  100174D1:  75 7b                           jne      0x1001754e
  100174D3:  56                              push     esi
  100174D4:  e8 37 f4 00 00                  call     0x10026910  ; UI::GetParentFrame, GetParentFrame
  100174D9:  8b d0                           mov      edx, eax
  100174DB:  83 c4 04                        add      esp, 4
  100174DE:  85 d2                           test     edx, edx
  100174E0:  74 6c                           je       0x1001754e
  100174E2:  8b 8a 8c 01 00 00               mov      ecx, dword ptr [edx + 0x18c]
  100174E8:  c1 e9 02                        shr      ecx, 2
  100174EB:  f6 c1 01                        test     cl, 1
  100174EE:  74 5e                           je       0x1001754e
  100174F0:  8b 86 bc 00 00 00               mov      eax, dword ptr [esi + 0xbc]
  100174F6:  89 45 dc                        mov      dword ptr [ebp - 0x24], eax
  100174F9:  8b 86 b8 00 00 00               mov      eax, dword ptr [esi + 0xb8]
  100174FF:  89 45 e0                        mov      dword ptr [ebp - 0x20], eax
  10017502:  8b 86 c4 01 00 00               mov      eax, dword ptr [esi + 0x1c4]
  10017508:  89 45 f4                        mov      dword ptr [ebp - 0xc], eax
  1001750B:  8d 45 f0                        lea      eax, [ebp - 0x10]
  1001750E:  89 45 e8                        mov      dword ptr [ebp - 0x18], eax
  10017511:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10017514:  89 45 e4                        mov      dword ptr [ebp - 0x1c], eax
  10017517:  8d 45 dc                        lea      eax, [ebp - 0x24]
  1001751A:  6a 00                           push     0
  1001751C:  50                              push     eax
  1001751D:  6a 31                           push     0x31
  1001751F:  52                              push     edx
  10017520:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  10017527:  c7 45 f0 00 00 00 00            mov      dword ptr [ebp - 0x10], 0
  1001752E:  c7 45 f8 00 00 00 00            mov      dword ptr [ebp - 8], 0
  10017535:  e8 e6 09 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  1001753A:  83 c4 10                        add      esp, 0x10
  1001753D:  5e                              pop      esi
  1001753E:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10017541:  33 cd                           xor      ecx, ebp
  10017543:  e8 6f 4e 01 00                  call     0x1002c3b7
  10017548:  8b e5                           mov      esp, ebp
  1001754A:  5d                              pop      ebp
  1001754B:  c2 04 00                        ret      4
  1001754E:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10017551:  32 c0                           xor      al, al
  10017553:  33 cd                           xor      ecx, ebp
  10017555:  5e                              pop      esi
  10017556:  e8 5c 4e 01 00                  call     0x1002c3b7
  1001755B:  8b e5                           mov      esp, ebp
  1001755D:  5d                              pop      ebp
  1001755E:  c2 04 00                        ret      4


; === TabsFrame::RemoveTab ===
; RVA: 0x000175A0  Size: 110 bytes
; Exports: ?RemoveTab@TabsFrame@GW@@QAE_NI@Z
;
  100175A0:  55                              push     ebp
  100175A1:  8b ec                           mov      ebp, esp
  100175A3:  56                              push     esi
  100175A4:  57                              push     edi
  100175A5:  ff 75 08                        push     dword ptr [ebp + 8]
  100175A8:  8b f9                           mov      edi, ecx
  100175AA:  57                              push     edi
  100175AB:  e8 40 ee 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  100175B0:  8b f0                           mov      esi, eax
  100175B2:  83 c4 08                        add      esp, 8
  100175B5:  85 f6                           test     esi, esi
  100175B7:  74 29                           je       0x100175e2
  100175B9:  ff b6 b8 00 00 00               push     dword ptr [esi + 0xb8]
  100175BF:  57                              push     edi
  100175C0:  e8 2b ee 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  100175C5:  83 c4 08                        add      esp, 8
  100175C8:  3b c6                           cmp      eax, esi
  100175CA:  75 16                           jne      0x100175e2
  100175CC:  8b 86 b8 00 00 00               mov      eax, dword ptr [esi + 0xb8]
  100175D2:  f7 d0                           not      eax
  100175D4:  50                              push     eax
  100175D5:  57                              push     edi
  100175D6:  e8 15 ee 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  100175DB:  83 c4 08                        add      esp, 8
  100175DE:  8b f8                           mov      edi, eax
  100175E0:  eb 02                           jmp      0x100175e4
  100175E2:  33 ff                           xor      edi, edi
  100175E4:  56                              push     esi
  100175E5:  e8 b6 ea 00 00                  call     0x100260a0  ; UI::DestroyUIComponent
  100175EA:  83 c4 04                        add      esp, 4
  100175ED:  84 c0                           test     al, al
  100175EF:  74 15                           je       0x10017606
  100175F1:  57                              push     edi
  100175F2:  e8 a9 ea 00 00                  call     0x100260a0  ; UI::DestroyUIComponent
  100175F7:  83 c4 04                        add      esp, 4
  100175FA:  84 c0                           test     al, al
  100175FC:  74 08                           je       0x10017606
  100175FE:  5f                              pop      edi
  100175FF:  b0 01                           mov      al, 1
  10017601:  5e                              pop      esi
  10017602:  5d                              pop      ebp
  10017603:  c2 04 00                        ret      4
  10017606:  5f                              pop      edi
  10017607:  32 c0                           xor      al, al
  10017609:  5e                              pop      esi
  1001760A:  5d                              pop      ebp
  1001760B:  c2 04 00                        ret      4


; === DropdownFrame::SelectIndex ===
; RVA: 0x00017610  Size: 142 bytes
; Exports: ?SelectIndex@DropdownFrame@GW@@QAE_NI@Z
;
  10017610:  55                              push     ebp
  10017611:  8b ec                           mov      ebp, esp
  10017613:  83 ec 14                        sub      esp, 0x14
  10017616:  53                              push     ebx
  10017617:  56                              push     esi
  10017618:  8b d9                           mov      ebx, ecx
  1001761A:  8b f3                           mov      esi, ebx
  1001761C:  f7 de                           neg      esi
  1001761E:  57                              push     edi
  1001761F:  8d 43 04                        lea      eax, [ebx + 4]
  10017622:  1b f6                           sbb      esi, esi
  10017624:  23 f0                           and      esi, eax
  10017626:  56                              push     esi
  10017627:  e8 b4 f1 00 00                  call     0x100267e0  ; UI::GetFrameContext
  1001762C:  83 c4 04                        add      esp, 4
  1001762F:  85 c0                           test     eax, eax
  10017631:  74 60                           je       0x10017693
  10017633:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  10017636:  3b 78 08                        cmp      edi, dword ptr [eax + 8]
  10017639:  73 58                           jae      0x10017693
  1001763B:  6a 00                           push     0
  1001763D:  57                              push     edi
  1001763E:  6a 61                           push     0x61
  10017640:  56                              push     esi
  10017641:  e8 da 08 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10017646:  83 c4 10                        add      esp, 0x10
  10017649:  84 c0                           test     al, al
  1001764B:  74 46                           je       0x10017693
  1001764D:  8b 83 c0 00 00 00               mov      eax, dword ptr [ebx + 0xc0]
  10017653:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  10017656:  8b 83 bc 00 00 00               mov      eax, dword ptr [ebx + 0xbc]
  1001765C:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  1001765F:  8d 45 ec                        lea      eax, [ebp - 0x14]
  10017662:  6a 00                           push     0
  10017664:  50                              push     eax
  10017665:  6a 31                           push     0x31
  10017667:  56                              push     esi
  10017668:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001766F:  c7 45 f4 07 00 00 00            mov      dword ptr [ebp - 0xc], 7
  10017676:  89 7d f8                        mov      dword ptr [ebp - 8], edi
  10017679:  e8 92 f2 00 00                  call     0x10026910  ; UI::GetParentFrame, GetParentFrame
  1001767E:  83 c4 04                        add      esp, 4
  10017681:  50                              push     eax
  10017682:  e8 99 08 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10017687:  83 c4 10                        add      esp, 0x10
  1001768A:  5f                              pop      edi
  1001768B:  5e                              pop      esi
  1001768C:  5b                              pop      ebx
  1001768D:  8b e5                           mov      esp, ebp
  1001768F:  5d                              pop      ebp
  10017690:  c2 04 00                        ret      4
  10017693:  5f                              pop      edi
  10017694:  5e                              pop      esi
  10017695:  32 c0                           xor      al, al
  10017697:  5b                              pop      ebx
  10017698:  8b e5                           mov      esp, ebp
  1001769A:  5d                              pop      ebp
  1001769B:  c2 04 00                        ret      4


; === DropdownFrame::SelectOption, DropdownFrame::SetValue ===
; RVA: 0x000176A0  Size: 117 bytes
; Exports: ?SelectOption@DropdownFrame@GW@@QAE_NI@Z, ?SetValue@DropdownFrame@GW@@UAE_NI@Z
;
  100176A0:  55                              push     ebp
  100176A1:  8b ec                           mov      ebp, esp
  100176A3:  56                              push     esi
  100176A4:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  100176A7:  57                              push     edi
  100176A8:  8b f9                           mov      edi, ecx
  100176AA:  89 75 08                        mov      dword ptr [ebp + 8], esi
  100176AD:  8b d7                           mov      edx, edi
  100176AF:  f7 da                           neg      edx
  100176B1:  8d 47 04                        lea      eax, [edi + 4]
  100176B4:  1b d2                           sbb      edx, edx
  100176B6:  23 d0                           and      edx, eax
  100176B8:  52                              push     edx
  100176B9:  e8 22 f1 00 00                  call     0x100267e0  ; UI::GetFrameContext
  100176BE:  83 c4 04                        add      esp, 4
  100176C1:  85 c0                           test     eax, eax
  100176C3:  74 42                           je       0x10017707
  100176C5:  8b 08                           mov      ecx, dword ptr [eax]
  100176C7:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  100176CA:  c1 e0 05                        shl      eax, 5
  100176CD:  03 c1                           add      eax, ecx
  100176CF:  3b c8                           cmp      ecx, eax
  100176D1:  74 34                           je       0x10017707
  100176D3:  83 79 08 00                     cmp      dword ptr [ecx + 8], 0
  100176D7:  75 15                           jne      0x100176ee
  100176D9:  83 c1 20                        add      ecx, 0x20
  100176DC:  3b c8                           cmp      ecx, eax
  100176DE:  75 f3                           jne      0x100176d3
  100176E0:  56                              push     esi
  100176E1:  8b cf                           mov      ecx, edi
  100176E3:  e8 28 ff ff ff                  call     0x10017610  ; DropdownFrame::SelectIndex
  100176E8:  5f                              pop      edi
  100176E9:  5e                              pop      esi
  100176EA:  5d                              pop      ebp
  100176EB:  c2 04 00                        ret      4
  100176EE:  8d 45 08                        lea      eax, [ebp + 8]
  100176F1:  8b cf                           mov      ecx, edi
  100176F3:  50                              push     eax
  100176F4:  56                              push     esi
  100176F5:  e8 96 f6 ff ff                  call     0x10016d90  ; DropdownFrame::GetOptionIndex
  100176FA:  84 c0                           test     al, al
  100176FC:  75 06                           jne      0x10017704
  100176FE:  5f                              pop      edi
  100176FF:  5e                              pop      esi
  10017700:  5d                              pop      ebp
  10017701:  c2 04 00                        ret      4
  10017704:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10017707:  56                              push     esi
  10017708:  8b cf                           mov      ecx, edi
  1001770A:  e8 01 ff ff ff                  call     0x10017610  ; DropdownFrame::SelectIndex
  1001770F:  5f                              pop      edi
  10017710:  5e                              pop      esi
  10017711:  5d                              pop      ebp
  10017712:  c2 04 00                        ret      4


; === CheckboxFrame::SetChecked ===
; RVA: 0x00017720  Size: 91 bytes
; Exports: ?SetChecked@CheckboxFrame@GW@@QAE_N_N@Z
;
  10017720:  55                              push     ebp
  10017721:  8b ec                           mov      ebp, esp
  10017723:  51                              push     ecx
  10017724:  56                              push     esi
  10017725:  8b f1                           mov      esi, ecx
  10017727:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001772E:  8d 46 04                        lea      eax, [esi + 4]
  10017731:  f7 de                           neg      esi
  10017733:  1b f6                           sbb      esi, esi
  10017735:  23 f0                           and      esi, eax
  10017737:  8d 45 fc                        lea      eax, [ebp - 4]
  1001773A:  50                              push     eax
  1001773B:  6a 00                           push     0
  1001773D:  6a 58                           push     0x58
  1001773F:  56                              push     esi
  10017740:  e8 db 07 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10017745:  8a 4d 08                        mov      cl, byte ptr [ebp + 8]
  10017748:  83 c4 10                        add      esp, 0x10
  1001774B:  83 7d fc 01                     cmp      dword ptr [ebp - 4], 1
  1001774F:  0f 94 c0                        sete     al
  10017752:  3a c1                           cmp      al, cl
  10017754:  74 1c                           je       0x10017772
  10017756:  6a 00                           push     0
  10017758:  0f b6 c1                        movzx    eax, cl
  1001775B:  50                              push     eax
  1001775C:  6a 57                           push     0x57
  1001775E:  56                              push     esi
  1001775F:  e8 bc 07 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10017764:  83 c4 10                        add      esp, 0x10
  10017767:  84 c0                           test     al, al
  10017769:  75 07                           jne      0x10017772
  1001776B:  5e                              pop      esi
  1001776C:  8b e5                           mov      esp, ebp
  1001776E:  5d                              pop      ebp
  1001776F:  c2 04 00                        ret      4
  10017772:  b0 01                           mov      al, 1
  10017774:  5e                              pop      esi
  10017775:  8b e5                           mov      esp, ebp
  10017777:  5d                              pop      ebp
  10017778:  c2 04 00                        ret      4


; === ProgressBar::SetColorId ===
; RVA: 0x00017780  Size: 50 bytes
; Exports: ?SetColorId@ProgressBar@GW@@QAE_NI@Z
;
  10017780:  55                              push     ebp
  10017781:  8b ec                           mov      ebp, esp
  10017783:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10017786:  83 f8 08                        cmp      eax, 8
  10017789:  77 21                           ja       0x100177ac
  1001778B:  6a 00                           push     0
  1001778D:  50                              push     eax
  1001778E:  8d 41 04                        lea      eax, [ecx + 4]
  10017791:  f7 d9                           neg      ecx
  10017793:  6a 65                           push     0x65
  10017795:  1b c9                           sbb      ecx, ecx
  10017797:  23 c8                           and      ecx, eax
  10017799:  51                              push     ecx
  1001779A:  e8 81 07 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  1001779F:  83 c4 10                        add      esp, 0x10
  100177A2:  84 c0                           test     al, al
  100177A4:  74 06                           je       0x100177ac
  100177A6:  b0 01                           mov      al, 1
  100177A8:  5d                              pop      ebp
  100177A9:  c2 04 00                        ret      4
  100177AC:  32 c0                           xor      al, al
  100177AE:  5d                              pop      ebp
  100177AF:  c2 04 00                        ret      4


; === TextLabelFrame::SetFont ===
; RVA: 0x000177C0  Size: 56 bytes
; Exports: ?SetFont@TextLabelFrame@GW@@QAE_NI@Z
;
  100177C0:  55                              push     ebp
  100177C1:  8b ec                           mov      ebp, esp
  100177C3:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100177C6:  39 81 94 01 00 00               cmp      dword ptr [ecx + 0x194], eax
  100177CC:  75 06                           jne      0x100177d4
  100177CE:  b0 01                           mov      al, 1
  100177D0:  5d                              pop      ebp
  100177D1:  c2 04 00                        ret      4
  100177D4:  83 f8 0f                        cmp      eax, 0xf
  100177D7:  72 06                           jb       0x100177df
  100177D9:  32 c0                           xor      al, al
  100177DB:  5d                              pop      ebp
  100177DC:  c2 04 00                        ret      4
  100177DF:  6a 00                           push     0
  100177E1:  6a 00                           push     0
  100177E3:  6a 39                           push     0x39
  100177E5:  51                              push     ecx
  100177E6:  89 81 94 01 00 00               mov      dword ptr [ecx + 0x194], eax
  100177EC:  e8 2f 07 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  100177F1:  83 c4 10                        add      esp, 0x10
  100177F4:  5d                              pop      ebp
  100177F5:  c2 04 00                        ret      4


; === ButtonFrame::SetLabel, TextLabelFrame::SetLabel ===
; RVA: 0x00017840  Size: 40 bytes
; Exports: ?SetLabel@ButtonFrame@GW@@QAE_NPB_W@Z, ?SetLabel@TextLabelFrame@GW@@QAE_NPB_W@Z
;
  10017840:  55                              push     ebp
  10017841:  8b ec                           mov      ebp, esp
  10017843:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10017846:  85 c0                           test     eax, eax
  10017848:  74 18                           je       0x10017862
  1001784A:  6a 00                           push     0
  1001784C:  50                              push     eax
  1001784D:  6a 5c                           push     0x5c
  1001784F:  51                              push     ecx
  10017850:  e8 cb 06 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10017855:  83 c4 10                        add      esp, 0x10
  10017858:  84 c0                           test     al, al
  1001785A:  74 06                           je       0x10017862
  1001785C:  b0 01                           mov      al, 1
  1001785E:  5d                              pop      ebp
  1001785F:  c2 04 00                        ret      4
  10017862:  32 c0                           xor      al, al
  10017864:  5d                              pop      ebp
  10017865:  c2 04 00                        ret      4


; === ProgressBar::SetMax ===
; RVA: 0x000178A0  Size: 32 bytes
; Exports: ?SetMax@ProgressBar@GW@@QAE_NI@Z
;
  100178A0:  55                              push     ebp
  100178A1:  8b ec                           mov      ebp, esp
  100178A3:  8d 41 04                        lea      eax, [ecx + 4]
  100178A6:  f7 d9                           neg      ecx
  100178A8:  6a 00                           push     0
  100178AA:  ff 75 08                        push     dword ptr [ebp + 8]
  100178AD:  1b c9                           sbb      ecx, ecx
  100178AF:  23 c8                           and      ecx, eax
  100178B1:  6a 5a                           push     0x5a
  100178B3:  51                              push     ecx
  100178B4:  e8 67 06 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  100178B9:  83 c4 10                        add      esp, 0x10
  100178BC:  5d                              pop      ebp
  100178BD:  c2 04 00                        ret      4


; === EditableTextFrame::SetMaxLength ===
; RVA: 0x000178C0  Size: 40 bytes
; Exports: ?SetMaxLength@EditableTextFrame@GW@@QAE_NI@Z
;
  100178C0:  55                              push     ebp
  100178C1:  8b ec                           mov      ebp, esp
  100178C3:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100178C6:  85 c0                           test     eax, eax
  100178C8:  74 18                           je       0x100178e2
  100178CA:  6a 00                           push     0
  100178CC:  50                              push     eax
  100178CD:  6a 5a                           push     0x5a
  100178CF:  51                              push     ecx
  100178D0:  e8 4b 06 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  100178D5:  83 c4 10                        add      esp, 0x10
  100178D8:  84 c0                           test     al, al
  100178DA:  74 06                           je       0x100178e2
  100178DC:  b0 01                           mov      al, 1
  100178DE:  5d                              pop      ebp
  100178DF:  c2 04 00                        ret      4
  100178E2:  32 c0                           xor      al, al
  100178E4:  5d                              pop      ebp
  100178E5:  c2 04 00                        ret      4


; === ScrollableFrame::SetPage ===
; RVA: 0x000178F0  Size: 46 bytes
; Exports: ?SetPage@ScrollableFrame@GW@@QAEPAUFrame@UI@2@PAUScrollablePageContext@12@@Z
;
  100178F0:  55                              push     ebp
  100178F1:  8b ec                           mov      ebp, esp
  100178F3:  56                              push     esi
  100178F4:  6a 00                           push     0
  100178F6:  ff 75 08                        push     dword ptr [ebp + 8]
  100178F9:  8b f1                           mov      esi, ecx
  100178FB:  68 f5 ff ff 7f                  push     0x7ffffff5
  10017900:  56                              push     esi
  10017901:  e8 1a 06 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10017906:  6a 00                           push     0
  10017908:  56                              push     esi
  10017909:  e8 e2 ea 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1001790E:  6a 00                           push     0
  10017910:  50                              push     eax
  10017911:  e8 da ea 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  10017916:  83 c4 20                        add      esp, 0x20
  10017919:  5e                              pop      esi
  1001791A:  5d                              pop      ebp
  1001791B:  c2 04 00                        ret      4


; === EditableTextFrame::SetReadOnly ===
; RVA: 0x00017920  Size: 25 bytes
; Exports: ?SetReadOnly@EditableTextFrame@GW@@QAE_N_N@Z
;
  10017920:  55                              push     ebp
  10017921:  8b ec                           mov      ebp, esp
  10017923:  0f b6 45 08                     movzx    eax, byte ptr [ebp + 8]
  10017927:  6a 00                           push     0
  10017929:  50                              push     eax
  1001792A:  6a 5b                           push     0x5b
  1001792C:  51                              push     ecx
  1001792D:  e8 ee 05 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10017932:  83 c4 10                        add      esp, 0x10
  10017935:  5d                              pop      ebp
  10017936:  c2 04 00                        ret      4


; === ScrollableFrame::SetSortHandler ===
; RVA: 0x00017940  Size: 23 bytes
; Exports: ?SetSortHandler@ScrollableFrame@GW@@QAE_NP6AHII@Z@Z
;
  10017940:  55                              push     ebp
  10017941:  8b ec                           mov      ebp, esp
  10017943:  6a 00                           push     0
  10017945:  ff 75 08                        push     dword ptr [ebp + 8]
  10017948:  6a 64                           push     0x64
  1001794A:  51                              push     ecx
  1001794B:  e8 d0 05 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10017950:  83 c4 10                        add      esp, 0x10
  10017953:  5d                              pop      ebp
  10017954:  c2 04 00                        ret      4


; === ProgressBar::SetStyle ===
; RVA: 0x00017960  Size: 70 bytes
; Exports: ?SetStyle@ProgressBar@GW@@QAE_NW4ProgressBarStyle@12@@Z
;
  10017960:  55                              push     ebp
  10017961:  8b ec                           mov      ebp, esp
  10017963:  83 7d 08 07                     cmp      dword ptr [ebp + 8], 7
  10017967:  56                              push     esi
  10017968:  8b f1                           mov      esi, ecx
  1001796A:  76 1c                           jbe      0x10017988
  1001796C:  68 d4 20 05 10                  push     0x100520d4  ; "GW::ProgressBar::SetStyle"
  10017971:  68 a0 02 00 00                  push     0x2a0
  10017976:  68 f0 20 05 10                  push     0x100520f0  ; "C:\GitRepositories\GWCA\Source\Frame.cpp"
  1001797B:  68 20 21 05 10                  push     0x10052120  ; "style >= ProgressBarStyle::kPeach && style <= ProgressBar..."
  10017980:  e8 eb de fe ff                  call     0x10005870  ; GW::FatalAssert
  10017985:  83 c4 10                        add      esp, 0x10
  10017988:  8d 46 04                        lea      eax, [esi + 4]
  1001798B:  f7 de                           neg      esi
  1001798D:  6a 00                           push     0
  1001798F:  ff 75 08                        push     dword ptr [ebp + 8]
  10017992:  1b f6                           sbb      esi, esi
  10017994:  23 f0                           and      esi, eax
  10017996:  6a 64                           push     0x64
  10017998:  56                              push     esi
  10017999:  e8 82 05 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  1001799E:  83 c4 10                        add      esp, 0x10
  100179A1:  5e                              pop      esi
  100179A2:  5d                              pop      ebp
  100179A3:  c2 04 00                        ret      4


; === CheckboxFrame::SetValue ===
; RVA: 0x000179B0  Size: 93 bytes
; Exports: ?SetValue@CheckboxFrame@GW@@UAE_NI@Z
;
  100179B0:  55                              push     ebp
  100179B1:  8b ec                           mov      ebp, esp
  100179B3:  83 7d 08 00                     cmp      dword ptr [ebp + 8], 0
  100179B7:  53                              push     ebx
  100179B8:  56                              push     esi
  100179B9:  8b f1                           mov      esi, ecx
  100179BB:  c7 45 08 00 00 00 00            mov      dword ptr [ebp + 8], 0
  100179C2:  0f 95 c3                        setne    bl
  100179C5:  8d 46 04                        lea      eax, [esi + 4]
  100179C8:  f7 de                           neg      esi
  100179CA:  1b f6                           sbb      esi, esi
  100179CC:  23 f0                           and      esi, eax
  100179CE:  8d 45 08                        lea      eax, [ebp + 8]
  100179D1:  50                              push     eax
  100179D2:  6a 00                           push     0
  100179D4:  6a 58                           push     0x58
  100179D6:  56                              push     esi
  100179D7:  e8 44 05 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  100179DC:  83 c4 10                        add      esp, 0x10
  100179DF:  83 7d 08 01                     cmp      dword ptr [ebp + 8], 1
  100179E3:  0f 94 c0                        sete     al
  100179E6:  3a c3                           cmp      al, bl
  100179E8:  74 1b                           je       0x10017a05
  100179EA:  6a 00                           push     0
  100179EC:  0f b6 c3                        movzx    eax, bl
  100179EF:  50                              push     eax
  100179F0:  6a 57                           push     0x57
  100179F2:  56                              push     esi
  100179F3:  e8 28 05 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  100179F8:  83 c4 10                        add      esp, 0x10
  100179FB:  84 c0                           test     al, al
  100179FD:  75 06                           jne      0x10017a05
  100179FF:  5e                              pop      esi
  10017A00:  5b                              pop      ebx
  10017A01:  5d                              pop      ebp
  10017A02:  c2 04 00                        ret      4
  10017A05:  5e                              pop      esi
  10017A06:  b0 01                           mov      al, 1
  10017A08:  5b                              pop      ebx
  10017A09:  5d                              pop      ebp
  10017A0A:  c2 04 00                        ret      4


; === EditableTextFrame::SetValue ===
; RVA: 0x00017A10  Size: 114 bytes
; Exports: ?SetValue@EditableTextFrame@GW@@QAE_NPB_W@Z
;
  10017A10:  55                              push     ebp
  10017A11:  8b ec                           mov      ebp, esp
  10017A13:  83 ec 14                        sub      esp, 0x14
  10017A16:  56                              push     esi
  10017A17:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10017A1A:  57                              push     edi
  10017A1B:  8b f9                           mov      edi, ecx
  10017A1D:  85 f6                           test     esi, esi
  10017A1F:  74 57                           je       0x10017a78
  10017A21:  6a 00                           push     0
  10017A23:  56                              push     esi
  10017A24:  6a 5e                           push     0x5e
  10017A26:  57                              push     edi
  10017A27:  e8 f4 04 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10017A2C:  83 c4 10                        add      esp, 0x10
  10017A2F:  84 c0                           test     al, al
  10017A31:  74 45                           je       0x10017a78
  10017A33:  8b 87 bc 00 00 00               mov      eax, dword ptr [edi + 0xbc]
  10017A39:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  10017A3C:  8b 87 b8 00 00 00               mov      eax, dword ptr [edi + 0xb8]
  10017A42:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  10017A45:  8d 45 ec                        lea      eax, [ebp - 0x14]
  10017A48:  6a 00                           push     0
  10017A4A:  50                              push     eax
  10017A4B:  6a 31                           push     0x31
  10017A4D:  57                              push     edi
  10017A4E:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10017A55:  c7 45 f4 07 00 00 00            mov      dword ptr [ebp - 0xc], 7
  10017A5C:  89 75 f8                        mov      dword ptr [ebp - 8], esi
  10017A5F:  e8 ac ee 00 00                  call     0x10026910  ; UI::GetParentFrame, GetParentFrame
  10017A64:  83 c4 04                        add      esp, 4
  10017A67:  50                              push     eax
  10017A68:  e8 b3 04 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10017A6D:  83 c4 10                        add      esp, 0x10
  10017A70:  5f                              pop      edi
  10017A71:  5e                              pop      esi
  10017A72:  8b e5                           mov      esp, ebp
  10017A74:  5d                              pop      ebp
  10017A75:  c2 04 00                        ret      4
  10017A78:  5f                              pop      edi
  10017A79:  32 c0                           xor      al, al
  10017A7B:  5e                              pop      esi
  10017A7C:  8b e5                           mov      esp, ebp
  10017A7E:  5d                              pop      ebp
  10017A7F:  c2 04 00                        ret      4


; === SliderFrame::SetValue ===
; RVA: 0x00017A90  Size: 153 bytes
; Exports: ?SetValue@SliderFrame@GW@@UAE_NI@Z
;
  10017A90:  55                              push     ebp
  10017A91:  8b ec                           mov      ebp, esp
  10017A93:  83 ec 14                        sub      esp, 0x14
  10017A96:  53                              push     ebx
  10017A97:  56                              push     esi
  10017A98:  57                              push     edi
  10017A99:  8b f9                           mov      edi, ecx
  10017A9B:  33 c9                           xor      ecx, ecx
  10017A9D:  85 ff                           test     edi, edi
  10017A9F:  8d 5f 04                        lea      ebx, [edi + 4]
  10017AA2:  8b c3                           mov      eax, ebx
  10017AA4:  0f 44 c1                        cmove    eax, ecx
  10017AA7:  50                              push     eax
  10017AA8:  e8 33 ed 00 00                  call     0x100267e0  ; UI::GetFrameContext
  10017AAD:  83 c4 04                        add      esp, 4
  10017AB0:  85 c0                           test     eax, eax
  10017AB2:  74 6a                           je       0x10017b1e
  10017AB4:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10017AB7:  3b 70 0c                        cmp      esi, dword ptr [eax + 0xc]
  10017ABA:  72 62                           jb       0x10017b1e
  10017ABC:  3b 70 10                        cmp      esi, dword ptr [eax + 0x10]
  10017ABF:  77 5d                           ja       0x10017b1e
  10017AC1:  6a 00                           push     0
  10017AC3:  33 c9                           xor      ecx, ecx
  10017AC5:  8b c3                           mov      eax, ebx
  10017AC7:  56                              push     esi
  10017AC8:  85 ff                           test     edi, edi
  10017ACA:  6a 57                           push     0x57
  10017ACC:  0f 44 c1                        cmove    eax, ecx
  10017ACF:  50                              push     eax
  10017AD0:  e8 4b 04 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10017AD5:  8b 87 c0 00 00 00               mov      eax, dword ptr [edi + 0xc0]
  10017ADB:  83 c4 10                        add      esp, 0x10
  10017ADE:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  10017AE1:  8b 87 bc 00 00 00               mov      eax, dword ptr [edi + 0xbc]
  10017AE7:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  10017AEA:  8d 45 ec                        lea      eax, [ebp - 0x14]
  10017AED:  6a 00                           push     0
  10017AEF:  50                              push     eax
  10017AF0:  6a 31                           push     0x31
  10017AF2:  53                              push     ebx
  10017AF3:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10017AFA:  c7 45 f4 07 00 00 00            mov      dword ptr [ebp - 0xc], 7
  10017B01:  89 75 f8                        mov      dword ptr [ebp - 8], esi
  10017B04:  e8 07 ee 00 00                  call     0x10026910  ; UI::GetParentFrame, GetParentFrame
  10017B09:  83 c4 04                        add      esp, 4
  10017B0C:  50                              push     eax
  10017B0D:  e8 0e 04 01 00                  call     0x10027f20  ; UI::SendFrameUIMessage
  10017B12:  83 c4 10                        add      esp, 0x10
  10017B15:  5f                              pop      edi
  10017B16:  5e                              pop      esi
  10017B17:  5b                              pop      ebx
  10017B18:  8b e5                           mov      esp, ebp
  10017B1A:  5d                              pop      ebp
  10017B1B:  c2 04 00                        ret      4
  10017B1E:  5f                              pop      edi
  10017B1F:  5e                              pop      esi
  10017B20:  32 c0                           xor      al, al
  10017B22:  5b                              pop      ebx
  10017B23:  8b e5                           mov      esp, ebp
  10017B25:  5d                              pop      ebp
  10017B26:  c2 04 00                        ret      4


; === FramePosition::GetBottomRightOnScreen ===
; RVA: 0x00026350  Size: 146 bytes
; Exports: ?GetBottomRightOnScreen@FramePosition@UI@GW@@QBE?AUVec2f@3@PBUFrame@23@@Z
;
  10026350:  55                              push     ebp
  10026351:  8b ec                           mov      ebp, esp
  10026353:  51                              push     ecx
  10026354:  56                              push     esi
  10026355:  8b f1                           mov      esi, ecx
  10026357:  e8 24 b2 ff ff                  call     0x10021580  ; Render::GetViewportWidth
  1002635C:  66 0f 6e c0                     movd     xmm0, eax
  10026360:  f3 0f e6 c0                     cvtdq2pd xmm0, xmm0
  10026364:  c1 e8 1f                        shr      eax, 0x1f
  10026367:  f2 0f 58 04 c5 c0 c5 04 10      addsd    xmm0, qword ptr [eax*8 + 0x1004c5c0]
  10026370:  66 0f 5a c0                     cvtpd2ps xmm0, xmm0
  10026374:  f3 0f 11 45 fc                  movss    dword ptr [ebp - 4], xmm0
  10026379:  e8 e2 b1 ff ff                  call     0x10021560  ; Render::GetViewportHeight
  1002637E:  f3 0f 10 4d fc                  movss    xmm1, dword ptr [ebp - 4]
  10026383:  66 0f 6e c0                     movd     xmm0, eax
  10026387:  f3 0f e6 c0                     cvtdq2pd xmm0, xmm0
  1002638B:  c1 e8 1f                        shr      eax, 0x1f
  1002638E:  f2 0f 58 04 c5 c0 c5 04 10      addsd    xmm0, qword ptr [eax*8 + 0x1004c5c0]
  10026397:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  1002639A:  66 0f 5a d0                     cvtpd2ps xmm2, xmm0
  1002639E:  85 c0                           test     eax, eax
  100263A0:  74 0f                           je       0x100263b1
  100263A2:  f3 0f 5e 88 04 01 00 00         divss    xmm1, dword ptr [eax + 0x104]
  100263AA:  05 08 01 00 00                  add      eax, 0x108
  100263AF:  eb 08                           jmp      0x100263b9
  100263B1:  f3 0f 5e 4e 2c                  divss    xmm1, dword ptr [esi + 0x2c]
  100263B6:  8d 46 30                        lea      eax, [esi + 0x30]
  100263B9:  f3 0f 5e 10                     divss    xmm2, dword ptr [eax]
  100263BD:  f3 0f 10 00                     movss    xmm0, dword ptr [eax]
  100263C1:  f3 0f 5c 46 38                  subss    xmm0, dword ptr [esi + 0x38]
  100263C6:  f3 0f 59 4e 3c                  mulss    xmm1, dword ptr [esi + 0x3c]
  100263CB:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100263CE:  5e                              pop      esi
  100263CF:  f3 0f 59 c2                     mulss    xmm0, xmm2
  100263D3:  f3 0f 11 08                     movss    dword ptr [eax], xmm1
  100263D7:  f3 0f 11 40 04                  movss    dword ptr [eax + 4], xmm0
  100263DC:  8b e5                           mov      esp, ebp
  100263DE:  5d                              pop      ebp
  100263DF:  c2 08 00                        ret      8


; === FramePosition::GetContentBottomRight ===
; RVA: 0x000265A0  Size: 146 bytes
; Exports: ?GetContentBottomRight@FramePosition@UI@GW@@QBE?AUVec2f@3@PBUFrame@23@@Z
;
  100265A0:  55                              push     ebp
  100265A1:  8b ec                           mov      ebp, esp
  100265A3:  51                              push     ecx
  100265A4:  56                              push     esi
  100265A5:  8b f1                           mov      esi, ecx
  100265A7:  e8 d4 af ff ff                  call     0x10021580  ; Render::GetViewportWidth
  100265AC:  66 0f 6e c0                     movd     xmm0, eax
  100265B0:  f3 0f e6 c0                     cvtdq2pd xmm0, xmm0
  100265B4:  c1 e8 1f                        shr      eax, 0x1f
  100265B7:  f2 0f 58 04 c5 c0 c5 04 10      addsd    xmm0, qword ptr [eax*8 + 0x1004c5c0]
  100265C0:  66 0f 5a c0                     cvtpd2ps xmm0, xmm0
  100265C4:  f3 0f 11 45 fc                  movss    dword ptr [ebp - 4], xmm0
  100265C9:  e8 92 af ff ff                  call     0x10021560  ; Render::GetViewportHeight
  100265CE:  f3 0f 10 4d fc                  movss    xmm1, dword ptr [ebp - 4]
  100265D3:  66 0f 6e c0                     movd     xmm0, eax
  100265D7:  f3 0f e6 c0                     cvtdq2pd xmm0, xmm0
  100265DB:  c1 e8 1f                        shr      eax, 0x1f
  100265DE:  f2 0f 58 04 c5 c0 c5 04 10      addsd    xmm0, qword ptr [eax*8 + 0x1004c5c0]
  100265E7:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  100265EA:  66 0f 5a d0                     cvtpd2ps xmm2, xmm0
  100265EE:  85 c0                           test     eax, eax
  100265F0:  74 0f                           je       0x10026601
  100265F2:  f3 0f 5e 88 04 01 00 00         divss    xmm1, dword ptr [eax + 0x104]
  100265FA:  05 08 01 00 00                  add      eax, 0x108
  100265FF:  eb 08                           jmp      0x10026609
  10026601:  f3 0f 5e 4e 2c                  divss    xmm1, dword ptr [esi + 0x2c]
  10026606:  8d 46 30                        lea      eax, [esi + 0x30]
  10026609:  f3 0f 5e 10                     divss    xmm2, dword ptr [eax]
  1002660D:  f3 0f 10 00                     movss    xmm0, dword ptr [eax]
  10026611:  f3 0f 5c 46 18                  subss    xmm0, dword ptr [esi + 0x18]
  10026616:  f3 0f 59 4e 1c                  mulss    xmm1, dword ptr [esi + 0x1c]
  1002661B:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1002661E:  5e                              pop      esi
  1002661F:  f3 0f 59 c2                     mulss    xmm0, xmm2
  10026623:  f3 0f 11 08                     movss    dword ptr [eax], xmm1
  10026627:  f3 0f 11 40 04                  movss    dword ptr [eax + 4], xmm0
  1002662C:  8b e5                           mov      esp, ebp
  1002662E:  5d                              pop      ebp
  1002662F:  c2 08 00                        ret      8


; === FramePosition::GetContentTopLeft ===
; RVA: 0x00026640  Size: 146 bytes
; Exports: ?GetContentTopLeft@FramePosition@UI@GW@@QBE?AUVec2f@3@PBUFrame@23@@Z
;
  10026640:  55                              push     ebp
  10026641:  8b ec                           mov      ebp, esp
  10026643:  51                              push     ecx
  10026644:  56                              push     esi
  10026645:  8b f1                           mov      esi, ecx
  10026647:  e8 34 af ff ff                  call     0x10021580  ; Render::GetViewportWidth
  1002664C:  66 0f 6e c0                     movd     xmm0, eax
  10026650:  f3 0f e6 c0                     cvtdq2pd xmm0, xmm0
  10026654:  c1 e8 1f                        shr      eax, 0x1f
  10026657:  f2 0f 58 04 c5 c0 c5 04 10      addsd    xmm0, qword ptr [eax*8 + 0x1004c5c0]
  10026660:  66 0f 5a c0                     cvtpd2ps xmm0, xmm0
  10026664:  f3 0f 11 45 fc                  movss    dword ptr [ebp - 4], xmm0
  10026669:  e8 f2 ae ff ff                  call     0x10021560  ; Render::GetViewportHeight
  1002666E:  f3 0f 10 4d fc                  movss    xmm1, dword ptr [ebp - 4]
  10026673:  66 0f 6e c0                     movd     xmm0, eax
  10026677:  f3 0f e6 c0                     cvtdq2pd xmm0, xmm0
  1002667B:  c1 e8 1f                        shr      eax, 0x1f
  1002667E:  f2 0f 58 04 c5 c0 c5 04 10      addsd    xmm0, qword ptr [eax*8 + 0x1004c5c0]
  10026687:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  1002668A:  66 0f 5a d0                     cvtpd2ps xmm2, xmm0
  1002668E:  85 c0                           test     eax, eax
  10026690:  74 0f                           je       0x100266a1
  10026692:  f3 0f 5e 88 04 01 00 00         divss    xmm1, dword ptr [eax + 0x104]
  1002669A:  05 08 01 00 00                  add      eax, 0x108
  1002669F:  eb 08                           jmp      0x100266a9
  100266A1:  f3 0f 5e 4e 2c                  divss    xmm1, dword ptr [esi + 0x2c]
  100266A6:  8d 46 30                        lea      eax, [esi + 0x30]
  100266A9:  f3 0f 5e 10                     divss    xmm2, dword ptr [eax]
  100266AD:  f3 0f 10 00                     movss    xmm0, dword ptr [eax]
  100266B1:  f3 0f 5c 46 20                  subss    xmm0, dword ptr [esi + 0x20]
  100266B6:  f3 0f 59 4e 14                  mulss    xmm1, dword ptr [esi + 0x14]
  100266BB:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100266BE:  5e                              pop      esi
  100266BF:  f3 0f 59 c2                     mulss    xmm0, xmm2
  100266C3:  f3 0f 11 08                     movss    dword ptr [eax], xmm1
  100266C7:  f3 0f 11 40 04                  movss    dword ptr [eax + 4], xmm0
  100266CC:  8b e5                           mov      esp, ebp
  100266CE:  5d                              pop      ebp
  100266CF:  c2 08 00                        ret      8


; === FrameRelation::GetFrame ===
; RVA: 0x00026700  Size: 7 bytes
; Exports: ?GetFrame@FrameRelation@UI@GW@@QAEPAUFrame@23@XZ
;
  10026700:  8d 81 d8 fe ff ff               lea      eax, [ecx - 0x128]
  10026706:  c3                              ret      


; === FrameRelation::GetParent ===
; RVA: 0x00026900  Size: 15 bytes
; Exports: ?GetParent@FrameRelation@UI@GW@@QBEPAUFrame@23@XZ
;
  10026900:  8b 01                           mov      eax, dword ptr [ecx]
  10026902:  8d 88 d8 fe ff ff               lea      ecx, [eax - 0x128]
  10026908:  f7 d8                           neg      eax
  1002690A:  1b c0                           sbb      eax, eax
  1002690C:  23 c1                           and      eax, ecx
  1002690E:  c3                              ret      


; === FramePosition::GetSizeOnScreen ===
; RVA: 0x00026A50  Size: 161 bytes
; Exports: ?GetSizeOnScreen@FramePosition@UI@GW@@QBE?AUVec2f@3@PBUFrame@23@@Z
;
  10026A50:  55                              push     ebp
  10026A51:  8b ec                           mov      ebp, esp
  10026A53:  51                              push     ecx
  10026A54:  56                              push     esi
  10026A55:  8b f1                           mov      esi, ecx
  10026A57:  e8 24 ab ff ff                  call     0x10021580  ; Render::GetViewportWidth
  10026A5C:  66 0f 6e c0                     movd     xmm0, eax
  10026A60:  f3 0f e6 c0                     cvtdq2pd xmm0, xmm0
  10026A64:  c1 e8 1f                        shr      eax, 0x1f
  10026A67:  f2 0f 58 04 c5 c0 c5 04 10      addsd    xmm0, qword ptr [eax*8 + 0x1004c5c0]
  10026A70:  66 0f 5a c0                     cvtpd2ps xmm0, xmm0
  10026A74:  f3 0f 11 45 fc                  movss    dword ptr [ebp - 4], xmm0
  10026A79:  e8 e2 aa ff ff                  call     0x10021560  ; Render::GetViewportHeight
  10026A7E:  f3 0f 10 4d fc                  movss    xmm1, dword ptr [ebp - 4]
  10026A83:  66 0f 6e c0                     movd     xmm0, eax
  10026A87:  f3 0f e6 c0                     cvtdq2pd xmm0, xmm0
  10026A8B:  c1 e8 1f                        shr      eax, 0x1f
  10026A8E:  f2 0f 58 04 c5 c0 c5 04 10      addsd    xmm0, qword ptr [eax*8 + 0x1004c5c0]
  10026A97:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10026A9A:  66 0f 5a d0                     cvtpd2ps xmm2, xmm0
  10026A9E:  85 c0                           test     eax, eax
  10026AA0:  74 12                           je       0x10026ab4
  10026AA2:  f3 0f 5e 88 04 01 00 00         divss    xmm1, dword ptr [eax + 0x104]
  10026AAA:  f3 0f 10 98 08 01 00 00         movss    xmm3, dword ptr [eax + 0x108]
  10026AB2:  eb 0a                           jmp      0x10026abe
  10026AB4:  f3 0f 5e 4e 2c                  divss    xmm1, dword ptr [esi + 0x2c]
  10026AB9:  f3 0f 10 5e 30                  movss    xmm3, dword ptr [esi + 0x30]
  10026ABE:  f3 0f 10 46 3c                  movss    xmm0, dword ptr [esi + 0x3c]
  10026AC3:  f3 0f 5c 46 34                  subss    xmm0, dword ptr [esi + 0x34]
  10026AC8:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10026ACB:  f3 0f 5e d3                     divss    xmm2, xmm3
  10026ACF:  f3 0f 59 c1                     mulss    xmm0, xmm1
  10026AD3:  f3 0f 11 00                     movss    dword ptr [eax], xmm0
  10026AD7:  f3 0f 10 46 40                  movss    xmm0, dword ptr [esi + 0x40]
  10026ADC:  f3 0f 5c 46 38                  subss    xmm0, dword ptr [esi + 0x38]
  10026AE1:  5e                              pop      esi
  10026AE2:  f3 0f 59 c2                     mulss    xmm0, xmm2
  10026AE6:  f3 0f 11 40 04                  movss    dword ptr [eax + 4], xmm0
  10026AEB:  8b e5                           mov      esp, ebp
  10026AED:  5d                              pop      ebp
  10026AEE:  c2 08 00                        ret      8


; === FramePosition::GetTopLeftOnScreen ===
; RVA: 0x00026B30  Size: 146 bytes
; Exports: ?GetTopLeftOnScreen@FramePosition@UI@GW@@QBE?AUVec2f@3@PBUFrame@23@@Z
;
  10026B30:  55                              push     ebp
  10026B31:  8b ec                           mov      ebp, esp
  10026B33:  51                              push     ecx
  10026B34:  56                              push     esi
  10026B35:  8b f1                           mov      esi, ecx
  10026B37:  e8 44 aa ff ff                  call     0x10021580  ; Render::GetViewportWidth
  10026B3C:  66 0f 6e c0                     movd     xmm0, eax
  10026B40:  f3 0f e6 c0                     cvtdq2pd xmm0, xmm0
  10026B44:  c1 e8 1f                        shr      eax, 0x1f
  10026B47:  f2 0f 58 04 c5 c0 c5 04 10      addsd    xmm0, qword ptr [eax*8 + 0x1004c5c0]
  10026B50:  66 0f 5a c0                     cvtpd2ps xmm0, xmm0
  10026B54:  f3 0f 11 45 fc                  movss    dword ptr [ebp - 4], xmm0
  10026B59:  e8 02 aa ff ff                  call     0x10021560  ; Render::GetViewportHeight
  10026B5E:  f3 0f 10 4d fc                  movss    xmm1, dword ptr [ebp - 4]
  10026B63:  66 0f 6e c0                     movd     xmm0, eax
  10026B67:  f3 0f e6 c0                     cvtdq2pd xmm0, xmm0
  10026B6B:  c1 e8 1f                        shr      eax, 0x1f
  10026B6E:  f2 0f 58 04 c5 c0 c5 04 10      addsd    xmm0, qword ptr [eax*8 + 0x1004c5c0]
  10026B77:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10026B7A:  66 0f 5a d0                     cvtpd2ps xmm2, xmm0
  10026B7E:  85 c0                           test     eax, eax
  10026B80:  74 0f                           je       0x10026b91
  10026B82:  f3 0f 5e 88 04 01 00 00         divss    xmm1, dword ptr [eax + 0x104]
  10026B8A:  05 08 01 00 00                  add      eax, 0x108
  10026B8F:  eb 08                           jmp      0x10026b99
  10026B91:  f3 0f 5e 4e 2c                  divss    xmm1, dword ptr [esi + 0x2c]
  10026B96:  8d 46 30                        lea      eax, [esi + 0x30]
  10026B99:  f3 0f 5e 10                     divss    xmm2, dword ptr [eax]
  10026B9D:  f3 0f 10 00                     movss    xmm0, dword ptr [eax]
  10026BA1:  f3 0f 5c 46 40                  subss    xmm0, dword ptr [esi + 0x40]
  10026BA6:  f3 0f 59 4e 34                  mulss    xmm1, dword ptr [esi + 0x34]
  10026BAB:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10026BAE:  5e                              pop      esi
  10026BAF:  f3 0f 59 c2                     mulss    xmm0, xmm2
  10026BB3:  f3 0f 11 08                     movss    dword ptr [eax], xmm1
  10026BB7:  f3 0f 11 40 04                  movss    dword ptr [eax + 4], xmm0
  10026BBC:  8b e5                           mov      esp, ebp
  10026BBE:  5d                              pop      ebp
  10026BBF:  c2 08 00                        ret      8


; === FramePosition::GetViewportScale ===
; RVA: 0x00026BD0  Size: 133 bytes
; Exports: ?GetViewportScale@FramePosition@UI@GW@@QBE?AUVec2f@3@PBUFrame@23@@Z
;
  10026BD0:  55                              push     ebp
  10026BD1:  8b ec                           mov      ebp, esp
  10026BD3:  51                              push     ecx
  10026BD4:  56                              push     esi
  10026BD5:  8b f1                           mov      esi, ecx
  10026BD7:  e8 a4 a9 ff ff                  call     0x10021580  ; Render::GetViewportWidth
  10026BDC:  66 0f 6e c0                     movd     xmm0, eax
  10026BE0:  f3 0f e6 c0                     cvtdq2pd xmm0, xmm0
  10026BE4:  c1 e8 1f                        shr      eax, 0x1f
  10026BE7:  f2 0f 58 04 c5 c0 c5 04 10      addsd    xmm0, qword ptr [eax*8 + 0x1004c5c0]
  10026BF0:  66 0f 5a c0                     cvtpd2ps xmm0, xmm0
  10026BF4:  f3 0f 11 45 fc                  movss    dword ptr [ebp - 4], xmm0
  10026BF9:  e8 62 a9 ff ff                  call     0x10021560  ; Render::GetViewportHeight
  10026BFE:  66 0f 6e c0                     movd     xmm0, eax
  10026C02:  f3 0f e6 c0                     cvtdq2pd xmm0, xmm0
  10026C06:  c1 e8 1f                        shr      eax, 0x1f
  10026C09:  f2 0f 58 04 c5 c0 c5 04 10      addsd    xmm0, qword ptr [eax*8 + 0x1004c5c0]
  10026C12:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10026C15:  66 0f 5a c8                     cvtpd2ps xmm1, xmm0
  10026C19:  f3 0f 10 45 fc                  movss    xmm0, dword ptr [ebp - 4]
  10026C1E:  85 c0                           test     eax, eax
  10026C20:  74 12                           je       0x10026c34
  10026C22:  f3 0f 5e 80 04 01 00 00         divss    xmm0, dword ptr [eax + 0x104]
  10026C2A:  f3 0f 10 90 08 01 00 00         movss    xmm2, dword ptr [eax + 0x108]
  10026C32:  eb 0a                           jmp      0x10026c3e
  10026C34:  f3 0f 5e 46 2c                  divss    xmm0, dword ptr [esi + 0x2c]
  10026C39:  f3 0f 10 56 30                  movss    xmm2, dword ptr [esi + 0x30]
  10026C3E:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10026C41:  f3 0f 5e ca                     divss    xmm1, xmm2
  10026C45:  5e                              pop      esi
  10026C46:  f3 0f 11 00                     movss    dword ptr [eax], xmm0
  10026C4A:  f3 0f 11 48 04                  movss    dword ptr [eax + 4], xmm1
  10026C4F:  8b e5                           mov      esp, ebp
  10026C51:  5d                              pop      ebp
  10026C52:  c2 08 00                        ret      8


