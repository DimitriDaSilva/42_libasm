; t_list *ft_create_elem(void *data);
		global	_ft_create_elem
		extern	_malloc
		default	rel						; Set RIP-relative addressing to default

		section	.data

struc	s_list
		data:	resq	1
		next:	resq	1
endstruc

		section	.bss
llist:	resq	1	

		section	.text
_ft_create_elem:
		push	rbp
		mov		rbp, rsp

		lea		rdx, [rdi]
		mov		rdi, s_list_size
		call	_malloc

		mov		qword [rax + data], rdx
		mov		qword [rax + next], 0

		mov		rsp, rbp
		pop		rbp
		ret
