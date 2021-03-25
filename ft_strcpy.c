default rel ; set RIP-relative addressing to default

global _ft_strcpy

_ft_strcpy:
	; Prologue
	push	rbx

	; Loop starts at -1 but gets incremented directly so it starts at 0
	mov		rbx, -1
	call	cpy_chars

	; Epilogue
	pop		rbx
	ret
	

