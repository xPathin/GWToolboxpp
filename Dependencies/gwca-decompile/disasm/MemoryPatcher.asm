; Module: MemoryPatcher
; Functions: 6
; Total code size: 873 bytes
;

; === MemoryPatcher::DisableHooks ===
; RVA: 0x0001E510  Size: 128 bytes
; Exports: ?DisableHooks@MemoryPatcher@GW@@SAXXZ
;
  1001E510:  55                              push     ebp
  1001E511:  8b ec                           mov      ebp, esp
  1001E513:  51                              push     ecx
  1001E514:  8a 0d 44 a1 08 10               mov      cl, byte ptr [0x1008a144]
  1001E51A:  84 c9                           test     cl, cl
  1001E51C:  74 6e                           je       0x1001e58c
  1001E51E:  53                              push     ebx
  1001E51F:  8b 1d b0 c3 08 10               mov      ebx, dword ptr [0x1008c3b0]
  1001E525:  56                              push     esi
  1001E526:  8b 35 ac c3 08 10               mov      esi, dword ptr [0x1008c3ac]
  1001E52C:  3b f3                           cmp      esi, ebx
  1001E52E:  74 53                           je       0x1001e583
  1001E530:  57                              push     edi
  1001E531:  8b 3e                           mov      edi, dword ptr [esi]
  1001E533:  8b 07                           mov      eax, dword ptr [edi]
  1001E535:  85 c0                           test     eax, eax
  1001E537:  74 42                           je       0x1001e57b
  1001E539:  80 7f 10 00                     cmp      byte ptr [edi + 0x10], 0
  1001E53D:  74 3c                           je       0x1001e57b
  1001E53F:  84 c9                           test     cl, cl
  1001E541:  74 38                           je       0x1001e57b
  1001E543:  8d 4d fc                        lea      ecx, [ebp - 4]
  1001E546:  51                              push     ecx
  1001E547:  6a 40                           push     0x40
  1001E549:  ff 77 0c                        push     dword ptr [edi + 0xc]
  1001E54C:  50                              push     eax
  1001E54D:  ff 15 5c c0 04 10               call     dword ptr [0x1004c05c]
  1001E553:  ff 77 0c                        push     dword ptr [edi + 0xc]
  1001E556:  ff 77 08                        push     dword ptr [edi + 8]
  1001E559:  ff 37                           push     dword ptr [edi]
  1001E55B:  e8 60 f1 00 00                  call     0x1002d6c0
  1001E560:  83 c4 0c                        add      esp, 0xc
  1001E563:  8d 45 fc                        lea      eax, [ebp - 4]
  1001E566:  50                              push     eax
  1001E567:  ff 75 fc                        push     dword ptr [ebp - 4]
  1001E56A:  ff 77 0c                        push     dword ptr [edi + 0xc]
  1001E56D:  ff 37                           push     dword ptr [edi]
  1001E56F:  ff 15 5c c0 04 10               call     dword ptr [0x1004c05c]
  1001E575:  8a 0d 44 a1 08 10               mov      cl, byte ptr [0x1008a144]
  1001E57B:  83 c6 04                        add      esi, 4
  1001E57E:  3b f3                           cmp      esi, ebx
  1001E580:  75 af                           jne      0x1001e531
  1001E582:  5f                              pop      edi
  1001E583:  5e                              pop      esi
  1001E584:  c6 05 44 a1 08 10 00            mov      byte ptr [0x1008a144], 0
  1001E58B:  5b                              pop      ebx
  1001E58C:  8b e5                           mov      esp, ebp
  1001E58E:  5d                              pop      ebp
  1001E58F:  c3                              ret      


