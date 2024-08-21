class generator;
  
  transaction trans; 
  mailbox gen2driv; // Mailbox declaration

  function new(mailbox gen2driv); 
    this.gen2driv = gen2driv;
  endfunction

  task main();
    
    repeat(1) 
      begin
      trans = new();
      trans.randomize();
      gen2driv.put(trans);
      trans.display("Generator");
      trans.run();
    end
  endtask
  
endclass