// Code your design here

module ShiftRegister(
  input bit clk,
  input bit reset,
  input logic load,
  input logic [3:0] parallel_data_in,
  output logic [3:0] serial_data_out
);

  logic [3:0] shift_register;

  always @(posedge clk or posedge reset) begin
    if (reset)
      shift_register <= 4'b0000;
    else if (load)
      shift_register <= parallel_data_in;
    else
      shift_register <= {shift_register[2:0], 1'b0};
  end

  assign serial_data_out = shift_register;

endmodule

  