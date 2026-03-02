; Module: FriendListMgr
; Functions: 16
; Total code size: 1265 bytes
;

; === FriendListMgr::AddFriend, AddFriend ===
; RVA: 0x00018140  Size: 168 bytes
; Exports: ?AddFriend@FriendListMgr@GW@@YA_NPB_W0@Z, AddFriend
;
  10018140:  55                              push     ebp
  10018141:  8b ec                           mov      ebp, esp
  10018143:  a1 f0 c1 08 10                  mov      eax, dword ptr [0x1008c1f0]
  10018148:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  1001814B:  85 c0                           test     eax, eax
  1001814D:  75 04                           jne      0x10018153
  1001814F:  32 c0                           xor      al, al
  10018151:  5d                              pop      ebp
  10018152:  c3                              ret      
  10018153:  56                              push     esi
  10018154:  33 f6                           xor      esi, esi
  10018156:  57                              push     edi
  10018157:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  1001815A:  85 c9                           test     ecx, ecx
  1001815C:  75 6e                           jne      0x100181cc
  1001815E:  8b cf                           mov      ecx, edi
  10018160:  8d 51 02                        lea      edx, [ecx + 2]
  10018163:  66 8b 01                        mov      ax, word ptr [ecx]
  10018166:  83 c1 02                        add      ecx, 2
  10018169:  66 85 c0                        test     ax, ax
  1001816C:  75 f5                           jne      0x10018163
  1001816E:  2b ca                           sub      ecx, edx
  10018170:  d1 f9                           sar      ecx, 1
  10018172:  8d 41 01                        lea      eax, [ecx + 1]
  10018175:  b9 02 00 00 00                  mov      ecx, 2
  1001817A:  f7 e1                           mul      ecx
  1001817C:  b9 ff ff ff ff                  mov      ecx, 0xffffffff
  10018181:  0f 42 c1                        cmovb    eax, ecx
  10018184:  50                              push     eax
  10018185:  e8 3b 42 01 00                  call     0x1002c3c5
  1001818A:  8b f0                           mov      esi, eax
  1001818C:  83 c4 04                        add      esp, 4
  1001818F:  85 f6                           test     esi, esi
  10018191:  75 1c                           jne      0x100181af
  10018193:  68 00 23 05 10                  push     0x10052300  ; "GW::InternalAddFriend"
  10018198:  68 20 01 00 00                  push     0x120
  1001819D:  68 d4 21 05 10                  push     0x100521d4  ; "C:\GitRepositories\GWCA\Source\FriendListMgr.cpp"
  100181A2:  68 18 23 05 10                  push     0x10052318  ; "buffer"
  100181A7:  e8 c4 d6 fe ff                  call     0x10005870  ; GW::FatalAssert
  100181AC:  83 c4 10                        add      esp, 0x10
  100181AF:  8b d6                           mov      edx, esi
  100181B1:  8b c7                           mov      eax, edi
  100181B3:  2b d7                           sub      edx, edi
  100181B5:  0f b7 08                        movzx    ecx, word ptr [eax]
  100181B8:  8d 40 02                        lea      eax, [eax + 2]
  100181BB:  66 89 4c 02 fe                  mov      word ptr [edx + eax - 2], cx
  100181C0:  66 85 c9                        test     cx, cx
  100181C3:  75 f0                           jne      0x100181b5
  100181C5:  a1 f0 c1 08 10                  mov      eax, dword ptr [0x1008c1f0]
  100181CA:  8b ce                           mov      ecx, esi
  100181CC:  6a 01                           push     1
  100181CE:  51                              push     ecx
  100181CF:  57                              push     edi
  100181D0:  ff d0                           call     eax
  100181D2:  83 c4 0c                        add      esp, 0xc
  100181D5:  85 f6                           test     esi, esi
  100181D7:  74 09                           je       0x100181e2
  100181D9:  56                              push     esi
  100181DA:  e8 ef 41 01 00                  call     0x1002c3ce
  100181DF:  83 c4 04                        add      esp, 4
  100181E2:  5f                              pop      edi
  100181E3:  b0 01                           mov      al, 1
  100181E5:  5e                              pop      esi
  100181E6:  5d                              pop      ebp
  100181E7:  c3                              ret      


