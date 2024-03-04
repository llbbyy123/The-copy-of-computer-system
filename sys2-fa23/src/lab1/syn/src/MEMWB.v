module MEMWB(
    input wire clk,
    input wire rst,
    input wire stall,
    input wire flush,
    input wire [63:0] pc_mem,
    input wire [31:0] inst_mem,
    input wire [23:0] sign_mem,
    input wire valid_mem,
    input wire [63:0] data_in_mem,
    input wire [63:0] alu_result_mem,
    output reg [63:0] pc_wb,
    output reg [31:0] inst_wb,
    output reg [23:0] sign_wb,
    output reg valid_wb,
    output reg [63:0] data_in_wb,
    output reg [63:0] alu_result_wb
);

always@(posedge clk or posedge rst)
begin
    if(rst|flush)
    begin
        pc_wb<={64{1'b0}};
        inst_wb<={32{1'b0}};
        sign_wb<={23{1'b0}};
        alu_result_wb<={64{1'b0}};
        valid_wb<=1'b0;
        data_in_wb<={64{1'b0}};
    end
    else if(~stall)
    begin
        pc_wb<=pc_mem;
        inst_wb<=inst_mem;
        sign_wb<=sign_mem;
        alu_result_wb<=alu_result_mem;
        valid_wb<=valid_mem;
        data_in_wb<=data_in_mem;
    end
end
endmodule