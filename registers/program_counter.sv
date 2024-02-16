`include "../common/definitions.vh"


module program_counter
(
	input logic clock, reset, write_back, jump,
	input word_address jump_location,
	
	output word_address next_instruction_addr
);

	always_ff @(posedge clock)
	begin
		if (reset)
			next_instruction_addr = `BOOT_ADDRESS;
		else if (write_back)
		begin
			if (jump)
				next_instruction_addr = jump_location;
			else
				next_instruction_addr += 4;
		end
	end

endmodule
