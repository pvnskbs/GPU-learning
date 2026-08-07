class register_driver extends uvm_driver #(register_transaction);
    `uvm_component_utils(register_driver)

    virtual register_if dut_if_inst;

    function new(string name = "register_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual register_if)::get(this, "", "dut_if", dut_if_inst)) begin
            `uvm_fatal("NOVIF", "Virtual interface must be set for: dut_if")
        end
    endfunction

    task run_phase(uvm_phase phase);
        register_transaction tr;
        forever begin
            seq_item_port.get_next_item(tr);
            @(dut_if_inst.drv_cb);
            dut_if_inst.drv_cb.en <= tr.en;
            //dut_if_inst.drv_cb.rst_n <= tr.rst_n;
            seq_item_port.item_done();
            `uvm_info("DRV",$sformatf("time=%0t drive en=%0b",$time,tr.en),UVM_LOW)
        end
    endtask
endclass
