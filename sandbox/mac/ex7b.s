default rel ; RIP-relative addressing by default

global _start

_start:
	; What a call does:
	; - push return location to stack, meaning:
	;	* sub rsp, 4
	; 	* mov [rsp], return_location
	; - jump to func
	; The push is useful because we need the original location to jump back
	; return_location = location of the instruction right after call
	; in this case, return_location = pointer to instruction mov rax, 0x2000001
	call	func
	mov		rax, 0x2000001	; exit syscall
	syscall

func:
	mov		rdi, 42
	; What ret does:
	; pop		rax
	; jmp		rax
	ret
