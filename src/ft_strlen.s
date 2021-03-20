section.text:
	global _ft_strlen

_ft_strlen:
	mov rax, 0x0 ; count set to 0 - rax is returned value
	_start_loop:
		cmp byte [rdi + rax], 0x0 ; compare rdi + rax char to \0
		jz _end_loop ; if compare true then go to flag _end_loop
		inc rax	; increment count
		jmp _start_loop ; restart loop
	_end_loop:
	ret
