`include "../../common/definitions.vh"


module simple_add_test ();

	logic clock;
	
	initial
	begin
		clock = 1;
		forever #50ns clock = ~clock;
	end
	
	logic write_to_rd;
	tag rs1, rs2, rd;
	word rs1_value, rs2_value;
	logic add;
	word rd_value;
	assign rd_value = add ? rs1_value + rs2_value : 1;
	
	registers test_r (.*);
	
	logic reset, jump;
	word_address jump_location, next_instruction_addr;
	
	program_counter test_pc (.*);
	
	initial
	begin
		write_to_rd = 0; add = 0;
		@(posedge clock);
		reset = 1; jump = 0; write_to_rd = 1;
		rs1 = 0; rs2 = 0; rd = 0;
		@(posedge clock);
		reset = 0; rd = 1;
		@(posedge clock);
		rs2 = 1; rd = 2; add = 1;
		@(posedge clock);
		
		repeat(10)
		begin
			rs1++; rs2++; rd++;
			@(posedge clock);
		end
		
		write_to_rd = 0;
		jump_location = 4;
		jump = 1;
		@(posedge clock);
		jump = 0;
		repeat(3) @(posedge clock);
		
		$stop;
	end

endmodule
