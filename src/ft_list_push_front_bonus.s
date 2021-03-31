;void ft_list_push_front(t_list **begin_list, void *data);

		global	_ft_list_push_front
		extern	_ft_create_elem, _free
		default	rel						; Set RIP-relative addressing to default

		section	.data

struc	s_list
		data:	resq	1
				alignb	4
		next:	resq	1
				alignb	4
endstruc

		section	.text
_ft_list_push_front:
		push	rdi
		;mov		rdx, rdi				; Save begin_list (pointer of pointer)
		;mov		r8, [rdx]
		;mov		r8, [rdx]				; Save first node (only the pointer)
		;lea		rcx, [rsi]				; Save data

		lea		rdi, [rsi]				; Set data as 1st arg for ft_create_elem
		call	_ft_create_elem
		pop		rdi

		mov		rdx, [rdi]
		mov		[rax + next], rdx
		mov		[rdi], rax


		ret

