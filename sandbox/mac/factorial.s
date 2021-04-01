
		global	_start
		default	rel					; Set RIP-relative addressing to default

_start:
		push	3
		call	.factorial
		mov		rdi, rax
		mov		rax, 0x2000001
		syscall

.factorial:
		push	rbp
		mov		rbp, rsp

		mov		rax, [rbp + 16]

		cmp		rax, 1
		je		.end

		sub		rax, 1
		push	rax
		call	.factorial
		mov		rdi, [rbp + 16]

		mul		rdi

.end:
		mov		rsp, rbp
		pop		rbp
		ret
