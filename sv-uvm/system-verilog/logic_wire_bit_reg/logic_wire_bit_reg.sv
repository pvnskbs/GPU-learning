module logic_wire_bit_reg;

    bit    b;
    logic  l;
    wire a;
    logic x = 0;
    logic y = 1;
    reg    r;
    wire   w;

    assign w = 1'b1;
    assign a = y;
    assign a = x;

    initial begin

        #1

        $display("bit   = %b", b);
        $display("logic = %b", l);
        $display("reg   = %b", r);
        $display("wire  = %b", w);
        $display("logic a  = %b", a);

        b=1'b1;
        l=1'b1;
        r=1'b1;



    end

endmodule
