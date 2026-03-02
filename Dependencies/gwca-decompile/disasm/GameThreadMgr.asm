; Module: GameThreadMgr
; Functions: 6
; Total code size: 1008 bytes
;

; === GameThread::EnableHooks ===
; RVA: 0x000199A0  Size: 46 bytes
; Exports: ?EnableHooks@GameThread@GW@@YAXXZ
;
  100199A0:  80 3d 6c c2 08 10 00            cmp      byte ptr [0x1008c26c], 0
  100199A7:  74 24                           je       0x100199cd
  100199A9:  68 4c c2 08 10                  push     0x1008c24c
  100199AE:  ff 15 34 c0 04 10               call     dword ptr [0x1004c034]
  100199B4:  ff 35 64 c2 08 10               push     dword ptr [0x1008c264]
  100199BA:  e8 81 10 00 00                  call     0x1001aa40  ; Hook::EnableHooks
  100199BF:  83 c4 04                        add      esp, 4
  100199C2:  68 4c c2 08 10                  push     0x1008c24c
  100199C7:  ff 15 38 c0 04 10               call     dword ptr [0x1004c038]
  100199CD:  c3                              ret      


; === GameThread::ClearCalls ===
; RVA: 0x00019FA0  Size: 156 bytes
; Exports: ?ClearCalls@GameThread@GW@@YAXXZ
;
  10019FA0:  80 3d 6c c2 08 10 00            cmp      byte ptr [0x1008c26c], 0
  10019FA7:  0f 84 8e 00 00 00               je       0x1001a03b
  10019FAD:  68 4c c2 08 10                  push     0x1008c24c
  10019FB2:  ff 15 34 c0 04 10               call     dword ptr [0x1004c034]
  10019FB8:  a1 7c c2 08 10                  mov      eax, dword ptr [0x1008c27c]
  10019FBD:  8b 0d 80 c2 08 10               mov      ecx, dword ptr [0x1008c280]
  10019FC3:  3b c1                           cmp      eax, ecx
  10019FC5:  74 19                           je       0x10019fe0
  10019FC7:  68 7c c2 08 10                  push     0x1008c27c
  10019FCC:  51                              push     ecx
  10019FCD:  50                              push     eax
  10019FCE:  e8 fd fa ff ff                  call     0x10019ad0
  10019FD3:  a1 7c c2 08 10                  mov      eax, dword ptr [0x1008c27c]
  10019FD8:  83 c4 0c                        add      esp, 0xc
  10019FDB:  a3 80 c2 08 10                  mov      dword ptr [0x1008c280], eax
  10019FE0:  a1 70 c2 08 10                  mov      eax, dword ptr [0x1008c270]
  10019FE5:  8b 0d 74 c2 08 10               mov      ecx, dword ptr [0x1008c274]
  10019FEB:  3b c1                           cmp      eax, ecx
  10019FED:  74 19                           je       0x1001a008
  10019FEF:  68 70 c2 08 10                  push     0x1008c270
  10019FF4:  51                              push     ecx
  10019FF5:  50                              push     eax
  10019FF6:  e8 d5 fa ff ff                  call     0x10019ad0
  10019FFB:  a1 70 c2 08 10                  mov      eax, dword ptr [0x1008c270]
  1001A000:  83 c4 0c                        add      esp, 0xc
  1001A003:  a3 74 c2 08 10                  mov      dword ptr [0x1008c274], eax
  1001A008:  a1 88 c2 08 10                  mov      eax, dword ptr [0x1008c288]
  1001A00D:  8b 0d 8c c2 08 10               mov      ecx, dword ptr [0x1008c28c]
  1001A013:  3b c1                           cmp      eax, ecx
  1001A015:  74 19                           je       0x1001a030
  1001A017:  68 88 c2 08 10                  push     0x1008c288
  1001A01C:  51                              push     ecx
  1001A01D:  50                              push     eax
  1001A01E:  e8 ed bd fe ff                  call     0x10005e10
  1001A023:  a1 88 c2 08 10                  mov      eax, dword ptr [0x1008c288]
  1001A028:  83 c4 0c                        add      esp, 0xc
  1001A02B:  a3 8c c2 08 10                  mov      dword ptr [0x1008c28c], eax
  1001A030:  68 4c c2 08 10                  push     0x1008c24c
  1001A035:  ff 15 38 c0 04 10               call     dword ptr [0x1004c038]
  1001A03B:  c3                              ret      


