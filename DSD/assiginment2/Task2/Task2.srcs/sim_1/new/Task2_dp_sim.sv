module Task2_dp_sim;



    logic clk=0;
    logic reset=0;
    logic black;
    logic c1en;
    logic [7:0]x;
    logic[6:0]y;
    logic color;
    logic f;

Task2_dp tsp1(.clk(clk),.reset(reset));


always #10 clk= !clk;



initial begin 
    #5;
    reset=1;
    #15;
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
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    //$finish;
end
/*
module Task2_dp(
    input logic clk,
    input logic reset,
    input logic black,
    input logic c1en,
    output logic [7:0]x,
    output logic [6:0]y,
    output logic color,
    output logic f
    );
    */

endmodule