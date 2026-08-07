class register_agent extends uvm_agent;
    `uvm_component_utils(register_agent)

    register_sequencer sequencer;
    register_driver driver;
    register_monitor monitor;

    function new(string name = "register_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        sequencer = register_sequencer::type_id::create("sequencer", this);
        driver = register_driver::type_id::create("driver", this);
        monitor = register_monitor::type_id::create("monitor", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        driver.seq_item_port.connect(sequencer.seq_item_export);
    endfunction
endclass
