`include "../common/definitions.vh"


module memory #(parameter b0_mif, b1_mif, b2_mif, b3_mif, mif_size)
(
	input word_address long_addr,
	input load_type how_much,
	
	output word content
);

	wire [`memory_bits - 1 : 0] addr = long_addr[`memory_bits - 1 : 0];
	wire [`memory_bits - 3 : 0] word_addr = addr[`memory_bits - 1 : 2];

	byte mem_b0 [0 : `memory_size / 4 - 1];
	byte mem_b1 [0 : `memory_size / 4 - 1];
	byte mem_b2 [0 : `memory_size / 4 - 1];
	byte mem_b3 [0 : `memory_size / 4 - 1];

	initial
	begin
		$readmemb(b0_mif, mem_b0, 0, mif_size - 1);
		$readmemb(b1_mif, mem_b1, 0, mif_size - 1);
		$readmemb(b2_mif, mem_b2, 0, mif_size - 1);
		$readmemb(b3_mif, mem_b3, 0, mif_size - 1);
	end
	
	always_comb 
	begin
		case (how_much)
			
			`BYTE:
				content = 0; // TODO
			
			`HALFWORD:
				content = 0; // TODO
			
			`WORD:
				content = {mem_b0[word_addr], mem_b1[word_addr], mem_b2[word_addr], mem_b3[word_addr]};
		
		endcase
	end

endmodule
