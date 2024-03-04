module Core (
    input wire clk,                       /* 时钟 */ 
    input wire rst,                      /* 重置信号 */ 
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
    output wire [63:0] cosim_npc,          /* next pc */
    output wire [63:0] data_out,
    output wire [63:0] pc_out,
    input wire [63:0] data_in,
    output wire [63:0] addr_out,
    output wire [7:0] mask,
    output wire [23:0] sign,
    input wire [63:0] insts
);

wire [63:0] pc_id,pc_exe,pc_mem,pc_wb,next_pc;//pc信号
reg [63:0] pc;
wire [31:0] inst_id,inst_exe,inst_mem,inst_wb;//inst信号
wire [23:0] sign_id,sign_exe,sign_mem,sign_wb;//控制符信号
wire valid_id,valid_exe,valid_mem,valid_wb;//是否有效信号
reg [63:0] pc_out1;//用于向外取指令
wire stall_PC,stall_IFID,stall_IDEXE,stall_EXEMEM,stall_MEMWB,flush_IFID,flush_IDEXE,flush_EXEMEM,flush_MEMWB;//stall,flush信号
wire [63:0] alu_result_exe,alu_result_mem,alu_result_wb;//alu_result
wire j_taken_exe,br_taken_exe;//b,j信号
wire [4:0] rs1_addr_id,rs2_addr_id,rd_addr_id,rd_addr_wb;//register id
wire [63:0] rs1_data_id,rs2_data_id,rs1_data_exe,rs2_data_exe,rd_data_wb;//register data
wire [63:0] data_in_mem,data_in_wb;//data from mem
wire [63:0] data_mem;//data to mem
wire [63:0] imm_exe,imm_id;

