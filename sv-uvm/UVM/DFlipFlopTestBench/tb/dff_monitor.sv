class dff_monitor extends uvm_monitor;
    `uvm_component_utils(dff_monitor)

    virtual dff_if dut_if;

    uvm_analysis_port #(dff_transaction) ap;

    function new(string name = "dff_monitor", uvm_component parent = null);
        super.new(name, parent);
        ap = new("ap", this);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual dff_if)::get(this, "", "dut_if", dut_if)) begin
            `uvm_fatal("NOVIF", "Virtual interface must be set for: dut_if")
        end
    endfunction

    task run_phase(uvm_phase phase);
        dff_transaction trans;
        forever begin
            @(dut_if.mon_cb);
            trans = dff_transaction::type_id::create("trans");
            trans.d = dut_if.mon_cb.d;
            trans.q = dut_if.mon_cb.q;
            trans.q_bar = dut_if.mon_cb.q_bar;
            `uvm_info("MON",$sformatf("time=%0t d=%0b q=%0b q_bar=%0b",$time,trans.d,trans.q,trans.q_bar),UVM_LOW)
            ap.write(trans);
        end
    endtask
endclass
