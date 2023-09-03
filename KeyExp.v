`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2023 11:53:15
// Design Name: 
// Module Name: KeyExp
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


module KeyExp
  
    (
    input clk,
    input rst,
    input [3:0] Round_Counter,
    input [127:0] Key,
    output reg [127:0]  ExpKey
    );
    
    reg [7:0] RC;
    reg [31:0] w0,w1,w2,w3;
    wire [31:0] shifted_w,w_bar,temp_w;
    
    genvar i;
    generate
    for (i = 0; i < 4; i = i +1) begin
        SBox dut (.addr(shifted_w[31-(8*i) : 31-7-(8*i)])
                  ,.dout(temp_w[31-(8*i) : 31-7-(8*i)])  );
    end
    endgenerate
    
    assign shifted_w = {Key[23:16],Key[15:8],Key[7:0],Key[31:24]};
    assign w_bar = {temp_w[31:24] ^ RC, temp_w [23:16],temp_w[15:8],temp_w[7:0]};
    
    
    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            ExpKey <=0;
            w0 <=0;
            w1 <=0;
            w2 <=0;
            w3 <=0;
           // RC <=0;
        end
        else begin
            w0 <= Key[127:96] ^ w_bar;
            w1 <= w0 ^ Key[95:64];
            w2 <= w1 ^ Key[63:32];
            w3 <= w2 ^ Key[31:0];
            
            
            
            ExpKey <= {w0,w1,w2,w3};
        end
    
    end
    
    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            RC <=0;
        end
        else begin
            case (Round_Counter)
              4'h0: RC<= 8'h00; 
              4'h1: RC<= 8'h01;
              4'h2: RC<= 8'h02;
              4'h3: RC<= 8'h04;
              4'h4: RC<= 8'h08;
              4'h5: RC<= 8'h10;
              4'h6: RC<= 8'h20;
              4'h7: RC<= 8'h40;
              4'h8: RC<= 8'h80;
              4'h9: RC<= 8'h1B;
              4'hA: RC<= 8'h36;
                default: RC<=8'h00;
            endcase
        end
    end
    
    
    
    
    
endmodule
