module exwb(clk, alu, datamem, addr, rd, n, z, reg_write, memtoreg, pctoreg, branch_neg, branch_z, jump, jump_mem, alu_out, data_mem_out, addr_out, rd_out, n_out, z_out, reg_write_out, memtoreg_out, pctoreg_out, branch_neg_out, branch_z_out, jump_out, jump_mem_out);

	input clk;
    input [31:0] alu;
	input [31:0] datamem;
	input [31:0] addr;
	input [5:0] rd;

	input n;
	input z;
	input reg_write;
	input memtoreg;
	input pctoreg;
	input branch_neg;
	input branch_z;
	input jump;
	input jump_mem;

	output reg [31:0] alu_out;
	output reg [31:0] data_mem_out;
	output reg [31:0] addr_out;
	output reg [5:0] rd_out;

	output reg n_out;
	output reg z_out;
	output reg reg_write_out;
	output reg memtoreg_out;
	output reg pctoreg_out;
	output reg branch_neg_out;
	output reg branch_z_out;
	output reg jump_out;
	output reg jump_mem_out;
	
	
	always@(posedge clk)
	begin

		// assign outputs to corresponding inputs
		alu_out = alu;
		data_mem_out = datamem;
		addr_out = addr;
		rd_out = rd;

		n_out = n;
		z_out = z;
		reg_write_out = reg_write;
		memtoreg_out = memtoreg;
		pctoreg_out = pctoreg;
		branch_neg_out = branch_neg;
		branch_z_out = branch_z;
		jump_out = jump;
		jump_mem_out = jump_mem;

	end

endmodule