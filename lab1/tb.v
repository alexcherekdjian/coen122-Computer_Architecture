module tb;
	// input declarations
	reg a,b,c,d;
	reg [1:0] select;

	// output declarations
	wire out;

	// instantiate device under test
	mux DUT(a, b, c, d, select, out); 

	initial
		begin
			//iverilog -o a.vvp alu.v tb.v
			// ./a.vvp
			// double click on file made
			      $dumpfile("mux.vcd");
      			      $dumpvars(0, tb);

			// output data
			$monitor("select = %b a = %b b = %b c = %b  d = %b  out = %b", select, a, b, c, d, out);

			// set 'a' to high and low and show output
		    select = 0; a = 0; b = 1; c= 1; d=1;
			#10 
			select = 0; a = 1; b = 0; c= 0; d=0;
			#10
			
			// set 'b' to high and low and show output
		    select = 1; a = 1; b = 0; c= 1; d=1;
			#10 
			select = 1; a = 0; b = 1; c= 0; d=0;
			#10

			// set 'c' to high and low and show output
			select = 2; a = 1; b = 1; c= 0; d=1;
			#10 
			select = 2; a = 0; b = 0; c= 1; d=0;
			#10
			
			// set 'd' to high and low and show output
		    select = 3; a = 1; b = 1; c= 1; d=0;
			#10 
			select = 3; a = 0; b = 0; c= 0; d=1;
		end

endmodule