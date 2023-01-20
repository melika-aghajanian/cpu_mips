`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:22 01/18/2023 
// Design Name: 
// Module Name:    Ins_Mem 
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
module Ins_Mem(input [15:0] addrss , output [15:0] data);
	reg[15:0] memory [0:65535];
	initial
		$readmemh("code.txt",memory);
	assign data = memory[addrss];
endmodule
