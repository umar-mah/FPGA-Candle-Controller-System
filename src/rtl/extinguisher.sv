`timescale 1ns / 1ps

module extinguisher(
    input logic [2:0] position,  
    input logic enable,
    input logic sys_clk,
    output logic extinguish, 
    input logic clr_n
);

    logic [3:0] counter;  

    always_ff @(posedge sys_clk or negedge clr_n) begin
        if (!clr_n)
            counter <= 0; // Reset Counter
        else
            counter <= counter + 1; 
    end

    always_ff @(posedge sys_clk) begin
        if (enable && (counter[2:0] == position)) // BTNC Enabled
            extinguish <= 1;  // Extinguish enable
        else
            extinguish <= 0;
    end

endmodule
