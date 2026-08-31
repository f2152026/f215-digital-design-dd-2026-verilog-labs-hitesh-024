// cla64_hier.v
// BONUS -- open-ended. No detailed scaffold is provided; this is meant to
// be a genuine design exercise. Not required for lab submission.
//
// You will likely need to modify cla4.v (or add signals alongside it) so
// that block-generate/block-propagate summaries of its own Gi, Pi signals
// are exposed as outputs, since the second-level lookahead unit below
// needs them. As with every module in this lab from Task 2 onward, every
// gate/assign you add should carry an explicit delay.
//
// Starting point (from Tutorial 3, Q4(d)):
//   - Reuse 16 four-bit CLA blocks (your cla4.v) -- their internal logic
//     doesn't change.
//   - For each block k, define:
//       Gblk_k = "this block produces a carry regardless of its incoming
//                 carry" -- a Boolean function of that block's own 4
//                 bit-level Gi, Pi signals.
//       Pblk_k = "an incoming carry sails straight through this whole
//                 block" -- likewise a function of its own Gi, Pi.
//   - Build a second-level lookahead unit -- structurally identical to
//     cla4.v, just one level up -- that computes each block's carry-in
//     directly from Gblk_0..Gblk_15, Pblk_0..Pblk_15, and cin, instead of
//     rippling block to block.
//
// To test this, wire it into dut.v as a fourth option (copy the pattern
// used for the other three) and run it through the same tb.v. Compare
// your final delay to cla64_blocked.v from Task 4.

