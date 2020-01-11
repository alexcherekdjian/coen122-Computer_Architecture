module idex(clk, rs, rt, addr, rd, alu_op, reg_write, branch_z, branch_neg, memtoreg, pctoreg, mem_r, mem_w, jump, jump_mem, rs_out, rt_out, addr_out, rd_out, alu_op_out, reg_write_out, branch_z_out, branch_neg_out, memtoreg_out, pctoreg_out, mem_r_out, mem_w_out, jump_out, jump_mem_out);

    //init inputs
    input clk;
    input [31:0] rs;
	input [31:0] rt;
	input [31:0] addr;
	input [5:0] rd;
	input [3:0] alu_op;

	input reg_write;
	input branch_z;
	input branch_neg;
	input memtoreg;
	input pctoreg;
	input mem_r;
	input mem_w;
	input jump;
	input jump_mem;

    //init outputs
    output reg [31:0] rs_out;
	output reg [31:0] rt_out;
	output reg [31:0] addr_out;
	output reg [5:0] rd_out;
	output reg [3:0] alu_op_out;

	output reg reg_write_out;
	output reg branch_z_out;
	output reg branch_neg_out;
	output reg memtoreg_out;
	output reg pctoreg_out;
	output reg mem_r_out;
	output reg mem_w_out;
	output reg jump_out;
	output reg jump_mem_out;

	always@(negedge clk)
    begin
    
		// assign outputs to corresponding inputs
		rs_out = rs;
		rt_out = rt;
		addr_out = addr;
		rd_out = rd;
		alu_op_out = alu_op;

		reg_write_out = reg_write;
		branch_z_out = branch_z;
		branch_neg_out = branch_neg;
		memtoreg_out = memtoreg;
		pctoreg_out = pctoreg;
		mem_r_out = mem_r;
		mem_w_out = mem_w;
		jump_out = jump;
		jump_mem_out = jump_mem;
    end

endmodule