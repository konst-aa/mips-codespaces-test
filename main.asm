.data
s1: .asciiz "Q1: "
arr1: .word 0 0 0 0 0 0 0 0
s2: .asciiz "Q2: "
arr2: .word 1 2 3 4 5 6 7 8
s3: .asciiz "Q3: "
arr3: .word 1 2 4 4 5 3 10 7
s4: .asciiz "Q4: "
arr4: .word 1 2 4 4 5 3 10 7

.text
j main

# $a0 <- arr
# $a1 <- number_of_elements
print_arr:
	add $t7, $zero, $a0 # $t7 <- $a0

	print_arr_loop:
		beq $a1, $zero, print_arr_return

		addi $v0, $zero, 1 # print int syscall code

		lw $a0, 0($t7) # load int to print

		syscall # print int

		addi $v0, $zero, 11 # print ascii syscall code
		addi $a0, $zero, ' '
		syscall


		addi $t7, $t7, 4 # go to next element in arr
		addi $a1, $a1, -1

		j print_arr_loop


	print_arr_return:
	
	addi $v0, $zero, 11 # print ascii syscall code
	addi $a0, $zero, '\n'	
	syscall
	
	jr $ra

Q1:	
	# we have allocated:
	# a0 <- arr1
	# a1 <- size of arr1
	
	# goal:
	# set arr[2] (third element) to 14
	# you should see printed:
	# Q1: 0 0 14 0 0 0 0 0
	
	# tips:
	# remember, an int is 4 bytes large
	# what offset should we have for sw? (It must be a multiple of 4)
	# you may need: addi, sw
	
	# your code here...
	# good luck!
	addi $t0, $zero, 14
	sw $t0, 8($a0)
	
	Q1_return:
	jr $ra

Q2:
	# we have allocated:
	# a0 <- arr2
	# a1 <- size of arr2
	
	# goal:
	# make all the array elements negative
	# you should see printed:
	# Q2: -1 -2 -3 -4 -5 -6 -7 -8
	
	# tips:
	# remember, an int is 4 bytes large
	# $zero will be useful here. 
	# you may need: addi, sub, lw, sw,
	# beq/bne, slt (if you please), j
	
	# your code here...
	# good luck!
	
	Q2_loop:
		beq $a1, $zero, Q2_return
		lw $t0, 0($a0)
		sub $t0, $zero, $t0
		sw $t0, 0($a0)
		addi $a0, $a0, 4
		addi $a1, $a1, -1
	
	
	j Q2_loop
	
	Q2_return:
	jr $ra

Q3:
	# we have allocated:
	# a0 <- arr3
	# a1 <- size of arr3
	
	# goal:
	# set arr3[3] to 0 _if_ its even!!!
	# you should see printed:
	# Q3: 1 2 4 0 5 3 10 7
	
	# tips:
	# remember, an int is 4 bytes large
	# $zero will be useful here. 
	# you may need: andi, lw, sw, beq/bne
	
	# your code here...
	# good luck!
	
	lw $t0, 12($a0)
	andi $t0, $t0, 1
	bne $t0, $zero, Q3_return # just exit if odd
	
	sw $zero, 12($a0) # otherwise set to 0
	
	Q3_return:
	jr $ra

Q4:
	# we have allocated:
	# a0 <- arr4
	# a1 <- size of arr4
	
	# goal:
	# set all even elements of arr4 to 0
	# you should see printed:
	# Q4: 1 0 0 0 5 3 0 7
	
	# tips:
	# remember, an int is 4 bytes large
	# $zero will be useful here.
	# you may need: andi, lw, sw, beq/bne, j, addi
	
	# your code here...
	# good luck!
	
	Q4_loop:
	beq $a1, $zero, Q4_return
		lw $t0, 0($a0)
		andi $t0, $t0, 1
		bne $t0, $zero, Q4_skip_if # just exit if odd
		sw $zero, 0($a0) # otherwise set to 0
		
		Q4_skip_if:
		addi $a0, $a0, 4
		addi $a1, $a1, -1
		j Q4_loop
	
	Q4_return:
	jr $ra


# Q3: 1 0 0 0 5 3 0 
main:

# IGNORE THIS STUFF

# QUESTION 1
la $a0, s1
addi $v0, $zero, 4
syscall

la $a0, arr1
addi $a1, $zero, 8
jal Q1

la $a0, arr1
addi $a1, $zero, 8
jal print_arr

		
# QUESTION 2

la $a0, s2
addi $v0, $zero, 4
syscall

la $a0, arr2
addi $a1, $zero, 8
jal Q2

la $a0, arr2
addi $a1, $zero, 8
jal print_arr

# QUESTION 3

la $a0, s3
addi $v0, $zero, 4
syscall

la $a0, arr3
addi $a1, $zero, 8
jal Q3

la $a0, arr3
addi $a1, $zero, 8
jal print_arr

# QUESTION 4

la $a0, s4
addi $v0, $zero, 4
syscall

la $a0, arr4
addi $a1, $zero, 8
jal Q4

la $a0, arr4
addi $a1, $zero, 8
jal print_arr
