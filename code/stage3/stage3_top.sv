`include "../common/definitions.vh"


module stage3_top (
	input logic clock, reset, stall, valid,
	input logic [1 : 0] bypass,
	input logic [`range_instrs] instr_type,
	input logic [3 : 0] branch_type,
	input word s3_instruction_addr, rs1_read, rs2_read, imm, rs1_bypass_value, rs2_bypass_value,
	
	output logic do_flush,
	output word s1a_instruction_addr, jal_addr, eval);
	
	word rs1_val, rs2_val;
	assign rs1_val = bypass[`RS1] ? rs1_bypass_value : rs1_read;
	assign rs2_val = bypass[`RS2] ? rs2_bypass_value : rs2_read;
	
	wire add_or_sub = instr_type[`do_reg] & instr_type[`do_sub] | instr_type[`do_branch];
	wire use_rs2 = instr_type[`do_reg] | instr_type[`do_branch];
	word arg2;
	assign arg2 = use_rs2 ? rs2_val : imm;
	logic [3 : 0] compare_async;
	word eval_async;
	
	alu arith (
		.clock, .stall, .add_or_sub,
		.arg1(rs1_val), .arg2,
		.compare_async,
		.eval_async, .eval);
	
	wire take_branch =
		branch_type[`eq] & compare_async[`eq] |
		branch_type[`ne] & compare_async[`ne] |
		branch_type[`lt] & compare_async[`lt] |
		branch_type[`ge] & compare_async[`ge];
	
	wire jump = instr_type[`do_jal] | instr_type[`do_branch] & take_branch;
	wire jalr = instr_type[`do_jalr];
	
	word jump_offset;
	assign jump_offset = instr_type[`do_jalr] ? eval_async : imm;
	
	program_counter pc (
		.clock, .reset, .stall, .valid, .jump, .jalr,
		.s3_instruction_addr, .jump_offset,
		.do_flush,
		.s1a_instruction_addr, .ia_plus4(jal_addr));
	
endmodule
