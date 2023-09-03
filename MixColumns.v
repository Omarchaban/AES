`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2023 08:04:03
// Design Name: 
// Module Name: MixColumns
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


module MixColumns(
    
    input [127:0] Srow,
    output  [127:0] AddRoundKey
    );
    
    function [7:0] MultiplyByTwo( [7:0] x);
	begin 
			/* multiplication by 2 is shifting on bit to the left, and if the original 8 bits had a 1 @ MSB, xor the result with 0001 1011*/
			if(x[7] == 1) MultiplyByTwo = ((x << 1) ^ 8'h1b);
			else MultiplyByTwo = x << 1; 
	end 	
endfunction

function [7:0] MultiplyByThree ([7:0] x);
	begin 
			/* multiplication by 3 ,= 01 ^ 10 = (NUM * 01) XOR (NUM * 10) = (NUM) XOR (NUM Muliplication by 2) */
			MultiplyByThree = MultiplyByTwo(x) ^ x;
	end 
endfunction
   
    /*First Column*/
    assign AddRoundKey [127:120] = MultiplyByTwo(Srow [127:120]) ^ MultiplyByThree(Srow [119:112]) ^ Srow[111:104] ^ Srow[103:96];
    assign AddRoundKey [119:112] = Srow [127:120] ^ MultiplyByTwo(Srow [119:112]) ^ MultiplyByThree(Srow[111:104]) ^ Srow[103:96];
    assign AddRoundKey [111:104] = Srow [127:120] ^ Srow [119:112] ^ MultiplyByTwo(Srow[111:104]) ^ MultiplyByThree(Srow[103:96]);
    assign AddRoundKey [103:96]  = MultiplyByThree(Srow [127:120]) ^ Srow [119:112] ^ Srow[111:104] ^ MultiplyByTwo(Srow[103:96]);

    /*Second Column*/
    assign AddRoundKey [95:88] = MultiplyByTwo(Srow [95:88]) ^ MultiplyByThree(Srow [87:80]) ^ Srow[79:72] ^  Srow[71:64];
    assign AddRoundKey [87:80] = Srow [95:88] ^ MultiplyByTwo(Srow [87:80]) ^ MultiplyByThree(Srow [79:72]) ^ Srow[71:64];
    assign AddRoundKey [79:72] = Srow [95:88] ^ Srow [87:80]^ MultiplyByTwo(Srow[79:72]) ^ MultiplyByThree(Srow[71:64]);
    assign AddRoundKey [71:64] = MultiplyByThree(Srow[95:88]) ^ Srow [87:80] ^ Srow[79:72] ^ MultiplyByTwo(Srow[71:64]);
    
    /*Third Column*/
    assign AddRoundKey [63:56] = MultiplyByTwo(Srow [63:56]) ^ MultiplyByThree(Srow [55:48]) ^ Srow[47:40] ^  Srow[39:32];
    assign AddRoundKey [55:48] = Srow [63:56] ^ MultiplyByTwo(Srow [55:48]) ^ MultiplyByThree(Srow [47:40]) ^ Srow[39:32];
    assign AddRoundKey [47:40] = Srow [63:56] ^ Srow [55:48]^ MultiplyByTwo(Srow   [47:40]) ^ MultiplyByThree(Srow[39:32]);
    assign AddRoundKey [39:32] = MultiplyByThree(Srow[63:56]) ^ Srow [55:48] ^ Srow[47:40] ^ MultiplyByTwo(Srow   [39:32]);
    
    /*Fourth Column*/
    assign AddRoundKey [31:24] = MultiplyByTwo(Srow [31:24]) ^ MultiplyByThree(Srow [23:16]) ^ Srow[15:8] ^  Srow[7:0];
    assign AddRoundKey [23:16] = Srow [31:24]^ MultiplyByTwo(Srow [23:16]) ^ MultiplyByThree(Srow [15:8]) ^  Srow[7:0];
    assign AddRoundKey [15:8]  = Srow [31:24]^ Srow[23:16]^ MultiplyByTwo(Srow[15:8]) ^ MultiplyByThree(Srow[7:0]);
    assign AddRoundKey [7:0]   = MultiplyByThree(Srow[31:24]) ^ Srow [23:16] ^ Srow[15:8] ^ MultiplyByTwo(Srow[7:0]);
    
endmodule
