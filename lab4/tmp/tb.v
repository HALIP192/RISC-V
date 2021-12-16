`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.11.2021 16:22:14
// Design Name: 
// Module Name: tb
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


module tb();
reg clk;
reg [4:0]   A1;
reg [4:0]   A2;
reg [4:0]   A3;
reg         W3;
reg [31:0]  WD3;
wire [31:0]  RD1_;
wire [31:0]  RD2_;

mem64_32    testing(
.clk    (clk),
.A1     (A1),
.A2     (A2),
.A3     (A3),
.WE3    (W3),
.WD3    (WD3),
.rd1    (RD1_),
.rd2    (RD2_)


);
initial
begin
    A3 = 0;
    A1 = 0;
    A2 = 0;
    W3 = 0;
    WD3 = 0;
    clk = 0;
    #5
    clk = 1;
    while (1)
        begin
            #5 clk <= !clk;
        end
    end
    initial
        begin
    repeat (32)
        begin
            #5
            W3 = !W3;
            A3 = A3 + 'b1;
            WD3 = WD3 + 'b1;
            #5
            W3 = !W3;
            A2 = A2 + 'b1;
            A1 = A1 + 'b1;
            if (RD2_ == RD1_ && RD2_ == WD3)
                $display("----------------------------------/ngood/nRD1 = 0x%0b; RD2 = 0x%0b; WD3 = 0x%0b/n-----------------------", RD1_, RD2_, WD3);
        end               
end
endmodule
