`include "../common/definitions.vh"


module alu(
	input logic clock,
	input logic [`range_instrs] instr_type,
	input word rs1_val, rs2_val, imm,
	
	output logic [3 : 0] compare_async,
	output word eval_async);
	
	wire use_rs2 = instr_type[`do_reg] | instr_type[`do_branch];
	word arg2;
	assign arg2 = use_rs2 ? rs2_val : imm;
	
	word add_output, sub_output;
	assign add_output = rs1_val + arg2;
	assign sub_output = rs1_val - arg2;
	
	assign compare_async[`eq] = rs1_val == arg2;
	assign compare_async[`ne] = ~compare_async[`eq];
	assign compare_async[`lt] = sub_output[31];
	assign compare_async[`ge] = ~compare_async[`lt];
	
	assign eval_async = instr_type[`add_or_sub] ? sub_output : add_output;
	
endmodule
