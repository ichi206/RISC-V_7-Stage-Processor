`include "definitions.vh"


module top (input logic clock, reset);

	logic [4 : 0] stage;
	control c (.*);

	word long_instruction_addr, instruction;
	
	instruction_memory #("../common/program.mif") instrs (.*);
	
	logic [`range_instrs] instr_type;
	logic [3 : 0] branch_type;
	logic [2 : 0] load_type;
	tag rs1_async, rs2_async, rd;
	word imm;
	
	decoder dec (
		.clock,
		.line(instruction),
		.instr_type, .branch_type, .load_type,
		.rs1_async, .rs2_async, .rd,
		.imm);
	
	word rs1_read, rs2_read;
	logic [3 : 0] compare;
	word eval;
	
	alu arith (
		.clock,
		.use_rs2(instr_type[`do_reg]),
		.add_or_sub(instr_type[`add_or_sub]),
		.rs1(rs1_read), .rs2(rs2_read), .imm,
		.compare, .eval);
	
	logic mem_write, mem_read;
	word memory_read_value;
	
	data_memory_top mem (
		.clock, .is_data_stage(stage[`data_stage]),
		.instr_type, .load_type,
		.long_addr(eval), .write_value(rs1_read),
		.read_value(memory_read_value));
	
	stage5_top s5 (
		.clock, .reset, .sign_extend(1'b0), .is_writeback_stage(stage[`reg_stage]),
		.instr_type,
		.rs1(rs1_async), .rs2(rs2_async), .rd,
		.branch_type, .compare,
		.alu_output(eval), .memory_read_value, .jump_offset(imm),
		.load_type,
		.instruction_addr(long_instruction_addr), .rs1_read, .rs2_read);
	
endmodule
