default rel ; RIP-relative addressing by default

global _start

_start:
	; Allocate space and store values in it
	sub	rsp, 4				; malloc 4 bytes in the stack
	mov	[rsp], byte 'H'		; put letter H at the beginning of the allocated space
	mov [rsp + 1], byte 'e'
	mov [rsp + 2], byte 'y'
	mov [rsp + 3], byte '!'
	; Write the string just stored
	mov	rax, 0x2000004		; syscall for write
	mov	rdi, 1				; write to stdout
	lea	rsi, [rsp]			; bytes to write
	mov	rdx, 4				; nb of bytes to write
	syscall
	; Exit function
	mov rax, 0x2000001		; syscall exit code
	mov	rdi, 0				; return value
	syscall
