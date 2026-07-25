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
  bit [7:0] addr_width;
  bit [7:0] data_width;
  
  function new(bit [7:0] addr_width = 8'h8,  bit [7:0] data_width = 8'h32);
    this.addr_width = addr_width;
    this.data_width = data_width;
    //this.WIDTH = 8;
  endfunction
  
  function void display();
    $display("Addr width = 0x%0h, Data width = 0x%0h", this.addr_width, this.data_width);
  endfunction
endclass

module foreachloop #(parameter WIDTH = 8) (input bit [WIDTH-1:0] array[5]);
  packet p, pp;
  initial begin
    p = new();
    p.randomize();
    foreach(p.array1[i])
      $display("%x", p.array1[i]);
    
    $display("\n");
    p.display();
    $display("\n");
    pp = new(8'h16, 8'h64);
    pp.display();
  end
endmodule
