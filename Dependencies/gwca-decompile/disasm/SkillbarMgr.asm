; Module: SkillbarMgr
; Functions: 21
; Total code size: 5108 bytes
;

; === SkillbarMgr::ChangeSecondProfession ===
; RVA: 0x00022720  Size: 173 bytes
; Exports: ?ChangeSecondProfession@SkillbarMgr@GW@@YA_NIW4Profession@Constants@2@@Z
;
  10022720:  55                              push     ebp
  10022721:  8b ec                           mov      ebp, esp
  10022723:  83 ec 08                        sub      esp, 8
  10022726:  53                              push     ebx
  10022727:  57                              push     edi
  10022728:  68 94 3b 05 10                  push     0x10053b94
  1002272D:  e8 4e 40 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  10022732:  8b d8                           mov      ebx, eax
  10022734:  83 c4 04                        add      esp, 4
  10022737:  8b fb                           mov      edi, ebx
  10022739:  85 db                           test     ebx, ebx
  1002273B:  75 21                           jne      0x1002275e
  1002273D:  50                              push     eax
  1002273E:  68 8f 00 00 00                  push     0x8f
  10022743:  e8 18 46 00 00                  call     0x10026d60  ; UI::Keydown
  10022748:  68 94 3b 05 10                  push     0x10053b94
  1002274D:  e8 2e 40 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  10022752:  8b f8                           mov      edi, eax
  10022754:  53                              push     ebx
  10022755:  57                              push     edi
  10022756:  e8 15 5c 00 00                  call     0x10028370  ; UI::SetFrameVisible, SetFrameVisible
  1002275B:  83 c4 14                        add      esp, 0x14
  1002275E:  57                              push     edi
  1002275F:  e8 7c 40 00 00                  call     0x100267e0  ; UI::GetFrameContext
  10022764:  8b c8                           mov      ecx, eax
  10022766:  83 c4 04                        add      esp, 4
  10022769:  89 4d f8                        mov      dword ptr [ebp - 8], ecx
  1002276C:  85 c9                           test     ecx, ecx
  1002276E:  75 08                           jne      0x10022778
  10022770:  5f                              pop      edi
  10022771:  32 c0                           xor      al, al
  10022773:  5b                              pop      ebx
  10022774:  8b e5                           mov      esp, ebp
  10022776:  5d                              pop      ebp
  10022777:  c3                              ret      
  10022778:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1002277B:  56                              push     esi
  1002277C:  8b 71 04                        mov      esi, dword ptr [ecx + 4]
  1002277F:  6a 01                           push     1
  10022781:  57                              push     edi
  10022782:  89 41 04                        mov      dword ptr [ecx + 4], eax
  10022785:  e8 66 3c 00 00                  call     0x100263f0  ; UI::GetChildFrame, GetChildFrame
  1002278A:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  1002278D:  50                              push     eax
  1002278E:  e8 fd 55 00 00                  call     0x10027d90  ; UI::SelectDropdownOption, SelectDropdownOption
  10022793:  88 45 ff                        mov      byte ptr [ebp - 1], al
  10022796:  83 c4 10                        add      esp, 0x10
  10022799:  8b 45 f8                        mov      eax, dword ptr [ebp - 8]
  1002279C:  89 70 04                        mov      dword ptr [eax + 4], esi
  1002279F:  5e                              pop      esi
  100227A0:  85 db                           test     ebx, ebx
  100227A2:  75 20                           jne      0x100227c4
  100227A4:  68 94 3b 05 10                  push     0x10053b94
  100227A9:  e8 d2 3f 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  100227AE:  83 c4 04                        add      esp, 4
  100227B1:  85 c0                           test     eax, eax
  100227B3:  74 0f                           je       0x100227c4
  100227B5:  6a 00                           push     0
  100227B7:  68 8f 00 00 00                  push     0x8f
  100227BC:  e8 9f 45 00 00                  call     0x10026d60  ; UI::Keydown
  100227C1:  83 c4 08                        add      esp, 8
  100227C4:  8a 45 ff                        mov      al, byte ptr [ebp - 1]
  100227C7:  5f                              pop      edi
  100227C8:  5b                              pop      ebx
  100227C9:  8b e5                           mov      esp, ebp
  100227CB:  5d                              pop      ebp
  100227CC:  c3                              ret      


