.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"
.data
	alpha: .ds 1
	space: .ascii " "
	nl: .ascii "\n"	
.text
.global _start
_start:
	### SMALL LETTERS ###
	mov di, 26
	mov si, 0x61
	up0:
	mov alpha, si
	display alpha, 1
	display space, 1
	inc si
	dec di
	jnz up0
	display nl, 1
	display nl, 1
	
	### CAPITAL LETTERS ###
	mov di, 26
	mov si, 0x41
	up1:
	mov alpha, si
	display alpha, 1
	display space, 1
	inc si
	dec di
	jnz up1
	display nl, 1
exit
	
