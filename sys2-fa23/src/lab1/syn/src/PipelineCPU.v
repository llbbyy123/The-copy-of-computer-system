module PipelineCPU (
    input wire clk,                       /* 时钟 */ 
    input wire rstn,                      /* 重置信号 */ 
    output wire cosim_valid,              /* 指令有效 */
    output wire [63:0] cosim_pc,          /* current pc */
    output wire [31:0] cosim_inst,        /* current instruction */
    output wire [ 7:0] cosim_rs1_id,      /* rs1 id */
    output wire [63:0] cosim_rs1_data,    /* rs1 data */
    output wire [ 7:0] cosim_rs2_id,      /* rs2 id */
    output wire [63:0] cosim_rs2_data,    /* rs2 data */
    output wire [63:0] cosim_alu,         /* alu out */
    output wire [63:0] cosim_mem_addr,    /* memory address */
    output wire [ 3:0] cosim_mem_we,      /* memory write enable */
    output wire [63:0] cosim_mem_wdata,   /* memory write data */
    output wire [63:0] cosim_mem_rdata,   /* memory read data */
    output wire [ 3:0] cosim_rd_we,       /* rd write enable */
    output wire [ 7:0] cosim_rd_id,       /* rd id */
    output wire [63:0] cosim_rd_data,     /* rd data */
    output wire [ 3:0] cosim_br_taken,    /* branch taken? */
    output wire [63:0] cosim_npc          /* next pc */

);

    //代码补全
wire [63:0] pc_out,data_out,data_in,addr_out; 
wire [7:0] mask;
wire [23:0] sign;
wire [63:0] insts;
Core core(
  .clk(clk),                       /* 时钟 */ 
  .rst(~rstn),                      /* 重置信号 */ 
  .cosim_valid(cosim_valid),              /* 指令有效 */
  .cosim_pc(cosim_pc),          /* current pc */
  .cosim_inst(cosim_inst),        /* current instruction */
  .cosim_rs1_id(cosim_rs1_id),      /* rs1 id */
  .cosim_rs1_data(cosim_rs1_data),    /* rs1 data */
  .cosim_rs2_id(cosim_rs2_id),      /* rs2 id */
  .cosim_rs2_data(cosim_rs2_data),    /* rs2 data */
  .cosim_alu(cosim_alu),         /* alu out */
  .cosim_mem_addr(cosim_mem_addr),    /* memory address */
  .cosim_mem_we(cosim_mem_we),      /* memory write enable */
  .cosim_mem_wdata(cosim_mem_wdata),   /* memory write data */
  .cosim_mem_rdata(cosim_mem_rdata),   /* memory read data */
  .cosim_rd_we(cosim_rd_we),       /* rd write enable */
  .cosim_rd_id(cosim_rd_id),       /* rd id */
  .cosim_rd_data(cosim_rd_data),     /* rd data */
  .cosim_br_taken(cosim_br_taken),    /* branch taken? */
  .cosim_npc(cosim_npc),          /* next pc */
  .data_out(data_out),
  .pc_out(pc_out),
  .data_in(data_in),
  .addr_out(addr_out),
  .mask(mask),
  .sign(sign),
  .insts(insts)
);

RAM ram(
  .clk(clk),
  .rstn(rstn),
  .rw_wmode(sign[20]),
  .rw_addr(addr_out[11:3]),
  .rw_wdata(data_out),
  .rw_wmask(mask),
  .rw_rdata(data_in),
  .ro_addr(pc_out[11:3]),
  .ro_rdata(insts)
);
endmodule
