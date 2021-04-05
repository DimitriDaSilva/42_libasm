; char 	*ft_strcpy(char *restrict dest, const char *src)

	global	_ft_strcpy
	default	rel					; Set RIP-relative addressing to default

_ft_strcpy:
	mov		rcx, -1				; Inc at the start of the loop
	call	.cpy_chars			; Start the loop to cpy chars

	mov		rax, rdi			; Set the return value to the pointer
	
	ret

.cpy_chars:
	inc		rcx					; rcx is the memory offset of the string

	mov		al, [rsi + rcx]		; Store src char in a the byte size reg al
	mov		[rdi + rcx], al		; Write al to dest

	cmp		al, 0x00			; Check if char wrote is NULL terminator
	jne		.cpy_chars			; If not NULL continue looping

	ret							; If NULL; go back to ft_strcpy
