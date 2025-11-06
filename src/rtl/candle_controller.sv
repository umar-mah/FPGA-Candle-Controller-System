`timescale 1ns / 1ps

module candle_controller(
    output logic [7:0] candle_state,  
    input logic [2:0] pos_to_set,      
    input logic [2:0] pos_to_clear,    
    input logic set_enable,            
    input logic clear_enable,          
    input logic sys_clk,               
    input logic clr_async              
);

    always_ff @(posedge sys_clk or posedge clr_async) begin 
        if (clr_async) 
            candle_state <= 8'b00000000;
        else begin
            if (set_enable) 
                candle_state[pos_to_set] <= 1;    // Set the specified candle bit
            if (clear_enable)
                candle_state[pos_to_clear] <= 0;  // Clear the specified candle bit
        end
    end

endmodule
