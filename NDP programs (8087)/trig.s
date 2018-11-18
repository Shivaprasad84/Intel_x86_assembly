.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"

.data
	angle: .float 30			# 0
	pi_deg: .float 180			# 4
	angle_in_radian: .float 0	# 8
	sin: .float 0				# 12
	cos: .float 0				# 16
	tan: .float 0				# 20
	cosec: .float 0			# 24
	sec: .float 0				# 28
	cot: .float 0				# 32

.text
.global _start
_start:
	lea ebx, angle
	finit
	fldpi
	fdiv dword ptr[ebx + 4]
	fmul dword ptr[ebx + 0]
	fst dword ptr[ebx + 8]
	fsin 
	fstp dword ptr[ebx + 12]
	fld dword ptr[ebx + 8]
	fcos
	fstp dword ptr[ebx + 16]
	fld dword ptr[ebx + 12]
	fdiv dword ptr[ebx + 16]
	fstp dword ptr[ebx + 20]
	fld1
	fdiv dword ptr[ebx + 12]
	fstp dword ptr[ebx + 24]
	fld1
	fdiv dword ptr[ebx + 16]
	fstp dword ptr[ebx + 28]
	fld1
	fdiv dword ptr[ebx + 20]
	fstp dword ptr[ebx + 32]
exit
