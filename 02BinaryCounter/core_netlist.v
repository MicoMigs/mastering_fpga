// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Wed Sep  3 18:19:45 2025
// Host        : MICO-LAPTOP running 64-bit major release  (build 9200)
// Command     : write_verilog -force core_netlist.v
// Design      : core
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "1ed69f30" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module core
   (clk,
    reset,
    up_cnt,
    down_cnt);
  input clk;
  input reset;
  output [3:0]up_cnt;
  output [3:0]down_cnt;

  wire \<const1> ;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire dec_en;
  wire [3:0]down_cnt;
  wire [3:0]down_cnt_OBUF;
  wire [2:1]p_0_in;
  wire reset;
  wire reset_IBUF;
  wire [3:0]up_cnt;
  wire [3:0]up_cnt_OBUF;

  VCC VCC
       (.P(\<const1> ));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF \down_cnt_OBUF[0]_inst 
       (.I(down_cnt_OBUF[0]),
        .O(down_cnt[0]));
  OBUF \down_cnt_OBUF[1]_inst 
       (.I(down_cnt_OBUF[1]),
        .O(down_cnt[1]));
  OBUF \down_cnt_OBUF[2]_inst 
       (.I(down_cnt_OBUF[2]),
        .O(down_cnt[2]));
  OBUF \down_cnt_OBUF[3]_inst 
       (.I(down_cnt_OBUF[3]),
        .O(down_cnt[3]));
  FDCE #(
    .INIT(1'b0)) 
    \enable_sr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(reset_IBUF),
        .D(\<const1> ),
        .Q(p_0_in[1]));
  FDCE #(
    .INIT(1'b0)) 
    \enable_sr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(reset_IBUF),
        .D(p_0_in[1]),
        .Q(p_0_in[2]));
  FDCE #(
    .INIT(1'b0)) 
    \enable_sr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(reset_IBUF),
        .D(p_0_in[2]),
        .Q(dec_en));
  my_74193 \gen_i1[0].u_my_74193 
       (.CLK(clk_IBUF_BUFG),
        .Q(up_cnt_OBUF),
        .\my_cnt_reg[3]_0 (dec_en),
        .reset_IBUF(reset_IBUF));
  my_74193_0 \gen_i1[1].u_my_74193 
       (.CLK(clk_IBUF_BUFG),
        .Q(down_cnt_OBUF),
        .\my_cnt_reg[3]_0 (dec_en),
        .reset_IBUF(reset_IBUF));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  OBUF \up_cnt_OBUF[0]_inst 
       (.I(up_cnt_OBUF[0]),
        .O(up_cnt[0]));
  OBUF \up_cnt_OBUF[1]_inst 
       (.I(up_cnt_OBUF[1]),
        .O(up_cnt[1]));
  OBUF \up_cnt_OBUF[2]_inst 
       (.I(up_cnt_OBUF[2]),
        .O(up_cnt[2]));
  OBUF \up_cnt_OBUF[3]_inst 
       (.I(up_cnt_OBUF[3]),
        .O(up_cnt[3]));
endmodule

module my_74193
   (Q,
    \my_cnt_reg[3]_0 ,
    CLK,
    reset_IBUF);
  output [3:0]Q;
  input [0:0]\my_cnt_reg[3]_0 ;
  input CLK;
  input reset_IBUF;

  wire CLK;
  wire [3:0]Q;
  wire \my_cnt[0]_i_1_n_0 ;
  wire \my_cnt[1]_i_1_n_0 ;
  wire \my_cnt[2]_i_1_n_0 ;
  wire \my_cnt[3]_i_1_n_0 ;
  wire [0:0]\my_cnt_reg[3]_0 ;
  wire reset_IBUF;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \my_cnt[0]_i_1 
       (.I0(Q[0]),
        .O(\my_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \my_cnt[1]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(\my_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \my_cnt[2]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(\my_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \my_cnt[3]_i_1 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(\my_cnt[3]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \my_cnt_reg[0] 
       (.C(CLK),
        .CE(\my_cnt_reg[3]_0 ),
        .CLR(reset_IBUF),
        .D(\my_cnt[0]_i_1_n_0 ),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \my_cnt_reg[1] 
       (.C(CLK),
        .CE(\my_cnt_reg[3]_0 ),
        .CLR(reset_IBUF),
        .D(\my_cnt[1]_i_1_n_0 ),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \my_cnt_reg[2] 
       (.C(CLK),
        .CE(\my_cnt_reg[3]_0 ),
        .CLR(reset_IBUF),
        .D(\my_cnt[2]_i_1_n_0 ),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \my_cnt_reg[3] 
       (.C(CLK),
        .CE(\my_cnt_reg[3]_0 ),
        .CLR(reset_IBUF),
        .D(\my_cnt[3]_i_1_n_0 ),
        .Q(Q[3]));
endmodule

(* ORIG_REF_NAME = "my_74193" *) 
module my_74193_0
   (Q,
    \my_cnt_reg[3]_0 ,
    CLK,
    reset_IBUF);
  output [3:0]Q;
  input [0:0]\my_cnt_reg[3]_0 ;
  input CLK;
  input reset_IBUF;

  wire CLK;
  wire [3:0]Q;
  wire \my_cnt[0]_i_1__0_n_0 ;
  wire \my_cnt[1]_i_1_n_0 ;
  wire \my_cnt[2]_i_1_n_0 ;
  wire \my_cnt[3]_i_1_n_0 ;
  wire [0:0]\my_cnt_reg[3]_0 ;
  wire reset_IBUF;

  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \my_cnt[0]_i_1__0 
       (.I0(Q[0]),
        .O(\my_cnt[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \my_cnt[1]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(\my_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hA9)) 
    \my_cnt[2]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .O(\my_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hAAA9)) 
    \my_cnt[3]_i_1 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .O(\my_cnt[3]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \my_cnt_reg[0] 
       (.C(CLK),
        .CE(\my_cnt_reg[3]_0 ),
        .CLR(reset_IBUF),
        .D(\my_cnt[0]_i_1__0_n_0 ),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \my_cnt_reg[1] 
       (.C(CLK),
        .CE(\my_cnt_reg[3]_0 ),
        .CLR(reset_IBUF),
        .D(\my_cnt[1]_i_1_n_0 ),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \my_cnt_reg[2] 
       (.C(CLK),
        .CE(\my_cnt_reg[3]_0 ),
        .CLR(reset_IBUF),
        .D(\my_cnt[2]_i_1_n_0 ),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \my_cnt_reg[3] 
       (.C(CLK),
        .CE(\my_cnt_reg[3]_0 ),
        .CLR(reset_IBUF),
        .D(\my_cnt[3]_i_1_n_0 ),
        .Q(Q[3]));
endmodule
