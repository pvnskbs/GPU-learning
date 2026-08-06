class dff_driver extends uvm_driver #(dff_transaction);
    `uvm_component_utils(dff_driver)

    virtual dff_if dut_if_inst;

    function new(string name = "dff_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual dff_if)::get(this, "", "dut_if", dut_if_inst)) begin
            `uvm_fatal("NOVIF", "Virtual interface must be set for: dut_if")
        end
    endfunction

    task run_phase(uvm_phase phase);
        dff_transaction tr;
        forever begin
            seq_item_port.get_next_item(tr);
            @(dut_if_inst.drv_cb);
            dut_if_inst.drv_cb.d <= tr.d;
            seq_item_port.item_done();
            `uvm_info("DRV",$sformatf("time=%0t drive d=%0b",$time,tr.d),UVM_LOW)
        end
    endtask
endclass
