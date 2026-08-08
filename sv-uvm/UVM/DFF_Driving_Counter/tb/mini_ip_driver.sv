class mini_ip_driver #(parameter WIDTH = 4)
    extends uvm_driver #(mini_ip_transaction #(WIDTH));

    `uvm_component_param_utils(mini_ip_driver #(WIDTH))

    virtual mini_ip_if #(WIDTH) dut_if;

    function new(string name = "mini_ip_driver",
                 uvm_component parent = null);

        super.new(name, parent);

    endfunction


    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        if (!uvm_config_db#(virtual mini_ip_if #(WIDTH))::get(
                this,
                "",
                "dut_if",
                dut_if
            )) begin

            `uvm_fatal(
                "NOVIF",
                "Virtual interface must be set for mini_ip_driver"
            )

        end

    endfunction


    task run_phase(uvm_phase phase);

        mini_ip_transaction #(WIDTH) tr;

        forever begin

            seq_item_port.get_next_item(tr);

            // Drive transaction into DUT
            dut_if.drv_cb.d <= tr.d;

            `uvm_info(
                "DRV",
                $sformatf(
                    "time=%0t drive d=%0b",
                    $time,
                    tr.d
                ),
                UVM_LOW
            )

            // Wait for the clock edge
            @(dut_if.drv_cb);

            seq_item_port.item_done();

        end

    endtask

endclass