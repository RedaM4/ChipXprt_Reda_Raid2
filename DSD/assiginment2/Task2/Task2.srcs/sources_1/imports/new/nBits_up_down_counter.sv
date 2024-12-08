`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 04:24:23 AM
// Design Name: 
// Module Name: nBits_up_down_counter
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


module nBits_up_down_counter #(parameter n=4)(
    input logic clk,
    input logic reset,
    input logic up_down,
    output logic [$clog2(n)-1:0]count 
    );
  //  localparam flipTrig=n/2;
    always@(posedge clk, negedge reset) begin
        if (!reset)
            count <=0;
        else if (up_down == 1)
            count <= count + 1;
        else if (up_down == 0)
            count <= count - 1;
        else count <= count;
     end
endmodule
/*
one for memory
one for branch
add more instructions 
same number of bits 

RA = [imm] is data memory
*/