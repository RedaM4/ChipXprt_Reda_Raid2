`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2024 01:46:12 PM
// Design Name: 
// Module Name: Task3_top_sim
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

module Task3_top_sim;

    // Local Parameters
   // localparam n = 8;

    // Testbench Signals
    logic CPU_RESETN=0;
    logic BTNR=0;
    logic [7:0] SWt=8'b00000000;
    logic [3:0] VGA_R, VGA_G, VGA_B;
    logic VGA_HS, VGA_VS;
    logic BTNC=0;
    // Instantiate the Task3_top module
    Task3_top uut (
        .CLK100MHZ(BTNC),
        .CPU_RESETN(CPU_RESETN),
        .BTNR(BTNR),
        .SW(SWt),
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS)
    );

    // Clock Generation
    initial begin
        //BTNC = 0;
        forever #10 BTNC = ~BTNC; // 10 ns clock period
    end

    // Test Stimulus
    initial begin
        // Initialize inputs
        //CPU_RESETN = 0;    // Active-low reset

        #5
        CPU_RESETN = 1; // Release reset
        #15
        BTNR = 1;          // Stay in idle
        SWt = 8'b10000101;  // Radius = 5, Color = Green=10

        #10 BTNR = 1;       // Transition to init state
        #20 BTNR = 0;       // Back to idle

        #50 $finish;        // End simulation
    end

endmodule

