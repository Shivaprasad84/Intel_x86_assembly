# Program to execute h = sqrt(x^2 + y^2), x and y stored in memory

.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"

.data
	x: .float 12
	y: .float 5
	h: .float 0

.text
.global _start
_start:
	lea ebx, x
	finit
	fld dword ptr[ebx]
	fmul dword ptr[ebx]
	fld dword ptr[ebx + 4]
	fmul dword ptr[ebx + 4]
	fadd st(0), st(1)
	fsqrt
	fstp dword ptr[ebx + 8]
exit

