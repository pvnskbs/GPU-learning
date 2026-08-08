package mini_ip_pkg;

    import uvm_pkg::*;
    `include "uvm_macros.svh"
    
    `include "mini_ip_transaction.sv"
    `include "mini_ip_sequence.sv"
    `include "mini_ip_sequencer.sv"
    `include "mini_ip_driver.sv"
    `include "mini_ip_monitor.sv"
    `include "mini_ip_agent.sv"
    `include "mini_ip_scoreboard.sv"
    `include "mini_ip_env.sv"
    `include "mini_ip_test.sv"
    `include "test_wrapper.sv"
endpackage
