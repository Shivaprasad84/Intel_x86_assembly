.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"

.data
	L: .float 0.002		# 2mH
	C: .float 0.0000001		# 0.1uF
	freq: .float 0			# f = 1/2*pi*sqrt(L*C)

.text
.global _start
_start:
	lea ebx, L
	finit
	fldpi
	fadd st(0), st(0)
	fld dword ptr[ebx + 0]
	fmul dword ptr[ebx + 4]
	fsqrt
	fmul st(0), st(1)
	fld1
	fdiv st(0), st(1)
	fstp dword ptr[ebx + 8]
exit
	
