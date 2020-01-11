module register(clk, writeSignal, rs_addr, rt_addr, rd_addr, dataIn, rsOut, rtOut);
    
    // input declarations
    input clk;
    input writeSignal; // write signal
    input [5:0] rs_addr; // input for read one
    input [5:0] rt_addr; // input for read two
    input [5:0] rd_addr; // dest write if flag is up
    input [31:0] dataIn; // data on line
    
    // output declarations
    output reg [31:0] rsOut; // output for read one
    output reg [31:0] rtOut; // output for read two
    reg [31:0] regs [63:0];

    always@(posedge clk) 
    begin
        if(writeSignal) 
            regs[rd_addr] <= dataIn; // write data in into a register
        
        // else read data out
        rsOut <= regs[rs_addr]; 
        rtOut <= regs[rt_addr];

    end


endmodule
