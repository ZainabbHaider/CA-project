`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 08:36:10 AM
// Design Name: 
// Module Name: EXMEM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module EXMEM(clk, reset, rd_inp, Branch_inp, MemWrite_inp, MemRead_inp, MemtoReg_inp, RegWrite_inp, PC_In, Result_inp, ZERO_inp, data_inp, data_out, PC_Out, rd_out, Branch_out, MemWrite_out, MemRead_out, MemtoReg_out, RegWrite_out, Result_out, ZERO_out, flush, f3, f3_out);
  
  input clk;
  input reset;
  input [4:0] rd_inp;
  input wire Branch_inp;
  input MemWrite_inp; 
  input MemRead_inp;
  input MemtoReg_inp;
  input RegWrite_inp;
  input wire [63:0] PC_In;
  input [63:0] Result_inp;
  input ZERO_inp;
  input [63:0] data_inp;
  output reg [63:0] data_out;
  output reg [63:0] PC_Out;
  output reg [4:0] rd_out;
   output reg Branch_out;
  output reg MemWrite_out;
  output reg MemRead_out;
  output reg MemtoReg_out; 
  output reg RegWrite_out;
  output reg [63:0] Result_out;
  output reg ZERO_out;
  input flush;
//  input pos;
//  output reg pos_mem;
  input [2:0] f3;
  output reg [2:0] f3_out;
 
  
  always @ (posedge clk or posedge reset)
     begin 
       if (reset)
         begin
           PC_Out<= 0;
           Result_out <=0;
           ZERO_out <= 0;
  		   MemtoReg_out <= 0;
 		   RegWrite_out <= 0;
  		   Branch_out <= 0;
  		   MemWrite_out <= 0;
  		   MemRead_out <= 0;
  		   rd_out <= 0;
  		   data_out <= 0;
//  		   pos_mem<=0;
  		   f3_out <= 0;
         end
       else 
         begin
           PC_Out<= PC_In;
           Result_out <= Result_inp;
           ZERO_out <= ZERO_inp ;
  		   MemtoReg_out <= MemtoReg_inp;
 		   RegWrite_out <= RegWrite_inp;
  		   Branch_out <= Branch_inp;
  		   MemWrite_out <= MemWrite_inp;
  		   MemRead_out <= MemRead_inp;
  		   rd_out <= rd_inp;
  		   data_out <= data_inp;
//  		   pos_mem <= pos;
  		   f3_out <= f3;
         end
         if (flush == 1'b1) begin
  		   MemtoReg_out <= 0;
 		   RegWrite_out <= 0;
  		   Branch_out <= 0;
  		   MemWrite_out <= 0;
  		   MemRead_out <= 0;
         end
     end
endmodule
