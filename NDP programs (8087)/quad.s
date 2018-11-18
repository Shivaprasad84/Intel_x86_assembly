.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"

.data
	# Change the coefficients here
	a: .float 1 				# 0
	b: .float 28 				# 4
	c: .float 192				# 8
	
	two: .float 2 				# 12
	two_a: .float -2 			# 16
	L: .float -2 				# 20
	
	x1: .float -2 				# 24 (Root 1)
	x2: .float -2 				# 28 (Root 2)

.text
.global _start
_start:
	lea ebx, a
	finit
	fld dword ptr[ebx + 0]		# a
	fmul dword ptr[ebx + 12]		# 2a
	fst dword ptr[ebx + 16]		# store 2a for later use
	fdivr dword ptr[ebx + 4]		# b/2a
	fchs						# -b/2a
	fstp dword ptr[ebx + 20]		# store -b/2a in mem (L) and pop
	fld dword ptr[ebx + 16]		# 2a
	fmul dword ptr[ebx + 8]		# 2ac
	fmul dword ptr[ebx + 12]		# 4ac
	fld dword ptr[ebx + 4]		# b
	fmul dword ptr[ebx + 4]		# b^2
	fsub st(0), st(1)			# b^2-4ac
	fsqrt					# sqrt(b^2-4ac)
	fdiv dword ptr[ebx + 16]		# sqrt(b^2-4ac)/2a
	fld dword ptr[ebx + 20]		# -b/2a
	fadd st(0), st(1)			# -b/2a + sqrt(b^2-4ac)/2a --> root 1
	fstp dword ptr[ebx + 24]		# store root 1 in mem loc x1
	fld dword ptr[ebx + 20]		# -b/2a
	fsub st(0), st(1)			# -b/2a - sqrt(b^2-4ac)/2a --> root 2
	fstp dword ptr[ebx + 28]		# store root 2 in mem loc x2
exit
