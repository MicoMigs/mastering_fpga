`timescale 1ns/100ps
module top
(
  input  wire clk,
  output wire [3:0] led
);
  // clock tree
  wire clk_100m_loc, clk_100m_tree;
  IBUF i0 (.I(clk),         .O(clk_100m_loc));
  BUFG i1 (.I(clk_100m_loc), .O(clk_100m_tree));

  // --- slow "tick" so humans can see it (~1.5 Hz) ---
  localparam integer DIV_BITS = 26; // 100e6 / 2^26 ≈ 1.49 Hz
  reg [DIV_BITS-1:0] divcnt = {DIV_BITS{1'b0}};
  always @(posedge clk_100m_tree) divcnt <= divcnt + 1'b1;

  // 1-cycle enable on the rising edge of the MSB
  reg tick_d;
  always @(posedge clk_100m_tree) tick_d <= divcnt[DIV_BITS-1];
  wire ce = divcnt[DIV_BITS-1] & ~tick_d;

  // --- 4-tap one-hot ring with explicit INITs & wrap ---
  wire u0_q, u1_q, u2_q, u3_q;

  // FDRE has INIT param; seed one-hot = 0001
  FDRE #(.INIT(1'b1)) u0 (.C(clk_100m_tree), .CE(ce), .R(1'b0), .D(u3_q), .Q(u0_q));
  FDRE #(.INIT(1'b0)) u1 (.C(clk_100m_tree), .CE(ce), .R(1'b0), .D(u0_q), .Q(u1_q));
  FDRE #(.INIT(1'b0)) u2 (.C(clk_100m_tree), .CE(ce), .R(1'b0), .D(u1_q), .Q(u2_q));
  FDRE #(.INIT(1'b0)) u3 (.C(clk_100m_tree), .CE(ce), .R(1'b0), .D(u2_q), .Q(u3_q));

  // outputs
  OBUF j0 (.I(u0_q), .O(led[0]));
  OBUF j1 (.I(u1_q), .O(led[1]));
  OBUF j2 (.I(u2_q), .O(led[2]));
  OBUF j3 (.I(u3_q), .O(led[3]));
endmodule
