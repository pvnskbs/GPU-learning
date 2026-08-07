package register_pkg;

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    `include "register_transaction.sv"
    `include "register_sequence.sv"
    `include "register_sequencer.sv"
    `include "register_driver.sv"
    `include "register_monitor.sv"
    `include "register_scoreboard.sv"
    `include "register_agent.sv"
    `include "register_env.sv"
    `include "register_test.sv"
endpackage
