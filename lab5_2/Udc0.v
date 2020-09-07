`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/29 22:59:12
// Design Name: 
// Module Name: Udc0
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

`define enabled 1'b1
`define disabled 1'b0

module Udc0(clk, rst, decrease, rst_value, limit, value, borrow);
    input clk, rst, decrease;
    input [3:0] rst_value;
    input [3:0]limit;
    output [3:0] value;
    output borrow;
    
    wire clk_1hz;
    reg [3:0] value_temp;
    reg [3:0] value;
    reg borrow;
    
    
    always @* begin
        if(value == 4'b0 && decrease) begin
            value_temp = limit;
            borrow = `enabled;
        end
        else if(value != 4'b0 && decrease) begin
            value_temp = value - 1'b1;
            borrow = `disabled;
        end
        else begin
            value_temp = value;
            borrow = `disabled;
        end
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst) begin
            value <= rst_value;
        end
        else begin
            value <= value_temp;
        end
    end
    
endmodule