; === FriendListMgr::AddIgnore, AddIgnore ===
; RVA: 0x000181F0  Size: 168 bytes
; Exports: ?AddIgnore@FriendListMgr@GW@@YA_NPB_W0@Z, AddIgnore
;
  100181F0:  55                              push     ebp
  100181F1:  8b ec                           mov      ebp, esp
  100181F3:  a1 f0 c1 08 10                  mov      eax, dword ptr [0x1008c1f0]
  100181F8:  8b 4d 0c                        mov      ecx, dword ptr [ebp + 0xc]
  100181FB:  85 c0                           test     eax, eax
  100181FD:  75 04                           jne      0x10018203
  100181FF:  32 c0                           xor      al, al
  10018201:  5d                              pop      ebp
  10018202:  c3                              ret      
  10018203:  56                              push     esi
  10018204:  33 f6                           xor      esi, esi
  10018206:  57                              push     edi
  10018207:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  1001820A:  85 c9                           test     ecx, ecx
  1001820C:  75 6e                           jne      0x1001827c
  1001820E:  8b cf                           mov      ecx, edi
  10018210:  8d 51 02                        lea      edx, [ecx + 2]
  10018213:  66 8b 01                        mov      ax, word ptr [ecx]
  10018216:  83 c1 02                        add      ecx, 2
  10018219:  66 85 c0                        test     ax, ax
  1001821C:  75 f5                           jne      0x10018213
  1001821E:  2b ca                           sub      ecx, edx
  10018220:  d1 f9                           sar      ecx, 1
  10018222:  8d 41 01                        lea      eax, [ecx + 1]
  10018225:  b9 02 00 00 00                  mov      ecx, 2
  1001822A:  f7 e1                           mul      ecx
  1001822C:  b9 ff ff ff ff                  mov      ecx, 0xffffffff
  10018231:  0f 42 c1                        cmovb    eax, ecx
  10018234:  50                              push     eax
  10018235:  e8 8b 41 01 00                  call     0x1002c3c5
  1001823A:  8b f0                           mov      esi, eax
  1001823C:  83 c4 04                        add      esp, 4
  1001823F:  85 f6                           test     esi, esi
  10018241:  75 1c                           jne      0x1001825f
  10018243:  68 00 23 05 10                  push     0x10052300  ; "GW::InternalAddFriend"
  10018248:  68 20 01 00 00                  push     0x120
  1001824D:  68 d4 21 05 10                  push     0x100521d4  ; "C:\GitRepositories\GWCA\Source\FriendListMgr.cpp"
  10018252:  68 18 23 05 10                  push     0x10052318  ; "buffer"
  10018257:  e8 14 d6 fe ff                  call     0x10005870  ; GW::FatalAssert
  1001825C:  83 c4 10                        add      esp, 0x10
  1001825F:  8b d6                           mov      edx, esi
  10018261:  8b c7                           mov      eax, edi
  10018263:  2b d7                           sub      edx, edi
  10018265:  0f b7 08                        movzx    ecx, word ptr [eax]
  10018268:  8d 40 02                        lea      eax, [eax + 2]
  1001826B:  66 89 4c 02 fe                  mov      word ptr [edx + eax - 2], cx
  10018270:  66 85 c9                        test     cx, cx
  10018273:  75 f0                           jne      0x10018265
  10018275:  a1 f0 c1 08 10                  mov      eax, dword ptr [0x1008c1f0]
  1001827A:  8b ce                           mov      ecx, esi
  1001827C:  6a 02                           push     2
  1001827E:  51                              push     ecx
  1001827F:  57                              push     edi
  10018280:  ff d0                           call     eax
  10018282:  83 c4 0c                        add      esp, 0xc
  10018285:  85 f6                           test     esi, esi
  10018287:  74 09                           je       0x10018292
  10018289:  56                              push     esi
  1001828A:  e8 3f 41 01 00                  call     0x1002c3ce
  1001828F:  83 c4 04                        add      esp, 4
  10018292:  5f                              pop      edi
  10018293:  b0 01                           mov      al, 1
  10018295:  5e                              pop      esi
  10018296:  5d                              pop      ebp
  10018297:  c3                              ret      


