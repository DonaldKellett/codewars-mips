li $a0, 3
li $a1, 5
jal multiply
add $a0, $v0, $zero
li $v0, 1
syscall
li $a0, 10
li $v0, 11
syscall

li $a0, 9
li $a1, 7
jal multiply
add $a0, $v0, $zero
li $v0, 1
syscall
li $a0, 10
li $v0, 11
syscall

li $v0, 10
syscall
