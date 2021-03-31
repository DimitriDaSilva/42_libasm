; t_list *ft_create_elem(void *data);
		global	_ft_create_elem
		extern	_malloc
		default	rel						; Set RIP-relative addressing to default

		section	.data

struc	s_list
		data:	resq	1
				alignb	4
		next:	resq	1
				alignb	4
endstruc

		section	.text
_ft_create_elem:
		push	rbp
		mov		rbp, rsp

		push	rdi
		mov		rdi, s_list_size
		call	_malloc

		pop		qword [rax + data]
		mov		qword [rax + next], 0

		mov		rsp, rbp
		pop		rbp
		ret
