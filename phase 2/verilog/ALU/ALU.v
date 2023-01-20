`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:18:58 12/30/2022 
// Design Name: 
// Module Name:    ALU 
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
module ALU( inpA , inpB , opc , res);
	input [15:0]inpA ;
	input [15:0]inpB ;
	input [3:0]opc ;
	output reg [15:0]res ;
	
	always @(*) begin
		
		res = 0 ;
		case (opc)
		
		4'b0000 : res = (inpA + inpB) ; // 0000 +
		4'b0001 : res = (inpA - inpB) ; // 0001 -
		4'b0011 : res = (inpA | inpB) ; // 0011 or
		4'b0100 : res = (inpA & inpB) ; // 0100 and
		4'b0010 :
			if (inpA < inpB) res = 1 ;
			else res = 0 ;
		//4'b0010 : res = (inpA < inpB) ? 1:0 ; // 0010 set less than
		4'b0101 : res = (inpA << inpB) ;// 0101 shift left
		4'b1001 :
			if (inpA == inpB) res = 1 ;
			else res = 0 ;
		default : res = -1 ; // default return value -1
		
		endcase
			
	end
endmodule
