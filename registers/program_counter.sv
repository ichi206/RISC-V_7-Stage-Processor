`include "../common/definitions.vh"


module program_counter
(
	input  logic clock, reset, jump,
	input  word_address jump_location,
	
	output word_address next_instruction
);

	always_ff @(posedge clock)
	begin
		if (reset)
			next_instruction = `BOOT_ADDRESS;
		if (jump)
			next_instruction = jump_location;
		else
			next_instruction += 4;
	end

endmodule
