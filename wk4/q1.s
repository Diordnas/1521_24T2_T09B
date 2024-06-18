# sum 4 numbers using function calls

	.data
main_ra:
	.space 4

	.text

main:
	# result in $t0
main__prologue:
	push	$ra

main__body:
	li	$a0, 11		# result = sum4(11, 13, 17, 19)
	li	$a1, 13
	li	$a2, 17
	li	$a3, 19
	jal	sum4
	move	$t0, $v0

	move	$a0, $t0	# print int: result
	li	$v0, 1
	syscall

	li	$a0, '\n'	# pint har: '\n'
	li	$v0, 11
	syscall

main__epilogue:
	pop	$ra

	li	$v0, 0		# return 0
	jr	$ra

sum4:
# A function that adds four numbers together
# args:
#	$a0: a
#	$a1: b
#	$a2: c
#	$a3: d
# returns:
#	$v0: sum of a, b, c and d
# locals:
#	a in $t2
#	b in $t3
#	c in $t4
#	d in $t5
#	res1 in $t0
#	res2 in $t1
sum4__prologue:
	move	$t2, $a0
	move	$t3, $a1
	move	$t4, $a2
	move	$t5, $a3

	push	$ra

sum4__body:
	move	$a0, $t2	# res1 = sum2(a, b)
	move	$a1, $t3
	jal	sum2		
	move	$t0, $v0

	move	$a0, $t4	# res2 = sum2(c, d)
	move	$a1, $t5
	jal	sum2
	move	$t1, $v0

	move	$a0, $t0	# return sum2(res1, res2)
	move	$a1, $t1
	jal	sum2
	move	$v0, $v0

	pop	$ra
	jr	$ra

sum2:
# A function that adds two numbers together
# args:
#	$a0: x
#	$a1: y
# returns:
#	$v0: sum of x and y
sum2__body:
	add	$v0, $a0, $a1
	jr	$ra