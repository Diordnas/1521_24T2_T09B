

	.data			# describe the data section of memory
a:	.word	42		# int a = 42;
b:	.space	4		# int b;
c:	.asciiz	"abcde"		# char *c = "abcde";
	.align 	2		# 
d: 	.byte	1, 2, 3, 4	# char d[4] = {1, 2, 3, 4};
e: 	.word	1, 2, 3, 4	# int e[4] = {1, 2, 3, 4};
f:	.space	1		# char f;