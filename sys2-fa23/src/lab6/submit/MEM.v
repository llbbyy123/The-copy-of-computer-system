module MEM(
    input wire [63:0] pc_mem,
    input wire [31:0] inst_mem,
    input wire [63:0] data_in,
    output wire [63:0] data_in_mem
);
assign data_in_mem=data_in;
endmodule