		default	rel				; Set RIP-relative addressing to default

		extern	_ft_strlen, _ft_strcpy

		global	_ft_atoi_base

_ft_atoi_base:
		push		rdi
		mov			rdi, rsi
		call		.is_base_valid
		pop			rdi
		ret

.is_base_valid:
		cmp			rdi, 0
		jz			.error
		mov			rax, 1
		ret

.error:
		mov			rax, 0
		pop			rip
		ret
	
