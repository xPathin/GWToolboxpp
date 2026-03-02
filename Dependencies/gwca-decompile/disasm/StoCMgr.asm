; Module: StoCMgr
; Functions: 6
; Total code size: 1439 bytes
;

; === StoC::EmulatePacket ===
; RVA: 0x00024520  Size: 74 bytes
; Exports: ?EmulatePacket@StoC@GW@@YA_NPAUPacketBase@1Packet@2@@Z
;
  10024520:  55                              push     ebp
  10024521:  8b ec                           mov      ebp, esp
  10024523:  68 d8 c4 08 10                  push     0x1008c4d8
  10024528:  ff 15 34 c0 04 10               call     dword ptr [0x1004c034]
  1002452E:  83 3d f0 c4 08 10 00            cmp      dword ptr [0x1008c4f0], 0
  10024535:  74 24                           je       0x1002455b
  10024537:  8b 0d f4 c4 08 10               mov      ecx, dword ptr [0x1008c4f4]
  1002453D:  85 c9                           test     ecx, ecx
  1002453F:  74 1a                           je       0x1002455b
  10024541:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  10024544:  8b 02                           mov      eax, dword ptr [edx]
  10024546:  39 05 d4 c4 08 10               cmp      dword ptr [0x1008c4d4], eax
  1002454C:  76 0d                           jbe      0x1002455b
  1002454E:  8d 04 40                        lea      eax, [eax + eax*2]
  10024551:  8b 44 81 08                     mov      eax, dword ptr [ecx + eax*4 + 8]
  10024555:  52                              push     edx
  10024556:  ff d0                           call     eax
  10024558:  83 c4 04                        add      esp, 4
  1002455B:  68 d8 c4 08 10                  push     0x1008c4d8
  10024560:  ff 15 38 c0 04 10               call     dword ptr [0x1004c038]
  10024566:  32 c0                           xor      al, al
  10024568:  5d                              pop      ebp
  10024569:  c3                              ret      


