`include "../common/definitions.vh"


module data_memory
(
	input logic clock, write, read,
	input word long_addr,
	input logic [3 : 0] write_to,
	input word write_value,
	
	output word read_value
);

	wire [`data_memory_bits - 3 : 0] which_word = long_addr[`data_memory_bits - 1 : 2];

	byte memb3 [0 : `data_memory_size / 4 - 1];
	byte memb2 [0 : `data_memory_size / 4 - 1];
	byte memb1 [0 : `data_memory_size / 4 - 1];
	byte memb0 [0 : `data_memory_size / 4 - 1];
	
	always_ff @(posedge clock)
	begin
		if (write)
		begin
			if (write_to[3])
				memb3[which_word] = write_value[`byte3];
			if (write_to[2])
				memb2[which_word] = write_value[`byte2];
			if (write_to[1])
				memb1[which_word] = write_value[`byte1];
			if (write_to[0])
				memb0[which_word] = write_value[`byte0];
		end
		else if (read)
			read_value = {memb3[which_word], memb2[which_word], memb1[which_word], memb0[which_word]};
	end

endmodule
