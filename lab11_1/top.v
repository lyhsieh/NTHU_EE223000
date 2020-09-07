module top(
  input en,
  input clk,
  input rst,
  output [3:0] vgaRed,
  output [3:0] vgaGreen,
  output [3:0] vgaBlue,
  output hsync,
  output vsync, 
  output test
);

wire [11:0] data;
wire clk_25MHz;
wire clk_22;
wire [16:0] pixel_addr;
wire [11:0] pixel;
wire valid;
wire [9:0] h_cnt; //640
wire [9:0] v_cnt;  //480

wire low_active_rst;
wire en_after_debounce;
wire en_after_one_pulse;
wire clk_1hz, clk_10hz, clk_100hz;
wire [1:0] clk_quick;
wire state;

assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? pixel:12'h0;
assign test = state;
assign low_active_rst = ~(rst);
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
  .scroll(state), 
  .h_cnt(h_cnt),
  .v_cnt(v_cnt),
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
    frequency_divider_exact_1hz U0(.clk_in(clk), .rst(low_active_rst), .clk_out_1hz(clk_1hz), .clk_out_10hz(clk_10hz), .clk_out_100hz(clk_100hz), .clk_for_ssd(clk_quick));
    debounce U1(.clk_100hz(clk_100hz), .rst(low_active_rst), .pb_in(en), .pb_debounced(en_after_debounce));
    one_pulse U2(.in_trig(en_after_debounce), .clk_100hz(clk_100hz), .rst(low_active_rst), .out_pulse(en_after_one_pulse));
    FSM U3(.press_processed(en_after_one_pulse), .clk(clk_100hz), .rst(low_active_rst), .state(state));    
endmodule