; === FriendListMgr::ChangeFriendType, ChangeFriendType ===
; RVA: 0x000182A0  Size: 39 bytes
; Exports: ?ChangeFriendType@FriendListMgr@GW@@YA_NPAUFriend@2@W4FriendType@2@@Z, ChangeFriendType
;
  100182A0:  55                              push     ebp
  100182A1:  8b ec                           mov      ebp, esp
  100182A3:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100182A6:  85 c0                           test     eax, eax
  100182A8:  74 19                           je       0x100182c3
  100182AA:  8b 0d f4 c1 08 10               mov      ecx, dword ptr [0x1008c1f4]
  100182B0:  85 c9                           test     ecx, ecx
  100182B2:  74 0f                           je       0x100182c3
  100182B4:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  100182B7:  ff 70 68                        push     dword ptr [eax + 0x68]
  100182BA:  ff d1                           call     ecx
  100182BC:  83 c4 08                        add      esp, 8
  100182BF:  b0 01                           mov      al, 1
  100182C1:  5d                              pop      ebp
  100182C2:  c3                              ret      
  100182C3:  32 c0                           xor      al, al
  100182C5:  5d                              pop      ebp
  100182C6:  c3                              ret      


; === FriendListMgr::GetFriend, GetFriendByIndex ===
; RVA: 0x000182D0  Size: 68 bytes
; Exports: ?GetFriend@FriendListMgr@GW@@YAPAUFriend@2@I@Z, GetFriendByIndex
;
  100182D0:  55                              push     ebp
  100182D1:  8b ec                           mov      ebp, esp
  100182D3:  56                              push     esi
  100182D4:  8b 35 fc c1 08 10               mov      esi, dword ptr [0x1008c1fc]
  100182DA:  57                              push     edi
  100182DB:  85 f6                           test     esi, esi
  100182DD:  74 2f                           je       0x1001830e
  100182DF:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  100182E2:  3b 7e 08                        cmp      edi, dword ptr [esi + 8]
  100182E5:  73 27                           jae      0x1001830e
  100182E7:  83 3e 00                        cmp      dword ptr [esi], 0
  100182EA:  75 19                           jne      0x10018305
  100182EC:  68 20 23 05 10                  push     0x10052320  ; "GW::BaseArray<struct GW::Friend *>::at"
  100182F1:  6a 23                           push     0x23
  100182F3:  68 54 c3 04 10                  push     0x1004c354  ; "C:\GitRepositories\GWCA\Include\GWCA/GameContainers/Array.h"
  100182F8:  68 90 c3 04 10                  push     0x1004c390  ; "m_buffer && index < m_size"
  100182FD:  e8 6e d5 fe ff                  call     0x10005870  ; GW::FatalAssert
  10018302:  83 c4 10                        add      esp, 0x10
  10018305:  8b 06                           mov      eax, dword ptr [esi]
  10018307:  8b 04 b8                        mov      eax, dword ptr [eax + edi*4]
  1001830A:  5f                              pop      edi
  1001830B:  5e                              pop      esi
  1001830C:  5d                              pop      ebp
  1001830D:  c3                              ret      
  1001830E:  5f                              pop      edi
  1001830F:  33 c0                           xor      eax, eax
  10018311:  5e                              pop      esi
  10018312:  5d                              pop      ebp
  10018313:  c3                              ret      


; === FriendListMgr::GetFriend ===
; RVA: 0x00018320  Size: 94 bytes
; Exports: ?GetFriend@FriendListMgr@GW@@YAPAUFriend@2@PBE@Z
;
  10018320:  55                              push     ebp
  10018321:  8b ec                           mov      ebp, esp
  10018323:  51                              push     ecx
  10018324:  a1 fc c1 08 10                  mov      eax, dword ptr [0x1008c1fc]
  10018329:  53                              push     ebx
  1001832A:  56                              push     esi
  1001832B:  57                              push     edi
  1001832C:  8b 38                           mov      edi, dword ptr [eax]
  1001832E:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  10018331:  8d 04 87                        lea      eax, [edi + eax*4]
  10018334:  89 45 fc                        mov      dword ptr [ebp - 4], eax
  10018337:  3b f8                           cmp      edi, eax
  10018339:  74 3a                           je       0x10018375
  1001833B:  0f 1f 44 00 00                  nop      dword ptr [eax + eax]
  10018340:  8b 1f                           mov      ebx, dword ptr [edi]
  10018342:  85 db                           test     ebx, ebx
  10018344:  74 28                           je       0x1001836e
  10018346:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  10018349:  8d 53 08                        lea      edx, [ebx + 8]
  1001834C:  be 0c 00 00 00                  mov      esi, 0xc
  10018351:  8b 0a                           mov      ecx, dword ptr [edx]
  10018353:  3b 08                           cmp      ecx, dword ptr [eax]
  10018355:  75 14                           jne      0x1001836b
  10018357:  83 c2 04                        add      edx, 4
  1001835A:  83 c0 04                        add      eax, 4
  1001835D:  83 ee 04                        sub      esi, 4
  10018360:  73 ef                           jae      0x10018351
  10018362:  5f                              pop      edi
  10018363:  5e                              pop      esi
  10018364:  8b c3                           mov      eax, ebx
  10018366:  5b                              pop      ebx
  10018367:  8b e5                           mov      esp, ebp
  10018369:  5d                              pop      ebp
  1001836A:  c3                              ret      
  1001836B:  8b 45 fc                        mov      eax, dword ptr [ebp - 4]
  1001836E:  83 c7 04                        add      edi, 4
  10018371:  3b f8                           cmp      edi, eax
  10018373:  75 cb                           jne      0x10018340
  10018375:  5f                              pop      edi
  10018376:  5e                              pop      esi
  10018377:  33 c0                           xor      eax, eax
  10018379:  5b                              pop      ebx
  1001837A:  8b e5                           mov      esp, ebp
  1001837C:  5d                              pop      ebp
  1001837D:  c3                              ret      


