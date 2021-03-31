		global	_ft_list_push_front
		default	rel						; Set RIP-relative addressing to default


		section	.text
;void ft_list_push_front(t_list **begin_list, void *data);
; begin_list	-> rdi
; data			-> rsi
_ft_list_push_front:
		mov rax, 1

