interface intf(input bit clk, reset);
  logic load;
  logic [3:0] parallel_data_in;
  logic [3:0] serial_data_out;
  
  clocking driver_cb@(posedge clk);
    default input #1 output #1;
    output load;
    output parallel_data_in;
    input serial_data_out;
  endclocking
  
  clocking monitor_cb@(posedge clk);
    default input #1 output #1;
    input load;
    input parallel_data_in;
    input serial_data_out;
  endclocking
  
  modport DRIVER(clocking driver_cb,input clk,reset);
    modport MONITOR(clocking monitor_cb,input clk,reset);
      
  
endinterface