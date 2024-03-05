`include "../common/definitions.vh"


module program_counter
(
	input logic clock, reset, is_writeback_stage, jump, jalr,
	input word jump_offset,
	output word instruction_addr, next_instruction_addr
);

	assign next_instruction_addr = instruction_addr + 4;
	word instruction_addr_logic;
	
	always_comb begin
		if (jump)
			instruction_addr_logic = instruction_addr + jump_offset;
		else if (jalr)
			instruction_addr_logic = jump_offset;
		else
			instruction_addr_logic = next_instruction_addr;
	end
	
	always_ff @(posedge clock) begin
		if (reset)
			instruction_addr = `BOOT_ADDRESS;
		else if (is_writeback_stage)
			instruction_addr = instruction_addr_logic;
	end

endmodule
