`timescale 1ns/1ps

module tb_sequence_detector;

    reg clk, reset, din;
    wire detected;

    sequence_detector dut (
        .clk(clk),
        .reset(reset),
        .din(din),
        .detected(detected)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("sequence_gls.vcd");
        $dumpvars(0, tb_sequence_detector);

        clk = 0;
        reset = 1;
        din = 0;

        #12;
        reset = 0;

        // Send sequence 101011
        @(negedge clk) din = 1;
        @(negedge clk) din = 0;
        @(negedge clk) din = 1;
        @(negedge clk) din = 0;
        @(negedge clk) din = 1;
        @(negedge clk) din = 1;

        #10;
        $finish;
    end

    initial begin
        $monitor("Time=%0t din=%b detected=%b",
                 $time, din, detected);
    end

endmodule
