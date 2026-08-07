class register_transaction extends uvm_sequence_item;
    parameter WIDTH = 4;
    bit [WIDTH-1:0] count;
    rand bit en;
    rand bit rst_n;

    `uvm_object_utils_begin(register_transaction)
        `uvm_field_int(count, UVM_ALL_ON)
        `uvm_field_int(en, UVM_ALL_ON)
        `uvm_field_int(rst_n, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "register_transaction");
        super.new(name);
    endfunction

    constraint count_c { count inside {[0:2**WIDTH-1]}; }
    constraint en_c { en inside {0,1} ; }
endclass
