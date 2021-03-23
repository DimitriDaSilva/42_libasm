default rel

; GCC defines a _start for me, I just need to provide a main
global _main

; include printf from the C library
extern _printf

section .data
	msg		db "Testing %i... %s", 0x0a, 0x00
	text	db "VALID", 0x00

section .text

_main:
	; Prologue
	push	rbp
	mov		rbp, rsp
	; Setting the 2 args before calling the function
	lea		rdi, [msg]
	mov		rsi, 42
	lea		rdx, [text]
	call	_printf
	; Epilogue
	mov		rsp, rbp
	pop		rbp
	ret
