module ifid(clk, addr, inst, addr_out, inst_out);
	// init inputs
	input clk;
	input [7:0] addr;
	input [31:0] inst;

	// init outputs
	output reg [7:0] addr_out;
	output reg [31:0] inst_out;

always@(negedge clk)
begin

	// assign outputs to corresponding inputs
    inst_out = inst;
    addr_out = addr;

end

endmodule