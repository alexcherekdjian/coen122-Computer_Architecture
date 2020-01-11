module ifid(clk, addr, inst, addr_out, inst_out);
	// init inputs
	input clk;
	input [7:0] addr;
	input [31:0] inst;

	// init outputs
	output reg [7:0] addr_out;
	output reg [31:0] inst_out;

always@(posedge clk)
begin

	// assign outputs to corresponding inputs
    inst_out = inst;
    addr = addr_out;

end

endmodule