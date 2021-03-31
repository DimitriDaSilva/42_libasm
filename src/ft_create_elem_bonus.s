; t_list *ft_create_elem(void *data);
		global	_ft_create_elem
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

