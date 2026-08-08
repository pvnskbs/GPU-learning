class mini_ip_env #(parameter WIDTH = 4)
    extends uvm_env;

    `uvm_component_param_utils(mini_ip_env #(WIDTH))

    //------------------------------------------
    // Components
    //------------------------------------------

    mini_ip_agent      #(WIDTH) agent;
    mini_ip_scoreboard #(WIDTH) scoreboard;


    //------------------------------------------
    // Constructor
    //------------------------------------------

    function new(string name = "mini_ip_env",
                 uvm_component parent = null);

        super.new(name, parent);

    endfunction


    //------------------------------------------
    // Build phase
    //------------------------------------------

    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        agent = mini_ip_agent #(WIDTH)
                ::type_id::create("agent", this);

        scoreboard = mini_ip_scoreboard #(WIDTH)
                     ::type_id::create("scoreboard", this);

    endfunction


    //------------------------------------------
    // Connect phase
    //------------------------------------------

    function void connect_phase(uvm_phase phase);

        super.connect_phase(phase);

        //--------------------------------------
        // Monitor → Scoreboard
        //--------------------------------------

        agent.monitor.ap.connect(
            scoreboard.analysis_port
        );

    endfunction

endclass