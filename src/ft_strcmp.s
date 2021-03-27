default rel ; set RIP-relative addressing to default

global _ft_strcmp

_ft_strcmp:
	; Prologue
	push	rbx

	; Setting return all bytes of reg to 0 because we'll be working with al
	xor		rax, rax

	; Loop starts at -1 but gets incremented directly so it starts at 0
	mov		rbx, -1
	call	.cmp_chars

	; Epilogue
	pop		rbx
	ret
	
.cmp_chars:
	inc		rbx
	xor		rax, rax	; set rax to 0 before each loop
	xor		r10, r10
	xor		r11, r11
	; Get the difference between the two into the al register (lower byte of rax)
	mov		r10b, byte [rdi + rbx]
	mov		r11b, byte [rsi + rbx]

	mov		rax, r10
	sub		rax, r11

	xor		rcx, rcx	; Init to 0
	xor		r8, r8		; Init to 0

	; Value that will be moved if condition met
	; Not possible to use cmove & all cmov variants with immediates
	mov		rdx, 1

	; Branchless compound if statement
	; Check if no difference between chars
	and		rax, rax
	cmovz	rcx, rdx	; Move 1 into rcx if al == 0
	; Check if end of string. No need to check rsi because previous condition
	; checks if both are equal
	cmp		byte [rdi + rbx], 0
	cmovnz	r8, rdx		; Move 1 into r8 if dest char is not NULL
	
	and		rcx, r8		; Check if both conditions are met

	cmp		rcx, 1
	je		.cmp_chars
	ret
