

module Task2_fsm(
    input logic clk,
    input logic reset,
    input logic button1,
    input logic button2,
    input logic f,
    output logic black,
    output logic c1en,
    output logic [2:0]stateSig
    );
    
    
    typedef enum logic [1:0] {IDLE,COLOR,BLACK} state;
    state current_state,next_state;
    
    //next_state block
    always_comb begin
        case(current_state)
            IDLE:   if(button1)
                        next_state=COLOR;
                    else if (button2)
                        next_state=BLACK;
                    else
                        next_state=IDLE;
            COLOR:  if(f)
                        next_state=IDLE;
                    else
                        next_state=COLOR;
            BLACK:  if(f)
                        next_state=IDLE;
                    else
                        next_state=BLACK;
             default: next_state = IDLE;
         endcase
     end
            
    
    
    
    //transition block
    always@(posedge clk, negedge reset)begin
        if(!reset)
            current_state<=IDLE;
        else
            current_state<=next_state;
        end
    
    
    
    
    //output logic block
    always_comb begin
        case(current_state)
            BLACK: begin black=1'b1; c1en=1'b1; stateSig=2'b01; end
            COLOR: begin black=1'b0; c1en=1'b1; stateSig=2'b10; end
            IDLE : begin black=1'b0; c1en=1'b0; stateSig=2'b11; end
            default: begin black=1'b0; c1en=1'b0; stateSig=2'b11; end
        endcase
     end
     
    endmodule