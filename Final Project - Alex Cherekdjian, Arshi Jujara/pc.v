module pc(PCin, PCout, clk);
    input clk;
    input [7:0] PCin;
    output reg [7:0] PCout;
    
	initial
	begin
		PCout = 0;
	end
    
	always@(negedge clk)
	begin
		if(PCin)
			PCout = PCin;
	end

endmodule
