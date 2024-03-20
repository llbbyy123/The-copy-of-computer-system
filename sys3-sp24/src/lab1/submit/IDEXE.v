module IDEXE(
    input wire clk,
    input wire rst,
    input wire switch_mode,
    input wire stall,
    input wire flush,
    input wire except_happen,
    input wire valid_id,
    input wire [63:0] pc_id,
    input wire [31:0] inst_id,
    input wire [63:0] rs1_data_fwd,
    input wire [63:0] rs2_data_fwd,
    input wire [23:0] sign_id,
    input wire [63:0] imm_id,
    input wire [5:0] csr_sign_id,
    input wire [63:0] csr_imm_id,
    input wire is_csr_id,
    input wire [63:0] csr_val_fwd,
    output reg [63:0] rs1_data_exe,
    output reg [63:0] rs2_data_exe,
    output reg [63:0] pc_exe,
    output reg [31:0] inst_exe,
    output reg [23:0] sign_exe,
    output reg [63:0] imm_exe,
    output reg [5:0] csr_sign_exe,
    output reg [63:0] csr_imm_exe,
    output reg is_csr_exe,
    output reg [63:0] csr_val_exe,
    output reg valid_exe,
    input wire jump_id,
    output reg jump_exe,
    input wire [63:0] fetch_pc_id,
    output reg [63:0] fetch_pc_exe
);

always@(posedge clk )
begin
    if(rst|flush|switch_mode)
    begin
        rs1_data_exe<={64{1'b0}};
        rs2_data_exe<={64{1'b0}};
        pc_exe<={64{1'b0}};
        inst_exe<={32{1'b0}};
        sign_exe<={24{1'b0}};
        imm_exe<={64{1'b0}};
        csr_sign_exe<={6{1'b0}};
        csr_imm_exe<={64{1'b0}};
        is_csr_exe<=1'b0;
        csr_val_exe<={64{1'b0}};
        valid_exe<=1'b0;
        jump_exe<=1'b0;
        fetch_pc_exe<=64'b0;
    end
    else if(except_happen)
    begin
        rs1_data_exe<={64{1'b0}};
        rs2_data_exe<={64{1'b0}};
        pc_exe<=pc_id;
        inst_exe<=inst_id;
        sign_exe<={24{1'b0}};
        imm_exe<={64{1'b0}};
        csr_sign_exe<={6{1'b0}};
        csr_imm_exe<={64{1'b0}};
        is_csr_exe<=1'b0;
        csr_val_exe<={64{1'b0}};
        valid_exe<=1'b1;
        jump_exe<=1'b0;
        fetch_pc_exe<=64'b0;
    end
    else if(~stall)
    begin
        rs1_data_exe<=rs1_data_fwd;
        rs2_data_exe<=rs2_data_fwd;
        pc_exe<=pc_id;
        inst_exe<=inst_id;
        sign_exe<=sign_id;
        imm_exe<=imm_id;
        csr_sign_exe<=csr_sign_id;
        csr_imm_exe<=csr_imm_id;
        is_csr_exe<=is_csr_id;
        csr_val_exe<=csr_val_fwd;
        valid_exe<=valid_id;
        jump_exe<=jump_id;
        fetch_pc_exe<=fetch_pc_id;
    end
end
endmodule