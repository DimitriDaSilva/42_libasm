; Tutorial followed: https://www.youtube.com/playlist?list=PLmxT2pVYo5LB5EzTPZGfFN0c2GDiSXgQe

global _start

section .text
_start:
	mov	ebx, 1	; set ebx to 1
	mov ecx, 4	; nb of iterations
label:
	add ebx, ebx	; ebx += ebx
	dec	ecx			; ecx -= 1
	cmp	ecx, 0		; cmp ecx to 0
	jg	label		; rexecute label if ecx is greater than 0
	mov	eax, 1		; syscall exit code
	int 0x80		; syscall