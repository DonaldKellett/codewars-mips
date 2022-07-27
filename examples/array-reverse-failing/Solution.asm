.globl reverse

# void reverse(const int *arr, int arr_size, int *res, int *res_size)
# Given array arr containg arr_size integers, output a reversed version of arr
# in res and set res_size to the size of the output array

reverse:
	sw $a1, 0($a3)
reverse_loop:
	ble $a1, $zero, reverse_loop_end
	lw $t0, 0($a0)
	sw $t0, 0($a2)
	addi $a0, $a0, 4
	addi $a2, $a2, 4
	addi $a1, $a1, -1
	j reverse_loop
reverse_loop_end:
	jr $ra

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
