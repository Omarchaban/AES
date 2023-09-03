`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2023 14:07:46
// Design Name: 
// Module Name: AES_tb
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


module AES_tb(

    );
    
    
   
    
    
    reg clk,rst;
   // reg [127:0] key;
   
    //reg [127:0] text;
 
    wire [31:0]  data_out1,data_out2,data_out3,data_out4;
    AES_Enc_top dut (clk,rst/*,text,key */,data_out1,data_out2,data_out3,data_out4);
    initial begin
        rst=1;#6;
        rst=0; #6;
        rst =1; 
        clk=0;
    end
    always begin
        clk=~clk; #10;
    end
    
    initial begin
        //text = 128'h00000101030307070f0f1f1f3f3f7f7f; #10;
        //key ='h00000000000000000000000000000000;
    
    #200;
    $finish;
    
    
    
    end
endmodule