; === MemoryPatcher::EnableHooks ===
; RVA: 0x0001E590  Size: 128 bytes
; Exports: ?EnableHooks@MemoryPatcher@GW@@SAXXZ
;
  1001E590:  55                              push     ebp
  1001E591:  8b ec                           mov      ebp, esp
  1001E593:  51                              push     ecx
  1001E594:  80 3d 44 a1 08 10 00            cmp      byte ptr [0x1008a144], 0
  1001E59B:  75 6f                           jne      0x1001e60c
  1001E59D:  53                              push     ebx
  1001E59E:  8b 1d b0 c3 08 10               mov      ebx, dword ptr [0x1008c3b0]
  1001E5A4:  b1 01                           mov      cl, 1
  1001E5A6:  56                              push     esi
  1001E5A7:  8b 35 ac c3 08 10               mov      esi, dword ptr [0x1008c3ac]
  1001E5AD:  88 0d 44 a1 08 10               mov      byte ptr [0x1008a144], cl
  1001E5B3:  3b f3                           cmp      esi, ebx
  1001E5B5:  74 53                           je       0x1001e60a
  1001E5B7:  57                              push     edi
  1001E5B8:  8b 3e                           mov      edi, dword ptr [esi]
  1001E5BA:  8b 07                           mov      eax, dword ptr [edi]
  1001E5BC:  85 c0                           test     eax, eax
  1001E5BE:  74 42                           je       0x1001e602
  1001E5C0:  80 7f 10 00                     cmp      byte ptr [edi + 0x10], 0
  1001E5C4:  74 3c                           je       0x1001e602
  1001E5C6:  84 c9                           test     cl, cl
  1001E5C8:  74 38                           je       0x1001e602
  1001E5CA:  8d 4d fc                        lea      ecx, [ebp - 4]
  1001E5CD:  51                              push     ecx
  1001E5CE:  6a 40                           push     0x40
  1001E5D0:  ff 77 0c                        push     dword ptr [edi + 0xc]
  1001E5D3:  50                              push     eax
  1001E5D4:  ff 15 5c c0 04 10               call     dword ptr [0x1004c05c]
  1001E5DA:  ff 77 0c                        push     dword ptr [edi + 0xc]
  1001E5DD:  ff 77 04                        push     dword ptr [edi + 4]
  1001E5E0:  ff 37                           push     dword ptr [edi]
  1001E5E2:  e8 d9 f0 00 00                  call     0x1002d6c0
  1001E5E7:  83 c4 0c                        add      esp, 0xc
  1001E5EA:  8d 45 fc                        lea      eax, [ebp - 4]
  1001E5ED:  50                              push     eax
  1001E5EE:  ff 75 fc                        push     dword ptr [ebp - 4]
  1001E5F1:  ff 77 0c                        push     dword ptr [edi + 0xc]
  1001E5F4:  ff 37                           push     dword ptr [edi]
  1001E5F6:  ff 15 5c c0 04 10               call     dword ptr [0x1004c05c]
  1001E5FC:  8a 0d 44 a1 08 10               mov      cl, byte ptr [0x1008a144]
  1001E602:  83 c6 04                        add      esi, 4
  1001E605:  3b f3                           cmp      esi, ebx
  1001E607:  75 af                           jne      0x1001e5b8
  1001E609:  5f                              pop      edi
  1001E60A:  5e                              pop      esi
  1001E60B:  5b                              pop      ebx
  1001E60C:  8b e5                           mov      esp, ebp
  1001E60E:  5d                              pop      ebp
  1001E60F:  c3                              ret      


