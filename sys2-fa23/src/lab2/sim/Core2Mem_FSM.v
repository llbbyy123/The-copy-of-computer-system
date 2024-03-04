module Core2Mem_FSM (
    input wire clk,
    input wire rstn,
    input wire [63:0] pc,
    input wire if_request,
    input wire [63:0] address_cpu,
    input wire wen_cpu,
    input wire ren_cpu,
    input wire [63:0] wdata_cpu,
    input wire [7:0] wmask_cpu,
    output [31:0] inst,
    output [63:0] rdata_cpu,
    output if_stall,
    output mem_stall,

    output reg [63:0] address_mem,
    output reg ren_mem,
    output reg wen_mem,
    output reg [7:0] wmask_mem,
    output reg [63:0] wdata_mem,
    input wire [63:0] rdata_mem,
    input wire valid_mem
);

    //实现代码

    
endmodule