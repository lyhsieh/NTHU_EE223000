`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/18 17:08:17
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
`define left 1'b0
`define right 1'b1

module FSM(sel, clk, rst, press_processed);
    input clk, rst, press_processed;
    output [1:0] sel;
    
    reg state, state_next;
    reg [1:0] sel;
    reg [1:0] sel_next;
    
    always @* begin
        if(state == `left) begin
            if(press_processed == 1'b1) begin
                state_next = `right;
                sel_next = 2'b01;
            end
            else begin
                state_next = `left;
                sel_next = 2'b00;
            end
        end
        else begin
            if(press_processed == 1'b1) begin
                state_next = `left;
                sel_next = 2'b11;
            end
            else begin
                state_next = `right;
                sel_next = 2'b10;
            end
        end    
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst) begin
            state <= `left;
            sel <= 2'b00;
        end
        else begin
            state <= state_next;
            sel <= sel_next;
        end
    end
    
endmodule
