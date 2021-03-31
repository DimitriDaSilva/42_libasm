		default rel

section	.data

struc   mystruct
		a:	resw	1
		b:	resd	1
		c:	resb	1
		d:	resd	1
		e:	resb	6
endstruc

oneStruct:
	istruc	mystruct
		at	a, dw		-1
		at 	b, dd		0x12345678
		at	c, db		' '
		at	d, dd		23
		at	e, db		'Gary', 0
	iend

msg:	db	'Size of struct is %d', 10, 0
msg1:	db	'struct + b = %d', 10, 0
msg2:	db	'pStru + b = %d', 10, 0

section	.bss

pStru:	resq	1

section	.text
	global _start
	extern _printf, _malloc, _scanf

_start:
	push	rbp
	mov		rbp, rsp

	; Print msg
	lea		rdi, [msg]
	mov		rsi, mystruct_size
	call	_printf

	; Static struct
	mov		dword [oneStruct + b], 7
	lea		rdi, [msg1]
	mov		esi, [oneStruct + b]
	call	_printf

	; Dynamic struct
	mov		rdi, mystruct_size
	call	_malloc

	mov		[pStru], rax

	mov		dword [pStru + b], 44
	lea		rdi, [msg2]
	mov		rsi, [pStru + b]
	call	_printf

	mov		rsp, rbp
	pop		rbp
	mov		rax, 0
	ret
