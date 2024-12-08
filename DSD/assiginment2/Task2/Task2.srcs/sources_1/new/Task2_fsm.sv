

module Task2_fsm(
    input logic clk,
    input logic reset,
    input logic button1,
    input logic button2,
    input logic f,
    output logic black,
    output logic c1en
    );
    
    
    typedef enum logic [2:0] {IDLE,COLOR,BLACK} state;
    state current_state,next_state;
    
    //next_state block
    always_comb begin
        case(current_state)
            IDLE:   if(button1==1'b1 & button2==1'b0)
                        next_state=COLOR;
                    else if (button1==1'b0 & button2==1'b1)
                        next_state=BLACK;
                    else
                        next_state=IDLE;
            COLOR:  if(f==1'b1)
                        next_state=IDLE;
                    else
                        next_state=COLOR;
            BLACK:  if(f==1'b1)
                        next_state=IDLE;
                    else
                        next_state=BLACK;
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
        if(current_state==BLACK)begin
            black=1'b1;
            c1en=1'b0;
        end
        
        else if(current_state==COLOR)begin
            black=1'b0;
            c1en=1'b1;
        end
        
        else begin
            black=1'b0;
            c1en=1'b0;
        end
     end
     
    endmodule