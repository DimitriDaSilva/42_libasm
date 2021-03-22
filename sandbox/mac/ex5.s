; macOS doesn't allow absolute addressing unless we add this setting
default rel

global _start

section .data
	addr 	db "yellow", 0x0a		; pointer to a memory address pointer to the string "yellow". Here addr is the name of the var
	len 	equ $ - addr

section .text
_start:
	; Alter the string at runtime
	; [ptr] means dereferencing an address
	; byte 'H' means we want the byte representation of 'H' (i.e. its ascii value in binary)
	mov		[addr], byte 'H'			; Change first letter of string
	mov		[addr + len - 2], byte '!'	; Change last letter of string (we need to account for the line feed)
	; Write the string to the stdout
	mov		rax, 0x2000004				; sys_write syscall
	mov		rdi, 1						; write to stdout
	mov		rsi, addr					; bytes to write
	mov		rdx, len					; nb of bytes to write
	syscall
	; Exit function
	mov		rax, 0x2000001				; system call number of the exit function
	mov		rdi, 0						; return value
	syscall
