# MARSAssert
# A minimal unit testing framework for MARS MIPS32 programs on Codewars
# Inspired by (but in no way affiliated with) Criterion and coq_codewars

.data

__CW_DESCRIBE: .asciiz "<DESCRIBE::>"
__CW_COMPLETEDIN: .asciiz "<COMPLETEDIN::>"
__CW_IT: .asciiz "<IT::>"
__CW_PASSED: .asciiz "<PASSED::>"
__CW_FAILED: .asciiz "<FAILED::>"
__CW_PASS_MSG: .asciiz "Test Passed"

.text
.globl __CW_GROUP, __CW_ENDGROUP, __CW_TEST, __CW_PASS, __CW_FAIL, __CW_ASSERT, __CW_ASSERT_NOT, __CW_ASSERT_NULL, __CW_ASSERT_NOT_NULL, __CW_ASSERT_EQ, __CW_ASSERT_NEQ, __CW_ASSERT_LT, __CW_ASSERT_LEQ, __CW_ASSERT_GT, __CW_ASSERT_GEQ, __CW_ASSERT_STR_EMPTY, __CW_ASSERT_STR_NOT_EMPTY, __CW_ASSERT_STR_EQ, __CW_ASSERT_STR_NEQ, __CW_ASSERT_ARR_EQ, __CW_ASSERT_ARR_NEQ

# describe("Major component or scenario")
__CW_GROUP:
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	la $a0, __CW_DESCRIBE
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	li $v0, 4
	syscall
	li $a0, 10
	li $v0, 11
	syscall
	jr $ra

# Ends a describe block
__CW_ENDGROUP:
	la $a0, __CW_COMPLETEDIN
	li $v0, 4
	syscall
	li $a0, 10
	li $v0, 11
	syscall
	jr $ra

# it("Property of component or scenario")
__CW_TEST:
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	la $a0, __CW_IT
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	li $v0, 4
	syscall
	li $a0, 10
	li $v0, 11
	syscall
	jr $ra

# unconditional_pass("Message to display for passing assertion")
__CW_PASS:
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	la $a0, __CW_PASSED
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	li $v0, 4
	syscall
	li $a0, 10
	li $v0, 11
	syscall
	jr $ra

# unconditional_fail("Message to display for failing assertion")
__CW_FAIL:
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	la $a0, __CW_FAILED
	li $v0, 4
	syscall
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	li $v0, 4
	syscall
	li $a0, 10
	li $v0, 11
	syscall
	jr $ra

# assert(int condition, "Message to display for failing assertion")
__CW_ASSERT:
	beq $a0, $zero, __CW_ASSERT_FAILED
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, __CW_PASS_MSG
	jal __CW_PASS
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
__CW_ASSERT_FAILED:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	add $a0, $a1, $zero
	jal __CW_FAIL
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

# assert_not(int condition, "Message to display for failing assertion")
__CW_ASSERT_NOT:
	bne $a0, $zero, __CW_ASSERT_NOT_FAILED
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, __CW_PASS_MSG
	jal __CW_PASS
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
__CW_ASSERT_NOT_FAILED:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	add $a0, $a1, $zero
	jal __CW_FAIL
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

# assert_null(const void *ptr, "Message to display for failing assertion")
__CW_ASSERT_NULL:
	j __CW_ASSERT_NOT

# assert_not_null(const void *ptr, "Message to display for failing assertion")
__CW_ASSERT_NOT_NULL:
	j __CW_ASSERT

# assert_eq(int actual, int expected, "Message to display for failing assertion")
__CW_ASSERT_EQ:
	bne $a0, $a1, __CW_ASSERT_EQ_FAILED
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, __CW_PASS_MSG
	jal __CW_PASS
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
__CW_ASSERT_EQ_FAILED:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	add $a0, $a2, $zero
	jal __CW_FAIL
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

