	default	rel					; Set RIP-relative addressing to default

	extern	___error

	global	_ft_write

_ft_write:
	; Write syscall. Args are set on rdi, rsi and rdx (C calling convetion)
	mov		rax, 0x2000004		; Set sys_write handle
	syscall						; Exec the sys_write call. If success, rax == nb of bytes written

	; Checking for errors in the syscall
	jc		.error				; if CF == 1 jmp to .error (CF flag set to 1 if error)
	ret

.error:
	mov		r8, rax				; Saving the return value of the syscall
	call	___error			; ___error will return an int* pointing to errno
	mov		[rax], r8			; Changing the errno to the value returned by the sys_write
	mov		rax, -1				; Setting the return value of ft_write
	ret
