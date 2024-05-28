main:
	# x in $t0

	la	$a0, prompt_str		# printf("Enter a number: )"
	li	$v0, 4			# mode 4: print_string
	syscall

	li	$v0, 5			# scanf("%d", x)
	syscall				# mode 5: read_int
	move	$t0, $v0

	ble	$t0, 100, if_false
	bge	$t0, 1000, if_false
	b	if_true

if_true:
	la	$a0, medium_str		# printf("Enter a number: )"
	li	$v0, 4			# mode 4: print_string
	syscall

	b	if_end

if_false:
	la	$a0, small_big_str		# printf("Enter a number: )"
	li	$v0, 4			# mode 4: print_string
	syscall

if_end:

	jr	$ra

	.data
prompt_str:
	.asciiz "Enter a number: "
small_big_str:
	.asciiz "small/big\n"
medium_str:
	.asciiz "medium\n"