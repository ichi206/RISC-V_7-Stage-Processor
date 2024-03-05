boot:
	addi sp, zero, 1024
	addi a0, zero, 6
	addi s0, zero, 2
	addi ra, zero, 84
fib:
	addi sp, sp, -8
	sw ra, 4(sp)
	blt a0, s0, 44  # fib(n < 2) = 1
recursive:
	addi a0, a0, -1 # calc n-1
	sb a0, 1(sp)    # put n-1 on stack
	jal ra, -20     # calc fib(n-1)
	sb a0, 0(sp)    # put fib(n-1) on stack
	lb a0, 1(sp)
	addi a0, a0, -1 # calc n-2
	jal ra, -36     # calc fib(n-2)
	lb t0, 0(sp)
	add a0, a0, t0  # fib(n) = fib(n-1) + fib(n-2)
	jal zero, 8
base:
	addi a0, zero, 1
end_fib:
	lw ra, 4(sp)
	addi sp, sp, 8
	jalr zero, ra, 0
halt:
	jalr zero, zero, 84