; === FriendListMgr::GetFriend ===
; RVA: 0x00018380  Size: 147 bytes
; Exports: ?GetFriend@FriendListMgr@GW@@YAPAUFriend@2@PB_W0W4FriendType@2@@Z
;
  10018380:  55                              push     ebp
  10018381:  8b ec                           mov      ebp, esp
  10018383:  51                              push     ecx
  10018384:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  10018387:  53                              push     ebx
  10018388:  8b 5d 0c                        mov      ebx, dword ptr [ebp + 0xc]
  1001838B:  56                              push     esi
  1001838C:  57                              push     edi
  1001838D:  85 c9                           test     ecx, ecx
  1001838F:  75 04                           jne      0x10018395
  10018391:  85 db                           test     ebx, ebx
  10018393:  74 75                           je       0x1001840a
  10018395:  a1 fc c1 08 10                  mov      eax, dword ptr [0x1008c1fc]
  1001839A:  85 c0                           test     eax, eax
  1001839C:  74 6c                           je       0x1001840a
  1001839E:  8b 38                           mov      edi, dword ptr [eax]
  100183A0:  8b 40 08                        mov      eax, dword ptr [eax + 8]
  100183A3:  8d 14 87                        lea      edx, [edi + eax*4]
  100183A6:  89 55 fc                        mov      dword ptr [ebp - 4], edx
  100183A9:  3b fa                           cmp      edi, edx
  100183AB:  74 5d                           je       0x1001840a
  100183AD:  0f 1f 00                        nop      dword ptr [eax]
  100183B0:  8b 37                           mov      esi, dword ptr [edi]
  100183B2:  85 f6                           test     esi, esi
  100183B4:  74 3f                           je       0x100183f5
  100183B6:  8b 45 10                        mov      eax, dword ptr [ebp + 0x10]
  100183B9:  85 c0                           test     eax, eax
  100183BB:  74 04                           je       0x100183c1
  100183BD:  39 06                           cmp      dword ptr [esi], eax
  100183BF:  75 34                           jne      0x100183f5
  100183C1:  85 c9                           test     ecx, ecx
  100183C3:  74 16                           je       0x100183db
  100183C5:  6a 14                           push     0x14
  100183C7:  51                              push     ecx
  100183C8:  8d 46 18                        lea      eax, [esi + 0x18]
  100183CB:  50                              push     eax
  100183CC:  e8 cf df 01 00                  call     0x100363a0
  100183D1:  83 c4 0c                        add      esp, 0xc
  100183D4:  85 c0                           test     eax, eax
  100183D6:  74 29                           je       0x10018401
  100183D8:  8b 55 fc                        mov      edx, dword ptr [ebp - 4]
  100183DB:  85 db                           test     ebx, ebx
  100183DD:  74 16                           je       0x100183f5
  100183DF:  6a 14                           push     0x14
  100183E1:  8d 46 40                        lea      eax, [esi + 0x40]
  100183E4:  53                              push     ebx
  100183E5:  50                              push     eax
  100183E6:  e8 b5 df 01 00                  call     0x100363a0
  100183EB:  83 c4 0c                        add      esp, 0xc
  100183EE:  85 c0                           test     eax, eax
  100183F0:  74 0f                           je       0x10018401
  100183F2:  8b 55 fc                        mov      edx, dword ptr [ebp - 4]
  100183F5:  83 c7 04                        add      edi, 4
  100183F8:  3b fa                           cmp      edi, edx
  100183FA:  74 0e                           je       0x1001840a
  100183FC:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  100183FF:  eb af                           jmp      0x100183b0
  10018401:  5f                              pop      edi
  10018402:  8b c6                           mov      eax, esi
  10018404:  5e                              pop      esi
  10018405:  5b                              pop      ebx
  10018406:  8b e5                           mov      esp, ebp
  10018408:  5d                              pop      ebp
  10018409:  c3                              ret      
  1001840A:  5f                              pop      edi
  1001840B:  5e                              pop      esi
  1001840C:  33 c0                           xor      eax, eax
  1001840E:  5b                              pop      ebx
  1001840F:  8b e5                           mov      esp, ebp
  10018411:  5d                              pop      ebp
  10018412:  c3                              ret      


