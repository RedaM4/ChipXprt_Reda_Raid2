`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 05:03:51 AM
// Design Name: 
// Module Name: Task2_fsm_sim
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


module Task2_fsm_sim;


logic clk=0;
logic reset=0;
logic button1;
logic button2;
logic f;
logic black;
logic c1en;

    Task2_fsm fsm1(.clk(clk),.reset(reset),.button1(button1),.button2(button2),.f(f),.black(black),.c1en(c1en));
    
    always #10 clk = !clk;
    
    
    initial begin
    #5
    reset=1;
    button1=0;
    button2=0;
    f=0;
    #20;
    #20;
    #20;
    #20;
    #20;
    button1=1;
    button2=0;
    f=0;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    button1=0;
    button2=0;
    f=1;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    button1=0;
    button2=1;
    f=0;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    button1=0;
    button2=0;
    f=1;
    #20;
    #20;
    #20;
    #20;
    #20;
    $finish;
    end
endmodule
