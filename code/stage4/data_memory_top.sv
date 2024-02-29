`include "../common/definitions.vh"


module data_memory_top
(
	input logic clock, write, read,
	input word long_addr,
	input word write_value,
	input logic [2 : 0] load_type,
	
	output word read_value
);

	logic [3 : 0] write_to;
	word true_write_value;

	data_memory dm
	(
		.clock, .write, .read,
		.long_addr,
		.write_to,
		.write_value(true_write_value),
		
		.read_value
	);
	
	data_memory_write_interface dmwi
	(
		.long_addr,
		.register_write_value(write_value),
		.load_type,
		
		.write_to,
		.true_write_value
	);

endmodule
