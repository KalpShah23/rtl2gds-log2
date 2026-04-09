`timescale 1ns / 1ps

module log2_seq (
    input clk,
    input [7:0] X,
    output reg [2:0] Y
);

reg [2:0] Y_comb;

always @(*) begin
    if (X[7])       Y_comb = 3'd7;
    else if (X[6])  Y_comb = 3'd6;
    else if (X[5])  Y_comb = 3'd5;
    else if (X[4])  Y_comb = 3'd4;
    else if (X[3])  Y_comb = 3'd3;
    else if (X[2])  Y_comb = 3'd2;
    else if (X[1])  Y_comb = 3'd1;
    else if (X[0])  Y_comb = 3'd0;
    else            Y_comb = 3'd0;
end

always @(posedge clk) begin
    Y <= Y_comb;
end

endmodule
