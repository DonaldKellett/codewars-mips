.data

hello: .asciiz "Hello World!"
linux: .asciiz "GNU/Linux >>> macOS > Windows"
goodbye: .asciiz "Goodbye World!"
out: .byte 0:1024

.text

la $a0, hello
la $a1, out
jal reverse
la $a0, out
li $v0, 4
syscall
li $a0, 10
li $v0, 11
syscall

la $a0, linux
la $a1, out
jal reverse
la $a0, out
li $v0, 4
syscall
li $a0, 10
li $v0, 11
syscall

la $a0, goodbye
la $a1, out
jal reverse
la $a0, out
li $v0, 4
syscall
li $a0, 10
li $v0, 11
syscall

li $v0, 10
syscall
