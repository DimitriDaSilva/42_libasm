; Tutorial followed: https://www.youtube.com/playlist?list=PLmxT2pVYo5LB5EzTPZGfFN0c2GDiSXgQe

; To compile and execute on Linux:
; nasm -f elf64 ex1.s && ld ex1.o && ./a.out
; For Mac, replace the flag "-f elf64" by "-f macho64"

; Export the entrypoint to the ELF linker
; It's convention that the entrypoint is _start.
; To override the default, use ld -e _new_start
global _start
; Definition of the entrypoint
; it's a calling convention to have the entrypoint start with an underscore
_start:
	mov	rax, 0x2000001	; set eax to 1
	mov	rdi, 42			; set ebx to 42
	sub rdi, 13
	syscall
