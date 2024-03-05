`include "../../common/definitions.vh"


module simple_add_test ();

	logic clock;
	initial begin
		clock = 1;
		forever #50ns clock = ~clock;
	end
	
	logic register_writeback;
	tag rs1, rs2, rd;
	word rs1_read, rs2_read;
	logic add;
	word rd_value;
	assign rd_value = add ? rs1_read + rs2_read : 1;
	
	registers test_r (.*);
	
	logic reset, jump;
	word jump_offset, instruction_addr;
	
	program_counter test_pc (.*);
	
	initial
	begin
		register_writeback = 0; add = 0;
		@(posedge clock);
		reset = 1; jump = 0; register_writeback = 1;
		rs1 = 0; rs2 = 0; rd = 0;
		@(posedge clock);
		reset = 0; rd = 1;
		@(posedge clock);
		rs2 = 1; rd = 2; add = 1;
		repeat(2) @(posedge clock); // 2 cycles to acount for add
		
		repeat(10)
		begin
			rs1++; rs2++; rd++;
			repeat(2) @(posedge clock);
		end
		
		register_writeback = 0;
		jump_offset = 256;
		jump = 1;
		@(posedge clock);
		jump = 0;
		repeat(3) @(posedge clock);
		
		$stop;
	end

endmodule
