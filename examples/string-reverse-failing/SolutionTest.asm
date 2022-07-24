.data

hello: .asciiz "Hello World!"
linux: .asciiz "GNU/Linux >>> macOS > Windows"
goodbye: .asciiz "Goodbye World!"
out: .byte 0:1024
scenario: .asciiz "The reverse() function"
fixed_tests: .asciiz "should work for some fixed tests"
olleh: .asciiz "!dlroW olleH"
hello_failed: .asciiz "reverse(\"Hello World!\") should return \"!dlroW olleH\""
hello_neq_failed: .asciiz "reverse(\"Hello World!\") should not return the original string"
xunil: .asciiz "swodniW > SOcam >>> xuniL/UNG"
linux_failed: .asciiz "reverse(\"GNU/Linux >>> macOS > Windows\") should return \"swodniW > SOcam >>> xuniL/UNG\""
madam: .asciiz "madam"
madam_failed: .asciiz "reverse(\"madam\") should return \"madam\""
eybdoog: .asciiz "!dlroW eybdooG"
goodbye_failed: .asciiz "reverse(\"Goodbye World!\") should return \"!dlroW eybdooG\""

.text

# describe("The reverse() function")
la $a0, scenario
jal __CW_GROUP

# it("should work for some fixed tests")
la $a0, fixed_tests
jal __CW_TEST

# assert_str_eq(reverse("Hello World!"), "!dlroW olleH", "reverse(\"Hello World!\") should return \"!dlroW olleH\"")
# assert_str_neq(reverse("Hello World!"), "Hello World!", "reverse(\"Hello World!\") should not return the original string")
la $a0, hello
la $a1, out
jal reverse
la $a0, out
la $a1, olleh
la $a2, hello_failed
jal __CW_ASSERT_STR_EQ
la $a0, out
la $a1, hello
la $a2, hello_neq_failed
jal __CW_ASSERT_STR_NEQ

# assert_str_eq(reverse("GNU/Linux >>> macOS > Windows"), "swodniW > SOcam >>> xuniL/UNG", "reverse(\"GNU/Linux >>> macOS > Windows\") should return \"swodniW > SOcam >>> xuniL/UNG\"")
la $a0, linux
la $a1, out
jal reverse
la $a0, out
la $a1, xunil
la $a2, linux_failed
jal __CW_ASSERT_STR_EQ

# assert_str_eq(reverse("madam"), "madam", "reverse(\"madam\") should return \"madam\"")
la $a0, madam
la $a1, out
jal reverse
la $a0, out
la $a1, madam
la $a2, madam_failed
jal __CW_ASSERT_STR_EQ

# assert_str_eq(reverse("Goodbye World!"), "!dlroW eybdooG", "reverse(\"Goodbye World!\") should return \"!dlroW eybdooG\"")
la $a0, goodbye
la $a1, out
jal reverse
la $a0, out
la $a1, eybdoog
la $a2, goodbye_failed
jal __CW_ASSERT_STR_EQ

# No random tests since they're already demoed in Multiply (-:

# end describe
jal __CW_ENDGROUP

li $v0, 10
syscall