; === SkillbarMgr::DecodeSkillTemplate ===
; RVA: 0x000227D0  Size: 1216 bytes
; Exports: ?DecodeSkillTemplate@SkillbarMgr@GW@@YA_NAAUSkillTemplate@12@PBD@Z
;
  100227D0:  55                              push     ebp
  100227D1:  8b ec                           mov      ebp, esp
  100227D3:  81 ec 24 04 00 00               sub      esp, 0x424
  100227D9:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  100227DE:  33 c5                           xor      eax, ebp
  100227E0:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  100227E3:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100227E6:  53                              push     ebx
  100227E7:  8b 5d 0c                        mov      ebx, dword ptr [ebp + 0xc]
  100227EA:  56                              push     esi
  100227EB:  57                              push     edi
  100227EC:  68 8c 00 00 00                  push     0x8c
  100227F1:  6a 00                           push     0
  100227F3:  50                              push     eax
  100227F4:  89 85 ec fb ff ff               mov      dword ptr [ebp - 0x414], eax
  100227FA:  89 9d f0 fb ff ff               mov      dword ptr [ebp - 0x410], ebx
  10022800:  e8 ab b8 00 00                  call     0x1002e0b0
  10022805:  8b f3                           mov      esi, ebx
  10022807:  83 c4 0c                        add      esp, 0xc
  1002280A:  8d 4e 01                        lea      ecx, [esi + 1]
  1002280D:  0f 1f 00                        nop      dword ptr [eax]
  10022810:  8a 06                           mov      al, byte ptr [esi]
  10022812:  46                              inc      esi
  10022813:  84 c0                           test     al, al
  10022815:  75 f9                           jne      0x10022810
  10022817:  2b f1                           sub      esi, ecx
  10022819:  8d 04 76                        lea      eax, [esi + esi*2]
  1002281C:  03 c0                           add      eax, eax
  1002281E:  89 85 e8 fb ff ff               mov      dword ptr [ebp - 0x418], eax
  10022824:  3d 00 04 00 00                  cmp      eax, 0x400
  10022829:  72 1c                           jb       0x10022847
  1002282B:  68 f4 3a 05 10                  push     0x10053af4  ; "GW::SkillbarMgr::DecodeSkillTemplate"
  10022830:  68 35 01 00 00                  push     0x135
  10022835:  68 1c 3b 05 10                  push     0x10053b1c  ; "C:\GitRepositories\GWCA\Source\SkillbarMgr.cpp"
  1002283A:  68 4c 3b 05 10                  push     0x10053b4c  ; "(len * 6) < bufSize"
  1002283F:  e8 2c 30 fe ff                  call     0x10005870  ; GW::FatalAssert
  10022844:  83 c4 10                        add      esp, 0x10
  10022847:  33 ff                           xor      edi, edi
  10022849:  85 f6                           test     esi, esi
  1002284B:  74 58                           je       0x100228a5
  1002284D:  8d 95 fd fb ff ff               lea      edx, [ebp - 0x403]
  10022853:  0f be 04 3b                     movsx    eax, byte ptr [ebx + edi]
  10022857:  8a 80 30 3a 05 10               mov      al, byte ptr [eax + 0x10053a30]
  1002285D:  0f be c8                        movsx    ecx, al
  10022860:  83 f9 ff                        cmp      ecx, -1
  10022863:  0f 84 b3 00 00 00               je       0x1002291c
  10022869:  24 01                           and      al, 1
  1002286B:  47                              inc      edi
  1002286C:  88 42 ff                        mov      byte ptr [edx - 1], al
  1002286F:  8b c1                           mov      eax, ecx
  10022871:  d1 f8                           sar      eax, 1
  10022873:  24 01                           and      al, 1
  10022875:  88 02                           mov      byte ptr [edx], al
  10022877:  8b c1                           mov      eax, ecx
  10022879:  c1 f8 02                        sar      eax, 2
  1002287C:  24 01                           and      al, 1
  1002287E:  88 42 01                        mov      byte ptr [edx + 1], al
  10022881:  8b c1                           mov      eax, ecx
  10022883:  c1 f8 03                        sar      eax, 3
  10022886:  24 01                           and      al, 1
  10022888:  88 42 02                        mov      byte ptr [edx + 2], al
  1002288B:  8b c1                           mov      eax, ecx
  1002288D:  c1 f8 04                        sar      eax, 4
  10022890:  c1 f9 05                        sar      ecx, 5
  10022893:  24 01                           and      al, 1
  10022895:  80 e1 01                        and      cl, 1
  10022898:  88 42 03                        mov      byte ptr [edx + 3], al
  1002289B:  88 4a 04                        mov      byte ptr [edx + 4], cl
  1002289E:  83 c2 06                        add      edx, 6
  100228A1:  3b fe                           cmp      edi, esi
  100228A3:  72 ae                           jb       0x10022853
  100228A5:  8b 85 e8 fb ff ff               mov      eax, dword ptr [ebp - 0x418]
  100228AB:  8d 8d fc fb ff ff               lea      ecx, [ebp - 0x404]
  100228B1:  8b 3d 48 cb 08 10               mov      edi, dword ptr [0x1008cb48]
  100228B7:  8d 95 fc fb ff ff               lea      edx, [ebp - 0x404]
  100228BD:  0f 10 2d e0 3b 05 10            movups   xmm5, xmmword ptr [0x10053be0]
  100228C4:  03 c1                           add      eax, ecx
  100228C6:  33 f6                           xor      esi, esi
  100228C8:  33 c9                           xor      ecx, ecx
  100228CA:  89 85 dc fb ff ff               mov      dword ptr [ebp - 0x424], eax
  100228D0:  83 ff 05                        cmp      edi, 5
  100228D3:  7c 30                           jl       0x10022905
  100228D5:  66 0f 38 21 85 fc fb ff ff      pmovsxbd xmm0, dword ptr [ebp - 0x404]
  100228DE:  c4 e2 79 47 cd                  vpsllvd  xmm1, xmm0, xmm5
  100228E3:  0f 28 c1                        movaps   xmm0, xmm1
  100228E6:  8d 95 00 fc ff ff               lea      edx, [ebp - 0x400]
  100228EC:  66 0f 73 d8 08                  psrldq   xmm0, 8
  100228F1:  0f 56 c8                        orps     xmm1, xmm0
  100228F4:  0f 10 c1                        movups   xmm0, xmm1
  100228F7:  66 0f 73 d8 04                  psrldq   xmm0, 4
  100228FC:  0f 56 c8                        orps     xmm1, xmm0
  100228FF:  66 0f 7e ce                     movd     esi, xmm1
  10022903:  eb 0e                           jmp      0x10022913
  10022905:  0f be 02                        movsx    eax, byte ptr [edx]
  10022908:  42                              inc      edx
  10022909:  d3 e0                           shl      eax, cl
  1002290B:  41                              inc      ecx
  1002290C:  0b f0                           or       esi, eax
  1002290E:  83 f9 04                        cmp      ecx, 4
  10022911:  7c f2                           jl       0x10022905
  10022913:  85 f6                           test     esi, esi
  10022915:  74 18                           je       0x1002292f
  10022917:  83 fe 0e                        cmp      esi, 0xe
  1002291A:  74 18                           je       0x10022934
  1002291C:  5f                              pop      edi
  1002291D:  5e                              pop      esi
  1002291E:  32 c0                           xor      al, al
  10022920:  5b                              pop      ebx
  10022921:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10022924:  33 cd                           xor      ecx, ebp
  10022926:  e8 8c 9a 00 00                  call     0x1002c3b7
  1002292B:  8b e5                           mov      esp, ebp
  1002292D:  5d                              pop      ebp
  1002292E:  c3                              ret      
  1002292F:  83 fe 0e                        cmp      esi, 0xe
  10022932:  75 03                           jne      0x10022937
  10022934:  83 c2 04                        add      edx, 4
  10022937:  0f be 4a 01                     movsx    ecx, byte ptr [edx + 1]
  1002293B:  0f be 02                        movsx    eax, byte ptr [edx]
  1002293E:  03 c9                           add      ecx, ecx
  10022940:  0b c8                           or       ecx, eax
  10022942:  8d 42 02                        lea      eax, [edx + 2]
  10022945:  89 85 f4 fb ff ff               mov      dword ptr [ebp - 0x40c], eax
  1002294B:  8d 85 f4 fb ff ff               lea      eax, [ebp - 0x40c]
  10022951:  8d 34 4d 04 00 00 00            lea      esi, [ecx*2 + 4]
  10022958:  56                              push     esi
  10022959:  50                              push     eax
  1002295A:  e8 71 13 00 00                  call     0x10023cd0
  1002295F:  8a d8                           mov      bl, al
  10022961:  8d 85 f4 fb ff ff               lea      eax, [ebp - 0x40c]
  10022967:  56                              push     esi
  10022968:  50                              push     eax
  10022969:  88 9d fb fb ff ff               mov      byte ptr [ebp - 0x405], bl
  1002296F:  e8 5c 13 00 00                  call     0x10023cd0
  10022974:  83 c4 10                        add      esp, 0x10
  10022977:  88 85 fa fb ff ff               mov      byte ptr [ebp - 0x406], al
  1002297D:  84 db                           test     bl, bl
  1002297F:  74 9b                           je       0x1002291c
  10022981:  80 fb 0a                        cmp      bl, 0xa
  10022984:  77 96                           ja       0x1002291c
  10022986:  3c 0a                           cmp      al, 0xa
  10022988:  77 92                           ja       0x1002291c
  1002298A:  8b 85 f4 fb ff ff               mov      eax, dword ptr [ebp - 0x40c]
  10022990:  33 db                           xor      ebx, ebx
  10022992:  33 c9                           xor      ecx, ecx
  10022994:  8b d0                           mov      edx, eax
  10022996:  83 ff 05                        cmp      edi, 5
  10022999:  7c 29                           jl       0x100229c4
  1002299B:  66 0f 38 21 00                  pmovsxbd xmm0, dword ptr [eax]
  100229A0:  c4 e2 79 47 cd                  vpsllvd  xmm1, xmm0, xmm5
  100229A5:  0f 28 c1                        movaps   xmm0, xmm1
  100229A8:  83 c2 04                        add      edx, 4
  100229AB:  66 0f 73 d8 08                  psrldq   xmm0, 8
  100229B0:  0f 56 c8                        orps     xmm1, xmm0
  100229B3:  0f 10 c1                        movups   xmm0, xmm1
  100229B6:  66 0f 73 d8 04                  psrldq   xmm0, 4
  100229BB:  0f 56 c8                        orps     xmm1, xmm0
  100229BE:  66 0f 7e cb                     movd     ebx, xmm1
  100229C2:  eb 0e                           jmp      0x100229d2
  100229C4:  0f be 02                        movsx    eax, byte ptr [edx]
  100229C7:  42                              inc      edx
  100229C8:  d3 e0                           shl      eax, cl
  100229CA:  41                              inc      ecx
  100229CB:  0b d8                           or       ebx, eax
  100229CD:  83 f9 04                        cmp      ecx, 4
  100229D0:  7c f2                           jl       0x100229c4
  100229D2:  83 fb 0c                        cmp      ebx, 0xc
  100229D5:  72 32                           jb       0x10022a09
  100229D7:  ff b5 f0 fb ff ff               push     dword ptr [ebp - 0x410]
  100229DD:  53                              push     ebx
  100229DE:  68 60 3b 05 10                  push     0x10053b60
  100229E3:  6a 02                           push     2
  100229E5:  e8 e0 3e 01 00                  call     0x100368ca
  100229EA:  83 c4 04                        add      esp, 4
  100229ED:  50                              push     eax
  100229EE:  e8 6d 15 00 00                  call     0x10023f60
  100229F3:  83 c4 10                        add      esp, 0x10
  100229F6:  32 c0                           xor      al, al
  100229F8:  5f                              pop      edi
  100229F9:  5e                              pop      esi
  100229FA:  5b                              pop      ebx
  100229FB:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  100229FE:  33 cd                           xor      ecx, ebp
  10022A00:  e8 b2 99 00 00                  call     0x1002c3b7
  10022A05:  8b e5                           mov      esp, ebp
  10022A07:  5d                              pop      ebp
  10022A08:  c3                              ret      
  10022A09:  8b 85 ec fb ff ff               mov      eax, dword ptr [ebp - 0x414]
  10022A0F:  33 ff                           xor      edi, edi
  10022A11:  33 c9                           xor      ecx, ecx
  10022A13:  8b f2                           mov      esi, edx
  10022A15:  89 58 08                        mov      dword ptr [eax + 8], ebx
  10022A18:  83 3d 48 cb 08 10 05            cmp      dword ptr [0x1008cb48], 5
  10022A1F:  7c 2f                           jl       0x10022a50
  10022A21:  66 0f 38 21 02                  pmovsxbd xmm0, dword ptr [edx]
  10022A26:  c4 e2 79 47 cd                  vpsllvd  xmm1, xmm0, xmm5
  10022A2B:  0f 28 c1                        movaps   xmm0, xmm1
  10022A2E:  8d 72 04                        lea      esi, [edx + 4]
  10022A31:  66 0f 73 d8 08                  psrldq   xmm0, 8
  10022A36:  0f 56 c8                        orps     xmm1, xmm0
  10022A39:  0f 10 c1                        movups   xmm0, xmm1
  10022A3C:  66 0f 73 d8 04                  psrldq   xmm0, 4
  10022A41:  0f 56 c8                        orps     xmm1, xmm0
  10022A44:  66 0f 7e cf                     movd     edi, xmm1
  10022A48:  eb 1a                           jmp      0x10022a64
  10022A4A:  66 0f 1f 44 00 00               nop      word ptr [eax + eax]
  10022A50:  0f be 06                        movsx    eax, byte ptr [esi]
  10022A53:  46                              inc      esi
  10022A54:  d3 e0                           shl      eax, cl
  10022A56:  41                              inc      ecx
  10022A57:  0b f8                           or       edi, eax
  10022A59:  83 f9 04                        cmp      ecx, 4
  10022A5C:  7c f2                           jl       0x10022a50
  10022A5E:  8b 85 ec fb ff ff               mov      eax, dword ptr [ebp - 0x414]
  10022A64:  89 b5 f4 fb ff ff               mov      dword ptr [ebp - 0x40c], esi
  10022A6A:  8d 4f 04                        lea      ecx, [edi + 4]
  10022A6D:  89 8d e0 fb ff ff               mov      dword ptr [ebp - 0x420], ecx
  10022A73:  c6 85 f9 fb ff ff 00            mov      byte ptr [ebp - 0x407], 0
  10022A7A:  c7 85 e8 fb ff ff 00 00 00 00   mov      dword ptr [ebp - 0x418], 0
  10022A84:  85 db                           test     ebx, ebx
  10022A86:  0f 8e 05 01 00 00               jle      0x10022b91
  10022A8C:  83 c0 3c                        add      eax, 0x3c
  10022A8F:  89 85 f0 fb ff ff               mov      dword ptr [ebp - 0x410], eax
  10022A95:  51                              push     ecx
  10022A96:  8d 85 f4 fb ff ff               lea      eax, [ebp - 0x40c]
  10022A9C:  50                              push     eax
  10022A9D:  e8 2e 12 00 00                  call     0x10023cd0
  10022AA2:  8b d0                           mov      edx, eax
  10022AA4:  83 c4 08                        add      esp, 8
  10022AA7:  8b 85 f4 fb ff ff               mov      eax, dword ptr [ebp - 0x40c]
  10022AAD:  33 ff                           xor      edi, edi
  10022AAF:  33 c9                           xor      ecx, ecx
  10022AB1:  89 95 e4 fb ff ff               mov      dword ptr [ebp - 0x41c], edx
  10022AB7:  83 3d 48 cb 08 10 05            cmp      dword ptr [0x1008cb48], 5
  10022ABE:  8b f0                           mov      esi, eax
  10022AC0:  7c 2e                           jl       0x10022af0
  10022AC2:  66 0f 38 21 00                  pmovsxbd xmm0, dword ptr [eax]
  10022AC7:  c4 e2 79 47 cd                  vpsllvd  xmm1, xmm0, xmm5
  10022ACC:  0f 28 c1                        movaps   xmm0, xmm1
  10022ACF:  83 c6 04                        add      esi, 4
  10022AD2:  66 0f 73 d8 08                  psrldq   xmm0, 8
  10022AD7:  0f 56 c8                        orps     xmm1, xmm0
  10022ADA:  0f 10 c1                        movups   xmm0, xmm1
  10022ADD:  66 0f 73 d8 04                  psrldq   xmm0, 4
  10022AE2:  0f 56 c8                        orps     xmm1, xmm0
  10022AE5:  66 0f 7e cf                     movd     edi, xmm1
  10022AE9:  eb 13                           jmp      0x10022afe
  10022AEB:  0f 1f 44 00 00                  nop      dword ptr [eax + eax]
  10022AF0:  0f be 06                        movsx    eax, byte ptr [esi]
  10022AF3:  46                              inc      esi
  10022AF4:  d3 e0                           shl      eax, cl
  10022AF6:  41                              inc      ecx
  10022AF7:  0b f8                           or       edi, eax
  10022AF9:  83 f9 04                        cmp      ecx, 4
  10022AFC:  7c f2                           jl       0x10022af0
  10022AFE:  89 b5 f4 fb ff ff               mov      dword ptr [ebp - 0x40c], esi
  10022B04:  3b 15 54 a2 08 10               cmp      edx, dword ptr [0x1008a254]
  10022B0A:  0f 83 0c fe ff ff               jae      0x1002291c
  10022B10:  83 ff 0c                        cmp      edi, 0xc
  10022B13:  0f 8f 03 fe ff ff               jg       0x1002291c
  10022B19:  85 ff                           test     edi, edi
  10022B1B:  74 4a                           je       0x10022b67
  10022B1D:  8d 85 f9 fb ff ff               lea      eax, [ebp - 0x407]
  10022B23:  50                              push     eax
  10022B24:  52                              push     edx
  10022B25:  e8 56 07 00 00                  call     0x10023280
  10022B2A:  8a 8d fb fb ff ff               mov      cl, byte ptr [ebp - 0x405]
  10022B30:  83 c4 08                        add      esp, 8
  10022B33:  3a c1                           cmp      al, cl
  10022B35:  74 0c                           je       0x10022b43
  10022B37:  3a 85 fa fb ff ff               cmp      al, byte ptr [ebp - 0x406]
  10022B3D:  0f 85 d9 fd ff ff               jne      0x1002291c
  10022B43:  80 bd f9 fb ff ff 00            cmp      byte ptr [ebp - 0x407], 0
  10022B4A:  74 08                           je       0x10022b54
  10022B4C:  3a c1                           cmp      al, cl
  10022B4E:  0f 85 c8 fd ff ff               jne      0x1002291c
  10022B54:  8b 85 f0 fb ff ff               mov      eax, dword ptr [ebp - 0x410]
  10022B5A:  8b 8d e4 fb ff ff               mov      ecx, dword ptr [ebp - 0x41c]
  10022B60:  89 48 d0                        mov      dword ptr [eax - 0x30], ecx
  10022B63:  89 38                           mov      dword ptr [eax], edi
  10022B65:  eb 06                           jmp      0x10022b6d
  10022B67:  8b 85 f0 fb ff ff               mov      eax, dword ptr [ebp - 0x410]
  10022B6D:  8b 8d e8 fb ff ff               mov      ecx, dword ptr [ebp - 0x418]
  10022B73:  83 c0 04                        add      eax, 4
  10022B76:  41                              inc      ecx
  10022B77:  89 85 f0 fb ff ff               mov      dword ptr [ebp - 0x410], eax
  10022B7D:  89 8d e8 fb ff ff               mov      dword ptr [ebp - 0x418], ecx
  10022B83:  3b cb                           cmp      ecx, ebx
  10022B85:  8b 8d e0 fb ff ff               mov      ecx, dword ptr [ebp - 0x420]
  10022B8B:  0f 8c 04 ff ff ff               jl       0x10022a95
  10022B91:  33 ff                           xor      edi, edi
  10022B93:  33 c9                           xor      ecx, ecx
  10022B95:  83 3d 48 cb 08 10 05            cmp      dword ptr [0x1008cb48], 5
  10022B9C:  8b d6                           mov      edx, esi
  10022B9E:  7c 30                           jl       0x10022bd0
  10022BA0:  66 0f 38 21 06                  pmovsxbd xmm0, dword ptr [esi]
  10022BA5:  c4 e2 79 47 cd                  vpsllvd  xmm1, xmm0, xmm5
  10022BAA:  0f 28 c1                        movaps   xmm0, xmm1
  10022BAD:  83 c2 04                        add      edx, 4
  10022BB0:  66 0f 73 d8 08                  psrldq   xmm0, 8
  10022BB5:  0f 56 c8                        orps     xmm1, xmm0
  10022BB8:  0f 10 c1                        movups   xmm0, xmm1
  10022BBB:  66 0f 73 d8 04                  psrldq   xmm0, 4
  10022BC0:  0f 56 c8                        orps     xmm1, xmm0
  10022BC3:  66 0f 7e cf                     movd     edi, xmm1
  10022BC7:  eb 15                           jmp      0x10022bde
  10022BC9:  0f 1f 80 00 00 00 00            nop      dword ptr [eax]
  10022BD0:  0f be 02                        movsx    eax, byte ptr [edx]
  10022BD3:  42                              inc      edx
  10022BD4:  d3 e0                           shl      eax, cl
  10022BD6:  41                              inc      ecx
  10022BD7:  0b f8                           or       edi, eax
  10022BD9:  83 f9 04                        cmp      ecx, 4
  10022BDC:  7c f2                           jl       0x10022bd0
  10022BDE:  8d 5f 08                        lea      ebx, [edi + 8]
  10022BE1:  89 95 f4 fb ff ff               mov      dword ptr [ebp - 0x40c], edx
  10022BE7:  8b bd ec fb ff ff               mov      edi, dword ptr [ebp - 0x414]
  10022BED:  33 f6                           xor      esi, esi
  10022BEF:  83 c7 6c                        add      edi, 0x6c
  10022BF2:  8d 04 13                        lea      eax, [ebx + edx]
  10022BF5:  3b 85 dc fb ff ff               cmp      eax, dword ptr [ebp - 0x424]
  10022BFB:  77 67                           ja       0x10022c64
  10022BFD:  8d 85 f4 fb ff ff               lea      eax, [ebp - 0x40c]
  10022C03:  53                              push     ebx
  10022C04:  50                              push     eax
  10022C05:  e8 c6 10 00 00                  call     0x10023cd0
  10022C0A:  8b d0                           mov      edx, eax
  10022C0C:  83 c4 08                        add      esp, 8
  10022C0F:  81 fa 67 0d 00 00               cmp      edx, 0xd67
  10022C15:  0f 8f 01 fd ff ff               jg       0x1002291c
  10022C1B:  a1 c0 c4 08 10                  mov      eax, dword ptr [0x1008c4c0]
  10022C20:  85 c0                           test     eax, eax
  10022C22:  0f 84 f4 fc ff ff               je       0x1002291c
  10022C28:  69 ca a4 00 00 00               imul     ecx, edx, 0xa4
  10022C2E:  03 c8                           add      ecx, eax
  10022C30:  0f 84 e6 fc ff ff               je       0x1002291c
  10022C36:  8a 41 28                        mov      al, byte ptr [ecx + 0x28]
  10022C39:  84 c0                           test     al, al
  10022C3B:  74 14                           je       0x10022c51
  10022C3D:  3a 85 fb fb ff ff               cmp      al, byte ptr [ebp - 0x405]
  10022C43:  74 0c                           je       0x10022c51
  10022C45:  3a 85 fa fb ff ff               cmp      al, byte ptr [ebp - 0x406]
  10022C4B:  0f 85 cb fc ff ff               jne      0x1002291c
  10022C51:  89 17                           mov      dword ptr [edi], edx
  10022C53:  46                              inc      esi
  10022C54:  83 c7 04                        add      edi, 4
  10022C57:  83 fe 08                        cmp      esi, 8
  10022C5A:  73 08                           jae      0x10022c64
  10022C5C:  8b 95 f4 fb ff ff               mov      edx, dword ptr [ebp - 0x40c]
  10022C62:  eb 8e                           jmp      0x10022bf2
  10022C64:  8b 8d ec fb ff ff               mov      ecx, dword ptr [ebp - 0x414]
  10022C6A:  0f b6 85 fb fb ff ff            movzx    eax, byte ptr [ebp - 0x405]
  10022C71:  5f                              pop      edi
  10022C72:  5e                              pop      esi
  10022C73:  89 01                           mov      dword ptr [ecx], eax
  10022C75:  0f b6 85 fa fb ff ff            movzx    eax, byte ptr [ebp - 0x406]
  10022C7C:  89 41 04                        mov      dword ptr [ecx + 4], eax
  10022C7F:  b0 01                           mov      al, 1
  10022C81:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10022C84:  33 cd                           xor      ecx, ebp
  10022C86:  5b                              pop      ebx
  10022C87:  e8 2b 97 00 00                  call     0x1002c3b7
  10022C8C:  8b e5                           mov      esp, ebp
  10022C8E:  5d                              pop      ebp
  10022C8F:  c3                              ret      


