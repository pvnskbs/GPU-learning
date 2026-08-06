class dff_transaction extends uvm_sequence_item;
    rand bit d; // Input data for the D flip-flop
    rand bit q; // Output data from the D flip-flop
    rand bit q_bar; // Inverted output data from the D flip-flop

    `uvm_object_utils_begin(dff_transaction)
        `uvm_field_int(d, UVM_ALL_ON)
        `uvm_field_int(q, UVM_ALL_ON) // Output data from the D flip-flop
        `uvm_field_int(q_bar, UVM_ALL_ON) // Inverted output data from the D flip-flop
    `uvm_object_utils_end

    function new(string name = "dff_transaction");
        super.new(name);
    endfunction

    // Constraint to ensure d is a single bit (0 or 1)
    constraint d_c { d inside {0, 1}; }
endclass
