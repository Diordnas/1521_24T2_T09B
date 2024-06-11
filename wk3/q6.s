# A simple program that adds 42 to each element of an array

N_SIZE = 10

main:
	# i in $t0
	# numbers[i] in $t1
	# temp array calc in $t2

modify_array_loop_init:
	li	$t0, 0			# int i = 0
modify_array_loop_cond:			# while i < N_SIZE {
	bge	$t0, N_SIZE, modify_array_loop_end
modify_array_loop_body:
	mul	$t2, $t0, 4		# array index is
	lw	$t1, numbers($t2)	# numbers + (i * 4)

	bge	$t1, 0, number_is_positive

	add	$t1, $t1, 42		# numbers[i] += 42
	sw	$t1, numbers($t2)

number_is_positive:

modify_array_loop_step:
	add	$t0, $t0, 1		# i++
	b	modify_array_loop_cond	# }
modify_array_loop_end:

	jr	$ra			# return

	.data
numbers:
	.word 0, 1, 2, -3, 4, -5, 6, -7, 8, 9