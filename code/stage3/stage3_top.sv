`include "../common/definitions.vh"


module stage3_top (
	input logic clock, reset, stall, valid,
	input logic [`range_instrs] instr_type,
	input logic [3 : 0] branch_type,
	input word rs1_val, rs2_val, imm,
	
	output logic flush,
	output word instruction_addr, jal_addr, eval);
	
	wire add_or_sub = instr_type[`do_reg] & instr_type[`do_sub] | instr_type[`do_branch];
	wire use_rs2 = instr_type[`do_reg] | instr_type[`do_branch];
	word arg2;
	assign arg2 = use_rs2 ? rs2_val : imm;
	logic [3 : 0] compare_async;
	word eval_async;
	
	alu arith (.clock, .stall, .add_or_sub,
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
		.jump_offset,
		.instruction_addr, .ia_plus4(jal_addr));
	
endmodule
