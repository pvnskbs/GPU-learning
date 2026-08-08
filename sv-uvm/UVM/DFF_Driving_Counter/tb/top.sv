`timescale 1ns/1ps

module top #(parameter WIDTH = 4);

    import uvm_pkg::*;
    import mini_ip_pkg::*;
    `include "uvm_macros.svh"

    logic clk;
    logic rst_n;
    // parameter WIDTH = 4;

    // Instantiate the D-flipflop interface
    mini_ip_if#(WIDTH) mini_ip_if_inst (clk, rst_n);

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

    // Instantiate the mini IP DUT
    mini_ip#(WIDTH) dut (
        .clk(mini_ip_if_inst.clk),
        .rst_n(mini_ip_if_inst.rst_n),
        .d(mini_ip_if_inst.d),
        .q(mini_ip_if_inst.q),
        .count(mini_ip_if_inst.count)
    );

    /*
     * Pass interface to UVM environment
    */
    initial begin
        uvm_config_db#(virtual mini_ip_if#(WIDTH))::set(null, "*", "dut_if", mini_ip_if_inst);
        run_test("test_wrapper");
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top);
    end

endmodule