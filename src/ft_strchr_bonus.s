		default	rel						; Set RIP-relative addressing to default

		extern	_ft_strlen

		global	_ft_strchr

_ft_strchr:
		mov		rax, rdi

		cmp		byte rsi, 0
		call	_ft_strlen

.check_if_null:
		cmp		byte [rdi], 0
		jz		.is_null

.exit:
		ret
