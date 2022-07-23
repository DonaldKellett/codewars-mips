# MARSAssert
# A minimal unit testing framework for MARS MIPS32 programs on Codewars

.data

describe: .asciiz "<DESCRIBE::>"
completedin: .asciiz "<COMPLETEDIN::>"
it: .asciiz "<IT::>"
passed: .asciiz "<PASSED::>"
failed: .asciiz "<FAILED::>"
pass_msg: .asciiz "Test Passed"

.text
.globl __CW_GROUP, __CW_ENDGROUP, __CW_TEST, __CW_PASS, __CW_FAIL, __CW_ASSERT

# describe("Major component or scenario")
__CW_GROUP:
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	la $a0, describe
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
	la $a0, completedin
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
	la $a0, it
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
	la $a0, passed
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
	la $a0, failed
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
	beq $a0, $zero, cw_assert_failed
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, pass_msg
	jal __CW_PASS
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
cw_assert_failed:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	add $a0, $a1, $zero
	jal __CW_FAIL
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
