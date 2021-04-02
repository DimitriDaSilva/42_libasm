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
		; need to pop here
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
		;mov		qword [b], [rdx + next]
		;mov		[rdx + next], 0
		ret

.exit:
		; Epilogue
		mov		rsp, rbp
		pop		rbp
		ret
