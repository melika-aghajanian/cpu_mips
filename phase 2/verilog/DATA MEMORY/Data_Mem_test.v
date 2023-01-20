`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:52:56 01/18/2023
// Design Name:   Data_Mem
// Module Name:   E:/CA-prj/Data_Mem_test.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Data_Mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Data_Mem_test;

	// Inputs
	reg [15:0] address;
	reg [15:0] write_data;
	reg memw;
	reg memr;
	reg clk;

	// Outputs
	wire [15:0] read_data;

	// Instantiate the Unit Under Test (UUT)
	Data_Mem uut (
		.address(address), 
		.write_data(write_data), 
		.memw(memw), 
		.memr(memr), 
		.clk(clk), 
		.read_data(read_data)
	);

	initial begin
		// Initialize Inputs
		address = 0;
		write_data = 0;
		memw = 0;
		memr = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		address = 0;
		memr = 1;
		#100;
		address = 4;
		memw = 1;
		memr = 0;
		write_data = 25;
		#100;
		memw = 0;
		memr = 1;
		#100;
		address = 1;
		#100;
		address = 2;
		#100;
		address = 3;
		#100;
	end
	always #20 clk = ~clk;
endmodule