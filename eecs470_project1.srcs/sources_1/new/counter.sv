`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2023 01:50:35 PM
// Design Name: 
// Module Name: counter
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


module counter (
    input reset,
    input clock,
    output logic [1:0] count
);
    always_ff @( posedge clock ) begin
        if (reset == 1) begin
            count = 0;
        end else begin
            count += 1;
        end
    end
endmodule
