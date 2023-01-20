`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:19:14 01/18/2023 
// Design Name: 
// Module Name:    Data_Mem 
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
module Data_Mem(input[15:0] address, input[15:0] write_data,
					 input memw, input memr, input clk, output[15:0] read_data);
					 
		reg[15:0] memory [0:65535];
	/* for testing
	initial
	begin
		memory[0] = 32'b1010111;//87
		memory[1] = 32'b1010011;//83
		memory[2] = 32'b100110;//38
		memory[3] = 32'b11100;//28
	end
	//*/
	always @(posedge clk) begin
		if (memw)
			memory[address] <= write_data;
	end
	assign read_data = (memr) ? memory[address] : 0;
endmodule
