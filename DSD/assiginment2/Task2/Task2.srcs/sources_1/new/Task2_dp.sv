`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 04:05:28 AM
// Design Name: 
// Module Name: Task2_dp
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

module Task2_fsm(
    input logic clk,
    input logic reset,
    input logic button1,
    input logic button2,
    input logic f,
    output logic black,
    output logic c1en
    );
    */
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
    
    localparam xCount=160;
    localparam yCount=120;
    
    
    logic [$clog2(xCount)-1:0]countX;
    logic [$clog2(yCount)-1:0]countY;
    
    logic resetSignalX;
    logic resetSignalY;
    
    logic signalX;
    logic signalY;
    
    logic [2:0]yColor;
    logic signalXdelayed;
    
    assign resetSignalX=!signalX;
    assign resetSignalY=!signalY;

    assign yColor   ={countY[2],countY[1],countY[0]};
    
    assign f    =   signalXdelayed & signalY;
    
    
    assign x=countX;
    assign y=countY;
    
    nBits_up_down_counter #(.n(xCount)) upCntr1(.clk(c1en&clk),.reset((reset & resetSignalX)),.up_down(1),.count(countX));
    nBits_comparator #(.n(xCount)) cmpX(.clk(clk),.reset(reset),.count(countX),.signal(signalX));
    nBits_up_down_counter #(.n(yCount)) upCntr2(.clk(signalX),.reset((reset & resetSignalY)),.up_down(1),.count(countY));
    nBits_comparator #(.n(yCount)) cmpY(.clk(clk),.reset(reset),.count(countY),.signal(signalY));
    n_2x1mux #(.n(3)) mux1(.a(yColor),.b(3'b000),.s(black),.res(color));
    dFlipFlop dff1(.clk(clk),.reset(reset),.d(signalX),.q(signalXdelayed));
  
  /*
  
    input wire clk,                        // Clock input
    input wire resetn,                      // resetn signal
    input wire [7:0] x,                    // X-coordinate (8 bits for 160)
    input wire [6:0] y,                    // Y-coordinate (7 bits for 120)
    input wire [2:0] color,                // Pixel color input (3 bits)
    input wire plot,    
    
        */
endmodule
