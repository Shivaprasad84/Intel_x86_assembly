.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"
.data
	num: .float 28
	base: .float 10
	log: .float 0		# Performs log operation of 'num' to the 'base' # in this case log10(28)

.text
.global _start
_start:
	lea ebx, num
	finit
	fld1
	fld dword ptr[ebx + 4]
	fyl2x
	fld1
	fld dword ptr[ebx]
	fyl2x
	fdiv st(0), st(1)
	fstp dword ptr[ebx + 8]
exit
