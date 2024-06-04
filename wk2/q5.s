# Prints a right - angled triangle of asterisks, 10 rows high.

main:
	# i in $t0
	# j in $t1

row_loop_init:
	li	$t0, 1			# int i = 1

row_loop_cond:
	bgt	$t0, 10, row_loop_end	# while i <= 10

row_loop_body:
col_loop_init:
	li	$t1, 0			# int j = 0

col_loop_cond:
	bge	$t1, $t0, col_loop_end	# while j < i

col_loop_body:
	li	$a0, '*'		# printf("*")
	li	$v0, 11			# mode 11: print_char
	syscall

col_loop_step:
	add	$t1, $t1, 1		# j += 1
	b	col_loop_cond		# go to top of loop

col_loop_end:
	li	$a0, '\n'		# printf("\n")
	li	$v0, 11			# mode 11: print_char
	syscall

row_loop_step:
	add	$t0, $t0, 1		# i += 1
	b	row_loop_cond		# go to top of loop

row_loop_end:
	jr	$ra			# return