; === SkillbarMgr::EncodeSkillTemplate ===
; RVA: 0x00022C90  Size: 1462 bytes
; Exports: ?EncodeSkillTemplate@SkillbarMgr@GW@@YA_NABUSkillTemplate@12@PADI@Z
;
  10022C90:  55                              push     ebp
  10022C91:  8b ec                           mov      ebp, esp
  10022C93:  81 ec 24 04 00 00               sub      esp, 0x424
  10022C99:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  10022C9E:  33 c5                           xor      eax, ebp
  10022CA0:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10022CA3:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10022CA6:  33 c9                           xor      ecx, ecx
  10022CA8:  0f 10 0d e0 3b 05 10            movups   xmm1, xmmword ptr [0x10053be0]
  10022CAF:  56                              push     esi
  10022CB0:  8b 35 48 cb 08 10               mov      esi, dword ptr [0x1008cb48]
  10022CB6:  89 85 dc fb ff ff               mov      dword ptr [ebp - 0x424], eax
  10022CBC:  0f 10 15 d0 3b 05 10            movups   xmm2, xmmword ptr [0x10053bd0]
  10022CC3:  57                              push     edi
  10022CC4:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  10022CC7:  89 bd e8 fb ff ff               mov      dword ptr [ebp - 0x418], edi
  10022CCD:  0f 10 1d 00 3c 05 10            movups   xmm3, xmmword ptr [0x10053c00]
  10022CD4:  83 fe 05                        cmp      esi, 5
  10022CD7:  7c 1e                           jl       0x10022cf7
  10022CD9:  0f 28 05 f0 3b 05 10            movaps   xmm0, xmmword ptr [0x10053bf0]
  10022CE0:  c4 e2 79 46 c1                  vpsravd  xmm0, xmm0, xmm1
  10022CE5:  66 0f 38 00 c2                  pshufb   xmm0, xmm2
  10022CEA:  0f 54 c3                        andps    xmm0, xmm3
  10022CED:  66 0f 7e 85 fc fb ff ff         movd     dword ptr [ebp - 0x404], xmm0
  10022CF5:  eb 16                           jmp      0x10022d0d
  10022CF7:  b8 0e 00 00 00                  mov      eax, 0xe
  10022CFC:  d3 f8                           sar      eax, cl
  10022CFE:  24 01                           and      al, 1
  10022D00:  88 84 0d fc fb ff ff            mov      byte ptr [ebp + ecx - 0x404], al
  10022D07:  41                              inc      ecx
  10022D08:  83 f9 04                        cmp      ecx, 4
  10022D0B:  7c ea                           jl       0x10022cf7
  10022D0D:  83 fe 05                        cmp      esi, 5
  10022D10:  7c 1a                           jl       0x10022d2c
  10022D12:  0f 57 c0                        xorps    xmm0, xmm0
  10022D15:  c4 e2 79 46 c1                  vpsravd  xmm0, xmm0, xmm1
  10022D1A:  66 0f 38 00 c2                  pshufb   xmm0, xmm2
  10022D1F:  0f 54 c3                        andps    xmm0, xmm3
  10022D22:  66 0f 7e 85 00 fc ff ff         movd     dword ptr [ebp - 0x400], xmm0
  10022D2A:  eb 0a                           jmp      0x10022d36
  10022D2C:  c7 85 00 fc ff ff 00 00 00 00   mov      dword ptr [ebp - 0x400], 0
  10022D36:  33 c0                           xor      eax, eax
  10022D38:  83 fe 05                        cmp      esi, 5
  10022D3B:  7c 33                           jl       0x10022d70
  10022D3D:  0f 57 c0                        xorps    xmm0, xmm0
  10022D40:  f3 0f e6 c0                     cvtdq2pd xmm0, xmm0
  10022D44:  66 0f 59 05 10 3c 05 10         mulpd    xmm0, xmmword ptr [0x10053c10]
  10022D4C:  66 0f e6 c0                     cvttpd2dq xmm0, xmm0
  10022D50:  c4 e2 79 46 c1                  vpsravd  xmm0, xmm0, xmm1
  10022D55:  66 0f 38 00 c2                  pshufb   xmm0, xmm2
  10022D5A:  0f 54 c3                        andps    xmm0, xmm3
  10022D5D:  66 0f 7e c0                     movd     eax, xmm0
  10022D61:  66 89 85 04 fc ff ff            mov      word ptr [ebp - 0x3fc], ax
  10022D68:  eb 14                           jmp      0x10022d7e
  10022D6A:  66 0f 1f 44 00 00               nop      word ptr [eax + eax]
  10022D70:  c6 84 05 04 fc ff ff 00         mov      byte ptr [ebp + eax - 0x3fc], 0
  10022D78:  40                              inc      eax
  10022D79:  83 f8 02                        cmp      eax, 2
  10022D7C:  7c f2                           jl       0x10022d70
  10022D7E:  8b 17                           mov      edx, dword ptr [edi]
  10022D80:  33 c9                           xor      ecx, ecx
  10022D82:  66 0f 6e c2                     movd     xmm0, edx
  10022D86:  66 0f 70 c0 00                  pshufd   xmm0, xmm0, 0
  10022D8B:  83 fe 05                        cmp      esi, 5
  10022D8E:  7c 17                           jl       0x10022da7
  10022D90:  c4 e2 79 46 c1                  vpsravd  xmm0, xmm0, xmm1
  10022D95:  66 0f 38 00 c2                  pshufb   xmm0, xmm2
  10022D9A:  0f 54 c3                        andps    xmm0, xmm3
  10022D9D:  66 0f 7e 85 06 fc ff ff         movd     dword ptr [ebp - 0x3fa], xmm0
  10022DA5:  eb 13                           jmp      0x10022dba
  10022DA7:  8b c2                           mov      eax, edx
  10022DA9:  d3 f8                           sar      eax, cl
  10022DAB:  24 01                           and      al, 1
  10022DAD:  88 84 0d 06 fc ff ff            mov      byte ptr [ebp + ecx - 0x3fa], al
  10022DB4:  41                              inc      ecx
  10022DB5:  83 f9 04                        cmp      ecx, 4
  10022DB8:  7c ed                           jl       0x10022da7
  10022DBA:  8b 57 04                        mov      edx, dword ptr [edi + 4]
  10022DBD:  33 c9                           xor      ecx, ecx
  10022DBF:  66 0f 6e c2                     movd     xmm0, edx
  10022DC3:  66 0f 70 c0 00                  pshufd   xmm0, xmm0, 0
  10022DC8:  83 fe 05                        cmp      esi, 5
  10022DCB:  7c 17                           jl       0x10022de4
  10022DCD:  c4 e2 79 46 c1                  vpsravd  xmm0, xmm0, xmm1
  10022DD2:  66 0f 38 00 c2                  pshufb   xmm0, xmm2
  10022DD7:  0f 54 c3                        andps    xmm0, xmm3
  10022DDA:  66 0f 7e 85 0a fc ff ff         movd     dword ptr [ebp - 0x3f6], xmm0
  10022DE2:  eb 13                           jmp      0x10022df7
  10022DE4:  8b c2                           mov      eax, edx
  10022DE6:  d3 f8                           sar      eax, cl
  10022DE8:  24 01                           and      al, 1
  10022DEA:  88 84 0d 0a fc ff ff            mov      byte ptr [ebp + ecx - 0x3f6], al
  10022DF1:  41                              inc      ecx
  10022DF2:  83 f9 04                        cmp      ecx, 4
  10022DF5:  7c ed                           jl       0x10022de4
  10022DF7:  33 d2                           xor      edx, edx
  10022DF9:  b9 0c 00 00 00                  mov      ecx, 0xc
  10022DFE:  83 c7 3c                        add      edi, 0x3c
  10022E01:  89 95 f8 fb ff ff               mov      dword ptr [ebp - 0x408], edx
  10022E07:  89 bd f0 fb ff ff               mov      dword ptr [ebp - 0x410], edi
  10022E0D:  8b f7                           mov      esi, edi
  10022E0F:  89 8d f4 fb ff ff               mov      dword ptr [ebp - 0x40c], ecx
  10022E15:  8d 7a 04                        lea      edi, [edx + 4]
  10022E18:  0f 1f 84 00 00 00 00 00         nop      dword ptr [eax + eax]
  10022E20:  8b 46 d0                        mov      eax, dword ptr [esi - 0x30]
  10022E23:  3d ff 00 00 00                  cmp      eax, 0xff
  10022E28:  74 46                           je       0x10022e70
  10022E2A:  83 3e 00                        cmp      dword ptr [esi], 0
  10022E2D:  74 41                           je       0x10022e70
  10022E2F:  66 0f 6e c0                     movd     xmm0, eax
  10022E33:  83 ec 08                        sub      esp, 8
  10022E36:  f3 0f e6 c0                     cvtdq2pd xmm0, xmm0
  10022E3A:  f2 0f 11 04 24                  movsd    qword ptr [esp], xmm0
  10022E3F:  e8 2c 38 01 00                  call     0x10036670
  10022E44:  8b 95 f8 fb ff ff               mov      edx, dword ptr [ebp - 0x408]
  10022E4A:  83 c4 08                        add      esp, 8
  10022E4D:  8b 8d f4 fb ff ff               mov      ecx, dword ptr [ebp - 0x40c]
  10022E53:  42                              inc      edx
  10022E54:  dd 9d e0 fb ff ff               fstp     qword ptr [ebp - 0x420]
  10022E5A:  f2 0f 2c 85 e0 fb ff ff         cvttsd2si eax, qword ptr [ebp - 0x420]
  10022E62:  89 95 f8 fb ff ff               mov      dword ptr [ebp - 0x408], edx
  10022E68:  40                              inc      eax
  10022E69:  3b c7                           cmp      eax, edi
  10022E6B:  0f 4e c7                        cmovle   eax, edi
  10022E6E:  8b f8                           mov      edi, eax
  10022E70:  83 c6 04                        add      esi, 4
  10022E73:  83 e9 01                        sub      ecx, 1
  10022E76:  89 8d f4 fb ff ff               mov      dword ptr [ebp - 0x40c], ecx
  10022E7C:  75 a2                           jne      0x10022e20
  10022E7E:  8b 35 48 cb 08 10               mov      esi, dword ptr [0x1008cb48]
  10022E84:  33 c9                           xor      ecx, ecx
  10022E86:  66 0f 6e c2                     movd     xmm0, edx
  10022E8A:  89 bd f4 fb ff ff               mov      dword ptr [ebp - 0x40c], edi
  10022E90:  66 0f 70 c0 00                  pshufd   xmm0, xmm0, 0
  10022E95:  83 fe 05                        cmp      esi, 5
  10022E98:  7c 2c                           jl       0x10022ec6
  10022E9A:  0f 10 2d e0 3b 05 10            movups   xmm5, xmmword ptr [0x10053be0]
  10022EA1:  0f 10 35 d0 3b 05 10            movups   xmm6, xmmword ptr [0x10053bd0]
  10022EA8:  0f 10 3d 00 3c 05 10            movups   xmm7, xmmword ptr [0x10053c00]
  10022EAF:  c4 e2 79 46 c5                  vpsravd  xmm0, xmm0, xmm5
  10022EB4:  66 0f 38 00 c6                  pshufb   xmm0, xmm6
  10022EB9:  0f 54 c7                        andps    xmm0, xmm7
  10022EBC:  66 0f 7e 85 0e fc ff ff         movd     dword ptr [ebp - 0x3f2], xmm0
  10022EC4:  eb 28                           jmp      0x10022eee
  10022EC6:  8b c2                           mov      eax, edx
  10022EC8:  d3 f8                           sar      eax, cl
  10022ECA:  24 01                           and      al, 1
  10022ECC:  88 84 0d 0e fc ff ff            mov      byte ptr [ebp + ecx - 0x3f2], al
  10022ED3:  41                              inc      ecx
  10022ED4:  83 f9 04                        cmp      ecx, 4
  10022ED7:  7c ed                           jl       0x10022ec6
  10022ED9:  0f 10 2d e0 3b 05 10            movups   xmm5, xmmword ptr [0x10053be0]
  10022EE0:  0f 10 35 d0 3b 05 10            movups   xmm6, xmmword ptr [0x10053bd0]
  10022EE7:  0f 10 3d 00 3c 05 10            movups   xmm7, xmmword ptr [0x10053c00]
  10022EEE:  33 c9                           xor      ecx, ecx
  10022EF0:  8d 57 fc                        lea      edx, [edi - 4]
  10022EF3:  83 fe 05                        cmp      esi, 5
  10022EF6:  7c 20                           jl       0x10022f18
  10022EF8:  66 0f 6e c2                     movd     xmm0, edx
  10022EFC:  66 0f 70 c0 00                  pshufd   xmm0, xmm0, 0
  10022F01:  c4 e2 79 46 c5                  vpsravd  xmm0, xmm0, xmm5
  10022F06:  66 0f 38 00 c6                  pshufb   xmm0, xmm6
  10022F0B:  0f 54 c7                        andps    xmm0, xmm7
  10022F0E:  66 0f 7e 85 12 fc ff ff         movd     dword ptr [ebp - 0x3ee], xmm0
  10022F16:  eb 13                           jmp      0x10022f2b
  10022F18:  8b c2                           mov      eax, edx
  10022F1A:  d3 f8                           sar      eax, cl
  10022F1C:  24 01                           and      al, 1
  10022F1E:  88 84 0d 12 fc ff ff            mov      byte ptr [ebp + ecx - 0x3ee], al
  10022F25:  41                              inc      ecx
  10022F26:  83 f9 04                        cmp      ecx, 4
  10022F29:  7c ed                           jl       0x10022f18
  10022F2B:  8b bd f0 fb ff ff               mov      edi, dword ptr [ebp - 0x410]
  10022F31:  b8 0c 00 00 00                  mov      eax, 0xc
  10022F36:  be 1a 00 00 00                  mov      esi, 0x1a
  10022F3B:  89 85 f8 fb ff ff               mov      dword ptr [ebp - 0x408], eax
  10022F41:  8b 4f d0                        mov      ecx, dword ptr [edi - 0x30]
  10022F44:  81 f9 ff 00 00 00               cmp      ecx, 0xff
  10022F4A:  74 72                           je       0x10022fbe
  10022F4C:  8b 3f                           mov      edi, dword ptr [edi]
  10022F4E:  85 ff                           test     edi, edi
  10022F50:  74 66                           je       0x10022fb8
  10022F52:  ff b5 f4 fb ff ff               push     dword ptr [ebp - 0x40c]
  10022F58:  8d 85 fc fb ff ff               lea      eax, [ebp - 0x404]
  10022F5E:  03 c6                           add      eax, esi
  10022F60:  50                              push     eax
  10022F61:  51                              push     ecx
  10022F62:  e8 39 0e 00 00                  call     0x10023da0
  10022F67:  83 c4 0c                        add      esp, 0xc
  10022F6A:  66 0f 6e c7                     movd     xmm0, edi
  10022F6E:  03 f0                           add      esi, eax
  10022F70:  66 0f 70 c0 00                  pshufd   xmm0, xmm0, 0
  10022F75:  33 c9                           xor      ecx, ecx
  10022F77:  83 3d 48 cb 08 10 05            cmp      dword ptr [0x1008cb48], 5
  10022F7E:  7c 18                           jl       0x10022f98
  10022F80:  c4 e2 79 46 c5                  vpsravd  xmm0, xmm0, xmm5
  10022F85:  66 0f 38 00 c6                  pshufb   xmm0, xmm6
  10022F8A:  0f 54 c7                        andps    xmm0, xmm7
  10022F8D:  66 0f 7e 84 35 fc fb ff ff      movd     dword ptr [ebp + esi - 0x404], xmm0
  10022F96:  eb 17                           jmp      0x10022faf
  10022F98:  8d 95 fc fb ff ff               lea      edx, [ebp - 0x404]
  10022F9E:  03 d6                           add      edx, esi
  10022FA0:  8b c7                           mov      eax, edi
  10022FA2:  d3 f8                           sar      eax, cl
  10022FA4:  24 01                           and      al, 1
  10022FA6:  88 04 0a                        mov      byte ptr [edx + ecx], al
  10022FA9:  41                              inc      ecx
  10022FAA:  83 f9 04                        cmp      ecx, 4
  10022FAD:  7c f1                           jl       0x10022fa0
  10022FAF:  8b 85 f8 fb ff ff               mov      eax, dword ptr [ebp - 0x408]
  10022FB5:  83 c6 04                        add      esi, 4
  10022FB8:  8b bd f0 fb ff ff               mov      edi, dword ptr [ebp - 0x410]
  10022FBE:  83 c7 04                        add      edi, 4
  10022FC1:  83 e8 01                        sub      eax, 1
  10022FC4:  89 bd f0 fb ff ff               mov      dword ptr [ebp - 0x410], edi
  10022FCA:  89 85 f8 fb ff ff               mov      dword ptr [ebp - 0x408], eax
  10022FD0:  0f 85 6b ff ff ff               jne      0x10022f41
  10022FD6:  8b bd e8 fb ff ff               mov      edi, dword ptr [ebp - 0x418]
  10022FDC:  b8 08 00 00 00                  mov      eax, 8
  10022FE1:  83 c7 6c                        add      edi, 0x6c
  10022FE4:  89 b5 e4 fb ff ff               mov      dword ptr [ebp - 0x41c], esi
  10022FEA:  8b cf                           mov      ecx, edi
  10022FEC:  89 85 f0 fb ff ff               mov      dword ptr [ebp - 0x410], eax
  10022FF2:  89 bd e8 fb ff ff               mov      dword ptr [ebp - 0x418], edi
  10022FF8:  89 8d f4 fb ff ff               mov      dword ptr [ebp - 0x40c], ecx
  10022FFE:  8d 57 20                        lea      edx, [edi + 0x20]
  10023001:  89 95 f8 fb ff ff               mov      dword ptr [ebp - 0x408], edx
  10023007:  3b fa                           cmp      edi, edx
  10023009:  74 58                           je       0x10023063
  1002300B:  8b f8                           mov      edi, eax
  1002300D:  8b f2                           mov      esi, edx
  1002300F:  90                              nop      
  10023010:  66 0f 6e 01                     movd     xmm0, dword ptr [ecx]
  10023014:  83 ec 08                        sub      esp, 8
  10023017:  f3 0f e6 c0                     cvtdq2pd xmm0, xmm0
  1002301B:  f2 0f 11 04 24                  movsd    qword ptr [esp], xmm0
  10023020:  e8 4b 36 01 00                  call     0x10036670
  10023025:  8b 8d f4 fb ff ff               mov      ecx, dword ptr [ebp - 0x40c]
  1002302B:  83 c4 08                        add      esp, 8
  1002302E:  dd 9d ec fb ff ff               fstp     qword ptr [ebp - 0x414]
  10023034:  f2 0f 2c 85 ec fb ff ff         cvttsd2si eax, qword ptr [ebp - 0x414]
  1002303C:  40                              inc      eax
  1002303D:  3b c7                           cmp      eax, edi
  1002303F:  0f 4e c7                        cmovle   eax, edi
  10023042:  83 c1 04                        add      ecx, 4
  10023045:  89 8d f4 fb ff ff               mov      dword ptr [ebp - 0x40c], ecx
  1002304B:  8b f8                           mov      edi, eax
  1002304D:  3b ce                           cmp      ecx, esi
  1002304F:  75 bf                           jne      0x10023010
  10023051:  8b b5 e4 fb ff ff               mov      esi, dword ptr [ebp - 0x41c]
  10023057:  89 bd f0 fb ff ff               mov      dword ptr [ebp - 0x410], edi
  1002305D:  8b bd e8 fb ff ff               mov      edi, dword ptr [ebp - 0x418]
  10023063:  33 c9                           xor      ecx, ecx
  10023065:  8d 50 f8                        lea      edx, [eax - 8]
  10023068:  83 3d 48 cb 08 10 05            cmp      dword ptr [0x1008cb48], 5
  1002306F:  89 95 e4 fb ff ff               mov      dword ptr [ebp - 0x41c], edx
  10023075:  7c 30                           jl       0x100230a7
  10023077:  8d 48 f8                        lea      ecx, [eax - 8]
  1002307A:  66 0f 6e c1                     movd     xmm0, ecx
  1002307E:  66 0f 70 c0 00                  pshufd   xmm0, xmm0, 0
  10023083:  c4 e2 79 46 05 e0 3b 05 10      vpsravd  xmm0, xmm0, xmmword ptr [0x10053be0]
  1002308C:  66 0f 38 00 05 d0 3b 05 10      pshufb   xmm0, xmmword ptr [0x10053bd0]
  10023095:  0f 54 05 00 3c 05 10            andps    xmm0, xmmword ptr [0x10053c00]
  1002309C:  66 0f 7e 84 35 fc fb ff ff      movd     dword ptr [ebp + esi - 0x404], xmm0
  100230A5:  eb 29                           jmp      0x100230d0
  100230A7:  8b bd e4 fb ff ff               mov      edi, dword ptr [ebp - 0x41c]
  100230AD:  8d 95 fc fb ff ff               lea      edx, [ebp - 0x404]
  100230B3:  03 d6                           add      edx, esi
  100230B5:  8b c7                           mov      eax, edi
  100230B7:  d3 f8                           sar      eax, cl
  100230B9:  24 01                           and      al, 1
  100230BB:  88 04 0a                        mov      byte ptr [edx + ecx], al
  100230BE:  41                              inc      ecx
  100230BF:  83 f9 04                        cmp      ecx, 4
  100230C2:  7c f1                           jl       0x100230b5
  100230C4:  8b bd e8 fb ff ff               mov      edi, dword ptr [ebp - 0x418]
  100230CA:  8b 85 f0 fb ff ff               mov      eax, dword ptr [ebp - 0x410]
  100230D0:  83 c6 04                        add      esi, 4
  100230D3:  3b bd f8 fb ff ff               cmp      edi, dword ptr [ebp - 0x408]
  100230D9:  74 35                           je       0x10023110
  100230DB:  0f 1f 44 00 00                  nop      dword ptr [eax + eax]
  100230E0:  50                              push     eax
  100230E1:  8d 85 fc fb ff ff               lea      eax, [ebp - 0x404]
  100230E7:  03 c6                           add      eax, esi
  100230E9:  50                              push     eax
  100230EA:  ff 37                           push     dword ptr [edi]
  100230EC:  e8 af 0c 00 00                  call     0x10023da0
  100230F1:  03 f0                           add      esi, eax
  100230F3:  83 c7 04                        add      edi, 4
  100230F6:  8b 85 f0 fb ff ff               mov      eax, dword ptr [ebp - 0x410]
  100230FC:  83 c4 0c                        add      esp, 0xc
  100230FF:  3b bd f8 fb ff ff               cmp      edi, dword ptr [ebp - 0x408]
  10023105:  75 d9                           jne      0x100230e0
  10023107:  66 0f 1f 84 00 00 00 00 00      nop      word ptr [eax + eax]
  10023110:  c6 84 35 fc fb ff ff 00         mov      byte ptr [ebp + esi - 0x404], 0
  10023118:  46                              inc      esi
  10023119:  81 fe a2 00 00 00               cmp      esi, 0xa2
  1002311F:  73 13                           jae      0x10023134
  10023121:  8b c6                           mov      eax, esi
  10023123:  46                              inc      esi
  10023124:  c6 84 05 fc fb ff ff 00         mov      byte ptr [ebp + eax - 0x404], 0
  1002312C:  81 fe a2 00 00 00               cmp      esi, 0xa2
  10023132:  72 ed                           jb       0x10023121
  10023134:  b8 ab aa aa aa                  mov      eax, 0xaaaaaaab
  10023139:  f7 e6                           mul      esi
  1002313B:  c1 ea 02                        shr      edx, 2
  1002313E:  8d 04 52                        lea      eax, [edx + edx*2]
  10023141:  8b d6                           mov      edx, esi
  10023143:  03 c0                           add      eax, eax
  10023145:  2b d0                           sub      edx, eax
  10023147:  b8 00 00 00 00                  mov      eax, 0
  1002314C:  74 1e                           je       0x1002316c
  1002314E:  66 90                           nop      
  10023150:  8b ce                           mov      ecx, esi
  10023152:  46                              inc      esi
  10023153:  81 f9 00 04 00 00               cmp      ecx, 0x400
  10023159:  0f 83 a4 00 00 00               jae      0x10023203
  1002315F:  40                              inc      eax
  10023160:  c6 84 0d fc fb ff ff 00         mov      byte ptr [ebp + ecx - 0x404], 0
  10023168:  3b c2                           cmp      eax, edx
  1002316A:  72 e4                           jb       0x10023150
  1002316C:  b8 ab aa aa aa                  mov      eax, 0xaaaaaaab
  10023171:  f7 e6                           mul      esi
  10023173:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  10023176:  8b fa                           mov      edi, edx
  10023178:  48                              dec      eax
  10023179:  c1 ef 02                        shr      edi, 2
  1002317C:  3b f8                           cmp      edi, eax
  1002317E:  76 12                           jbe      0x10023192
  10023180:  5f                              pop      edi
  10023181:  32 c0                           xor      al, al
  10023183:  5e                              pop      esi
  10023184:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10023187:  33 cd                           xor      ecx, ebp
  10023189:  e8 29 92 00 00                  call     0x1002c3b7
  1002318E:  8b e5                           mov      esp, ebp
  10023190:  5d                              pop      ebp
  10023191:  c3                              ret      
  10023192:  33 f6                           xor      esi, esi
  10023194:  85 ff                           test     edi, edi
  10023196:  74 4f                           je       0x100231e7
  10023198:  8d 95 fe fb ff ff               lea      edx, [ebp - 0x402]
  1002319E:  66 90                           nop      
  100231A0:  0f be 4a ff                     movsx    ecx, byte ptr [edx - 1]
  100231A4:  8d 52 06                        lea      edx, [edx + 6]
  100231A7:  0f be 42 f8                     movsx    eax, byte ptr [edx - 8]
  100231AB:  03 c9                           add      ecx, ecx
  100231AD:  0b c8                           or       ecx, eax
  100231AF:  0f be 42 fa                     movsx    eax, byte ptr [edx - 6]
  100231B3:  c1 e0 02                        shl      eax, 2
  100231B6:  0b c8                           or       ecx, eax
  100231B8:  0f be 42 fb                     movsx    eax, byte ptr [edx - 5]
  100231BC:  c1 e0 03                        shl      eax, 3
  100231BF:  0b c8                           or       ecx, eax
  100231C1:  0f be 42 fc                     movsx    eax, byte ptr [edx - 4]
  100231C5:  c1 e0 04                        shl      eax, 4
  100231C8:  0b c8                           or       ecx, eax
  100231CA:  0f be 42 fd                     movsx    eax, byte ptr [edx - 3]
  100231CE:  c1 e0 05                        shl      eax, 5
  100231D1:  0b c8                           or       ecx, eax
  100231D3:  8a 81 b0 3a 05 10               mov      al, byte ptr [ecx + 0x10053ab0]  ; "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz01234..."
  100231D9:  8b 8d dc fb ff ff               mov      ecx, dword ptr [ebp - 0x424]
  100231DF:  88 04 31                        mov      byte ptr [ecx + esi], al
  100231E2:  46                              inc      esi
  100231E3:  3b f7                           cmp      esi, edi
  100231E5:  72 b9                           jb       0x100231a0
  100231E7:  8b 85 dc fb ff ff               mov      eax, dword ptr [ebp - 0x424]
  100231ED:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  100231F0:  33 cd                           xor      ecx, ebp
  100231F2:  c6 04 38 00                     mov      byte ptr [eax + edi], 0
  100231F6:  b0 01                           mov      al, 1
  100231F8:  5f                              pop      edi
  100231F9:  5e                              pop      esi
  100231FA:  e8 b8 91 00 00                  call     0x1002c3b7
  100231FF:  8b e5                           mov      esp, ebp
  10023201:  5d                              pop      ebp
  10023202:  c3                              ret      
  10023203:  e8 ee 92 00 00                  call     0x1002c4f6
  10023208:  cc                              int3     
  10023209:  cc                              int3     
  1002320A:  cc                              int3     
  1002320B:  cc                              int3     
  1002320C:  cc                              int3     
  1002320D:  cc                              int3     
  1002320E:  cc                              int3     
  1002320F:  cc                              int3     
  10023210:  55                              push     ebp
  10023211:  8b ec                           mov      ebp, esp
  10023213:  e8 88 5e ff ff                  call     0x100190a0  ; GW::GetWorldContext
  10023218:  8b c8                           mov      ecx, eax
  1002321A:  85 c9                           test     ecx, ecx
  1002321C:  74 24                           je       0x10023242
  1002321E:  8b 81 bc 06 00 00               mov      eax, dword ptr [ecx + 0x6bc]
  10023224:  8b 89 c4 06 00 00               mov      ecx, dword ptr [ecx + 0x6c4]
  1002322A:  8d 0c 89                        lea      ecx, [ecx + ecx*4]
  1002322D:  8d 14 88                        lea      edx, [eax + ecx*4]
  10023230:  3b c2                           cmp      eax, edx
  10023232:  74 0e                           je       0x10023242
  10023234:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10023237:  39 08                           cmp      dword ptr [eax], ecx
  10023239:  74 09                           je       0x10023244
  1002323B:  83 c0 14                        add      eax, 0x14
  1002323E:  3b c2                           cmp      eax, edx
  10023240:  75 f5                           jne      0x10023237
  10023242:  33 c0                           xor      eax, eax
  10023244:  5d                              pop      ebp
  10023245:  c3                              ret      


