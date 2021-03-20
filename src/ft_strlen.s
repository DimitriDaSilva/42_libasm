; "Hello, world! in x64 assembly code on Linux"

; To compile and execute:
; nasm -felf64 hello_world.s && ld hello_world.o && ./a.out

; Assembly code is split in sections with different types
; In asm, "text" sections mean actual code instructions

section .text
	; Export the entrypoint to the ELF linker
	; It's convention that the entrypoint is _start.
	; To override the default, use ld -e _new_start
	global _ft_strlen

; "data" section used for definition of constants 
section .data
	; Store the string
	; db stands for define bytes and the 10 is the ascii value of the line feed
	msg:	db "Hello, world!", 10
	; Dynamic length of the string
	len:	equ $ - msg

section .text
; Definition of the entrypoint
_ft_strlen:
	; Write the string to the stdout
	mov		eax, 4		; system call number of the write function (cf. man 2 write)
	mov		ebx, 1		; fd arg. 1 = stdout
	mov		ecx, msg	; buf arg. What to write
	mov		edx, len	; count arg. The number of bytes to write
	int 0x80			; call kernel

	; Exit function
	mov		eax, 1		; system call number of the exit function
	mov		ebx, 0		; return value
	int 0x80			; call kernel
