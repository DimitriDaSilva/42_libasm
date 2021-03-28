	default	rel						; Set RIP-relative addressing to default

	global	_ft_strcmp

_ft_strcmp:
	mov		rcx, -1					; Inc at the start of the loop
	call	.cmp_chars				; Start the loop to cmp chars

	ret								; The value rax contains the ascii difference
	
.cmp_chars:
	inc		rcx						; rcx is the memory offset of the string

	xor		r8, r8					; Set to 0
	xor		r9, r9					; Set to 0
	xor		r10, r10				; Set to 0
	xor		r11, r11				; Set to 0

	mov		r8b, byte [rdi + rcx]	; Store dest char
	mov		r9b, byte [rsi + rcx]	; Store src char

	mov		rax, r8					; Store dest char
	sub		rax, r9					; Do diff between dest and src. If value < 0, bigger than 1 byte

	mov		rdx, 1					; Value that will be moved if condition met

	; Branchless compound if statement
	; 1st condition: no difference between chars
	and		rax, rax				; NOP instruction to set flags
	cmovz	r10, rdx				; Move 1 into r10 if rax == 0
	; 2nd condition: is not end of string
	cmp		r8d, 0					; Check if dest char is NULL
	cmovnz	r11, rdx				; Move 1 into r11 if dest char is not NULL
	
	and		r11, r10				; AND both condition
	cmp		r11, 1					; If r11 == 1, means that both condition are met
	je		.cmp_chars				; If both condition are met, continue looping
	ret								; If not, means we found a difference or end of string
