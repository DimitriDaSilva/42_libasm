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
	mov	eax, 1		; set eax to 1
	mov	ebx, 42		; set ebx to 1
	sub	ebx, 29		; substract 13 to 42, ebx is now 13
	add	ebx, 13		; add 7 to 13, ebx is now 20
	; int for interrupt
	; processor transfers control to a specified interrupt handler
	; in this case, the interrupt handler is system call (code 0x80)
	; the system call that it makes is determined by the values prev set:
	; - eax registery = which system call we are making (here exit because of code 1) 
	; - ebx registery = exit status (or return value) for the program
	int 0x80