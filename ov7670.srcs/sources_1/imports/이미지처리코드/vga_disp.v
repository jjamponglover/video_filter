`timescale 1ns / 1ps

module vga(
input wire clk25,
input wire i_mode,
output wire [3:0] red,
output wire [3:0] green,
output wire [3:0] blue,
output reg vga_hsync,
output reg vga_vsync,
output wire [9:0] HCnt,
output wire [9:0] VCnt,

output wire [16:0] frame_addr,
input wire [11:0] frame_pixel
    );
    //Timing constants
      parameter hRez   = 640;
      parameter hStartSync   = 640+16;
      parameter hEndSync     = 640+16+96;
      parameter hMaxCount    = 800;
    
      parameter vRez         = 480;
      parameter vStartSync   = 480+10;
      parameter vEndSync     = 480+10+2;
      parameter vMaxCount    = 480+10+2+33;
     
     
     //8비트 레지스터 설정
    reg[7:0] vga_red;
    reg[7:0] vga_green;
    reg[7:0] vga_blue;
    
    parameter hsync_active = 0;
    parameter vsync_active = 0;
    reg[9:0] hCounter;
    reg[9:0] vCounter;    
    reg[9:0] VCNT,HCNT;       
    reg[16:0] address;  
    reg blank;
   initial   hCounter = 10'b0;
   initial   vCounter = 10'b0;  
    initial   HCNT = 10'b0;
   initial   VCNT = 10'b0;   
   initial   address = 17'b0;   
   initial   blank = 1'b1;    
   
   assign red = vga_red[7:4];
   assign green = vga_green[7:4];
   assign blue = vga_blue[7:4];
   assign frame_addr = address;
//   assign HCnt = hCounter;
//   assign VCnt = vCounter;
    assign HCnt = HCNT;
   assign VCnt = VCNT;  
   always@(posedge clk25)begin
            if( hCounter == hMaxCount-1 )begin
   				hCounter <=  10'b0;
   				if (vCounter == vMaxCount-1 )
   					vCounter <=  10'b0;
   				else
   					vCounter <= vCounter+1;
   				end
   			else
   				hCounter <= hCounter+1;
          
   			if (blank ==0) begin
   			  if(i_mode)begin
   			   vga_red   <= frame_pixel;
   				vga_green <= frame_pixel;
   				vga_blue  <= frame_pixel;
   			  end
   			  else begin
   			    vga_red   <= {frame_pixel[11:8],{4'hF}};
   				vga_green <= {frame_pixel[7:4],{4'hF}};
   				vga_blue  <= {frame_pixel[3:0],{4'hF}}; 
   			  end
   	        end
   			else begin
   				vga_red   <= 4'b0;
   				vga_green <= 4'b0;
   				vga_blue  <= 4'b0;
   			end
   			
   			if(vCounter  >= 360 || vCounter <120) begin
   		//		address <= 19'b0; 
   				blank <= 1;
   				end
   			else begin
   				if (hCounter  < 480 && hCounter>=160 ) begin
   					blank <= 0;
   		//			address <= address+1;
   					end
   				else
   					blank <= 1;
   				end
   	
   			// Are we in the hSync pulse? (one has been added to include frame_buffer_latency)
   			if( hCounter > hStartSync && hCounter <= hEndSync) //96카운트 동안 vga_hsync = 0
   				vga_hsync <= hsync_active;
   			else
   				vga_hsync <= ~ hsync_active;
   			
   
   			// Are we in the vSync pulse?
   			if( vCounter >= vStartSync && vCounter < vEndSync )
   				vga_vsync <= vsync_active;
   			else
   				vga_vsync <= ~ vsync_active;
   end 
   
always@(posedge vga_hsync)begin
     if(vga_vsync == 1)
        if(VCNT>524)
        VCNT <=0;
        else
        VCNT <= VCNT +1;
     else
         VCNT <= 492;
 end        
 
always@(posedge clk25)begin
   if(vga_hsync == 1)
      if(HCNT>799)
      HCNT <=0;
      else
      HCNT <= HCNT +1;
   else
       HCNT <= 753;
end  
        
 always@(posedge clk25)begin
  if(VCNT  >= 360 || VCNT  < 120) begin
    				address <= 17'b0; 
    				end
    			else begin
    				if (HCNT  < 480 && HCNT  >= 160) begin
    					address <= address+1;
    					end		
    				end
 end       




// initial begin
//        hCounter = 10'b0;
//        vCounter = 10'b0;  
//        HCNT = 10'b0;
//        VCNT = 10'b0;   
//        address = 17'b0;   
//        blank = 1'b1;
//    end
    
//    assign red = vga_red[7:4];
//    assign green = vga_green[7:4];
//    assign blue = vga_blue[7:4];
//    assign frame_addr = address;
//    assign HCnt = HCNT;
//    assign VCnt = VCNT;  
    
//    always @(posedge clk25) begin
//        if (hCounter == hMaxCount - 1) begin
//            hCounter <= 10'b0;
//            if (vCounter == vMaxCount - 1)
//                vCounter <= 10'b0;
//            else
//                vCounter <= vCounter + 1;
//        end else begin
//            hCounter <= hCounter + 1;
//        end
        
//        if (blank == 0) begin
//            if (i_mode) begin
//                vga_red   <= frame_pixel;
//                vga_green <= frame_pixel;
//                vga_blue  <= frame_pixel;
//            end else begin
//                vga_red   <= {frame_pixel[11:8], 4'hF};
//                vga_green <= {frame_pixel[7:4], 4'hF};
//                vga_blue  <= {frame_pixel[3:0], 4'hF}; 
//            end
//        end else begin
//            vga_red   <= 4'b0;
//            vga_green <= 4'b0;
//            vga_blue  <= 4'b0;
//        end
        
//        if (vCounter >= vRez) begin
//            blank <= 1;
//        end else begin
//            if (hCounter < hRez) begin
//                blank <= 0;
//            end else begin
//                blank <= 1;
//            end
//        end
        
//        // hSync pulse
//        if (hCounter > hStartSync && hCounter <= hEndSync)
//            vga_hsync <= hsync_active;
//        else
//            vga_hsync <= ~hsync_active;
        
//        // vSync pulse
//        if (vCounter >= vStartSync && vCounter < vEndSync)
//            vga_vsync <= vsync_active;
//        else
//            vga_vsync <= ~vsync_active;
//    end 
   
//    always @(posedge vga_hsync) begin
//        if (vga_vsync == 1) begin
//            if (VCNT > 524)
//                VCNT <= 0;
//            else
//                VCNT <= VCNT + 1;
//        end else begin
//            VCNT <= 492;
//        end
//    end        
 
//    always @(posedge clk25) begin
//        if (vga_hsync == 1) begin
//            if (HCNT > 799)
//                HCNT <= 0;
//            else
//                HCNT <= HCNT + 1;
//        end else begin
//            HCNT <= 753;
//        end
//    end  
        
//    always @(posedge clk25) begin
//        if (VCNT < vRez) begin  // VCNT가 480 내에 있을 때
//            if (HCNT < hRez) begin  // HCNT가 640 내에 있을 때
//                address <= address + 1;  // 모든 유효한 픽셀에 대해 address 증가
//            end
//        end else begin
//            address <= 0;  // 다음 프레임 시작 시 address 초기화
//        end
//    end   
endmodule
