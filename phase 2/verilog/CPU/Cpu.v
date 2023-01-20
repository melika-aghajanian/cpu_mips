`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:06:06 01/18/2023 
// Design Name: 
// Module Name:    Cpu 
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
module Cpu(input clk);



	reg [15:0] pc;
	wire regwrite;
	wire memwrite;
	wire memread;
	wire memtoreg;
	wire ALUsrc;
	wire branch;
	wire regdst;
	wire jump;
	wire [15:0] ins_data;
	wire [15:0] reg_d1;
	wire [15:0] reg_d2;
	wire [15:0] out;
	wire [15:0] readdata;
	Ins_Mem ins_mem(pc, ins_data);
	always @(posedge clk)
	begin
		if ( (jump) )
			pc <= (ins_data[11:0] & 16'b0000111111111111 );
		else if (branch && (!out[0])) begin
			pc <= (ins_data[3:0] & 16'b0000000000001111 ) ;
		end else
			pc <= pc + 4;
	end
	reg [4:0] out_reg_dst;
	always @(*) 
	begin
		if (regdst)
			out_reg_dst <= ins_data [3:0];
		else
			out_reg_dst <= ins_data [7:4];
	end
	CTRL_UNIT control_unit(ins_data [15:12],regwrite, regdst, ALUsrc, memtoreg, memread, memwrite, branch, jump , sti);
	reg [15:0] out_write_data;
	always @(*)
	begin
		if (memtoreg)
			out_write_data <= readdata;
		else
			out_write_data <= out;
		if (sti)
			out_write_data <= (ins_data[7:0] & 16'b0000000011111111 ) ;
	end
	Reg_File reg_file(clk, out_write_data, regwrite, ins_data [11:8], ins_data [7:4], out_reg_dst, reg_d1, reg_d2);
	//ALU_Control alu_control(ALUop, ins_data [10:6], ctr);
	reg [31:0] inp_alu;
	always @(*)
	begin
		if (ALUsrc)
			inp_alu <= (ins_data[3:0] & 16'b0000000000001111 );
		else
			inp_alu <= reg_d2;
	end
	ALU alu(reg_d1, inp_alu,ins_data [15:12], out);
	Data_Mem data_memory(out [15:0], reg_d2, memwrite, memread, clk, readdata);
	
endmodule
