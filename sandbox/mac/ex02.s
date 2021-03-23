; Tutorial followed: https://www.youtube.com/playlist?list=PLmxT2pVYo5LB5EzTPZGfFN0c2GDiSXgQe
; "Hello, world! in x64 assembly code on Linux"

global _start

; Assembly code is split in sections with different types
; "data" sections is exclusively reserved to setting values
section .data
	; Store the string
	; db stands for define bytes and the 0a (i.e. 10) is the ascii value of the line feed
	msg	db "Hello, world!", 0x0a
	; Dynamic length of the string
	len equ $ - msg

; "text" sections mean actual code instructions
section .text
_start:
	; Write the string to the stdout
	mov		rax, 0x2000004	; system call number of the write function (cf. man 2 write)
	mov		rdi, 1			; fd arg. 1 = stdout
	mov		rsi, msg		; buf arg. What to write
	mov		rdx, len		; count arg. The number of bytes to write
	syscall
	; Exit function
	mov		rax, 0x2000001	; system call number of the exit function
	mov		rdi, 0			; return value
	syscall
