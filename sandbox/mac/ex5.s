; macOS doesn't allow absolute addressing.
; This means that all memory addresses need to be Relative to the Instruction Pointer (RIP)
; Two solutions:
; - doing "lea rsi, [rel data_name]" instead of simply "mov rsi, data_name"
; - adding "default rel" that implies that each time we use an address in a lea operation, we are talking about relative addresses
default rel ; RIP-relative addressing by default

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
	lea		rsi, [addr]					; bytes to write
	mov		rdx, len					; nb of bytes to write
	syscall
	; Exit function
	mov		rax, 0x2000001				; system call number of the exit function
	mov		rdi, 0						; return value
	syscall
