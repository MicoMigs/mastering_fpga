`timescale 1 ns / 100 ps
`default_nettype none

module top
(
  input  wire clk,       // 100 MHz system clock
  output wire [3:0] led  // 4 user LEDs
);

  wire clk_100m_loc;
  wire clk_100m_tree;

  reg [3:0] d_flop_sr = 4'b0001;
  reg [26:0] counter   = 0;   // ~27 bits enough for 100M counts
  reg pulse_1hz        = 0;

  // Infer clock buffers
  assign clk_100m_loc  = clk;
  assign clk_100m_tree = clk_100m_loc;

  // Clock divider to generate 1 Hz pulse
  always @(posedge clk_100m_tree) begin
    if (counter == 100_000_000-1) begin
      counter   <= 0;
      pulse_1hz <= 1;
    end else begin
      counter   <= counter + 1;
      pulse_1hz <= 0;
    end
  end

  // Shift register updates once per second
  always @(posedge clk_100m_tree) begin
    if (pulse_1hz) begin 
      d_flop_sr <= { d_flop_sr[2:0], d_flop_sr[3] };
    end
  end

  assign led = d_flop_sr;

endmodule

`default_nettype wire
