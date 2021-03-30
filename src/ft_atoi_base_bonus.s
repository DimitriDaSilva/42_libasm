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

.jump_spaces:
		xor		r8, r8
		xor		r9, r9
		xor		r10, r10

		mov		r11, 1				; Value if true

		cmp		byte [rbx], ' '
		cmove	r8, r11				; If space, set to true

		cmp		byte [rbx], 9
		cmovge	r9, r11				; If greater or equal to 9 (i.e. tab ascii value), set to true

		cmp		byte [rbx], 13
		cmovle	r10, r11			; If less or equal to 13 (i.e. carriage return), set to true

		and		r9, r10				; Check if between 9 and 13
		or		r8, r9				; Check if between 9 and 13 OR a space

		jz		.jump_signs			; If r8 is equal to zero, go to next step

		inc		rbx
		jmp		.jump_spaces		; If r8 is not equal to 0, continue loop

.jump_signs:
		xor		r8, r8
		xor		r9, r9

		mov		r10, 1				; Value if true

		cmp		byte [rbx], '+'
		cmove	r8, r10				; If '+', set to true

		cmp		byte [rbx], '-'
		cmove	r9, r10				; If '-', set to true

		or		r8, r9				; Check if '+' or '-'

		jz		.convert_to_int		; If r8 == 0, go to next step

		or		r9, 1				; Check if there is a '-'
		jnz		.change_sign		; If not zero mean true so change the sign

		inc		rbx					; Increment to go to next char
		jmp		.jump_signs			; Continue looping

.change_sign:
		neg		r11					; abs(). r11 is a value set to 1 in jump_spaces

		inc		rbx					; Increment to go to next char
		jmp		.jump_signs			; Continue looping

.convert_to_int:
		xor		rsi, rsi			; Store the char found in string to convert 

		lea		rdi, [rdx]			; Move base to rdi to pass it to strlen
		call	_ft_strlen			; Get length of base
		mov		r9, rax				; Store the length of the base in r8

		xor		rax, rax

.parse_nb:
		push	rax					; Save rax because we are calling strchr next
		mov		sil, byte [rbx]		; Get char to convert
		call	_ft_strchr			; Get the address in base of the char to convert
		cmp		rax, 0
		je		.multiply_by_sign	; If addr == NULL, it means we finished the parsing

		lea		r10, [rdi]			; Copy base
		sub		r10, rax			; Substract the addr of 1st char by addr received
		call	.ft_abs

		pop		rax					; Get back the curr value of the nb we are converting

		mul		r9					; rax *= base_size
		add		rax, r10			; Add to the curr number the index of the new digit

		inc		rbx
		jmp		.parse_nb

.multiply_by_sign:
		pop		rax
		mul		r11					; rax *= r11

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

; ft_abs(r10)
.ft_abs:
		mov		r8, r10					; Copy r10 into r10
		neg		r10						; r10 = -r10
		cmovl	r10, r8					; if r10 < r8, then it means r10 became negative
		ret								; so we should revert to old value

