`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2025 01:25:35 AM
// Design Name: 
// Module Name: tb
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


module extinguisher_tb;

    logic [2:0] position;
    logic enable;
    logic sys_clk;
    logic extinguish;
    logic clr_n;

    extinguisher dut (
        .position(position),
        .enable(enable),
        .sys_clk(sys_clk),
        .extinguish(extinguish),
        .clr_n(clr_n)
    );

    always #5 sys_clk = ~sys_clk;  

    initial begin
        sys_clk = 0;
        clr_n = 0;
        enable = 0;
        #15;

        clr_n = 1;
        #10;

        enable = 1;
        repeat (20) begin
            #10;
        end

        enable = 0;
        #50;
        clr_n = 0;
        #10;

        $finish;
    end

endmodule

