`timescale 1ns/1ps

module top;
    import uvm_pkg::*;
    import register_pkg::*;
    `include "uvm_macros.svh"

    logic clk;
    logic rst_n;
    logic en;

    // Instantiate the D-flipflop interface
    register_if register_if_inst (clk, rst_n, en);

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
    register dut (
        .clk(register_if_inst.clk),
        .rst_n(register_if_inst.rst_n),
        .en(register_if_inst.en),
        .count(register_if_inst.count)
    );

    /*
     * Pass interface to UVM environment
    */
    initial begin
        uvm_config_db#(virtual register_if)::set(null, "*", "dut_if", register_if_inst);
        run_test("register_test");
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top);
    end
endmodule
