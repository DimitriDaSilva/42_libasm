;void	ft_list_remove_if(t_list **begin_list,
;							void *data_ref,
;							int (*cmp)(),
;							void (*free_fct)(void *));

		global	_ft_list_remove_if
		extern _free
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
		; Prologue
		push	rbp
		mov		rbp, rsp

		; Save begin_list to other scratch registers to free up rdi for the function calls
		mov		r8, rdi					; begin_list

		test	r8, r8					; Check if being_list is NULL
		jz		.exit					; If null, return 0
		mov		r9, [r8]				; Set r9 as the first node

.check_first_node:
		; Check if head is NULL
		test	r9, r9					
		jz		.exit

		; Compare data. rsi already holds the pointer to the data ref (2nd arg)
		mov		rdi, qword [r9 + data]	; Set 1st arg for cmp
		push	rdi						; Push rdi on the stack to prevent data corruption
		call	rdx						; rdx holds the address of the cmp function
		test	rax, rax				
		jnz		.continue				; If ret == 0, remove from list

		; Else remove node
		; 1st step: free data
		lea		rdi, [rsp]				; 1st arg is the pointer to the data that was pushed
		call	rcx						; rcx holds the address of the free_fct

		; 2st step: change the value of the begin of the list
		mov		r11, [r9 + next]		; r11 acts as tmp for r9->next value
		mov		[r8], r11				; *begin_list = head->next;
		push	r11						; Push head->next to avoid r8 being overwritten by free

		; 3rd step: free node
		mov		rdi, r9
		call	_free

		; Prepare to continue
		pop		r8						; Get head->next from the stack
		test	r8, r8					; Check if NULL
		jz		.exit

		mov		r9, r8
		jmp		.continue

.parse_llist:
		; Check if head is NULL
		test	r9, r9					
		jz		.exit

		; Compare data. rsi already holds the pointer to the data ref (2nd arg)
		mov		rdi, qword [r9 + data]	; Set 1st arg for cmp
		push	rdi						; Push rdi on the stack to prevent data corruption
		call	rdx						; rdx holds the address of the cmp function
		test	rax, rax				
		jnz		.continue				; If ret == 0, remove from list

		; Else remove node
		; 1st step: free data
		lea		rdi, [rsp]				; 1st arg is the pointer to the data that was pushed
		call	rcx						; rcx holds the address of the free_fct

		; 2st step: change the value the previous's node->next
		mov		r11, [r9 + next]		; r11 acts as tmp for r9->next value
		mov		[r8], r11				; *begin_list = head->next;

		; 3rd step: free node
		mov		rdi, r9
		call	_free

.continue:
		add		rsp, 8					; Free the address of data from the stack
		lea		r8, qword [r9 + next]	; Make a copy of the address of node->next just checked
		mov		r9, r8					; Set r9 to the next node
		jmp		.parse_llist

.exit:
		mov		rsp, rbp
		pop		rbp
		ret

		; -- DEBUG --
		mov		rax, 7
		jmp		.exit
		; -- DEBUG --
