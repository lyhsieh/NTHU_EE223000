`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/21 00:22:45
// Design Name: 
// Module Name: mem_addr_generator
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


module mem_addr_generator(
    input rst,
    input clk,
    input down_velocity,next_picture_delay,
    input [1:0] level,
    input [4:0] key_alphabet,
    input [7:0] random,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    output reg [4:0] life,
    output reg [9:0] point,
    output reg [15:0] pixel_addr
    );
    
wire [2:0] column;
//reg [2:0] tmp_life;
reg [4:0] tmp_life;
reg [9:0] tmp_point;
reg [3:0] tmp_step;
wire [9:0] tmp_point_equal;
wire [4:0] alphabet; // 0 indicates no any alphabet ; 1 to 26 indicate A to Z. 27 to 31 are equal to 1 to 5.  
reg [2:0] entering_column; 
reg [4:0] entering_alphabet;
reg [2:0] column_1st,column_2nd,column_3rd,column_4th,column_5th,column_6th;
reg [4:0] alphabet_1st,alphabet_2nd,alphabet_3rd,alphabet_4th,alphabet_5th,alphabet_6th,alphabet_7th;
reg [3:0] step;
reg [4:0] tmp_alphabet_7th;
    
reg fsm_out,state,tmp_state;
reg [4:0] present_alphabet_4th,present_alphabet_5th;    
wire [4:0] last_alphabet_4th,last_alphabet_5th;    
    
//address the random values 

assign column = random [2:0] ;     
assign alphabet = random [7:3] ;

always@(negedge next_picture_delay or posedge rst)// here negedge because in case that the below expression go wrong
if(rst)
begin
    entering_column <= 3'd0;
    entering_alphabet <= 5'd0;
end
else
begin
    entering_column <= column ;
    entering_alphabet <= alphabet ;         
end

//important shift register indicates which  column and alphabet every lines

always@(posedge next_picture_delay or posedge rst)
if(rst)
begin
    column_1st <= 3'd5 ;
    alphabet_1st <= 5'd18 ;
end    
else
begin
if((entering_alphabet>26))
begin
    column_1st <= entering_column;
    alphabet_1st <= entering_alphabet - 5'd26;
end
else 
begin
    column_1st <= entering_column ;
    alphabet_1st <= entering_alphabet ;    
end 
end   

always@(posedge next_picture_delay or posedge rst)
if(rst)
begin
    column_2nd <= 3'd3 ;
    alphabet_2nd <= 5'd21 ;
end    
else
begin
    column_2nd <= column_1st ;
    alphabet_2nd <= alphabet_1st ;
end   
 
always@(posedge next_picture_delay or posedge rst)
if(rst)
begin
    column_3rd <= 3'd6 ;
    alphabet_3rd <= 5'd13 ;
end    
else
begin
    column_3rd <= column_2nd ;
    alphabet_3rd <= alphabet_2nd ;
end    
 
always@(posedge next_picture_delay or posedge rst)
if(rst)
begin
    column_4th <= 3'd5 ;
    alphabet_4th <= 5'd4 ;
end    
else
begin
    column_4th <= column_3rd ;
    alphabet_4th <= alphabet_3rd ;
end

always@(posedge next_picture_delay or posedge rst)
if(rst)
begin
    column_5th <= 3'd0 ;
    alphabet_5th <= 5'd0 ;
end    
else
begin
    column_5th <= column_4th ;
    alphabet_5th <= alphabet_4th ;
end    

always@(posedge next_picture_delay or posedge rst)
if(rst)
begin
    column_6th <= 3'd0 ;
    alphabet_6th <= 5'd0 ;
end    
else
begin
    column_6th <= column_5th ;
    alphabet_6th <= alphabet_5th ;
end

//FSM

assign last_alphabet_4th = alphabet_4th;

always@(posedge down_velocity or posedge rst)
if(rst)
    present_alphabet_4th <= 0;
else
    present_alphabet_4th <= last_alphabet_4th;

assign last_alphabet_5th = alphabet_5th;

always@(posedge down_velocity or posedge rst)
if(rst)
    present_alphabet_5th <= 0;
else
    present_alphabet_5th <= last_alphabet_5th;

always@*
case(state)
1'b0:
begin
    fsm_out=0;
    if(key_alphabet==alphabet_6th)
        tmp_state =1;
    else
        tmp_state =0;
end
1'b1:
begin
fsm_out=1;
    if(present_alphabet_5th!=last_alphabet_5th||present_alphabet_4th!=last_alphabet_4th)
        tmp_state =0;
    else
        tmp_state =1;
end
endcase


always@( posedge clk or posedge rst)
if(rst)
    state <= 0;
else
    state <= tmp_state;
        
// point and remained life
always @* begin
    if(life==5'd0)
    begin
        tmp_point = point;
        tmp_life = 5'd0;
    end
    else
        if(key_alphabet == alphabet_6th||alphabet_6th==5'd0)
        begin
            tmp_point = point + (2 * level + 1);
            tmp_life = life; 
        end
        else
        begin
            tmp_life = life -1;
            tmp_point = point;
        end
end
always @(posedge next_picture_delay or posedge rst) begin
    if(rst)
    begin
        point <= 10'b0;
        life <= 5'd16;
    end
    else
    begin
        point <= tmp_point;
        life <= tmp_life;
    end
end

always@*
if(step>=4'd9)
    tmp_step = 0;
else
    tmp_step = step +1;
    
always@(posedge down_velocity or posedge rst)
if(rst)
    step <= 4'd0;
else
    step <= tmp_step;


//appoint pixel every line

always@*
if((life==5'd0))
begin
if((h_cnt>=220)&&(h_cnt<270)&&(v_cnt>=190)&&(v_cnt<240))    
    pixel_addr= 6*2500+((v_cnt-190)*50+(h_cnt-220));
else if((h_cnt>=270)&&(h_cnt<320)&&(v_cnt>=190)&&(v_cnt<240))    
    pixel_addr= ((v_cnt-190)*50+(h_cnt-270));
else if((h_cnt>=320)&&(h_cnt<370)&&(v_cnt>=190)&&(v_cnt<240))    
    pixel_addr= 12*2500+((v_cnt-190)*50+(h_cnt-320));
else if((h_cnt>=370)&&(h_cnt<420)&&(v_cnt>=190)&&(v_cnt<240))    
        pixel_addr= 4*2500+((v_cnt-190)*50+(h_cnt-370)); 
else if((h_cnt>=220)&&(h_cnt<270)&&(v_cnt>=240)&&(v_cnt<290))    
        pixel_addr= 14*2500+((v_cnt-240)*50+(h_cnt-220));
else if((h_cnt>=270)&&(h_cnt<320)&&(v_cnt>=240)&&(v_cnt<290))    
        pixel_addr= 21*2500+((v_cnt-240)*50+(h_cnt-270));                   
else if((h_cnt>=320)&&(h_cnt<370)&&(v_cnt>=240)&&(v_cnt<290))    
        pixel_addr= 4*2500+((v_cnt-240)*50+(h_cnt-320));
else if((h_cnt>=370)&&(h_cnt<420)&&(v_cnt>=240)&&(v_cnt<290))    
        pixel_addr= 17*2500+((v_cnt-240)*50+(h_cnt-370));
else
    pixel_addr=1;                                            
end
else
begin
if((h_cnt<120)&&(v_cnt>=250)&&(v_cnt<350)||(h_cnt>=520)&&(v_cnt>=250)&&(v_cnt<350))
    pixel_addr = 0; // red 
else if((h_cnt>=(column_1st*50+120))&&(h_cnt<(column_1st*50+170))&&(v_cnt>=(step*5))&&(v_cnt<(step*5+50)))
begin
    if(alphabet_1st==5'd0)
        pixel_addr = 1;
    else
        pixel_addr = (alphabet_1st-1)*2500+((v_cnt-5*step)*50+(h_cnt-120-column_1st*50));
end
else if((h_cnt>=(column_2nd*50+120))&&(h_cnt<(column_2nd*50+170))&&(v_cnt>=(50+step*5))&&(v_cnt<(step*5+100)))
begin
    if(alphabet_2nd==5'd0)
        pixel_addr = 1;
    else
        pixel_addr = (alphabet_2nd-1)*2500+((v_cnt-5*step-50)*50+(h_cnt-120-column_2nd*50));
end
else if((h_cnt>=(column_3rd*50+120))&&(h_cnt<(column_3rd*50+170))&&(v_cnt>=(100+step*5))&&(v_cnt<(step*5+150)))
begin
    if(alphabet_3rd==5'd0)
        pixel_addr = 1;
    else
        pixel_addr = (alphabet_3rd-1)*2500+((v_cnt-5*step-100)*50+(h_cnt-120-column_3rd*50));
end
else if((h_cnt>=(column_4th*50+120))&&(h_cnt<(column_4th*50+170))&&(v_cnt>=(150+step*5))&&(v_cnt<(step*5+200)))
begin
    if(alphabet_4th==5'd0)
        pixel_addr = 1;
    else
        pixel_addr = (alphabet_4th-1)*2500+((v_cnt-5*step-150)*50+(h_cnt-120-column_4th*50));
end
else if((h_cnt>=(column_5th*50+120))&&(h_cnt<(column_5th*50+170))&&(v_cnt>=(200+step*5))&&(v_cnt<(step*5+250)))
begin
    if(alphabet_5th==5'd0)
        pixel_addr = 1;
    else
        pixel_addr = (alphabet_5th-1)*2500+((v_cnt-5*step-200)*50+(h_cnt-120-column_5th*50));
end
else if((h_cnt>=(column_6th*50+120))&&(h_cnt<(column_6th*50+170))&&(v_cnt>=(250+step*5))&&(v_cnt<(step*5+300)))
begin
    if(alphabet_6th==5'd0||fsm_out)
        pixel_addr = 1;
    else
        pixel_addr = (alphabet_6th-1)*2500+((v_cnt-5*step-250)*50+(h_cnt-120-column_6th*50));
end
else
    pixel_addr = 1; // background color
end

endmodule
