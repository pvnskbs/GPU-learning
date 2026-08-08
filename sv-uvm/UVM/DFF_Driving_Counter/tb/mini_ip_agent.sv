class mini_ip_agent #(parameter WIDTH = 4)
    extends uvm_agent;

    `uvm_component_param_utils(mini_ip_agent #(WIDTH))

    //------------------------------------------
    // UVM components
    //------------------------------------------

    mini_ip_sequencer #(WIDTH) sequencer;
    mini_ip_driver    #(WIDTH) driver;
    mini_ip_monitor   #(WIDTH) monitor;


    //------------------------------------------
    // Constructor
    //------------------------------------------

    function new(string name = "mini_ip_agent",
                 uvm_component parent = null);

        super.new(name, parent);

    endfunction


    //------------------------------------------
    // Build phase
    //------------------------------------------

    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        //--------------------------------------
        // Create components
        //--------------------------------------

        sequencer = mini_ip_sequencer #(WIDTH)
                    ::type_id::create("sequencer", this);

        driver = mini_ip_driver #(WIDTH)
                 ::type_id::create("driver", this);

        monitor = mini_ip_monitor #(WIDTH)
                  ::type_id::create("monitor", this);

    endfunction


    //------------------------------------------
    // Connect phase
    //------------------------------------------

    function void connect_phase(uvm_phase phase);

        super.connect_phase(phase);

        //--------------------------------------
        // Connect sequencer → driver
        //--------------------------------------

        driver.seq_item_port.connect(
            sequencer.seq_item_export
        );

    endfunction

endclass