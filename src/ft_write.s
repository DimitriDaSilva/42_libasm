default rel ; set RIP-relative addressing to default

extern ___error

global _ft_write

_ft_write:
	
	mov		rax, 0x2000004
	syscall
	jc		.error
	ret

.error:
	mov		r8, rax
	call	___error
	mov		[rax], r8
	mov		rax, -1
	ret
