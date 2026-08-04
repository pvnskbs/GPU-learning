module forkjoin_demo;

initial begin

    $display("[%0t] Start", $time);

    fork

        begin
            #5;
            $display("[%0t] Thread A", $time);
        end

        begin
            #3;
            $display("[%0t] Thread B", $time);
        end

    join

    $display("[%0t] Finished", $time);

end

endmodule
