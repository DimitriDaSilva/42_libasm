; Tutorial followed: https://www.youtube.com/playlist?list=PLmxT2pVYo5LB5EzTPZGfFN0c2GDiSXgQe

global _start

section .text
_start:
	mov	rdi, 1			; set ebx to 1
	mov rcx, 4			; nb of iterations
label:
	add rdi, rdi		; ebx += ebx
	dec	rcx				; ecx -= 1
	cmp	rcx, 0			; cmp ecx to 0
	jg	label			; rexecute label if ecx is greater than 0
	mov	rax, 0x2000001	; syscall exit code
	syscall
