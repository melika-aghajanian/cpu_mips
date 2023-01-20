`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:22:00 12/30/2022
// Design Name:   ALU
// Module Name:   E:/CA-prj/ALU_test.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_test;

	// Inputs
	reg [15:0] inpA;
	reg [15:0] inpB;
	reg [3:0] opc;

	// Outputs
	wire [15:0] res;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.inpA(inpA), 
		.inpB(inpB), 
		.opc(opc), 
		.res(res)
	);

	initial begin
		inpA = 8 ;
		inpB = 2 ;

		opc = 0 ;// 8+2 = 10
		#100;
      opc = 1 ;// 8-2 = 6
		#100;
      opc = 3 ;// 8(0000000000001000) or 2(0000000000000010) = 10(0000000000001010) 
		#100;
      opc = 4 ;// 8(0000000000001000) and 2(0000000000000010) = 0(0000000000000000)
		#100;
      opc = 5 ;// 8<<2 = 32
		#100; 
      opc = 2 ;// 8<2  = 1 
		#100; 
		opc = 9 ;// branch
		#100;
		//$finish;

	end
       
endmodule

