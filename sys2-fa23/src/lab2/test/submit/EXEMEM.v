module EXEMEM(
    input wire clk,
    input wire rst,
    input wire stall,
    input wire flush,
    input wire [63:0] pc_exe,
    input wire [23:0] sign_exe,
    input wire [31:0] inst_exe,
    input wire [63:0] alu_result_exe,
    input wire valid_exe,
    input wire [63:0] rd_fwd_exe,
    input wire [63:0] data_mem_exe,
    input wire [7:0] mask_exe,
    output reg [63:0] pc_mem,
    output reg [31:0] inst_mem,
    output reg [23:0] sign_mem,
    output reg [63:0] alu_result_mem,
    output reg valid_mem,
    output reg [63:0] rd_fwd_mem,
    output reg [63:0] data_mem_mem,
    output reg [7:0] mask_mem
);
always@(posedge clk or posedge rst)
begin
    if(rst|flush)
    begin
        pc_mem<={64{1'b0}};
        inst_mem<={32{1'b0}};
        sign_mem<={23{1'b0}};
        alu_result_mem<={64{1'b0}};
        valid_mem<=1'b0;
        rd_fwd_mem<={64{1'b0}};
        data_mem_mem<={64{1'b0}};
        mask_mem<={8{1'b0}};
    end
    else if(~stall)
    begin
        pc_mem<=pc_exe;
        inst_mem<=inst_exe;
        sign_mem<=sign_exe;
        alu_result_mem<=alu_result_exe;
        valid_mem<=valid_exe;
        rd_fwd_mem<=rd_fwd_exe;
        data_mem_mem<=data_mem_exe;
        mask_mem<=mask_exe;
    end
end
endmodule