		default	rel						; Set RIP-relative addressing to default

		extern	_ft_strlen

		global	_ft_atoi_base

_ft_atoi_base:
		push		rdi
		mov			rdi, rsi
		call		.is_base_valid
		pop			rdi
		ret

.is_base_valid:
		mov			r8, 0				; Value that will be conditionally moved if error
		mov			rax, 1				; Default value of ret value is TRUE

		cmp			rdi, 0				; Check if NULL pointer
		cmove		rax, r8				; If true, set to 0

		cmp			byte [rdi], 0		; Check if base is empty
		cmove		rax, r8				; If true, set to 0

		cmp			byte [rdi + 1], 0	; Check if base is one char long
		cmove		rax, r8				; If true, set to 0

		ret

