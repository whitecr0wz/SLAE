global _start

_start:

       inc rdx                     ; Increments RDX.
       push rdx                    ; Pushes the value of RDX into the Stack.
       pop rcx                     ; Pops the top of the Stack into RCX.

       mov rbp, 0x5756575657565756 ; Original tag should be 0x4645464546454645.
       mov rbx, 0x1111111111111111 ; Gives the value "0x1111111111111111" to RBX.
       sub rbp, rbx                ; RBP is substracted by RBX.

main:

       inc rcx                     ; RCX is incremented.
       cmp rbp, [rcx]              ; RBP is compared against RCX.
       jnz main                    ; Jump to main if the Zero flag (ZF) hasn't been set.

       lea rcx, [rcx + 8]          ; Copy RCX+8 into RCX.

       jmp rcx                     ; Jump into RCX.
