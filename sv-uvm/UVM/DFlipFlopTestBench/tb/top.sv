`timescale 1ns/1ps

module top;
    import uvm_pkg::*;
    import dff_pkg::*;
    `include "uvm_macros.svh"

    logic clk;
    logic rst_n;

    // Instantiate the D-flipflop interface
    dff_if dff_if_inst (clk, rst_n);

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Reset generation
    initial begin
        rst_n = 0;
        #20 rst_n = 1; // Release reset after 20ns
    end

    // Instantiate the D Flip-Flop DUT
    dff dut (
        .clk(dff_if_inst.clk),
        .rst_n(dff_if_inst.rst_n),
        .d(dff_if_inst.d),
        .q(dff_if_inst.q),
        .q_bar(dff_if_inst.q_bar)
    );

    /*
     * Pass interface to UVM environment
    */
    initial begin
        uvm_config_db#(virtual dff_if)::set(null, "*", "dut_if", dff_if_inst);
        run_test("dff_test");
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top);
    end
endmodule