; === SkillbarMgr::GetAttributeConstantData, GetAttributeConstantData ===
; RVA: 0x00023250  Size: 36 bytes
; Exports: ?GetAttributeConstantData@SkillbarMgr@GW@@YAPAUAttributeInfo@2@W4Attribute@Constants@2@@Z, GetAttributeConstantData
;
  10023250:  55                              push     ebp
  10023251:  8b ec                           mov      ebp, esp
  10023253:  8b 0d c4 c4 08 10               mov      ecx, dword ptr [0x1008c4c4]
  10023259:  85 c9                           test     ecx, ecx
  1002325B:  74 13                           je       0x10023270
  1002325D:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10023260:  39 05 54 a2 08 10               cmp      dword ptr [0x1008a254], eax
  10023266:  76 08                           jbe      0x10023270
  10023268:  8d 04 80                        lea      eax, [eax + eax*4]
  1002326B:  8d 04 81                        lea      eax, [ecx + eax*4]
  1002326E:  5d                              pop      ebp
  1002326F:  c3                              ret      
  10023270:  33 c0                           xor      eax, eax
  10023272:  5d                              pop      ebp
  10023273:  c3                              ret      


; === SkillbarMgr::GetHeroSkillbar ===
; RVA: 0x00023310  Size: 82 bytes
; Exports: ?GetHeroSkillbar@SkillbarMgr@GW@@YAPAUSkillbar@2@I@Z
;
  10023310:  55                              push     ebp
  10023311:  8b ec                           mov      ebp, esp
  10023313:  56                              push     esi
  10023314:  ff 75 08                        push     dword ptr [ebp + 8]
  10023317:  e8 14 f2 fd ff                  call     0x10002530  ; Agents::GetHeroAgentID, GetHeroAgentID
  1002331C:  83 c4 04                        add      esp, 4
  1002331F:  8b f0                           mov      esi, eax
  10023321:  e8 7a 5d ff ff                  call     0x100190a0  ; GW::GetWorldContext
  10023326:  85 c0                           test     eax, eax
  10023328:  74 33                           je       0x1002335d
  1002332A:  83 b8 f0 06 00 00 00            cmp      dword ptr [eax + 0x6f0], 0
  10023331:  8d 88 f0 06 00 00               lea      ecx, [eax + 0x6f0]
  10023337:  74 24                           je       0x1002335d
  10023339:  85 c9                           test     ecx, ecx
  1002333B:  74 20                           je       0x1002335d
  1002333D:  8b 01                           mov      eax, dword ptr [ecx]
  1002333F:  69 49 08 bc 00 00 00            imul     ecx, dword ptr [ecx + 8], 0xbc
  10023346:  03 c8                           add      ecx, eax
  10023348:  3b c1                           cmp      eax, ecx
  1002334A:  74 11                           je       0x1002335d
  1002334C:  0f 1f 40 00                     nop      dword ptr [eax]
  10023350:  39 30                           cmp      dword ptr [eax], esi
  10023352:  74 0b                           je       0x1002335f
  10023354:  05 bc 00 00 00                  add      eax, 0xbc
  10023359:  3b c1                           cmp      eax, ecx
  1002335B:  75 f3                           jne      0x10023350
  1002335D:  33 c0                           xor      eax, eax
  1002335F:  5e                              pop      esi
  10023360:  5d                              pop      ebp
  10023361:  c3                              ret      


