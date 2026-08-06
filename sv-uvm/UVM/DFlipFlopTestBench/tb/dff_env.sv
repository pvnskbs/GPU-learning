class dff_env extends uvm_env;
    `uvm_component_utils(dff_env)

    dff_agent agent;
    dff_scoreboard sb;

    function new(string name = "dff_env", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        agent = dff_agent::type_id::create("agent", this);
        sb    = dff_scoreboard::type_id::create("sb",this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        agent.monitor.ap.connect(sb.analysis_port);
    endfunction
endclass
