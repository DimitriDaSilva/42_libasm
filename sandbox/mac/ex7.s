default rel ; RIP-relative addressing by default

global _start

_start:
	call	func
	mov		rax, 0x2000001
	syscall

func:
	mov	rbp, rsp
	sub	esp, 2
	mov [esp], byte 'H'
	mov [esp + 1], byte 'H'