module cla64_hier(
  input  [63:0] a,
  input  [63:0] b,
  input         cin,
  output [63:0] sum,
  output        cout
);

  // TODO: your hierarchical design goes here.
  wire [15:0] unused;

  assign #(2) Gblk_0  = (a[3] & b[3])   | ((a[3] ^ b[3])   & ((a[2] & b[2])   | ((a[2] ^ b[2])   & ((a[1] & b[1])   | ((a[1] ^ b[1])   & (a[0] & b[0]))))));
  assign #(2) Gblk_1  = (a[7] & b[7])   | ((a[7] ^ b[7])   & ((a[6] & b[6])   | ((a[6] ^ b[6])   & ((a[5] & b[5])   | ((a[5] ^ b[5])   & (a[4] & b[4]))))));
  assign #(2) Gblk_2  = (a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9])   | ((a[9] ^ b[9])   & (a[8] & b[8]))))));
  assign #(2) Gblk_3  = (a[15] & b[15]) | ((a[15] ^ b[15]) & ((a[14] & b[14]) | ((a[14] ^ b[14]) & ((a[13] & b[13]) | ((a[13] ^ b[13]) & (a[12] & b[12]))))));
  assign #(2) Gblk_4  = (a[19] & b[19]) | ((a[19] ^ b[19]) & ((a[18] & b[18]) | ((a[18] ^ b[18]) & ((a[17] & b[17]) | ((a[17] ^ b[17]) & (a[16] & b[16]))))));
  assign #(2) Gblk_5  = (a[23] & b[23]) | ((a[23] ^ b[23]) & ((a[22] & b[22]) | ((a[22] ^ b[22]) & ((a[21] & b[21]) | ((a[21] ^ b[21]) & (a[20] & b[20]))))));
  assign #(2) Gblk_6  = (a[27] & b[27]) | ((a[27] ^ b[27]) & ((a[26] & b[26]) | ((a[26] ^ b[26]) & ((a[25] & b[25]) | ((a[25] ^ b[25]) & (a[24] & b[24]))))));
  assign #(2) Gblk_7  = (a[31] & b[31]) | ((a[31] ^ b[31]) & ((a[30] & b[30]) | ((a[30] ^ b[30]) & ((a[29] & b[29]) | ((a[29] ^ b[29]) & (a[28] & b[28]))))));
  assign #(2) Gblk_8  = (a[35] & b[35]) | ((a[35] ^ b[35]) & ((a[34] & b[34]) | ((a[34] ^ b[34]) & ((a[33] & b[33]) | ((a[33] ^ b[33]) & (a[32] & b[32]))))));
  assign #(2) Gblk_9  = (a[39] & b[39]) | ((a[39] ^ b[39]) & ((a[38] & b[38]) | ((a[38] ^ b[38]) & ((a[37] & b[37]) | ((a[37] ^ b[37]) & (a[36] & b[36]))))));
  assign #(2) Gblk_10 = (a[43] & b[43]) | ((a[43] ^ b[43]) & ((a[42] & b[42]) | ((a[42] ^ b[42]) & ((a[41] & b[41]) | ((a[41] ^ b[41]) & (a[40] & b[40]))))));
  assign #(2) Gblk_11 = (a[47] & b[47]) | ((a[47] ^ b[47]) & ((a[46] & b[46]) | ((a[46] ^ b[46]) & ((a[45] & b[45]) | ((a[45] ^ b[45]) & (a[44] & b[44]))))));
  assign #(2) Gblk_12 = (a[51] & b[51]) | ((a[51] ^ b[51]) & ((a[50] & b[50]) | ((a[50] ^ b[50]) & ((a[49] & b[49]) | ((a[49] ^ b[49]) & (a[48] & b[48]))))));
  assign #(2) Gblk_13 = (a[55] & b[55]) | ((a[55] ^ b[55]) & ((a[54] & b[54]) | ((a[54] ^ b[54]) & ((a[53] & b[53]) | ((a[53] ^ b[53]) & (a[52] & b[52]))))));
  assign #(2) Gblk_14 = (a[59] & b[59]) | ((a[59] ^ b[59]) & ((a[58] & b[58]) | ((a[58] ^ b[58]) & ((a[57] & b[57]) | ((a[57] ^ b[57]) & (a[56] & b[56]))))));
  assign #(2) Gblk_15 = (a[63] & b[63]) | ((a[63] ^ b[63]) & ((a[62] & b[62]) | ((a[62] ^ b[62]) & ((a[61] & b[61]) | ((a[61] ^ b[61]) & (a[60] & b[60]))))));

  assign #(2) Pblk_0  = (a[0]  | b[0])  & (a[1]  | b[1])  & (a[2]  | b[2])  & (a[3]  | b[3]);
  assign #(2) Pblk_1  = (a[4]  | b[4])  & (a[5]  | b[5])  & (a[6]  | b[6])  & (a[7]  | b[7]);
  assign #(2) Pblk_2  = (a[8]  | b[8])  & (a[9]  | b[9])  & (a[10] | b[10]) & (a[11] | b[11]);
  assign #(2) Pblk_3  = (a[12] | b[12]) & (a[13] | b[13]) & (a[14] | b[14]) & (a[15] | b[15]);
  assign #(2) Pblk_4  = (a[16] | b[16]) & (a[17] | b[17]) & (a[18] | b[18]) & (a[19] | b[19]);
  assign #(2) Pblk_5  = (a[20] | b[20]) & (a[21] | b[21]) & (a[22] | b[22]) & (a[23] | b[23]);
  assign #(2) Pblk_6  = (a[24] | b[24]) & (a[25] | b[25]) & (a[26] | b[26]) & (a[27] | b[27]);
  assign #(2) Pblk_7  = (a[28] | b[28]) & (a[29] | b[29]) & (a[30] | b[30]) & (a[31] | b[31]);
  assign #(2) Pblk_8  = (a[32] | b[32]) & (a[33] | b[33]) & (a[34] | b[34]) & (a[35] | b[35]);
  assign #(2) Pblk_9  = (a[36] | b[36]) & (a[37] | b[37]) & (a[38] | b[38]) & (a[39] | b[39]);
  assign #(2) Pblk_10 = (a[40] | b[40]) & (a[41] | b[41]) & (a[42] | b[42]) & (a[43] | b[43]);
  assign #(2) Pblk_11 = (a[44] | b[44]) & (a[45] | b[45]) & (a[46] | b[46]) & (a[47] | b[47]);
  assign #(2) Pblk_12 = (a[48] | b[48]) & (a[49] | b[49]) & (a[50] | b[50]) & (a[51] | b[51]);
  assign #(2) Pblk_13 = (a[52] | b[52]) & (a[53] | b[53]) & (a[54] | b[54]) & (a[55] | b[55]);
  assign #(2) Pblk_14 = (a[56] | b[56]) & (a[57] | b[57]) & (a[58] | b[58]) & (a[59] | b[59]);
  assign #(2) Pblk_15 = (a[60] | b[60]) & (a[61] | b[61]) & (a[62] | b[62]) & (a[63] | b[63]);

  assign #(2) Cblk_1  = Gblk_0 | (Pblk_0 & cin);
  assign #(2) Cblk_2  = Gblk_1 | (Pblk_1 & Gblk_0) | (Pblk_1 & Pblk_0 & cin);
  assign #(2) Cblk_3  = Gblk_2 | (Pblk_2 & Gblk_1) | (Pblk_2 & Pblk_1 & Gblk_0) | (Pblk_2 & Pblk_1 & Pblk_0 & cin);
  assign #(2) Cblk_4  = Gblk_3 | (Pblk_3 & Gblk_2) | (Pblk_3 & Pblk_2 & Gblk_1) | (Pblk_3 & Pblk_2 & Pblk_1 & Gblk_0) 
                              | (Pblk_3 & Pblk_2 & Pblk_1 & Pblk_0 & cin);
  assign #(2) Cblk_5  = Gblk_4 | (Pblk_4 & Gblk_3) | (Pblk_4 & Pblk_3 & Gblk_2) | (Pblk_4 & Pblk_3 & Pblk_2 & Gblk_1) 
                              | (Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Gblk_0) | (Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Pblk_0 & cin);
  assign #(2) Cblk_6  = Gblk_5 | (Pblk_5 & Gblk_4) | (Pblk_5 & Pblk_4 & Gblk_3) | (Pblk_5 & Pblk_4 & Pblk_3 & Gblk_2) 
                              | (Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Gblk_1) | (Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Gblk_0) 
                              | (Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Pblk_0 & cin);
  assign #(2) Cblk_7  = Gblk_6 | (Pblk_6 & Gblk_5) | (Pblk_6 & Pblk_5 & Gblk_4) | (Pblk_6 & Pblk_5 & Pblk_4 & Gblk_3) 
                              | (Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Gblk_2) | (Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Gblk_1) 
                              | (Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Gblk_0) 
                              | (Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Pblk_0 & cin);
  assign #(2) Cblk_8  = Gblk_7 | (Pblk_7 & Gblk_6) | (Pblk_7 & Pblk_6 & Gblk_5) | (Pblk_7 & Pblk_6 & Pblk_5 & Gblk_4) 
                              | (Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Gblk_3) | (Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Gblk_2) 
                              | (Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Gblk_1) 
                              | (Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Gblk_0) 
                              | (Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Pblk_0 & cin);
  assign #(2) Cblk_9  = Gblk_8 | (Pblk_8 & Gblk_7) | (Pblk_8 & Pblk_7 & Gblk_6) | (Pblk_8 & Pblk_7 & Pblk_6 & Gblk_5) 
                              | (Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Gblk_4) | (Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Gblk_3) 
                              | (Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Gblk_2) 
                              | (Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Gblk_1) 
                              | (Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Gblk_0) 
                              | (Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Pblk_0 & cin);
  assign #(2) Cblk_10 = Gblk_9 | (Pblk_9 & Gblk_8) | (Pblk_9 & Pblk_8 & Gblk_7) | (Pblk_9 & Pblk_8 & Pblk_7 & Gblk_6) 
                              | (Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Gblk_5) | (Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Gblk_4) 
                              | (Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Gblk_3) 
                              | (Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Gblk_2) 
                              | (Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Gblk_1) 
                              | (Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Gblk_0) 
                              | (Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Pblk_0 & cin);
  assign #(2) Cblk_11 = Gblk_10 | (Pblk_10 & Gblk_9) | (Pblk_10 & Pblk_9 & Gblk_8) | (Pblk_10 & Pblk_9 & Pblk_8 & Gblk_7) 
                                | (Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Gblk_6) | (Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Gblk_5) 
                                | (Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Gblk_4) 
                                | (Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Gblk_3) 
                                | (Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Gblk_2) 
                                | (Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Gblk_1) 
                                | (Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Gblk_0) 
                                | (Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Pblk_0 & cin);
  assign #(2) Cblk_12 = Gblk_11 | (Pblk_11 & Gblk_10) | (Pblk_11 & Pblk_10 & Gblk_9) | (Pblk_11 & Pblk_10 & Pblk_9 & Gblk_8) 
                                | (Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Gblk_7) | (Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Gblk_6) 
                                | (Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Gblk_5) 
                                | (Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Gblk_4) 
                                | (Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Gblk_3) 
                                | (Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Gblk_2) 
                                | (Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Gblk_1) 
                                | (Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Gblk_0) 
                                | (Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Pblk_0 & cin);
  assign #(2) Cblk_13 = Gblk_12 | (Pblk_12 & Gblk_11) | (Pblk_12 & Pblk_11 & Gblk_10) | (Pblk_12 & Pblk_11 & Pblk_10 & Gblk_9) 
                                | (Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Gblk_8) | (Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Gblk_7) 
                                | (Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Gblk_6) 
                                | (Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Gblk_5) 
                                | (Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Gblk_4) 
                                | (Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Gblk_3) 
                                | (Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Gblk_2) 
                                | (Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Gblk_1) 
                                | (Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Gblk_0) 
                                | (Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Pblk_0 & cin);
  assign #(2) Cblk_14 = Gblk_13 | (Pblk_13 & Gblk_12) | (Pblk_13 & Pblk_12 & Gblk_11) | (Pblk_13 & Pblk_12 & Pblk_11 & Gblk_10) 
                                | (Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Gblk_9) | (Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Gblk_8) 
                                | (Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Gblk_7) 
                                | (Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Gblk_6) 
                                | (Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Gblk_5) 
                                | (Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Gblk_4) 
                                | (Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Gblk_3) 
                                | (Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Gblk_2) 
                                | (Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Gblk_1) 
                                | (Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Gblk_0) 
                                | (Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Pblk_0 & cin);
  assign #(2) Cblk_15 = Gblk_14 | (Pblk_14 & Gblk_13) | (Pblk_14 & Pblk_13 & Gblk_12) | (Pblk_14 & Pblk_13 & Pblk_12 & Gblk_11) 
                                | (Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Gblk_10) | (Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Gblk_9) 
                                | (Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Gblk_8) 
                                | (Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Gblk_7) 
                                | (Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Gblk_6) 
                                | (Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Gblk_5) 
                                | (Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Gblk_4) 
                                | (Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Gblk_3) 
                                | (Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Gblk_2) 
                                | (Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Gblk_1) 
                                | (Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Gblk_0) 
                                | (Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Pblk_0 & cin);
  assign #(2) cout    = Gblk_15 | (Pblk_15 & Gblk_14) | (Pblk_15 & Pblk_14 & Gblk_13) | (Pblk_15 & Pblk_14 & Pblk_13 & Gblk_12) 
                                | (Pblk_15 & Pblk_14 & Pblk_13 & Pblk_12 & Gblk_11) | (Pblk_15 & Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Gblk_10) 
                                | (Pblk_15 & Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Gblk_9) 
                                | (Pblk_15 & Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Gblk_8) 
                                | (Pblk_15 & Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Gblk_7) 
                                | (Pblk_15 & Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Gblk_6) 
                                | (Pblk_15 & Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Gblk_5) 
                                | (Pblk_15 & Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Gblk_4) 
                                | (Pblk_15 & Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Gblk_3) 
                                | (Pblk_15 & Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Gblk_2) 
                                | (Pblk_15 & Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Gblk_1) 
                                | (Pblk_15 & Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Gblk_0) 
                                | (Pblk_15 & Pblk_14 & Pblk_13 & Pblk_12 & Pblk_11 & Pblk_10 & Pblk_9 & Pblk_8 & Pblk_7 & Pblk_6 & Pblk_5 & Pblk_4 & Pblk_3 & Pblk_2 & Pblk_1 & Pblk_0 & cin);
  
  cla4 block0  (.a(a[3:0]),   .b(b[3:0]),   .cin(cin),     .sum(sum[3:0]),   .cout(unused[0]));
  cla4 block1  (.a(a[7:4]),   .b(b[7:4]),   .cin(Cblk_1),  .sum(sum[7:4]),   .cout(unused[1]));
  cla4 block2  (.a(a[11:8]),  .b(b[11:8]),  .cin(Cblk_2),  .sum(sum[11:8]),  .cout(unused[2]));
  cla4 block3  (.a(a[15:12]), .b(b[15:12]), .cin(Cblk_3),  .sum(sum[15:12]), .cout(unused[3]));
  cla4 block4  (.a(a[19:16]), .b(b[19:16]), .cin(Cblk_4),  .sum(sum[19:16]), .cout(unused[4]));
  cla4 block5  (.a(a[23:20]), .b(b[23:20]), .cin(Cblk_5),  .sum(sum[23:20]), .cout(unused[5]));
  cla4 block6  (.a(a[27:24]), .b(b[27:24]), .cin(Cblk_6),  .sum(sum[27:24]), .cout(unused[6]));
  cla4 block7  (.a(a[31:28]), .b(b[31:28]), .cin(Cblk_7),  .sum(sum[31:28]), .cout(unused[7]));
  cla4 block8  (.a(a[35:32]), .b(b[35:32]), .cin(Cblk_8),  .sum(sum[35:32]), .cout(unused[8]));
  cla4 block9  (.a(a[39:36]), .b(b[39:36]), .cin(Cblk_9),  .sum(sum[39:36]), .cout(unused[9]));
  cla4 block10 (.a(a[43:40]), .b(b[43:40]), .cin(Cblk_10), .sum(sum[43:40]), .cout(unused[10]));
  cla4 block11 (.a(a[47:44]), .b(b[47:44]), .cin(Cblk_11), .sum(sum[47:44]), .cout(unused[11]));
  cla4 block12 (.a(a[51:48]), .b(b[51:48]), .cin(Cblk_12), .sum(sum[51:48]), .cout(unused[12]));
  cla4 block13 (.a(a[55:52]), .b(b[55:52]), .cin(Cblk_13), .sum(sum[55:52]), .cout(unused[13]));
  cla4 block14 (.a(a[59:56]), .b(b[59:56]), .cin(Cblk_14), .sum(sum[59:56]), .cout(unused[14]));
  cla4 block15 (.a(a[63:60]), .b(b[63:60]), .cin(Cblk_15), .sum(sum[63:60]), .cout(unused[15]));
endmodule