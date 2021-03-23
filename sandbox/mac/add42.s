global _add42

_add42:
	; Prologue
	push	rbp
	mov		rbp, rsp

	; Calling convention assumes arg is in rdi
	mov		rax, rdi
	add		rax, 42

	; Epilogue
	mov		rsp, rbp
	pop		rbp
	ret

