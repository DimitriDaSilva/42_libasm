default rel ; set RIP-relative addressing to default

global _ft_strcmp

_ft_strcmp:
	; Prologue
	push	rbx

	; Setting return all bytes of reg to 0 because we'll be working with al
	mov		rax, 0
	; Loop starts at -1 but gets incremented directly so it starts at 0
	mov		rbx, -1
	call	cmp_chars

	; Epilogue
	pop		rbx
	ret
	
cmp_chars:
	inc		rbx

	; Get the value of src char
	mov		al, byte [rdi + rbx]
	; Get the difference between the two into the al register
	sub		al, byte [rsi + rbx]

	cmp		byte [rdi + rbx], 0x00
	je


	cmp		al, 0x00
	je		cmp_chars
	ret

