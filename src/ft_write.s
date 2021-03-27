default rel ; set RIP-relative addressing to default

global _ft_write

_ft_write:
	mov		rax, 0x2000004
	syscall
	ret
