module video_memory (
    input wire clk_write,                // Write clock
    input wire resetn,
    input wire write_enable,             // Write enable
    input wire [14:0] write_address,     // Write address (14 bits for 160x120)
    input wire [14:0] read_address,      // Read address
    input wire [2:0] data_in,            // Pixel data input
    input logic plot , 
    output reg [2:0] data_out            // Pixel data output
);

//  // Instantiate Block Memory Generator from vivado
//    blk_mem_gen_0 blk_mem_gen_0_inst (
//        .clka(clk_write),              // Write clock
//        .ena(write_enable),            // Write enable
//        .wea(write_enable),            // Write enable
//        .addra(write_address),         // Write address
//        .dina(data_in),                // Data input
//        .douta(data_out)               // Data output
//    );


   logic [2:0] ram [0:19199];
   
   always @(posedge clk_write) 
   begin
//   if(write_enable) ram[write_address] <= data_in;
      if(write_enable==1) begin ram[write_address] <= data_in;  end // 100 = Red
  //    else ram[read_address] <= 0;

   end
   
   always @(*)
   begin 
        data_out <= ram[read_address];
        

             
        
//       data_out = 4 ;
//        if (plot == 1  ) 
//        data_out <= ram[read_address];
//        else     data_out <= 0;


   end
endmodule