; === SkillbarMgr::GetHoveredSkill, GetHoveredSkill ===
; RVA: 0x00023370  Size: 40 bytes
; Exports: ?GetHoveredSkill@SkillbarMgr@GW@@YAPAUSkill@2@XZ, GetHoveredSkill
;
  10023370:  e8 6b 33 00 00                  call     0x100266e0  ; UI::GetCurrentTooltip
  10023375:  85 c0                           test     eax, eax
  10023377:  74 1c                           je       0x10023395
  10023379:  83 78 0c 14                     cmp      dword ptr [eax + 0xc], 0x14
  1002337D:  75 16                           jne      0x10023395
  1002337F:  8b 0d c0 c4 08 10               mov      ecx, dword ptr [0x1008c4c0]
  10023385:  85 c9                           test     ecx, ecx
  10023387:  74 0c                           je       0x10023395
  10023389:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  1002338C:  69 00 a4 00 00 00               imul     eax, dword ptr [eax], 0xa4
  10023392:  03 c1                           add      eax, ecx
  10023394:  c3                              ret      
  10023395:  33 c0                           xor      eax, eax
  10023397:  c3                              ret      


; === SkillbarMgr::GetIsSkillLearnt ===
; RVA: 0x000233A0  Size: 96 bytes
; Exports: ?GetIsSkillLearnt@SkillbarMgr@GW@@YA_NW4SkillID@Constants@2@@Z
;
  100233A0:  55                              push     ebp
  100233A1:  8b ec                           mov      ebp, esp
  100233A3:  56                              push     esi
  100233A4:  57                              push     edi
  100233A5:  e8 f6 5c ff ff                  call     0x100190a0  ; GW::GetWorldContext
  100233AA:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  100233AD:  8b f0                           mov      esi, eax
  100233AF:  8b f9                           mov      edi, ecx
  100233B1:  c1 ef 05                        shr      edi, 5
  100233B4:  3b be 18 07 00 00               cmp      edi, dword ptr [esi + 0x718]
  100233BA:  72 06                           jb       0x100233c2
  100233BC:  5f                              pop      edi
  100233BD:  32 c0                           xor      al, al
  100233BF:  5e                              pop      esi
  100233C0:  5d                              pop      ebp
  100233C1:  c3                              ret      
  100233C2:  53                              push     ebx
  100233C3:  83 e1 1f                        and      ecx, 0x1f
  100233C6:  bb 01 00 00 00                  mov      ebx, 1
  100233CB:  d3 e3                           shl      ebx, cl
  100233CD:  83 be 10 07 00 00 00            cmp      dword ptr [esi + 0x710], 0
  100233D4:  75 19                           jne      0x100233ef
  100233D6:  68 b8 2c 05 10                  push     0x10052cb8  ; "GW::BaseArray<unsigned int>::at"
  100233DB:  6a 1e                           push     0x1e
  100233DD:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  100233E2:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  100233E7:  e8 84 24 fe ff                  call     0x10005870  ; GW::FatalAssert
  100233EC:  83 c4 10                        add      esp, 0x10
  100233EF:  8b 86 10 07 00 00               mov      eax, dword ptr [esi + 0x710]
  100233F5:  85 1c b8                        test     dword ptr [eax + edi*4], ebx
  100233F8:  5b                              pop      ebx
  100233F9:  5f                              pop      edi
  100233FA:  0f 95 c0                        setne    al
  100233FD:  5e                              pop      esi
  100233FE:  5d                              pop      ebp
  100233FF:  c3                              ret      


; === SkillbarMgr::GetIsSkillUnlocked ===
; RVA: 0x00023400  Size: 168 bytes
; Exports: ?GetIsSkillUnlocked@SkillbarMgr@GW@@YA_NW4SkillID@Constants@2@@Z
;
  10023400:  55                              push     ebp
  10023401:  8b ec                           mov      ebp, esp
  10023403:  56                              push     esi
  10023404:  57                              push     edi
  10023405:  e8 56 5b ff ff                  call     0x10018f60  ; GW::GetAccountContext
  1002340A:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1002340D:  8b f0                           mov      esi, eax
  1002340F:  8b f9                           mov      edi, ecx
  10023411:  c1 ef 05                        shr      edi, 5
  10023414:  3b be 2c 01 00 00               cmp      edi, dword ptr [esi + 0x12c]
  1002341A:  72 06                           jb       0x10023422
  1002341C:  5f                              pop      edi
  1002341D:  32 c0                           xor      al, al
  1002341F:  5e                              pop      esi
  10023420:  5d                              pop      ebp
  10023421:  c3                              ret      
  10023422:  53                              push     ebx
  10023423:  83 e1 1f                        and      ecx, 0x1f
  10023426:  bb 01 00 00 00                  mov      ebx, 1
  1002342B:  d3 e3                           shl      ebx, cl
  1002342D:  83 be 24 01 00 00 00            cmp      dword ptr [esi + 0x124], 0
  10023434:  75 19                           jne      0x1002344f
  10023436:  68 b8 2c 05 10                  push     0x10052cb8  ; "GW::BaseArray<unsigned int>::at"
  1002343B:  6a 1e                           push     0x1e
  1002343D:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  10023442:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  10023447:  e8 24 24 fe ff                  call     0x10005870  ; GW::FatalAssert
  1002344C:  83 c4 10                        add      esp, 0x10
  1002344F:  8b 86 24 01 00 00               mov      eax, dword ptr [esi + 0x124]
  10023455:  85 1c b8                        test     dword ptr [eax + edi*4], ebx
  10023458:  5b                              pop      ebx
  10023459:  5f                              pop      edi
  1002345A:  0f 95 c0                        setne    al
  1002345D:  5e                              pop      esi
  1002345E:  5d                              pop      ebp
  1002345F:  c3                              ret      
  10023460:  56                              push     esi
  10023461:  e8 3a 5c ff ff                  call     0x100190a0  ; GW::GetWorldContext
  10023466:  85 c0                           test     eax, eax
  10023468:  74 3a                           je       0x100234a4
  1002346A:  83 b8 f0 06 00 00 00            cmp      dword ptr [eax + 0x6f0], 0
  10023471:  8d b0 f0 06 00 00               lea      esi, [eax + 0x6f0]
  10023477:  74 2b                           je       0x100234a4
  10023479:  85 f6                           test     esi, esi
  1002347B:  74 27                           je       0x100234a4
  1002347D:  e8 4e ee fd ff                  call     0x100022d0  ; Agents::GetControlledCharacterId, GetControlledCharacterId
  10023482:  8b d0                           mov      edx, eax
  10023484:  85 d2                           test     edx, edx
  10023486:  74 1c                           je       0x100234a4
  10023488:  69 4e 08 bc 00 00 00            imul     ecx, dword ptr [esi + 8], 0xbc
  1002348F:  8b 06                           mov      eax, dword ptr [esi]
  10023491:  03 c8                           add      ecx, eax
  10023493:  3b c1                           cmp      eax, ecx
  10023495:  74 0d                           je       0x100234a4
  10023497:  39 10                           cmp      dword ptr [eax], edx
  10023499:  74 0b                           je       0x100234a6
  1002349B:  05 bc 00 00 00                  add      eax, 0xbc
  100234A0:  3b c1                           cmp      eax, ecx
  100234A2:  75 f3                           jne      0x10023497
  100234A4:  33 c0                           xor      eax, eax
  100234A6:  5e                              pop      esi
  100234A7:  c3                              ret      


; === SkillbarMgr::GetPlayerSkillbar ===
; RVA: 0x00023460  Size: 72 bytes
; Exports: ?GetPlayerSkillbar@SkillbarMgr@GW@@YAPAUSkillbar@2@XZ
;
  10023460:  56                              push     esi
  10023461:  e8 3a 5c ff ff                  call     0x100190a0  ; GW::GetWorldContext
  10023466:  85 c0                           test     eax, eax
  10023468:  74 3a                           je       0x100234a4
  1002346A:  83 b8 f0 06 00 00 00            cmp      dword ptr [eax + 0x6f0], 0
  10023471:  8d b0 f0 06 00 00               lea      esi, [eax + 0x6f0]
  10023477:  74 2b                           je       0x100234a4
  10023479:  85 f6                           test     esi, esi
  1002347B:  74 27                           je       0x100234a4
  1002347D:  e8 4e ee fd ff                  call     0x100022d0  ; Agents::GetControlledCharacterId, GetControlledCharacterId
  10023482:  8b d0                           mov      edx, eax
  10023484:  85 d2                           test     edx, edx
  10023486:  74 1c                           je       0x100234a4
  10023488:  69 4e 08 bc 00 00 00            imul     ecx, dword ptr [esi + 8], 0xbc
  1002348F:  8b 06                           mov      eax, dword ptr [esi]
  10023491:  03 c8                           add      ecx, eax
  10023493:  3b c1                           cmp      eax, ecx
  10023495:  74 0d                           je       0x100234a4
  10023497:  39 10                           cmp      dword ptr [eax], edx
  10023499:  74 0b                           je       0x100234a6
  1002349B:  05 bc 00 00 00                  add      eax, 0xbc
  100234A0:  3b c1                           cmp      eax, ecx
  100234A2:  75 f3                           jne      0x10023497
  100234A4:  33 c0                           xor      eax, eax
  100234A6:  5e                              pop      esi
  100234A7:  c3                              ret      


