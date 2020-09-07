`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/03 16:35:04
// Design Name: 
// Module Name: songle_digit_counter
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

module songle_digit_counter(clk, rst, increase, decrease, upper_bound, lower_bound, up_initial_value, down_initial_value, rst_value, carry, borrow, value);
    input clk, rst, increase, decrease;
    input [3:0] upper_bound;
    input [3:0] lower_bound;
    input [3:0] up_initial_value;
    input [3:0] down_initial_value;
    input [3:0] rst_value;
    output carry, borrow;
    output [3:0] value;
    
    reg [3:0] value_temp;
    reg [3:0] value;
    reg carry, borrow;
    
    always @* begin
        if(increase == 1'b1) begin
            if((value == upper_bound) && increase) begin
                value_temp = up_initial_value;
                carry = `enabled;
                borrow = `disabled;
            end
            else if((value != upper_bound) && increase) begin
                value_temp = value + 1'b1;
                carry = `disabled;
                borrow = `disabled;
            end
            else begin
                value_temp = value;
                carry = `disabled;
                borrow = `disabled;
            end
        end
        
        else begin            
            if(value == lower_bound && decrease) begin
                value_temp = down_initial_value;
                borrow = `enabled;
                carry = `disabled;
            end
            else if(value != lower_bound && decrease) begin
                value_temp = value - 1'b1;
                borrow = `disabled;
                carry = `disabled;
            end
            else begin
                value_temp = value;
                borrow = `disabled;
                carry = `disabled;
            end
        end
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst)
            value <= rst_value;
        else
            value <= value_temp;
    end
    
endmodule
