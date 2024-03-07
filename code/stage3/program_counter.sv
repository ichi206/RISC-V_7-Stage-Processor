`include "../common/definitions.vh"


module program_counter
(
	input logic clock, reset, stall, jump, jalr,
	input word jump_offset,
	output word instruction_addr, ia_plus4
);

	word ia_plus4_logic, instruction_addr_logic;
	assign ia_plus4_logic = instruction_addr + 4;
	
	always_comb begin
		if (jump)
			instruction_addr_logic = instruction_addr + jump_offset;
		else if (jalr)
			instruction_addr_logic = jump_offset;
		else
			instruction_addr_logic = ia_plus4_logic;
	end
	
	always_ff @(posedge clock) begin
		if (reset)
			instruction_addr = `BOOT_ADDRESS;
		else if (!stall) begin
			ia_plus4 = ia_plus4_logic;
			instruction_addr = instruction_addr_logic;
		end
	end

endmodule
