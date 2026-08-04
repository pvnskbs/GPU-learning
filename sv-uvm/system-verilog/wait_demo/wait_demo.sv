module wait_demo;

    logic ready = 0;

    always begin
        #1;
        $display("Watchdog timer: [%0t]", $time);
    end

    initial begin
        #10;
        ready = 1;
        $display("[%0t] Producer: ready set", $time);
    end

    initial begin
        $display("[%0t] Consumer: waiting...", $time);

        wait(ready);

        $display("[%0t] Consumer: ready received", $time);
        $finish;
    end

endmodule
