class register_sequencer extends uvm_sequencer #(register_transaction);
    `uvm_component_utils(register_sequencer)

    function new(string name = "register_sequencer", uvm_component parent = null);
        super.new(name, parent);
    endfunction
endclass
