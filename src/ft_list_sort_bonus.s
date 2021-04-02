; void ft_list_sort(t_list **begin_list, int (*cmp)());

		global	_ft_list_sort
		default	rel						; Set RIP-relative addressing to default

		section	.data

struc	s_list
		data:	resq	1
				alignb	4
		next:	resq	1
				alignb	4
endstruc

		section	.bss

head:	resq	1
a:		resq	1
b:		resq	1
slow:	resq	1
fast:	resq	1

		section	.text
_ft_list_sort:
		push	rdi								; We need begin_list on the stack because .recursive needs to access it through the stack
		call	.recursive
		pop		rdi
		ret

.recursive:
		; Prologue
		push	rbp
		mov		rbp, rsp

		mov		rax, [rsp + 16]					; head = begin_list -> set as begin_list
		mov		rax, [rax]						; head = *head -> set as first node

		; Base case: if (head == NULL || head->next == NULL) return
		cmp		rax, 0							; if (head == NULL)
		jz		.exit							; if true, EXIT
		cmp		qword [rax + next], 0			; if (head->next == NULL)
		jz		.exit							; if true, EXIT

		; Put the addresses on the stack for split_list
		push	rax
		mov		r11, a
		push	r11
		mov		r11, b
		push	r11

		call	.split_list
		add		rsp, 24						; Virtually pop the 3 values of the stack, we don't need them

		; sort_list(&a, op)
		mov		r11, a
		push	r11
		;jmp		.exit

		call	.recursive
		add		rsp, 8

		; sort_list(&b, op)
		mov		r11, b
		push	r11
		call	.recursive
		add		rsp, 8


		; merge_sort(a, b, op)
		mov		r11, a
		push	r11
		mov		r11, b
		push	r11
		call	.merge_sort
		mov		[rax], r10						; *begin_list = merge_sort(a, b, op)

		jmp		.exit

; void split_list(node *head, node **first_half, node **second_half) 
; Splits a list in two by having two pointers parsing the list
; One slow and another twice as fast. Once the fast one reaches
; the end of the list, it means the slow one reached the middle
.split_list:
		; rsp + 24 in the stack points to rax pushed in .recursive
		mov		rdx, qword [rsp + 24]			; rdx will be slow pointer
		mov		rcx, qword [rdx + next]			; rcx will be fast pointer
		
.find_end_list:
		test	rcx, rcx						; Check if the fast pointer reached the end
		jz		.end_found						; If he reached, EXIT

		mov		rcx, [rcx + next]				; Move fast forward
		test	rcx, rcx						; Check if the fast pointer reached the end
		jz		.end_found						; If he reached, EXIT

		mov		rdx, [rdx + next]				; Move slow forward
		mov		rcx, [rcx + next]				; Move fast forward
		jmp		.find_end_list

.end_found:
		; Point a to 1st half of the linked list
		mov		r8, qword [rsp + 16]			; Get address of the pointer a from the stack
		mov		r11, [rsp + 24]					; r11 here serves as tmp to get the head from the stack
		mov		[r8], r11						; *a = head

		; Point b to 2nd half of the linked list
		mov		r9, qword [rsp + 8]				; Get ptr [b] from the stack
		mov		r11, [rdx + next]				; r11 here serves as tmp to get the next node's address
		mov		[r9], r11						; *b = slow->next

		; Cut off the 2 halves of the linked list
		mov		qword [r9 + next], 0			; slow->next = NULL
		ret

; node *merge_sort(node *a, node *b, int (*op)(int, int))
.merge_sort:
		ret
		mov		rax, [r9 + next]
		jmp		.exit
		

.exit:
		; Epilogue
		mov		rsp, rbp
		pop		rbp
		ret
