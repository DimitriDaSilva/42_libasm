; Tutorial followed: https://www.youtube.com/playlist?list=PLmxT2pVYo5LB5EzTPZGfFN0c2GDiSXgQe

global _start

section .text
_start:
	mov	rsi, 100		; set rsi to 100
	mov rdi, 42 		; return value
	mov rax, 0x2000001	; syscall (exit code)
	cmp rsi, 100		; compare rsi to 100
	jle skip			; jump if rsi less or equal to 100
	mov rdi, 13			; set ret value to 13 (shouldn't occur as we "jump" from label _start)
skip:
	syscall
