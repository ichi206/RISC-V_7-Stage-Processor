`include "../common/definitions.vh"


module program_counter
(
	input  logic clock, reset, jump,
	input  word_address jump_location,
	
	output word_address next_instruction_addr
);

	always_ff @(posedge clock)
	begin
		if (reset)
			next_instruction_addr = `BOOT_ADDRESS;
		if (jump)
			next_instruction_addr = jump_location;
		else
			next_instruction_addr += 4;
	end

endmodule
