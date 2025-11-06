`timescale 1ns / 1ps 

module top (
    input wire CLK100MHZ, 
    input wire BTNR,           
    input wire BTNC,           
    input wire [3:0] SW,       
    output wire [7:0] LED      
);

    logic btn_pulse;
    logic [7:0] candle_state;
    logic [2:0] match_position;
    logic extinguish;

    // Debounce and one-shot for button press
    debounce_and_oneshot debounce_inst (
        .out(btn_pulse),    // Filtered pulse output
        .btn(BTNC),         // Raw button input
        .clk_50MHz(CLK100MHZ), 
        .rst(BTNR)
    );

    // Igniter module
    igniter igniter_inst (
        .position_q(match_position),
        .sys_clk(CLK100MHZ),
        .clr_n(~BTNR),
        .enable_move(btn_pulse), 
        .delta(SW)
    );

    // Candle control
    candle_controller candle_ctrl_inst (
        .candle_state(candle_state),
        .pos_to_set(match_position),
        .pos_to_clear(3'b000),
        .set_enable(btn_pulse), 
        .clear_enable(extinguish), 
        .sys_clk(CLK100MHZ),
        .clr_async(BTNR)
    );

    // Extinguisher module
    extinguisher extinguisher_inst (
        .position(match_position), 
        .enable(btn_pulse), 
        .sys_clk(CLK100MHZ),
        .extinguish(extinguish),
        .clr_n(~BTNR)
    );
    assign LED = candle_state;

endmodule
