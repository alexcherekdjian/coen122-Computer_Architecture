module dataMemory(addr, in, read, write, clk, out);

    // input declarations
    input [31:0] addr;
    input [31:0] in;
    input read;
    input write;
    input clk;
    
    // output declarations
    output reg [31:0] out;
    reg [31:0] data [65535:0];
    
    always@(posedge clk)
    begin
   
        if(write) begin
            data[addr[15:0]] <= in; // if write enabled then write to specified address
        end
        
        if(read) begin
            out <= data[addr[15:0]]; // if read enabled then read data from address to output
        end
       
    end
    
    
endmodule
