module instructionMemory(addr, clk, instr);
    
    // input declarations
    input clk;
    input [7:0] addr;
    
    // output declarations
    output reg [31:0] instr;
    wire [31:0] instr_set [255:0];
    
    // for testing purposes
    assign instr_set[0] = 50;
    assign instr_set[1] = 51;
    assign instr_set[2] = 52;

    always@(posedge clk) 
    begin
        instr <= instr_set[addr]; // give current instruction based on address inputed
    end
    
endmodule
