`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2024 01:26:12 AM
// Design Name: 
// Module Name: Task2_top
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


module Task2_top(
    input wire CLK100MHZ,    // using the same name as pin names
    input wire CPU_RESETN, 
    input wire BTNC,
    input wire BTNU,
    output wire [3:0] VGA_R,               // VGA red channel
    output wire [3:0] VGA_G,               // VGA green channel
    output wire [3:0] VGA_B,               // VGA blue channel
    output wire VGA_HS,                    // Horizontal sync
    output wire VGA_VS 
    );
    
logic reset_n;
logic clk;
logic button1;
logic button2;
logic f;
logic c1en;
logic black;
logic [7:0]x;
logic [6:0]y;
logic [2:0]color;
logic newClk;

assign reset_n = CPU_RESETN;
assign clk = CLK100MHZ;   
assign button1=BTNC;
assign button2=BTNU;

    n_clockDivider #(.n(1)) clkd1(.clk(clk),.reset(reset_n),.newClk(newClk));
    Task2_fsm fsm1(.clk(newClk),.reset(reset_n),.button1(button1),.button2(button2),.f(f),.black(black),.c1en(c1en));
    Task2_dp   dp1(.clk(newClk),.reset(reset_n),.black(black),.c1en(c1en),.x(x),.y(y),.color(color),.f(f)); 
    vga_core core1(.clk(clk),.resetn(reset_n),.x(x),.y(y),.color(color),.plot(1),.VGA_R(VGA_R),.VGA_G(VGA_G),.VGA_B(VGA_B),.VGA_HS(VGA_HS),.VGA_VS(VGA_VS));
    
endmodule

