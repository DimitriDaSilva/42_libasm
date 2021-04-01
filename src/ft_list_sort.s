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
		;mov		r8, [rdi]				; Stores begin_list
		mov		r9, rsi					; Stores cmp function

		mov		rdi, [rdi]				; Set first node as 1st arg for list_size
		call	_ft_list_size			; rax now has the size of the list
		sub		rax, 1					; size - 1

		xor		rcx, rcx				; Increment i - outloop
		
.outer_loop:
		cmp		rax, rcx
		je		.exit
		xor		rdx, rdx				; Increment j - innerloop
		
.inner_loop:
		mov		rdi, [rdi + data]		; Set rdi as curr data
		mov		r11, [rdi + next]		; Set r11 as next
		mov		rsi, [r11 + data]		; Set rsi as next data
		call	r9						; Call int (*cmp)
		cmp		rax, 0					; rax can
		jl		.continue


.continue:
		mov		r10, rax				; r10 = size
		sub		r10, rcx				; r10 -= i
		cmp		rdx, r10				; j < size - i - 1
		je		.inner_loop_done		; if (j == size - i - 1) ==> exit loop

		inc		rdx
		jmp		.inner_loop

.inner_loop_done:
		inc		rcx
		jmp		.outer_loop

.exit:
		ret

