`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/13 19:31:23
// Design Name: 
// Module Name: upcounter
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

module upcounter(increase, upper_bound, initial_value, rst_value, clk_1hz, rst, value, carry);
    input increase, clk_1hz, rst;
    input [3:0] upper_bound;
    input [3:0] initial_value;
    input [3:0] rst_value;
    output [3:0] value;
    output carry;
    
    reg [3:0] value_temp;
    reg [3:0] value;
    reg carry;
    
    always @* begin
        if((value == upper_bound) && increase) begin
            value_temp = initial_value;
            carry = `enabled;
        end
        else if((value != upper_bound) && increase) begin
            value_temp = value + 1'b1;
            carry = `disabled;
        end
        else begin
            value_temp = value;
            carry = `disabled;
        end
    end
    
    always @(posedge clk_1hz or negedge rst) begin
        if(~rst) begin
            value <= rst_value;
        end
        else begin
            value <= value_temp;
        end
    end
endmodule
