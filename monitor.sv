`define M_IF vif.MONITOR.monitor_cb

class monitor;
  
  virtual intf vif;
  mailbox mon2scb;

  function new(virtual intf vif, mailbox mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction

  task main;
    repeat(1)
      #5 // Allow some simulation time for the changes to propagate
     begin
      transaction trans;
      trans = new();
      trans.load = `M_IF.load;
      trans.parallel_data_in = `M_IF.parallel_data_in;
      trans.serial_data_out = `M_IF.serial_data_out;

      mon2scb.put(trans);
      trans.display("Monitor");
    end
  endtask

endclass