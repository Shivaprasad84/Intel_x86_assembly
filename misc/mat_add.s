.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"

.data
	matA:
		.byte 1, 2, 3, 4, 5, 6, 7, 8, 9
	matB:
		.byte 1, 2, 3, 4, 5, 6, 7, 8, 9
	matC:
		.ds 9

.text
.global _start
_start:
	lea esi, matA
	lea ebp, matB
	lea edi, matC
	mov ecx, 9
	up:
	mov eax, [esi]
	add eax, [ebp]
	mov [edi], eax
	inc esi
	inc edi
	inc ebp
	loop up
	nop
exit
	
