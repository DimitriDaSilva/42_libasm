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

		section	.text
_ft_list_sort:
		; We are going to need rdi and rsi to pass args to cmp
		mov		r8, rdi					; Stores begin_list
		mov		r9, rsi					; Stores cmp function

		mov		rdi, [rdi]				; Set first node as 1st arg for list_size
		call	_ft_list_size			; rax now has the size of the list
		sub		rax, 1
		xor		rcx, rcx				; Increment i - outloop
		
.outer_loop:
		cmp		rax, rcx
		je		.exit
		xor		rdx, rdx				; Increment j - innerloop
		
.inner_loop:
		; Do stuff here
		
		; j < size - i - 1
		mov		r10, rax
		sub		r10, rcx
		cmp		rdx, r10
		je		.inner_loop_done

		inc		rdx
		jmp		.inner_loop

.inner_loop_done:
		inc		rcx
		jmp		.outer_loop

.exit:
		ret

