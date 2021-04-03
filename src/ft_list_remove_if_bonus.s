;void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

		global	_ft_list_remove_if
		default	rel								; Set RIP-relative addressing to default

		section	.data

struc	s_list
		data:	resq	1
				alignb	4
		next:	resq	1
				alignb	4
endstruc

		section	.text
_ft_list_remove_if:
		ret

