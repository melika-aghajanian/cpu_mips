`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:12:15 12/31/2022
// Design Name:   CTRL_UNIT
// Module Name:   E:/CA-prj/CTRL_UNIT_test.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CTRL_UNIT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CTRL_UNIT_test;

	// Inputs
	reg [3:0] Opcode;

	// Outputs
	wire RegWr;
	wire RegDes;
	wire AluSrc;
	wire Mem2Reg;
	wire MemR;
	wire MemW;
	wire Branch;
	wire Jump;
	wire sti ;

	// Instantiate the Unit Under Test (UUT)
	CTRL_UNIT uut (
		.Opcode(Opcode), 
		.RegWr(RegWr), 
		.RegDes(RegDes), 
		.AluSrc(AluSrc), 
		.Mem2Reg(Mem2Reg), 
		.MemR(MemR), 
		.MemW(MemW), 
		.Branch(Branch), 
		.Jump(Jump),
		.sti(sti)
	);
	initial begin
		Opcode = 0;
		#100;
		Opcode = 1; 
		#100;
		Opcode = 2;
		#100;
		Opcode = 3;
		#100;
		Opcode = 4;
		#100;
		Opcode = 5;
		#100;
		Opcode = 6;//st
		#100;
		Opcode = 7;//ld
		#100;
		Opcode = 8;
		#100;
		Opcode = 9;
		#100;
		Opcode = 10;
		#100;
		//$finish;
	end 
      
endmodule