; === GameThread::Enqueue ===
; RVA: 0x0001A040  Size: 237 bytes
; Exports: ?Enqueue@GameThread@GW@@YAXV?$function@$$A6AXXZ@std@@_N@Z
;
  1001A040:  55                              push     ebp
  1001A041:  8b ec                           mov      ebp, esp
  1001A043:  6a ff                           push     -1
  1001A045:  68 4d af 04 10                  push     0x1004af4d
  1001A04A:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  1001A050:  50                              push     eax
  1001A051:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1001A056:  33 c5                           xor      eax, ebp
  1001A058:  50                              push     eax
  1001A059:  8d 45 f4                        lea      eax, [ebp - 0xc]
  1001A05C:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  1001A062:  80 3d 6c c2 08 10 00            cmp      byte ptr [0x1008c26c], 0
  1001A069:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001A070:  74 5f                           je       0x1001a0d1
  1001A072:  68 4c c2 08 10                  push     0x1008c24c
  1001A077:  ff 15 34 c0 04 10               call     dword ptr [0x1004c034]
  1001A07D:  80 7d 30 00                     cmp      byte ptr [ebp + 0x30], 0
  1001A081:  75 17                           jne      0x1001a09a
  1001A083:  80 3d 6d c2 08 10 00            cmp      byte ptr [0x1008c26d], 0
  1001A08A:  74 0e                           je       0x1001a09a
  1001A08C:  8b 4d 2c                        mov      ecx, dword ptr [ebp + 0x2c]
  1001A08F:  85 c9                           test     ecx, ecx
  1001A091:  74 65                           je       0x1001a0f8
  1001A093:  8b 01                           mov      eax, dword ptr [ecx]
  1001A095:  ff 50 08                        call     dword ptr [eax + 8]
  1001A098:  eb 2c                           jmp      0x1001a0c6
  1001A09A:  a1 74 c2 08 10                  mov      eax, dword ptr [0x1008c274]
  1001A09F:  8d 4d 08                        lea      ecx, [ebp + 8]
  1001A0A2:  51                              push     ecx
  1001A0A3:  3b 05 78 c2 08 10               cmp      eax, dword ptr [0x1008c278]
  1001A0A9:  74 10                           je       0x1001a0bb
  1001A0AB:  8b c8                           mov      ecx, eax
  1001A0AD:  e8 ce fc ff ff                  call     0x10019d80
  1001A0B2:  83 05 74 c2 08 10 28            add      dword ptr [0x1008c274], 0x28
  1001A0B9:  eb 0b                           jmp      0x1001a0c6
  1001A0BB:  50                              push     eax
  1001A0BC:  b9 70 c2 08 10                  mov      ecx, 0x1008c270
  1001A0C1:  e8 4a fa ff ff                  call     0x10019b10
  1001A0C6:  68 4c c2 08 10                  push     0x1008c24c
  1001A0CB:  ff 15 38 c0 04 10               call     dword ptr [0x1004c038]
  1001A0D1:  8b 4d 2c                        mov      ecx, dword ptr [ebp + 0x2c]
  1001A0D4:  85 c9                           test     ecx, ecx
  1001A0D6:  74 11                           je       0x1001a0e9
  1001A0D8:  8b 11                           mov      edx, dword ptr [ecx]
  1001A0DA:  8d 45 08                        lea      eax, [ebp + 8]
  1001A0DD:  3b c8                           cmp      ecx, eax
  1001A0DF:  0f 95 c0                        setne    al
  1001A0E2:  0f b6 c0                        movzx    eax, al
  1001A0E5:  50                              push     eax
  1001A0E6:  ff 52 10                        call     dword ptr [edx + 0x10]
  1001A0E9:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  1001A0EC:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  1001A0F3:  59                              pop      ecx
  1001A0F4:  8b e5                           mov      esp, ebp
  1001A0F6:  5d                              pop      ebp
  1001A0F7:  c3                              ret      
  1001A0F8:  e8 e0 15 01 00                  call     0x1002b6dd
  1001A0FD:  cc                              int3     
  1001A0FE:  cc                              int3     
  1001A0FF:  cc                              int3     
  1001A100:  80 3d 6c c2 08 10 00            cmp      byte ptr [0x1008c26c], 0
  1001A107:  75 03                           jne      0x1001a10c
  1001A109:  32 c0                           xor      al, al
  1001A10B:  c3                              ret      
  1001A10C:  53                              push     ebx
  1001A10D:  68 4c c2 08 10                  push     0x1008c24c
  1001A112:  ff 15 34 c0 04 10               call     dword ptr [0x1004c034]
  1001A118:  8a 1d 6d c2 08 10               mov      bl, byte ptr [0x1008c26d]
  1001A11E:  68 4c c2 08 10                  push     0x1008c24c
  1001A123:  ff 15 38 c0 04 10               call     dword ptr [0x1004c038]
  1001A129:  8a c3                           mov      al, bl
  1001A12B:  5b                              pop      ebx
  1001A12C:  c3                              ret      


