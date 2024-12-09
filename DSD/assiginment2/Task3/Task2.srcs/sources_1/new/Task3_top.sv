`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2024 11:32:29 AM
// Design Name: 
// Module Name: Task3_top
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
module Task3_top(
    input wire CLK100MHZ,                        // Clock input for the entire system
    input wire CPU_RESETN,                     // Asynchronous reset for the system
    input wire BTNR,                          // idle to init
//    input wire [7:0] Xc,                   // X-coordinate center input for Task3 79
//    input wire [6:0] Yc,                   // Y-coordinate center input for Task3 59
    //input wire [7:0] r,                    // Radius input for Task3 6-bit sw 3-7 from input
   input wire[7:0]SW,                    // color = SW[7:5]   r = SW[4:0
   // input logic [2:0] color,                // Pixel color input for VGA cor\
   output logic [3:0] VGA_R,               // VGA red channel
    output logic [3:0] VGA_G,               // VGA green channel
    output logic [3:0] VGA_B,               // VGA blue channel
    output logic VGA_HS,                    // Horizontal sync
     //output logic plot,  
     output logic VGA_VS                     // Vertical sync
);
logic [7:0] Xc;
logic [7:0]Yc ; 
assign Xc = 79 ; 
assign Yc = 59 ; 

logic [5:0]r ;
 assign r = SW[4:0];//5 bits for raduis
 logic [2:0] color ;
 assign color = SW[7:5]; 
 logic b;
assign b=BTNR ; 

logic clk,reset ; 
assign clk = CLK100MHZ;
assign reset = CPU_RESETN ; 

logic plot ; 
    // Internal wires to connect Task3 to vga_core
    wire [7:0] Xo;                         // X-coordinate output from Task3
    wire [6:0] Yo;                         // Y-coordinate output from Task3
// logic [7:0]d ; 

    // Instantiate Task3
    (* dont_touch = "true"*)Task3 #(.n(8)) u_Task3 (
        .clk(clk),
        .reset(reset),                    // Using resetn for Task3 reset
        .b(b),
        .plot(plot),                       // Pass plot signal
        .Xc(Xc),
        .Yc(Yc),
        .r(r),
        .Xo(Xo),                           // Output from Task3
        .Yo(Yo)
//        .d(d)                                  // Output from Task3
    );
    // Instantiate vga_core
    vga_core #(.MEM_INIT_FILE("default.mem")) u_vga_core (
        .clk(clk),
        .resetn(reset),
        .x(Xo),                            // Connect Xo from Task3 to x input of vga_core
        .y(Yo),                            // Connect Yo from Task3 to y input of vga_core
        .color(color),
        .plot(plot),                       // Pass plot signal
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS)
    );

endmodule
