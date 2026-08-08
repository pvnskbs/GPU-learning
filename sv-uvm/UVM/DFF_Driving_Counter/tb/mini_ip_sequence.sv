class mini_ip_sequence #(parameter WIDTH = 4)
extends uvm_sequence #(mini_ip_transaction#(WIDTH));

    `uvm_object_utils(mini_ip_sequence)

    function new(string name = "mini_ip_sequence");
        super.new(name);
    endfunction

    task body();

        mini_ip_transaction#(WIDTH) tr;

     bit pattern[] = '{0, 1, 1, 1, 1};

        repeat (10) begin
            foreach (pattern[i]) begin
                tr = mini_ip_transaction#(WIDTH)::type_id::create("tr");
                start_item(tr);
                tr.d = pattern[i];
                finish_item(tr);
            end
        end
    endtask

endclass