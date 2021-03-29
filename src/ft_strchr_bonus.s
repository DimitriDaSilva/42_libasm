		default	rel						; Set RIP-relative addressing to default

		global	_ft_strchr

_ft_strchr:
		mov		rax, rdi

.loop:
		cmp		byte [rax], 0
		je		.is_null

		cmp		byte [rax], sil
		je		.exit

		inc		rax
		jmp		.loop

.is_null:
		xor		rax, rax

.exit:
		ret
