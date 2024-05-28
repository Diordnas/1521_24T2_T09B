# goal code:
# #include <stdio.h>
# 
# int main(void) {
#     int x, y;
# 
#     printf("Enter a number: ");
#     scanf("%d", &x);
# 
#     y = x * x;
# 
#     printf("%d\n", y);
# 
#     return 0;
# }

main:
	la	$a0, prompt_str
	li	$v0, 4		# mode 4: print_str
	syscall			# printf("Enter a number: ");

	li	$v0, 5		# mode 5: read_int
	syscall			# scanf("%d", &x);
	move	$t0, $v0

	mul	$t1, $t0, $t0	# y = x * x

	move	$a0, $t1
	li	$v0, 1		# mode 1: print_int
	syscall			# printf("%d", y)

	li	$a0, '\n'
	li	$v0, 11		# mode 11: print_char
	syscall			# printf("\n")

	jr	$ra		# return

	.data			# data section of memory
prompt_str:
	.asciiz "Enter a number: "