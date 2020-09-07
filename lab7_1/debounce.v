`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/30 17:05:16
// Design Name: 
// Module Name: debounce
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


module debounce(clk_100hz, rst, pb_in, pb_debounced);
    input clk_100hz, rst, pb_in;
    output pb_debounced;
    
    reg [3:0] debounce_window;
    reg pb_debounced_next, pb_debounced;
    
    always @(posedge clk_100hz or negedge rst) begin
        if(~rst) begin
            debounce_window <= 4'b0000;
        end
        else begin
            debounce_window <= {debounce_window [2:0], pb_in};
        end
    end
    
    always @(posedge clk_100hz or negedge rst) begin
        if(~rst) begin
            pb_debounced <= 1'b0;
        end
        else begin
            pb_debounced <= pb_debounced_next;
        end
    end
    
    always @* begin
        if(debounce_window == 4'b1111) begin
            pb_debounced_next = 1'b1;
        end
        else begin
            pb_debounced_next = 1'b0;
        end
    end
endmodule
