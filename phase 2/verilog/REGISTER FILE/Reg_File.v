`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:47:26 01/18/2023 
// Design Name: 
// Module Name:    Reg_File 
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
module Reg_File(input clk, input [15:0] writedata,
					 input regwrite, input [4:0] rs,
					 input [4:0] rt,input [4:0] regdst,
					 output wire [15:0] reg_rs_data, output wire [15:0] reg_dt_data);

	reg[15:0] memory [0:15];
	always @(posedge clk) begin
		if(regwrite)
			memory[regdst] <= writedata;//write data on reddst location
	end
	assign reg_ds_data = memory[rs];// read from read1 location
	assign reg_dt_data = memory[rt];// read from read2 location
endmodule