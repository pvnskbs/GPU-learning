class dff_test extends uvm_test;
    `uvm_component_utils(dff_test)

    dff_env env;

    function new(string name = "dff_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        env = dff_env::type_id::create("env", this);
    endfunction

    task run_phase(uvm_phase phase);
        dff_sequence seq;
        phase.raise_objection(this);
        seq = dff_sequence::type_id::create("seq");
        seq.start(env.agent.sequencer);
        phase.drop_objection(this);
    endtask
endclass
