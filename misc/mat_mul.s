.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"

.data
	matA: .byte 1, 2, 3, 4
	matB: .byte 1, 2, 3, 4
	matC: .ds 4

.text
.global _start
_start:
	lea esi, matA
	lea ebp, matB
	lea edi, matC
	
