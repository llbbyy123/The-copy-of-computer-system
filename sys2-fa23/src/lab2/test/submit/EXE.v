module EXE(
    input wire [63:0] pc_exe,
    input wire [31:0] inst_exe,
    input wire [23:0] sign_exe,
    input wire [63:0] rs1_data_exe,
    input wire [63:0] rs2_data_exe,
    input wire [63:0] imm,
    output wire [63:0] alu_result,
    output wire [63:0] data_mem_exe,
    output wire [7:0] mask_exe,
    output wire br_taken_exe,
    output reg j_taken_exe,
    output reg [63:0] rd_fwd_exe
);
reg [63:0] data1,data2;
wire [1:0] alu_asel,alu_bsel;
wire [63:0] result;

assign alu_asel=sign_exe[8:7];
assign alu_bsel=sign_exe[6:5];

always@(*)//决定ALU的第一个输入
begin
  case(alu_asel)
      2'b01:data1=rs1_data_exe;
      2'b10:data1=pc_exe;
      default:data1={64{1'b0}};
  endcase
end

always@(*)//决定ALU的第二个输入
begin
  case(alu_bsel)
      2'b10:data2=imm;
      2'b01:data2=rs2_data_exe;
      default:data2={64{1'b0}};
  endcase
end

ALU alu(
    .alu_op(sign_exe[15:12]),
    .a(data1),
    .b(data2),
    .res(result)
);
assign alu_result=result;
Dataout dataout(
  .addr_out(result[2:0]),
  .data_out(rs2_data_exe),
  .memdata_width(sign_exe[2:0]),
  .data_mem(data_mem_exe)
);
Mask mask1(
  .addr_out(result[2:0]),
  .memdata_width(sign_exe[2:0]),
  .mask(mask_exe)
);

Branch_compare cmp(
  .data1(rs1_data_exe),
  .data2(rs2_data_exe),
  .bralu_op(sign_exe[11:9]),
  .br_taken(br_taken_exe)
);

always@(*)begin
  if(sign_exe[18:16]==3'b101)
  j_taken_exe=1'b1;
  else
  j_taken_exe=1'b0;
end

always@(*)//决定写入目标寄存器的数据来自�???
begin
  case (sign_exe[4:3])
    2'b00:rd_fwd_exe={64{1'b0}};
    2'b01:rd_fwd_exe=result;
    2'b10:rd_fwd_exe={64{1'b0}};
    2'b11:rd_fwd_exe=pc_exe+4;
  endcase
end
endmodule