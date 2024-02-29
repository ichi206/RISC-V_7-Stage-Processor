`include "../common/definitions.vh"


module program_counter
(
	input logic clock, reset, register_writeback, jump,
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
		else if (register_writeback)
			instruction_addr = next_instruction_addr;
	end

endmodule
