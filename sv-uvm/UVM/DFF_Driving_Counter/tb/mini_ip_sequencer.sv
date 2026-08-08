class mini_ip_sequencer #(parameter WIDTH = 4)
    extends uvm_sequencer #(mini_ip_transaction #(WIDTH));

    `uvm_component_param_utils(mini_ip_sequencer #(WIDTH))

    function new(string name = "mini_ip_sequencer",
                 uvm_component parent = null);

        super.new(name, parent);

    endfunction

endclass