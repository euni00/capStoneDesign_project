`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/25 18:11:19
// Design Name: 
// Module Name: buzzer
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


module buzzer(clk,sw_up,sw_left,sw_mid,sw_right,sw_down,buzz);
/*****************************************************
** �Է� ��ȣ ����                                   **
*****************************************************/
//input    clk,sw_up,sw_left,sw_mid,sw_right,sw_down  ;
input    clk   ;
input sw_up  ;
input sw_left  ;
input sw_mid  ;
input sw_right  ;
input sw_down  ;
  
/*****************************************************
** ��� ��ȣ ����                                   **
*****************************************************/ 
output  buzz      ;
       
/*****************************************************
** Reg ����                                         **
*****************************************************/
reg   [17:0]  clk_cnt1 ;
reg   [17:0]  clk_cnt2 ;
reg   [17:0]  clk_cnt3 ;
reg   [17:0]  clk_cnt4 ;
reg   [17:0]  clk_cnt5 ;

reg    [4:0]  buzz_tmp ;

/*****************************************************
** �� ���� ���� ���ļ� ���� (130.8147 Hz) 100M �� 76,444����
*****************************************************/
always @(posedge clk or posedge sw_down) begin 
   if (!sw_down) begin
      clk_cnt1   <=  18'd0;
      buzz_tmp[0] <= 0;  end
   else begin
      if (clk_cnt1 == 18'd38221) begin  
         clk_cnt1     <= 17'd0;
         buzz_tmp[0] <= ~buzz_tmp[0]; end
      else 
         clk_cnt1     <= clk_cnt1 + 1;
   end
end

/*****************************************************
** �� ���� ���� ���ļ� ���� (146.8343 Hz) 100M �� 68,104����
*****************************************************/
always @(posedge clk or posedge sw_left) begin 
   if (!sw_left) begin
      clk_cnt2   <=  18'd0;
      buzz_tmp[1] <= 0;  end
   else begin
      if (clk_cnt2 == 18'd34051) begin  
         clk_cnt2     <= 17'd0;
         buzz_tmp[1] <= ~buzz_tmp[1]; end
      else 
         clk_cnt2     <= clk_cnt2 + 1;
   end
end

/*****************************************************
** �� ���� ���� ���ļ� ���� (164.8152 Hz) 100M �� 60,674����
*****************************************************/
always @(posedge clk or posedge sw_mid) begin 
   if (!sw_mid) begin
      clk_cnt3   <=  18'd0;
      buzz_tmp[2] <= 0;  end
   else begin
      if (clk_cnt3 == 18'd30336) begin  
         clk_cnt3     <= 17'd0;
         buzz_tmp[2] <= ~buzz_tmp[2]; end
      else 
         clk_cnt3     <= clk_cnt3 + 1;
   end
end

/*****************************************************
** �� ���� ���� ���ļ� ���� (196.0016 Hz) 100M �� 51,020����
*****************************************************/
always @(posedge clk or posedge sw_right) begin 
   if (!sw_right) begin
      clk_cnt4   <=  18'd0;
      buzz_tmp[3] <= 0;  end
   else begin
      if (clk_cnt4 == 18'd25509) begin  
         clk_cnt4     <= 17'd0;
         buzz_tmp[3] <= ~buzz_tmp[3]; end
      else 
         clk_cnt4     <= clk_cnt4 + 1;
   end
end

/*****************************************************
** �� ���� ���� ���ļ� ���� (220.0026 Hz) 100M �� 45,454����
*****************************************************/
always @(posedge clk or posedge sw_up) begin 
   if (!sw_up) begin
      clk_cnt5   <=  18'd0;
      buzz_tmp[4] <= 0;  end
   else begin
      if (clk_cnt5 == 18'd22726) begin  
         clk_cnt5     <= 17'd0;
         buzz_tmp[4] <= ~buzz_tmp[4]; end
      else 
         clk_cnt5     <= clk_cnt5 + 1;
   end
end

assign buzz = buzz_tmp[0] | buzz_tmp[1] | buzz_tmp[2] | buzz_tmp[3] | buzz_tmp[4];

endmodule
