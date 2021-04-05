; t_list *ft_create_elem(void *data)

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

		push	rdi						; Save the data
		mov		rdi, s_list_size		; Set size of struct as first arg for malloc
		call	_malloc					; Ret value in rax

		pop		qword [rax + data]		; Get value of rdi in struct
		mov		qword [rax + next], 0	; Set next as NULL

		mov		rsp, rbp
		pop		rbp
		ret
