.globl multiply

# int multiply(int a, int b)
multiply:
	add $v0, $a0, $a1
	jr $ra
