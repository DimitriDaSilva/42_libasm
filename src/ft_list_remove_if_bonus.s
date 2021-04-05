;void	ft_list_remove_if(t_list **begin_list,
;							void *data_ref,
;							int (*cmp)(),
;							void (*free_fct)(void *));

		global	_ft_list_remove_if
		extern _free
		default	rel						; Set RIP-relative addressing to default

		section	.data

struc	s_list
		data:	resq	1
				alignb	4
		next:	resq	1
				alignb	4
endstruc

		section	.text
_ft_list_remove_if:
		; Prologue
		push	rbp
		mov		rbp, rsp

		; Preversing non-scratch registers
		push	r12
		push	r13
		push	r14
		push	r15

		; Save args in non-scratch registers to avoid data corruption by _free
		mov		r12, rdi				; begin_list
		mov		r13, rsi				; Store the data_ref
		mov		r14, rdx				; Store the cmp function
		mov		r15, rcx				; Store the free function

		test	r12, r12				; Check if begin_list is NULL
		jz		.exit					; If null, return
		mov		r9, [r12]				; Set r9 as the first node

.parse_llist:
		; Check if head is NULL
		test	r9, r9
		jz		.exit

		; Compare data
		mov		rdi, qword [r9 + data]	; Set 1st arg as node->data
		mov		rsi, r13				; Set 2nd arg as data_ref
		call	r14						; r14 holds the address of the cmp function
		test	rax, rax
		jnz		.continue				; If ret != 0, continue parsing

		; Else remove node
		; 1st step: free data
		mov		rdi, qword [r9 + data]	; 1st arg is the node->data
		call	r15						; r15 holds the address of the free_fct

		; 2st step: change the value the previous's node->next
		mov		r11, [r9 + next]		; r11 acts as tmp for r9->next value
		mov		[r12], r11				; previous node's next value = head->next;

		; 3rd step: free node
		mov		rdi, r9					; 1st arg is node
		call	_free

		; Check if there are still nodes to check
		cmp		qword [r12], 0			; Check if NULL
		je		.exit

		mov		r9, [r12]				; Set r9 as the node pointed by r12
		jmp		.parse_llist

.continue:
		lea		r12, qword [r9 + next]	; Make a copy of the address of node->next just checked
		mov		r9, [r12]				; Set r9 to the next node
		jmp		.parse_llist

.exit:
		; Restoring non-scratch registers
		pop		r15
		pop		r14
		pop		r13
		pop		r12

		; Epilogue
		mov		rsp, rbp
		pop		rbp
		ret
