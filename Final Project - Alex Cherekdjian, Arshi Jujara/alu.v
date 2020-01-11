module alu(A, B, Sel, N, Z, out);
    
    // input declarations
    input [31:0] A;
    input [31:0] B;
    input [3:0] Sel;
    
    // output declarations
    output reg N;
    output reg Z;
    output reg [31:0] out;
    
    always@(A,B,Sel)
    begin
        case(Sel)
   
            0: out = A + B; // adding
            1: out = A + 1; // increment
            2: out = (~A) + 1; // negate
            3: out = A + ((~B) + 1); // subtract
            default: out = A; // pass A value
        
        endcase
        
        
    end

    always@(out)
    begin
       if(Sel != 4) begin 
            Z = 0; // set initial flag to low
            if(out == 0)begin
                Z = 1; // if output is zero, set flag
            end
            
            N = 0; // set initial flag to high
            if(out[31] == 1)begin
                N = 1; // if output is negative, set flag
            end
            
        end
    end
    
endmodule
