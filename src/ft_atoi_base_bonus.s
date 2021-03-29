		default	rel						; Set RIP-relative addressing to default

		extern	_ft_strlen

		global	_ft_atoi_base

_ft_atoi_base:
		push		rbx

.is_base_valid:
		mov			rax, 0				; Default value of ret value is FALSE

		cmp			rsi, 0				; Check if NULL pointer
		je			.exit				; If true, exit with ret value 0

		cmp			byte [rsi], 0		; Check if base is empty
		je			.exit				; If true, exit with ret value 0

		cmp			byte [rdi + 1], 0	; Check if base is one char long
		je			.exit				; If true, exit with ret value 0

.exit:
		pop			rbx
		ret		

