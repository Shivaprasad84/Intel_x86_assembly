.intel_mnemonic 
.intel_syntax noprefix
.include "macros.mac"
.data
	msg1: .ascii "Enter a letter: \n"
		 .equ len1, .-msg1
		 
	msg2: .ascii "upper case representation is: \n"
		 .equ len2, .-msg2
		 
	msg3: .ascii "lower case representation is: \n"
		 .equ len3, .-msg3
		 
	new_line: .ascii "\n"
	letter: .ds 1
	case_change: .ds 1

.text
.global _start
_start:
	display msg1, len1
	read letter, 1
	mov al, letter 
	cmp al, 0x61
	jge small
	add al, 0x20
	mov case_change, al
	display msg3, len3
	jmp nxt
small:
	sub al, 0x20
	mov case_change, al
	display msg2, len2
nxt:
	display case_change, 1
	display new_line, 1
exit
