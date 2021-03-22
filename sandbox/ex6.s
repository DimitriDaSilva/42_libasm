global _start

_start:
	; Allocate space and store values in it
	sub	esp, 4				; malloc 4 bytes in the stack
	mov	[esp], byte 'H'		; put letter H at the beginning of the allocated space
	mov [esp + 1], byte 'e'
	mov [esp + 2], byte 'y'
	mov [esp + 3], byte '!'
	; Write the string just stored
	mov	eax, 4				; syscall for write
	mov	ebx, 1				; write to stdout
	mov	ecx, esp			; bytes to write
	mov	edx, 4				; nb of bytes to write
	int	0x80				; syscall
	; Exit function
	mov eax, 1				; syscall exit code
	mov	ebx, 0				; return value
	int	0x80				; syscall
