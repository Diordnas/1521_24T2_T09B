main:
	# i in $t0
	# j in $t1

loop_row_init:
	li	$t0, 1

loop_row_cond:
	bgt	$t0, 10, loop_row_end

loop_row_body:

loop_col_init:
	li	$t1, 0

loop_col_cond:
	bge	$t1, $t0, loop_col_end

loop_col_body:
	li	$a0, '*'
	li	$v0, 11
	syscall

loop_col_incr:
	add	$t1, $t1, 1
	b	loop_col_cond

loop_col_end:

	li	$a0, '\n'
	li	$v0, 11
	syscall

loop_row_incr:
	add	$t0, $t0, 1
	b	loop_row_cond

loop_row_end:

	li	$v0, 0
	jr	$ra