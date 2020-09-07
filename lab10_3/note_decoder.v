`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/26 21:31:57
// Design Name: 
// Module Name: note_decoder
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


module note_decoder(double, last_change, key_down, note_div_left, note_div_right);
    input double;
    input [8:0] last_change;
    input [511:0] key_down;
    output [21:0] note_div_left;
    output [21:0] note_div_right;
    
    reg [21:0] note_div_left;
    reg [21:0] note_div_right;
  
    
    always @* begin
        if(last_change == 9'h21) begin
            if(key_down[last_change] == 1'b1 && double == 1'b0) begin
                note_div_left = 22'd191570;
                note_div_right = 22'd191570;
            end
            else if(key_down[last_change] == 1'b1 && double == 1'b1) begin
                note_div_left = 22'd191570;
                note_div_right = 22'd151515;
            end
            else begin
                note_div_left = 22'd0;
                note_div_right = 22'd0;
            end
        end
        else if(last_change == 9'h23) begin
            if(key_down[last_change] == 1'b1 && double == 1'b0) begin
                note_div_left = 22'd170648;
                note_div_right = 22'd170648;
            end
            else if(key_down[last_change] == 1'b1 && double == 1'b1) begin
                note_div_left = 22'd170648;
                note_div_right = 22'd143266;
            end
            else begin
                note_div_left = 22'd0;
                note_div_right = 22'd0;
            end
        end
        else if(last_change == 9'h24) begin
            if(key_down[last_change] == 1'b1 && double == 1'b0) begin
                note_div_left = 22'd151515;
                note_div_right = 22'd151515;
            end
            else if(key_down[last_change] == 1'b1 && double == 1'b1) begin
                note_div_left = 22'd151515;
                note_div_right = 22'd127551;
            end
            else begin
                note_div_left = 22'd0;
                note_div_right = 22'd0;
            end
        end
        else if(last_change == 9'h2B) begin
            if(key_down[last_change] == 1'b1 && double == 1'b0) begin
                note_div_left = 22'd143266;
                note_div_right = 22'd143266;
            end
            else if(key_down[last_change] == 1'b1 && double == 1'b1) begin
                note_div_left = 22'd143266;
                note_div_right = 22'd113636;
            end
            else begin
                note_div_left = 22'd0;
                note_div_right = 22'd0;
            end
        end
        else if(last_change == 9'h34) begin
            if(key_down[last_change] == 1'b1 && double == 1'b0) begin
                note_div_left = 22'd127551;
                note_div_right = 22'd127551;
            end
            else if(key_down[last_change] == 1'b1 && double == 1'b1) begin
                note_div_left = 22'd127551;
                note_div_right = 22'd101215;
            end
            else begin
                note_div_left = 22'd0;
                note_div_right = 22'd0;
            end                
        end
        else if(last_change == 9'h1C) begin
            if(key_down[last_change] == 1'b1) begin
                note_div_left = 22'd113636;
                note_div_right = 22'd113636;
            end            
            else begin
                note_div_left = 22'd0;
                note_div_right = 22'd0;
            end                
        end
        else if(last_change == 9'h32) begin
            if(key_down[last_change] == 1'b1) begin
                note_div_left = 22'd101215;
                note_div_right = 22'd101215;
            end            
            else begin
                note_div_left = 22'd0;
                note_div_right = 22'd0;
            end
        end
        else begin
            note_div_left = 22'd0;
            note_div_right = 22'd0;
        end
    end

endmodule
