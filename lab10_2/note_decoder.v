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


module note_decoder(state, last_change, key_down, note_div);
    input state;
    input [8:0] last_change;
    input [511:0] key_down;
    output [21:0] note_div;
    
    reg [21:0] note_div;
  
    
    always @* begin
        if(last_change == 9'h21) begin
            if(key_down[last_change] == 1'b1 && state == 1'b0)
                note_div = 22'd191570;
            else if(key_down[last_change] == 1'b1 && state == 1'b1)
                note_div = 22'd95420;
            else
                note_div = 22'd0;
        end
        else if(last_change == 9'h23) begin
            if(key_down[last_change] == 1'b1 && state == 1'b0)
                note_div = 22'd170648;
            else if(key_down[last_change] == 1'b1 && state == 1'b1)
                note_div = 22'd85034;
            else
                note_div = 22'd0;
        end
        else if(last_change == 9'h24) begin
            if(key_down[last_change] == 1'b1 && state == 1'b0)
                note_div = 22'd151515;
            else if(key_down[last_change] == 1'b1 && state == 1'b1)
                note_div = 22'd75758;
            else
                note_div = 22'd0;
        end
        else if(last_change == 9'h2B) begin
            if(key_down[last_change] == 1'b1 && state == 1'b0)
                note_div = 22'd143266;
            else if(key_down[last_change] == 1'b1 && state == 1'b1)
                note_div = 22'd71633;
            else
                note_div = 22'd0;
        end
        else if(last_change == 9'h34) begin
            if(key_down[last_change] == 1'b1 && state == 1'b0)
                note_div = 22'd127551;
            else if(key_down[last_change] == 1'b1 && state == 1'b1)
                note_div = 22'd63776;
            else 
                note_div = 22'd0;                
        end
        else if(last_change == 9'h1C) begin
            if(key_down[last_change] == 1'b1 && state == 1'b0)
                note_div = 22'd113636;
            else if(key_down[last_change] == 1'b1 && state == 1'b1)
                note_div = 22'd56818;
            else 
                note_div = 22'd0;                
        end
        else if(last_change == 9'h32) begin
            if(key_down[last_change] == 1'b1 && state == 1'b0)
                note_div = 22'd101215;
            else if(key_down[last_change] == 1'b1 && state == 1'b1)
                note_div = 22'd50607;
            else
                note_div = 22'd0;
        end
        else
            note_div = 22'd0;
    end

endmodule
