.data

scenario: .asciiz "The multiply() function"
fixed_tests: .asciiz "should work for some fixed tests"
three_five: .asciiz "multiply(3, 5) should equal 15"
five_three: .asciiz "multiply(5, 3) should equal 15"
two_two: .asciiz "multiply(2, 2) should equal 4"
minus_nine_seven: .asciiz "multiply(-9, 7) should equal -63"
twelve_minus_fifteen: .asciiz "multiply(12, -15) should equal -180"
random_tests: .asciiz "should work for some random tests"
random_tests_failed: .asciiz "Failed a random test - print your input(s)/output to debug ;-)"

.text

# describe("The multiply() function")
la $a0, scenario
jal __CW_GROUP

# it("should work for some fixed tests")
la $a0, fixed_tests
jal __CW_TEST

# assert_eq(multiply(3, 5), 15, "multiply(3, 5) should equal 15")
li $a0, 3
li $a1, 5
jal multiply
add $a0, $v0, $zero
li $a1, 15
la $a2, three_five
jal __CW_ASSERT_EQ

# assert_eq(multiply(5, 3), 15, "multiply(5, 3) should equal 15")
li $a0, 5
li $a1, 3
jal multiply
add $a0, $v0, $zero
li $a1, 15
la $a2, five_three
jal __CW_ASSERT_EQ

# assert_eq(multiply(2, 2), 4, "multiply(2, 2) should equal 4")
li $a0, 2
li $a1, 2
jal multiply
add $a0, $v0, $zero
li $a1, 4
la $a2, two_two
jal __CW_ASSERT_EQ

# assert_eq(multiply(-9, 7), -63, "multiply(-9, 7) should equal 63")
li $a0, -9
li $a1, 7
jal multiply
add $a0, $v0, $zero
li $a1, -63
la $a2, minus_nine_seven
jal __CW_ASSERT_EQ

# assert_eq(multiply(12, -15), -180, "multiply(12, -15) should equal -180")
li $a0, 12
li $a1, -15
jal multiply
add $a0, $v0, $zero
li $a1, -180
la $a2, twelve_minus_fifteen
jal __CW_ASSERT_EQ

# it("should work for some random tests")
la $a0, random_tests
jal __CW_TEST

# 100 random tests with multiply(a, b), 0 <= a, b < 100
li $t0, 100
random_test_loop:
	ble $t0, $zero, random_test_loop_end
	li $a1, 100
	li $v0, 42
	syscall
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	li $a1, 100
	li $v0, 42
	syscall
	add $a1, $a0, $zero
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	mult $a0, $a1
	mflo $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	jal multiply
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $a0, $v0, $zero
	la $a2, random_tests_failed
	addi $sp, $sp, -4
	sw $t0, 0($sp)
	jal __CW_ASSERT_EQ
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0, -1
	j random_test_loop
random_test_loop_end:

# end describe
jal __CW_ENDGROUP

li $v0, 10
syscall
