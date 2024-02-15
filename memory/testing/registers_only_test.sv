`include "../../common/definitions.vh"


module registers_only_test ();

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

	logic read;
	word_address long_instruction_addr;
	assign long_instruction_addr = next_instruction_addr;
	//load_type how_much;
	//assign how_much = `WORD;
	word instruction;
	
	instruction_memory #("registers_only.mif", 19) test_isntr_mem (.*);
	
	logic read_from_mem;
	assign rs1 = read ? instruction[12 : 8]  : 0;
	assign rs2 = read ? instruction[20 : 16] : 0;
	assign rd  = read ? instruction[28 : 24] : 1;
	
	initial
	begin
		add = 0; read = 0; write_to_rd = 1;
		@(posedge clock);
		reset = 1;
		@(posedge clock);
		reset = 0; read = 1; add = 1;
		repeat(20) @(posedge clock); // read through all instructions
		$stop;
	end

endmodule
