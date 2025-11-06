`timescale 1ns / 1ps

module candle_controller_tb;

    logic [7:0] candle_state;  
    logic [2:0] pos_to_set;    
    logic [2:0] pos_to_clear;  
    logic set_enable;          
    logic clear_enable;        
    logic sys_clk;             
    logic clr_async;           

    candle_controller dut (
        .candle_state(candle_state),
        .pos_to_set(pos_to_set),
        .pos_to_clear(pos_to_clear),
        .set_enable(set_enable),
        .clear_enable(clear_enable),
        .sys_clk(sys_clk),
        .clr_async(clr_async)
    );

    always #5 sys_clk = ~sys_clk;

    initial begin

        sys_clk = 0;
        clr_async = 1;  
        set_enable = 0;
        clear_enable = 0;
        pos_to_set = 3'b000;
        pos_to_clear = 3'b000;

        #10 clr_async = 0;  
        #10;

        // Set position 3
        set_enable = 1;
        pos_to_set = 3;
        #10 set_enable = 0;

        // Set position 5
        set_enable = 1;
        pos_to_set = 5;
        #10 set_enable = 0;

        // Clear position 3
        clear_enable = 1;
        pos_to_clear = 3;
        #10 clear_enable = 0;

        // Set and clear position 2 at the same time
        set_enable = 1;
        clear_enable = 1;
        pos_to_set = 2;
        pos_to_clear = 2;
        #10 set_enable = 0; clear_enable = 0;

        // Clear position 2
        clear_enable = 1;
        pos_to_clear = 2;
        #10 clear_enable = 0;
        
        #20 
        clr_async = 1;  
        #10
        $finish;
    end

endmodule
