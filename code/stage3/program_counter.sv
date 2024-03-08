`include "../common/definitions.vh"


module program_counter
(
	input logic clock, reset, stall, valid, jump, jalr,
	input word jump_offset,
	
	output logic do_flush,
	output word instruction_addr, ia_plus4
);

	logic do_flush_logic;
	word ia_plus4_logic, instruction_addr_logic;
	assign ia_plus4_logic = instruction_addr + 4;
	
	always_comb begin
		if (jump && valid) begin
			instruction_addr_logic = instruction_addr + jump_offset;
			do_flush_logic = 1;
		end
		else if (jalr && valid) begin
			instruction_addr_logic = jump_offset;
			do_flush_logic = 1;
		end
		else begin
			instruction_addr_logic = ia_plus4_logic;
			do_flush_logic = 0;
		end
	end
	
	always_ff @(posedge clock) begin
		if (reset) begin
			instruction_addr <= `BOOT_ADDRESS;
			do_flush <= 0;
		end
		else if (!stall) begin
			ia_plus4 <= ia_plus4_logic;
			instruction_addr <= instruction_addr_logic;
			do_flush <= do_flush_logic;
		end
	end

endmodule
