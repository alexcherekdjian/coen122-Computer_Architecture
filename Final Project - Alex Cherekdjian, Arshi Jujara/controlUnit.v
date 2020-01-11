module controlUnit(opcode, regWrt, MemtoReg, PCtoReg, ALUop, MemRead, MemWrite, branchN, branchZ, jump, jumpMem);
    input [3:0] opcode;
    
    output reg regWrt;
    output reg MemtoReg;
    output reg PCtoReg;
    output reg [3:0] ALUop;
    output reg MemRead;
    output reg MemWrite;
    output reg branchN;
    output reg branchZ;
    output reg jump;
    output reg jumpMem;

//    initial 
//    begin
//        regWrt = 0;
//        MemtoReg = 0;
//        PCtoReg = 0;
//        branchZ = 0;
//        ALUop = 4'b0000;
//        MemRead = 0;
//        MemWrite = 0;
//        jump = 0;
//        jumpMem = 0;
//        branchN = 0;
//    end

    always@(opcode)
    begin

        regWrt = 0;
        MemtoReg = 0;
        PCtoReg = 0;
        branchZ = 0;
        ALUop = 4'b0100;
        MemRead = 0;
        MemWrite = 0;
        jump = 0;
        jumpMem = 0;
        branchN = 0;

        // ALU OPS
        // 0000 ADD
        // 0001 INC
        // 0010 NEG
        // 0011 SUB
        // 0100 PASS

        if(opcode == 4'b0000)begin // no op
            regWrt = 0; MemtoReg = 0; PCtoReg = 0; ALUop = 4'b0100; MemRead = 0; MemWrite = 0; branchN = 0; branchZ = 0; jump = 0; jumpMem = 0;
        end
        if(opcode == 4'b1111)begin // load pc
            regWrt = 1; PCtoReg = 1; ALUop = 4'b0100;
        end
        if(opcode == 4'b1110)begin // load
            regWrt = 1; MemtoReg = 1; MemRead = 1; ALUop = 4'b0100;
        end
        if(opcode == 4'b0011)begin // store
            MemWrite = 1; ALUop = 4'b0100;
        end
        if(opcode == 4'b0100)begin // add
            regWrt = 1; ALUop = 4'b0000;
        end
        if(opcode == 4'b0101)begin // inc
            regWrt = 1; ALUop = 4'b0001; 
        end
        if(opcode == 4'b0110)begin // negate
            regWrt = 1; ALUop = 4'b0010;
        end
        if(opcode == 4'b0111)begin // sub
            regWrt = 1; ALUop = 4'b0011;
        end
        if(opcode == 4'b1000)begin // jump
            jump = 1; ALUop = 4'b0100;
        end
        if(opcode == 4'b1001)begin // b zero
            branchZ = 1; ALUop = 4'b0100;
        end
        if(opcode == 4'b1010)begin // jmp memory
            MemRead = 1; jumpMem = 1; ALUop = 4'b0100;
        end
        if(opcode == 4'b1011)begin // b neg
            branchN = 1; ALUop = 4'b0100;
        end
    end
    
endmodule
