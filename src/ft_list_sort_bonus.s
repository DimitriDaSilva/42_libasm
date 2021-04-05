; void ft_list_sort(t_list **begin_list, int (*cmp)())
; Merge sort implementation

		global	_ft_list_sort
		default	rel								; Set RIP-relative addressing to default

		section	.data
struc	s_list
		data:	resq	1
				alignb	4
		next:	resq	1
				alignb	4
endstruc

		section	.text
_ft_list_sort:
		; Preserving non-scratch registers to use them later
		push	rbx
		push	r12
		push	r13
		push	r14
		push	r15

		lea		rbx, [rsi]						; We'll need the rsi register to pass args to the cmp function

		; We need to put begin_list in the stack because .recursive needs to access it through the stack
		push	rdi
		call	.sort_list
		pop		rdi

		; Restoring non-scratch registers
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		rbx

		ret

; void sort_list(node **begin_list, int (*cmp)())
; Base of the recursive calls
; The logic is: split in two halves -> recusive call with each half -> merge two halves
.sort_list:
		; Prologue
		push	rbp
		mov		rbp, rsp

		mov		rax, [rsp + 16]					; head = begin_list -> set as begin_list
		mov		rax, [rax]						; head = *head -> set as first node

		; Base case: if (head == NULL || head->next == NULL) return
		cmp		rax, 0							; if (head == NULL)
		jz		.exit							; if true, EXIT
		mov		r11, [rax + next]				; r11 acts as a tmp to cmp rax + next value
		cmp		r11, 0							; if (head->next == NULL)
		jz		.exit							; if true, EXIT

		; Put the addresses on the stack for split_list
		push	rax								; The first node of the list
		push	r12								; For first_half of linked list
		push	r13								; For second_half of linked list

		; split_list(head, &a, &b) -> splits the list in two halves
		call	.split_list
		pop		r13
		pop		r12
		pop		rax

		; Set first nodes of both lists in the stack to avoid data corruption
		push	r12								; Put the node in the stack
		push	r13								; Put the node in the stack

		; sort_list(&a, op) -> RECURSIVE CALL
		lea		r12, [rsp + 8]					; Getting the address of that node in the stack
		push	r12								; Pushing that value in the stack for .recursive to read
		call	.sort_list
		add		rsp, 8							; Free r12's address from the stack

		; sort_list(&b, op) -> RECURSIVE CALL
		lea		r13, [rsp]						; Getting the address of that node in the stack
		push	r13								; Pushing that value in the stack for .recursive to read
		call	.sort_list
		add		rsp, 8							; Free r13's address from the stack

		; merge_sort(a, b, op) -> merge the two lists just formed
		call	.merge_sort						; r12 and r13 are on the stack and rbx holds the op
		add		rsp, 16							; Free r12 and r13 from the stack
		mov		rax, [rsp + 16]					; Get original begin_list from stack
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
		jz		.end_found						; If he reached end, EXIT

		mov		rcx, [rcx + next]				; Move fast forward
		test	rcx, rcx						; Check if the fast pointer reached the end
		jz		.end_found						; If he reached end, EXIT

		mov		rdx, [rdx + next]				; Move slow forward
		mov		rcx, [rcx + next]				; Move fast forward
		jmp		.find_end_list

.end_found:
		; Point a to 1st half of the linked list
		lea		r8, qword [rsp + 16]			; Get address of the pointer a from the stack
		mov		r11, [rsp + 24]					; r11 here serves as tmp to get the head from the stack
		mov		[r8], r11						; *a = head

		; Point b to 2nd half of the linked list
		lea		r9, qword [rsp + 8]				; Get ptr [b] from the stack
		mov		r11, [rdx + next]				; r11 here serves as tmp to get the next node's address
		mov		[r9], r11						; *b = slow->next

		; Cut off the 2 halves of the linked list
		mov		qword [rdx + next], 0			; slow->next = NULL
		ret

; node *merge_sort(node *a, node *b, int (*op)(int, int))
; Merge two lists based on the op function
.merge_sort:
		xor		r10, r10						; This will be our return value register

		mov		r14, qword [rsp + 16]			; Get node *a from stack
		mov		r15, qword [rsp + 8]			; Get node *b from stack

		; Two base cases: either one of node a or b is NULL
		; Base case a == NULL
		test	r14, r14						; Check if a is NULL
		cmovz	r10, r15						; If NULL, set return value as b
		test	r10, r10						; If return value was set then return
		jnz		.base_case						; If not NULL, EXIT

		; Base case b == NULL
		test	r15, r15						; Check if b is NULL
		cmovz	r10, r14						; If NULL, set return value as a
		test	r10, r10						; If return value was set then return
		jnz		.base_case						; If not NULL, EXIT

		; Comparison between data to determine the order (neg, null or pos)
		mov		rdi, [r14 + data]				; Set 1st arg of op: a->data
		mov		rsi, [r15 + data]				; Set 2st arg of op: b->data

		call	rbx								; rbx holds the address of the pointer function cmp

		cmp		rax, 0							; rax will hold the value of the cmp
		jle		.a_goes_first					; if rax is lower or equal than 0, it means that a >= b so a goes first
		jg		.b_goes_first					; if rax is greater than 0, it means that a < b so b goes first

.base_case:
		ret

.a_goes_first:
		mov		r10, r14						; Set a as the head of the result llist
		push	r10								; Put the head on the stack lest it gets overwritten

		mov		r11, [r14 + next]				; r11 acts as a tmp
		push	r11								; Set 1st arg for merge sort: a->next
		push	r15								; Set 2nd arg for merge sort: b
		call	.merge_sort
		mov		r11, r10						; r11 will act as a tmp for the return value of merge_sort
		add		rsp, 16							; We don't care about getting back the values of the args
		pop		r10								; We do need to get back the head of the result llist
		mov		[r10 + next], r11				; Set the return value from merge_sort as the next node of our result llist
		ret

.b_goes_first:
		mov		r10, r15						; Set b as the head of the result llist
		push	r10								; Put the head on the stack lest it gets overwritten

		push	r14								; Set 1st arg for merge sort: a
		mov		r11, [r15 + next]				; r11 acts as a tmp
		push	r11								; Set 2nd arg for merge sort: b->next
		call	.merge_sort
		mov		r11, r10						; r11 will act as a tmp for the return value of merge_sort
		add		rsp, 16							; We don't care about getting back the values of the args
		pop		r10								; We do need to get back the head of the result llist
		mov		[r10 + next], r11				; Set the return value from merge_sort as the next node of our result llist
		ret

.exit:
		; Epilogue
		mov		rsp, rbp
		pop		rbp
		ret
