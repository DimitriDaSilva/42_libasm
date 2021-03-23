default rel ; RIP-relative addressing by default

global _start

_start:
	push	21
	call	times2
	mov		rdi, rax
	mov		rax, 0x2000001
	syscall

times2:
	push	rbp
	mov		rbp, rsp
	mov		rax, [rsp + 16]
	add		rax, rax
	add		rax, rax
	mov		rsp, rbp
	pop		rbp
	ret
