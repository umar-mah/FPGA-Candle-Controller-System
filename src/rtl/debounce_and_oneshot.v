`timescale 1ns / 1ps

module debounce_and_oneshot(
    output reg out,
    input btn,
    input clk_50MHz,
    input rst
);

parameter MINWIDTH = 50; 
parameter COUNTERWIDTH = 32;

reg [COUNTERWIDTH-1:0] counter;  
reg shot; 
always @(posedge clk_50MHz or posedge rst) begin
    if (rst) begin
        // Reset everything
        counter <= 0;
        out <= 1'b0;
        shot <= 1'b0;
    end else begin
        if (~btn) begin
            counter <= 0;
            out <= 1'b0;
            shot <= 1'b0;
        end else if (counter < MINWIDTH) begin
            counter <= counter + 1;
            out <= 1'b0;
            shot <= 1'b0;
        end else begin
            counter <= counter;  
            if (shot == 0) begin
                shot <= 1'b1;
                out <= 1'b1;
            end else begin
                out <= 1'b0;
            end
        end
    end
end

endmodule
