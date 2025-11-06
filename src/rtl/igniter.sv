`timescale 1ns / 1ps

module igniter(
    output logic [2:0] position_q,  
    input logic sys_clk,             
    input logic clr_n,              
    input logic enable_move,         
    input logic [3:0] delta          
);

    logic [2:0] position_d;         

    always_comb begin
        if (enable_move)
            position_d = (position_q + delta[2:0]) % 8;  // Use only 3 LSBs of delta
        else
            position_d = position_q; 
    end

    always_ff @(posedge sys_clk or negedge clr_n) begin
        if (!clr_n) begin
            position_q <= 3'b000; // Position_q is zero
        end else begin
            position_q <= position_d; 
        end
    end

endmodule
