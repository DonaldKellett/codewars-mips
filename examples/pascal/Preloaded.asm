.globl factorial

# int factorial(int n)
factorial:
	ble $a0, $zero, base_case
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $a0, $a0, -1
	jal factorial
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	mult $a0, $v0
	mflo $v0
	jr $ra
base_case:
	li $v0, 1
	jr $ra
