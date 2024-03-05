add x12, x11, x10
sub x7, x6, x5
jal ra, 255
addi x12, x12, 255
beq x1, x2, 252
bne x1, x2, 252
blt x1, x2, 252
bge x1, x2, 252
lb x1, 16(x2)
lw x1, 16(x2)
sb x1, 16(x2)
sw x1, 16(x2)
