default rel ; set RIP-relative addressing to default

extern ___error

global _ft_write

_ft_write:
	
	mov		rax, 0x2000004
	syscall
	test	rax, rax
	js		.error
	ret

.error:
	;mov		rdi, rax
	mov		byte [rax], -1
	call	___error
	mov		byte [rax], 9
	ret
