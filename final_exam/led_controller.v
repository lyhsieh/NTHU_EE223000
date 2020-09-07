`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/03 17:37:43
// Design Name: 
// Module Name: led_controller
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


module led_controller(value0, value1, value2, value3, clk_1hz, led);
    input [3:0] value0;
    input [3:0] value1;
    input [3:0] value2;
    input [3:0] value3;
    input clk_1hz;
    output [15:0] led;
    
    reg [7:0] value;
    reg [15:0] led;
    
    
    
    always @* begin
        if(value2 == 4'd0)
            led = 16'b0;
        else if(value2 == 4'd1)
            led = 16'b0000_0000_0000_1111;
        else if(value2 == 4'd2)
            led = 16'b0000_0000_1111_1111;
        else if(value2 == 4'd3)
            led = 16'b0000_1111_1111_1111;
        else if(value2 == 4'd4)
            led = 16'b1111_1111_1111_1111;
        else begin
            led[0] = clk_1hz;
            led[1] = clk_1hz;
            led[2] = clk_1hz;
            led[3] = clk_1hz;
            led[4] = clk_1hz;
            led[5] = clk_1hz;
            led[6] = clk_1hz;
            led[7] = clk_1hz;
            led[8] = clk_1hz;
            led[9] = clk_1hz;
            led[10] = clk_1hz;
            led[11] = clk_1hz;
            led[12] = clk_1hz;
            led[13] = clk_1hz;
            led[14] = clk_1hz;
            led[15] = clk_1hz;
        end
    end
    
endmodule
