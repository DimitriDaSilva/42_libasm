default rel ; set RIP-relative addressing to default

global _ft_strcpy

_ft_strcpy:
	; Prologue
	push	rbx

	; Loop starts at -1 but gets incremented directly so it starts at 0
	mov		rbx, -1
	call	cpy_chars

	; Set return value reg to the dest pointer
	mov		rax, rdi

	; Epilogue
	pop		rbx
	ret
	
cpy_chars:
	inc		rbx
	mov		al, [rsi + rbx]
	mov		[rdi + rbx], al
	cmp		byte [rdi + rbx], 0x00
	jne		cpy_chars
	ret
