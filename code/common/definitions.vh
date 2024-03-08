`ifndef definitions_file
`define definitions_file

`define instr_stage 1
`define decode_stage 2
`define exe_stage 3
`define data_stage 5
`define reg_stage 6

`define word_size 32
`define tag_size 5 // number of bits to distinguish 32 registers

`define data_memory_size 1024 // in bytes
`define data_memory_bits $clog2(`data_memory_size)

`define instruction_memory_size 1024
`define instruction_memory_bits $clog2(`instruction_memory_size)

`define BOOT_ADDRESS 32'd0 // address to boot to

typedef logic [`tag_size - 1 : 0] tag; // used to access registers
typedef logic [`word_size / 2 - 1 : 0] hword;
typedef logic [`word_size - 1 : 0] word;

`define byte3 31 : 24
`define byte2 23 : 16
`define byte1 15 : 8
`define byte0 7 : 0
`define hword0 31 : 16
`define hword1 15 : 0

`define opcode_reg    7'b0110011
`define opcode_imm    7'b0010011
`define opcode_jal    7'b1101111
`define opcode_jalr   7'b1100111
`define opcode_branch 7'b1100011
`define opcode_load   7'b0000011
`define opcode_store  7'b0100011

`define eq_mask 4'b0001
`define ne_mask 4'b0010
`define lt_mask 4'b0100
`define ge_mask 4'b1000
`define eq 0
`define ne 1
`define lt 2
`define ge 3

`define byte_mask  3'b001
`define hword_mask 3'b010
`define word_mask  3'b100
`define BYTE 0
`define HWORD 1
`define WORD 2

`define do_reg 0
`define do_imm 1
`define do_jal 2
`define do_jalr 3
`define do_branch 4
`define do_load 5
`define do_store 6
`define do_sub 7
`define write_rd 8
`define use_rs2 9
`define range_instrs 9 : 0

`define RS1 0
`define RS2 1

`endif
