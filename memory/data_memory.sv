`include "../common/definitions.vh"


module data_memory
(
	input logic clock, read, write,
	input word_address long_addr,
	input word write_value,
	input load_type how_much,
	
	output word read_value
);

	wire [`data_memory_bits - 1 : 0] addr = long_addr[`data_memory_bits - 1 : 0];
	wire [`data_memory_bits - 3 : 0] word_addr = addr[`data_memory_bits - 1 : 2];

	byte mem_b0 [0 : `data_memory_size / 4 - 1];
	byte mem_b1 [0 : `data_memory_size / 4 - 1];
	byte mem_b2 [0 : `data_memory_size / 4 - 1];
	byte mem_b3 [0 : `data_memory_size / 4 - 1];
	
	always_ff @(posedge clock) // read logic
	begin
		if (read)
		begin
			case (how_much)
				
				`BYTE:
				begin
					case (addr[1 : 0])
						'b00:
							read_value = {24'b0, mem_b0[word_addr]};
						'b01:
							read_value = {24'b0, mem_b1[word_addr]};
						'b10:
							read_value = {24'b0, mem_b2[word_addr]};
						'b11:
							read_value = {24'b0, mem_b3[word_addr]};
					endcase
				end
				
				`HALFWORD:
					read_value = !addr[1] ?
						{16'b0, mem_b0[word_addr], mem_b1[word_addr]} :
						{16'b0, mem_b2[word_addr], mem_b3[word_addr]};
				
				`WORD:
					read_value = {mem_b0[word_addr], mem_b1[word_addr], mem_b2[word_addr], mem_b3[word_addr]};
			
			endcase
		end
	end
	
	always_ff @(posedge clock) // write logic
	begin
		if (write && !read)
		begin
			case (how_much)
			
				`BYTE:
				begin
					case (addr[1 : 0])
						'b00:
							mem_b0[word_addr] = write_value[7 : 0];
						'b01:
							mem_b1[word_addr] = write_value[7 : 0];
						'b10:
							mem_b2[word_addr] = write_value[7 : 0];
						'b11:
							mem_b3[word_addr] = write_value[7 : 0];
					endcase
				end
				
				`HALFWORD:
				begin
					if (!addr[1])
					begin
						mem_b0[word_addr] = write_value[15 : 8];
						mem_b1[word_addr] = write_value[7 : 0];
					end
					else
					begin
						mem_b2[word_addr] = write_value[15 : 8];
						mem_b3[word_addr] = write_value[7 : 0];
					end
				end
				
				`WORD:
				begin
					mem_b0[word_addr] = write_value[31 : 24];
					mem_b1[word_addr] = write_value[23 : 16];
					mem_b2[word_addr] = write_value[15 : 8];
					mem_b3[word_addr] = write_value[7 : 0];
				end
				
			endcase
		end
	end
	
endmodule
