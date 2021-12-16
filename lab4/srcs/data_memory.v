`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.12.2021 22:51:50
// Design Name: 
// Module Name: data_memory
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


module	data_memory (
		input			clk,
		input			we,
		input	[3:0]	i,
		input	[31:0]	wd,
		input	[31:0]	ad,
		output	[31:0]	rd
	);
	
	reg	[31:0]	mem[0:31];

	assign	rd = mem[ad];

    initial begin
        $readmemh("start_mem.txt", mem);
    end

	always @(posedge clk)
	begin
		if (we == 'd1)
			mem[ad] <= wd;
	end

endmodule