; === StoC::RegisterPacketCallback ===
; RVA: 0x00024820  Size: 379 bytes
; Exports: ?RegisterPacketCallback@StoC@GW@@YA_NPAUHookEntry@2@IABV?$function@$$A6AXPAUHookStatus@GW@@PAUPacketBase@StoC@Packet@2@@Z@std@@H@Z
;
  10024820:  55                              push     ebp
  10024821:  8b ec                           mov      ebp, esp
  10024823:  6a ff                           push     -1
  10024825:  68 b5 b2 04 10                  push     0x1004b2b5
  1002482A:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  10024830:  50                              push     eax
  10024831:  83 ec 44                        sub      esp, 0x44
  10024834:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  10024839:  33 c5                           xor      eax, ebp
  1002483B:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  1002483E:  53                              push     ebx
  1002483F:  56                              push     esi
  10024840:  57                              push     edi
  10024841:  50                              push     eax
  10024842:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10024845:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  1002484B:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  1002484E:  32 db                           xor      bl, bl
  10024850:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  10024853:  8b 7d 0c                        mov      edi, dword ptr [ebp + 0xc]
  10024856:  68 d8 c4 08 10                  push     0x1008c4d8
  1002485B:  89 75 b8                        mov      dword ptr [ebp - 0x48], esi
  1002485E:  89 45 bc                        mov      dword ptr [ebp - 0x44], eax
  10024861:  ff 15 34 c0 04 10               call     dword ptr [0x1004c034]
  10024867:  56                              push     esi
  10024868:  57                              push     edi
  10024869:  e8 52 01 00 00                  call     0x100249c0  ; StoC::RemoveCallback
  1002486E:  8b 0d fc c4 08 10               mov      ecx, dword ptr [0x1008c4fc]
  10024874:  b8 ab aa aa 2a                  mov      eax, 0x2aaaaaab
  10024879:  8b 35 f8 c4 08 10               mov      esi, dword ptr [0x1008c4f8]
  1002487F:  83 c4 08                        add      esp, 8
  10024882:  2b ce                           sub      ecx, esi
  10024884:  f7 e9                           imul     ecx
  10024886:  d1 fa                           sar      edx, 1
  10024888:  8b c2                           mov      eax, edx
  1002488A:  c1 e8 1f                        shr      eax, 0x1f
  1002488D:  03 c2                           add      eax, edx
  1002488F:  3b c7                           cmp      eax, edi
  10024891:  77 14                           ja       0x100248a7
  10024893:  8d 47 01                        lea      eax, [edi + 1]
  10024896:  b9 f8 c4 08 10                  mov      ecx, 0x1008c4f8
  1002489B:  50                              push     eax
  1002489C:  e8 ef 04 00 00                  call     0x10024d90
  100248A1:  8b 35 f8 c4 08 10               mov      esi, dword ptr [0x1008c4f8]
  100248A7:  8d 04 7f                        lea      eax, [edi + edi*2]
  100248AA:  c1 e0 02                        shl      eax, 2
  100248AD:  89 45 b0                        mov      dword ptr [ebp - 0x50], eax
  100248B0:  03 c6                           add      eax, esi
  100248B2:  89 45 b4                        mov      dword ptr [ebp - 0x4c], eax
  100248B5:  8b 30                           mov      esi, dword ptr [eax]
  100248B7:  8b 48 04                        mov      ecx, dword ptr [eax + 4]
  100248BA:  8b 45 14                        mov      eax, dword ptr [ebp + 0x14]
  100248BD:  3b f1                           cmp      esi, ecx
  100248BF:  74 0b                           je       0x100248cc
  100248C1:  39 06                           cmp      dword ptr [esi], eax
  100248C3:  7f 07                           jg       0x100248cc
  100248C5:  83 c6 30                        add      esi, 0x30
  100248C8:  3b f1                           cmp      esi, ecx
  100248CA:  75 f5                           jne      0x100248c1
  100248CC:  89 45 c0                        mov      dword ptr [ebp - 0x40], eax
  100248CF:  8b 45 b8                        mov      eax, dword ptr [ebp - 0x48]
  100248D2:  89 45 c4                        mov      dword ptr [ebp - 0x3c], eax
  100248D5:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  100248DC:  8b 4d bc                        mov      ecx, dword ptr [ebp - 0x44]
  100248DF:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  100248E6:  8b 49 24                        mov      ecx, dword ptr [ecx + 0x24]
  100248E9:  85 c9                           test     ecx, ecx
  100248EB:  74 0b                           je       0x100248f8
  100248ED:  8b 01                           mov      eax, dword ptr [ecx]
  100248EF:  8d 55 c8                        lea      edx, [ebp - 0x38]
  100248F2:  52                              push     edx
  100248F3:  ff 10                           call     dword ptr [eax]
  100248F5:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  100248F8:  8b 4d b4                        mov      ecx, dword ptr [ebp - 0x4c]
  100248FB:  8d 45 c0                        lea      eax, [ebp - 0x40]
  100248FE:  50                              push     eax
  100248FF:  56                              push     esi
  10024900:  8d 45 bc                        lea      eax, [ebp - 0x44]
  10024903:  c7 45 fc 01 00 00 00            mov      dword ptr [ebp - 4], 1
  1002490A:  50                              push     eax
  1002490B:  e8 30 2b fe ff                  call     0x10007440
  10024910:  8b 4d ec                        mov      ecx, dword ptr [ebp - 0x14]
  10024913:  c7 45 fc ff ff ff ff            mov      dword ptr [ebp - 4], 0xffffffff
  1002491A:  85 c9                           test     ecx, ecx
  1002491C:  74 18                           je       0x10024936
  1002491E:  8b 11                           mov      edx, dword ptr [ecx]
  10024920:  8d 45 c8                        lea      eax, [ebp - 0x38]
  10024923:  3b c8                           cmp      ecx, eax
  10024925:  0f 95 c0                        setne    al
  10024928:  0f b6 c0                        movzx    eax, al
  1002492B:  50                              push     eax
  1002492C:  ff 52 10                        call     dword ptr [edx + 0x10]
  1002492F:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  10024936:  8b 35 f0 c4 08 10               mov      esi, dword ptr [0x1008c4f0]
  1002493C:  85 f6                           test     esi, esi
  1002493E:  74 32                           je       0x10024972
  10024940:  39 7e 08                        cmp      dword ptr [esi + 8], edi
  10024943:  76 2d                           jbe      0x10024972
  10024945:  83 3e 00                        cmp      dword ptr [esi], 0
  10024948:  75 19                           jne      0x10024963
  1002494A:  68 fc 3c 05 10                  push     0x10053cfc  ; "GW::BaseArray<struct `anonymous namespace'::StoCHandler>::at"
  1002494F:  6a 1e                           push     0x1e
  10024951:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  10024956:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  1002495B:  e8 10 0f fe ff                  call     0x10005870  ; GW::FatalAssert
  10024960:  83 c4 10                        add      esp, 0x10
  10024963:  8b 06                           mov      eax, dword ptr [esi]
  10024965:  b3 01                           mov      bl, 1
  10024967:  8b 4d b0                        mov      ecx, dword ptr [ebp - 0x50]
  1002496A:  c7 44 08 08 c0 4b 02 10         mov      dword ptr [eax + ecx + 8], 0x10024bc0
  10024972:  68 d8 c4 08 10                  push     0x1008c4d8
  10024977:  ff 15 38 c0 04 10               call     dword ptr [0x1004c038]
  1002497D:  8a c3                           mov      al, bl
  1002497F:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  10024982:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  10024989:  59                              pop      ecx
  1002498A:  5f                              pop      edi
  1002498B:  5e                              pop      esi
  1002498C:  5b                              pop      ebx
  1002498D:  8b 4d f0                        mov      ecx, dword ptr [ebp - 0x10]
  10024990:  33 cd                           xor      ecx, ebp
  10024992:  e8 20 7a 00 00                  call     0x1002c3b7
  10024997:  8b e5                           mov      esp, ebp
  10024999:  5d                              pop      ebp
  1002499A:  c3                              ret      