; === FriendListMgr::GetFriendList, GetFriendList ===
; RVA: 0x00018420  Size: 6 bytes
; Exports: ?GetFriendList@FriendListMgr@GW@@YAPAUFriendList@2@XZ, GetFriendList
;
  10018420:  a1 fc c1 08 10                  mov      eax, dword ptr [0x1008c1fc]
  10018425:  c3                              ret      


; === FriendListMgr::GetMyStatus, GetMyStatus ===
; RVA: 0x00018430  Size: 19 bytes
; Exports: ?GetMyStatus@FriendListMgr@GW@@YA?AW4FriendStatus@2@XZ, GetMyStatus
;
  10018430:  a1 fc c1 08 10                  mov      eax, dword ptr [0x1008c1fc]
  10018435:  85 c0                           test     eax, eax
  10018437:  74 07                           je       0x10018440
  10018439:  8b 80 a0 00 00 00               mov      eax, dword ptr [eax + 0xa0]
  1001843F:  c3                              ret      
  10018440:  33 c0                           xor      eax, eax
  10018442:  c3                              ret      


; === FriendListMgr::GetNumberOfFriends ===
; RVA: 0x00018450  Size: 94 bytes
; Exports: ?GetNumberOfFriends@FriendListMgr@GW@@YAIW4FriendType@2@@Z
;
  10018450:  55                              push     ebp
  10018451:  8b ec                           mov      ebp, esp
  10018453:  a1 fc c1 08 10                  mov      eax, dword ptr [0x1008c1fc]
  10018458:  85 c0                           test     eax, eax
  1001845A:  74 24                           je       0x10018480
  1001845C:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001845F:  49                              dec      ecx
  10018460:  83 f9 03                        cmp      ecx, 3
  10018463:  77 1b                           ja       0x10018480
  10018465:  ff 24 8d 84 84 01 10            jmp      dword ptr [ecx*4 + 0x10018484]
  1001846C:  8b 40 24                        mov      eax, dword ptr [eax + 0x24]
  1001846F:  5d                              pop      ebp
  10018470:  c3                              ret      
  10018471:  8b 40 28                        mov      eax, dword ptr [eax + 0x28]
  10018474:  5d                              pop      ebp
  10018475:  c3                              ret      
  10018476:  8b 40 2c                        mov      eax, dword ptr [eax + 0x2c]
  10018479:  5d                              pop      ebp
  1001847A:  c3                              ret      
  1001847B:  8b 40 30                        mov      eax, dword ptr [eax + 0x30]
  1001847E:  5d                              pop      ebp
  1001847F:  c3                              ret      
  10018480:  33 c0                           xor      eax, eax
  10018482:  5d                              pop      ebp
  10018483:  c3                              ret      
  10018484:  6c                              insb     byte ptr es:[edi], dx
  10018485:  84 01                           test     byte ptr [ecx], al
  10018487:  10 71 84                        adc      byte ptr [ecx - 0x7c], dh
  1001848A:  01 10                           add      dword ptr [eax], edx
  1001848C:  76 84                           jbe      0x10018412
  1001848E:  01 10                           add      dword ptr [eax], edx
  10018490:  7b 84                           jnp      0x10018416
  10018492:  01 10                           add      dword ptr [eax], edx
  10018494:  cc                              int3     
  10018495:  cc                              int3     
  10018496:  cc                              int3     
  10018497:  cc                              int3     
  10018498:  cc                              int3     
  10018499:  cc                              int3     
  1001849A:  cc                              int3     
  1001849B:  cc                              int3     
  1001849C:  cc                              int3     
  1001849D:  cc                              int3     
  1001849E:  cc                              int3     
  1001849F:  cc                              int3     
  100184A0:  a1 fc c1 08 10                  mov      eax, dword ptr [0x1008c1fc]
  100184A5:  85 c0                           test     eax, eax
  100184A7:  75 01                           jne      0x100184aa
  100184A9:  c3                              ret      
  100184AA:  8b 40 28                        mov      eax, dword ptr [eax + 0x28]
  100184AD:  c3                              ret      


