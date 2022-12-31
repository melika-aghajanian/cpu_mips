`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:32:55 12/31/2022 
// Design Name: 
// Module Name:    CTRL_UNIT 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CTRL_UNIT( Opcode ,  RegWr , RegDes ,
						 AluSrc , Mem2Reg , MemR ,
						 MemW , Branch ,Jump  );
	input [3:0]Opcode ;
	output reg RegWr ;
	output reg RegDes ;
	output reg AluSrc ;
	output reg Mem2Reg ;
	output reg MemR ;
	output reg MemW ;
	output reg Branch ;
	output reg Jump ;
	reg add ;
	reg sub ;
	reg lt ;
	reg oor ;
	reg aand ;
	reg shl ;
	reg ld ;
	reg st ;
	reg sli ;
	reg br ;
	reg jump ;
	reg op0,op1,op2,op3 ;
	always @(*) begin
		{op3,op2,op1,op0} = Opcode ;
		add = ~op3 && ~op2 && ~op1 && ~op0 ;
		sub = ~op3 && ~op2 && ~op1 && op0 ;
		lt = ~op3 && ~op2 && op1 && ~op0 ;
		oor = ~op3 && ~op2 && op1 && op0 ;
		aand = ~op3 && op2 && ~op1 && ~op0 ;
		shl = ~op3 && op2 && ~op1 && op0 ;
		ld = ~op3 && op2 && op1 && op0 ;
		st = ~op3 && op2 && op1 && ~op0 ;
		sli = op3 && ~op2 && ~op1 && ~op0 ;
		br = op3 && ~op2 && ~op1 && op0 ;
		jump = op3 && ~op2 && op1 && ~op0 ;
		
		RegWr = add || sub || lt || oor || aand || shl || ld || sli ;
		RegDes = add || sub || lt || oor || aand || shl ;
		AluSrc = ld || st || sli ;
		Mem2Reg = ld ;
		MemR = ld ;
		MemW = st ;
		Branch = br ;
		Jump = jump ;
	end
endmodule
