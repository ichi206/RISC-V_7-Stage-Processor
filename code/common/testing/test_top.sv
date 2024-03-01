module test_top ();

	logic clock, reset;
	initial begin
		clock = 1;
		forever #50 clock = ~clock;
	end
	
	top #("fib.mif") cpu (.*);
	
	initial begin
		reset = 1;
		@(posedge clock)
		reset = 0;
		repeat(1500) @(posedge clock);
		$stop;
	end
	
endmodule
