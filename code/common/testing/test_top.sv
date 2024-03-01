module test_top ();

	logic clock, reset;
	initial begin
		clock = 1;
		forever #50 clock = ~clock;
	end
	
	top #("instructions.mif") cpu (.*);
	
	initial begin
		reset = 1;
		@(posedge clock)
		reset = 0;
		repeat(50) @(posedge clock);
		$stop;
	end
	
endmodule
