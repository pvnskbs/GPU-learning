class test_wrapper extends mini_ip_test #(4);

    `uvm_component_utils(test_wrapper)

    function new(string name = "test_wrapper",
                 uvm_component parent = null);
        super.new(name, parent);
    endfunction

endclass