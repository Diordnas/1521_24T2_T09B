# Print every third number from 24 to 42.

main:
	# x in $t0

main_loop_init:
	li	$t0, 24

main_loop_cond:
	bge	$t0, 42, main_loop_end

main_loop_body:
	move	$a0, $t0
	li	$v0, 1
	syscall

	li	$a0, '\n'
	li	$v0, 11
	syscall

main_loop_incr:
	add	$t0, $t0, 3
	b	main_loop_cond

main_loop_end:

	jr	$ra