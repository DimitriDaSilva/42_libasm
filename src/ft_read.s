; ssize_t	ft_read(int fd, void *buf, size_t count)

	global	_ft_read
	extern	___error
	default	rel					; Set RIP-relative addressing to default

_ft_read:
	; Read syscall. Args are set on rdi, rsi and rdx (C calling convetion)
	mov		rax, 0x2000003		; Set sys_read handle
	syscall						; Exec the sys_read call. If success, rax == nb of bytes read

	; Checking for errors in the syscall
	jc		.error				; if CF == 1 jmp to .error (CF flag set to 1 if error)
	ret

.error:
	push	rax					; Saving the return value of the syscall
	call	___error			; ___error will return an int* pointing to errno
	pop		qword [rax]			; Changing the errno to the value returned by the sys_read
	mov		rax, -1				; Setting the return value of ft_read
	ret
