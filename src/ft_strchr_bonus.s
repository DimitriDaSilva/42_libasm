		default	rel						; Set RIP-relative addressing to default

		global	_ft_strchr

; char *ft_strchr(char *str, char to_find)
; str		->	rdi
; to_find	->	rsi
; ret		->	rax
_ft_strchr:
		mov		rax, rdi				; Set ret value reg to the beginning of the str

.loop:
		cmp		byte [rax], 0			; Check if we reached end of the str
		je		.is_null

		cmp		byte [rax], sil			; Check if it's the characters to_find
		je		.exit					; If so, exit

		inc		rax						; If not, we continue looping
		jmp		.loop					; We loop until we find or until end of string

.is_null:
		xor		rax, rax				; If this label was called, means we didn't find

.exit:
		ret
