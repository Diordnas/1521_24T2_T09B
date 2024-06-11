# A simple program that will read 10 numbers into an array

N_SIZE = 10

main:
	# i in $t0

array_loop_init:
	li	$t0, 0
array_loop_cond:
	bge	$t0, N_SIZE, array_loop_end
array_loop_body:
	# scan in somerthing into array??
	li	$v0, 5		# mode 5: read_int
	syscall
	move	$t1, $v0

	mul	$t2, $t0, 4
	sw	$t1, numbers($t2)

array_loop_step:
	add	$t0, $t0, 1
	b	array_loop_cond
array_loop_end:
	jr	$ra

	.data
numbers:
	.space 4 * N_SIZE