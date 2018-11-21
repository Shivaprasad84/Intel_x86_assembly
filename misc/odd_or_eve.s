.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"

.data
	num: .byte 26
	msg1: .ascii "Even\n"
		 .equ len1, .-msg1
	msg2: .ascii "Odd\n"
		 .equ len2, .-msg2
.text
.global _start

_start:
	mov al, num
	rcr al, 1
	jnc even
	display msg2, len2
	jmp ex
	even:
	display msg1, len1
	ex:
	exit
