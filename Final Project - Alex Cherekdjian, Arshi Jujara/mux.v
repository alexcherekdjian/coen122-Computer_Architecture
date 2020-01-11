module mux(A, B, C, D, S, out);
	
	// input declarations
	input [31:0] A, B, C, D;
	input [1:0] S;

	// output declarations
	output reg [31:0] out;
	
	always@(*)
	begin

		case(S)
			0 : out = A; // if select = 00, assign A to out
			1 : out = B; // if select = 01, assign B to out
			2 : out = C; // if select = 10, assign C to out
			3 : out = D; // if select = 11, assign D to out

		endcase
	end

endmodule