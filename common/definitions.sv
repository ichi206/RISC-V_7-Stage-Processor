`ifndef definitions_file
`define definitions_file

`define word_size 32
`define word_address_size 32
`define tag_size 5 // number of bits to distinguish 32 registers

`define memory_size 1024 // in bytes
`define memory_bits $clog2(MEMORY_SIZE)

`define BOOT_ADDRESS 0 // address to boot to

typedef logic [`tag_size - 1 : 0] tag; // used to access registers
typedef logic [`word_size - 1 : 0] word;
typedef logic [`word_address_size - 1 : 0] word_address;

`endif