; === FriendListMgr::GetNumberOfIgnores, GetNumberOfIgnores ===
; RVA: 0x000184A0  Size: 14 bytes
; Exports: ?GetNumberOfIgnores@FriendListMgr@GW@@YAIXZ, GetNumberOfIgnores
;
  100184A0:  a1 fc c1 08 10                  mov      eax, dword ptr [0x1008c1fc]
  100184A5:  85 c0                           test     eax, eax
  100184A7:  75 01                           jne      0x100184aa
  100184A9:  c3                              ret      
  100184AA:  8b 40 28                        mov      eax, dword ptr [eax + 0x28]
  100184AD:  c3                              ret      


; === FriendListMgr::GetNumberOfPartners, GetNumberOfPartners ===
; RVA: 0x000184B0  Size: 14 bytes
; Exports: ?GetNumberOfPartners@FriendListMgr@GW@@YAIXZ, GetNumberOfPartners
;
  100184B0:  a1 fc c1 08 10                  mov      eax, dword ptr [0x1008c1fc]
  100184B5:  85 c0                           test     eax, eax
  100184B7:  75 01                           jne      0x100184ba
  100184B9:  c3                              ret      
  100184BA:  8b 40 2c                        mov      eax, dword ptr [eax + 0x2c]
  100184BD:  c3                              ret      


; === FriendListMgr::GetNumberOfTraders, GetNumberOfTraders ===
; RVA: 0x000184C0  Size: 14 bytes
; Exports: ?GetNumberOfTraders@FriendListMgr@GW@@YAIXZ, GetNumberOfTraders
;
  100184C0:  a1 fc c1 08 10                  mov      eax, dword ptr [0x1008c1fc]
  100184C5:  85 c0                           test     eax, eax
  100184C7:  75 01                           jne      0x100184ca
  100184C9:  c3                              ret      
  100184CA:  8b 40 30                        mov      eax, dword ptr [eax + 0x30]
  100184CD:  c3                              ret      


; === FriendListMgr::RegisterFriendStatusCallback ===
; RVA: 0x00018780  Size: 52 bytes
; Exports: ?RegisterFriendStatusCallback@FriendListMgr@GW@@YAXPAUHookEntry@2@ABV?$function@$$A6AXPAUHookStatus@GW@@PBUFriend@2@1@Z@std@@@Z
;
  10018780:  55                              push     ebp
  10018781:  8b ec                           mov      ebp, esp
  10018783:  83 ec 08                        sub      esp, 8
  10018786:  ff 75 08                        push     dword ptr [ebp + 8]
  10018789:  e8 62 00 00 00                  call     0x100187f0  ; FriendListMgr::RemoveFriendStatusCallback
  1001878E:  83 c4 04                        add      esp, 4
  10018791:  8d 45 08                        lea      eax, [ebp + 8]
  10018794:  b9 08 c2 08 10                  mov      ecx, 0x1008c208
  10018799:  50                              push     eax
  1001879A:  8d 45 f8                        lea      eax, [ebp - 8]
  1001879D:  50                              push     eax
  1001879E:  e8 ad f5 ff ff                  call     0x10017d50
  100187A3:  ff 75 0c                        push     dword ptr [ebp + 0xc]
  100187A6:  8b 08                           mov      ecx, dword ptr [eax]
  100187A8:  83 c1 10                        add      ecx, 0x10
  100187AB:  e8 20 f8 ff ff                  call     0x10017fd0
  100187B0:  8b e5                           mov      esp, ebp
  100187B2:  5d                              pop      ebp
  100187B3:  c3                              ret      


