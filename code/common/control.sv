module control (
	input logic clock, reset,
	output logic [6 : 0] stage);
	
	logic [6 : 0] next_stage;
	assign next_stage = {stage[5 : 0], stage[6]};
	
	always_ff @(posedge clock) begin
		if (reset)
			stage = 7'b1;
		else
			stage = next_stage;
	end
	
endmodule