; === SkillbarMgr::GetSkillConstantData, GetSkillConstantData ===
; RVA: 0x000234B0  Size: 28 bytes
; Exports: ?GetSkillConstantData@SkillbarMgr@GW@@YAPAUSkill@2@W4SkillID@Constants@2@@Z, GetSkillConstantData
;
  100234B0:  55                              push     ebp
  100234B1:  8b ec                           mov      ebp, esp
  100234B3:  8b 0d c0 c4 08 10               mov      ecx, dword ptr [0x1008c4c0]
  100234B9:  85 c9                           test     ecx, ecx
  100234BB:  74 0b                           je       0x100234c8
  100234BD:  69 45 08 a4 00 00 00            imul     eax, dword ptr [ebp + 8], 0xa4
  100234C4:  03 c1                           add      eax, ecx
  100234C6:  5d                              pop      ebp
  100234C7:  c3                              ret      
  100234C8:  33 c0                           xor      eax, eax
  100234CA:  5d                              pop      ebp
  100234CB:  c3                              ret      


; === SkillbarMgr::GetSkillSlot, GetSkillSlot ===
; RVA: 0x000234D0  Size: 50 bytes
; Exports: ?GetSkillSlot@SkillbarMgr@GW@@YAHW4SkillID@Constants@2@@Z, GetSkillSlot
;
  100234D0:  55                              push     ebp
  100234D1:  8b ec                           mov      ebp, esp
  100234D3:  e8 88 ff ff ff                  call     0x10023460  ; SkillbarMgr::GetPlayerSkillbar
  100234D8:  8b c8                           mov      ecx, eax
  100234DA:  85 c9                           test     ecx, ecx
  100234DC:  74 1f                           je       0x100234fd
  100234DE:  83 39 00                        cmp      dword ptr [ecx], 0
  100234E1:  76 1a                           jbe      0x100234fd
  100234E3:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  100234E6:  33 c0                           xor      eax, eax
  100234E8:  83 c1 10                        add      ecx, 0x10
  100234EB:  0f 1f 44 00 00                  nop      dword ptr [eax + eax]
  100234F0:  39 11                           cmp      dword ptr [ecx], edx
  100234F2:  74 0c                           je       0x10023500
  100234F4:  40                              inc      eax
  100234F5:  83 c1 14                        add      ecx, 0x14
  100234F8:  83 f8 08                        cmp      eax, 8
  100234FB:  7c f3                           jl       0x100234f0
  100234FD:  83 c8 ff                        or       eax, 0xffffffff
  10023500:  5d                              pop      ebp
  10023501:  c3                              ret      


; === SkillbarMgr::GetSkillTemplate ===
; RVA: 0x00023510  Size: 22 bytes
; Exports: ?GetSkillTemplate@SkillbarMgr@GW@@YA_NAAUSkillTemplate@12@@Z
;
  10023510:  55                              push     ebp
  10023511:  8b ec                           mov      ebp, esp
  10023513:  ff 75 08                        push     dword ptr [ebp + 8]
  10023516:  e8 b5 ed fd ff                  call     0x100022d0  ; Agents::GetControlledCharacterId, GetControlledCharacterId
  1002351B:  50                              push     eax
  1002351C:  e8 0f 00 00 00                  call     0x10023530  ; SkillbarMgr::GetSkillTemplate
  10023521:  83 c4 08                        add      esp, 8
  10023524:  5d                              pop      ebp
  10023525:  c3                              ret      


; === SkillbarMgr::GetSkillTemplate ===
; RVA: 0x00023530  Size: 584 bytes
; Exports: ?GetSkillTemplate@SkillbarMgr@GW@@YA_NIAAUSkillTemplate@12@@Z
;
  10023530:  55                              push     ebp
  10023531:  8b ec                           mov      ebp, esp
  10023533:  51                              push     ecx
  10023534:  53                              push     ebx
  10023535:  56                              push     esi
  10023536:  8b 75 0c                        mov      esi, dword ptr [ebp + 0xc]
  10023539:  57                              push     edi
  1002353A:  68 8c 00 00 00                  push     0x8c
  1002353F:  6a 00                           push     0
  10023541:  56                              push     esi
  10023542:  e8 69 ab 00 00                  call     0x1002e0b0
  10023547:  83 c4 0c                        add      esp, 0xc
  1002354A:  e8 51 5b ff ff                  call     0x100190a0  ; GW::GetWorldContext
  1002354F:  85 c0                           test     eax, eax
  10023551:  74 2e                           je       0x10023581
  10023553:  05 f0 06 00 00                  add      eax, 0x6f0
  10023558:  83 38 00                        cmp      dword ptr [eax], 0
  1002355B:  74 24                           je       0x10023581
  1002355D:  85 c0                           test     eax, eax
  1002355F:  74 20                           je       0x10023581
  10023561:  8b 08                           mov      ecx, dword ptr [eax]
  10023563:  69 40 08 bc 00 00 00            imul     eax, dword ptr [eax + 8], 0xbc
  1002356A:  03 c1                           add      eax, ecx
  1002356C:  3b c8                           cmp      ecx, eax
  1002356E:  74 11                           je       0x10023581
  10023570:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  10023573:  39 19                           cmp      dword ptr [ecx], ebx
  10023575:  74 13                           je       0x1002358a
  10023577:  81 c1 bc 00 00 00               add      ecx, 0xbc
  1002357D:  3b c8                           cmp      ecx, eax
  1002357F:  75 f2                           jne      0x10023573
  10023581:  5f                              pop      edi
  10023582:  5e                              pop      esi
  10023583:  32 c0                           xor      al, al
  10023585:  5b                              pop      ebx
  10023586:  8b e5                           mov      esp, ebp
  10023588:  5d                              pop      ebp
  10023589:  c3                              ret      
  1002358A:  85 c9                           test     ecx, ecx
  1002358C:  74 f3                           je       0x10023581
  1002358E:  8b 15 c0 c4 08 10               mov      edx, dword ptr [0x1008c4c0]
  10023594:  85 d2                           test     edx, edx
  10023596:  74 0b                           je       0x100235a3
  10023598:  69 79 10 a4 00 00 00            imul     edi, dword ptr [ecx + 0x10], 0xa4
  1002359F:  03 fa                           add      edi, edx
  100235A1:  eb 02                           jmp      0x100235a5
  100235A3:  33 ff                           xor      edi, edi
  100235A5:  8b 47 10                        mov      eax, dword ptr [edi + 0x10]
  100235A8:  c1 e8 16                        shr      eax, 0x16
  100235AB:  a8 01                           test     al, 1
  100235AD:  8d 47 2c                        lea      eax, [edi + 0x2c]
  100235B0:  0f 44 c7                        cmove    eax, edi
  100235B3:  8b 00                           mov      eax, dword ptr [eax]
  100235B5:  89 46 6c                        mov      dword ptr [esi + 0x6c], eax
  100235B8:  85 d2                           test     edx, edx
  100235BA:  74 0b                           je       0x100235c7
  100235BC:  69 79 24 a4 00 00 00            imul     edi, dword ptr [ecx + 0x24], 0xa4
  100235C3:  03 fa                           add      edi, edx
  100235C5:  eb 02                           jmp      0x100235c9
  100235C7:  33 ff                           xor      edi, edi
  100235C9:  8b 47 10                        mov      eax, dword ptr [edi + 0x10]
  100235CC:  c1 e8 16                        shr      eax, 0x16
  100235CF:  a8 01                           test     al, 1
  100235D1:  8d 47 2c                        lea      eax, [edi + 0x2c]
  100235D4:  0f 44 c7                        cmove    eax, edi
  100235D7:  8b 00                           mov      eax, dword ptr [eax]
  100235D9:  89 46 70                        mov      dword ptr [esi + 0x70], eax
  100235DC:  85 d2                           test     edx, edx
  100235DE:  74 0b                           je       0x100235eb
  100235E0:  69 79 38 a4 00 00 00            imul     edi, dword ptr [ecx + 0x38], 0xa4
  100235E7:  03 fa                           add      edi, edx
  100235E9:  eb 02                           jmp      0x100235ed
  100235EB:  33 ff                           xor      edi, edi
  100235ED:  8b 47 10                        mov      eax, dword ptr [edi + 0x10]
  100235F0:  c1 e8 16                        shr      eax, 0x16
  100235F3:  a8 01                           test     al, 1
  100235F5:  8d 47 2c                        lea      eax, [edi + 0x2c]
  100235F8:  0f 44 c7                        cmove    eax, edi
  100235FB:  8b 00                           mov      eax, dword ptr [eax]
  100235FD:  89 46 74                        mov      dword ptr [esi + 0x74], eax
  10023600:  85 d2                           test     edx, edx
  10023602:  74 0b                           je       0x1002360f
  10023604:  69 79 4c a4 00 00 00            imul     edi, dword ptr [ecx + 0x4c], 0xa4
  1002360B:  03 fa                           add      edi, edx
  1002360D:  eb 02                           jmp      0x10023611
  1002360F:  33 ff                           xor      edi, edi
  10023611:  8b 47 10                        mov      eax, dword ptr [edi + 0x10]
  10023614:  c1 e8 16                        shr      eax, 0x16
  10023617:  a8 01                           test     al, 1
  10023619:  8d 47 2c                        lea      eax, [edi + 0x2c]
  1002361C:  0f 44 c7                        cmove    eax, edi
  1002361F:  8b 00                           mov      eax, dword ptr [eax]
  10023621:  89 46 78                        mov      dword ptr [esi + 0x78], eax
  10023624:  85 d2                           test     edx, edx
  10023626:  74 0b                           je       0x10023633
  10023628:  69 79 60 a4 00 00 00            imul     edi, dword ptr [ecx + 0x60], 0xa4
  1002362F:  03 fa                           add      edi, edx
  10023631:  eb 02                           jmp      0x10023635
  10023633:  33 ff                           xor      edi, edi
  10023635:  8b 47 10                        mov      eax, dword ptr [edi + 0x10]
  10023638:  c1 e8 16                        shr      eax, 0x16
  1002363B:  a8 01                           test     al, 1
  1002363D:  8d 47 2c                        lea      eax, [edi + 0x2c]
  10023640:  0f 44 c7                        cmove    eax, edi
  10023643:  8b 00                           mov      eax, dword ptr [eax]
  10023645:  89 46 7c                        mov      dword ptr [esi + 0x7c], eax
  10023648:  85 d2                           test     edx, edx
  1002364A:  74 0b                           je       0x10023657
  1002364C:  69 79 74 a4 00 00 00            imul     edi, dword ptr [ecx + 0x74], 0xa4
  10023653:  03 fa                           add      edi, edx
  10023655:  eb 02                           jmp      0x10023659
  10023657:  33 ff                           xor      edi, edi
  10023659:  8b 47 10                        mov      eax, dword ptr [edi + 0x10]
  1002365C:  c1 e8 16                        shr      eax, 0x16
  1002365F:  a8 01                           test     al, 1
  10023661:  8d 47 2c                        lea      eax, [edi + 0x2c]
  10023664:  0f 44 c7                        cmove    eax, edi
  10023667:  8b 00                           mov      eax, dword ptr [eax]
  10023669:  89 86 80 00 00 00               mov      dword ptr [esi + 0x80], eax
  1002366F:  85 d2                           test     edx, edx
  10023671:  74 0e                           je       0x10023681
  10023673:  69 b9 88 00 00 00 a4 00 00 00   imul     edi, dword ptr [ecx + 0x88], 0xa4
  1002367D:  03 fa                           add      edi, edx
  1002367F:  eb 02                           jmp      0x10023683
  10023681:  33 ff                           xor      edi, edi
  10023683:  8b 47 10                        mov      eax, dword ptr [edi + 0x10]
  10023686:  c1 e8 16                        shr      eax, 0x16
  10023689:  a8 01                           test     al, 1
  1002368B:  8d 47 2c                        lea      eax, [edi + 0x2c]
  1002368E:  0f 44 c7                        cmove    eax, edi
  10023691:  8b 00                           mov      eax, dword ptr [eax]
  10023693:  89 86 84 00 00 00               mov      dword ptr [esi + 0x84], eax
  10023699:  85 d2                           test     edx, edx
  1002369B:  74 0e                           je       0x100236ab
  1002369D:  69 89 9c 00 00 00 a4 00 00 00   imul     ecx, dword ptr [ecx + 0x9c], 0xa4
  100236A7:  03 ca                           add      ecx, edx
  100236A9:  eb 02                           jmp      0x100236ad
  100236AB:  33 c9                           xor      ecx, ecx
  100236AD:  8b 41 10                        mov      eax, dword ptr [ecx + 0x10]
  100236B0:  c1 e8 16                        shr      eax, 0x16
  100236B3:  a8 01                           test     al, 1
  100236B5:  8d 41 2c                        lea      eax, [ecx + 0x2c]
  100236B8:  0f 44 c1                        cmove    eax, ecx
  100236BB:  8b 00                           mov      eax, dword ptr [eax]
  100236BD:  89 86 88 00 00 00               mov      dword ptr [esi + 0x88], eax
  100236C3:  e8 d8 59 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  100236C8:  85 c0                           test     eax, eax
  100236CA:  74 32                           je       0x100236fe
  100236CC:  8b 88 bc 06 00 00               mov      ecx, dword ptr [eax + 0x6bc]
  100236D2:  8b 80 c4 06 00 00               mov      eax, dword ptr [eax + 0x6c4]
  100236D8:  8d 04 80                        lea      eax, [eax + eax*4]
  100236DB:  8d 04 81                        lea      eax, [ecx + eax*4]
  100236DE:  3b c8                           cmp      ecx, eax
  100236E0:  74 1c                           je       0x100236fe
  100236E2:  39 19                           cmp      dword ptr [ecx], ebx
  100236E4:  74 09                           je       0x100236ef
  100236E6:  83 c1 14                        add      ecx, 0x14
  100236E9:  3b c8                           cmp      ecx, eax
  100236EB:  75 f5                           jne      0x100236e2
  100236ED:  eb 0f                           jmp      0x100236fe
  100236EF:  85 c9                           test     ecx, ecx
  100236F1:  74 0b                           je       0x100236fe
  100236F3:  8b 41 04                        mov      eax, dword ptr [ecx + 4]
  100236F6:  89 06                           mov      dword ptr [esi], eax
  100236F8:  8b 41 08                        mov      eax, dword ptr [ecx + 8]
  100236FB:  89 46 04                        mov      dword ptr [esi + 4], eax
  100236FE:  e8 cd 58 ff ff                  call     0x10018fd0  ; GW::GetGameContext
  10023703:  8b 40 2c                        mov      eax, dword ptr [eax + 0x2c]
  10023706:  8b 98 ac 00 00 00               mov      ebx, dword ptr [eax + 0xac]
  1002370C:  69 80 b4 00 00 00 3c 04 00 00   imul     eax, dword ptr [eax + 0xb4], 0x43c
  10023716:  03 c3                           add      eax, ebx
  10023718:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  1002371B:  3b d8                           cmp      ebx, eax
  1002371D:  74 50                           je       0x1002376f
  1002371F:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10023722:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10023725:  39 03                           cmp      dword ptr [ebx], eax
  10023727:  75 3c                           jne      0x10023765
  10023729:  33 c0                           xor      eax, eax
  1002372B:  8d 7b 08                        lea      edi, [ebx + 8]
  1002372E:  66 90                           nop      
  10023730:  83 f8 2c                        cmp      eax, 0x2c
  10023733:  77 21                           ja       0x10023756
  10023735:  83 3f 00                        cmp      dword ptr [edi], 0
  10023738:  74 1c                           je       0x10023756
  1002373A:  8b 4e 08                        mov      ecx, dword ptr [esi + 8]
  1002373D:  83 f9 0c                        cmp      ecx, 0xc
  10023740:  0f 84 3b fe ff ff               je       0x10023581
  10023746:  89 44 8e 0c                     mov      dword ptr [esi + ecx*4 + 0xc], eax
  1002374A:  8b 56 08                        mov      edx, dword ptr [esi + 8]
  1002374D:  8b 0f                           mov      ecx, dword ptr [edi]
  1002374F:  89 4c 96 3c                     mov      dword ptr [esi + edx*4 + 0x3c], ecx
  10023753:  ff 46 08                        inc      dword ptr [esi + 8]
  10023756:  40                              inc      eax
  10023757:  83 c7 14                        add      edi, 0x14
  1002375A:  83 f8 36                        cmp      eax, 0x36
  1002375D:  72 d1                           jb       0x10023730
  1002375F:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10023762:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10023765:  81 c3 3c 04 00 00               add      ebx, 0x43c
  1002376B:  3b d9                           cmp      ebx, ecx
  1002376D:  75 b6                           jne      0x10023725
  1002376F:  5f                              pop      edi
  10023770:  5e                              pop      esi
  10023771:  b0 01                           mov      al, 1
  10023773:  5b                              pop      ebx
  10023774:  8b e5                           mov      esp, ebp
  10023776:  5d                              pop      ebp
  10023777:  c3                              ret      


