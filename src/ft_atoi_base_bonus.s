		default	rel						; Set RIP-relative addressing to default

		extern	_ft_strlen, _ft_strchr

		global	_ft_atoi_base

_ft_atoi_base:
		push		rbx

.is_base_valid:
		mov			rax, 0				; Default value of ret value is FALSE

		cmp			rsi, 0				; Check if NULL pointer
		je			.exit				; If true, exit with ret value 0

		cmp			byte [rsi], 0		; Check if base is empty
		je			.exit				; If true, exit with ret value 0

		cmp			byte [rsi + 1], 0	; Check if base is one char long
		je			.exit				; If true, exit with ret value 0

		push		rdi					; Save str
		mov			rdi, rsi			; Set base as 1st arg for strchr
		push		rsi					; Save base
		mov			rsi, '-'			; Set '-' as 2nd arg for strch
		call		_ft_strchr
		pop			rsi
		pop			rdi
		cmp			rax, 0				; If 0, means chars where not found and base is valid
		jne			.exit				; If not 0, base not valid

.atoi:
		mov			rax, 1

.exit:
		pop			rbx
		ret		

