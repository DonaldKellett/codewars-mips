.globl reverse

# void reverse(const int *arr, int arr_size, int *res, int *res_size)
# Given array arr containg arr_size integers, output a reversed version of arr
# in res and set res_size to the size of the output array

reverse:
	sw $a1, 0($a3)
	sll $a1, $a1, 2
	add $a0, $a0, $a1
reverse_loop:
	ble $a1, $zero, reverse_loop_end
	addi $a0, $a0, -4
	lw $t0, 0($a0)
	sw $t0, 0($a2)
	addi $a1, $a1, -4
	addi $a2, $a2, 4
	j reverse_loop
reverse_loop_end:
	jr $ra
