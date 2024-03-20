module Pc(
    input wire switch_mode,
    input wire j_taken_exe,
    input wire [63:0] alu_result_exe,
    input wire br_taken_exe,
    input wire [63:0] pc,
    input wire  npc_sel,
    input wire [63:0] pc_csr,
    output wire [63:0] next_pc,
    input wire stall,
    input wire jump_if,
    input wire [63:0] pc_target_if,
    input wire [63:0] pc_exe,
    input wire [1:0] exe_change
);
reg [63:0] pc_out1;
always@(*)
begin
    if(switch_mode)
    pc_out1=pc_csr;
    else if(stall)
    pc_out1=pc;
    else if(exe_change==2'b00)
    pc_out1=pc_exe+4;
    else if(exe_change==2'b10)
    pc_out1=alu_result_exe;
    else if(jump_if)
    pc_out1=pc_target_if;
    else
    pc_out1=pc+4;
end
assign next_pc=pc_out1;
endmodule