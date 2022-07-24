# void reverse(const char *str, char *out)
# Writes a reversed version of str to buffer out
.globl reverse

reverse:
	li $v0, 4
	syscall
	add $t0, $a0, $zero
	li $a0, 10
	li $v0, 11
	syscall
	add $a0, $t0, $zero
	add $t0, $a1, $zero
reverse_loop:
	lb $t1, 0($a0)
	beq $t1, $zero, reverse_loop_end
	sb $t1, 0($a1)
	addi $a0, $a0, 1
	addi $a1, $a1, 1
	j reverse_loop
reverse_loop_end:
	sb $zero, 0($a1)
	add $a0, $t0, $zero
	li $v0, 4
	syscall
	li $a0, 10
	li $v0, 11
	syscall
	jr $ra
