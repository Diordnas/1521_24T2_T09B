main:
	lw	$t0, global_var($0)

	move	$a0, $t0
	li	$v0, 1
	syscall

	add	$t0, $t0, 10
	sw	$t0, global_var($0)

	jr	$ra

	.data
global_var:
	.word 42