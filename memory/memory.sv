`include "../common/definitions.sv"


module memory
(
	input  word_address addr,
	input  load_type how_much,
	
	output word content
);

	logic [] effective_address

	reg [7 : 0] mem_b0 [0 : `memory_size / 4 - 1];
	reg [7 : 0] mem_b1 [0 : `memory_size / 4 - 1];
	reg [7 : 0] mem_b2 [0 : `memory_size / 4 - 1];
	reg [7 : 0] mem_b3 [0 : `memory_size / 4 - 1];
	
	always_comb
	begin
		case (how_much)
			
			BYTE:
				content = 0; // TODO
			
			HALFWORD:
				content = 0; // TODO
			
			WORD:
				content = {mem_b0, mem_b1, mem_b2, mem_b3};
		
		endcase
	end

endmodule