; === GameThread::IsInGameThread, IsInGameThread ===
; RVA: 0x0001A100  Size: 45 bytes
; Exports: ?IsInGameThread@GameThread@GW@@YA_NXZ, IsInGameThread
;
  1001A100:  80 3d 6c c2 08 10 00            cmp      byte ptr [0x1008c26c], 0
  1001A107:  75 03                           jne      0x1001a10c
  1001A109:  32 c0                           xor      al, al
  1001A10B:  c3                              ret      
  1001A10C:  53                              push     ebx
  1001A10D:  68 4c c2 08 10                  push     0x1008c24c
  1001A112:  ff 15 34 c0 04 10               call     dword ptr [0x1004c034]
  1001A118:  8a 1d 6d c2 08 10               mov      bl, byte ptr [0x1008c26d]
  1001A11E:  68 4c c2 08 10                  push     0x1008c24c
  1001A123:  ff 15 38 c0 04 10               call     dword ptr [0x1004c038]
  1001A129:  8a c3                           mov      al, bl
  1001A12B:  5b                              pop      ebx
  1001A12C:  c3                              ret      


; === GameThread::RegisterGameThreadCallback ===
; RVA: 0x0001A160  Size: 238 bytes
; Exports: ?RegisterGameThreadCallback@GameThread@GW@@YAXPAUHookEntry@2@ABV?$function@$$A6AXPAUHookStatus@GW@@@Z@std@@H@Z
;
  1001A160:  55                              push     ebp
  1001A161:  8b ec                           mov      ebp, esp
  1001A163:  6a ff                           push     -1
  1001A165:  68 85 af 04 10                  push     0x1004af85
  1001A16A:  64 a1 00 00 00 00               mov      eax, dword ptr fs:[0]
  1001A170:  50                              push     eax
  1001A171:  83 ec 38                        sub      esp, 0x38
  1001A174:  a1 c0 a4 08 10                  mov      eax, dword ptr [0x1008a4c0]
  1001A179:  33 c5                           xor      eax, ebp
  1001A17B:  89 45 f0                        mov      dword ptr [ebp - 0x10], eax
  1001A17E:  53                              push     ebx
  1001A17F:  56                              push     esi
  1001A180:  57                              push     edi
  1001A181:  50                              push     eax
  1001A182:  8d 45 f4                        lea      eax, [ebp - 0xc]
  1001A185:  64 a3 00 00 00 00               mov      dword ptr fs:[0], eax
  1001A18B:  80 3d 6c c2 08 10 00            cmp      byte ptr [0x1008c26c], 0
  1001A192:  8b 7d 08                        mov      edi, dword ptr [ebp + 8]
  1001A195:  8b 5d 0c                        mov      ebx, dword ptr [ebp + 0xc]
  1001A198:  0f 84 94 00 00 00               je       0x1001a232
  1001A19E:  68 4c c2 08 10                  push     0x1008c24c
  1001A1A3:  ff 15 34 c0 04 10               call     dword ptr [0x1004c034]
  1001A1A9:  57                              push     edi
  1001A1AA:  e8 a1 00 00 00                  call     0x1001a250  ; GameThread::RemoveGameThreadCallback
  1001A1AF:  8b 35 88 c2 08 10               mov      esi, dword ptr [0x1008c288]
  1001A1B5:  83 c4 04                        add      esp, 4
  1001A1B8:  a1 8c c2 08 10                  mov      eax, dword ptr [0x1008c28c]
  1001A1BD:  8b 4d 10                        mov      ecx, dword ptr [ebp + 0x10]
  1001A1C0:  3b f0                           cmp      esi, eax
  1001A1C2:  74 0b                           je       0x1001a1cf
  1001A1C4:  39 0e                           cmp      dword ptr [esi], ecx
  1001A1C6:  7f 07                           jg       0x1001a1cf
  1001A1C8:  83 c6 30                        add      esi, 0x30
  1001A1CB:  3b f0                           cmp      esi, eax
  1001A1CD:  75 f5                           jne      0x1001a1c4
  1001A1CF:  89 4d c0                        mov      dword ptr [ebp - 0x40], ecx
  1001A1D2:  89 7d c4                        mov      dword ptr [ebp - 0x3c], edi
  1001A1D5:  c7 45 ec 00 00 00 00            mov      dword ptr [ebp - 0x14], 0
  1001A1DC:  8b 4b 24                        mov      ecx, dword ptr [ebx + 0x24]
  1001A1DF:  c7 45 fc 00 00 00 00            mov      dword ptr [ebp - 4], 0
  1001A1E6:  85 c9                           test     ecx, ecx
  1001A1E8:  74 0b                           je       0x1001a1f5
  1001A1EA:  8b 01                           mov      eax, dword ptr [ecx]
  1001A1EC:  8d 55 c8                        lea      edx, [ebp - 0x38]
  1001A1EF:  52                              push     edx
  1001A1F0:  ff 10                           call     dword ptr [eax]
  1001A1F2:  89 45 ec                        mov      dword ptr [ebp - 0x14], eax
  1001A1F5:  8d 45 c0                        lea      eax, [ebp - 0x40]
  1001A1F8:  c7 45 fc 01 00 00 00            mov      dword ptr [ebp - 4], 1
  1001A1FF:  50                              push     eax
  1001A200:  56                              push     esi
  1001A201:  8d 45 bc                        lea      eax, [ebp - 0x44]
  1001A204:  b9 88 c2 08 10                  mov      ecx, 0x1008c288
  1001A209:  50                              push     eax
  1001A20A:  e8 31 d2 fe ff                  call     0x10007440
  1001A20F:  8b 4d ec                        mov      ecx, dword ptr [ebp - 0x14]
  1001A212:  85 c9                           test     ecx, ecx
  1001A214:  74 11                           je       0x1001a227
  1001A216:  8b 11                           mov      edx, dword ptr [ecx]
  1001A218:  8d 45 c8                        lea      eax, [ebp - 0x38]
  1001A21B:  3b c8                           cmp      ecx, eax
  1001A21D:  0f 95 c0                        setne    al
  1001A220:  0f b6 c0                        movzx    eax, al
  1001A223:  50                              push     eax
  1001A224:  ff 52 10                        call     dword ptr [edx + 0x10]
  1001A227:  68 4c c2 08 10                  push     0x1008c24c
  1001A22C:  ff 15 38 c0 04 10               call     dword ptr [0x1004c038]
  1001A232:  8b 4d f4                        mov      ecx, dword ptr [ebp - 0xc]
  1001A235:  64 89 0d 00 00 00 00            mov      dword ptr fs:[0], ecx
  1001A23C:  59                              pop      ecx
  1001A23D:  5f                              pop      edi
  1001A23E:  5e                              pop      esi
  1001A23F:  5b                              pop      ebx
  1001A240:  8b 4d f0                        mov      ecx, dword ptr [ebp - 0x10]
  1001A243:  33 cd                           xor      ecx, ebp
  1001A245:  e8 6d 21 01 00                  call     0x1002c3b7
  1001A24A:  8b e5                           mov      esp, ebp
  1001A24C:  5d                              pop      ebp
  1001A24D:  c3                              ret      


