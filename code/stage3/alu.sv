`include "../common/definitions.vh"


module alu(
	input logic clock, stall, add_or_sub,
	input word arg1, arg2,
	
	output logic [3 : 0] compare_async,
	output word eval_async, eval);
	
	assign eval_async = add_or_sub ? arg1 - arg2 : arg1 + arg2;
	
	assign compare_async[`eq] = eval_async == 0;
	assign compare_async[`ne] = ~compare_async[`eq];
	assign compare_async[`lt] = eval_async[31];
	assign compare_async[`ge] = ~compare_async[`lt];
	
	always_ff @(posedge clock) begin
		if (!stall)
			eval <= eval_async;
	end
	
endmodule
