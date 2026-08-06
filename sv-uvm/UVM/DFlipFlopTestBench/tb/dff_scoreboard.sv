class dff_scoreboard extends uvm_scoreboard;

    `uvm_component_utils(dff_scoreboard)

    uvm_analysis_imp #(dff_transaction, dff_scoreboard) analysis_port;

    bit expected_q;

    function new(string name="dff_scoreboard",
                 uvm_component parent);

        super.new(name,parent);

        analysis_port = new("analysis_port",this);

        expected_q = 0;

    endfunction

    function void write(dff_transaction tr);

        `uvm_info("SB",$sformatf("time=%0t expected=%0b actual=%0b",$time,expected_q,tr.q),UVM_LOW)
        if(tr.q !== expected_q)

            `uvm_error("SB",
                $sformatf(
                "Expected=%0b Actual=%0b",
                expected_q,
                tr.q))

        else

            `uvm_info("SB",
                "PASS",
                UVM_LOW);

        expected_q = tr.d;

    endfunction

endclass