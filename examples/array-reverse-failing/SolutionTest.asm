.data

spec: .asciiz "The reverse() function"
fixed_tests: .asciiz "should work for some fixed tests"
one_to_five: .word 1, 2, 3, 4, 5
five_to_one: .word 5, 4, 3, 2, 1
one_to_five_length_failed: .asciiz "Expected len(reverse({1, 2, 3, 4, 5})) to equal 5"
one_to_five_failed: .asciiz "Expected reverse({1, 2, 3, 4, 5}) to equal {5, 4, 3, 2, 1}"
weird: .word 1, 2, 3, -4, 2, 1
driew: .word 1, 2, -4, 3, 2, 1
weird_length_failed: .asciiz "Expected len(reverse({1, 2, 3, -4, 2, 1})) to equal 6"
weird_failed: .asciiz "Expected reverse({1, 2, 3, -4, 2, 1}) to equal {1, 2, -4, 3, 2, 1}"
driew_not_weird: .asciiz "reverse({1, 2, 3, -4, 2, 1}) should not equal {1, 2, 3, -4, 2, 1}"
symmetric: .word 1, 2, 3, 2, 1
symmetric_length_failed: .asciiz "Expected len(reverse({1, 2, 3, 2, 1})) to equal 5"
symmetric_failed: .asciiz "Expected reverse({1, 2, 3, 2, 1}) to equal {1, 2, 3, 2, 1}"
res: .word 0:6
res_size: .word 0:1

.text

# describe("The reverse() function")
la $a0, spec
jal __CW_GROUP

# it("should work for some fixed tests")
la $a0, fixed_tests
jal __CW_TEST

# assert_eq(len(reverse({1, 2, 3, 4, 5})), 5, "Expected len(reverse({1, 2, 3, 4, 5})) to equal 5")
# assert_arr_eq(reverse({1, 2, 3, 4, 5}), {5, 4, 3, 2, 1}, 20, "Expected reverse({1, 2, 3, 4, 5}) to equal {5, 4, 3, 2, 1}")
la $a0, one_to_five
li $a1, 5
la $a2, res
la $a3, res_size
jal reverse
la $a0, res_size
lw $a0, 0($a0)
li $a1, 5
la $a2, one_to_five_length_failed
jal __CW_ASSERT_EQ
la $a0, res
la $a1, five_to_one
li $a2, 20
la $a3, one_to_five_failed
jal __CW_ASSERT_ARR_EQ

# assert_eq(len(reverse({1, 2, 3, -4, 2, 1})), 6, "Expected len(reverse({1, 2, 3, -4, 2, 1})) to equal 6")
# assert_arr_eq(reverse({1, 2, 3, -4, 2, 1}), {1, 2, -4, 3, 2, 1}, 24, "Expected reverse({1, 2, 3, -4, 2, 1}) to equal {1, 2, -4, 3, 2, 1}")
# assert_arr_neq(reverse({1, 2, 3, -4, 2, 1}), {1, 2, 3, -4, 2, 1}, 24, "reverse({1, 2, 3, -4, 2, 1}) should not equal {1, 2, 3, -4, 2, 1}")
la $a0, weird
li $a1, 6
la $a2, res
la $a3, res_size
jal reverse
la $a0, res_size
lw $a0, 0($a0)
li $a1, 6
la $a2, weird_length_failed
jal __CW_ASSERT_EQ
la $a0, res
la $a1, driew
li $a2, 24
la $a3, weird_failed
jal __CW_ASSERT_ARR_EQ
la $a0, res
la $a1, weird
li $a2, 24
la $a3, driew_not_weird
jal __CW_ASSERT_ARR_NEQ

# assert_eq(len(reverse({1, 2, 3, 2, 1})), 5, "Expected len(reverse({1, 2, 3, 2, 1})) to equal 5")
# assert_arr_eq(reverse({1, 2, 3, 2, 1}), {1, 2, 3, 2, 1}, 20, "Expected reverse({1, 2, 3, 2, 1}) to eqaul {1, 2, 3, 2, 1}")
la $a0, symmetric
li $a1, 5
la $a2, res
la $a3, res_size
jal reverse
la $a0, res_size
lw $a0, 0($a0)
li $a1, 5
la $a2, symmetric_length_failed
jal __CW_ASSERT_EQ
la $a0, res
la $a1, symmetric
li $a2, 20
la $a3, symmetric_failed
jal __CW_ASSERT_ARR_EQ

# end describe
jal __CW_ENDGROUP

li $v0, 10
syscall
