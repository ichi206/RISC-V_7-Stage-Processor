`ifndef definitions_file
`define definitions_file

`define word_size 32
`define tag_size 5 // number of bits to distinguish 32 registers

typedef logic [`tag_size - 1 : 0] tag; // used to access registers
typedef logic [`word_size - 1:0] word;

`endif
