`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 09:51:19 AM
// Design Name: 
// Module Name: Task2_top_sim
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


module Task2_top_sim;

/*
module Task2_dp(
    input logic clk,
    input logic reset,
    input logic black,
    input logic c1en,
    output logic [7:0]x,
    output logic [6:0]y,
    output logic [2:0]color,
    output logic f
    );
    */
    logic clk=0;
    logic reset=0;
    logic button1=0;
    logic button2=0;
    logic f;
    logic black;
    logic c1en;
    logic [7:0]x;
    logic [6:0]y;
    logic [2:0]color;
    
    Task2_fsm fsm1(.clk(clk),.reset(reset),.button1(button1),.button2(button2),.f(f),.black(black),.c1en(c1en));
    Task2_dp   dp1(.clk(clk),.reset(reset),.black(black),.c1en(c1en),.x(x),.y(y),.color(color),.f(f)); 
    
    
    always #10 clk = !clk;
    
    initial begin
        #5
        reset=1;
        #15
        #20
        #20
        button1=1;
        #20
        #20
        #20
        #20
        #20
        #20
        #20
        #20
        #20
        #20
        #20
        #20
        #20;
        button1=0;
       // $finish;
        end
        
        
    
endmodule
