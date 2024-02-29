`include "../common/definitions.vh"


module program_counter
(
	input logic clock, reset, is_writeback_stage, jump,
	input word jump_offset,
	output word instruction_addr
);

	word next_instruction_addr;
	
	always_comb
	begin
		if (jump)
			next_instruction_addr = instruction_addr + jump_offset;
		else
			next_instruction_addr = instruction_addr + 4;
	end
	
	always_ff @(posedge clock)
	begin
		if (reset)
			instruction_addr = `BOOT_ADDRESS;
		else if (is_writeback_stage)
			instruction_addr = next_instruction_addr;
	end

endmodule
