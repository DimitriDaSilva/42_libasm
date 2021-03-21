; Tutorial followed: https://www.youtube.com/playlist?list=PLmxT2pVYo5LB5EzTPZGfFN0c2GDiSXgQe

global _start

section .text
_start:
	mov ebx, 42 	; return value
	mov eax, 1		; syscall (exit code)
	jmp skip		; jump to skip label
	mov ebx, 13		; set ret value to 13 (shouldn't occur as we "jump" from label _start)
skip:
	int 0x80		; syscall exit