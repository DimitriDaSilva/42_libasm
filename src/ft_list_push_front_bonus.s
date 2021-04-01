;void ft_list_push_front(t_list **begin_list, void *data);

		global	_ft_list_push_front
		extern	_ft_create_elem
		default	rel					; Set RIP-relative addressing to default

		section	.data

struc	s_list
		data:	resq	1
				alignb	4
		next:	resq	1
				alignb	4
endstruc

		section	.text
_ft_list_push_front:
		; Prologue
		push	rbp
		mov		rbp, rsp

		push	rdi					; Save begin_list

		lea		rdi, [rsi]			; Set data as 1st arg for ft_create_elem
		call	_ft_create_elem
		pop		rdi					; Restore begin_list

		mov		rdx, [rdi]			; Copy the value of *begin_list
		mov		[rax + next], rdx	; Set value of next to the old head. rdx == NULL if no node in list
		mov		[rdi], rax			; Set the new head at the beginning of the list

		; Epilogue
		mov		rsp, rbp
		pop		rbp
		ret
