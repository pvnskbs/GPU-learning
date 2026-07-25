// Code your testbench here
// or browse Examples
module tb;
	string array [5] = '{"apple", "orange", "pear", "blueberry", "lemon"};

	initial begin
      for (int i = 0, j = 0; i < $size(array); i++,j++) begin
			array[i][j] = "0";
        $display ("array[%0d] = %s, %0dth index replaced by 0", i, array[i], j);
		end
	end
endmodule

class packet;
  parameter WIDTH = 8;
  rand bit [WIDTH-1:0] array1[5];
endclass

module foreachloop #(parameter WIDTH = 8) (input bit [WIDTH-1:0] array[5]);
  initial begin
    packet p = new();
    p.randomize();
    foreach(p.array1[i])
      $display("%x", p.array1[i]);
  end
endmodule