; === FriendListMgr::RemoveFriend, RemoveFriend ===
; RVA: 0x000187C0  Size: 38 bytes
; Exports: ?RemoveFriend@FriendListMgr@GW@@YA_NPAUFriend@2@@Z, RemoveFriend
;
  100187C0:  55                              push     ebp
  100187C1:  8b ec                           mov      ebp, esp
  100187C3:  8b 45 08                        mov      eax, dword ptr [ebp + 8]
  100187C6:  85 c0                           test     eax, eax
  100187C8:  74 18                           je       0x100187e2
  100187CA:  8b 0d f4 c1 08 10               mov      ecx, dword ptr [0x1008c1f4]
  100187D0:  85 c9                           test     ecx, ecx
  100187D2:  74 0e                           je       0x100187e2
  100187D4:  6a 00                           push     0
  100187D6:  ff 70 68                        push     dword ptr [eax + 0x68]
  100187D9:  ff d1                           call     ecx
  100187DB:  83 c4 08                        add      esp, 8
  100187DE:  b0 01                           mov      al, 1
  100187E0:  5d                              pop      ebp
  100187E1:  c3                              ret      
  100187E2:  32 c0                           xor      al, al
  100187E4:  5d                              pop      ebp
  100187E5:  c3                              ret      


; === FriendListMgr::RemoveFriendStatusCallback ===
; RVA: 0x000187F0  Size: 277 bytes
; Exports: ?RemoveFriendStatusCallback@FriendListMgr@GW@@YAXPAUHookEntry@2@@Z
;
  100187F0:  55                              push     ebp
  100187F1:  8b ec                           mov      ebp, esp
  100187F3:  8b 55 08                        mov      edx, dword ptr [ebp + 8]
  100187F6:  83 ec 08                        sub      esp, 8
  100187F9:  0f b6 c2                        movzx    eax, dl
  100187FC:  35 c5 9d 1c 81                  xor      eax, 0x811c9dc5
  10018801:  69 c8 93 01 00 01               imul     ecx, eax, 0x1000193
  10018807:  8b c2                           mov      eax, edx
  10018809:  c1 e8 08                        shr      eax, 8
  1001880C:  0f b6 c0                        movzx    eax, al
  1001880F:  56                              push     esi
  10018810:  33 c8                           xor      ecx, eax
  10018812:  8b c2                           mov      eax, edx
  10018814:  c1 e8 10                        shr      eax, 0x10
  10018817:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  1001881D:  0f b6 c0                        movzx    eax, al
  10018820:  c1 ea 18                        shr      edx, 0x18
  10018823:  33 c8                           xor      ecx, eax
  10018825:  69 c1 93 01 00 01               imul     eax, ecx, 0x1000193
  1001882B:  b9 08 c2 08 10                  mov      ecx, 0x1008c208
  10018830:  33 c2                           xor      eax, edx
  10018832:  69 c0 93 01 00 01               imul     eax, eax, 0x1000193
  10018838:  50                              push     eax
  10018839:  8d 45 08                        lea      eax, [ebp + 8]
  1001883C:  50                              push     eax
  1001883D:  8d 45 f8                        lea      eax, [ebp - 8]
  10018840:  50                              push     eax
  10018841:  e8 9a d9 fe ff                  call     0x100061e0
  10018846:  8b 15 0c c2 08 10               mov      edx, dword ptr [0x1008c20c]
  1001884C:  8b f2                           mov      esi, edx
  1001884E:  8b 40 04                        mov      eax, dword ptr [eax + 4]
  10018851:  85 c0                           test     eax, eax
  10018853:  0f 45 f0                        cmovne   esi, eax
  10018856:  3b f2                           cmp      esi, edx
  10018858:  0f 84 a2 00 00 00               je       0x10018900
  1001885E:  0f b6 46 08                     movzx    eax, byte ptr [esi + 8]
  10018862:  35 c5 9d 1c 81                  xor      eax, 0x811c9dc5
  10018867:  69 c8 93 01 00 01               imul     ecx, eax, 0x1000193
  1001886D:  0f b6 46 09                     movzx    eax, byte ptr [esi + 9]
  10018871:  33 c8                           xor      ecx, eax
  10018873:  0f b6 46 0a                     movzx    eax, byte ptr [esi + 0xa]
  10018877:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  1001887D:  33 c8                           xor      ecx, eax
  1001887F:  0f b6 46 0b                     movzx    eax, byte ptr [esi + 0xb]
  10018883:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  10018889:  33 c8                           xor      ecx, eax
  1001888B:  a1 14 c2 08 10                  mov      eax, dword ptr [0x1008c214]
  10018890:  69 c9 93 01 00 01               imul     ecx, ecx, 0x1000193
  10018896:  23 0d 20 c2 08 10               and      ecx, dword ptr [0x1008c220]
  1001889C:  8d 0c c8                        lea      ecx, [eax + ecx*8]
  1001889F:  8b 01                           mov      eax, dword ptr [ecx]
  100188A1:  39 71 04                        cmp      dword ptr [ecx + 4], esi
  100188A4:  75 13                           jne      0x100188b9
  100188A6:  3b c6                           cmp      eax, esi
  100188A8:  75 07                           jne      0x100188b1
  100188AA:  89 11                           mov      dword ptr [ecx], edx
  100188AC:  89 51 04                        mov      dword ptr [ecx + 4], edx
  100188AF:  eb 10                           jmp      0x100188c1
  100188B1:  8b 56 04                        mov      edx, dword ptr [esi + 4]
  100188B4:  89 51 04                        mov      dword ptr [ecx + 4], edx
  100188B7:  eb 08                           jmp      0x100188c1
  100188B9:  3b c6                           cmp      eax, esi
  100188BB:  75 04                           jne      0x100188c1
  100188BD:  8b 06                           mov      eax, dword ptr [esi]
  100188BF:  89 01                           mov      dword ptr [ecx], eax
  100188C1:  8b 0e                           mov      ecx, dword ptr [esi]
  100188C3:  ff 0d 10 c2 08 10               dec      dword ptr [0x1008c210]
  100188C9:  8b 46 04                        mov      eax, dword ptr [esi + 4]
  100188CC:  57                              push     edi
  100188CD:  8d 7e 10                        lea      edi, [esi + 0x10]
  100188D0:  89 08                           mov      dword ptr [eax], ecx
  100188D2:  8b 46 04                        mov      eax, dword ptr [esi + 4]
  100188D5:  89 41 04                        mov      dword ptr [ecx + 4], eax
  100188D8:  8b 4f 24                        mov      ecx, dword ptr [edi + 0x24]
  100188DB:  85 c9                           test     ecx, ecx
  100188DD:  74 15                           je       0x100188f4
  100188DF:  8b 11                           mov      edx, dword ptr [ecx]
  100188E1:  3b cf                           cmp      ecx, edi
  100188E3:  0f 95 c0                        setne    al
  100188E6:  0f b6 c0                        movzx    eax, al
  100188E9:  50                              push     eax
  100188EA:  ff 52 10                        call     dword ptr [edx + 0x10]
  100188ED:  c7 47 24 00 00 00 00            mov      dword ptr [edi + 0x24], 0
  100188F4:  6a 38                           push     0x38
  100188F6:  56                              push     esi
  100188F7:  e8 91 37 01 00                  call     0x1002c08d
  100188FC:  83 c4 08                        add      esp, 8
  100188FF:  5f                              pop      edi
  10018900:  5e                              pop      esi
  10018901:  8b e5                           mov      esp, ebp
  10018903:  5d                              pop      ebp
  10018904:  c3                              ret      


