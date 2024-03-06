`include "../common/definitions.vh"


module stage3_top (
	input logic clock, reset, is_exe_stage,
	input logic [`range_instrs] instr_type,
	input logic [3 : 0] branch_type,
	input word rs1_val, rs2_val, imm,
	
	output word instruction_addr, ia_plus4, eval);
	
	logic [3 : 0] compare_async;
	word eval_async;
	
	alu arith (.*);
	
	wire take_branch =
		branch_type[`eq] & compare_async[`eq] |
		branch_type[`ne] & compare_async[`ne] |
		branch_type[`lt] & compare_async[`lt] |
		branch_type[`ge] & compare_async[`ge];
	
	wire jump = instr_type[`do_jal] | (instr_type[`do_branch] & take_branch);
	wire jalr = instr_type[`do_jalr];
	
	word jump_offset;
	assign jump_offset = instr_type[`do_jalr] ? eval_async : imm;
	
	program_counter pc (.*);
	
endmodule
