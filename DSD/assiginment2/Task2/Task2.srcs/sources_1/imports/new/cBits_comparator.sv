`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 05:46:15 AM
// Design Name: 
// Module Name: cBits_comparator
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
module nBits_up_down_counter #(parameter n=4)(
    input logic clk,
    input logic reset,
    input logic up_down,
    output logic [n-1:0]count 
    );
    
    always@(posedge clk, negedge reset) begin
        if (!reset)
            count <=0;
        else if (up_down == 1)
            count <= count + 1;
        else if (up_down == 0)
            count <= count - 1;
     end
endmodule
*/

module nBits_comparator #(parameter n=4)(
    input logic [$clog2(n)-1:0]count,
    output logic signal,
    output logic resetSignal,
    input logic clk,
    input reset
    );
    //localparam flipTrig=n/2;
            
    
    //assign signal       = (count==flipTrig-1);
    //assign resetSignal  = ~(count==flipTrig);
    
    
    always_ff@(negedge clk, negedge reset) begin
       
       if(!reset)begin 
            signal<=0;
            resetSignal<=0;
       end
       else if(count == n-1)begin
            signal<=1; 
            resetSignal<=0;          
       end
       else begin
            signal <=0;
            resetSignal <= 1;
            end
    end
    
    
endmodule
