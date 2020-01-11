module tb;
    
    // input declarations
    reg clk;
    reg write;
    reg [5:0] rs;
    reg [5:0] rt;
    reg [5:0] rd;
    reg [31:0] dataIn;
    reg [7:0] im_addr;
    reg [31:0] dm_addr;
    reg [31:0] dm_in;
    reg dm_read;
    reg dm_write;
    
    // output declarations
    wire [31:0] rsOut;
    wire [31:0] rtOut;
    wire [31:0] im_instr;    
    wire [31:0] dm_out;
    
    register register_DUT(clk, write, rs, rt, rd, dataIn, rsOut, rtOut);
    instructionMemory im_DUT(im_addr, clk, im_instr);
    dataMemory dm_DUT(dm_addr, dm_in, dm_read, dm_write, clk, dm_out);
   
    initial
    begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    
    
    initial
    begin
        // testing register
        rd = 1; dataIn = 42; write = 1;
        #15
        write = 0;
        #15
        rd = 2; dataIn = 43; write = 1;
        #15
        write = 0;
        #15
        rs = 1; rt = 2;

    end
    
    initial
    begin
        // testing instruction memory
        #15
        im_addr = 0;
        #15
        im_addr = 1;
        #15
        im_addr = 2;
    
    end
    
    initial
    begin
        // testing data memory
        #15
        dm_addr = 1; dm_in = 44; dm_write = 1;
        #15
        dm_write = 0;
        #15
        dm_read = 1;
    end

endmodule
