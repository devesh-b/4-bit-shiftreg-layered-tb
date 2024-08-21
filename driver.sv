`define D_IF vif.DRIVER.driver_cb

class driver;
  
  virtual intf vif;
  mailbox gen2driv;

  function new(virtual intf vif, mailbox gen2driv);
    this.vif = vif;
    this.gen2driv = gen2driv;
  endfunction

  task main;
      begin
      transaction trans;
      gen2driv.get(trans);
	  @(posedge vif.DRIVER.clk)
        begin
          `D_IF.load  <= trans.load;
          `D_IF.parallel_data_in <= trans.parallel_data_in;
        trans.serial_data_out = `D_IF.serial_data_out;
        trans.display("Driver");
        end
   	  end
  endtask
endclass