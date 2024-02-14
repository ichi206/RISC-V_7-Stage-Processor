`include "../common/definitions.sv"


module memory
(
	input  word_address long_addr,
	input  load_type how_much,
	
	output word content
);

	wire [`memory_bits - 1 : 0] addr = long_addr[`memory_bits - 1 : 0];
	wire [`memory_bits - 3 : 0] word_addr = addr[`memory_bits - 1 : 2];

	byte mem_b0 [0 : `memory_size / 4 - 1];
	byte mem_b1 [0 : `memory_size / 4 - 1];
	byte mem_b2 [0 : `memory_size / 4 - 1];
	byte mem_b3 [0 : `memory_size / 4 - 1];
	
	always_comb 
	begin
		case (how_much)
			
			BYTE:
				content = 0; // TODO
			
			HALFWORD:
				content = 0; // TODO
			
			WORD:
				content = {mem_b0[word_addr], mem_b1[word_addr], mem_b2[word_addr], mem_b3[word_addr]};
		
		endcase
	end

endmodule
