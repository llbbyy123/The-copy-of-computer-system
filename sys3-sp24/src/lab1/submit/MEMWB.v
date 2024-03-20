module MEMWB(
    input wire clk,
    input wire rst,
    input wire switch_mode,
    input wire stall,
    input wire flush,
    input wire [63:0] pc_mem,
    input wire [31:0] inst_mem,
    input wire [23:0] sign_mem,
    input wire valid_mem,
    input wire [63:0] data_in_mem,
    input wire [63:0] alu_result_mem,
    input wire [5:0] csr_sign_mem,
    input wire [63:0] csr_val_mem,
    input wire is_csr_mem,
    input wire [63:0] csr_result_mem,
    output reg [63:0] pc_wb,
    output reg [31:0] inst_wb,
    output reg [23:0] sign_wb,
    output reg valid_wb,
    output reg [63:0] data_in_wb,
    output reg [63:0] alu_result_wb,
    output reg [5:0] csr_sign_wb,
    output reg [63:0] csr_val_wb,
    output reg is_csr_wb,
    output reg [63:0] csr_result_wb
);

always@(posedge clk )
begin
    if(rst|flush|switch_mode)
    begin
        pc_wb<={64{1'b0}};
        inst_wb<={32{1'b0}};
        sign_wb<={24{1'b0}};
        alu_result_wb<={64{1'b0}};
        valid_wb<=1'b0;
        data_in_wb<={64{1'b0}};
        csr_sign_wb<={6{1'b0}};
        csr_val_wb<={64{1'b0}};
        is_csr_wb<=1'b0;
        csr_result_wb<={64{1'b0}};
    end
    else if(~stall)
    begin
        pc_wb<=pc_mem;
        inst_wb<=inst_mem;
        sign_wb<=sign_mem;
        alu_result_wb<=alu_result_mem;
        valid_wb<=valid_mem;
        data_in_wb<=data_in_mem;
        csr_sign_wb<=csr_sign_mem;
        csr_val_wb<=csr_val_mem;
        is_csr_wb<=is_csr_mem;
        csr_result_wb<=csr_result_mem;
    end
end
endmodule