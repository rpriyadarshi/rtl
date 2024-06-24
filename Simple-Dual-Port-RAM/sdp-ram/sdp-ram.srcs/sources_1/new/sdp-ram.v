`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2024 06:07:34 PM
// Design Name: 
// Module Name: sdp-ram
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


module simple_dual_port_ram #(
    parameter ADDR_WIDTH = 8,           // Address width
    parameter DATA_WIDTH = 16,          // Data width
    parameter DEPTH = 1 << ADDR_WIDTH   // Memory depth
) (
    input wire clk,            // Clock
    input wire [ADDR_WIDTH-1:0] read_addr, // Read address
    input wire [ADDR_WIDTH-1:0] write_addr, // Write address
    input wire we,             // Write enable
    input wire [DATA_WIDTH-1:0] din, // Data input
    output reg [DATA_WIDTH-1:0] dout // Data output
);
    // Memory array
    reg [DATA_WIDTH-1:0] ram [0:DEPTH-1];

    // Write logic
    always @(posedge clk) begin
        if (we) begin
            ram[write_addr] <= din;
        end
    end

    // Read logic
    always @(posedge clk) begin
        dout <= ram[read_addr];
    end
endmodule

//module sdp-ram(

//    );
//endmodule

