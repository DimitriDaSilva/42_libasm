		default	rel						; Set RIP-relative addressing to default

		global	_ft_strchr

_ft_strchr:
		mov		rax, rdi

		cmp		byte rsi,

.check_if_null:
		cmp		byte [rdi], 0
		jz		.is_null


