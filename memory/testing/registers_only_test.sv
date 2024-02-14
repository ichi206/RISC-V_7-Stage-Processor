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
	word_address jump_location, next_instruction;
	
	program_counter test_pc (.*);

	word_address long_addr;
	assign long_addr = next_instruction;
	load_type how_much;
	assign how_much = `WORD;
	word content;
	
	memory #(
		"b0_registers_only.mif",
		"b1_registers_only.mif",
		"b2_registers_only.mif",
		"b3_registers_only.mif", 19)
		test_mem (.*);
	
	logic read_from_mem;
	assign rs1 = read_from_mem ? content[12 : 8]  : 0;
	assign rs2 = read_from_mem ? content[20 : 16] : 0;
	assign rd  = read_from_mem ? content[28 : 24] : 1;
	
	initial
	begin
		add = 0; read_from_mem = 0; write_to_rd = 1;
		@(posedge clock);
		reset = 1;
		@(posedge clock);
		reset = 0; read_from_mem = 1; add = 1;
		repeat(19) @(posedge clock); // read through all instructions
		$stop;
	end

endmodule
