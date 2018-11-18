.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"

.data
	P: .float 500		# 0 # principal
	t: .float 2		# 4 # time in years
	r: .float 4		# 8 # rate of intrest in percentage
	cent: .float 100	# 12
	SI: .float 		# 16 #SI = Ptr/100 # simple intrest
	
.text
.global _start
_start:
	lea ebx, P
	finit
	fld dword ptr[ebx + 0]
	fmul dword ptr[ebx + 4]
	fmul dword ptr[ebx + 8]
	fdiv dword ptr[ebx + 12]
	fstp dword ptr[ebx + 16]
exit
	
