default rel ; set RIP-relative addressing to default

extern malloc, _ft_strlen, _ft_strcpy

global _ft_strdup

_ft_strdup:
	; Store pointer of string into rsi to use rdi later
	mov		rsi, rdi

	; Get length of string in rdi and add 1
	call	_ft_strlen
	inc		rax

	; Malloc space
	mov		rdi, rax
	call	malloc

	call	_ft_strcpy
	ret
