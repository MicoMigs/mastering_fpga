`timescale 1ns/100ps
`default_nettype none

module tb_core;
  // DUT I/O
  reg  clk   = 0;
  reg  reset = 1;
  wire [3:0] up_cnt;
  wire [3:0] down_cnt;

  // 100 MHz clock
  always #5 clk = ~clk;

  // DUT
  core dut (
    .clk(clk),
    .reset(reset),
    .up_cnt(up_cnt),
    .down_cnt(down_cnt)
  );

  // Stimulus
  initial begin
    // hold reset a few cycles
    repeat (5) @(posedge clk);
    reset <= 0;

    // run for a while, then finish
    repeat (50) @(posedge clk);
    $finish;
  end

  // Simple trace
  initial begin
    $display("   time  rst  up  down");
    forever begin
      @(posedge clk);
      $display("%8t   %b   %h   %h", $time, reset, up_cnt, down_cnt);
    end
  end
endmodule

`default_nettype wire
