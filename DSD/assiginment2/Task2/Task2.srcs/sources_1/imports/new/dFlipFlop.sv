`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 10:53:09 PM
// Design Name: 
// Module Name: dFlipFlop
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


module dFlipFlop(
    input logic clk,
    input logic reset,
    input logic d,
    output logic q,
    output logic qb
    );
    
    assign qb=~q;
    
    always@(posedge clk, negedge reset) begin
        if(!reset)
            q<=1'b0;
        else
            q<=d;
    end
endmodule
