module control (
	input logic clock, reset,
	output logic [4 : 0] stage);
	
	logic [4 : 0] next_stage;
	assign next_stage = {stage[3 : 0], stage[4]};
	
	always_ff @(posedge clock) begin
		if (reset)
			stage = 5'b1;
		else
			stage = next_stage;
	end
	
endmodule
