`timescale 1ns / 1ps

module top_game_tb;

    reg CLK100MHZ;
    reg BTNR;
    reg BTNC;
    reg [3:0] SW;
    wire [7:0] LED;
    wire extinguish;
    top_game dut (
        .CLK100MHZ(CLK100MHZ),
        .BTNR(BTNR),
        .BTNC(BTNC),
        .SW(SW),
        .LED(LED),
        .extinguish(extinguish)
    );

    // Clock generation (100 MHz)
    always #5 CLK100MHZ = ~CLK100MHZ;

    initial begin
        CLK100MHZ = 0;
        BTNR = 0;
        BTNC = 0;
        SW = 4'b0000;

        $display("Applying reset...");
        #20 BTNR = 1;
        #20 BTNR = 0;
        $display("Reset released.");

        // Move match by 0
        $display("Move match by 0...");
        SW = 4'b0000;
        #1000 BTNC = 1;
        #1000 BTNC = 0;
        #100;
        $display("LED output after move by 0: %b", LED);

        // Move match by 1
        $display("Move match by 1...");
        SW = 4'b0001;
        #1000 BTNC = 1;
        #1000 BTNC = 0;
        #100;
        $display("LED output after move by 1: %b", LED);

        // Move match by 2
        $display("Move match by 2...");
        SW = 4'b0010;
        #1000 BTNC = 1;
        #1000 BTNC = 0;
        #100;
        $display("LED output after move by 2: %b", LED);

        // Move match by 3
        $display("Move match by 3...");
        SW = 4'b0011;
        #1000 BTNC = 1;
        #1000 BTNC = 0;
        #100;
        $display("LED output after move by 3: %b", LED);
        
        // Move match by 3
        $display("Move match by 3...");
        SW = 4'b0011;
        #1000 BTNC = 1;
        #1000 BTNC = 0;
        #100;
        $display("LED output after move by 3: %b", LED);
        
        // Move match by 3
        $display("Move match by 3...");
        SW = 4'b0011;
        #1000 BTNC = 1;
        #1000 BTNC = 0;
        #100;
        $display("LED output after move by 3: %b", LED);
        
        // Move match by 2
        $display("Move match by 2...");
        SW = 4'b0010;
        #1000 BTNC = 1;
        #1000 BTNC = 0;
        #100;
        $display("LED output after move by 2: %b", LED);        

       // Move match by 1
        $display("Move match by 1...");
        SW = 4'b0001;
        #1000 BTNC = 1;
        #1000 BTNC = 0;
        #100;
        $display("LED output after move by 1: %b", LED);
        
        // Move match by 2
        $display("Move match by 2...");
        SW = 4'b0010;
        #1000 BTNC = 1;
        #1000 BTNC = 0;
        #100;
        $display("LED output after move by 2: %b", LED);  
        
        // Move match by 2
        $display("Move match by 2...");
        SW = 4'b0010;
        #1000 BTNC = 1;
        #1000 BTNC = 0;
        #100;
        $display("LED output after move by 2: %b", LED); 
        
        // Move match by 2
        $display("Move match by -1...");
        SW = 4'b1111;
        #1000 BTNC = 1;
        #1000 BTNC = 0;
        #100;
        $display("LED output after move by -1: %b", LED); 
                // Move match by 2
        $display("Move match by 6...");
        SW = 4'b0110;
        #1000 BTNC = 1;
        #1000 BTNC = 0;
        #100;
        $display("LED output after move by 6: %b", LED); 
        
        $display("Move match by 5...");
        SW = 4'b0101;
        #1000 BTNC = 1;
        #1000 BTNC = 0;
        #100;
        $display("LED output after move by 5: %b", LED); 
        
        $display("Move match by 1...");
        SW = 4'b0001;
        #1000 BTNC = 1;
        #1000 BTNC = 0;
        #100;
        $display("LED output after move by 1: %b", LED); 
        
        #5000;
        $stop;
    end

endmodule
