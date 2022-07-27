.data

one_to_five: .word 1, 2, 3, 4, 5
weird: .word 1, 2, 3, 4, 2, 1
symmetric: .word 1, 2, 3, 2, 1
singleton: .word 42
some_numbers: .word 1, 7, 4, -3, 15, -90
res: .word 0:6
res_size: .word 0:1

.text

la $a0, one_to_five
li $a1, 5
jal print_arr
la $a0, one_to_five
li $a1, 5
la $a2, res
la $a3, res_size
jal reverse
la $a0, res
la $a1, res_size
lw $a1, 0($a1)
jal print_arr
li $a0, 10
li $v0, 11
syscall

la $a0, weird
li $a1, 6
jal print_arr
la $a0, weird
li $a1, 6
la $a2, res
la $a3, res_size
jal reverse
la $a0, res
la $a1, res_size
lw $a1, 0($a1)
jal print_arr
li $a0, 10
li $v0, 11
syscall

la $a0, symmetric
li $a1, 5
jal print_arr
la $a0, symmetric
li $a1, 5
la $a2, res
la $a3, res_size
jal reverse
la $a0, res
la $a1, res_size
lw $a1, 0($a1)
jal print_arr
li $a0, 10
li $v0, 11
syscall

la $a0, singleton
li $a1, 1
jal print_arr
la $a0, singleton
li $a1, 1
la $a2, res
la $a3, res_size
jal reverse
la $a0, res
la $a1, res_size
lw $a1, 0($a1)
jal print_arr
li $a0, 10
li $v0, 11
syscall

la $a0, some_numbers
li $a1, 6
jal print_arr
la $a0, some_numbers
li $a1, 6
la $a2, res
la $a3, res_size
jal reverse
la $a0, res
la $a1, res_size
lw $a1, 0($a1)
jal print_arr
li $a0, 10
li $v0, 11
syscall

li $v0, 10
syscall

# void print_arr(const int *arr, int arr_size)
# Prints the array arr with arr_size elements
print_arr:
	add $t0, $a0, $zero
	li $a0, 123
	li $v0, 11
	syscall
	add $a0, $t0, $zero
	ble $a1, $zero, print_arr_prereturn
	add $t0, $a0, $zero
	lw $a0, 0($a0)
	li $v0, 1
	syscall
	addi $a0, $t0, 4
	addi $a1, $a1, -1
print_arr_loop:
	ble $a1, $zero, print_arr_prereturn
	add $t0, $a0, $zero
	li $a0, 44
	li $v0, 11
	syscall
	lw $a0, 0($t0)
	li $v0, 1
	syscall
	addi $a0, $t0, 4
	addi $a1, $a1, -1
	j print_arr_loop
print_arr_prereturn:
	li $a0, 125
	li $v0, 11
	syscall
	li $a0, 10
	syscall
	jr $ra
