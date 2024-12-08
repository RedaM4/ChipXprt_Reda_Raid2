`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 03:41:38 PM
// Design Name: 
// Module Name: Task2_sim
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
/*
module Task3 #(parameter n=8)(
    input logic clk, reset, b,
    input logic [n-1:0] Xc, Yc,
    input logic [5:0] r,
    output logic [7:0] Xo,
    output logic [6:0] Yo,
    output logic plot
);
*/

module Task3_sim;

//module Task3 #(parameter n=8)(
//    input logic clk, reset, b,
//    input logic [n-1:0] Xc, Yc,
//    input logic [5:0] r,
//    output logic [7:0] Xo,
//    output logic [6:0] Yo,
//    output logic plot
//);
  localparam n=8 ; 
  logic clk;
  logic reset;
  logic b;
  logic plot;
  logic [7:0] Xo;
  logic [6:0]Yo;
  logic [n-1:0]Xc;
  logic [n-1:0]Yc;
  logic [5:0]r; 
    
  Task3 #(n) ff(clk,reset,b,Xc,Yc,r,Xo,Yo,plot) ; 
  
   initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    
    initial begin
reset=0 ; b=0;Xc=12 ; Yc=10 ;r=2 ; 
#10
#10

#10
b=1;
reset=1 ; 
#10
#10

b=0;


end
    
endmodule