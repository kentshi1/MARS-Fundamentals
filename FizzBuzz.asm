.data
fizz: .asciiz "Fizz"
buzz: .asciiz "Buzz"
fizzbuzz: .asciiz "FizzBuzz"
newline: .asciiz "\n"

.text
.globl main

main:
    li $t1, 1
    li $t2, 101

    li $t7, 15
    li $t8, 5
    li $t9, 3

loop:
    # Check multiples of 15
    rem $t0, $t1, $t7
    beq $t0, $zero, print_fizzbuzz

    # Check multiples of 3
    rem $t0, $t1, $t9
    beq $t0, $zero, print_fizz

    # Check multiples of 5
    rem $t0, $t1, $t8
    beq $t0, $zero, print_buzz

    # Print integer
    li $v0, 1
    move $a0, $t1
    syscall
    j print_newline

print_fizzbuzz:
    li $v0, 4
    la $a0, fizzbuzz
    syscall
    j print_newline

print_fizz:
    li $v0, 4
    la $a0, fizz
    syscall
    j print_newline

print_buzz:
    li $v0, 4
    la $a0, buzz
    syscall

print_newline:
    li $v0, 4
    la $a0, newline
    syscall

    addi $t1, $t1, 1
    bne $t1, $t2, loop

    li $v0, 10
    syscall