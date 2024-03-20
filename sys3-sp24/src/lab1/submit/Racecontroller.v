module Racecontroller(
    input wire [4:0] rs1_addr_id,
    input wire [4:0] rs2_addr_id,
    input wire [4:0] rd_mem,
    input wire regwen_exe,
    input wire regwen_mem,
    input wire regwen_wb,
    input wire [1:0] id_rs_use,
    input wire [31:0] inst_id,
    input wire j_taken,//来自exe的inst
    input wire br_taken,//来自exe的inst
    input wire [31:0] inst_exe,
    input wire [23:0] sign_mem,
    input wire if_stall,
    input wire mem_stall,
    input wire [1:0] exe_change,
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
wire data_mem;
wire ctrl,ctrl_;

assign ctrl_=inst_exe[6:2]==5'b11000|inst_exe[6:2]==5'b11011|inst_exe[6:2]==5'b11001;
assign ctrl=(inst_id[6:2]==5'b11000|inst_id[6:2]==5'b11011|inst_id[6:2]==5'b11001|inst_exe[6:2]==5'b11000|inst_exe[6:2]==5'b11011|inst_exe[6:2]==5'b11001);
assign data_mem=(rs1_addr_id==rd_mem&regwen_mem&rs1_addr_id!=0&id_rs_use[0]&sign_mem[4:3]==2'b10)|(rs2_addr_id==rd_mem&regwen_mem&rs2_addr_id!=0&id_rs_use[1]&sign_mem[4:3]==2'b10);

// assign stall_PC=data_mem|(ctrl&~ctrl_)|if_stall|mem_stall;
// assign stall_IFID=data_mem|mem_stall|(if_stall&ctrl_);
// assign stall_IDEXE=mem_stall|(if_stall&ctrl_);
// assign stall_EXEMEM=mem_stall;
// assign stall_MEMWB=(ctrl==~ctrl);

// assign flush_IFID=(ctrl&~data_mem&~ctrl_)|br_taken|j_taken|if_stall;
// assign flush_IDEXE=data_mem;
// assign flush_EXEMEM=if_stall&ctrl_;
// assign flush_MEMWB=mem_stall;

assign stall_PC=data_mem|if_stall|mem_stall;
assign stall_IFID=data_mem|mem_stall|(if_stall&ctrl_);
assign stall_IDEXE=mem_stall|(if_stall&ctrl_);
assign stall_EXEMEM=mem_stall;
assign stall_MEMWB=data_mem==~data_mem;

assign flush_IFID=(exe_change[0]==0)|if_stall;
assign flush_IDEXE=((exe_change[0]==0)|data_mem)&(!mem_stall)&!(if_stall&ctrl_);
assign flush_EXEMEM=if_stall&ctrl_;
assign flush_MEMWB=mem_stall;
endmodule