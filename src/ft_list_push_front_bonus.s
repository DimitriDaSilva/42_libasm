		default	rel						; Set RIP-relative addressing to default

		global	_ft_list_push_front

struc	s_list
	data:		resq	1
	next:		resb	s_list_size
endstruc

		section	.data

struct:
	istruc	s_list
		at	data, dq ?
		at	next, db ?
	iend

		section	.text
;void ft_list_push_front(t_list **begin_list, void *data);
; begin_list	-> rdi
; data			-> rsi
_ft_list_push_front:
		lea		rdx, [rdi]

