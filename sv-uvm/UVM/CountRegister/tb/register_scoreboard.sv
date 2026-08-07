class register_scoreboard extends uvm_scoreboard;

    `uvm_component_utils(register_scoreboard)

    uvm_analysis_imp #(register_transaction, register_scoreboard) analysis_port;

    bit [3:0] expected;

    function new(string name="register_scoreboard",
                 uvm_component parent);

        super.new(name,parent);

        analysis_port = new("analysis_port",this);

        expected = 4'b0000;

    endfunction

    function void write(register_transaction tr);

        `uvm_info("SB",$sformatf("time=%0t expected=%0b actual=%0b",$time,expected,tr.count),UVM_LOW)
        if(tr.count != expected)

            `uvm_error("SB",
                $sformatf(
                "Expected=%0b Actual=%0b",
                expected,
                tr.count))

        else

            `uvm_info("SB",
                "PASS",
                UVM_LOW);

        //expected = tr.count;

        if(!tr.rst_n)
            expected = 4'b0000;
        else if (tr.rst_n & tr.en)
            expected = expected + 4'b0001;
        else
            expected = expected;

    endfunction

endclass