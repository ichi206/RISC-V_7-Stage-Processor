module flush (
	input logic clock, do_flush,
	output logic valid);
	
	logic flush2, flush3;
	
	always_ff @(posedge clock)
		flush2 <= do_flush;
	
	always_ff @(posedge clock)
		flush3 <= flush2;
	
	wire valid_logic = ~(do_flush | flush2 | flush3);
	
	always_ff @(posedge clock)
		valid <= valid_logic;
	
endmodule
