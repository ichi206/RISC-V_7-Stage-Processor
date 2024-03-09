module flush (
	input logic clock, reset, stall, do_flush,
	output logic valid);
	
	logic flush2, flush3;
	
	always_ff @(posedge clock)
		flush2 <= do_flush;
	
	always_ff @(posedge clock)
		flush3 <= flush2;
	
	assign valid = ~(reset | stall | do_flush | flush2 | flush3);
	
endmodule
