li $a0, 7
li $a1, 3
jal pascal
add $a0, $v0, $zero
li $v0, 1
syscall
li $a0, 10
li $v0, 11
syscall

li $a0, 9
li $a1, 6
jal pascal
add $a0, $v0, $zero
li $v0, 1
syscall
li $a0, 10
li $v0, 11
syscall

li $v0, 10
syscall
