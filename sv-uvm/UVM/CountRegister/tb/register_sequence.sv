class register_sequence extends uvm_sequence #(register_transaction);
    `uvm_object_utils(register_sequence)

    function new(string name = "register_sequence");
        super.new(name);
    endfunction

    /* virtual task body();
        register_transaction tr;
        tr = register_transaction::type_id::create("tr");

        // Generate a sequence of transactions
        repeat (10) begin
            assert(tr.randomize()); // Randomize the transaction
            start_item(tr);          // Start the transaction
            finish_item(tr);         // Finish the transaction
        end
    endtask */

    virtual task body();

        register_transaction tr;
        for (int i=0 ; i < 20 ; i++) begin
            tr = register_transaction::type_id::create($sformatf("tr%0d", i));
            start_item(tr);
            tr.en = 1'b1;
            finish_item(tr);
        end

    endtask
endclass
