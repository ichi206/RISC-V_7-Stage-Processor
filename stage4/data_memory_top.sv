`include "../common/definitions.vh"


module data_memory_top
(
	input logic clock, is_data_stage,
	input logic [`range_instrs] instr_type,
	input logic [2 : 0] load_type,
	input word long_addr, write_value,
	
	output word read_value
);

	logic [3 : 0] write_to;
	word true_write_value;
	
	logic read, write;
	assign read = is_data_stage & instr_type[`do_load];
	assign write = is_data_stage & instr_type[`do_store];

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
