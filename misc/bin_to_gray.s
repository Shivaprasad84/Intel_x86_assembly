.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"
.data
	num: .byte 12
	gray: .ds 1
	bin: .ds 1

.text
.global _start
_start:
	mov al, num
	
	mov bl, al
	shr al, 1
	xor bl, al
	mov gray, bl
	nop
	mov al, gray
	mov bl, al
	shr bl, 2
	xor al, bl
	mov bl, al
	shr bl, 1
	xor al, bl
	mov bin, al
	nop
exit
