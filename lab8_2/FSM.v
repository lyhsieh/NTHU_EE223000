`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/02 21:40:58
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


module FSM(clk_100hz, rst, plus_processed, minus_processed, state);
    input clk_100hz, rst, plus_processed, minus_processed;
    output [3:0] state;
    
    reg [3:0] state;
    reg [3:0] state_next;
    
    always @* begin
        if(plus_processed == 1'b1) begin
            case(state)
                4'd0: state_next = 4'd1;
                4'd1: state_next = 4'd2;
                4'd2: state_next = 4'd3;
                4'd3: state_next = 4'd4;
                4'd4: state_next = 4'd5;
                4'd5: state_next = 4'd6;
                4'd6: state_next = 4'd7;
                4'd7: state_next = 4'd8;
                4'd8: state_next = 4'd9;
                4'd9: state_next = 4'd10;
                4'd10: state_next = 4'd11;
                4'd11: state_next = 4'd12;
                4'd12: state_next = 4'd13;
                4'd13: state_next = 4'd14;
                4'd14: state_next = 4'd15;
                4'd15: state_next = 4'd15;
                default: state_next = 4'd0;
            endcase
        end
        else if(minus_processed == 1'b1) begin
            case(state)
                4'd0: state_next = 4'd0;
                4'd1: state_next = 4'd0;
                4'd2: state_next = 4'd1;
                4'd3: state_next = 4'd2;
                4'd4: state_next = 4'd3;
                4'd5: state_next = 4'd4;
                4'd6: state_next = 4'd5;
                4'd7: state_next = 4'd6;
                4'd8: state_next = 4'd7;
                4'd9: state_next = 4'd8;
                4'd10: state_next = 4'd9;
                4'd11: state_next = 4'd10;
                4'd12: state_next = 4'd11;
                4'd13: state_next = 4'd12;
                4'd14: state_next = 4'd13;
                4'd15: state_next = 4'd14;
                default: state_next = 4'd0;    
            endcase
        end
        else begin
            state_next = state;
        end
    end
    
    always @(posedge clk_100hz or negedge rst) begin
        if(~rst)
            state <= 4'd0;
        else
            state <= state_next;
    end
endmodule
