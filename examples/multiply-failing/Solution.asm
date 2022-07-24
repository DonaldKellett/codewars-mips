.globl multiply

# int multiply(int a, int b)
multiply:
	li $v0, 1
	syscall
	add $t0, $a0, $zero
	li $a0, 44
	li $v0, 11
	syscall
	add $a0, $a1, $zero
	li $v0, 1
	syscall
	li $a0, 10
	li $v0, 11
	syscall
	add $a0, $t0, $zero
	add $v0, $a0, $a1
	add $t0, $v0, $zero
	add $a0, $v0, $zero
	li $v0, 1
	syscall
	li $a0, 10
	li $v0, 11
	syscall
	add $v0, $t0, $zero
	jr $ra
