`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/30 00:25:35
// Design Name: 
// Module Name: FSM
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
`define twenty_four_hr_system 2'b00
`define twelve_hr_system 2'b01
`define date 2'b10
`define year 2'b11


module FSM(clk_100hz, rst, press_processed, state);
    input clk_100hz, rst;
    input press_processed;
    output [1:0] state;
    
    reg [1:0] state;
    reg [1:0] state_next;
    
    always @* begin
        case(press_processed)
            1'b0: begin
                if(state == `twenty_four_hr_system) state_next = `twenty_four_hr_system;
                else if(state == `twelve_hr_system) state_next = `twelve_hr_system;
                else if(state == `date) state_next = `date;
                else state_next = `year;                
            end
            default: begin
                if(state == `twenty_four_hr_system) state_next = `twelve_hr_system;
                else if(state == `twelve_hr_system) state_next = `date;
                else if(state == `date) state_next = `year;
                else state_next = `twenty_four_hr_system;
            end
        endcase
    end
    
    always @(posedge clk_100hz or negedge rst) begin
        if(~rst) begin
            state <= 2'b00;
        end
        else begin
            state <= state_next;
        end
    end
endmodule
