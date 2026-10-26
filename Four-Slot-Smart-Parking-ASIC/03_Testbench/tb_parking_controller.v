`timescale 1ns/1ps

module tb_parking_controller;

    reg clk;
    reg reset;
    reg entry;
    reg exit;

    wire [2:0] slot_count;
    wire warning;
    wire full;
    wire empty;
    wire gate_open;

    parking_controller dut (
        .clk(clk),
        .reset(reset),
        .entry(entry),
        .exit(exit),
        .slot_count(slot_count),
        .warning(warning),
        .full(full),
        .empty(empty),
        .gate_open(gate_open)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("parking_rtl.vcd");
        $dumpvars(0, tb_parking_controller);

        clk = 0;
        reset = 1;
        entry = 0;
        exit = 0;

        #10;
        reset = 0;

        // Test vehicle entries
        repeat (4) begin
            @(negedge clk);
            entry = 1;

            @(negedge clk);
            $display("Count=%0d Warning=%b Full=%b Empty=%b Gate=%b",
                     slot_count, warning, full, empty, gate_open);
            entry = 0;
        end

        // Test entry when parking is full
        @(negedge clk);
        entry = 1;

        @(negedge clk);
        $display("After extra entry: Count=%0d Full=%b",
                 slot_count, full);
        entry = 0;

        // Test vehicle exit
        @(negedge clk);
        exit = 1;

        @(negedge clk);
        $display("After exit: Count=%0d Warning=%b Full=%b",
                 slot_count, warning, full);
        exit = 0;

        // Test exit when parking is empty
        repeat (3) begin
            @(negedge clk);
            exit = 1;
            @(negedge clk);
            exit = 0;
        end

        $display("Final Count=%0d Empty=%b",
                 slot_count, empty);

        #10;
        $finish;
    end

endmodule
