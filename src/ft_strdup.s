default rel ; set RIP-relative addressing to default

extern _malloc, _ft_strlen, _ft_strcpy

global _ft_strdup

_ft_strdup:
	; Get length of string in rdi and add 1
	call	_ft_strlen
	inc		rax

	; Malloc space

	;mov		rsi, rdi
	;mov		rdi, rax
	;call	_malloc
	;mov		rdi, rax
	;call	_ft_strcpy
	ret