; === SkillbarMgr::GetSkillbar, GetSkillbar ===
; RVA: 0x00023780  Size: 66 bytes
; Exports: ?GetSkillbar@SkillbarMgr@GW@@YAPAUSkillbar@2@I@Z, GetSkillbar
;
  10023780:  55                              push     ebp
  10023781:  8b ec                           mov      ebp, esp
  10023783:  e8 18 59 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  10023788:  85 c0                           test     eax, eax
  1002378A:  74 32                           je       0x100237be
  1002378C:  83 b8 f0 06 00 00 00            cmp      dword ptr [eax + 0x6f0], 0
  10023793:  8d 88 f0 06 00 00               lea      ecx, [eax + 0x6f0]
  10023799:  74 23                           je       0x100237be
  1002379B:  85 c9                           test     ecx, ecx
  1002379D:  74 1f                           je       0x100237be
  1002379F:  8b 01                           mov      eax, dword ptr [ecx]
  100237A1:  69 49 08 bc 00 00 00            imul     ecx, dword ptr [ecx + 8], 0xbc
  100237A8:  03 c8                           add      ecx, eax
  100237AA:  3b c1                           cmp      eax, ecx
  100237AC:  74 10                           je       0x100237be
  100237AE:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  100237B1:  39 10                           cmp      dword ptr [eax], edx
  100237B3:  74 0b                           je       0x100237c0
  100237B5:  05 bc 00 00 00                  add      eax, 0xbc
  100237BA:  3b c1                           cmp      eax, ecx
  100237BC:  75 f3                           jne      0x100237b1
  100237BE:  33 c0                           xor      eax, eax
  100237C0:  5d                              pop      ebp
  100237C1:  c3                              ret      


; === SkillbarMgr::GetSkillbarArray ===
; RVA: 0x000237D0  Size: 22 bytes
; Exports: ?GetSkillbarArray@SkillbarMgr@GW@@YAPAV?$Array@USkillbar@GW@@@2@XZ
;
  100237D0:  e8 cb 58 ff ff                  call     0x100190a0  ; GW::GetWorldContext
  100237D5:  85 c0                           test     eax, eax
  100237D7:  74 0a                           je       0x100237e3
  100237D9:  05 f0 06 00 00                  add      eax, 0x6f0
  100237DE:  83 38 00                        cmp      dword ptr [eax], 0
  100237E1:  75 02                           jne      0x100237e5
  100237E3:  33 c0                           xor      eax, eax
  100237E5:  c3                              ret      


; === SkillbarMgr::LoadSkillTemplate ===
; RVA: 0x00023870  Size: 22 bytes
; Exports: ?LoadSkillTemplate@SkillbarMgr@GW@@YA_NAAUSkillTemplate@12@@Z
;
  10023870:  55                              push     ebp
  10023871:  8b ec                           mov      ebp, esp
  10023873:  ff 75 08                        push     dword ptr [ebp + 8]
  10023876:  e8 55 ea fd ff                  call     0x100022d0  ; Agents::GetControlledCharacterId, GetControlledCharacterId
  1002387B:  50                              push     eax
  1002387C:  e8 0f 00 00 00                  call     0x10023890  ; SkillbarMgr::LoadSkillTemplate
  10023881:  83 c4 08                        add      esp, 8
  10023884:  5d                              pop      ebp
  10023885:  c3                              ret      


; === SkillbarMgr::LoadSkillTemplate ===
; RVA: 0x00023890  Size: 647 bytes
; Exports: ?LoadSkillTemplate@SkillbarMgr@GW@@YA_NIAAUSkillTemplate@12@@Z
;
  10023890:  55                              push     ebp
  10023891:  8b ec                           mov      ebp, esp
  10023893:  6a ff                           push     -1
  10023895:  68 7d b2 04 10                  push     0x1004b27d
  1002389A:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  100238A0:  50                              push     eax
  100238A1:  81 ec 98 00 00 00               sub      esp, 0x98
  100238A7:  53                              push     ebx
  100238A8:  56                              push     esi
  100238A9:  57                              push     edi
  100238AA:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  100238AF:  33 c5                           xor      eax, ebp
  100238B1:  50                              push     eax
  100238B2:  8d 45 f4                        lea      eax, [ebp - 0xc]
  100238B5:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  100238BB:  83 3d c8 c4 08 10 00            cmp      dword ptr [0x1008c4c8], 0
  100238C2:  0f 84 82 01 00 00               je       0x10023a4a
  100238C8:  e8 93 9b ff ff                  call     0x1001d460  ; Map::GetInstanceType, GetInstanceType
  100238CD:  85 c0                           test     eax, eax
  100238CF:  0f 85 75 01 00 00               jne      0x10023a4a
  100238D5:  e8 76 bd ff ff                  call     0x1001f650  ; PartyMgr::GetIsPartyLoaded
  100238DA:  84 c0                           test     al, al
  100238DC:  0f 84 68 01 00 00               je       0x10023a4a
  100238E2:  e8 e9 e9 fd ff                  call     0x100022d0  ; Agents::GetControlledCharacterId, GetControlledCharacterId
  100238E7:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  100238EA:  8b f8                           mov      edi, eax
  100238EC:  53                              push     ebx
  100238ED:  89 7d f0                        mov      dword ptr [ebp - 0x10], edi
  100238F0:  e8 1b f9 ff ff                  call     0x10023210
  100238F5:  8b d0                           mov      edx, eax
  100238F7:  83 c4 04                        add      esp, 4
  100238FA:  89 55 ec                        mov      dword ptr [ebp - 0x14], edx
  100238FD:  85 d2                           test     edx, edx
  100238FF:  0f 84 45 01 00 00               je       0x10023a4a
  10023905:  8b 75 0c                        mov      esi, dword ptr [ebp + 0xc]
  10023908:  8b 06                           mov      eax, dword ptr [esi]
  1002390A:  85 c0                           test     eax, eax
  1002390C:  0f 84 98 00 00 00               je       0x100239aa
  10023912:  39 42 04                        cmp      dword ptr [edx + 4], eax
  10023915:  0f 84 8f 00 00 00               je       0x100239aa
  1002391B:  8b 1d c4 c4 08 10               mov      ebx, dword ptr [0x1008c4c4]
  10023921:  8d 56 0c                        lea      edx, [esi + 0xc]
  10023924:  33 ff                           xor      edi, edi
  10023926:  8b 0a                           mov      ecx, dword ptr [edx]
  10023928:  85 db                           test     ebx, ebx
  1002392A:  74 3f                           je       0x1002396b
  1002392C:  39 0d 54 a2 08 10               cmp      dword ptr [0x1008a254], ecx
  10023932:  76 37                           jbe      0x1002396b
  10023934:  8d 04 89                        lea      eax, [ecx + ecx*4]
  10023937:  8d 1c 83                        lea      ebx, [ebx + eax*4]
  1002393A:  85 db                           test     ebx, ebx
  1002393C:  74 27                           je       0x10023965
  1002393E:  83 f9 2c                        cmp      ecx, 0x2c
  10023941:  77 12                           ja       0x10023955
  10023943:  0f b6 81 68 3a 02 10            movzx    eax, byte ptr [ecx + 0x10023a68]
  1002394A:  ff 24 85 60 3a 02 10            jmp      dword ptr [eax*4 + 0x10023a60]
  10023951:  b0 01                           mov      al, 1
  10023953:  eb 02                           jmp      0x10023957
  10023955:  32 c0                           xor      al, al
  10023957:  8b 0e                           mov      ecx, dword ptr [esi]
  10023959:  39 0b                           cmp      dword ptr [ebx], ecx
  1002395B:  75 08                           jne      0x10023965
  1002395D:  84 c0                           test     al, al
  1002395F:  0f 85 e5 00 00 00               jne      0x10023a4a
  10023965:  8b 1d c4 c4 08 10               mov      ebx, dword ptr [0x1008c4c4]
  1002396B:  47                              inc      edi
  1002396C:  83 c2 04                        add      edx, 4
  1002396F:  83 ff 0c                        cmp      edi, 0xc
  10023972:  72 b2                           jb       0x10023926
  10023974:  ff 36                           push     dword ptr [esi]
  10023976:  56                              push     esi
  10023977:  e8 74 fe ff ff                  call     0x100237f0
  1002397C:  83 c4 08                        add      esp, 8
  1002397F:  84 c0                           test     al, al
  10023981:  74 19                           je       0x1002399c
  10023983:  ff 76 04                        push     dword ptr [esi + 4]
  10023986:  56                              push     esi
  10023987:  e8 64 fe ff ff                  call     0x100237f0
  1002398C:  83 c4 08                        add      esp, 8
  1002398F:  84 c0                           test     al, al
  10023991:  0f 85 b3 00 00 00               jne      0x10023a4a
  10023997:  8b 06                           mov      eax, dword ptr [esi]
  10023999:  89 46 04                        mov      dword ptr [esi + 4], eax
  1002399C:  8b 55 ec                        mov      edx, dword ptr [ebp - 0x14]
  1002399F:  8b 7d f0                        mov      edi, dword ptr [ebp - 0x10]
  100239A2:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  100239A5:  8b 42 04                        mov      eax, dword ptr [edx + 4]
  100239A8:  89 06                           mov      dword ptr [esi], eax
  100239AA:  8b 4e 04                        mov      ecx, dword ptr [esi + 4]
  100239AD:  85 c9                           test     ecx, ecx
  100239AF:  74 25                           je       0x100239d6
  100239B1:  3b fb                           cmp      edi, ebx
  100239B3:  75 21                           jne      0x100239d6
  100239B5:  b8 01 00 00 00                  mov      eax, 1
  100239BA:  d3 e0                           shl      eax, cl
  100239BC:  85 42 0c                        test     dword ptr [edx + 0xc], eax
  100239BF:  75 15                           jne      0x100239d6
  100239C1:  51                              push     ecx
  100239C2:  56                              push     esi
  100239C3:  e8 28 fe ff ff                  call     0x100237f0
  100239C8:  83 c4 08                        add      esp, 8
  100239CB:  84 c0                           test     al, al
  100239CD:  75 7b                           jne      0x10023a4a
  100239CF:  c7 46 04 00 00 00 00            mov      dword ptr [esi + 4], 0
  100239D6:  6a 00                           push     0
  100239D8:  89 9d 5c ff ff ff               mov      dword ptr [ebp - 0xa4], ebx
  100239DE:  8d bd 60 ff ff ff               lea      edi, [ebp - 0xa0]
  100239E4:  83 ec 28                        sub      esp, 0x28
  100239E7:  b9 23 00 00 00                  mov      ecx, 0x23
  100239EC:  8b dc                           mov      ebx, esp
  100239EE:  f3 a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
  100239F0:  89 5d f0                        mov      dword ptr [ebp - 0x10], ebx
  100239F3:  c7 43 24 00 00 00 00            mov      dword ptr [ebx + 0x24], 0
  100239FA:  68 94 00 00 00                  push     0x94
  100239FF:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  10023A06:  e8 52 86 00 00                  call     0x1002c05d
  10023A0B:  83 c4 04                        add      esp, 4
  10023A0E:  c7 45 fc ff ff ff ff            mov      dword ptr [ebp - 4], 0xffffffff
  10023A15:  b9 24 00 00 00                  mov      ecx, 0x24
  10023A1A:  8d b5 5c ff ff ff               lea      esi, [ebp - 0xa4]
  10023A20:  8d 78 04                        lea      edi, [eax + 4]
  10023A23:  c7 00 b0 3b 05 10               mov      dword ptr [eax], 0x10053bb0
  10023A29:  f3 a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
  10023A2B:  89 43 24                        mov      dword ptr [ebx + 0x24], eax
  10023A2E:  e8 0d 66 ff ff                  call     0x1001a040  ; GameThread::Enqueue
  10023A33:  83 c4 2c                        add      esp, 0x2c
  10023A36:  b0 01                           mov      al, 1
  10023A38:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  10023A3B:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  10023A42:  59                              pop      ecx
  10023A43:  5f                              pop      edi
  10023A44:  5e                              pop      esi
  10023A45:  5b                              pop      ebx
  10023A46:  8b e5                           mov      esp, ebp
  10023A48:  5d                              pop      ebp
  10023A49:  c3                              ret      
  10023A4A:  32 c0                           xor      al, al
  10023A4C:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  10023A4F:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  10023A56:  59                              pop      ecx
  10023A57:  5f                              pop      edi
  10023A58:  5e                              pop      esi
  10023A59:  5b                              pop      ebx
  10023A5A:  8b e5                           mov      esp, ebp
  10023A5C:  5d                              pop      ebp
  10023A5D:  c3                              ret      
  10023A5E:  66 90                           nop      
  10023A60:  51                              push     ecx
  10023A61:  39 02                           cmp      dword ptr [edx], eax
  10023A63:  10 55 39                        adc      byte ptr [ebp + 0x39], dl
  10023A66:  02 10                           add      dl, byte ptr [eax]
  10023A68:  00 01                           add      byte ptr [ecx], al
  10023A6A:  01 01                           add      dword ptr [ecx], eax
  10023A6C:  01 01                           add      dword ptr [ecx], eax
  10023A6E:  00 01                           add      byte ptr [ecx], al
  10023A70:  01 01                           add      dword ptr [ecx], eax
  10023A72:  01 01                           add      dword ptr [ecx], eax
  10023A74:  00 01                           add      byte ptr [ecx], al
  10023A76:  01 01                           add      dword ptr [ecx], eax
  10023A78:  00 00                           add      byte ptr [eax], al
  10023A7A:  01 01                           add      dword ptr [ecx], eax
  10023A7C:  01 01                           add      dword ptr [ecx], eax
  10023A7E:  01 00                           add      dword ptr [eax], eax
  10023A80:  01 01                           add      dword ptr [ecx], eax
  10023A82:  01 01                           add      dword ptr [ecx], eax
  10023A84:  01 01                           add      dword ptr [ecx], eax
  10023A86:  01 01                           add      dword ptr [ecx], eax
  10023A88:  01 01                           add      dword ptr [ecx], eax
  10023A8A:  01 00                           add      dword ptr [eax], eax
  10023A8C:  00 01                           add      byte ptr [ecx], al
  10023A8E:  01 01                           add      dword ptr [ecx], eax
  10023A90:  00 01                           add      byte ptr [ecx], al
  10023A92:  01 01                           add      dword ptr [ecx], eax
  10023A94:  00 cc                           add      ah, cl
  10023A96:  cc                              int3     
  10023A97:  cc                              int3     
  10023A98:  cc                              int3     
  10023A99:  cc                              int3     
  10023A9A:  cc                              int3     
  10023A9B:  cc                              int3     
  10023A9C:  cc                              int3     
  10023A9D:  cc                              int3     
  10023A9E:  cc                              int3     
  10023A9F:  cc                              int3     
  10023AA0:  55                              push     ebp
  10023AA1:  8b ec                           mov      ebp, esp
  10023AA3:  81 ec 90 00 00 00               sub      esp, 0x90
  10023AA9:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  10023AAE:  33 c5                           xor      eax, ebp
  10023AB0:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10023AB3:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10023AB6:  0f 57 c0                        xorps    xmm0, xmm0
  10023AB9:  50                              push     eax
  10023ABA:  8d 85 70 ff ff ff               lea      eax, [ebp - 0x90]
  10023AC0:  c7 85 70 ff ff ff 00 00 00 00   mov      dword ptr [ebp - 0x90], 0
  10023ACA:  50                              push     eax
  10023ACB:  c7 85 74 ff ff ff 00 00 00 00   mov      dword ptr [ebp - 0x8c], 0
  10023AD5:  0f 11 45 dc                     movups   xmmword ptr [ebp - 0x24], xmm0
  10023AD9:  0f 11 45 ec                     movups   xmmword ptr [ebp - 0x14], xmm0
  10023ADD:  e8 ee ec ff ff                  call     0x100227d0  ; SkillbarMgr::DecodeSkillTemplate
  10023AE2:  83 c4 08                        add      esp, 8
  10023AE5:  84 c0                           test     al, al
  10023AE7:  75 0e                           jne      0x10023af7
  10023AE9:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10023AEC:  33 cd                           xor      ecx, ebp
  10023AEE:  e8 c4 88 00 00                  call     0x1002c3b7
  10023AF3:  8b e5                           mov      esp, ebp
  10023AF5:  5d                              pop      ebp
  10023AF6:  c3                              ret      
  10023AF7:  8d 85 70 ff ff ff               lea      eax, [ebp - 0x90]
  10023AFD:  50                              push     eax
  10023AFE:  ff 75 08                        push     dword ptr [ebp + 8]
  10023B01:  e8 8a fd ff ff                  call     0x10023890  ; SkillbarMgr::LoadSkillTemplate
  10023B06:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10023B09:  83 c4 08                        add      esp, 8
  10023B0C:  33 cd                           xor      ecx, ebp
  10023B0E:  e8 a4 88 00 00                  call     0x1002c3b7
  10023B13:  8b e5                           mov      esp, ebp
  10023B15:  5d                              pop      ebp
  10023B16:  c3                              ret      