; === FriendListMgr::SetFriendListStatus, SetFriendListStatus ===
; RVA: 0x00018910  Size: 53 bytes
; Exports: ?SetFriendListStatus@FriendListMgr@GW@@YA_NW4FriendStatus@2@@Z, SetFriendListStatus
;
  10018910:  55                              push     ebp
  10018911:  8b ec                           mov      ebp, esp
  10018913:  ff 75 08                        push     dword ptr [ebp + 8]
  10018916:  68 e0 22 05 10                  push     0x100522e0
  1001891B:  e8 60 de 00 00                  call     0x10026780  ; UI::GetFrameByLabel
  10018920:  83 c4 04                        add      esp, 4
  10018923:  50                              push     eax
  10018924:  e8 67 f4 00 00                  call     0x10027d90  ; UI::SelectDropdownOption, SelectDropdownOption
  10018929:  a1 ec c1 08 10                  mov      eax, dword ptr [0x1008c1ec]
  1001892E:  83 c4 08                        add      esp, 8
  10018931:  85 c0                           test     eax, eax
  10018933:  74 0c                           je       0x10018941
  10018935:  ff 75 08                        push     dword ptr [ebp + 8]
  10018938:  ff d0                           call     eax
  1001893A:  83 c4 04                        add      esp, 4
  1001893D:  b0 01                           mov      al, 1
  1001893F:  5d                              pop      ebp
  10018940:  c3                              ret      
  10018941:  32 c0                           xor      al, al
  10018943:  5d                              pop      ebp
  10018944:  c3                              ret      


