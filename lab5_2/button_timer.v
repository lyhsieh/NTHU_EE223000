`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/30 22:02:58
// Design Name: 
// Module Name: button_timer
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


module button_timer(clk, press, rst_or_not);
    input clk, press;  
    output rst_or_not;
    reg [28:0] x;  //a counter for 500M requires 29 bits
    reg [28:0] x_temp;
    reg rst_or_not;
    
    always @* begin
        if(press == 1'b0) begin
            x_temp = 29'b0;
        end
        else begin
            x_temp = x + 1'b1;
        end
    end
    
    always @(posedge clk) begin
        x <= x_temp;
    end
    
    always @* begin
        if(x >= 300000000) begin
            rst_or_not = 1'b1;
        end
        else begin
            rst_or_not = 1'b0;
        end
    end
endmodule
