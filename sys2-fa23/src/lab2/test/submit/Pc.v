module Pc(
    input wire j_taken_exe,
    input wire [63:0] alu_result_exe,
    input wire br_taken_exe,
    input wire [63:0] pc,
    input wire  npc_sel,
    output wire [63:0] next_pc,
    input wire stall
);
reg [63:0] pc_out1;
always@(*)
begin
    if(stall)
    pc_out1=pc;
    else if((npc_sel&&br_taken_exe)||j_taken_exe)
    pc_out1=alu_result_exe;
    else
    pc_out1=pc+4;
end
assign next_pc=pc_out1;
endmodule