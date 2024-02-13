`include "definitions.sv"


module program_counter
(
	input  logic clock, reset, branch,
	input  word_address branch_location,
	
	output word_address next_instruction
);

	always_ff @(posedge clock)
	begin
		if (reset)
			next_instruction = `BOOT_ADDRESS;
		else if (branch)
			next_instruction = branch_location;
		else
			next_instruction += 4;
	end

endmodule
