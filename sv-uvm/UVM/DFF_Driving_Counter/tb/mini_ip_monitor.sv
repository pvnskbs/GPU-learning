class mini_ip_monitor #(parameter WIDTH = 4)
    extends uvm_monitor;

    `uvm_component_param_utils(mini_ip_monitor #(WIDTH))

    //------------------------------------------
    // Virtual interface
    //------------------------------------------

    virtual mini_ip_if #(WIDTH) dut_if;

    //------------------------------------------
    // Analysis port
    //------------------------------------------

    uvm_analysis_port #(mini_ip_transaction #(WIDTH)) ap;


    //------------------------------------------
    // Constructor
    //------------------------------------------

    function new(string name = "mini_ip_monitor",
                 uvm_component parent = null);

        super.new(name, parent);

        ap = new("ap", this);

    endfunction


    //------------------------------------------
    // Build phase
    //------------------------------------------

    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        if (!uvm_config_db#(
                virtual mini_ip_if #(WIDTH)
            )::get(
                this,
                "",
                "dut_if",
                dut_if
            )) begin

            `uvm_fatal(
                "NOVIF",
                "Virtual interface must be set for mini_ip_monitor"
            )

        end

    endfunction


    //------------------------------------------
    // Run phase
    //------------------------------------------

    task run_phase(uvm_phase phase);

        mini_ip_transaction #(WIDTH) tr;

        forever begin

            //----------------------------------
            // Wait for clock
            //----------------------------------

            @(dut_if.mon_cb);


            //----------------------------------
            // Create transaction
            //----------------------------------

            tr = mini_ip_transaction #(WIDTH)
                 ::type_id::create("tr");


            //----------------------------------
            // Sample DUT signals
            //----------------------------------

            tr.d     = dut_if.mon_cb.d;
            tr.q     = dut_if.mon_cb.q;
            tr.rst_n = dut_if.mon_cb.rst_n;
            tr.count = dut_if.mon_cb.count;


            //----------------------------------
            // Send transaction
            //----------------------------------

            ap.write(tr);


            //----------------------------------
            // Debug information
            //----------------------------------

            `uvm_info(
                "MON",
                $sformatf(
                    "time=%0t d=%0b q=%0b rst_n=%0b count=%0d",
                    $time,
                    tr.d,
                    tr.q,
                    tr.rst_n,
                    tr.count
                ),
                UVM_LOW
            )

        end

    endtask

endclass