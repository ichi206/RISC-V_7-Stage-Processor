`include "../common/definitions.vh"


module instruction_memory #(parameter program_instructions)
(
	input logic clock, reset, is_instr_stage,
	input word long_instruction_addr,
	
	output word instruction
);

	wire [`instruction_memory_bits - 3 : 0] instruction_word_addr =
		long_instruction_addr[`instruction_memory_bits - 1 : 2];
	
	word mem [0 : `instruction_memory_size / 4 - 1];
	
	initial
		$readmemb(program_instructions, mem);
	
	always_ff @(posedge clock)
	begin
		if (!reset && is_instr_stage)
			instruction = mem[instruction_word_addr];
	end

endmodule