; === StoC::RegisterPostPacketCallback ===
; RVA: 0x000249A0  Size: 27 bytes
; Exports: ?RegisterPostPacketCallback@StoC@GW@@YA_NPAUHookEntry@2@IABV?$function@$$A6AXPAUHookStatus@GW@@PAUPacketBase@StoC@Packet@2@@Z@std@@@Z
;
  100249A0:  55                              push     ebp
  100249A1:  8b ec                           mov      ebp, esp
  100249A3:  68 00 80 00 00                  push     0x8000
  100249A8:  ff 75 10                        push     dword ptr [ebp + 0x10]
  100249AB:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  100249AE:  ff 75 08                        push     dword ptr [ebp + 8]
  100249B1:  e8 6a fe ff ff                  call     0x10024820  ; StoC::RegisterPacketCallback
  100249B6:  83 c4 10                        add      esp, 0x10
  100249B9:  5d                              pop      ebp
  100249BA:  c3                              ret      


; === StoC::RemoveCallback ===
; RVA: 0x000249C0  Size: 159 bytes
; Exports: ?RemoveCallback@StoC@GW@@YAIIPAUHookEntry@2@@Z
;
  100249C0:  55                              push     ebp
  100249C1:  8b ec                           mov      ebp, esp
  100249C3:  56                              push     esi
  100249C4:  57                              push     edi
  100249C5:  68 d8 c4 08 10                  push     0x1008c4d8
  100249CA:  33 ff                           xor      edi, edi
  100249CC:  ff 15 34 c0 04 10               call     dword ptr [0x1004c034]
  100249D2:  8b 0d fc c4 08 10               mov      ecx, dword ptr [0x1008c4fc]
  100249D8:  b8 ab aa aa 2a                  mov      eax, 0x2aaaaaab
  100249DD:  8b 35 f8 c4 08 10               mov      esi, dword ptr [0x1008c4f8]
  100249E3:  2b ce                           sub      ecx, esi
  100249E5:  f7 e9                           imul     ecx
  100249E7:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  100249EA:  d1 fa                           sar      edx, 1
  100249EC:  8b c2                           mov      eax, edx
  100249EE:  c1 e8 1f                        shr      eax, 0x1f
  100249F1:  03 c2                           add      eax, edx
  100249F3:  3b c8                           cmp      ecx, eax
  100249F5:  72 11                           jb       0x10024a08
  100249F7:  68 d8 c4 08 10                  push     0x1008c4d8
  100249FC:  ff 15 38 c0 04 10               call     dword ptr [0x1004c038]
  10024A02:  5f                              pop      edi
  10024A03:  33 c0                           xor      eax, eax
  10024A05:  5e                              pop      esi
  10024A06:  5d                              pop      ebp
  10024A07:  c3                              ret      
  10024A08:  8d 04 49                        lea      eax, [ecx + ecx*2]
  10024A0B:  8b 4c 86 04                     mov      ecx, dword ptr [esi + eax*4 + 4]
  10024A0F:  8d 34 86                        lea      esi, [esi + eax*4]
  10024A12:  8b 06                           mov      eax, dword ptr [esi]
  10024A14:  3b c1                           cmp      eax, ecx
  10024A16:  74 36                           je       0x10024a4e
  10024A18:  8b 55 0c                        mov      edx, dword ptr [ebp + 0xc]
  10024A1B:  0f 1f 44 00 00                  nop      dword ptr [eax + eax]
  10024A20:  39 50 04                        cmp      dword ptr [eax + 4], edx
  10024A23:  74 18                           je       0x10024a3d
  10024A25:  83 c0 30                        add      eax, 0x30
  10024A28:  3b c1                           cmp      eax, ecx
  10024A2A:  75 f4                           jne      0x10024a20
  10024A2C:  68 d8 c4 08 10                  push     0x1008c4d8
  10024A31:  ff 15 38 c0 04 10               call     dword ptr [0x1004c038]
  10024A37:  8b c7                           mov      eax, edi
  10024A39:  5f                              pop      edi
  10024A3A:  5e                              pop      esi
  10024A3B:  5d                              pop      ebp
  10024A3C:  c3                              ret      
  10024A3D:  50                              push     eax
  10024A3E:  8d 45 08                        lea      eax, [ebp + 8]
  10024A41:  8b ce                           mov      ecx, esi
  10024A43:  50                              push     eax
  10024A44:  e8 57 02 00 00                  call     0x10024ca0
  10024A49:  bf 01 00 00 00                  mov      edi, 1
  10024A4E:  68 d8 c4 08 10                  push     0x1008c4d8
  10024A53:  ff 15 38 c0 04 10               call     dword ptr [0x1004c038]
  10024A59:  8b c7                           mov      eax, edi
  10024A5B:  5f                              pop      edi
  10024A5C:  5e                              pop      esi
  10024A5D:  5d                              pop      ebp
  10024A5E:  c3                              ret      


