.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"

.data
	radius: .float 5
	area: .float 0

.text
.global _start
_start:
	lea ebx, radius
	finit
	fldpi
	fmul dword ptr[ebx]
	fmul dword ptr[ebx]
	fstp dword ptr[ebx + 4]
exit
