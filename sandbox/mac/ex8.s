default rel ; RIP-relative addressing by default

global _start

_start:
	call	func
	mov		rax, 0x2000001
	mov		rdi, 0
	syscall

func:
	; These next 3 lines of code are a common pattern in ASM and are known as the prologue of the function
	; because they are meant to ready the function so that it doesn't mess with other functions
	; In case rbp is already used somewhere else, we save the old value of rbp into the stack
	; Otherwise the "mov rbp, rsp" instruction would overwrite it and we would lose it
	push	rbp
	; Save initial position of the Stack Pointer (SP)
	mov		rbp, rsp
	; Malloc 2 bytes
	sub		rsp, 2
	; Write into the stack "Hi"
	mov		[rsp], byte 'H'
	mov		[rsp + 1], byte 'i'
	; Write to stdout "Hi"
	mov		rax, 0x2000004
	mov		rdi, 1
	lea		rsi, [rsp]
	mov		rdx, 2
	syscall
	; These 3 next lines of code are known as the epilogue
	; Free memory by changing the SP back to its initial value
	mov		rsp, rbp
	; Fetch the old value of rbp and put it back in rbp
	pop		rbp
	ret