; === MemoryPatcher::Reset ===
; RVA: 0x0001E670  Size: 245 bytes
; Exports: ?Reset@MemoryPatcher@GW@@QAEXXZ
;
  1001E670:  55                              push     ebp
  1001E671:  8b ec                           mov      ebp, esp
  1001E673:  51                              push     ecx
  1001E674:  53                              push     ebx
  1001E675:  56                              push     esi
  1001E676:  57                              push     edi
  1001E677:  8b f9                           mov      edi, ecx
  1001E679:  80 7f 10 00                     cmp      byte ptr [edi + 0x10], 0
  1001E67D:  74 43                           je       0x1001e6c2
  1001E67F:  8b 07                           mov      eax, dword ptr [edi]
  1001E681:  85 c0                           test     eax, eax
  1001E683:  74 3d                           je       0x1001e6c2
  1001E685:  80 3d 44 a1 08 10 00            cmp      byte ptr [0x1008a144], 0
  1001E68C:  c6 47 10 00                     mov      byte ptr [edi + 0x10], 0
  1001E690:  74 30                           je       0x1001e6c2
  1001E692:  8b 35 5c c0 04 10               mov      esi, dword ptr [0x1004c05c]
  1001E698:  8d 4d fc                        lea      ecx, [ebp - 4]
  1001E69B:  51                              push     ecx
  1001E69C:  6a 40                           push     0x40
  1001E69E:  ff 77 0c                        push     dword ptr [edi + 0xc]
  1001E6A1:  50                              push     eax
  1001E6A2:  ff d6                           call     esi
  1001E6A4:  ff 77 0c                        push     dword ptr [edi + 0xc]
  1001E6A7:  ff 77 08                        push     dword ptr [edi + 8]
  1001E6AA:  ff 37                           push     dword ptr [edi]
  1001E6AC:  e8 0f f0 00 00                  call     0x1002d6c0
  1001E6B1:  83 c4 0c                        add      esp, 0xc
  1001E6B4:  8d 45 fc                        lea      eax, [ebp - 4]
  1001E6B7:  50                              push     eax
  1001E6B8:  ff 75 fc                        push     dword ptr [ebp - 4]
  1001E6BB:  ff 77 0c                        push     dword ptr [edi + 0xc]
  1001E6BE:  ff 37                           push     dword ptr [edi]
  1001E6C0:  ff d6                           call     esi
  1001E6C2:  8b 47 04                        mov      eax, dword ptr [edi + 4]
  1001E6C5:  85 c0                           test     eax, eax
  1001E6C7:  74 10                           je       0x1001e6d9
  1001E6C9:  50                              push     eax
  1001E6CA:  e8 ff dc 00 00                  call     0x1002c3ce
  1001E6CF:  83 c4 04                        add      esp, 4
  1001E6D2:  c7 47 04 00 00 00 00            mov      dword ptr [edi + 4], 0
  1001E6D9:  8b 47 08                        mov      eax, dword ptr [edi + 8]
  1001E6DC:  85 c0                           test     eax, eax
  1001E6DE:  74 10                           je       0x1001e6f0
  1001E6E0:  50                              push     eax
  1001E6E1:  e8 e8 dc 00 00                  call     0x1002c3ce
  1001E6E6:  83 c4 04                        add      esp, 4
  1001E6E9:  c7 47 08 00 00 00 00            mov      dword ptr [edi + 8], 0
  1001E6F0:  c7 07 00 00 00 00               mov      dword ptr [edi], 0
  1001E6F6:  c7 47 0c 00 00 00 00            mov      dword ptr [edi + 0xc], 0
  1001E6FD:  c6 47 10 00                     mov      byte ptr [edi + 0x10], 0
  1001E701:  8b 35 b0 c3 08 10               mov      esi, dword ptr [0x1008c3b0]
  1001E707:  8b c6                           mov      eax, esi
  1001E709:  8b 0d ac c3 08 10               mov      ecx, dword ptr [0x1008c3ac]
  1001E70F:  2b c1                           sub      eax, ecx
  1001E711:  c1 f8 02                        sar      eax, 2
  1001E714:  57                              push     edi
  1001E715:  89 75 fc                        mov      dword ptr [ebp - 4], esi
  1001E718:  8d 04 81                        lea      eax, [ecx + eax*4]
  1001E71B:  50                              push     eax
  1001E71C:  51                              push     ecx
  1001E71D:  e8 fe d2 00 00                  call     0x1002ba20
  1001E722:  8b d8                           mov      ebx, eax
  1001E724:  3b de                           cmp      ebx, esi
  1001E726:  74 36                           je       0x1001e75e
  1001E728:  8b c6                           mov      eax, esi
  1001E72A:  2b c3                           sub      eax, ebx
  1001E72C:  c1 f8 02                        sar      eax, 2
  1001E72F:  57                              push     edi
  1001E730:  8d 04 83                        lea      eax, [ebx + eax*4]
  1001E733:  50                              push     eax
  1001E734:  53                              push     ebx
  1001E735:  e8 f6 d2 00 00                  call     0x1002ba30
  1001E73A:  8b d8                           mov      ebx, eax
  1001E73C:  3b de                           cmp      ebx, esi
  1001E73E:  74 1e                           je       0x1001e75e
  1001E740:  8b 35 b0 c3 08 10               mov      esi, dword ptr [0x1008c3b0]
  1001E746:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  1001E749:  2b f0                           sub      esi, eax
  1001E74B:  56                              push     esi
  1001E74C:  50                              push     eax
  1001E74D:  53                              push     ebx
  1001E74E:  e8 6d ef 00 00                  call     0x1002d6c0
  1001E753:  8d 04 1e                        lea      eax, [esi + ebx]
  1001E756:  83 c4 0c                        add      esp, 0xc
  1001E759:  a3 b0 c3 08 10                  mov      dword ptr [0x1008c3b0], eax
  1001E75E:  5f                              pop      edi
  1001E75F:  5e                              pop      esi
  1001E760:  5b                              pop      ebx
  1001E761:  8b e5                           mov      esp, ebp
  1001E763:  5d                              pop      ebp
  1001E764:  c3                              ret      


