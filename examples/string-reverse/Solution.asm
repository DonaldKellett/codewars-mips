# void reverse(const char *str, char *out)
# Writes a reversed version of str to buffer out
.globl reverse

reverse:
	add $t0, $zero, $zero
reverse_loop:
	lb $t1, 0($a0)
	beq $t1, $zero, reverse_loop2
	addi $t0, $t0, 1
	addi $a0, $a0, 1
	j reverse_loop
reverse_loop2:
	ble $t0, $zero, reverse_loop2_end
	addi $a0, $a0, -1
	lb $t1, 0($a0)
	sb $t1, 0($a1)
	addi $a1, $a1, 1
	addi $t0, $t0, -1
	j reverse_loop2
reverse_loop2_end:
	sb $zero, 0($a1)
	jr $ra
