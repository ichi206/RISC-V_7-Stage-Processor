`include "common/definitions.vh"


module memory_latency (
	input logic clock, read_in, write_in,
	input word write_value_in,
	
	output read_out, write_out,
	output word read_value_out, write_value_out