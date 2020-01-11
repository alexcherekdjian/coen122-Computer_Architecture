module tb;


	reg clk;
	

	// stage 1

	wire [7:0] pcOut;
	wire [31:0] pcIn;
	wire [31:0] instrOut;
	wire [31:0] incPCout;
	wire [31:0] ALUout;
	wire [31:0] DataMemout;
	wire jumpMemOut;
	wire Orout;
	wire zDummy1, nDummy1;

	wire [7:0] ifid_addrOut;
	wire [31:0] ifid_instrOut;


	//stage1
	pc _pc(pcIn[7:0] ,pcOut, clk);
	instructionMemory _instructionmemory(pcOut, clk, instrOut);

	alu incPCalu({24'b000000000000000000000000, pcOut}, 0, 4'b0001, nDummy1, zDummy1, incPCout);


	ifid _ifid(clk, pcOut, instrOut, ifid_addrOut, ifid_instrOut);


	// stage 2
	wire [31:0] signExtendOut;
	wire regWrt, MemtoReg, PCtoReg, MemRead, MemWrite, branchN, branchZ, jump, jumpMem;
	wire [3:0] ALUOp;
	wire [31:0] rs ,rt;
	wire zDummy2, nDummy2;
	wire [31:0] SEALUOut;


	wire [31:0] rs_out, rt_out, addr_out;
	wire [5:0] rd_out;
	wire [3:0] alu_op_out;
	wire reg_write_out, branch_z_out, branch_neg_out, memtoreg_out, pctoreg_out, mem_r_out, mem_w_out, jump_out, jump_mem_out;


	controlUnit _controlunit(ifid_instrOut[31:28], regWrt, MemtoReg, PCtoReg, ALUOp, MemRead, MemWrite, branchN, branchZ, jump, jumpMem);


	signExtend _signextend(ifid_instrOut[21:0], signExtendOut);

	alu signExtendALU({24'b000000000000000000000000, ifid_addrOut}, signExtendOut, 4'b0000, nDummy2, zDummy2, SEALUOut);

	idex _idex(clk, rs, rt, SEALUOut, ifid_instrOut[27:22], ALUOp, regWrt, branchZ, branchN, MemtoReg, PCtoReg, MemRead, MemWrite, jump, jumpMem, rs_out, rt_out, addr_out, rd_out, alu_op_out, reg_write_out, branch_z_out, branch_neg_out, memtoreg_out, pctoreg_out, mem_r_out, mem_w_out, jump_out, jump_mem_out);


	// stage 3
	wire [31:0] data_mem_out;
	wire ALU_out_N, ALU_out_Z;
	wire [31:0] ALU_answer;


	wire [31:0] alu_out3, data_mem_out3, addr_out3;
	wire [5:0] rd_out3;
	wire n_out3, z_out3, reg_write_out3, memtoreg_out3, pctoreg_out3, branch_neg_out3, branch_z_out3, jump_out3, jump_mem_out3;


	dataMemory _datamemory(rs_out, rt_out, mem_r_out, mem_w_out, clk, data_mem_out);
	alu _alu(rs_out, rt_out, alu_op_out, ALU_out_N, ALU_out_Z, ALU_answer);


	exwb _exwb(clk, ALU_answer, data_mem_out, addr_out, rd_out, ALU_out_N, ALU_out_Z, reg_write_out, memtoreg_out, pctoreg_out, branch_neg_out, branch_z_out, jump_out, jump_mem_out, alu_out3, data_mem_out3, addr_out3, rd_out3, n_out3, z_out3, reg_write_out3, memtoreg_out3, pctoreg_out3, branch_neg_out3, branch_z_out3, jump_out3, jump_mem_out3);


	// stage 4
	wire [31:0]muxFourOut;
	wire andOneOut;
	wire andTwoOut;
	wire orOut;

	andGate andOne(n_out3, branch_neg_out3, andOneOut);
	andGate andTwo(z_out3, branch_z_out3, andTwoOut);
	orGate _or(andOneOut, andTwoOut, orOut);

	mux stageFour(alu_out3, data_mem_out3, addr_out3, 32'b00000000000000000000000000000000, {pctoreg_out3,memtoreg_out3}, muxFourOut);


	register registerFile(clk, reg_write_out3, ifid_instrOut[21:16], ifid_instrOut[15:10], rd_out3, muxFourOut, rs, rt);

	mux pcMux(incPCout, alu_out3, data_mem_out3, 32'b00000000000000000000000000000000, {jump_mem_out3, orOut}, pcIn);


	// init clock
	initial
    begin
        clk = 0;
        forever #5 clk = ~clk; 
    end


endmodule