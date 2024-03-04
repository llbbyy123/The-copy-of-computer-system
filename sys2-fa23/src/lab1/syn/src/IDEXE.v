module IDEXE(
    input wire clk,
    input wire rst,
    input wire stall,
    input wire flush,
    input wire valid_id,
    input wire [63:0] pc_id,
    input wire [31:0] inst_id,
    input wire [63:0] rs1_data_id,
    input wire [63:0] rs2_data_id,
    input wire [23:0] sign_id,
    input wire [63:0] imm_id,
    output reg [63:0] rs1_data_exe,
    output reg [63:0] rs2_data_exe,
    output reg [63:0] pc_exe,
    output reg [31:0] inst_exe,
    output reg [23:0] sign_exe,
    output reg [63:0] imm_exe,
    output reg valid_exe
);

always@(posedge clk or posedge rst)
begin
    if(rst|flush)
    begin
        rs1_data_exe<={64{1'b0}};
        rs2_data_exe<={64{1'b0}};
        pc_exe<={64{1'b0}};
        inst_exe<={32{1'b0}};
        sign_exe<={24{1'b0}};
        imm_exe<={64{1'b0}};
        valid_exe<=1'b0;
    end
    else if(~stall)
    begin
        rs1_data_exe<=rs1_data_id;
        rs2_data_exe<=rs2_data_id;
        pc_exe<=pc_id;
        inst_exe<=inst_id;
        sign_exe<=sign_id;
        imm_exe<=imm_id;
        valid_exe<=valid_id;
    end
end
endmodule