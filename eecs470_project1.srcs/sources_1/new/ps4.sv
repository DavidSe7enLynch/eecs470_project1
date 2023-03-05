`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2023 06:19:56 PM
// Design Name: 
// Module Name: ps4
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

module ps4_assign(
    input [3:0] req, 
    input en,
    output logic [3:0] gnt
);
    assign gnt[3] = en & req[3];
    assign gnt[2] = en & req[2] & ~req[3];
    assign gnt[1] = en & req[1] & ~req[2] & ~req[3];
    assign gnt[0] = en & req[0] & ~req[1] & ~req[2] & ~req[3];
endmodule


module ps4_ifelse(
    input [3:0] req, 
    input en,
    output logic [3:0] gnt
);
    always_comb begin
        if (en == 1'b0) begin
            gnt = 4'b0000;
        end else if (req[3] == 1'b1) begin
            gnt = 4'b1000;
        end else if (req[2] == 1'b1) begin
            gnt = 4'b0100;
        end else if (req[1] == 1'b1) begin
            gnt = 4'b0010;
        end else if (req[0] == 1'b1) begin
            gnt = 4'b0001;
        end
    end
endmodule


