module instructionMemory(addr, clk, instr);
    
    // input declarations
    input clk;
    input [7:0] addr;
    
    // output declarations
    output reg [31:0] instr;
    wire [31:0] instr_set [255:0];
    
        assign instr_set[0] = 32'b1111_0000_0100_0000_0000_0001_0000_0000;   //LDPC
        assign instr_set[1] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        assign instr_set[2] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        assign instr_set[3] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        
        assign instr_set[4] = 32'b0101_0000_1000_0001_0000_0000_0000_0000;   //INC
        assign instr_set[5] = 32'b0110_0000_1100_0001_0000_0000_0000_0000;   //NEG
        assign instr_set[6] = 32'b1111_0010_1000_0000_0000_0000_0000_1010;   //LDPC  to label 1
        assign instr_set[7] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        assign instr_set[8] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        assign instr_set[9] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        
        assign instr_set[10] = 32'b1011_0000_0000_1010_0000_0000_0000_0000;   //BRN
        assign instr_set[11] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        assign instr_set[12] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        assign instr_set[13]= 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        assign instr_set[14] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        
        assign instr_set[15] = 32'b0101_0000_1000_0010_0000_0000_0000_0000;  //INC
        assign instr_set[16] = 32'b0011_0000_0000_0001_0000_0100_000_00000;  //ST
        assign instr_set[17] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        assign instr_set[18] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        assign instr_set[19] = 32'b1110_0001_0000_0001_0000_0000_0000_0000;  //LD
        assign instr_set[20] = 32'b0100_0001_0100_0001_0000_1000_0000_0000;  //ADD
        assign instr_set[21] = 32'b0111_0001_1000_0100_0000_0100_0000_0000;  //SUB
        assign instr_set[22] = 32'b1111_0010_1100_0000_0000_0000_0000_1010;  //LDPC to label 2
        assign instr_set[23] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        assign instr_set[24] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        assign instr_set[25] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
       
        assign instr_set[26] = 32'b1001_0000_0000_1011_0000_0000_0000_0000;  //BRZ
        assign instr_set[27] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        assign instr_set[28] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        assign instr_set[29] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        assign instr_set[30] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
    
        assign instr_set[31] = 32'b0101_0000_1000_0010_0000_0000_0000_0000;  //INC
        assign instr_set[32] = 32'b1010_0000_0000_0001_0000_0000_0000_0000;  //JM
        assign instr_set[33] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        assign instr_set[34] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        assign instr_set[35] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        assign instr_set[36] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        assign instr_set[37] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        assign instr_set[256] = 32'b1000_0000_0000_0001_0000_0000_0000_0000;  //JUMP


    always@(posedge clk) 
    begin
        instr <= instr_set[addr]; // give current instruction based on address inputed
    end
    
endmodule
