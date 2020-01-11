module orGate(A, B, C);

	input A;
	input B;

	output reg C;

	initial
	begin
		C = 0;
	end

	always@(A or B)
	begin

		if(A == 0 && B == 0) begin	
			C = 0;
		end

		else begin
			C = 1;
		end
			
	end

endmodule
