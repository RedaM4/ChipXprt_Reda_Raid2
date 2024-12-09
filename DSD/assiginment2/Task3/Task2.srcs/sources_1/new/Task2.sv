`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 02:48:21 PM
// Design Name: 
// Module Name: Task2
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

module Task3 #(parameter n=8)(
    input logic clk, reset, b,
    input logic [n-1:0] Xc, Yc,
    input logic [5:0] r,
    output logic [7:0] Xo,
    output logic [6:0] Yo,
    output logic plot
//    output   logic [n-1:0] d
);

    // Internal Signals
    logic [n-1:0] x, y, Count;
    logic signed [n-1:0] d;
    logic F;
    typedef enum logic [3:0] {check, more, less, comp, plotting, init, idle} state_t;
    state_t current_state, next_state;

    // State Transition Logic
    always_ff @(posedge clk or negedge reset) begin
        if (!reset)
            current_state <= idle;
        else
            current_state <= next_state;
    end

    // Next State Logic
    always_comb begin
        case (current_state)
            idle: 
                next_state = b ? init : idle;

            init: 
                next_state = (x <= y) ? plotting : init;

            plotting: 
                next_state = (Count == 7) ? comp : plotting;

            comp: 
                next_state = (d>=0) ? more : less;

            less, more: 
                next_state = check;

            check: 
                next_state = F ? idle : plotting;

            default: 
                next_state = idle;
        endcase
    end

    // Counter Logic for Count
    always_ff @(posedge clk or negedge reset) begin
        if (!reset) 
            Count <= 0;
        else if (current_state == plotting) begin
            if (Count < 7)
                Count <= Count + 1;
            else
                Count <= 0;
        end else 
            Count <= 0;
    end

    // Initialization Logic for init State
//    always_ff @(posedge clk or negedge reset) begin
//        if (!reset) begin
//            y <= 0;
////            d <= 0;
//        end else if (current_state == init) begin
//           // x <= 0;
//            y <= r;
//        end else if(current_state == more)  
//           y <= y - 1;
////          if (current_state == comp)
////                x <= x + 1;
//    end

    // Plotting Logic for plotting State
    always_ff @(posedge clk or negedge reset) begin
        if (!reset) begin
            Xo <= 0;
            Yo <= 0;
            plot <= 0;
        end else if (current_state == plotting) begin
            plot <= 1;
            case (Count)
                0: begin Xo <= Xc + x; Yo <= Yc + y; end
                1: begin Xo <= Xc - x; Yo <= Yc + y; end
                2: begin Xo <= Xc + x; Yo <= Yc - y; end
                3: begin Xo <= Xc - x; Yo <= Yc - y; end
                4: begin Xo <= Xc + y; Yo <= Yc + x; end
                5: begin Xo <= Xc - y; Yo <= Yc + x; end
                6: begin Xo <= Xc + y; Yo <= Yc - x; end
                7: begin Xo <= Xc - y; Yo <= Yc - x; end
            endcase
        end else begin
            plot <= 0;
        end
    end
// Sequential logic for x and y
always_ff @(posedge clk or negedge reset) begin
    if (!reset) begin
        x <= 0;
        y <= 0;
    end else begin
        case (current_state)
            comp: begin
                x <= x + 1;
            end

            init: begin
                x <= 0;
                y <= r;
            end

            more: begin
                y <= y - 1;
            end

            default: begin
                x <= x; // Maintain previous value
                y <= y; // Maintain previous value
            end
        endcase
    end
end

// Sequential logic for d
always_ff @(posedge clk or negedge reset) begin
    if (!reset) begin
        d<= 0;
    end else begin
        case (current_state)
            init: begin
                d <= 3 - (r << 1);
            end

            less: begin
                d <= d + (x << 2) + 6;
            end

            more: begin
                d <= d + ((x - y) << 2) + 10;
            end

            default: begin
                d <= d; // Maintain previous value
            end
        endcase
    end
end




assign F = (x > y) ;


endmodule
