`ifndef definitions_file
`define definitions_file

`define word_size 32
`define word_address_size 32
`define tag_size 5 // number of bits to distinguish 32 registers

`define data_memory_size 1024 // in bytes
`define data_memory_bits $clog2(`data_memory_size)

`define instruction_memory_size 1024
`define instruction_memory_bits $clog2(`instruction_memory_size)

`define BOOT_ADDRESS 0 // address to boot to

typedef logic [`tag_size - 1 : 0] tag; // used to access registers
typedef logic [`word_size - 1 : 0] word;
typedef logic [`word_address_size - 1 : 0] word_address;

typedef logic [1 : 0] load_type;
`define BYTE 0
`define HALFWORD 1
`define WORD 2

`endif
