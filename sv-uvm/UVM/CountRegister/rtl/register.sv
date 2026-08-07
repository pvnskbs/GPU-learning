module register #(parameter WIDTH = 4) (
    input logic clk,
    input logic rst_n,
    input logic en,
    output logic [WIDTH-1:0] count
);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            count <= 4'b0;
        else if (rst_n & en)
            count <= count + 1'b1;
        else
            count <= count;
    end

endmodule