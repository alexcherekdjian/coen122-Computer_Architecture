module signExtend(in , out);
    input [21:0] in;
    output [31:0] out;
    
    assign out = in[21] ? {10'b1111111111, in} : {10'b0000000000, in};
    
endmodule