; === StoC::RemoveCallbacks ===
; RVA: 0x00024A60  Size: 331 bytes
; Exports: ?RemoveCallbacks@StoC@GW@@YAIPAUHookEntry@2@@Z
;
  10024A60:  55                              push     ebp
  10024A61:  8b ec                           mov      ebp, esp
  10024A63:  83 ec 10                        sub      esp, 0x10
  10024A66:  53                              push     ebx
  10024A67:  56                              push     esi
  10024A68:  33 f6                           xor      esi, esi
  10024A6A:  68 d8 c4 08 10                  push     0x1008c4d8
  10024A6F:  89 75 f8                        mov      dword ptr [ebp - 8], esi
  10024A72:  ff 15 34 c0 04 10               call     dword ptr [0x1004c034]
  10024A78:  a1 fc c4 08 10                  mov      eax, dword ptr [0x1008c4fc]
  10024A7D:  8b 1d f8 c4 08 10               mov      ebx, dword ptr [0x1008c4f8]
  10024A83:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  10024A86:  89 5d f4                        mov      dword ptr [ebp - 0xc], ebx
  10024A89:  3b d8                           cmp      ebx, eax
  10024A8B:  0f 84 07 01 00 00               je       0x10024b98
  10024A91:  57                              push     edi
  10024A92:  8b 53 04                        mov      edx, dword ptr [ebx + 4]
  10024A95:  8b 03                           mov      eax, dword ptr [ebx]
  10024A97:  89 55 fc                        mov      dword ptr [ebp - 4], edx
  10024A9A:  3b c2                           cmp      eax, edx
  10024A9C:  0f 84 e6 00 00 00               je       0x10024b88
  10024AA2:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10024AA5:  66 66 66 0f 1f 84 00 00 00 00 00  nop      word ptr [eax + eax]
  10024AB0:  8d 78 30                        lea      edi, [eax + 0x30]
  10024AB3:  39 48 04                        cmp      dword ptr [eax + 4], ecx
  10024AB6:  0f 85 bf 00 00 00               jne      0x10024b7b
  10024ABC:  3b fa                           cmp      edi, edx
  10024ABE:  74 79                           je       0x10024b39
  10024AC0:  8d 77 fc                        lea      esi, [edi - 4]
  10024AC3:  8b 07                           mov      eax, dword ptr [edi]
  10024AC5:  8d 5e 0c                        lea      ebx, [esi + 0xc]
  10024AC8:  89 46 d4                        mov      dword ptr [esi - 0x2c], eax
  10024ACB:  8b 46 08                        mov      eax, dword ptr [esi + 8]
  10024ACE:  89 46 d8                        mov      dword ptr [esi - 0x28], eax
  10024AD1:  8d 46 dc                        lea      eax, [esi - 0x24]
  10024AD4:  3b c3                           cmp      eax, ebx
  10024AD6:  74 54                           je       0x10024b2c
  10024AD8:  8b 0e                           mov      ecx, dword ptr [esi]
  10024ADA:  85 c9                           test     ecx, ecx
  10024ADC:  74 17                           je       0x10024af5
  10024ADE:  8b 11                           mov      edx, dword ptr [ecx]
  10024AE0:  3b c8                           cmp      ecx, eax
  10024AE2:  0f 95 c0                        setne    al
  10024AE5:  0f b6 c0                        movzx    eax, al
  10024AE8:  50                              push     eax
  10024AE9:  ff 52 10                        call     dword ptr [edx + 0x10]
  10024AEC:  8b 55 fc                        mov      edx, dword ptr [ebp - 4]
  10024AEF:  c7 06 00 00 00 00               mov      dword ptr [esi], 0
  10024AF5:  8b 4e 30                        mov      ecx, dword ptr [esi + 0x30]
  10024AF8:  85 c9                           test     ecx, ecx
  10024AFA:  74 30                           je       0x10024b2c
  10024AFC:  3b cb                           cmp      ecx, ebx
  10024AFE:  75 70                           jne      0x10024b70
  10024B00:  8b 01                           mov      eax, dword ptr [ecx]
  10024B02:  8b 50 04                        mov      edx, dword ptr [eax + 4]
  10024B05:  8d 46 dc                        lea      eax, [esi - 0x24]
  10024B08:  50                              push     eax
  10024B09:  ff d2                           call     edx
  10024B0B:  89 06                           mov      dword ptr [esi], eax
  10024B0D:  8b 4e 30                        mov      ecx, dword ptr [esi + 0x30]
  10024B10:  85 c9                           test     ecx, ecx
  10024B12:  74 15                           je       0x10024b29
  10024B14:  8b 11                           mov      edx, dword ptr [ecx]
  10024B16:  3b cb                           cmp      ecx, ebx
  10024B18:  0f 95 c0                        setne    al
  10024B1B:  0f b6 c0                        movzx    eax, al
  10024B1E:  50                              push     eax
  10024B1F:  ff 52 10                        call     dword ptr [edx + 0x10]
  10024B22:  c7 46 30 00 00 00 00            mov      dword ptr [esi + 0x30], 0
  10024B29:  8b 55 fc                        mov      edx, dword ptr [ebp - 4]
  10024B2C:  83 c7 30                        add      edi, 0x30
  10024B2F:  83 c6 30                        add      esi, 0x30
  10024B32:  3b fa                           cmp      edi, edx
  10024B34:  75 8d                           jne      0x10024ac3
  10024B36:  8b 5d f4                        mov      ebx, dword ptr [ebp - 0xc]
  10024B39:  8b 73 04                        mov      esi, dword ptr [ebx + 4]
  10024B3C:  83 ee 28                        sub      esi, 0x28
  10024B3F:  8b 4e 24                        mov      ecx, dword ptr [esi + 0x24]
  10024B42:  85 c9                           test     ecx, ecx
  10024B44:  74 15                           je       0x10024b5b
  10024B46:  8b 11                           mov      edx, dword ptr [ecx]
  10024B48:  3b ce                           cmp      ecx, esi
  10024B4A:  0f 95 c0                        setne    al
  10024B4D:  0f b6 c0                        movzx    eax, al
  10024B50:  50                              push     eax
  10024B51:  ff 52 10                        call     dword ptr [edx + 0x10]
  10024B54:  c7 46 24 00 00 00 00            mov      dword ptr [esi + 0x24], 0
  10024B5B:  83 43 04 d0                     add      dword ptr [ebx + 4], -0x30
  10024B5F:  8b 75 f8                        mov      esi, dword ptr [ebp - 8]
  10024B62:  8b 53 04                        mov      edx, dword ptr [ebx + 4]
  10024B65:  46                              inc      esi
  10024B66:  8b 03                           mov      eax, dword ptr [ebx]
  10024B68:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10024B6B:  89 75 f8                        mov      dword ptr [ebp - 8], esi
  10024B6E:  eb 0d                           jmp      0x10024b7d
  10024B70:  89 0e                           mov      dword ptr [esi], ecx
  10024B72:  c7 46 30 00 00 00 00            mov      dword ptr [esi + 0x30], 0
  10024B79:  eb b1                           jmp      0x10024b2c
  10024B7B:  8b c7                           mov      eax, edi
  10024B7D:  89 55 fc                        mov      dword ptr [ebp - 4], edx
  10024B80:  3b c2                           cmp      eax, edx
  10024B82:  0f 85 28 ff ff ff               jne      0x10024ab0
  10024B88:  83 c3 0c                        add      ebx, 0xc
  10024B8B:  89 5d f4                        mov      dword ptr [ebp - 0xc], ebx
  10024B8E:  3b 5d f0                        cmp      ebx, dword ptr [ebp - 0x10]
  10024B91:  0f 85 fb fe ff ff               jne      0x10024a92
  10024B97:  5f                              pop      edi
  10024B98:  68 d8 c4 08 10                  push     0x1008c4d8
  10024B9D:  ff 15 38 c0 04 10               call     dword ptr [0x1004c038]
  10024BA3:  8b c6                           mov      eax, esi
  10024BA5:  5e                              pop      esi
  10024BA6:  5b                              pop      ebx
  10024BA7:  8b e5                           mov      esp, ebp
  10024BA9:  5d                              pop      ebp
  10024BAA:  c3                              ret      


