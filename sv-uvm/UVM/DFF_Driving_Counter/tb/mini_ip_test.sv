class mini_ip_test #(parameter WIDTH = 4)
    extends uvm_test;

    `uvm_component_param_utils(mini_ip_test #(WIDTH))

    //------------------------------------------
    // Environment
    //------------------------------------------

    mini_ip_env #(WIDTH) env;


    //------------------------------------------
    // Constructor
    //------------------------------------------

    function new(string name = "mini_ip_test",
                 uvm_component parent = null);

        super.new(name, parent);

    endfunction


    //------------------------------------------
    // Build phase
    //------------------------------------------

    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        env = mini_ip_env #(WIDTH)
              ::type_id::create("env", this);

    endfunction


    //------------------------------------------
    // Run phase
    //------------------------------------------

    task run_phase(uvm_phase phase);

        mini_ip_sequence #(WIDTH) seq;

        phase.raise_objection(this);

        //--------------------------------------
        // Create sequence
        //--------------------------------------

        seq = mini_ip_sequence #(WIDTH)
              ::type_id::create("seq");


        //--------------------------------------
        // Start sequence
        //--------------------------------------

        seq.start(env.agent.sequencer);


        //--------------------------------------
        // Allow sequence to complete
        //--------------------------------------

        phase.drop_objection(this);

    endtask

endclass