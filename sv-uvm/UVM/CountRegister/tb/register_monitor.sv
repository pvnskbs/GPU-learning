class register_monitor extends uvm_monitor;
    `uvm_component_utils(register_monitor)

    virtual register_if dut_if;

    uvm_analysis_port #(register_transaction) ap;

    function new(string name = "register_monitor", uvm_component parent = null);
        super.new(name, parent);
        ap = new("ap", this);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual register_if)::get(this, "", "dut_if", dut_if)) begin
            `uvm_fatal("NOVIF", "Virtual interface must be set for: dut_if")
        end
    endfunction

    task run_phase(uvm_phase phase);
        register_transaction trans;
        forever begin
            @(dut_if.mon_cb);
            trans = register_transaction::type_id::create("trans");
            trans.count = dut_if.mon_cb.count;
            trans.en = dut_if.mon_cb.en;
            trans.rst_n = dut_if.mon_cb.rst_n;
            `uvm_info("MON",$sformatf("time=%0t count=%0b en=%0b rst_n=%0b",$time,trans.count,trans.en,trans.rst_n),UVM_LOW)
            ap.write(trans);
        end
    endtask
endclass
