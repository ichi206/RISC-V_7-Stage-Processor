`include "../common/definitions.vh"


module instruction_memory #(parameter program_instructions, program_size)
(
	input logic clock, read,
	input word_address long_instruction_addr,
	
	output word instruction
);

	wire [`instruction_memory_bits - 3 : 0] instruction_word_addr =
		long_instruction_addr[`instruction_memory_bits - 1 : 2];
	
	word mem [0 : `instruction_memory_size - 1];
	
	initial
		$readmemb(program_instructions, mem, 0, program_size - 1);
	
	always_ff @(posedge clock)
	begin
		if (read)
			instruction = mem[instruction_word_addr];
	end

endmodule