; === MemoryPatcher::SetPatch ===
; RVA: 0x0001E770  Size: 174 bytes
; Exports: ?SetPatch@MemoryPatcher@GW@@QAEXIPBDI@Z
;
  1001E770:  55                              push     ebp
  1001E771:  8b ec                           mov      ebp, esp
  1001E773:  51                              push     ecx
  1001E774:  57                              push     edi
  1001E775:  8b f9                           mov      edi, ecx
  1001E777:  e8 f4 fe ff ff                  call     0x1001e670  ; MemoryPatcher::Reset
  1001E77C:  83 3f 00                        cmp      dword ptr [edi], 0
  1001E77F:  0f 85 92 00 00 00               jne      0x1001e817
  1001E785:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  1001E788:  56                              push     esi
  1001E789:  8b 75 10                        mov      esi, dword ptr [ebp + 0x10]
  1001E78C:  56                              push     esi
  1001E78D:  89 07                           mov      dword ptr [edi], eax
  1001E78F:  89 77 0c                        mov      dword ptr [edi + 0xc], esi
  1001E792:  c6 47 10 00                     mov      byte ptr [edi + 0x10], 0
  1001E796:  e8 2a dc 00 00                  call     0x1002c3c5
  1001E79B:  56                              push     esi
  1001E79C:  89 47 04                        mov      dword ptr [edi + 4], eax
  1001E79F:  e8 21 dc 00 00                  call     0x1002c3c5
  1001E7A4:  56                              push     esi
  1001E7A5:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  1001E7A8:  89 47 08                        mov      dword ptr [edi + 8], eax
  1001E7AB:  ff 77 04                        push     dword ptr [edi + 4]
  1001E7AE:  e8 0d ef 00 00                  call     0x1002d6c0
  1001E7B3:  8b 35 5c c0 04 10               mov      esi, dword ptr [0x1004c05c]
  1001E7B9:  8d 45 fc                        lea      eax, [ebp - 4]
  1001E7BC:  83 c4 14                        add      esp, 0x14
  1001E7BF:  50                              push     eax
  1001E7C0:  6a 40                           push     0x40
  1001E7C2:  ff 77 0c                        push     dword ptr [edi + 0xc]
  1001E7C5:  ff 37                           push     dword ptr [edi]
  1001E7C7:  ff d6                           call     esi
  1001E7C9:  ff 77 0c                        push     dword ptr [edi + 0xc]
  1001E7CC:  ff 37                           push     dword ptr [edi]
  1001E7CE:  ff 77 08                        push     dword ptr [edi + 8]
  1001E7D1:  e8 ea ee 00 00                  call     0x1002d6c0
  1001E7D6:  83 c4 0c                        add      esp, 0xc
  1001E7D9:  8d 45 fc                        lea      eax, [ebp - 4]
  1001E7DC:  50                              push     eax
  1001E7DD:  ff 75 fc                        push     dword ptr [ebp - 4]
  1001E7E0:  ff 77 0c                        push     dword ptr [edi + 0xc]
  1001E7E3:  ff 37                           push     dword ptr [edi]
  1001E7E5:  ff d6                           call     esi
  1001E7E7:  a1 b0 c3 08 10                  mov      eax, dword ptr [0x1008c3b0]
  1001E7EC:  89 7d 08                        mov      dword ptr [ebp + 8], edi
  1001E7EF:  5e                              pop      esi
  1001E7F0:  3b 05 b4 c3 08 10               cmp      eax, dword ptr [0x1008c3b4]
  1001E7F6:  74 10                           je       0x1001e808
  1001E7F8:  89 38                           mov      dword ptr [eax], edi
  1001E7FA:  83 05 b0 c3 08 10 04            add      dword ptr [0x1008c3b0], 4
  1001E801:  5f                              pop      edi
  1001E802:  8b e5                           mov      esp, ebp
  1001E804:  5d                              pop      ebp
  1001E805:  c2 0c 00                        ret      0xc
  1001E808:  8d 4d 08                        lea      ecx, [ebp + 8]
  1001E80B:  51                              push     ecx
  1001E80C:  50                              push     eax
  1001E80D:  b9 ac c3 08 10                  mov      ecx, 0x1008c3ac
  1001E812:  e8 19 31 fe ff                  call     0x10001930
  1001E817:  5f                              pop      edi
  1001E818:  8b e5                           mov      esp, ebp
  1001E81A:  5d                              pop      ebp
  1001E81B:  c2 0c 00                        ret      0xc