assign cosim_valid=valid_wb;
assign cosim_pc=pc_wb;
assign cosim_inst=inst_wb;
assign cosim_rs1_id={{3{1'b0}},rs1_addr_id};
assign cosim_rs1_data=rs1_data_id;
assign cosim_rs2_id={{3{1'b0}},rs2_addr_id};
assign cosim_rs2_data=rs2_data_id;
assign cosim_alu=alu_result_exe;
assign cosim_mem_addr=alu_result_mem;
assign cosim_mem_we={{3{1'b0}},sign_wb[21]};
assign cosim_mem_wdata=data_mem;
assign cosim_mem_rdata=data_in_mem;
assign cosim_rd_we={{3{1'b0}},sign_wb[21]};
assign cosim_rd_id=rd_addr_wb;
assign cosim_rd_data=rd_data_wb;
assign cosim_br_taken={{3{1'b0}},br_taken_exe};
assign cosim_npc=pc_out1;


Racecontroller racecontrol(
  .rs1_addr_id(rs1_addr_id),
  .rs2_addr_id(rs2_addr_id),
  .rd_exe(inst_exe[11:7]),
  .rd_mem(inst_mem[11:7]),
  .rd_wb(inst_wb[11:7]),
  .regwen_exe(sign_exe[21]),
  .regwen_mem(sign_mem[21]),
  .regwen_wb(sign_wb[21]),
  .id_rs_use(sign_id[23:22]),
  .inst_id(inst_id),
  .j_taken(j_taken_exe),
  .br_taken(br_taken_exe),
  .inst_exe(inst_exe),
  .stall_PC(stall_PC),
  .stall_IFID(stall_IFID),
  .stall_IDEXE(stall_IDEXE),
  .stall_EXEMEM(stall_EXEMEM),
  .stall_MEMWB(stall_MEMWB),
  .flush_IFID(flush_IFID),
  .flush_IDEXE(flush_IDEXE),
  .flush_EXEMEM(flush_EXEMEM),
  .flush_MEMWB(flush_MEMWB)
);

Pc pc1(
  .j_taken_exe(j_taken_exe),
  .alu_result_exe(alu_result_exe),
  .br_taken_exe(br_taken_exe),
  .pc(pc),
  .npc_sel(sign_exe[19]),
  .next_pc(next_pc),
  .stall(stall_PC)
);

always@(posedge clk or posedge rst)begin
if(rst==1)
pc<={64{1'b0}};
else 
pc<=next_pc;
end
always@(*)
begin
  if(rst)
  pc_out1={64{1'b0}};
  else 
  pc_out1=next_pc;
end

assign pc_out=pc_out1;

IFID if_id(
  .clk(clk),
  .rst(rst),
  .stall(stall_IFID),
  .flush(flush_IFID),
  .insts(insts),
  .pc_if(pc),
  .pc_id(pc_id),
  .inst_id(inst_id),
  .valid_id(valid_id)
);

ID id(
  .pc_id(pc_id),
  .inst_id(inst_id),
  .rd_addr_id(rd_addr_id),
  .comb_decode(sign_id),
  .imm_id(imm_id),
  .rs1_addr_id(rs1_addr_id),
  .rs2_addr_id(rs2_addr_id)
);

IDEXE id_exe(
  .clk(clk),
  .rst(rst),
  .stall(stall_IDEXE),
  .flush(flush_IDEXE),
  .valid_id(valid_id),
  .pc_id(pc_id),
  .inst_id(inst_id), 
  .rs1_data_id(rs1_data_id),
  .rs2_data_id(rs2_data_id),
  .sign_id(sign_id),
  .imm_id(imm_id),
  .rs1_data_exe(rs1_data_exe),
  .rs2_data_exe(rs2_data_exe),
  .pc_exe(pc_exe),
  .inst_exe(inst_exe),
  .sign_exe(sign_exe),
  .imm_exe(imm_exe),
  .valid_exe(valid_exe)
);

EXE exe(
  .pc_exe(pc_exe),
  .inst_exe(inst_exe),
  .sign_exe(sign_exe),
  .rs1_data_exe(rs1_data_exe),
  .rs2_data_exe(rs2_data_exe),
  .imm(imm_exe),
  .alu_result(alu_result_exe),
  .data_mem(data_mem),
  .mask(mask),
  .br_taken_exe(br_taken_exe),
  .j_taken_exe(j_taken_exe)
);
assign data_out=data_mem;
assign addr_out=alu_result_exe;
assign sign=sign_exe;

EXEMEM exe_mem(
  .clk(clk),
  .rst(rst),
  .stall(stall_EXEMEM),
  .flush(flush_EXEMEM),
  .pc_exe(pc_exe),
  .sign_exe(sign_exe),
  .inst_exe(inst_exe),
  .alu_result_exe(alu_result_exe),
  .valid_exe(valid_exe),
  .pc_mem(pc_mem),
  .inst_mem(inst_mem),
  .sign_mem(sign_mem),
  .alu_result_mem(alu_result_mem),
  .valid_mem(valid_mem)
);

MEM mem(
  .pc_mem(pc_mem),
  .inst_mem(inst_mem),
  .data_in(data_in),
  .data_in_mem(data_in_mem)
);

MEMWB mem_wb(
  .clk(clk),
  .rst(rst),
  .stall(stall_MEMWB),
  .flush(flush_MEMWB),
  .pc_mem(pc_mem),
  .inst_mem(inst_mem),
  .sign_mem(sign_mem),
  .valid_mem(valid_mem),
  .data_in_mem(data_in_mem),
  .alu_result_mem(alu_result_mem),
  .pc_wb(pc_wb),
  .inst_wb(inst_wb),
  .sign_wb(sign_wb),
  .valid_wb(valid_wb),
  .data_in_wb(data_in_wb),
  .alu_result_wb(alu_result_wb)
);

WB wb(
  .pc_wb(pc_wb),
  .inst_wb(inst_wb),
  .wb_sel(sign_wb[4:3]),
  .data_in_wb(data_in_wb),
  .alu_result_wb(alu_result_wb),
  .memdata_width(sign_wb[2:0]),
  .rd_addr_wb(rd_addr_wb),
  .rd_data_wb(rd_data_wb)
);

Regs regs(
  .clk(clk),
  .rst(rst),
  .we(sign_wb[21]),
  .read_addr_1(rs1_addr_id),
  .read_addr_2(rs2_addr_id),
  .rd_addr_wb(rd_addr_wb),
  .rd_data_wb(rd_data_wb),
  .read_data_1(rs1_data_id),
  .read_data_2(rs2_data_id)
);
endmodule
