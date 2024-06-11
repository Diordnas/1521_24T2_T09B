# A simple program that will read 10 numbers into an array

N_SIZE = 10

main:
	# i in $t0

array_loop_init:
	li	$t0, 0
array_loop_cond:
	bge	$t0, N_SIZE, array_loop_end
array_loop_body:
	mul	$t2, $t0, 4
	lw	$t1, numbers($t2)

	move	$a0, $t1
	li	$v0, 1		# mode 1: print_int
	syscall

	li	$a0, '\n'
	li	$v0, 11
	syscall

array_loop_step:
	add	$t0, $t0, 1
	b	array_loop_cond
array_loop_end:
	jr	$ra

	.data
numbers:
	.word 0, 1, 5, 3, 4, 5, 6, 7, 8, 9