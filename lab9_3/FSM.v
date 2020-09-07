`timescale 1ns / 1ps

`define left1 3'b000
`define left2 3'b001
`define right1 3'b010
`define right2 3'b011
`define calc 3'b100

module FSM(clk, rst, number, pattern, sel);
    input clk, rst, number, pattern;
    output [3:0] sel;
    
    reg [1:0] in;
    reg [3:0] sel;
    reg [3:0] sel_next;
    reg [2:0] state;
    reg [2:0] state_next;
    
    always @* begin
        in = {number, pattern};
    end
    
    always @* begin
        case(state)
            `left1: begin
                if(in == 2'b10 || in == 2'b11) begin
                    sel_next = 4'b0000;
                    state_next = `left2;                 
                end
                else begin
                    sel_next = 4'b1001;
                    state_next = `left1;
                end
            end
            `left2: begin
                if(in == 2'b10 || in == 2'b11) begin
                    sel_next = 4'b0010;
                    state_next = `right1;
                end
                else begin
                    sel_next = 4'b0001;
                    state_next = `left2;
                end
            end
            `right1: begin
                if(in == 2'b10 || in == 2'b11) begin
                    sel_next = 4'b0100;
                    state_next = `right2;
                end
                else begin
                    sel_next = 4'b0011;
                    state_next = `right1;
                end
            end
            `right2: begin
                if(in == 2'b10 || in == 2'b11) begin
                    sel_next = 4'b0110;
                    state_next = `calc;
                end
                else begin
                    sel_next = 4'b0101;
                    state_next = `right2;
                end
            end
            `calc: begin
                if(in == 2'b01 || in == 2'b11) begin
                    sel_next = 4'b1000;
                    state_next = `left1;
                end
                else begin
                    sel_next = 4'b0111;
                    state_next = `calc;
                end
            end
            default: begin
                sel_next = 4'b1001;
                state_next = `left1;
            end
        endcase
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst) 
            sel <= 4'b1001;               
        else
            sel <= sel_next;      
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst)
            state <= `left1;
        else 
            state <= state_next;
    end
endmodule
