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
	### BINARY TO GRAY CODE ###
	mov al, num
	mov bl, al
	shr al, 1
	xor bl, al
	mov gray, bl
	
	### GRAY CODE TO BINARY ###
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