; === GameThread::RemoveGameThreadCallback ===
; RVA: 0x0001A250  Size: 286 bytes
; Exports: ?RemoveGameThreadCallback@GameThread@GW@@YAXPAUHookEntry@2@@Z
;
  1001A250:  55                              push     ebp
  1001A251:  8b ec                           mov      ebp, esp
  1001A253:  80 3d 6c c2 08 10 00            cmp      byte ptr [0x1008c26c], 0
  1001A25A:  0f 84 0c 01 00 00               je       0x1001a36c
  1001A260:  53                              push     ebx
  1001A261:  68 4c c2 08 10                  push     0x1008c24c
  1001A266:  ff 15 34 c0 04 10               call     dword ptr [0x1004c034]
  1001A26C:  a1 88 c2 08 10                  mov      eax, dword ptr [0x1008c288]
  1001A271:  8b 1d 8c c2 08 10               mov      ebx, dword ptr [0x1008c28c]
  1001A277:  3b c3                           cmp      eax, ebx
  1001A279:  0f 84 e1 00 00 00               je       0x1001a360
  1001A27F:  8b 4d 08                        mov      ecx, dword ptr [ebp + 8]
  1001A282:  57                              push     edi
  1001A283:  8d 78 30                        lea      edi, [eax + 0x30]
  1001A286:  39 48 04                        cmp      dword ptr [eax + 4], ecx
  1001A289:  74 15                           je       0x1001a2a0
  1001A28B:  8b c7                           mov      eax, edi
  1001A28D:  3b c3                           cmp      eax, ebx
  1001A28F:  75 f2                           jne      0x1001a283
  1001A291:  5f                              pop      edi
  1001A292:  68 4c c2 08 10                  push     0x1008c24c
  1001A297:  ff 15 38 c0 04 10               call     dword ptr [0x1004c038]
  1001A29D:  5b                              pop      ebx
  1001A29E:  5d                              pop      ebp
  1001A29F:  c3                              ret      
  1001A2A0:  56                              push     esi
  1001A2A1:  3b fb                           cmp      edi, ebx
  1001A2A3:  0f 84 87 00 00 00               je       0x1001a330
  1001A2A9:  8d 77 fc                        lea      esi, [edi - 4]
  1001A2AC:  0f 1f 40 00                     nop      dword ptr [eax]
  1001A2B0:  8b 07                           mov      eax, dword ptr [edi]
  1001A2B2:  8d 4e dc                        lea      ecx, [esi - 0x24]
  1001A2B5:  89 46 d4                        mov      dword ptr [esi - 0x2c], eax
  1001A2B8:  8b 46 08                        mov      eax, dword ptr [esi + 8]
  1001A2BB:  89 46 d8                        mov      dword ptr [esi - 0x28], eax
  1001A2BE:  8d 46 0c                        lea      eax, [esi + 0xc]
  1001A2C1:  3b c8                           cmp      ecx, eax
  1001A2C3:  74 5b                           je       0x1001a320
  1001A2C5:  8b 0e                           mov      ecx, dword ptr [esi]
  1001A2C7:  85 c9                           test     ecx, ecx
  1001A2C9:  74 1a                           je       0x1001a2e5
  1001A2CB:  8b 11                           mov      edx, dword ptr [ecx]
  1001A2CD:  8d 46 dc                        lea      eax, [esi - 0x24]
  1001A2D0:  3b c8                           cmp      ecx, eax
  1001A2D2:  0f 95 c0                        setne    al
  1001A2D5:  0f b6 c0                        movzx    eax, al
  1001A2D8:  50                              push     eax
  1001A2D9:  ff 52 10                        call     dword ptr [edx + 0x10]
  1001A2DC:  c7 06 00 00 00 00               mov      dword ptr [esi], 0
  1001A2E2:  8d 46 0c                        lea      eax, [esi + 0xc]
  1001A2E5:  8b 4e 30                        mov      ecx, dword ptr [esi + 0x30]
  1001A2E8:  85 c9                           test     ecx, ecx
  1001A2EA:  74 34                           je       0x1001a320
  1001A2EC:  3b c8                           cmp      ecx, eax
  1001A2EE:  75 27                           jne      0x1001a317
  1001A2F0:  8b 01                           mov      eax, dword ptr [ecx]
  1001A2F2:  8b 50 04                        mov      edx, dword ptr [eax + 4]
  1001A2F5:  8d 46 dc                        lea      eax, [esi - 0x24]
  1001A2F8:  50                              push     eax
  1001A2F9:  ff d2                           call     edx
  1001A2FB:  89 06                           mov      dword ptr [esi], eax
  1001A2FD:  8b 4e 30                        mov      ecx, dword ptr [esi + 0x30]
  1001A300:  85 c9                           test     ecx, ecx
  1001A302:  74 1c                           je       0x1001a320
  1001A304:  8b 11                           mov      edx, dword ptr [ecx]
  1001A306:  8d 46 0c                        lea      eax, [esi + 0xc]
  1001A309:  3b c8                           cmp      ecx, eax
  1001A30B:  0f 95 c0                        setne    al
  1001A30E:  0f b6 c0                        movzx    eax, al
  1001A311:  50                              push     eax
  1001A312:  ff 52 10                        call     dword ptr [edx + 0x10]
  1001A315:  eb 02                           jmp      0x1001a319
  1001A317:  89 0e                           mov      dword ptr [esi], ecx
  1001A319:  c7 46 30 00 00 00 00            mov      dword ptr [esi + 0x30], 0
  1001A320:  83 c7 30                        add      edi, 0x30
  1001A323:  83 c6 30                        add      esi, 0x30
  1001A326:  3b fb                           cmp      edi, ebx
  1001A328:  75 86                           jne      0x1001a2b0
  1001A32A:  8b 1d 8c c2 08 10               mov      ebx, dword ptr [0x1008c28c]
  1001A330:  8b 4b fc                        mov      ecx, dword ptr [ebx - 4]
  1001A333:  8d 73 d8                        lea      esi, [ebx - 0x28]
  1001A336:  85 c9                           test     ecx, ecx
  1001A338:  74 1b                           je       0x1001a355
  1001A33A:  8b 11                           mov      edx, dword ptr [ecx]
  1001A33C:  3b ce                           cmp      ecx, esi
  1001A33E:  0f 95 c0                        setne    al
  1001A341:  0f b6 c0                        movzx    eax, al
  1001A344:  50                              push     eax
  1001A345:  ff 52 10                        call     dword ptr [edx + 0x10]
  1001A348:  c7 46 24 00 00 00 00            mov      dword ptr [esi + 0x24], 0
  1001A34F:  8b 1d 8c c2 08 10               mov      ebx, dword ptr [0x1008c28c]
  1001A355:  83 eb 30                        sub      ebx, 0x30
  1001A358:  5e                              pop      esi
  1001A359:  89 1d 8c c2 08 10               mov      dword ptr [0x1008c28c], ebx
  1001A35F:  5f                              pop      edi
  1001A360:  68 4c c2 08 10                  push     0x1008c24c
  1001A365:  ff 15 38 c0 04 10               call     dword ptr [0x1004c038]
  1001A36B:  5b                              pop      ebx
  1001A36C:  5d                              pop      ebp
  1001A36D:  c3                              ret      