# assert_neq(int actual, int unexpected, "Message to display for failing assertion")
__CW_ASSERT_NEQ:
	beq $a0, $a1, __CW_ASSERT_NEQ_FAILED
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, __CW_PASS_MSG
	jal __CW_PASS
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
__CW_ASSERT_NEQ_FAILED:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	add $a0, $a2, $zero
	jal __CW_FAIL
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

# assert_lt(int actual, int reference, "Message to display for failing assertion")
__CW_ASSERT_LT:
	bge $a0, $a1, __CW_ASSERT_LT_FAILED
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, __CW_PASS_MSG
	jal __CW_PASS
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
__CW_ASSERT_LT_FAILED:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	add $a0, $a2, $zero
	jal __CW_FAIL
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

# assert_leq(int actual, int reference, "Message to display for failing assertion")
__CW_ASSERT_LEQ:
	bgt $a0, $a1, __CW_ASSERT_LEQ_FAILED
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, __CW_PASS_MSG
	jal __CW_PASS
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
__CW_ASSERT_LEQ_FAILED:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	add $a0, $a2, $zero
	jal __CW_FAIL
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

# assert_gt(int actual, int reference, "Message to display for failing assertion")
__CW_ASSERT_GT:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	add $t0, $a0, $zero
	add $a0, $a1, $zero
	add $a1, $t0, $zero
	jal __CW_ASSERT_LT
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

# assert_geq(int actual, int reference, "Message to display for failing assertion")
__CW_ASSERT_GEQ:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	add $t0, $a0, $zero
	add $a0, $a1, $zero
	add $a1, $t0, $zero
	jal __CW_ASSERT_LEQ
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

# assert_str_empty(const char *value, "Message to display for failing assertion")
__CW_ASSERT_STR_EMPTY:
	beq $a0, $zero, __CW_ASSERT_STR_EMPTY_FAILED
	lb $t0, 0($a0)
	bne $t0, $zero, __CW_ASSERT_STR_EMPTY_FAILED
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, __CW_PASS_MSG
	jal __CW_PASS
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
__CW_ASSERT_STR_EMPTY_FAILED:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	add $a0, $a1, $zero
	jal __CW_FAIL
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

# assert_str_not_empty(const char *value, "Message to display for failing assertion")
__CW_ASSERT_STR_NOT_EMPTY:
	beq $a0, $zero, __CW_ASSERT_STR_NOT_EMPTY_FAILED
	lb $t0, 0($a0)
	beq $t0, $zero, __CW_ASSERT_STR_NOT_EMPTY_FAILED
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, __CW_PASS_MSG
	jal __CW_PASS
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
__CW_ASSERT_STR_NOT_EMPTY_FAILED:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	add $a0, $a1, $zero
	jal __CW_FAIL
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

# assert_str_eq(const char *actual, const char *expected, "Message to display for failing assertion")
__CW_ASSERT_STR_EQ:
	beq $a0, $zero, __CW_ASSERT_STR_EQ_FAILED
	beq $a1, $zero, __CW_ASSERT_STR_EQ_FAILED
	lb $t0, 0($a0)
	lb $t1, 0($a1)
__CW_ASSERT_STR_EQ_LOOP:
	beq $t0, $zero, __CW_ASSERT_STR_EQ_LOOP_END
	beq $t1, $zero, __CW_ASSERT_STR_EQ_LOOP_END
	bne $t0, $t1, __CW_ASSERT_STR_EQ_FAILED
	addi $a0, $a0, 1
	addi $a1, $a1, 1
	lb $t0, 0($a0)
	lb $t1, 0($a1)
	j __CW_ASSERT_STR_EQ_LOOP
__CW_ASSERT_STR_EQ_LOOP_END:
	bne $t0, $zero, __CW_ASSERT_STR_EQ_FAILED
	bne $t1, $zero, __CW_ASSERT_STR_EQ_FAILED
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, __CW_PASS_MSG
	jal __CW_PASS
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
__CW_ASSERT_STR_EQ_FAILED:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	add $a0, $a2, $zero
	jal __CW_FAIL
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

