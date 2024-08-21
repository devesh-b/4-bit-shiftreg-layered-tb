`include "interface.sv"
`include "test.sv"
module top;
  bit clk;
  bit reset;
  
  always #5 clk = ~clk;
  initial begin
    reset=1;
    #1 reset=0;
  end
  
  intf i_intf(clk,reset);
  test t1(i_intf);
  
  ShiftRegister shift_reg (
    .clk(i_intf.clk),
    .reset(i_intf.reset),
    .load(i_intf.load),
    .parallel_data_in(i_intf.parallel_data_in),
    .serial_data_out(i_intf.serial_data_out)
  );
  
endmodule

