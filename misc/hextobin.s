.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"
.data

	num: .byte 9
	bin: .ds 8
	nl: .ascii "\n"
	
.text
.global _start
_start:
	mov al, num
	mov cx, 8
	lea edi, bin
up:
	rcl al, 1
	jc one
	mov byte ptr[edi], '0'
	jmp skip
one:
	mov byte ptr[edi], '1'
skip:
	inc edi
	loop up
	display bin, 8
	display nl, 1
exit	 
