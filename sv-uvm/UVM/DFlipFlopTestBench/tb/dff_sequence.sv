class dff_sequence extends uvm_sequence #(dff_transaction);
    `uvm_object_utils(dff_sequence)

    function new(string name = "dff_sequence");
        super.new(name);
    endfunction

    /* virtual task body();
        dff_transaction tr;
        tr = dff_transaction::type_id::create("tr");

        // Generate a sequence of transactions
        repeat (10) begin
            assert(tr.randomize()); // Randomize the transaction
            start_item(tr);          // Start the transaction
            finish_item(tr);         // Finish the transaction
        end
    endtask */

    virtual task body();

        dff_transaction tr;
        for (int i=0 ; i < 20 ; i++) begin
            tr = dff_transaction::type_id::create($sformatf("tr%0d", i));
            start_item(tr);
            tr.d = (i / 2) % 4;
            finish_item(tr);
        end

    endtask
endclass
