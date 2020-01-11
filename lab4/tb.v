module tb;
	// input declarations
	reg clk;
	reg in_ifid;
	reg in_idex;	
	reg in_exwb;

	// output declarations
	wire out_ifid;
	wire out_idex;	
	wire out_exwb;

	// init modules
	ifid ifid_DUT (clk, in_ifid, in_ifid, out_ifid, out_ifid);

	idex idex_DUT(clk, in_idex, in_idex, in_idex, in_idex, in_idex, in_idex, in_idex, in_idex, in_idex, in_idex, in_idex, in_idex, in_idex, in_idex, out_idex, out_idex, out_idex, out_idex, out_idex, out_idex, out_idex, out_idex, out_idex, out_idex, out_idex, out_idex, out_idex, out_idex);

	exwb exwb_DUT(clk, in_exwb, in_exwb, in_exwb, in_exwb, in_exwb, in_exwb, in_exwb, in_exwb, in_exwb, in_exwb, in_exwb, in_exwb, in_exwb, out_exwb, out_exwb, out_exwb, out_exwb, out_exwb, out_exwb, out_exwb, out_exwb, out_exwb, out_exwb, out_exwb, out_exwb, out_exwb);

	initial
	begin
		clk = 0;
		forever #10 clk = ~clk;
	end

	initial
	begin
		// cylce through values, will appear the same on outputs
		in_ifid = 0; in_idex = 1; in_exwb = 2; 
		#20

		in_ifid = 1; in_idex = 2; in_exwb = 0; 
		#20

		in_ifid = 2; in_idex = 0; in_exwb = 1; 

	end


endmodule