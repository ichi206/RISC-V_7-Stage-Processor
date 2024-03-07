`include "../common/definitions.vh"


module data_memory
(
	input logic clock, write,
	input word long_addr,
	input logic [3 : 0] write_to,
	input word write_value,
	
	output word read_value
);

	byte memb3 [0 : `data_memory_size / 4 - 1];
	byte memb2 [0 : `data_memory_size / 4 - 1];
	byte memb1 [0 : `data_memory_size / 4 - 1];
	byte memb0 [0 : `data_memory_size / 4 - 1];
	
	logic write_delay;
	logic [3 : 0] write_to_delay;
	word long_addr_delay, write_value_delay;
	
	always_ff @(posedge clock) begin
		write_delay = write;
		write_to_delay = write_to;
		long_addr_delay = long_addr;
		write_value_delay = write_value;
	end
	
	wire [`data_memory_bits - 3 : 0] which_word = long_addr_delay[`data_memory_bits - 1 : 2];
	
	always_ff @(posedge clock)
	begin
		if (write_delay)
		begin
			if (write_to_delay[3])
				memb3[which_word] = write_value_delay[`byte3];
			if (write_to_delay[2])
				memb2[which_word] = write_value_delay[`byte2];
			if (write_to_delay[1])
				memb1[which_word] = write_value_delay[`byte1];
			if (write_to_delay[0])
				memb0[which_word] = write_value_delay[`byte0];
		end
		else
			read_value = {memb3[which_word], memb2[which_word], memb1[which_word], memb0[which_word]};
	end

endmodule
