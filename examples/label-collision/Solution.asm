.globl multiply

multiply:
	mult $a0, $a1
	mflo $v0
	jr $ra