; === MemoryPatcher::SetRedirect ===
; RVA: 0x0001E820  Size: 164 bytes
; Exports: ?SetRedirect@MemoryPatcher@GW@@QAE_NIPAX@Z
;
  1001E820:  55                              push     ebp
  1001E821:  8b ec                           mov      ebp, esp
  1001E823:  83 ec 08                        sub      esp, 8
  1001E826:  53                              push     ebx
  1001E827:  56                              push     esi
  1001E828:  57                              push     edi
  1001E829:  8b f9                           mov      edi, ecx
  1001E82B:  83 3f 00                        cmp      dword ptr [edi], 0
  1001E82E:  74 19                           je       0x1001e849
  1001E830:  68 9c 30 05 10                  push     0x1005309c  ; "GW::MemoryPatcher::SetRedirect"
  1001E835:  6a 5e                           push     0x5e
  1001E837:  68 bc 30 05 10                  push     0x100530bc  ; "C:\GitRepositories\GWCA\Source\MemoryPatcher.cpp"
  1001E83C:  68 f0 30 05 10                  push     0x100530f0  ; "!IsValid()"
  1001E841:  e8 2a 70 fe ff                  call     0x10005870  ; GW::FatalAssert
  1001E846:  83 c4 10                        add      esp, 0x10
  1001E849:  8b 75 08                        mov      esi, dword ptr [ebp + 8]
  1001E84C:  85 f6                           test     esi, esi
  1001E84E:  74 69                           je       0x1001e8b9
  1001E850:  8b 55 0c                        mov      edx, dword ptr [ebp + 0xc]
  1001E853:  85 d2                           test     edx, edx
  1001E855:  74 62                           je       0x1001e8b9
  1001E857:  8b 1e                           mov      ebx, dword ptr [esi]
  1001E859:  8b c3                           mov      eax, ebx
  1001E85B:  25 e9 00 00 00                  and      eax, 0xe9
  1001E860:  3c e9                           cmp      al, 0xe9
  1001E862:  8b c3                           mov      eax, ebx
  1001E864:  0f 95 c1                        setne    cl
  1001E867:  25 e8 00 00 00                  and      eax, 0xe8
  1001E86C:  3c e8                           cmp      al, 0xe8
  1001E86E:  0f 95 c0                        setne    al
  1001E871:  84 c8                           test     al, cl
  1001E873:  75 44                           jne      0x1001e8b9
  1001E875:  80 fb e8                        cmp      bl, 0xe8
  1001E878:  74 05                           je       0x1001e87f
  1001E87A:  80 fb e9                        cmp      bl, 0xe9
  1001E87D:  75 3a                           jne      0x1001e8b9
  1001E87F:  2b d6                           sub      edx, esi
  1001E881:  88 5d f8                        mov      byte ptr [ebp - 8], bl
  1001E884:  83 ea 05                        sub      edx, 5
  1001E887:  8b cf                           mov      ecx, edi
  1001E889:  8b c2                           mov      eax, edx
  1001E88B:  88 55 f9                        mov      byte ptr [ebp - 7], dl
  1001E88E:  c1 e8 08                        shr      eax, 8
  1001E891:  88 45 fa                        mov      byte ptr [ebp - 6], al
  1001E894:  8b c2                           mov      eax, edx
  1001E896:  c1 e8 10                        shr      eax, 0x10
  1001E899:  88 45 fb                        mov      byte ptr [ebp - 5], al
  1001E89C:  8d 45 f8                        lea      eax, [ebp - 8]
  1001E89F:  6a 05                           push     5
  1001E8A1:  50                              push     eax
  1001E8A2:  c1 ea 18                        shr      edx, 0x18
  1001E8A5:  56                              push     esi
  1001E8A6:  88 55 fc                        mov      byte ptr [ebp - 4], dl
  1001E8A9:  e8 c2 fe ff ff                  call     0x1001e770  ; MemoryPatcher::SetPatch
  1001E8AE:  5f                              pop      edi
  1001E8AF:  5e                              pop      esi
  1001E8B0:  b0 01                           mov      al, 1
  1001E8B2:  5b                              pop      ebx
  1001E8B3:  8b e5                           mov      esp, ebp
  1001E8B5:  5d                              pop      ebp
  1001E8B6:  c2 08 00                        ret      8
  1001E8B9:  5f                              pop      edi
  1001E8BA:  5e                              pop      esi
  1001E8BB:  32 c0                           xor      al, al
  1001E8BD:  5b                              pop      ebx
  1001E8BE:  8b e5                           mov      esp, ebp
  1001E8C0:  5d                              pop      ebp
  1001E8C1:  c2 08 00                        ret      8


; === MemoryPatcher::TogglePatch ===
; RVA: 0x0001E8D0  Size: 34 bytes
; Exports: ?TogglePatch@MemoryPatcher@GW@@QAE_N_N@Z
;
  1001E8D0:  55                              push     ebp
  1001E8D1:  8b ec                           mov      ebp, esp
  1001E8D3:  83 39 00                        cmp      dword ptr [ecx], 0
  1001E8D6:  75 06                           jne      0x1001e8de
  1001E8D8:  32 c0                           xor      al, al
  1001E8DA:  5d                              pop      ebp
  1001E8DB:  c2 04 00                        ret      4
  1001E8DE:  53                              push     ebx
  1001E8DF:  8b 5d 08                        mov      ebx, dword ptr [ebp + 8]
  1001E8E2:  53                              push     ebx
  1001E8E3:  88 59 10                        mov      byte ptr [ecx + 0x10], bl
  1001E8E6:  e8 25 fd ff ff                  call     0x1001e610
  1001E8EB:  8a c3                           mov      al, bl
  1001E8ED:  5b                              pop      ebx
  1001E8EE:  5d                              pop      ebp
  1001E8EF:  c2 04 00                        ret      4


