class transaction;
  rand logic load;
  rand logic [3:0] parallel_data_in;
  logic [3:0] serial_data_out;


  // Function to display the transaction details
  function void display(string name);
    $display("-------------------------");
    $display(" %s ", name);
    $display("-------------------------");
    $display("clk = %0d, reset = %0d, load = %0d", clk, reset, load);
    $display("parallel_data_in = %0d, serial_data_out = %0d", parallel_data_in, serial_data_out);
    $display("-------------------------");
  endfunction
  
   covergroup cov;
    coverpoint load;
    coverpoint parallel_data_in;
  endgroup
  
  task run();
    cov.sample();
  endtask
  
endclass
