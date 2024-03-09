`include "../common/definitions.vh"


module data_memory_top
(
	input logic clock, valid, bypass,
	input logic [`range_instrs] instr_type,
	input logic [2 : 0] load_type,
	input word long_addr, rs2_value, bypass_value,
	
	output word read_value
);

	word write_value;
	assign write_value = bypass ? bypass_value : rs2_value;

	logic [3 : 0] write_to;
	word true_write_value;
	
	wire write = valid & instr_type[`do_store];

	data_memory dm
	(
		.clock, .write,
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
