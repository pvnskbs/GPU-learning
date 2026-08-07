class register_env extends uvm_env;
    `uvm_component_utils(register_env)

    register_agent agent;
    register_scoreboard sb;

    function new(string name = "register_env", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        agent = register_agent::type_id::create("agent", this);
        sb    = register_scoreboard::type_id::create("sb",this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        agent.monitor.ap.connect(sb.analysis_port);
    endfunction
endclass
