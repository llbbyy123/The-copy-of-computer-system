// DESCRIPTION: Verilator generated Verilog
// Wrapper module for DPI protected library
// This module requires libcontroller.a or libcontroller.so to work
// See instructions in your simulator for how to use DPI libraries

module controller (
        input  [31:0]  comb_decode_inst,
         output reg  [23:0]  comb_decode
    );
wire [21:0] r_sign,i_sign,s_sign,b_sign,u_sign,j_sign;
wire [6:0] decode;
assign decode=comb_decode_inst[6:2];
always@(*)
begin
    case(comb_decode_inst[6:2])
      5'b01100:comb_decode[21:0]=r_sign;
      5'b01110:comb_decode[21:0]=r_sign;
      5'b00100:comb_decode[21:0]=i_sign;
      5'b00110:comb_decode[21:0]=i_sign;
      5'b00000:comb_decode[21:0]=i_sign;//load
      5'b01000:comb_decode[21:0]=s_sign;
      5'b11000:comb_decode[21:0]=b_sign;
      5'b01101:comb_decode[21:0]=u_sign;//lui
      5'b00101:comb_decode[21:0]=u_sign;//auipc
      5'b11011:comb_decode[21:0]=j_sign;//jal
      5'b11001:comb_decode[21:0]=j_sign;//jalr
      default:comb_decode[21:0]=r_sign;
    endcase
end

r_type type1(
    .inst(comb_decode_inst),
    .sign(r_sign)
);   

i_type type2(
    .inst(comb_decode_inst),
    .sign(i_sign)
);

s_type type3(
    .inst(comb_decode_inst),
    .sign(s_sign)
);

b_type type4(
    .inst(comb_decode_inst),
    .sign(b_sign)
);

u_type type5(
    .inst(comb_decode_inst),
    .sign(u_sign)
);

j_type type6(
    .inst(comb_decode_inst),
    .sign(j_sign)
);
always@(*)
begin
    comb_decode[22]=~(decode==5'b01101|decode==5'b00101|decode==5'b11011);
    comb_decode[23]=decode==5'b01100|decode==5'b01110|decode==5'b01000|decode==5'b11000;
end

endmodule