; === SkillbarMgr::LoadSkillTemplate ===
; RVA: 0x00023AA0  Size: 119 bytes
; Exports: ?LoadSkillTemplate@SkillbarMgr@GW@@YA_NIPBD@Z
;
  10023AA0:  55                              push     ebp
  10023AA1:  8b ec                           mov      ebp, esp
  10023AA3:  81 ec 90 00 00 00               sub      esp, 0x90
  10023AA9:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  10023AAE:  33 c5                           xor      eax, ebp
  10023AB0:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10023AB3:  8b 45 0c                        mov      eax, dword ptr [ebp + 0xc]
  10023AB6:  0f 57 c0                        xorps    xmm0, xmm0
  10023AB9:  50                              push     eax
  10023ABA:  8d 85 70 ff ff ff               lea      eax, [ebp - 0x90]
  10023AC0:  c7 85 70 ff ff ff 00 00 00 00   mov      dword ptr [ebp - 0x90], 0
  10023ACA:  50                              push     eax
  10023ACB:  c7 85 74 ff ff ff 00 00 00 00   mov      dword ptr [ebp - 0x8c], 0
  10023AD5:  0f 11 45 dc                     movups   xmmword ptr [ebp - 0x24], xmm0
  10023AD9:  0f 11 45 ec                     movups   xmmword ptr [ebp - 0x14], xmm0
  10023ADD:  e8 ee ec ff ff                  call     0x100227d0  ; SkillbarMgr::DecodeSkillTemplate
  10023AE2:  83 c4 08                        add      esp, 8
  10023AE5:  84 c0                           test     al, al
  10023AE7:  75 0e                           jne      0x10023af7
  10023AE9:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10023AEC:  33 cd                           xor      ecx, ebp
  10023AEE:  e8 c4 88 00 00                  call     0x1002c3b7
  10023AF3:  8b e5                           mov      esp, ebp
  10023AF5:  5d                              pop      ebp
  10023AF6:  c3                              ret      
  10023AF7:  8d 85 70 ff ff ff               lea      eax, [ebp - 0x90]
  10023AFD:  50                              push     eax
  10023AFE:  ff 75 08                        push     dword ptr [ebp + 8]
  10023B01:  e8 8a fd ff ff                  call     0x10023890  ; SkillbarMgr::LoadSkillTemplate
  10023B06:  8b 4d fc                        mov      ecx, dword ptr [ebp - 4]
  10023B09:  83 c4 08                        add      esp, 8
  10023B0C:  33 cd                           xor      ecx, ebp
  10023B0E:  e8 a4 88 00 00                  call     0x1002c3b7
  10023B13:  8b e5                           mov      esp, ebp
  10023B15:  5d                              pop      ebp
  10023B16:  c3                              ret      


; === SkillbarMgr::LoadSkillTemplate, LoadSkillTemplateString ===
; RVA: 0x00023B20  Size: 22 bytes
; Exports: ?LoadSkillTemplate@SkillbarMgr@GW@@YA_NPBD@Z, LoadSkillTemplateString
;
  10023B20:  55                              push     ebp
  10023B21:  8b ec                           mov      ebp, esp
  10023B23:  ff 75 08                        push     dword ptr [ebp + 8]
  10023B26:  e8 a5 e7 fd ff                  call     0x100022d0  ; Agents::GetControlledCharacterId, GetControlledCharacterId
  10023B2B:  50                              push     eax
  10023B2C:  e8 6f ff ff ff                  call     0x10023aa0  ; SkillbarMgr::LoadSkillTemplate
  10023B31:  83 c4 08                        add      esp, 8
  10023B34:  5d                              pop      ebp
  10023B35:  c3                              ret      


; === SkillbarMgr::UseSkill ===
; RVA: 0x00023B90  Size: 123 bytes
; Exports: ?UseSkill@SkillbarMgr@GW@@YA_NII@Z
;
  10023B90:  55                              push     ebp
  10023B91:  8b ec                           mov      ebp, esp
  10023B93:  56                              push     esi
  10023B94:  8b 75 0c                        mov      esi, dword ptr [ebp + 0xc]
  10023B97:  85 f6                           test     esi, esi
  10023B99:  74 12                           je       0x10023bad
  10023B9B:  e8 20 ec fd ff                  call     0x100027c0  ; Agents::GetTargetId, GetTargetId
  10023BA0:  3b f0                           cmp      esi, eax
  10023BA2:  74 09                           je       0x10023bad
  10023BA4:  56                              push     esi
  10023BA5:  e8 a6 e2 fd ff                  call     0x10001e50  ; Agents::ChangeTarget, ChangeTargetById
  10023BAA:  83 c4 04                        add      esp, 4
  10023BAD:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10023BB0:  83 fe 08                        cmp      esi, 8
  10023BB3:  73 51                           jae      0x10023c06
  10023BB5:  e8 a6 f8 ff ff                  call     0x10023460  ; SkillbarMgr::GetPlayerSkillbar
  10023BBA:  85 c0                           test     eax, eax
  10023BBC:  74 48                           je       0x10023c06
  10023BBE:  8d 0c b6                        lea      ecx, [esi + esi*4]
  10023BC1:  8b 44 88 10                     mov      eax, dword ptr [eax + ecx*4 + 0x10]
  10023BC5:  85 c0                           test     eax, eax
  10023BC7:  74 3d                           je       0x10023c06
  10023BC9:  8b 0d c0 c4 08 10               mov      ecx, dword ptr [0x1008c4c0]
  10023BCF:  85 c9                           test     ecx, ecx
  10023BD1:  74 0a                           je       0x10023bdd
  10023BD3:  69 c0 a4 00 00 00               imul     eax, eax, 0xa4
  10023BD9:  03 c1                           add      eax, ecx
  10023BDB:  eb 02                           jmp      0x10023bdf
  10023BDD:  33 c0                           xor      eax, eax
  10023BDF:  85 c0                           test     eax, eax
  10023BE1:  74 23                           je       0x10023c06
  10023BE3:  8b 40 10                        mov      eax, dword ptr [eax + 0x10]
  10023BE6:  c1 e8 16                        shr      eax, 0x16
  10023BE9:  a8 01                           test     al, 1
  10023BEB:  74 05                           je       0x10023bf2
  10023BED:  b0 01                           mov      al, 1
  10023BEF:  5e                              pop      esi
  10023BF0:  5d                              pop      ebp
  10023BF1:  c3                              ret      
  10023BF2:  8d 86 a4 00 00 00               lea      eax, [esi + 0xa4]
  10023BF8:  6a 00                           push     0
  10023BFA:  50                              push     eax
  10023BFB:  e8 c0 31 00 00                  call     0x10026dc0  ; UI::Keypress
  10023C00:  83 c4 08                        add      esp, 8
  10023C03:  5e                              pop      esi
  10023C04:  5d                              pop      ebp
  10023C05:  c3                              ret      
  10023C06:  32 c0                           xor      al, al
  10023C08:  5e                              pop      esi
  10023C09:  5d                              pop      ebp
  10023C0A:  c3                              ret      


; === SkillbarMgr::UseSkillByID, UseSkillByID ===
; RVA: 0x00023C10  Size: 58 bytes
; Exports: ?UseSkillByID@SkillbarMgr@GW@@YA_NII@Z, UseSkillByID
;
  10023C10:  55                              push     ebp
  10023C11:  8b ec                           mov      ebp, esp
  10023C13:  e8 48 f8 ff ff                  call     0x10023460  ; SkillbarMgr::GetPlayerSkillbar
  10023C18:  85 c0                           test     eax, eax
  10023C1A:  74 21                           je       0x10023c3d
  10023C1C:  83 38 00                        cmp      dword ptr [eax], 0
  10023C1F:  76 1c                           jbe      0x10023c3d
  10023C21:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  10023C24:  33 c9                           xor      ecx, ecx
  10023C26:  83 c0 10                        add      eax, 0x10
  10023C29:  0f 1f 80 00 00 00 00            nop      dword ptr [eax]
  10023C30:  39 10                           cmp      dword ptr [eax], edx
  10023C32:  74 0d                           je       0x10023c41
  10023C34:  41                              inc      ecx
  10023C35:  83 c0 14                        add      eax, 0x14
  10023C38:  83 f9 08                        cmp      ecx, 8
  10023C3B:  7c f3                           jl       0x10023c30
  10023C3D:  32 c0                           xor      al, al
  10023C3F:  5d                              pop      ebp
  10023C40:  c3                              ret      
  10023C41:  89 4d 08                        mov      dword ptr [ebp + 8], ecx
  10023C44:  5d                              pop      ebp
  10023C45:  e9 46 ff ff ff                  jmp      0x10023b90


