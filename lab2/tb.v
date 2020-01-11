module tb;
    
    // input declarations
    reg [31:0] A;
    reg [31:0] B;
    reg [3:0] sel;

	// output declarations    
    wire [31:0] out;
    wire Z;
    wire N;
   
	// instantiate device under test 
    alu DUT(A, B, sel, N, Z, out);
    
    initial
        begin

 		 $dumpfile("alu.vcd");
      	      $dumpvars(0, tb);
     
        sel = 0; A = 8; B = 4; // add
        #50
        sel = 1; A = 8; B = 4; // increment
        #50
        sel = 2; A = 8; B = 4; // negate and negate flag
        #50
        sel = 3; A = 8; B = 8; // subtract and zero flag
        #50
        sel = 4; A = 8; B = 4; // pass A value
         
        end 

endmodule
