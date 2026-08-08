class mini_ip_transaction #(parameter WIDTH = 4) extends uvm_sequence_item;

    `uvm_object_param_utils(mini_ip_transaction #(WIDTH))

    //------------------------------------------
    // Stimulus
    //------------------------------------------

    rand bit d;

    //------------------------------------------
    // Observed outputs
    //------------------------------------------

    bit q;

    bit rst_n;

    bit [WIDTH-1:0] count;

    //------------------------------------------
    // Constructor
    //------------------------------------------

    function new(string name = "mini_ip_transaction");
        super.new(name);
    endfunction

endclass