# assert_str_neq(const char *actual, const char *unexpected, "Message to display for failing assertion")
__CW_ASSERT_STR_NEQ:
	beq $a0, $zero, __CW_ASSERT_STR_NEQ_FAILED
	beq $a1, $zero, __CW_ASSERT_STR_NEQ_FAILED
	add $t0, $zero, $zero
	lb $t1, 0($a0)
	lb $t2, 0($a1)
__CW_ASSERT_STR_NEQ_LOOP:
	beq $t1, $zero, __CW_ASSERT_STR_NEQ_LOOP_END
	beq $t2, $zero, __CW_ASSERT_STR_NEQ_LOOP_END
	beq $t1, $t2, __CW_ASSERT_STR_NEQ_COND_END
	li $t0, 1
	j __CW_ASSERT_STR_NEQ_LOOP_END
__CW_ASSERT_STR_NEQ_COND_END:
	addi $a0, $a0, 1
	addi $a1, $a1, 1
	lb $t1, 0($a0)
	lb $t2, 0($a1)
	j __CW_ASSERT_STR_NEQ_LOOP
__CW_ASSERT_STR_NEQ_LOOP_END:
	bne $t1, $zero, __CW_ASSERT_STR_NEQ_COND2
	bne $t2, $zero, __CW_ASSERT_STR_NEQ_COND2
	j __CW_ASSERT_STR_NEQ_COND2_END
__CW_ASSERT_STR_NEQ_COND2:
	li $t0, 1
__CW_ASSERT_STR_NEQ_COND2_END:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	add $a0, $t0, $zero
	add $a1, $a2, $zero
	jal __CW_ASSERT
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
__CW_ASSERT_STR_NEQ_FAILED:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	add $a0, $a2, $zero
	jal __CW_FAIL
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

# assert_arr_eq(const void *actual, const void *expected, int size, "Message to display for failing assertion")
__CW_ASSERT_ARR_EQ:
	beq $a0, $zero, __CW_ASSERT_ARR_EQ_FAILED
	beq $a1, $zero, __CW_ASSERT_ARR_EQ_FAILED
__CW_ASSERT_ARR_EQ_LOOP:
	ble $a2, $zero, __CW_ASSERT_ARR_EQ_LOOP_END
	lb $t0, 0($a0)
	lb $t1, 0($a1)
	bne $t0, $t1, __CW_ASSERT_ARR_EQ_FAILED
	addi $a0, $a0, 1
	addi $a1, $a1, 1
	addi $a2, $a2, -1
	j __CW_ASSERT_ARR_EQ_LOOP
__CW_ASSERT_ARR_EQ_LOOP_END:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, __CW_PASS_MSG
	jal __CW_PASS
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
__CW_ASSERT_ARR_EQ_FAILED:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	add $a0, $a3, $zero
	jal __CW_FAIL
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

# assert_arr_neq(const void *actual, const void *unexpected, int size, "Message to display for failing assertion")
__CW_ASSERT_ARR_NEQ:
	beq $a0, $zero, __CW_ASSERT_ARR_NEQ_FAILED
	beq $a1, $zero, __CW_ASSERT_ARR_NEQ_FAILED
__CW_ASSERT_ARR_NEQ_LOOP:
	ble $a2, $zero, __CW_ASSERT_ARR_NEQ_FAILED
	lb $t0, 0($a0)
	lb $t1, 0($a1)
	bne $t0, $t1, __CW_ASSERT_ARR_NEQ_LOOP_END
	addi $a0, $a0, 1
	addi $a1, $a1, 1
	addi $a2, $a2, -1
	j __CW_ASSERT_ARR_NEQ_LOOP
__CW_ASSERT_ARR_NEQ_LOOP_END:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, __CW_PASS_MSG
	jal __CW_PASS
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
__CW_ASSERT_ARR_NEQ_FAILED:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	add $a0, $a3, $zero
	jal __CW_FAIL
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
