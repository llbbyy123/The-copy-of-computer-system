module Regs (
  input         clk,
  input         rst,
  input         we,
  input  [4:0]  read_addr_1,
  input  [4:0]  read_addr_2,
  input  [4:0]  rd_addr_wb,
  input  [63:0] rd_data_wb,
  output [63:0] read_data_1,
  output [63:0] read_data_2
);

  integer i;
  reg [63:0] register [1:31]; // x1 - x31, x0 keeps zero
  reg [63:0] reg1,reg2;
  always@(*)
  begin
    if(read_addr_1==5'b00000)
    reg1={64{1'b0}};
    else
    reg1=register[read_addr_1];
  end
  always@(*)
  begin
    if(read_addr_2==5'b00000)
    reg2={64{1'b0}};
    else
    reg2=register[read_addr_2];
  end
  assign read_data_1 = reg1; // read
  assign read_data_2 = reg2; // read

  always @(posedge clk or posedge rst) 
  begin
      if (rst == 1) 
      for (i=1;i<32;i=i+1) 
      register[i]<={64{1'b0}}; // reset
      else if(we==1)
      register[rd_addr_wb]<=rd_data_wb; // write register
  end

endmodule