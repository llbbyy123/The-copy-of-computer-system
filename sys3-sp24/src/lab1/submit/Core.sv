`include "ExceptStruct.vh"
`include "CSRStruct.vh"
`include "RegStruct.vh"
`include "TimerStruct.vh"
module Core (
    input wire clk,                       /* 时钟 */ 
    input wire rstn,                       /* 重置信号 */ 

    output wire [63:0] pc,                /* current pc */
    input wire [31:0] inst,               /* read inst from ram */

    output wire [63:0] address,           /* memory address */
    output wire we_mem,                   /* write enable */
    output wire [63:0] wdata_mem,         /* write data to memory */
    output wire [7:0] wmask_mem,          /* write enable for each byte */ 
    output wire re_mem,                   /* read enable */
    input wire [63:0] rdata_mem,          /* read data from memory */

    input wire if_stall,
    input wire mem_stall,
    output wire if_request,
    output wire switch_mode,

    input TimerStruct::TimerPack time_out,

    output cosim_valid,
    output [63:0] cosim_pc,          /* current pc */
    output [31:0] cosim_inst,        /* current instruction */
    output [ 7:0] cosim_rs1_id,      /* rs1 id */
    output [63:0] cosim_rs1_data,    /* rs1 data */
    output [ 7:0] cosim_rs2_id,      /* rs2 id */
    output [63:0] cosim_rs2_data,    /* rs2 data */
    output [63:0] cosim_alu,         /* alu out */
    output [63:0] cosim_mem_addr,    /* memory address */
    output [ 3:0] cosim_mem_we,      /* memory write enable */
    output [63:0] cosim_mem_wdata,   /* memory write data */
    output [63:0] cosim_mem_rdata,   /* memory read data */
    output [ 3:0] cosim_rd_we,       /* rd write enable */
    output [ 7:0] cosim_rd_id,       /* rd id */
    output [63:0] cosim_rd_data,     /* rd data */
    output [ 3:0] cosim_br_taken,    /* branch taken? */
    output [63:0] cosim_npc,         /* next pc */
    output CSRStruct::CSRPack cosim_csr_info,
    output RegStruct::RegPack cosim_regs,

    output cosim_interrupt,
    output [63:0] cosim_cause
);
import ExceptStruct::*;
import TimerStruct::*;
    reg if_request1,re_mem1;
    wire rst=~rstn;
    wire switch_modes;
    wire [63:0] pc_id,pc_exe,pc_mem,pc_wb,next_pc;//pc信号
    reg [63:0] pc_if;
    wire [31:0] inst_id,inst_exe,inst_mem,inst_wb;//inst信号
    wire [23:0] sign_id,sign_exe,sign_mem,sign_wb;//控制符信号
    wire valid_id,valid_exe,valid_mem,valid_wb;//是否有效信号
    reg [63:0] pc_out1;//用于向外取指令
    wire stall_PC,stall_IFID,stall_IDEXE,stall_EXEMEM,stall_MEMWB,flush_IFID,flush_IDEXE,flush_EXEMEM,flush_MEMWB;//stall,flush信号
    wire [63:0] alu_result_exe,alu_result_mem,alu_result_wb;//alu_result
    wire j_taken_exe,br_taken_exe;//b,j信号
    wire [4:0] rs1_addr_id,rs2_addr_id,rd_addr_id,rd_addr_wb;//register id
    wire [63:0] rs1_data_fwd,rs2_data_fwd,rs1_data_id,rs2_data_id,rs1_data_exe,rs2_data_exe,rd_data_wb;//register data
    wire [63:0] data_in_mem,data_in_wb;//data from mem
    wire [63:0] rd_fwd_exe,rd_fwd_mem;
    wire [63:0] data_mem_exe,data_mem_mem;//data to mem
    wire [63:0] imm_exe,imm_id;
    wire [7:0] mask_exe,mask_mem;
    wire [5:0] csr_sign_id,csr_sign_exe,csr_sign_mem,csr_sign_wb;
    wire [63:0] csr_imm_id,csr_imm_exe,csr_imm_mem,csr_imm_wb;
    wire [63:0] csr_val_fwd,csr_val_id,csr_val_exe,csr_val_mem,csr_val_wb;
    wire is_csr_id,is_csr_exe,is_csr_mem,is_csr_wb;
    wire [63:0] csr_result_exe,csr_result_mem,csr_result_wb;
    wire [63:0] pc_csr;
    wire [1:0] priv;
    wire illegal_id;
    wire [11:0] csr_addr_id,csr_addr_wb;
    wire [63:0] csr_fin_wb;
    wire [63:0] csr_fwd_exe,csr_fwd_mem,csr_fwd_wb;
    wire jump_if,jump_id,jump_exe;
    wire [1:0] exe_change;
    wire [63:0] pc_target_if,pc_target_exe;
    wire [63:0] fetch_pc_if,fetch_pc_id,fetch_pc_exe;
    wire except_happen_id,csr_we_wb;
    ExceptPack empty='{except:1'b0,epc:64'b0,ecause:64'b0,etval:64'b0};
    ExceptPack except_exe,except_mem,except_wb;
    assign cosim_valid=valid_wb&~cosim_interrupt;
    assign cosim_pc=pc_wb;      
    assign cosim_inst=inst_wb;
    assign cosim_rd_we={{3{1'b0}},sign_wb[21]};
    assign cosim_rd_id={3'b0,rd_addr_wb}; 
    assign cosim_rd_data=rd_data_wb;  

    assign cosim_rs1_id={{3{1'b0}},rs1_addr_id};
    assign cosim_rs1_data=rs1_data_id;
    assign cosim_rs2_id={{3{1'b0}},rs2_addr_id};
    assign cosim_rs2_data=rs2_data_id;
    assign cosim_alu=alu_result_exe;

    assign cosim_mem_addr=alu_result_mem;
    assign cosim_mem_we={{3{1'b0}},sign_wb[20]};
    assign cosim_mem_wdata=data_mem_mem;
    assign cosim_mem_rdata=data_in_mem;

    assign cosim_br_taken={{3{1'b0}},br_taken_exe};
    assign cosim_npc=pc_out1;
    assign switch_mode=switch_modes;

    Racecontroller racecontrol(
      .rs1_addr_id(rs1_addr_id),
      .rs2_addr_id(rs2_addr_id),
      .rd_mem(inst_mem[11:7]),
      .regwen_exe(sign_exe[21]),
      .regwen_mem(sign_mem[21]),
      .regwen_wb(sign_wb[21]),
      .id_rs_use(sign_id[23:22]),
      .inst_id(inst_id),
      .j_taken(j_taken_exe),
      .br_taken(br_taken_exe),
      .inst_exe(inst_exe),
      .sign_mem(sign_mem),
      .if_stall(if_stall),
      .mem_stall(mem_stall),
      .exe_change(exe_change),
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
    BranchPrediction BTB(
      .clk(clk),
      .rst(rst),
      .pc_if(pc_if),
      .jump_if(jump_if),
      .pc_target_if(pc_target_if),
      .pc_exe(pc_exe),
      .pc_target_exe(pc_target_exe),
      .jump_exe(br_taken_exe|j_taken_exe),
      .is_jump_exe(sign_exe[18:16]==3'b101|sign_exe[11:9]!=3'b000),
      .stall(stall_IDEXE),
      .fetch_pc(fetch_pc_if)
    );
    
    Pc pc1(
      .j_taken_exe(j_taken_exe),
      .switch_mode(switch_modes),
      .alu_result_exe(alu_result_exe),
      .br_taken_exe(br_taken_exe),
      .pc(pc_if),
      .npc_sel(sign_exe[19]),
      .pc_csr(pc_csr),
      .next_pc(next_pc),
      .stall(stall_PC),
      .jump_if(jump_if),
      .pc_target_if(pc_target_if),
      .pc_exe(pc_exe),
      .exe_change(exe_change)
    );
    
    always@(posedge clk or posedge rst)begin
    if(rst==1)
    pc_if<={64{1'b0}};
    else 
    pc_if<=next_pc;
    end
    always@(*)
    begin
      if(rst)
      pc_out1={64{1'b0}};
      else 
      pc_out1=next_pc;
    end
    
    assign pc=pc_if;
    
    IFID if_id(
      .clk(clk),
      .rst(rst),
      .switch_mode(switch_modes),
      .stall(stall_IFID),
      .flush(flush_IFID),
      .inst(inst),
      .pc_if(pc_if),
      .pc_id(pc_id),
      .jump_if(jump_if),
      .jump_id(jump_id),
      .inst_id(inst_id),
      .valid_id(valid_id),
      .fetch_pc_if(fetch_pc_if),
      .fetch_pc_id(fetch_pc_id)
    );
    
    ID id(
      .pc_id(pc_id),
      .inst_id(inst_id),
      .rd_addr_id(rd_addr_id),
      .sign(sign_id),
      .valid_id(valid_id),
      .imm_id(imm_id),
      .rs1_addr_id(rs1_addr_id),
      .rs2_addr_id(rs2_addr_id),
      .csr_addr_id(csr_addr_id),
      .csr_sign_id(csr_sign_id),
      .csr_imm(csr_imm_id),
      .is_csr(is_csr_id),
      .illegal(illegal_id)
    );

    IDExceptExamine ide(
      .clk(clk),
      .rst(rst),
      .stall(stall_IDEXE),
      .flush(switch_modes|flush_IDEXE),
      .pc_id(pc_id),
      .priv(priv),
      .is_ecall_id(inst_id==32'h00000073),
      .is_ebreak_id(inst_id==32'h00100073),
      .illegal_id(illegal_id),
      .inst_id(inst_id),
      .valid_id(valid_id),
      .except_id(empty),
      .except_exe(except_exe),
      .except_happen_id(except_happen_id)
    );
    
    Forwarding forward(
      .rs1_data_id(rs1_data_id),
      .rs2_data_id(rs2_data_id),
      .rd_data_exe(rd_fwd_exe),
      .rd_data_mem(rd_fwd_mem),
      .rd_data_wb(rd_data_wb),
      .rs1_addr_id(rs1_addr_id),
      .rs2_addr_id(rs2_addr_id),
      .rd_exe(inst_exe[11:7]),
      .rd_mem(inst_mem[11:7]),
      .rd_wb(inst_wb[11:7]),
      .regwen_exe(sign_exe[21]),
      .regwen_mem(sign_mem[21]),
      .regwen_wb(sign_wb[21]),
      .sign_wb(sign_wb),
      .id_rs_use(sign_id[23:22]),
      .rs1_data_fwd(rs1_data_fwd),
      .rs2_data_fwd(rs2_data_fwd)
    );

    CSR_Forwarding csr_forward(
      .csr_val_id(csr_val_id),
      .csr_fwd_exe(csr_fwd_exe),
      .csr_fwd_mem(csr_fwd_mem),
      .csr_fwd_wb(csr_fin_wb),
      .is_csr_id(is_csr_id),
      .is_csr_exe(is_csr_exe),
      .is_csr_mem(is_csr_mem),
      .is_csr_wb(is_csr_wb),
      .csr_addr_id(csr_addr_id),
      .csr_fwd_addr_exe(inst_exe[31:20]),
      .csr_fwd_addr_mem(inst_mem[31:20]),
      .csr_fwd_addr_wb(inst_wb[31:20]),
      .csr_val_fwd(csr_val_fwd)
    );
    
    IDEXE id_exe(
      .clk(clk),
      .rst(rst),
      .switch_mode(switch_modes),
      .stall(stall_IDEXE),
      .flush(flush_IDEXE),
      .except_happen(except_happen_id),
      .valid_id(valid_id),
      .pc_id(pc_id),
      .inst_id(inst_id), 
      .rs1_data_fwd(rs1_data_fwd),
      .rs2_data_fwd(rs2_data_fwd),
      .sign_id(sign_id),
      .imm_id(imm_id),
      .csr_sign_id(csr_sign_id),
      .csr_imm_id(csr_imm_id),
      .is_csr_id(is_csr_id),
      .csr_val_fwd(csr_val_fwd),
      .rs1_data_exe(rs1_data_exe),
      .rs2_data_exe(rs2_data_exe),
      .pc_exe(pc_exe),
      .inst_exe(inst_exe),
      .sign_exe(sign_exe),
      .imm_exe(imm_exe),
      .csr_sign_exe(csr_sign_exe),
      .csr_imm_exe(csr_imm_exe),
      .is_csr_exe(is_csr_exe),
      .csr_val_exe(csr_val_exe),
      .valid_exe(valid_exe),
      .jump_id(jump_id),
      .jump_exe(jump_exe),
      .fetch_pc_id(fetch_pc_id),
      .fetch_pc_exe(fetch_pc_exe)
    );

    
    EXE exe(
      .pc_exe(pc_exe),
      .inst_exe(inst_exe),
      .sign_exe(sign_exe),
      .rs1_data_exe(rs1_data_exe),
      .rs2_data_exe(rs2_data_exe),
      .imm(imm_exe),
      .csr_sign_exe(csr_sign_exe),
      .csr_imm_exe(csr_imm_exe),
      .is_csr_exe(is_csr_exe),
      .csr_val_exe(csr_val_exe),
      .alu_result(alu_result_exe),
      .data_mem_exe(data_mem_exe),
      .mask_exe(mask_exe),
      .br_taken_exe(br_taken_exe),
      .j_taken_exe(j_taken_exe),
      .rd_fwd_exe(rd_fwd_exe),
      .csr_fwd_exe(csr_fwd_exe),
      .csr_result(csr_result_exe),
      .pc_target_exe(pc_target_exe),
      .jump_exe(jump_exe),
      .exe_change(exe_change),
      .fetch_pc(fetch_pc_exe)
    );
    
    EXEMEM exe_mem(
      .clk(clk),
      .rst(rst),
      .switch_mode(switch_modes),
      .stall(stall_EXEMEM),
      .flush(flush_EXEMEM),
      .pc_exe(pc_exe),
      .sign_exe(sign_exe),
      .inst_exe(inst_exe),
      .alu_result_exe(alu_result_exe),
      .valid_exe(valid_exe),
      .rd_fwd_exe(rd_fwd_exe),
      .csr_fwd_exe(csr_fwd_exe),
      .csr_sign_exe(csr_sign_exe),
      .csr_val_exe(csr_val_exe),
      .is_csr_exe(is_csr_exe),
      .csr_result_exe(csr_result_exe),
      .data_mem_exe(data_mem_exe),
      .mask_exe(mask_exe),
      .pc_mem(pc_mem),
      .inst_mem(inst_mem),
      .sign_mem(sign_mem),
      .alu_result_mem(alu_result_mem),
      .valid_mem(valid_mem),
      .rd_fwd_mem(rd_fwd_mem),
      .csr_fwd_mem(csr_fwd_mem),
      .data_mem_mem(data_mem_mem),
      .csr_sign_mem(csr_sign_mem),
      .csr_val_mem(csr_val_mem),
      .is_csr_mem(is_csr_mem),
      .csr_result_mem(csr_result_mem),
      .mask_mem(mask_mem)
    );
    assign wdata_mem=data_mem_mem;
    assign address=alu_result_mem;
    assign we_mem=sign_mem[20];
    assign wmask_mem=mask_mem;
    always@(*)begin
      re_mem1=(sign_mem[4:3]==2'b10);
      if_request1=1'b1;
    end
    assign re_mem=re_mem1;
    assign if_request=if_request1;
    EX ex3(
      .clk(clk),
      .rst(rst),
      .stall(stall_EXEMEM),
      .flush(flush_EXEMEM),
      .except_last(except_exe),
      .except_next(except_mem)
    );

    MEM mem(
      .pc_mem(pc_mem),
      .inst_mem(inst_mem),
      .data_in(rdata_mem),
      .data_in_mem(data_in_mem)
    );
    
    MEMWB mem_wb(
      .clk(clk),
      .rst(rst),
      .switch_mode(switch_modes),
      .stall(stall_MEMWB),
      .flush(flush_MEMWB),
      .pc_mem(pc_mem),
      .inst_mem(inst_mem),
      .sign_mem(sign_mem),
      .valid_mem(valid_mem),
      .data_in_mem(data_in_mem),
      .alu_result_mem(alu_result_mem),
      .csr_sign_mem(csr_sign_mem),
      .csr_val_mem(csr_val_mem),
      .is_csr_mem(is_csr_mem),
      .csr_result_mem(csr_result_mem),
      .pc_wb(pc_wb),
      .inst_wb(inst_wb),
      .sign_wb(sign_wb),
      .valid_wb(valid_wb),
      .data_in_wb(data_in_wb),
      .alu_result_wb(alu_result_wb),
      .csr_sign_wb(csr_sign_wb),
      .csr_val_wb(csr_val_wb),
      .is_csr_wb(is_csr_wb),
      .csr_result_wb(csr_result_wb)
    );

    EX ex4(
      .clk(clk),
      .rst(rst),
      .stall(stall_MEMWB),
      .flush(flush_MEMWB),
      .except_last(except_mem),
      .except_next(except_wb)
    );
    
    WB wb(
      .pc_wb(pc_wb),
      .inst_wb(inst_wb),
      .wb_sel(sign_wb[4:3]),
      .data_in_wb(data_in_wb),
      .alu_result_wb(alu_result_wb),
      .csr_sign_wb(csr_sign_wb),
      .csr_val_wb(csr_val_wb),
      .is_csr_wb(is_csr_wb),
      .csr_result_wb(csr_result_wb),
      .memdata_width(sign_wb[2:0]),
      .csr_addr_wb(csr_addr_wb),
      .csr_fin_wb(csr_fin_wb),
      .csr_we_wb(csr_we_wb),
      .rd_addr_wb(rd_addr_wb),
      .rd_data_wb(rd_data_wb)
    );
    
    Regs regs(
      .clk(clk),
      .rst(rst),
      .we(sign_wb[21]&~switch_modes),
      .read_addr_1(rs1_addr_id),
      .read_addr_2(rs2_addr_id),
      .write_addr(rd_addr_wb),
      .write_data(rd_data_wb),
      .read_data_1(rs1_data_id),
      .read_data_2(rs2_data_id),
      .cosim_regs(cosim_regs)
    );

    CSRModule csrmodule(
        .clk(clk),
        .rst(rst),
        .csr_we_wb(csr_sign_wb[5]&~switch_modes),
        .csr_addr_wb(csr_addr_wb),
        .csr_val_wb(csr_fin_wb),
        .csr_addr_id(csr_addr_id),
        .csr_val_id(csr_val_id),

        .pc_wb(pc_wb),
        .inst_wb(inst_wb),
        .valid_wb(valid_wb),
        .time_out(time_out),
        .csr_ret_wb(csr_sign_wb[4:3]),
        .csr_we_wb_temp(csr_sign_wb[5]),
        .except_wb(except_wb),

        .priv(priv),
        .switch_mode(switch_modes),
        .pc_csr(pc_csr),

        .cosim_interrupt(cosim_interrupt),
        .cosim_cause(cosim_cause),
        .cosim_csr_info(cosim_csr_info)

    );

endmodule