; === StoC::RemovePostCallback ===
; RVA: 0x00024BB0  Size: 469 bytes
; Exports: ?RemovePostCallback@StoC@GW@@YAXIPAUHookEntry@2@@Z
;
  10024BB0:  e9 0b fe ff ff                  jmp      0x100249c0
  10024BB5:  cc                              int3     
  10024BB6:  cc                              int3     
  10024BB7:  cc                              int3     
  10024BB8:  cc                              int3     
  10024BB9:  cc                              int3     
  10024BBA:  cc                              int3     
  10024BBB:  cc                              int3     
  10024BBC:  cc                              int3     
  10024BBD:  cc                              int3     
  10024BBE:  cc                              int3     
  10024BBF:  cc                              int3     
  10024BC0:  55                              push     ebp
  10024BC1:  8b ec                           mov      ebp, esp
  10024BC3:  83 ec 0c                        sub      esp, 0xc
  10024BC6:  56                              push     esi
  10024BC7:  57                              push     edi
  10024BC8:  e8 83 5e ff ff                  call     0x1001aa50  ; Hook::EnterHook
  10024BCD:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  10024BD0:  8b 15 f8 c4 08 10               mov      edx, dword ptr [0x1008c4f8]
  10024BD6:  c6 45 f4 00                     mov      byte ptr [ebp - 0xc], 0
  10024BDA:  c7 45 f8 00 00 00 00            mov      dword ptr [ebp - 8], 0
  10024BE1:  8b 0f                           mov      ecx, dword ptr [edi]
  10024BE3:  8d 04 49                        lea      eax, [ecx + ecx*2]
  10024BE6:  8b 34 82                        mov      esi, dword ptr [edx + eax*4]
  10024BE9:  3b 74 82 04                     cmp      esi, dword ptr [edx + eax*4 + 4]
  10024BED:  74 3e                           je       0x10024c2d
  10024BEF:  90                              nop      
  10024BF0:  83 3e 00                        cmp      dword ptr [esi], 0
  10024BF3:  7f 38                           jg       0x10024c2d
  10024BF5:  8b 4e 2c                        mov      ecx, dword ptr [esi + 0x2c]
  10024BF8:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10024BFB:  89 7d 08                        mov      dword ptr [ebp + 8], edi
  10024BFE:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10024C01:  85 c9                           test     ecx, ecx
  10024C03:  0f 84 8d 00 00 00               je       0x10024c96
  10024C09:  8b 01                           mov      eax, dword ptr [ecx]
  10024C0B:  8d 55 08                        lea      edx, [ebp + 8]
  10024C0E:  52                              push     edx
  10024C0F:  8d 55 fc                        lea      edx, [ebp - 4]
  10024C12:  52                              push     edx
  10024C13:  ff 50 08                        call     dword ptr [eax + 8]
  10024C16:  8b 0f                           mov      ecx, dword ptr [edi]
  10024C18:  83 c6 30                        add      esi, 0x30
  10024C1B:  8b 15 f8 c4 08 10               mov      edx, dword ptr [0x1008c4f8]
  10024C21:  ff 45 f8                        inc      dword ptr [ebp - 8]
  10024C24:  8d 04 49                        lea      eax, [ecx + ecx*2]
  10024C27:  3b 74 82 04                     cmp      esi, dword ptr [edx + eax*4 + 4]
  10024C2B:  75 c3                           jne      0x10024bf0
  10024C2D:  80 7d f4 00                     cmp      byte ptr [ebp - 0xc], 0
  10024C31:  75 18                           jne      0x10024c4b
  10024C33:  a1 f4 c4 08 10                  mov      eax, dword ptr [0x1008c4f4]
  10024C38:  8d 0c 49                        lea      ecx, [ecx + ecx*2]
  10024C3B:  57                              push     edi
  10024C3C:  8b 44 88 08                     mov      eax, dword ptr [eax + ecx*4 + 8]
  10024C40:  ff d0                           call     eax
  10024C42:  8b 15 f8 c4 08 10               mov      edx, dword ptr [0x1008c4f8]
  10024C48:  83 c4 04                        add      esp, 4
  10024C4B:  8b 07                           mov      eax, dword ptr [edi]
  10024C4D:  8d 04 40                        lea      eax, [eax + eax*2]
  10024C50:  3b 74 82 04                     cmp      esi, dword ptr [edx + eax*4 + 4]
  10024C54:  74 33                           je       0x10024c89
  10024C56:  8b 4e 2c                        mov      ecx, dword ptr [esi + 0x2c]
  10024C59:  8d 45 f4                        lea      eax, [ebp - 0xc]
  10024C5C:  89 7d 08                        mov      dword ptr [ebp + 8], edi
  10024C5F:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10024C62:  85 c9                           test     ecx, ecx
  10024C64:  74 30                           je       0x10024c96
  10024C66:  8b 01                           mov      eax, dword ptr [ecx]
  10024C68:  8d 55 08                        lea      edx, [ebp + 8]
  10024C6B:  52                              push     edx
  10024C6C:  8d 55 fc                        lea      edx, [ebp - 4]
  10024C6F:  52                              push     edx
  10024C70:  ff 50 08                        call     dword ptr [eax + 8]
  10024C73:  8b 07                           mov      eax, dword ptr [edi]
  10024C75:  83 c6 30                        add      esi, 0x30
  10024C78:  ff 45 f8                        inc      dword ptr [ebp - 8]
  10024C7B:  8d 0c 40                        lea      ecx, [eax + eax*2]
  10024C7E:  a1 f8 c4 08 10                  mov      eax, dword ptr [0x1008c4f8]
  10024C83:  3b 74 88 04                     cmp      esi, dword ptr [eax + ecx*4 + 4]
  10024C87:  75 cd                           jne      0x10024c56
  10024C89:  e8 f2 5d ff ff                  call     0x1001aa80  ; Hook::LeaveHook
  10024C8E:  5f                              pop      edi
  10024C8F:  b0 01                           mov      al, 1
  10024C91:  5e                              pop      esi
  10024C92:  8b e5                           mov      esp, ebp
  10024C94:  5d                              pop      ebp
  10024C95:  c3                              ret      
  10024C96:  e8 42 6a 00 00                  call     0x1002b6dd
  10024C9B:  cc                              int3     
  10024C9C:  cc                              int3     
  10024C9D:  cc                              int3     
  10024C9E:  cc                              int3     
  10024C9F:  cc                              int3     
  10024CA0:  55                              push     ebp
  10024CA1:  8b ec                           mov      ebp, esp
  10024CA3:  83 ec 0c                        sub      esp, 0xc
  10024CA6:  53                              push     ebx
  10024CA7:  56                              push     esi
  10024CA8:  57                              push     edi
  10024CA9:  8b f9                           mov      edi, ecx
  10024CAB:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  10024CAE:  89 7d f8                        mov      dword ptr [ebp - 8], edi
  10024CB1:  89 4d f4                        mov      dword ptr [ebp - 0xc], ecx
  10024CB4:  8b 47 04                        mov      eax, dword ptr [edi + 4]
  10024CB7:  8d 59 30                        lea      ebx, [ecx + 0x30]
  10024CBA:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10024CBD:  3b d8                           cmp      ebx, eax
  10024CBF:  0f 84 89 00 00 00               je       0x10024d4e
  10024CC5:  8d 7b 2c                        lea      edi, [ebx + 0x2c]
  10024CC8:  8d 71 2c                        lea      esi, [ecx + 0x2c]
  10024CCB:  0f 1f 44 00 00                  nop      dword ptr [eax + eax]
  10024CD0:  8b 03                           mov      eax, dword ptr [ebx]
  10024CD2:  8d 4e dc                        lea      ecx, [esi - 0x24]
  10024CD5:  89 46 d4                        mov      dword ptr [esi - 0x2c], eax
  10024CD8:  8b 47 d8                        mov      eax, dword ptr [edi - 0x28]
  10024CDB:  89 46 d8                        mov      dword ptr [esi - 0x28], eax
  10024CDE:  8d 47 dc                        lea      eax, [edi - 0x24]
  10024CE1:  3b c8                           cmp      ecx, eax
  10024CE3:  74 58                           je       0x10024d3d
  10024CE5:  8b 0e                           mov      ecx, dword ptr [esi]
  10024CE7:  85 c9                           test     ecx, ecx
  10024CE9:  74 1a                           je       0x10024d05
  10024CEB:  8b 11                           mov      edx, dword ptr [ecx]
  10024CED:  8d 46 dc                        lea      eax, [esi - 0x24]
  10024CF0:  3b c8                           cmp      ecx, eax
  10024CF2:  0f 95 c0                        setne    al
  10024CF5:  0f b6 c0                        movzx    eax, al
  10024CF8:  50                              push     eax
  10024CF9:  ff 52 10                        call     dword ptr [edx + 0x10]
  10024CFC:  c7 06 00 00 00 00               mov      dword ptr [esi], 0
  10024D02:  8d 47 dc                        lea      eax, [edi - 0x24]
  10024D05:  8b 0f                           mov      ecx, dword ptr [edi]
  10024D07:  85 c9                           test     ecx, ecx
  10024D09:  74 32                           je       0x10024d3d
  10024D0B:  3b c8                           cmp      ecx, eax
  10024D0D:  75 26                           jne      0x10024d35
  10024D0F:  8b 01                           mov      eax, dword ptr [ecx]
  10024D11:  8b 50 04                        mov      edx, dword ptr [eax + 4]
  10024D14:  8d 46 dc                        lea      eax, [esi - 0x24]
  10024D17:  50                              push     eax
  10024D18:  ff d2                           call     edx
  10024D1A:  89 06                           mov      dword ptr [esi], eax
  10024D1C:  8b 0f                           mov      ecx, dword ptr [edi]
  10024D1E:  85 c9                           test     ecx, ecx
  10024D20:  74 1b                           je       0x10024d3d
  10024D22:  8b 11                           mov      edx, dword ptr [ecx]
  10024D24:  8d 47 dc                        lea      eax, [edi - 0x24]
  10024D27:  3b c8                           cmp      ecx, eax
  10024D29:  0f 95 c0                        setne    al
  10024D2C:  0f b6 c0                        movzx    eax, al
  10024D2F:  50                              push     eax
  10024D30:  ff 52 10                        call     dword ptr [edx + 0x10]
  10024D33:  eb 02                           jmp      0x10024d37
  10024D35:  89 0e                           mov      dword ptr [esi], ecx
  10024D37:  c7 07 00 00 00 00               mov      dword ptr [edi], 0
  10024D3D:  83 c3 30                        add      ebx, 0x30
  10024D40:  83 c6 30                        add      esi, 0x30
  10024D43:  83 c7 30                        add      edi, 0x30
  10024D46:  3b 5d fc                        cmp      ebx, dword ptr [ebp - 4]
  10024D49:  75 85                           jne      0x10024cd0
  10024D4B:  8b 7d f8                        mov      edi, dword ptr [ebp - 8]
  10024D4E:  8b 77 04                        mov      esi, dword ptr [edi + 4]
  10024D51:  83 ee 28                        sub      esi, 0x28
  10024D54:  8b 4e 24                        mov      ecx, dword ptr [esi + 0x24]
  10024D57:  85 c9                           test     ecx, ecx
  10024D59:  74 15                           je       0x10024d70
  10024D5B:  8b 11                           mov      edx, dword ptr [ecx]
  10024D5D:  3b ce                           cmp      ecx, esi
  10024D5F:  0f 95 c0                        setne    al
  10024D62:  0f b6 c0                        movzx    eax, al
  10024D65:  50                              push     eax
  10024D66:  ff 52 10                        call     dword ptr [edx + 0x10]
  10024D69:  c7 46 24 00 00 00 00            mov      dword ptr [esi + 0x24], 0
  10024D70:  83 47 04 d0                     add      dword ptr [edi + 4], -0x30
  10024D74:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10024D77:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  10024D7A:  5f                              pop      edi
  10024D7B:  5e                              pop      esi
  10024D7C:  89 08                           mov      dword ptr [eax], ecx
  10024D7E:  5b                              pop      ebx
  10024D7F:  8b e5                           mov      esp, ebp
  10024D81:  5d                              pop      ebp
  10024D82:  c2 08 00                        ret      8


