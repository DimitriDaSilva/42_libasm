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

		mov		rax, [rbp + 16]					; head = begin_list -> set as begin_list
		mov		rax, [rax]						; head = *head -> set as first node
		;mov		rax, [rax + next]						; Get the rax as *begin_list
		;jmp		.exit

		; Base case: if (head == NULL || head->next == NULL) return
		cmp		rax, 0							; if (head == NULL)
		jz		.exit							; if true, EXIT
		cmp		qword [rax + next], 0			; if (head->next == NULL)
		jz		.exit							; if true, EXIT

		; Put the addresses on the stack for split_list
		push	rax
		push	qword [a]
		push	qword [b]

		call	.split_list

		pop		qword [b]
		pop		qword [a]
		pop		rax
		jmp		.exit

; Splits a list in two by having two pointers parsing the list
; One slow and another twice as fast. Once the fast one reaches
; the end of the list, it means the slow one reached the middle
.split_list:
		; rbp + 32 in the stack points to rax pushed in .recursive
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
		mov		r8, [rbp + 32]					; tmp = *head
		;mov		[rbp + 24], [rbp + 32]			; 
		;mov		qword [b], [rdx + next]
		;mov		[rdx + next], 0
		ret

.exit:
		; Epilogue
		mov		rsp, rbp
		pop		rbp
		ret
