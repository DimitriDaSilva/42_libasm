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
		; Prologue
		push	rbp
		mov		rbp, rsp

		mov		qword [head], rdi

		; Base case: if (head == NULL || head->next == NULL)
		mov		r10, 1							; reg with 1 to set true value
		cmp		qword [head], 0
		cmovz	r8, r10							; if head == NULL, set to true
		cmp		qword [head + next], 0
		cmovz	r9, r10							; if head == NULL, set to true

		or		r8, r9
		jnz		.exit

		push	qword [head]
		push	qword [a]
		push	qword [b]

		call	.split_list
		ret

; Splits a list in two by having two pointers parsing the list
; One slow and another twice as fast. Once the fast one reaches
; the end of the list, it means the slow one reached the middle
.split_list:
		mov		rdx, qword [rbp + 32]				; rdx will be slow pointer
		mov		rcx, qword [rbp + 32 + next]		; rcx will be fast pointer
		
.loop:
		test	rcx, rcx						; Check if the fast pointer reached the end
		jz		.split							; If he reached, the end ==> split

		mov		rcx, [rcx + next]				; Move fast forward
		test	rcx, rcx						; Check if the fast pointer reached the end
		jz		.split							; If he reached, the end ==> split

		mov		rdx, [rdx + next]				; Move slow forward
		mov		rcx, [rcx + next]				; Move fast forward
		jmp		.loop

.split:
		mov		qword [rbp + 24], rdx					; 
		mov		qword [b], [rdx + next]
		mov		[rdx + next], 0
		ret

.exit:
		; Epilogue
		mov		rsp, rbp
		pop		rbp
		ret
