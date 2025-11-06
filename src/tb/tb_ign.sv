`timescale 1ns / 1ps
module tb;

    logic [2:0] position_q;
    logic sys_clk;
    logic clr_n;
    logic enable_move;
    logic [3:0] delta;
    
    igniter dut (
        .position_q(position_q),
        .sys_clk(sys_clk),
        .clr_n(clr_n),
        .enable_move(enable_move),
        .delta(delta)
    );

    always #5 sys_clk = ~sys_clk; // (100 MHz)

    initial begin
        sys_clk = 0;
        clr_n = 0;           
        enable_move = 0;
        delta = 4'b0000;

        #10 clr_n = 1;       
        #10 enable_move = 1; delta = 3; // 3
        #10 enable_move = 1; delta = -2; // -2 
        #10 enable_move = 1; delta = 6; // 6
        #10 enable_move = 1; delta = -5; // -5
        #10 enable_move = 0; delta = 2; // Hold position
        #10 clr_n = 0;
        #10 $finish;         
    end
endmodule
