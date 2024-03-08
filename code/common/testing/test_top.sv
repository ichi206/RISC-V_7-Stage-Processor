module test_top ();

	logic clock, reset;
	initial begin
		clock = 1;
		forever #50 clock = ~clock;
	end
	
	logic [7 : 0] display;
	
	top #("../../../memfiles/fib.mif") cpu (.*);
	
	initial begin
		reset = 1;
		repeat(5) @(posedge clock);
		reset = 0;
		repeat(600) @(posedge clock);
		$stop;
	end
	
endmodule
