# This program prints out a danish flag, by
# looping through the rows and columns of the flag.
# Each element inside the flag is a single character.
# (i.e., 1 byte).
#
# (Dette program udskriver et dansk flag, ved at
# sløjfe gennem rækker og kolonner i flaget.)

NUM_COLS = 12
NUM_ROWS = 6

main:
	# row in $t0
	# col in $t1
	# flag[row][col] in $t2
	# address calculation in ...

row_loop_init:
	li	$t0, 0
row_loop_cond:
	bge	$t0, NUM_ROWS, row_loop_end

row_loop_body:

col_loop_init:
	li	$t1, 0

col_loop_cond:
	bge	$t1, NUM_COLS, col_loop_end

col_loop_body:
	# flag + 1((row * num_cols) + col)
					# address is = flag
	mul	$t3, $t0, NUM_COLS	# + (row * num_cols)
	add	$t3, $t3, $t1		# + col
	lb	$t2, flag($t3)

	move	$a0, $t2
	li	$v0, 11
	syscall

col_loop_step:
	add	$t1, $t1, 1
	b	col_loop_cond
col_loop_end:
	li	$a0, '\n'
	li	$v0, 11
	syscall

row_loop_step:
	add	$t0, $t0, 1
	b	row_loop_cond
row_loop_end:

	jr	$ra

	.data
flag:
	.ascii ".....##....."
	.ascii ".....##....."
	.ascii "############"
	.ascii "############"
	.ascii ".....##....."
	.ascii ".....##....."