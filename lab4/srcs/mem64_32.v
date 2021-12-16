`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2021 17:40:57
// Design Name: 
// Module Name: mem64_32
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


module mem64_32(
    input   [5:0] ad,
    output  [31:0] rd
    );
    
    reg [31:0]  RAM[0:63];
    
    assign  rd = RAM[ad[5:2]];
    
    initial begin
        $readmemb("program.txt", RAM);
    end
    
endmodule
