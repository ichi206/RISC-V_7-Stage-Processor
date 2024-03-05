`include "../../common/definitions.vh"


module registers_only_test ();

	logic clock;
	
	initial
	begin
		clock = 1;
		forever #50ns clock = ~clock;
	end
	
	logic is_writeback_stage, write_rd;
	tag rs1, rs2, rd;
	word rs1_read, rs2_read;
	word rd_value;
	
	registers test_r (.*);
	
	logic reset, jump;
	word jump_offset, instruction_addr;
	
	program_counter test_pc (.*);

	word long_instruction_addr;
	assign long_instruction_addr = instruction_addr;
	//load_type how_much;
	//assign how_much = `WORD;
	word instruction;
	
	instruction_memory #("registers_only.mif") test_isntr_mem (.*);
	
	logic read_from_mem;
	
	initial
	begin
		is_writeback_stage = 1; write_rd = 1;
		rd = 1; rd_value = 1;
		@(posedge clock);
		reset = 1; is_writeback_stage = 0; write_rd = 0;
		@(posedge clock);
		reset = 0;
		repeat(20) begin
			@(posedge clock); // instr fetch
			rs1 = instruction[12 : 8];
			rs2 = instruction[20 : 16];
			rd  = instruction[28 : 24];
			@(posedge clock); // instr decode
			@(posedge clock); // alu
			rd_value = rs1_read + rs2_read;
			@(posedge clock); // data fetch
			is_writeback_stage = 1; write_rd = 1;
			@(posedge clock); // writeback
			is_writeback_stage = 0; write_rd = 0;
		end
		$stop;
	end

endmodule
