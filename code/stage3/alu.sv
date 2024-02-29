`include "../common/definitions.vh"


module alu(
	input logic clock, use_rs2, add_or_sub,
	input word rs1, rs2, imm,
	
	output logic [3 : 0] compare,
	output word eval);
	
	word arg2;
	assign arg2 = use_rs2 ? rs2 : imm;
	
	word add_output, sub_output;
	assign add_output = rs1 + arg2;
	assign sub_output = rs1 - arg2;
	
	logic [3 : 0] compare_logic;
	assign compare_logic[`eq] = rs1 == arg2;
	assign compare_logic[`ne] = ~compare_logic[`eq];
	assign compare_logic[`lt] = sub_output[31];
	assign compare_logic[`ge] = ~compare_logic[`lt];
	
	word eval_logic;
	assign eval_logic = add_or_sub ? sub_output : add_output;
	
	always_ff @(posedge clock) begin
		compare = compare_logic;
		eval = eval_logic;
	end
	
endmodule
