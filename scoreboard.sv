class scoreboard;

  mailbox mon2scb;

  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction

  task main;
    int error_count = 0;
    transaction trans;

    repeat(1) 
      begin
      mon2scb.get(trans);

      // Expected behavior for a simple 4-bit shift register
      int expected_serial_data_out;
      if (trans.load)
        expected_serial_data_out = trans.parallel_data_in;
      else
        expected_serial_data_out = (trans.serial_data_out << 1) & 4'hF;

      // Check if the actual output matches the expected output
      if (trans.serial_data_out == expected_serial_data_out)
        $display("Cycle %0d: Result is as Expected", $time);
      else begin
        $error("Cycle %0d: Wrong Result", $time);
        error_count++;
      end

      trans.display("Scoreboard");
    end

    // Display final results
    if (error_count == 0)
      $display("Shift Register Test Passed: No errors detected");
    else
      $error("Shift Register Test Failed: %0d errors detected", error_count);

  endtask
endclass