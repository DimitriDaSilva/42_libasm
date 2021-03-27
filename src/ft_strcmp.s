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
	; Get the difference between the two into the al register (lower byte of rax)
	mov		al, byte [rdi + rbx]
	sub		al, byte [rsi + rbx]

	xor		rcx, rcx	; Init to 0
	xor		r8d, r8d	; Check if end of string

	; Value that will be moved if condition met
	; Not possible to use cmove & all cmov variants with immediates
	mov		rdx, 1

	; Branchless compound if statement
	; Check if no difference between chars
	cmp		al, 0
	cmove	rcx, rdx	; Move 1 into rcx if al == 0
	; Check if end of string. No need to check rsi because previous condition
	; checks if both are equal
	cmp		byte [rdi + rbx], 0
	cmove	r8, rdx		; Move 1 into r8 if dest char is NULL
	
	and		rcx, r8		; Check if both conditions are met

	cmp		rcx, 1		;
	je		.cmp_chars
	ret
