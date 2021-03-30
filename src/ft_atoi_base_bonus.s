		default	rel						; Set RIP-relative addressing to default

		extern	_ft_strlen, _ft_strchr

		global	_ft_atoi_base

_ft_atoi_base:
		push	rbx

.is_base_valid:
		mov		rax, 0				; Default value of ret value is FALSE

		cmp		rsi, 0				; Check if NULL pointer
		je		.error				; If true, exit with ret value 0

		cmp		byte [rsi], 0		; Check if base is empty
		je		.error				; If true, exit with ret value 0

		cmp		byte [rsi + 1], 0	; Check if base is one char long
		je		.error				; If true, exit with ret value 0

		lea		rbx, [rdi]			; Save str to use rdi
		mov		rdi, rsi			; Set base as 1st arg for strchr

		mov		rsi, '-'			; Set '-' as 2nd arg for strch
		call	_ft_strchr
		cmp		rax, 0				; If 0, means chars where not found and base is valid
		jne		.error				; If not 0, base not valid

		mov		rsi, '+'			; Set '+' as 2nd arg for strch
		call	_ft_strchr
		cmp		rax, 0				; If 0, means chars where not found and base is valid
		jne		.error				; If not 0, base not valid

		mov		rsi, ' '			; Set ' ' as 2nd arg for strch
		call	_ft_strchr
		cmp		rax, 0				; If 0, means chars where not found and base is valid
		jne		.error				; If not 0, base not valid

		lea		rdx, [rdi]			; Saving base in rdx so that has_duplicates can use rsi
		mov		rcx, -1				; Start loop at -1 and inc as 1st instruction
		call	.has_duplicates		; 1 if has duplicates, 0 if not
		cmp		rax, 1
		je		.error				; If has duplicates, base not valid

.find_beginning:
		xor		r8, r8
		xor		r9, r9
		xor		r10, r10

		mov		r11, 1				; Value if true

		cmp		byte [rbx], ' '
		cmove	r8, r11

		cmp		byte [rbx], 9
		cmovge	r8, r11

		cmp		byte [rbx], 13
		cmovge	r8, r11


		jne		.convert_to_dec


.convert_to_dec:

.exit:
		pop		rbx
		ret

.error:
		xor		rax, rax
		jmp		.exit

.has_duplicates:
		inc		rcx

		cmp		byte [rdx + rcx + 1], 0	; Check not last non-NULL char of base
		je		.no_duplicates			; If last non-NULL char means no duplicates found

		lea		rdi, [rdx + rcx + 1]	; 1st arg: curr position + 1
		mov		rsi, [rdx + rcx]		; 2nd arg: curr character
		call	_ft_strchr				; Ret 0 if char not found, ret address if found
		cmp		rax, 0
		je		.has_duplicates			; If 0, no char found, we continue to search

.duplicate_found:
		mov		rax, 1					; Set ret to 1
		ret

.no_duplicates:
		mov		rax, 0					; Set ret to 0
		ret
