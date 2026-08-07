class register_test extends uvm_test;
    `uvm_component_utils(register_test)

    register_env env;

    function new(string name = "register_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        env = register_env::type_id::create("env", this);
    endfunction

    task run_phase(uvm_phase phase);
        register_sequence seq;
        phase.raise_objection(this);
        seq = register_sequence::type_id::create("seq");
        seq.start(env.agent.sequencer);
        phase.drop_objection(this);
    endtask
endclass
