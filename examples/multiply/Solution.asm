.globl multiply

# int multiply(int a, int b)
multiply:
	mult $a0, $a1
	mflo $v0
	jr $ra
