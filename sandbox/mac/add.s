global _add

_add:
	push	rbp
	mov		rbp, rsp

	mov		rax, rdi
	add		rax, rsi

	mov		rsp, rbp
	pop		rbp
	ret
