`include "../../common/definitions.vh"


module data_memory_test ();

	logic clock;
	initial
	begin
		clock = 1;
		forever #50ns clock = ~clock;
	end
	
	logic sign_extend, read, write;
	word long_addr;
	word write_value;
	logic [2 : 0] load_type;
	
	word read_value;
	
	data_memory_top dmt (.*);
	
	byte b;
	hword h;
	
	initial
	begin
		load_type = `word_mask;
		read = 0; write = 1;
		long_addr = 0;
		write_value = 32'b0;
		repeat(6) begin
			@(posedge clock);
			long_addr += 4;
		end
		
		load_type = `byte_mask;
		long_addr = 0;
		b = 1;
		repeat(4) begin
			b *= -2;
			write_value = {24'b0, b};
			@(posedge clock);
			long_addr += 3;
		end
		
		read = 1; write = 0;
		sign_extend = 0;
		long_addr = 0;
		repeat(7) begin
			@(posedge clock);
			long_addr++;
		end
		
		sign_extend = 1;
		long_addr = 0;
		repeat(7) begin
			@(posedge clock);
			long_addr++;
		end
		
		load_type = `hword_mask;
		read = 0; write = 1;
		long_addr = 0;
		h = 1000;
		repeat(4) begin
			h *= -2;
			write_value = {16'b0, h};
			@(posedge clock);
			long_addr += 6;
		end
		
		read = 1; write = 0;
		sign_extend = 0;
		long_addr = 0;
		repeat(7) begin
			@(posedge clock);
			long_addr += 2;
		end
		
		sign_extend = 1;
		long_addr = 0;
		repeat(7) begin
			@(posedge clock);
			long_addr += 2;
		end
		
		$stop;
	end

endmodule
