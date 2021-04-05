;int ft_list_size(t_list *begin_list)

		global	_ft_list_size
		default	rel						; Set RIP-relative addressing to default

		section	.data
struc	s_list
		data:	resq	1
				alignb	4
		next:	resq	1
				alignb	4
endstruc

		section	.text
_ft_list_size:
		xor		rcx, rcx				; Init the counter

		test	rdi, rdi				; Check if rdi is NULL
		jz		.exit					; If null, return 0

.count_nodes:
		inc		rcx

		cmp		qword [rdi + next], 0	; Check if last node
		je		.exit					; If next is null, EXIT loop

		mov		rdi, [rdi + next]		; Set curr node to the next one
		jmp		.count_nodes

.exit:
		mov		rax, rcx				; Set return value
		ret
