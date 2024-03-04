module Racecontroller(
    input wire [4:0] rs1_addr_id,
    input wire [4:0] rs2_addr_id,
    input wire [4:0] rd_exe,
    input wire [4:0] rd_mem,
    input wire [4:0] rd_wb,
    input wire regwen_exe,
    input wire regwen_mem,
    input wire regwen_wb,
    input wire [1:0] id_rs_use,
    input wire [31:0] inst_id,
    input wire j_taken,//来自exe的inst
    input wire br_taken,//来自exe的inst
    input wire [31:0] inst_exe,
    output wire stall_PC,
    output wire stall_IFID,
    output wire stall_IDEXE,
    output wire stall_EXEMEM,
    output wire stall_MEMWB,
    output wire flush_IFID,
    output wire flush_IDEXE,
    output wire flush_EXEMEM,
    output wire flush_MEMWB
);
wire data_exe,data_mem,data_wb;
wire ctrl,ctrl_;

assign ctrl_=inst_exe[6:2]==5'b11000|inst_exe[6:2]==5'b11011|inst_exe[6:2]==5'b11001;
assign ctrl=(inst_id[6:2]==5'b11000|inst_id[6:2]==5'b11011|inst_id[6:2]==5'b11001|inst_exe[6:2]==5'b11000|inst_exe[6:2]==5'b11011|inst_exe[6:2]==5'b11001);
assign data_exe=(rs1_addr_id==rd_exe&regwen_exe&rs1_addr_id!=0&id_rs_use[0])|(rs2_addr_id==rd_exe&regwen_exe&rs2_addr_id!=0&id_rs_use[1]);
assign data_mem=(rs1_addr_id==rd_mem&regwen_mem&rs1_addr_id!=0&id_rs_use[0])|(rs2_addr_id==rd_mem&regwen_mem&rs2_addr_id!=0&id_rs_use[1]);
assign data_wb=(rs1_addr_id==rd_wb&regwen_wb&rs1_addr_id!=0&id_rs_use[0])|(rs2_addr_id==rd_wb&regwen_wb&rs2_addr_id!=0&id_rs_use[1]);
assign stall_PC=data_exe|data_mem|data_wb|(ctrl&~ctrl_);
assign stall_IFID=data_exe|data_mem|data_wb|(ctrl&~ctrl);
assign stall_IDEXE=(ctrl==~ctrl);
assign stall_EXEMEM=(ctrl==~ctrl);
assign stall_MEMWB=(ctrl==~ctrl);
assign flush_IFID=(ctrl&~data_exe&~data_mem&~data_wb&~ctrl_)|br_taken|j_taken;
assign flush_IDEXE=data_exe|data_mem|data_wb;
assign flush_EXEMEM=(ctrl==~ctrl);
assign flush_MEMWB=(ctrl==~ctrl);
endmodule