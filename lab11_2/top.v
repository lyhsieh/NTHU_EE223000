module top(
  input clk,
  input rst,
  
  input [3:0] left1,
  input [3:0] left2,
  input [3:0] right1,
  input [3:0] right2,
  input [3:0] pattern,
  input [3:0] result0,
  input [3:0] result1,
  input [3:0] result2,
  input [3:0] result3,
  output [3:0] vgaRed,
  output [3:0] vgaGreen,
  output [3:0] vgaBlue,
  output hsync,
  output vsync
);

wire [11:0] data;
wire clk_25MHz;
wire clk_22;
wire [15:0] pixel_addr;
wire [11:0] pixel;
wire valid;
wire [9:0] h_cnt; //640
wire [9:0] v_cnt;  //480

assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? pixel:12'h0;

// Frequency Divider
clock_divisor clk_wiz_0_inst(
  .clk(clk),
  .clk1(clk_25MHz),
  .clk22(clk_22)
);

// Reduce frame address from 640x480 to 320x240
mem_addr_gen mem_addr_gen_inst(
  .clk(clk_22),
  .rst(rst),
  .h_cnt(h_cnt),
  .v_cnt(v_cnt),
  .left1(left1),
  .left2(left2), 
  .right1(right1), 
  .right2(right2), 
  .pattern(pattern), 
  .result3(result3), 
  .result2(result2), 
  .result1(result1), 
  .result0(result0),
  .pixel_addr(pixel_addr)
);
     
// Use reduced 320x240 address to output the saved picture from RAM 
blk_mem_gen_0 blk_mem_gen_0_inst(
  .clka(clk_25MHz),
  .wea(0),
  .addra(pixel_addr),
  .dina(data[11:0]),
  .douta(pixel)
); 

// Render the picture by VGA controller
vga_controller   vga_inst(
  .pclk(clk_25MHz),
  .reset(rst),
  .hsync(hsync),
  .vsync(vsync),
  .valid(valid),
  .h_cnt(h_cnt),
  .v_cnt(v_cnt)
);
      
endmodule
