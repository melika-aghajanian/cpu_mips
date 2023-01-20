`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:10:47 01/18/2023
// Design Name:   Ins_Mem
// Module Name:   E:/CA-prj/Ins_Mem_test.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ins_Mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Ins_Mem_test;

	// Inputs
	reg [15:0] addrss;

	// Outputs
	wire [15:0] data;

	// Instantiate the Unit Under Test (UUT)
	Ins_Mem uut (
		.addrss(addrss), 
		.data(data)
	);

	initial begin
		addrss = 0;
		#100;
		addrss = 1;
		#100;
		addrss = 2;
		#100;
		addrss = 3;
		#100;
	end
      
endmodule

