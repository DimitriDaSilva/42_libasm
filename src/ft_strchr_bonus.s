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

.ft_strchr:
		xor			r8, r8
		xor			r9, r9
		mov			r10, 1

		cmp			byte [rsi + rcx], 0x00
		cmovne		r8, r10

		cmp			r8, 0
		cmove		r11, 0

		cmp			byte [rsi + rcx], dl
		cmove		r9, r10

		jne			.ft_strchr
		
