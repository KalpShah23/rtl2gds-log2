`timescale 1ns / 1ps

module tb_log2_seq;

reg clk;
reg [7:0] X;
reg [7:0] X_d;
wire [2:0] Y;

log2_seq uut (
    .clk(clk),
    .X(X),
    .Y(Y)
);

always #5 clk = ~clk;

// Stimulus
initial begin
         $fsdbDumpfile("log2_seq.fsdb");
	 $fsdbDumpvars();
end

always @(posedge clk) begin
    X_d <= X;
end

initial begin
    clk = 0;
    X = 0;

    #3 X = 8'd1;
    #10 X = 8'd2;
    #10 X = 8'd3;
    #10 X = 8'd7;
    #10 X = 8'd8;
    #10 X = 8'd15;
    #10 X = 8'd16;
    #10 X = 8'd28;
    #10 X = 8'd37;
    #10 X = 8'd99;
    #10 X = 8'd127;
    #10 X = 8'd128;
    #10 X = 8'd200;
    #10 X = 8'd255;
    #10 X = 8'd0;

    #20 $finish;
end

always @(posedge clk) begin
    $display("Time=%0t  X_d=%0d  Y=%0d", $time, X_d, Y);
end

endmodule
