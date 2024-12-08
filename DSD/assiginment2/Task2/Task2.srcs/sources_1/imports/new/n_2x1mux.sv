`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 08:38:58 PM
// Design Name: 
// Module Name: n_2x1mux
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


module n_2x1mux #(parameter n=4)(
    input logic [n-1:0]a,
    input logic [n-1:0]b,
    input logic s,
    output logic [n-1:0]res
    );
    
    assign res = s ? b : a;
        
endmodule
