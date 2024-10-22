`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SYSU
// Engineer: liuzs
// 
// Create Date: 2018/12/03 21:37:38
// Design Name: 
// Module Name: ov7670_top
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


module ov7670_top(
input  clk100,
input  OV7670_VSYNC, //SCCB?????ÔÒÜÆãá??ìı
input  OV7670_HREF,  //SCCB????ú¼ÔÒÜÆãá??ìı
input  OV7670_PCLK,  //ßÀáÈ???ìı
output OV7670_XCLK,  //?ßÀ?????
output OV7670_SIOC, 
inout  OV7670_SIOD,
input [7:0] OV7670_D, //?Ëß???

output[3:0] LED,
output[3:0] vga_red,
output[3:0] vga_green,
output[3:0] vga_blue,
output vga_hsync, //á÷òÁÔÒÜÆ
output vga_vsync, //?ÔÒÜÆ
input btn,
output pwdn,
output reset
);
wire [18:0] frame_addr;
wire [18:0] capture_addr;   
//wire  capture_we;  
wire  config_finished;  
wire  clk25; 
wire  clk50;     
wire  resend;        
wire [11:0] frame_pixel;  
wire [11:0]  data_16;
  
assign pwdn = 0; //0?ïáßÈÍïíÂ£¬1?î¸ÍíÙÄÙ¼ãÒ
assign reset = 1;
  

assign LED = {3'b0,config_finished};
assign  	OV7670_XCLK = clk25;  
debounce   btn_debounce(
		.clk(clk50),
		.i(btn),
		.o(resend)
);
 
 vga   vga_display (
		.clk25       (clk25),
		.vga_red    (vga_red),
		.vga_green   (vga_green),
		.vga_blue    (vga_blue),
		.vga_hsync   (vga_hsync),
		.vga_vsync  (vga_vsync),
		.HCnt       (),
		.VCnt       (),

		.frame_addr   (frame_addr),
		.frame_pixel  (frame_pixel)
 );
 
 blk_mem_gen_0 u_frame_buffer(
		.clka (OV7670_PCLK),
		.wea  (1'b1),
		.addra (capture_addr),
		.dina  (data_16),

		.clkb   (clk25),
		.addrb (frame_addr),
		.doutb (frame_pixel)
 );
 

 ov7670_capture capture(         //ÖÇûùov7670?ßÀ???
 		.pclk  (OV7670_PCLK),    //ßÀáÈ?õó??
 		.vsync (OV7670_VSYNC),   //?ÔÒÜÆ
 		.href  (OV7670_HREF),    //á÷òÁÔÒÜÆ 
 		.d     ( OV7670_D),      //?ßÀ?Ëß?õó
 		.addr  (capture_addr),   //ğí??îÜò¢ò£
 		.dout( data_16),         //12êÈ?Ëß?õó
 		.we   (1'b1)
 	);
 
I2C_AV_Config IIC(                 //?ßÀ?SCCB??îÜ??
 		.iCLK   ( clk25),          //?ìı25MHz??
 		.iRST_N (! resend),        //?êÈ
 		.Config_Done ( config_finished),    //?ov7670îÜĞöğíĞï?ú¼ÛÕöÇèÇà÷ı¨£¬?áêconfig_finishedãá?
 		.I2C_SDAT  ( OV7670_SIOD),   //?Ëß?? 
 		.I2C_SCLK  ( OV7670_SIOC),   //Íóğ¤????
 		.LUT_INDEX (),
 		.I2C_RDATA ()
 		); 
		
clk_wiz_0 clk_div(
		.clk_in1 (clk100),
		.clk_out1  (clk50),
		.clk_out2 (clk25)
);

endmodule