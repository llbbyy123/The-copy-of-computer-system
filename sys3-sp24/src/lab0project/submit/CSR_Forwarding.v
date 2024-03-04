module CSR_Forwarding(
    input wire [63:0] csr_val_id,
    input wire [63:0] csr_fwd_exe,
    input wire [63:0] csr_fwd_mem,
    input wire [63:0] csr_fwd_wb,
    input wire is_csr_id,
    input wire is_csr_exe,
    input wire is_csr_mem,
    input wire is_csr_wb,
    input wire [11:0] csr_addr_id,
    input wire [11:0] csr_fwd_addr_exe,
    input wire [11:0] csr_fwd_addr_mem,
    input wire [11:0] csr_fwd_addr_wb,
    output reg [63:0] csr_val_fwd
);
wire con_exe,con_mem,con_wb;
assign con_exe=(is_csr_id&&is_csr_exe&&csr_addr_id==csr_fwd_addr_exe);
assign con_mem=(is_csr_id&&is_csr_mem&&csr_addr_id==csr_fwd_addr_mem);
assign con_wb=(is_csr_id&&is_csr_wb&&csr_addr_id==csr_fwd_addr_wb);

always@(*)
begin
    if(con_exe)
        csr_val_fwd=csr_fwd_exe;
    else if(con_mem)
        csr_val_fwd=csr_fwd_mem;
    else if(con_wb)
        csr_val_fwd=csr_fwd_wb;
    else
        csr_val_fwd=csr_val_id;
end
endmodule