default rel ; set RIP-relative addressing to default

global _ft_strlen

_ft_strlen:
	; Prologue
	push	rbx

	; Loop starts at -1 but gets incremented directly so it starts at 0
	mov		rbx, -1
	call	count_chars

	; Pass the counter value to rax
	mov		rax, rbx
	
	; Epilogue
	pop		rbx
	ret

count_chars:
	inc		rbx
	cmp		byte [rdi + rbx], 0x00
	jne		count_chars
	ret
