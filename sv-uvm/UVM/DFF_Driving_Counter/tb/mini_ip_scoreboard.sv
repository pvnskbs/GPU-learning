class mini_ip_scoreboard #(parameter WIDTH = 4)
    extends uvm_scoreboard;

    `uvm_component_param_utils(mini_ip_scoreboard #(WIDTH))

    //------------------------------------------
    // Analysis implementation
    //------------------------------------------

    uvm_analysis_imp #(
        mini_ip_transaction #(WIDTH),
        mini_ip_scoreboard #(WIDTH)
    ) analysis_port;


    //------------------------------------------
    // Expected counter value
    //------------------------------------------

    bit [WIDTH-1:0] expected_count;


    //------------------------------------------
    // Constructor
    //------------------------------------------

    function new(string name = "mini_ip_scoreboard",
                 uvm_component parent = null);

        super.new(name, parent);

        analysis_port = new("analysis_port", this);

        expected_count = '0;

    endfunction


    //------------------------------------------
    // Write method
    //------------------------------------------

    function void write(mini_ip_transaction #(WIDTH) tr);

        //--------------------------------------
        // Compare DUT output with prediction
        //--------------------------------------

        `uvm_info(
            "SB",
            $sformatf(
                "time=%0t expected=%0d actual=%0d q=%0b d=%0b",
                $time,
                expected_count,
                tr.count,
                tr.q,
                tr.d
            ),
            UVM_LOW
        )


        if (tr.count !== expected_count) begin

            `uvm_error(
                "SB",
                $sformatf(
                    "Expected=%0d Actual=%0d q=%0b d=%0b",
                    expected_count,
                    tr.count,
                    tr.q,
                    tr.d
                )
            );

        end

        else begin

            `uvm_info(
                "SB",
                "PASS",
                UVM_LOW
            );

        end

        //--------------------------------------
        // Reset
        //--------------------------------------

        if (!tr.rst_n) begin

            expected_count = '0;

        end

        //--------------------------------------
        // DFF output is HIGH
        // Therefore counter is enabled
        //--------------------------------------

        else if (tr.q) begin

            expected_count = expected_count + 1'b1;

        end

        //--------------------------------------
        // q = 0
        // Counter holds its value
        //--------------------------------------

        else begin

            expected_count = expected_count;

        end

    endfunction

endclass