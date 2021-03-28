	default	rel				; Set RIP-relative addressing to default

	global _ft_strlen

_ft_strlen:
	mov		rcx, -1			; Inc at the start of the loop
	call	.count_chars	; Start the loop to count chars

	mov		rax, rcx		; Set the return value to the counter
	
	ret

.count_chars:
	inc		rcx				; rcx is the memory offset of the string
	cmp		byte [rdi + rcx], 0x00
	jne		.count_chars	; If not equal to NULL, loop
	ret						; If equal to NULL, go back to ft_strlen
