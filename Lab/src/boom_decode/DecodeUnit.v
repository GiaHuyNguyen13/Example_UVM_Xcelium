module DecodeUnit(
  // enq_bundle
  input  [31:0] io_enq_uop_inst,
  input  [31:0] io_enq_uop_debug_inst, // bypass
  input         io_enq_uop_is_rvc, // bypass
  input         io_enq_uop_is_sfb,
  input  [5:0]  io_enq_uop_ftq_idx,
  input         io_enq_uop_edge_inst,
  input  [5:0]  io_enq_uop_pc_lob,
  input         io_enq_uop_taken,
  input         io_enq_uop_xcpt_pf_if,
  input         io_enq_uop_xcpt_ae_if,
  input         io_enq_uop_bp_debug_if,
  input         io_enq_uop_bp_xcpt_if,
  input  [1:0]  io_enq_uop_debug_fsrc,
  // deq_bundle
  output [6:0]  io_deq_uop_uopc, // micro opcode
  output [31:0] io_deq_uop_debug_inst, // bypass
  output        io_deq_uop_is_rvc, // bypass
  output [2:0]  io_deq_uop_iq_type, // table
  output [9:0]  io_deq_uop_fu_code,
  output        io_deq_uop_is_br, // table
  output        io_deq_uop_is_jalr, 
  output        io_deq_uop_is_jal,
  output        io_deq_uop_is_sfb, // bypass
  output [5:0]  io_deq_uop_ftq_idx, // bypass
  output        io_deq_uop_edge_inst, // bypass
  output [5:0]  io_deq_uop_pc_lob, // bypass
  output        io_deq_uop_taken, // bypass
  output [19:0] io_deq_uop_imm_packed,
  output        io_deq_uop_exception,
  output [63:0] io_deq_uop_exc_cause,
  output        io_deq_uop_bypassable,// table
  output [4:0]  io_deq_uop_mem_cmd, // table
  output [1:0]  io_deq_uop_mem_size,
  output        io_deq_uop_mem_signed,
  output        io_deq_uop_is_fence, // table
  output        io_deq_uop_is_fencei, // table
  output        io_deq_uop_is_amo, // table
  output        io_deq_uop_uses_ldq, // table
  output        io_deq_uop_uses_stq, // table
  output        io_deq_uop_is_sys_pc2epc,
  output        io_deq_uop_is_unique,
  output        io_deq_uop_flush_on_commit, // table
  output        io_deq_uop_ldst_is_rs1,
  output [5:0]  io_deq_uop_ldst,
  output [5:0]  io_deq_uop_lrs1,
  output [5:0]  io_deq_uop_lrs2,
  output [5:0]  io_deq_uop_lrs3,
  output        io_deq_uop_ldst_val,
  output [1:0]  io_deq_uop_dst_rtype,
  output [1:0]  io_deq_uop_lrs1_rtype,
  output [1:0]  io_deq_uop_lrs2_rtype,
  output        io_deq_uop_frs3_en,
  output        io_deq_uop_fp_val,
  output [1:0]  io_deq_uop_debug_fsrc, // bypass
  // csr_decode
  output [31:0] io_csr_decode_inst, // bypass from "io_enq_uop_inst"
  input         io_csr_decode_fp_illegal,
  input         io_csr_decode_read_illegal,
  input         io_csr_decode_write_illegal,
  input         io_csr_decode_write_flush,
  input         io_csr_decode_system_illegal,
  // interrupt
  input         io_interrupt,
  // interrupt_cause
  input  [63:0] io_interrupt_cause
);
  wire [31:0] cs_decoder_decoded_invInputs = ~io_enq_uop_inst; // @[pla.scala 78:21]
  wire  cs_decoder_decoded_andMatrixInput_0 = io_enq_uop_inst[0]; // @[pla.scala 90:45]
  wire  cs_decoder_decoded_andMatrixInput_1 = io_enq_uop_inst[1]; // @[pla.scala 90:45]
  wire  cs_decoder_decoded_andMatrixInput_2 = cs_decoder_decoded_invInputs[2]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_3 = cs_decoder_decoded_invInputs[3]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_4 = cs_decoder_decoded_invInputs[5]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_5 = cs_decoder_decoded_invInputs[6]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_6 = cs_decoder_decoded_invInputs[12]; // @[pla.scala 91:29]
  wire [6:0] _cs_decoder_decoded_T = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_1 = &_cs_decoder_decoded_T; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_4_1 = cs_decoder_decoded_invInputs[4]; // @[pla.scala 91:29]
  wire [7:0] _cs_decoder_decoded_T_2 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_3 = &_cs_decoder_decoded_T_2; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_7_1 = cs_decoder_decoded_invInputs[13]; // @[pla.scala 91:29]
  wire [7:0] _cs_decoder_decoded_T_4 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_1}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_5 = &_cs_decoder_decoded_T_4; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_6_3 = cs_decoder_decoded_invInputs[14]; // @[pla.scala 91:29]
  wire [6:0] _cs_decoder_decoded_T_6 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_7 = &_cs_decoder_decoded_T_6; // @[pla.scala 98:74]
  wire [7:0] _cs_decoder_decoded_T_8 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_9 = &_cs_decoder_decoded_T_8; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_2_5 = io_enq_uop_inst[2]; // @[pla.scala 90:45]
  wire  cs_decoder_decoded_andMatrixInput_3_5 = io_enq_uop_inst[3]; // @[pla.scala 90:45]
  wire [8:0] _cs_decoder_decoded_T_10 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_11 = &_cs_decoder_decoded_T_10; // @[pla.scala 98:74]
  wire [9:0] _cs_decoder_decoded_T_12 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_13 = &_cs_decoder_decoded_T_12; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_4_7 = io_enq_uop_inst[4]; // @[pla.scala 90:45]
  wire [7:0] _cs_decoder_decoded_T_14 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_15 = &_cs_decoder_decoded_T_14; // @[pla.scala 98:74]
  wire [8:0] _cs_decoder_decoded_T_16 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_4_7,cs_decoder_decoded_andMatrixInput_4,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_17 = &_cs_decoder_decoded_T_16; // @[pla.scala 98:74]
  wire [9:0] _cs_decoder_decoded_T_18 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_19 = &_cs_decoder_decoded_T_18; // @[pla.scala 98:74]
  wire [5:0] _cs_decoder_decoded_T_20 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_21 = &_cs_decoder_decoded_T_20; // @[pla.scala 98:74]
  wire [6:0] _cs_decoder_decoded_T_22 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_23 = &_cs_decoder_decoded_T_22; // @[pla.scala 98:74]
  wire [9:0] _cs_decoder_decoded_T_24 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_25 = &_cs_decoder_decoded_T_24; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_5_13 = io_enq_uop_inst[5]; // @[pla.scala 90:45]
  wire [7:0] _cs_decoder_decoded_T_26 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_27 = &_cs_decoder_decoded_T_26; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_9_3 = cs_decoder_decoded_invInputs[25]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_10 = cs_decoder_decoded_invInputs[26]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_11 = cs_decoder_decoded_invInputs[27]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_12 = cs_decoder_decoded_invInputs[28]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_13 = cs_decoder_decoded_invInputs[29]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_14 = cs_decoder_decoded_invInputs[31]; // @[pla.scala 91:29]
  wire [6:0] cs_decoder_decoded_lo_14 = {cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_9_3,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,
    cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [14:0] _cs_decoder_decoded_T_28 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_4_7,cs_decoder_decoded_andMatrixInput_5_13,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_lo_14}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_29 = &_cs_decoder_decoded_T_28; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_11_1 = cs_decoder_decoded_invInputs[30]; // @[pla.scala 91:29]
  wire [5:0] cs_decoder_decoded_lo_15 = {cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,
    cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,
    cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [12:0] _cs_decoder_decoded_T_30 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_lo_15}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_31 = &_cs_decoder_decoded_T_30; // @[pla.scala 98:74]
  wire [6:0] cs_decoder_decoded_lo_16 = {cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_13,
    cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [14:0] _cs_decoder_decoded_T_32 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_4_7,cs_decoder_decoded_andMatrixInput_5_13,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_lo_16}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_33 = &_cs_decoder_decoded_T_32; // @[pla.scala 98:74]
  wire [6:0] cs_decoder_decoded_lo_17 = {cs_decoder_decoded_andMatrixInput_9_3,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_13,
    cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [13:0] _cs_decoder_decoded_T_34 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_lo_17}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_35 = &_cs_decoder_decoded_T_34; // @[pla.scala 98:74]
  wire [7:0] cs_decoder_decoded_lo_18 = {cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_9_3,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,
    cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] _cs_decoder_decoded_T_36 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_lo_18}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_37 = &_cs_decoder_decoded_T_36; // @[pla.scala 98:74]
  wire [14:0] _cs_decoder_decoded_T_38 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_4_7,cs_decoder_decoded_andMatrixInput_5_13,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_6_3,
    cs_decoder_decoded_lo_17}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_39 = &_cs_decoder_decoded_T_38; // @[pla.scala 98:74]
  wire [7:0] cs_decoder_decoded_lo_20 = {cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_9_3,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,
    cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] _cs_decoder_decoded_T_40 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_lo_20}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_41 = &_cs_decoder_decoded_T_40; // @[pla.scala 98:74]
  wire [6:0] _cs_decoder_decoded_T_42 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_43 = &_cs_decoder_decoded_T_42; // @[pla.scala 98:74]
  wire [7:0] cs_decoder_decoded_lo_22 = {cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_6_3,
    cs_decoder_decoded_andMatrixInput_9_3,cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,
    cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] _cs_decoder_decoded_T_44 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_lo_22}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_45 = &_cs_decoder_decoded_T_44; // @[pla.scala 98:74]
  wire [7:0] cs_decoder_decoded_lo_23 = {cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_6_3,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,
    cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] _cs_decoder_decoded_T_46 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_lo_23}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_47 = &_cs_decoder_decoded_T_46; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_4_24 = io_enq_uop_inst[6]; // @[pla.scala 90:45]
  wire [4:0] _cs_decoder_decoded_T_48 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_4_1,cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_49 = &_cs_decoder_decoded_T_48; // @[pla.scala 98:74]
  wire [5:0] _cs_decoder_decoded_T_50 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_4_1,cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,
    cs_decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_51 = &_cs_decoder_decoded_T_50; // @[pla.scala 98:74]
  wire [7:0] _cs_decoder_decoded_T_52 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_53 = &_cs_decoder_decoded_T_52; // @[pla.scala 98:74]
  wire [6:0] _cs_decoder_decoded_T_54 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_4_1,cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,
    cs_decoder_decoded_andMatrixInput_9_3,cs_decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_55 = &_cs_decoder_decoded_T_54; // @[pla.scala 98:74]
  wire [7:0] _cs_decoder_decoded_T_56 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,cs_decoder_decoded_andMatrixInput_4,
    cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_9_3,cs_decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_57 = &_cs_decoder_decoded_T_56; // @[pla.scala 98:74]
  wire [6:0] _cs_decoder_decoded_T_58 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_4_1,cs_decoder_decoded_andMatrixInput_4,
    cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_59 = &_cs_decoder_decoded_T_58; // @[pla.scala 98:74]
  wire [7:0] _cs_decoder_decoded_T_60 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_4_1,cs_decoder_decoded_andMatrixInput_4,
    cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_9_3,cs_decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_61 = &_cs_decoder_decoded_T_60; // @[pla.scala 98:74]
  wire [7:0] _cs_decoder_decoded_T_62 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_63 = &_cs_decoder_decoded_T_62; // @[pla.scala 98:74]
  wire [7:0] _cs_decoder_decoded_T_64 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_65 = &_cs_decoder_decoded_T_64; // @[pla.scala 98:74]
  wire [4:0] cs_decoder_decoded_lo_33 = {cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [10:0] _cs_decoder_decoded_T_66 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_lo_33}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_67 = &_cs_decoder_decoded_T_66; // @[pla.scala 98:74]
  wire [5:0] cs_decoder_decoded_lo_34 = {cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_9_3,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,
    cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [11:0] _cs_decoder_decoded_T_68 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_lo_34}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_69 = &_cs_decoder_decoded_T_68; // @[pla.scala 98:74]
  wire [5:0] cs_decoder_decoded_lo_35 = {cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,
    cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [11:0] _cs_decoder_decoded_T_70 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_lo_35}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_71 = &_cs_decoder_decoded_T_70; // @[pla.scala 98:74]
  wire [5:0] cs_decoder_decoded_lo_36 = {cs_decoder_decoded_andMatrixInput_9_3,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,
    cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [12:0] _cs_decoder_decoded_T_72 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_lo_36}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_73 = &_cs_decoder_decoded_T_72; // @[pla.scala 98:74]
  wire [5:0] cs_decoder_decoded_lo_37 = {cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,
    cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [11:0] _cs_decoder_decoded_T_74 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_lo_37}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_75 = &_cs_decoder_decoded_T_74; // @[pla.scala 98:74]
  wire [12:0] _cs_decoder_decoded_T_76 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_lo_15}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_77 = &_cs_decoder_decoded_T_76; // @[pla.scala 98:74]
  wire [13:0] _cs_decoder_decoded_T_78 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_lo_17}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_79 = &_cs_decoder_decoded_T_78; // @[pla.scala 98:74]
  wire [7:0] _cs_decoder_decoded_T_80 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_1}
    ; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_81 = &_cs_decoder_decoded_T_80; // @[pla.scala 98:74]
  wire [8:0] _cs_decoder_decoded_T_82 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,cs_decoder_decoded_andMatrixInput_5_13,
    cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_6,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_83 = &_cs_decoder_decoded_T_82; // @[pla.scala 98:74]
  wire [9:0] _cs_decoder_decoded_T_84 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_85 = &_cs_decoder_decoded_T_84; // @[pla.scala 98:74]
  wire [6:0] _cs_decoder_decoded_T_86 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_87 = &_cs_decoder_decoded_T_86; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_4_44 = cs_decoder_decoded_invInputs[7]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_5_43 = cs_decoder_decoded_invInputs[8]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_6_41 = cs_decoder_decoded_invInputs[9]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_7_34 = cs_decoder_decoded_invInputs[10]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_8_23 = cs_decoder_decoded_invInputs[11]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_12_12 = cs_decoder_decoded_invInputs[15]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_13_9 = cs_decoder_decoded_invInputs[16]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_14_7 = cs_decoder_decoded_invInputs[17]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_15_4 = cs_decoder_decoded_invInputs[18]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_16 = cs_decoder_decoded_invInputs[19]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_17 = cs_decoder_decoded_invInputs[21]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_18 = cs_decoder_decoded_invInputs[22]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_19 = cs_decoder_decoded_invInputs[23]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_20 = cs_decoder_decoded_invInputs[24]; // @[pla.scala 91:29]
  wire [13:0] cs_decoder_decoded_lo_44 = {cs_decoder_decoded_andMatrixInput_14_7,cs_decoder_decoded_andMatrixInput_15_4,
    cs_decoder_decoded_andMatrixInput_16,cs_decoder_decoded_andMatrixInput_17,cs_decoder_decoded_andMatrixInput_18,
    cs_decoder_decoded_andMatrixInput_19,cs_decoder_decoded_andMatrixInput_20,cs_decoder_decoded_lo_17}; // @[Cat.scala 31:58]
  wire [6:0] cs_decoder_decoded_hi_lo_41 = {cs_decoder_decoded_andMatrixInput_7_34,
    cs_decoder_decoded_andMatrixInput_8_23,cs_decoder_decoded_andMatrixInput_6,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_12_12,cs_decoder_decoded_andMatrixInput_13_9
    }; // @[Cat.scala 31:58]
  wire [27:0] _cs_decoder_decoded_T_88 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_4_44
    ,cs_decoder_decoded_andMatrixInput_5_43,cs_decoder_decoded_andMatrixInput_6_41,cs_decoder_decoded_hi_lo_41,
    cs_decoder_decoded_lo_44}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_89 = &_cs_decoder_decoded_T_88; // @[pla.scala 98:74]
  wire [14:0] cs_decoder_decoded_lo_45 = {cs_decoder_decoded_andMatrixInput_13_9,cs_decoder_decoded_andMatrixInput_14_7,
    cs_decoder_decoded_andMatrixInput_15_4,cs_decoder_decoded_andMatrixInput_16,cs_decoder_decoded_andMatrixInput_17,
    cs_decoder_decoded_andMatrixInput_18,cs_decoder_decoded_andMatrixInput_19,cs_decoder_decoded_andMatrixInput_20,
    cs_decoder_decoded_lo_17}; // @[Cat.scala 31:58]
  wire [7:0] cs_decoder_decoded_hi_lo_42 = {cs_decoder_decoded_andMatrixInput_5_43,
    cs_decoder_decoded_andMatrixInput_6_41,cs_decoder_decoded_andMatrixInput_7_34,cs_decoder_decoded_andMatrixInput_8_23
    ,cs_decoder_decoded_andMatrixInput_6,cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_6_3,
    cs_decoder_decoded_andMatrixInput_12_12}; // @[Cat.scala 31:58]
  wire [30:0] _cs_decoder_decoded_T_90 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_4_44
    ,cs_decoder_decoded_hi_lo_42,cs_decoder_decoded_lo_45}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_91 = &_cs_decoder_decoded_T_90; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_7_36 = io_enq_uop_inst[12]; // @[pla.scala 90:45]
  wire [9:0] _cs_decoder_decoded_T_92 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,
    cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_93 = &_cs_decoder_decoded_T_92; // @[pla.scala 98:74]
  wire [6:0] cs_decoder_decoded_lo_47 = {cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_13,
    cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [13:0] _cs_decoder_decoded_T_94 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,cs_decoder_decoded_lo_47}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_95 = &_cs_decoder_decoded_T_94; // @[pla.scala 98:74]
  wire [14:0] _cs_decoder_decoded_T_96 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,
    cs_decoder_decoded_lo_47}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_97 = &_cs_decoder_decoded_T_96; // @[pla.scala 98:74]
  wire [15:0] _cs_decoder_decoded_T_98 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,
    cs_decoder_decoded_lo_23}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_99 = &_cs_decoder_decoded_T_98; // @[pla.scala 98:74]
  wire [14:0] _cs_decoder_decoded_T_100 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_lo_17}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_101 = &_cs_decoder_decoded_T_100; // @[pla.scala 98:74]
  wire [15:0] _cs_decoder_decoded_T_102 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,
    cs_decoder_decoded_lo_18}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_103 = &_cs_decoder_decoded_T_102; // @[pla.scala 98:74]
  wire [15:0] _cs_decoder_decoded_T_104 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_lo_20}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_105 = &_cs_decoder_decoded_T_104; // @[pla.scala 98:74]
  wire [14:0] _cs_decoder_decoded_T_106 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,
    cs_decoder_decoded_lo_17}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_107 = &_cs_decoder_decoded_T_106; // @[pla.scala 98:74]
  wire [15:0] _cs_decoder_decoded_T_108 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,
    cs_decoder_decoded_lo_18}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_109 = &_cs_decoder_decoded_T_108; // @[pla.scala 98:74]
  wire [7:0] _cs_decoder_decoded_T_110 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_5_13,
    cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_36,cs_decoder_decoded_andMatrixInput_7_1}
    ; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_111 = &_cs_decoder_decoded_T_110; // @[pla.scala 98:74]
  wire [8:0] _cs_decoder_decoded_T_112 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_5_13,
    cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_36,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_113 = &_cs_decoder_decoded_T_112; // @[pla.scala 98:74]
  wire [9:0] _cs_decoder_decoded_T_114 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_36
    ,cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_115 = &_cs_decoder_decoded_T_114; // @[pla.scala 98:74]
  wire [7:0] _cs_decoder_decoded_T_116 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_36
    }; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_117 = &_cs_decoder_decoded_T_116; // @[pla.scala 98:74]
  wire [9:0] _cs_decoder_decoded_T_118 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_36
    ,cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_119 = &_cs_decoder_decoded_T_118; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_7_50 = io_enq_uop_inst[13]; // @[pla.scala 90:45]
  wire [7:0] _cs_decoder_decoded_T_120 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,cs_decoder_decoded_andMatrixInput_7_50}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_121 = &_cs_decoder_decoded_T_120; // @[pla.scala 98:74]
  wire [6:0] _cs_decoder_decoded_T_122 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,cs_decoder_decoded_andMatrixInput_5,
    cs_decoder_decoded_andMatrixInput_7_50,cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_123 = &_cs_decoder_decoded_T_122; // @[pla.scala 98:74]
  wire [7:0] _cs_decoder_decoded_T_124 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,cs_decoder_decoded_andMatrixInput_4,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_50,cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_125 = &_cs_decoder_decoded_T_124; // @[pla.scala 98:74]
  wire [7:0] _cs_decoder_decoded_T_126 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_50,cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_127 = &_cs_decoder_decoded_T_126; // @[pla.scala 98:74]
  wire [8:0] _cs_decoder_decoded_T_128 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_50,
    cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_129 = &_cs_decoder_decoded_T_128; // @[pla.scala 98:74]
  wire [8:0] _cs_decoder_decoded_T_130 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,cs_decoder_decoded_andMatrixInput_7_50,
    cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_131 = &_cs_decoder_decoded_T_130; // @[pla.scala 98:74]
  wire [7:0] _cs_decoder_decoded_T_132 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_50}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_133 = &_cs_decoder_decoded_T_132; // @[pla.scala 98:74]
  wire [8:0] _cs_decoder_decoded_T_134 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_50,
    cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_135 = &_cs_decoder_decoded_T_134; // @[pla.scala 98:74]
  wire [7:0] _cs_decoder_decoded_T_136 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,cs_decoder_decoded_andMatrixInput_5_13,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_50,cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_137 = &_cs_decoder_decoded_T_136; // @[pla.scala 98:74]
  wire [8:0] _cs_decoder_decoded_T_138 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_50,
    cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_139 = &_cs_decoder_decoded_T_138; // @[pla.scala 98:74]
  wire [4:0] cs_decoder_decoded_lo_70 = {cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_50,
    cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12}; // @[Cat.scala 31:58]
  wire [10:0] _cs_decoder_decoded_T_140 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_lo_70}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_141 = &_cs_decoder_decoded_T_140; // @[pla.scala 98:74]
  wire [6:0] cs_decoder_decoded_lo_71 = {cs_decoder_decoded_andMatrixInput_7_50,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_13,
    cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [13:0] _cs_decoder_decoded_T_142 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_lo_71}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_143 = &_cs_decoder_decoded_T_142; // @[pla.scala 98:74]
  wire [7:0] cs_decoder_decoded_lo_72 = {cs_decoder_decoded_andMatrixInput_7_50,cs_decoder_decoded_andMatrixInput_6_3,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,
    cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] _cs_decoder_decoded_T_144 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_lo_72}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_145 = &_cs_decoder_decoded_T_144; // @[pla.scala 98:74]
  wire [7:0] _cs_decoder_decoded_T_146 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_50
    }; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_147 = &_cs_decoder_decoded_T_146; // @[pla.scala 98:74]
  wire [8:0] _cs_decoder_decoded_T_148 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_andMatrixInput_7_50}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_149 = &_cs_decoder_decoded_T_148; // @[pla.scala 98:74]
  wire [9:0] _cs_decoder_decoded_T_150 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_andMatrixInput_7_50,cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_151 = &_cs_decoder_decoded_T_150; // @[pla.scala 98:74]
  wire [8:0] _cs_decoder_decoded_T_152 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,
    cs_decoder_decoded_andMatrixInput_7_50}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_153 = &_cs_decoder_decoded_T_152; // @[pla.scala 98:74]
  wire [8:0] _cs_decoder_decoded_T_154 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_36
    ,cs_decoder_decoded_andMatrixInput_7_50}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_155 = &_cs_decoder_decoded_T_154; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_9_37 = io_enq_uop_inst[14]; // @[pla.scala 90:45]
  wire [9:0] _cs_decoder_decoded_T_156 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_9_37}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_157 = &_cs_decoder_decoded_T_156; // @[pla.scala 98:74]
  wire [6:0] cs_decoder_decoded_lo_79 = {cs_decoder_decoded_andMatrixInput_9_37,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_13,
    cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [13:0] _cs_decoder_decoded_T_158 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_lo_79}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_159 = &_cs_decoder_decoded_T_158; // @[pla.scala 98:74]
  wire [7:0] cs_decoder_decoded_lo_80 = {cs_decoder_decoded_andMatrixInput_9_37,cs_decoder_decoded_andMatrixInput_9_3,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,
    cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] _cs_decoder_decoded_T_160 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_lo_80}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_161 = &_cs_decoder_decoded_T_160; // @[pla.scala 98:74]
  wire [7:0] _cs_decoder_decoded_T_162 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_9_37
    }; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_163 = &_cs_decoder_decoded_T_162; // @[pla.scala 98:74]
  wire [8:0] _cs_decoder_decoded_T_164 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_andMatrixInput_9_37}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_165 = &_cs_decoder_decoded_T_164; // @[pla.scala 98:74]
  wire [6:0] cs_decoder_decoded_lo_83 = {cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_9_37,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,
    cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [14:0] _cs_decoder_decoded_T_166 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,
    cs_decoder_decoded_lo_83}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_167 = &_cs_decoder_decoded_T_166; // @[pla.scala 98:74]
  wire [6:0] cs_decoder_decoded_lo_84 = {cs_decoder_decoded_andMatrixInput_9_37,cs_decoder_decoded_andMatrixInput_9_3,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,
    cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [14:0] _cs_decoder_decoded_T_168 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_lo_84}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_169 = &_cs_decoder_decoded_T_168; // @[pla.scala 98:74]
  wire [7:0] cs_decoder_decoded_lo_85 = {cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_9_37,
    cs_decoder_decoded_andMatrixInput_9_3,cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,
    cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] _cs_decoder_decoded_T_170 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,
    cs_decoder_decoded_lo_85}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_171 = &_cs_decoder_decoded_T_170; // @[pla.scala 98:74]
  wire [14:0] _cs_decoder_decoded_T_172 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_4_7,cs_decoder_decoded_andMatrixInput_5_13,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_lo_84}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_173 = &_cs_decoder_decoded_T_172; // @[pla.scala 98:74]
  wire [15:0] _cs_decoder_decoded_T_174 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,
    cs_decoder_decoded_lo_85}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_175 = &_cs_decoder_decoded_T_174; // @[pla.scala 98:74]
  wire [14:0] _cs_decoder_decoded_T_176 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_4_7,cs_decoder_decoded_andMatrixInput_5_13,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_lo_79}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_177 = &_cs_decoder_decoded_T_176; // @[pla.scala 98:74]
  wire [15:0] _cs_decoder_decoded_T_178 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,
    cs_decoder_decoded_lo_80}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_179 = &_cs_decoder_decoded_T_178; // @[pla.scala 98:74]
  wire [15:0] _cs_decoder_decoded_T_180 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,
    cs_decoder_decoded_lo_85}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_181 = &_cs_decoder_decoded_T_180; // @[pla.scala 98:74]
  wire [8:0] _cs_decoder_decoded_T_182 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_36
    ,cs_decoder_decoded_andMatrixInput_9_37}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_183 = &_cs_decoder_decoded_T_182; // @[pla.scala 98:74]
  wire [8:0] _cs_decoder_decoded_T_184 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_36
    ,cs_decoder_decoded_andMatrixInput_9_37}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_185 = &_cs_decoder_decoded_T_184; // @[pla.scala 98:74]
  wire [8:0] _cs_decoder_decoded_T_186 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_50,
    cs_decoder_decoded_andMatrixInput_9_37}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_187 = &_cs_decoder_decoded_T_186; // @[pla.scala 98:74]
  wire [8:0] _cs_decoder_decoded_T_188 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_50
    ,cs_decoder_decoded_andMatrixInput_9_37}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_189 = &_cs_decoder_decoded_T_188; // @[pla.scala 98:74]
  wire [8:0] _cs_decoder_decoded_T_190 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_50
    ,cs_decoder_decoded_andMatrixInput_9_37}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_191 = &_cs_decoder_decoded_T_190; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_7_85 = io_enq_uop_inst[25]; // @[pla.scala 90:45]
  wire [6:0] cs_decoder_decoded_lo_96 = {cs_decoder_decoded_andMatrixInput_7_85,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_13,
    cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [13:0] _cs_decoder_decoded_T_192 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_lo_96}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_193 = &_cs_decoder_decoded_T_192; // @[pla.scala 98:74]
  wire [14:0] _cs_decoder_decoded_T_194 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_4_7,cs_decoder_decoded_andMatrixInput_5_13,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_lo_96}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_195 = &_cs_decoder_decoded_T_194; // @[pla.scala 98:74]
  wire [14:0] _cs_decoder_decoded_T_196 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6_3,
    cs_decoder_decoded_lo_96}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_197 = &_cs_decoder_decoded_T_196; // @[pla.scala 98:74]
  wire [7:0] cs_decoder_decoded_lo_99 = {cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_7_85,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,
    cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] _cs_decoder_decoded_T_198 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_4_7,cs_decoder_decoded_andMatrixInput_5_13,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_lo_99}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_199 = &_cs_decoder_decoded_T_198; // @[pla.scala 98:74]
  wire [6:0] _cs_decoder_decoded_T_200 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_4_1,cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,
    cs_decoder_decoded_andMatrixInput_7_85,cs_decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_201 = &_cs_decoder_decoded_T_200; // @[pla.scala 98:74]
  wire [8:0] _cs_decoder_decoded_T_202 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_85,
    cs_decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_203 = &_cs_decoder_decoded_T_202; // @[pla.scala 98:74]
  wire [5:0] cs_decoder_decoded_lo_102 = {cs_decoder_decoded_andMatrixInput_7_85,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,
    cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [12:0] _cs_decoder_decoded_T_204 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_lo_102}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_205 = &_cs_decoder_decoded_T_204; // @[pla.scala 98:74]
  wire [16:0] _cs_decoder_decoded_T_206 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,
    cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_lo_99}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_207 = &_cs_decoder_decoded_T_206; // @[pla.scala 98:74]
  wire [15:0] _cs_decoder_decoded_T_208 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_50,
    cs_decoder_decoded_lo_99}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_209 = &_cs_decoder_decoded_T_208; // @[pla.scala 98:74]
  wire [7:0] cs_decoder_decoded_lo_105 = {cs_decoder_decoded_andMatrixInput_7_50,cs_decoder_decoded_andMatrixInput_7_85,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,
    cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] _cs_decoder_decoded_T_210 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,
    cs_decoder_decoded_lo_105}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_211 = &_cs_decoder_decoded_T_210; // @[pla.scala 98:74]
  wire [13:0] _cs_decoder_decoded_T_212 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_4_7,cs_decoder_decoded_andMatrixInput_5_13,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_9_37,cs_decoder_decoded_lo_96}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_213 = &_cs_decoder_decoded_T_212; // @[pla.scala 98:74]
  wire [14:0] _cs_decoder_decoded_T_214 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_9_37,
    cs_decoder_decoded_lo_96}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_215 = &_cs_decoder_decoded_T_214; // @[pla.scala 98:74]
  wire [14:0] _cs_decoder_decoded_T_216 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_4_7,cs_decoder_decoded_andMatrixInput_5_13,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,cs_decoder_decoded_andMatrixInput_9_37,
    cs_decoder_decoded_lo_96}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_217 = &_cs_decoder_decoded_T_216; // @[pla.scala 98:74]
  wire [14:0] _cs_decoder_decoded_T_218 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_4_7,cs_decoder_decoded_andMatrixInput_5_13,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_9_37,
    cs_decoder_decoded_lo_96}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_219 = &_cs_decoder_decoded_T_218; // @[pla.scala 98:74]
  wire [7:0] cs_decoder_decoded_lo_110 = {cs_decoder_decoded_andMatrixInput_9_37,cs_decoder_decoded_andMatrixInput_7_85,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,
    cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] _cs_decoder_decoded_T_220 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_lo_110}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_221 = &_cs_decoder_decoded_T_220; // @[pla.scala 98:74]
  wire [15:0] _cs_decoder_decoded_T_222 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_lo_110}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_223 = &_cs_decoder_decoded_T_222; // @[pla.scala 98:74]
  wire [15:0] _cs_decoder_decoded_T_224 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_4_7,cs_decoder_decoded_andMatrixInput_5_13,
    cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,cs_decoder_decoded_andMatrixInput_7_50,
    cs_decoder_decoded_lo_110}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_225 = &_cs_decoder_decoded_T_224; // @[pla.scala 98:74]
  wire [16:0] _cs_decoder_decoded_T_226 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_36,
    cs_decoder_decoded_andMatrixInput_7_50,cs_decoder_decoded_lo_110}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_227 = &_cs_decoder_decoded_T_226; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_8_82 = io_enq_uop_inst[27]; // @[pla.scala 90:45]
  wire [5:0] cs_decoder_decoded_lo_114 = {cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_8_82,
    cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,
    cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [12:0] _cs_decoder_decoded_T_228 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_lo_114}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_229 = &_cs_decoder_decoded_T_228; // @[pla.scala 98:74]
  wire [5:0] cs_decoder_decoded_lo_115 = {cs_decoder_decoded_andMatrixInput_7_50,cs_decoder_decoded_andMatrixInput_6_3,
    cs_decoder_decoded_andMatrixInput_8_82,cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,
    cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [12:0] _cs_decoder_decoded_T_230 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_lo_115}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_231 = &_cs_decoder_decoded_T_230; // @[pla.scala 98:74]
  wire [5:0] cs_decoder_decoded_lo_116 = {cs_decoder_decoded_andMatrixInput_7_85,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_8_82,cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,
    cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [12:0] _cs_decoder_decoded_T_232 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_lo_116}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_233 = &_cs_decoder_decoded_T_232; // @[pla.scala 98:74]
  wire [6:0] cs_decoder_decoded_lo_117 = {cs_decoder_decoded_andMatrixInput_7_85,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_8_82,cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_13,
    cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [13:0] _cs_decoder_decoded_T_234 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_lo_117}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_235 = &_cs_decoder_decoded_T_234; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_7_106 = cs_decoder_decoded_invInputs[20]; // @[pla.scala 91:29]
  wire  cs_decoder_decoded_andMatrixInput_13_47 = io_enq_uop_inst[28]; // @[pla.scala 90:45]
  wire [7:0] cs_decoder_decoded_lo_118 = {cs_decoder_decoded_andMatrixInput_18,cs_decoder_decoded_andMatrixInput_19,
    cs_decoder_decoded_andMatrixInput_20,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_13_47,
    cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [16:0] _cs_decoder_decoded_T_236 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_106,
    cs_decoder_decoded_andMatrixInput_17,cs_decoder_decoded_lo_118}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_237 = &_cs_decoder_decoded_T_236; // @[pla.scala 98:74]
  wire [5:0] cs_decoder_decoded_lo_119 = {cs_decoder_decoded_andMatrixInput_9_3,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_13_47,cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,
    cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [12:0] _cs_decoder_decoded_T_238 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_lo_119}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_239 = &_cs_decoder_decoded_T_238; // @[pla.scala 98:74]
  wire [5:0] cs_decoder_decoded_lo_120 = {cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,
    cs_decoder_decoded_andMatrixInput_13_47,cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,
    cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [12:0] _cs_decoder_decoded_T_240 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_lo_120}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_241 = &_cs_decoder_decoded_T_240; // @[pla.scala 98:74]
  wire [9:0] cs_decoder_decoded_hi_121 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_50,
    cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_7_106}; // @[Cat.scala 31:58]
  wire [18:0] _cs_decoder_decoded_T_242 = {cs_decoder_decoded_hi_121,cs_decoder_decoded_andMatrixInput_17,
    cs_decoder_decoded_andMatrixInput_18,cs_decoder_decoded_andMatrixInput_19,cs_decoder_decoded_andMatrixInput_20,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_13_47,cs_decoder_decoded_andMatrixInput_13,
    cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_243 = &_cs_decoder_decoded_T_242; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_18_3 = io_enq_uop_inst[21]; // @[pla.scala 90:45]
  wire [6:0] cs_decoder_decoded_lo_lo_110 = {cs_decoder_decoded_andMatrixInput_20,cs_decoder_decoded_andMatrixInput_9_3,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_13_47,
    cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [13:0] cs_decoder_decoded_lo_122 = {cs_decoder_decoded_andMatrixInput_14_7,cs_decoder_decoded_andMatrixInput_15_4
    ,cs_decoder_decoded_andMatrixInput_16,cs_decoder_decoded_andMatrixInput_7_106,cs_decoder_decoded_andMatrixInput_18_3
    ,cs_decoder_decoded_andMatrixInput_18,cs_decoder_decoded_andMatrixInput_19,cs_decoder_decoded_lo_lo_110}; // @[Cat.scala 31:58]
  wire [27:0] _cs_decoder_decoded_T_244 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_4_44
    ,cs_decoder_decoded_andMatrixInput_5_43,cs_decoder_decoded_andMatrixInput_6_41,cs_decoder_decoded_hi_lo_41,
    cs_decoder_decoded_lo_122}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_245 = &_cs_decoder_decoded_T_244; // @[pla.scala 98:74]
  wire [14:0] cs_decoder_decoded_lo_123 = {cs_decoder_decoded_andMatrixInput_13_9,cs_decoder_decoded_andMatrixInput_14_7
    ,cs_decoder_decoded_andMatrixInput_15_4,cs_decoder_decoded_andMatrixInput_16,cs_decoder_decoded_andMatrixInput_7_106
    ,cs_decoder_decoded_andMatrixInput_18_3,cs_decoder_decoded_andMatrixInput_18,cs_decoder_decoded_andMatrixInput_19,
    cs_decoder_decoded_lo_lo_110}; // @[Cat.scala 31:58]
  wire [30:0] _cs_decoder_decoded_T_246 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_4_44
    ,cs_decoder_decoded_hi_lo_42,cs_decoder_decoded_lo_123}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_247 = &_cs_decoder_decoded_T_246; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_16_8 = io_enq_uop_inst[20]; // @[pla.scala 90:45]
  wire  cs_decoder_decoded_andMatrixInput_18_5 = io_enq_uop_inst[22]; // @[pla.scala 90:45]
  wire [6:0] cs_decoder_decoded_lo_lo_112 = {cs_decoder_decoded_andMatrixInput_9_3,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_13_47,cs_decoder_decoded_andMatrixInput_13,
    cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [13:0] cs_decoder_decoded_lo_124 = {cs_decoder_decoded_andMatrixInput_15_4,cs_decoder_decoded_andMatrixInput_16,
    cs_decoder_decoded_andMatrixInput_16_8,cs_decoder_decoded_andMatrixInput_17,cs_decoder_decoded_andMatrixInput_18_5,
    cs_decoder_decoded_andMatrixInput_19,cs_decoder_decoded_andMatrixInput_20,cs_decoder_decoded_lo_lo_112}; // @[Cat.scala 31:58]
  wire [6:0] cs_decoder_decoded_hi_lo_121 = {cs_decoder_decoded_andMatrixInput_8_23,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_12_12,
    cs_decoder_decoded_andMatrixInput_13_9,cs_decoder_decoded_andMatrixInput_14_7}; // @[Cat.scala 31:58]
  wire [27:0] _cs_decoder_decoded_T_248 = {cs_decoder_decoded_andMatrixInput_4_7,cs_decoder_decoded_andMatrixInput_5_13,
    cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_4_44,cs_decoder_decoded_andMatrixInput_5_43
    ,cs_decoder_decoded_andMatrixInput_6_41,cs_decoder_decoded_andMatrixInput_7_34,cs_decoder_decoded_hi_lo_121,
    cs_decoder_decoded_lo_124}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_249 = &_cs_decoder_decoded_T_248; // @[pla.scala 98:74]
  wire [7:0] cs_decoder_decoded_lo_lo_113 = {cs_decoder_decoded_andMatrixInput_20,cs_decoder_decoded_andMatrixInput_9_3,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_13_47,
    cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] cs_decoder_decoded_lo_125 = {cs_decoder_decoded_andMatrixInput_13_9,cs_decoder_decoded_andMatrixInput_14_7
    ,cs_decoder_decoded_andMatrixInput_15_4,cs_decoder_decoded_andMatrixInput_16,cs_decoder_decoded_andMatrixInput_16_8,
    cs_decoder_decoded_andMatrixInput_17,cs_decoder_decoded_andMatrixInput_18_5,cs_decoder_decoded_andMatrixInput_19,
    cs_decoder_decoded_lo_lo_113}; // @[Cat.scala 31:58]
  wire [31:0] _cs_decoder_decoded_T_250 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_4_44
    ,cs_decoder_decoded_hi_lo_42,cs_decoder_decoded_lo_125}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_251 = &_cs_decoder_decoded_T_250; // @[pla.scala 98:74]
  wire [5:0] cs_decoder_decoded_lo_126 = {cs_decoder_decoded_andMatrixInput_7_85,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_13_47,cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,
    cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [12:0] _cs_decoder_decoded_T_252 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_lo_126}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_253 = &_cs_decoder_decoded_T_252; // @[pla.scala 98:74]
  wire [7:0] cs_decoder_decoded_lo_127 = {cs_decoder_decoded_andMatrixInput_6_41,cs_decoder_decoded_andMatrixInput_7_85,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_13_47,
    cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [16:0] _cs_decoder_decoded_T_254 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_4_44
    ,cs_decoder_decoded_andMatrixInput_5_43,cs_decoder_decoded_lo_127}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_255 = &_cs_decoder_decoded_T_254; // @[pla.scala 98:74]
  wire [9:0] cs_decoder_decoded_hi_128 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_4_44
    ,cs_decoder_decoded_andMatrixInput_5_43,cs_decoder_decoded_andMatrixInput_6_41}; // @[Cat.scala 31:58]
  wire [18:0] _cs_decoder_decoded_T_256 = {cs_decoder_decoded_hi_128,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_7_85,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_13_47,cs_decoder_decoded_andMatrixInput_13,
    cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_257 = &_cs_decoder_decoded_T_256; // @[pla.scala 98:74]
  wire [4:0] cs_decoder_decoded_lo_lo_117 = {cs_decoder_decoded_andMatrixInput_11,
    cs_decoder_decoded_andMatrixInput_13_47,cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,
    cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [9:0] cs_decoder_decoded_lo_129 = {cs_decoder_decoded_andMatrixInput_6,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_7_85,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_13_47,cs_decoder_decoded_andMatrixInput_13,
    cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [19:0] _cs_decoder_decoded_T_258 = {cs_decoder_decoded_hi_128,cs_decoder_decoded_lo_129}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_259 = &_cs_decoder_decoded_T_258; // @[pla.scala 98:74]
  wire [10:0] cs_decoder_decoded_lo_130 = {cs_decoder_decoded_andMatrixInput_8_23,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_7_85,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_lo_lo_117}; // @[Cat.scala 31:58]
  wire [4:0] cs_decoder_decoded_hi_lo_127 = {cs_decoder_decoded_andMatrixInput_4_24,
    cs_decoder_decoded_andMatrixInput_4_44,cs_decoder_decoded_andMatrixInput_5_43,cs_decoder_decoded_andMatrixInput_6_41
    ,cs_decoder_decoded_andMatrixInput_7_34}; // @[Cat.scala 31:58]
  wire [21:0] _cs_decoder_decoded_T_260 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_hi_lo_127,cs_decoder_decoded_lo_130}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_261 = &_cs_decoder_decoded_T_260; // @[pla.scala 98:74]
  wire [5:0] cs_decoder_decoded_lo_131 = {cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_8_82,
    cs_decoder_decoded_andMatrixInput_13_47,cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_11_1,
    cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [12:0] _cs_decoder_decoded_T_262 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_lo_131}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_263 = &_cs_decoder_decoded_T_262; // @[pla.scala 98:74]
  wire [6:0] cs_decoder_decoded_lo_132 = {cs_decoder_decoded_andMatrixInput_7_50,cs_decoder_decoded_andMatrixInput_6_3,
    cs_decoder_decoded_andMatrixInput_8_82,cs_decoder_decoded_andMatrixInput_13_47,cs_decoder_decoded_andMatrixInput_13,
    cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [13:0] _cs_decoder_decoded_T_264 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_lo_132}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_265 = &_cs_decoder_decoded_T_264; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_12_69 = io_enq_uop_inst[29]; // @[pla.scala 90:45]
  wire [6:0] cs_decoder_decoded_lo_133 = {cs_decoder_decoded_andMatrixInput_6,cs_decoder_decoded_andMatrixInput_6_3,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,
    cs_decoder_decoded_andMatrixInput_12_69,cs_decoder_decoded_andMatrixInput_11_1}; // @[Cat.scala 31:58]
  wire [13:0] _cs_decoder_decoded_T_266 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_lo_133}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_267 = &_cs_decoder_decoded_T_266; // @[pla.scala 98:74]
  wire [6:0] cs_decoder_decoded_lo_134 = {cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_6_3,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,
    cs_decoder_decoded_andMatrixInput_12_69,cs_decoder_decoded_andMatrixInput_11_1}; // @[Cat.scala 31:58]
  wire [13:0] _cs_decoder_decoded_T_268 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_lo_134}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_269 = &_cs_decoder_decoded_T_268; // @[pla.scala 98:74]
  wire [6:0] cs_decoder_decoded_lo_135 = {cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_9_3,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,
    cs_decoder_decoded_andMatrixInput_12_69,cs_decoder_decoded_andMatrixInput_11_1}; // @[Cat.scala 31:58]
  wire [14:0] _cs_decoder_decoded_T_270 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_lo_135}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_271 = &_cs_decoder_decoded_T_270; // @[pla.scala 98:74]
  wire [14:0] _cs_decoder_decoded_T_272 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_lo_135}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_273 = &_cs_decoder_decoded_T_272; // @[pla.scala 98:74]
  wire [6:0] cs_decoder_decoded_lo_137 = {cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_6_3,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_12_69,
    cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [13:0] _cs_decoder_decoded_T_274 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_lo_137}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_275 = &_cs_decoder_decoded_T_274; // @[pla.scala 98:74]
  wire [6:0] cs_decoder_decoded_lo_138 = {cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_9_3,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_12_69,
    cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [14:0] _cs_decoder_decoded_T_276 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_lo_138}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_277 = &_cs_decoder_decoded_T_276; // @[pla.scala 98:74]
  wire [6:0] cs_decoder_decoded_lo_139 = {cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_12_69,
    cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [14:0] _cs_decoder_decoded_T_278 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_lo_139}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_279 = &_cs_decoder_decoded_T_278; // @[pla.scala 98:74]
  wire [14:0] _cs_decoder_decoded_T_280 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_lo_139}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_281 = &_cs_decoder_decoded_T_280; // @[pla.scala 98:74]
  wire [5:0] cs_decoder_decoded_lo_141 = {cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_50,
    cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,
    cs_decoder_decoded_andMatrixInput_12_69}; // @[Cat.scala 31:58]
  wire [11:0] _cs_decoder_decoded_T_282 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_lo_141}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_283 = &_cs_decoder_decoded_T_282; // @[pla.scala 98:74]
  wire [6:0] cs_decoder_decoded_lo_142 = {cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_7_85,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,
    cs_decoder_decoded_andMatrixInput_12_69,cs_decoder_decoded_andMatrixInput_11_1}; // @[Cat.scala 31:58]
  wire [14:0] _cs_decoder_decoded_T_284 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_lo_142}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_285 = &_cs_decoder_decoded_T_284; // @[pla.scala 98:74]
  wire [14:0] _cs_decoder_decoded_T_286 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_lo_142}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_287 = &_cs_decoder_decoded_T_286; // @[pla.scala 98:74]
  wire [6:0] cs_decoder_decoded_lo_144 = {cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_7_85,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_12_69,
    cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [14:0] _cs_decoder_decoded_T_288 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_lo_144}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_289 = &_cs_decoder_decoded_T_288; // @[pla.scala 98:74]
  wire [6:0] cs_decoder_decoded_lo_145 = {cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_8_82,cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_12_69,
    cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [14:0] _cs_decoder_decoded_T_290 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_lo_145}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_291 = &_cs_decoder_decoded_T_290; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_15_34 = io_enq_uop_inst[30]; // @[pla.scala 90:45]
  wire [7:0] cs_decoder_decoded_lo_146 = {cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_9_3,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,
    cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_15_34,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [16:0] _cs_decoder_decoded_T_292 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_lo_146}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_293 = &_cs_decoder_decoded_T_292; // @[pla.scala 98:74]
  wire [16:0] _cs_decoder_decoded_T_294 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_lo_146}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_295 = &_cs_decoder_decoded_T_294; // @[pla.scala 98:74]
  wire [5:0] cs_decoder_decoded_lo_148 = {cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_50,
    cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,
    cs_decoder_decoded_andMatrixInput_15_34}; // @[Cat.scala 31:58]
  wire [11:0] _cs_decoder_decoded_T_296 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_lo_148}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_297 = &_cs_decoder_decoded_T_296; // @[pla.scala 98:74]
  wire [8:0] cs_decoder_decoded_lo_149 = {cs_decoder_decoded_andMatrixInput_18,cs_decoder_decoded_andMatrixInput_19,
    cs_decoder_decoded_andMatrixInput_20,cs_decoder_decoded_andMatrixInput_9_3,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_13,
    cs_decoder_decoded_andMatrixInput_15_34}; // @[Cat.scala 31:58]
  wire [17:0] _cs_decoder_decoded_T_298 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_16_8,
    cs_decoder_decoded_andMatrixInput_17,cs_decoder_decoded_lo_149}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_299 = &_cs_decoder_decoded_T_298; // @[pla.scala 98:74]
  wire [9:0] cs_decoder_decoded_hi_150 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_16_8,
    cs_decoder_decoded_andMatrixInput_17,cs_decoder_decoded_andMatrixInput_18}; // @[Cat.scala 31:58]
  wire [18:0] _cs_decoder_decoded_T_300 = {cs_decoder_decoded_hi_150,cs_decoder_decoded_andMatrixInput_19,
    cs_decoder_decoded_andMatrixInput_20,cs_decoder_decoded_andMatrixInput_9_3,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_13,
    cs_decoder_decoded_andMatrixInput_15_34,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_301 = &_cs_decoder_decoded_T_300; // @[pla.scala 98:74]
  wire [8:0] cs_decoder_decoded_lo_151 = {cs_decoder_decoded_andMatrixInput_18,cs_decoder_decoded_andMatrixInput_19,
    cs_decoder_decoded_andMatrixInput_20,cs_decoder_decoded_andMatrixInput_7_85,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_13,
    cs_decoder_decoded_andMatrixInput_15_34}; // @[Cat.scala 31:58]
  wire [17:0] _cs_decoder_decoded_T_302 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_106,
    cs_decoder_decoded_andMatrixInput_17,cs_decoder_decoded_lo_151}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_303 = &_cs_decoder_decoded_T_302; // @[pla.scala 98:74]
  wire [9:0] cs_decoder_decoded_hi_152 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_106,
    cs_decoder_decoded_andMatrixInput_17,cs_decoder_decoded_andMatrixInput_18}; // @[Cat.scala 31:58]
  wire [18:0] _cs_decoder_decoded_T_304 = {cs_decoder_decoded_hi_152,cs_decoder_decoded_andMatrixInput_19,
    cs_decoder_decoded_andMatrixInput_20,cs_decoder_decoded_andMatrixInput_7_85,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_13,
    cs_decoder_decoded_andMatrixInput_15_34,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_305 = &_cs_decoder_decoded_T_304; // @[pla.scala 98:74]
  wire [8:0] cs_decoder_decoded_lo_153 = {cs_decoder_decoded_andMatrixInput_18,cs_decoder_decoded_andMatrixInput_19,
    cs_decoder_decoded_andMatrixInput_20,cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_8_82,
    cs_decoder_decoded_andMatrixInput_13_47,cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_15_34
    ,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [17:0] _cs_decoder_decoded_T_306 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_106,
    cs_decoder_decoded_andMatrixInput_17,cs_decoder_decoded_lo_153}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_307 = &_cs_decoder_decoded_T_306; // @[pla.scala 98:74]
  wire [18:0] _cs_decoder_decoded_T_308 = {cs_decoder_decoded_hi_152,cs_decoder_decoded_andMatrixInput_19,
    cs_decoder_decoded_andMatrixInput_20,cs_decoder_decoded_andMatrixInput_9_3,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_8_82,cs_decoder_decoded_andMatrixInput_13_47,cs_decoder_decoded_andMatrixInput_13,
    cs_decoder_decoded_andMatrixInput_15_34,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_309 = &_cs_decoder_decoded_T_308; // @[pla.scala 98:74]
  wire [18:0] _cs_decoder_decoded_T_310 = {cs_decoder_decoded_hi_152,cs_decoder_decoded_andMatrixInput_19,
    cs_decoder_decoded_andMatrixInput_20,cs_decoder_decoded_andMatrixInput_7_85,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_8_82,cs_decoder_decoded_andMatrixInput_13_47,cs_decoder_decoded_andMatrixInput_13,
    cs_decoder_decoded_andMatrixInput_15_34,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_311 = &_cs_decoder_decoded_T_310; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_20_7 = io_enq_uop_inst[24]; // @[pla.scala 90:45]
  wire [6:0] cs_decoder_decoded_lo_lo_144 = {cs_decoder_decoded_andMatrixInput_7_85,cs_decoder_decoded_andMatrixInput_10
    ,cs_decoder_decoded_andMatrixInput_8_82,cs_decoder_decoded_andMatrixInput_13_47,
    cs_decoder_decoded_andMatrixInput_12_69,cs_decoder_decoded_andMatrixInput_15_34,cs_decoder_decoded_andMatrixInput_14
    }; // @[Cat.scala 31:58]
  wire [13:0] cs_decoder_decoded_lo_156 = {cs_decoder_decoded_andMatrixInput_15_4,cs_decoder_decoded_andMatrixInput_16,
    cs_decoder_decoded_andMatrixInput_7_106,cs_decoder_decoded_andMatrixInput_18_3,cs_decoder_decoded_andMatrixInput_18,
    cs_decoder_decoded_andMatrixInput_19,cs_decoder_decoded_andMatrixInput_20_7,cs_decoder_decoded_lo_lo_144}; // @[Cat.scala 31:58]
  wire [27:0] _cs_decoder_decoded_T_312 = {cs_decoder_decoded_andMatrixInput_4_7,cs_decoder_decoded_andMatrixInput_5_13,
    cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_4_44,cs_decoder_decoded_andMatrixInput_5_43
    ,cs_decoder_decoded_andMatrixInput_6_41,cs_decoder_decoded_andMatrixInput_7_34,cs_decoder_decoded_hi_lo_121,
    cs_decoder_decoded_lo_156}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_313 = &_cs_decoder_decoded_T_312; // @[pla.scala 98:74]
  wire [7:0] cs_decoder_decoded_lo_lo_145 = {cs_decoder_decoded_andMatrixInput_20_7,
    cs_decoder_decoded_andMatrixInput_7_85,cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_8_82,
    cs_decoder_decoded_andMatrixInput_13_47,cs_decoder_decoded_andMatrixInput_12_69,
    cs_decoder_decoded_andMatrixInput_15_34,cs_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] cs_decoder_decoded_lo_157 = {cs_decoder_decoded_andMatrixInput_13_9,cs_decoder_decoded_andMatrixInput_14_7
    ,cs_decoder_decoded_andMatrixInput_15_4,cs_decoder_decoded_andMatrixInput_16,cs_decoder_decoded_andMatrixInput_7_106
    ,cs_decoder_decoded_andMatrixInput_18_3,cs_decoder_decoded_andMatrixInput_18,cs_decoder_decoded_andMatrixInput_19,
    cs_decoder_decoded_lo_lo_145}; // @[Cat.scala 31:58]
  wire [31:0] _cs_decoder_decoded_T_314 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_4_44
    ,cs_decoder_decoded_hi_lo_42,cs_decoder_decoded_lo_157}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_315 = &_cs_decoder_decoded_T_314; // @[pla.scala 98:74]
  wire  cs_decoder_decoded_andMatrixInput_11_97 = io_enq_uop_inst[31]; // @[pla.scala 90:45]
  wire [5:0] cs_decoder_decoded_lo_158 = {cs_decoder_decoded_andMatrixInput_5,cs_decoder_decoded_andMatrixInput_7_50,
    cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,
    cs_decoder_decoded_andMatrixInput_11_97}; // @[Cat.scala 31:58]
  wire [11:0] _cs_decoder_decoded_T_316 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2_5,cs_decoder_decoded_andMatrixInput_3_5,cs_decoder_decoded_andMatrixInput_4_1,
    cs_decoder_decoded_andMatrixInput_5_13,cs_decoder_decoded_lo_158}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_317 = &_cs_decoder_decoded_T_316; // @[pla.scala 98:74]
  wire [6:0] cs_decoder_decoded_lo_159 = {cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_12_69,
    cs_decoder_decoded_andMatrixInput_11_1,cs_decoder_decoded_andMatrixInput_11_97}; // @[Cat.scala 31:58]
  wire [14:0] _cs_decoder_decoded_T_318 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_lo_159}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_319 = &_cs_decoder_decoded_T_318; // @[pla.scala 98:74]
  wire [14:0] _cs_decoder_decoded_T_320 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_lo_159}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_321 = &_cs_decoder_decoded_T_320; // @[pla.scala 98:74]
  wire [7:0] cs_decoder_decoded_lo_161 = {cs_decoder_decoded_andMatrixInput_17,cs_decoder_decoded_andMatrixInput_18,
    cs_decoder_decoded_andMatrixInput_19,cs_decoder_decoded_andMatrixInput_20,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_15_34,cs_decoder_decoded_andMatrixInput_11_97
    }; // @[Cat.scala 31:58]
  wire [15:0] _cs_decoder_decoded_T_322 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_106,
    cs_decoder_decoded_lo_161}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_323 = &_cs_decoder_decoded_T_322; // @[pla.scala 98:74]
  wire [6:0] cs_decoder_decoded_lo_162 = {cs_decoder_decoded_andMatrixInput_19,cs_decoder_decoded_andMatrixInput_20,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_13,
    cs_decoder_decoded_andMatrixInput_15_34,cs_decoder_decoded_andMatrixInput_11_97}; // @[Cat.scala 31:58]
  wire [14:0] _cs_decoder_decoded_T_324 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_18,
    cs_decoder_decoded_lo_162}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_325 = &_cs_decoder_decoded_T_324; // @[pla.scala 98:74]
  wire [7:0] cs_decoder_decoded_lo_163 = {cs_decoder_decoded_andMatrixInput_19,cs_decoder_decoded_andMatrixInput_20,
    cs_decoder_decoded_andMatrixInput_9_3,cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,
    cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_15_34,cs_decoder_decoded_andMatrixInput_11_97
    }; // @[Cat.scala 31:58]
  wire [15:0] _cs_decoder_decoded_T_326 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_18,
    cs_decoder_decoded_lo_163}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_327 = &_cs_decoder_decoded_T_326; // @[pla.scala 98:74]
  wire [7:0] cs_decoder_decoded_lo_164 = {cs_decoder_decoded_andMatrixInput_19,cs_decoder_decoded_andMatrixInput_20,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,
    cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_15_34,cs_decoder_decoded_andMatrixInput_11_97
    }; // @[Cat.scala 31:58]
  wire [15:0] _cs_decoder_decoded_T_328 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_18,
    cs_decoder_decoded_lo_164}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_329 = &_cs_decoder_decoded_T_328; // @[pla.scala 98:74]
  wire [7:0] cs_decoder_decoded_lo_165 = {cs_decoder_decoded_andMatrixInput_19,cs_decoder_decoded_andMatrixInput_20,
    cs_decoder_decoded_andMatrixInput_7_85,cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,
    cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_15_34,cs_decoder_decoded_andMatrixInput_11_97
    }; // @[Cat.scala 31:58]
  wire [15:0] _cs_decoder_decoded_T_330 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_18,
    cs_decoder_decoded_lo_165}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_331 = &_cs_decoder_decoded_T_330; // @[pla.scala 98:74]
  wire [7:0] cs_decoder_decoded_lo_166 = {cs_decoder_decoded_andMatrixInput_19,cs_decoder_decoded_andMatrixInput_20,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_13_47,
    cs_decoder_decoded_andMatrixInput_13,cs_decoder_decoded_andMatrixInput_15_34,cs_decoder_decoded_andMatrixInput_11_97
    }; // @[Cat.scala 31:58]
  wire [15:0] _cs_decoder_decoded_T_332 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_18,
    cs_decoder_decoded_lo_166}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_333 = &_cs_decoder_decoded_T_332; // @[pla.scala 98:74]
  wire [9:0] cs_decoder_decoded_lo_167 = {cs_decoder_decoded_andMatrixInput_7_106,cs_decoder_decoded_andMatrixInput_17,
    cs_decoder_decoded_andMatrixInput_18,cs_decoder_decoded_andMatrixInput_19,cs_decoder_decoded_andMatrixInput_20,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12_69,
    cs_decoder_decoded_andMatrixInput_15_34,cs_decoder_decoded_andMatrixInput_11_97}; // @[Cat.scala 31:58]
  wire [9:0] cs_decoder_decoded_hi_167 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire [19:0] _cs_decoder_decoded_T_334 = {cs_decoder_decoded_hi_167,cs_decoder_decoded_lo_167}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_335 = &_cs_decoder_decoded_T_334; // @[pla.scala 98:74]
  wire [9:0] cs_decoder_decoded_lo_168 = {cs_decoder_decoded_andMatrixInput_17,cs_decoder_decoded_andMatrixInput_18,
    cs_decoder_decoded_andMatrixInput_19,cs_decoder_decoded_andMatrixInput_20,cs_decoder_decoded_andMatrixInput_9_3,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12_69,
    cs_decoder_decoded_andMatrixInput_15_34,cs_decoder_decoded_andMatrixInput_11_97}; // @[Cat.scala 31:58]
  wire [4:0] cs_decoder_decoded_hi_lo_165 = {cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_6,
    cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_7_106}
    ; // @[Cat.scala 31:58]
  wire [20:0] _cs_decoder_decoded_T_336 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_hi_lo_165,cs_decoder_decoded_lo_168}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_337 = &_cs_decoder_decoded_T_336; // @[pla.scala 98:74]
  wire [9:0] cs_decoder_decoded_lo_169 = {cs_decoder_decoded_andMatrixInput_17,cs_decoder_decoded_andMatrixInput_18,
    cs_decoder_decoded_andMatrixInput_19,cs_decoder_decoded_andMatrixInput_20,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_12_69,
    cs_decoder_decoded_andMatrixInput_15_34,cs_decoder_decoded_andMatrixInput_11_97}; // @[Cat.scala 31:58]
  wire [9:0] cs_decoder_decoded_hi_169 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_andMatrixInput_4_24,cs_decoder_decoded_andMatrixInput_7_1,
    cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_7_106}; // @[Cat.scala 31:58]
  wire [19:0] _cs_decoder_decoded_T_338 = {cs_decoder_decoded_hi_169,cs_decoder_decoded_lo_169}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_339 = &_cs_decoder_decoded_T_338; // @[pla.scala 98:74]
  wire [9:0] cs_decoder_decoded_lo_170 = {cs_decoder_decoded_andMatrixInput_18,cs_decoder_decoded_andMatrixInput_19,
    cs_decoder_decoded_andMatrixInput_20,cs_decoder_decoded_andMatrixInput_9_3,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_12_69,
    cs_decoder_decoded_andMatrixInput_15_34,cs_decoder_decoded_andMatrixInput_11_97}; // @[Cat.scala 31:58]
  wire [4:0] cs_decoder_decoded_hi_lo_167 = {cs_decoder_decoded_andMatrixInput_4_24,
    cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_6_3,cs_decoder_decoded_andMatrixInput_7_106,
    cs_decoder_decoded_andMatrixInput_17}; // @[Cat.scala 31:58]
  wire [20:0] _cs_decoder_decoded_T_340 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_hi_lo_167,cs_decoder_decoded_lo_170}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_341 = &_cs_decoder_decoded_T_340; // @[pla.scala 98:74]
  wire [4:0] cs_decoder_decoded_hi_lo_168 = {cs_decoder_decoded_andMatrixInput_4_24,
    cs_decoder_decoded_andMatrixInput_7_36,cs_decoder_decoded_andMatrixInput_7_1,cs_decoder_decoded_andMatrixInput_6_3,
    cs_decoder_decoded_andMatrixInput_7_106}; // @[Cat.scala 31:58]
  wire [20:0] _cs_decoder_decoded_T_342 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_hi_lo_168,cs_decoder_decoded_lo_169}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_343 = &_cs_decoder_decoded_T_342; // @[pla.scala 98:74]
  wire [9:0] cs_decoder_decoded_lo_172 = {cs_decoder_decoded_andMatrixInput_17,cs_decoder_decoded_andMatrixInput_18,
    cs_decoder_decoded_andMatrixInput_19,cs_decoder_decoded_andMatrixInput_20,cs_decoder_decoded_andMatrixInput_7_85,
    cs_decoder_decoded_andMatrixInput_10,cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12_69,
    cs_decoder_decoded_andMatrixInput_15_34,cs_decoder_decoded_andMatrixInput_11_97}; // @[Cat.scala 31:58]
  wire [20:0] _cs_decoder_decoded_T_344 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_hi_lo_165,cs_decoder_decoded_lo_172}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_345 = &_cs_decoder_decoded_T_344; // @[pla.scala 98:74]
  wire [9:0] cs_decoder_decoded_lo_173 = {cs_decoder_decoded_andMatrixInput_18,cs_decoder_decoded_andMatrixInput_19,
    cs_decoder_decoded_andMatrixInput_20,cs_decoder_decoded_andMatrixInput_7_85,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_12,cs_decoder_decoded_andMatrixInput_12_69,
    cs_decoder_decoded_andMatrixInput_15_34,cs_decoder_decoded_andMatrixInput_11_97}; // @[Cat.scala 31:58]
  wire [20:0] _cs_decoder_decoded_T_346 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_hi_lo_167,cs_decoder_decoded_lo_173}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_347 = &_cs_decoder_decoded_T_346; // @[pla.scala 98:74]
  wire [9:0] cs_decoder_decoded_lo_174 = {cs_decoder_decoded_andMatrixInput_17,cs_decoder_decoded_andMatrixInput_18,
    cs_decoder_decoded_andMatrixInput_19,cs_decoder_decoded_andMatrixInput_20,cs_decoder_decoded_andMatrixInput_10,
    cs_decoder_decoded_andMatrixInput_11,cs_decoder_decoded_andMatrixInput_13_47,cs_decoder_decoded_andMatrixInput_12_69
    ,cs_decoder_decoded_andMatrixInput_15_34,cs_decoder_decoded_andMatrixInput_11_97}; // @[Cat.scala 31:58]
  wire [20:0] _cs_decoder_decoded_T_348 = {cs_decoder_decoded_andMatrixInput_0,cs_decoder_decoded_andMatrixInput_1,
    cs_decoder_decoded_andMatrixInput_2,cs_decoder_decoded_andMatrixInput_3,cs_decoder_decoded_andMatrixInput_4_7,
    cs_decoder_decoded_andMatrixInput_4,cs_decoder_decoded_hi_lo_165,cs_decoder_decoded_lo_174}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_T_349 = &_cs_decoder_decoded_T_348; // @[pla.scala 98:74]
  wire  _cs_decoder_decoded_orMatrixOutputs_T = |_cs_decoder_decoded_T_117; // @[pla.scala 114:39]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_1 = |_cs_decoder_decoded_T_147; // @[pla.scala 114:39]
  wire [5:0] _cs_decoder_decoded_orMatrixOutputs_T_2 = {_cs_decoder_decoded_T_89,_cs_decoder_decoded_T_117,
    _cs_decoder_decoded_T_147,_cs_decoder_decoded_T_245,_cs_decoder_decoded_T_249,_cs_decoder_decoded_T_313}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_3 = |_cs_decoder_decoded_orMatrixOutputs_T_2; // @[pla.scala 114:39]
  wire [4:0] cs_decoder_decoded_orMatrixOutputs_lo_1 = {_cs_decoder_decoded_T_237,_cs_decoder_decoded_T_245,
    _cs_decoder_decoded_T_249,_cs_decoder_decoded_T_255,_cs_decoder_decoded_T_313}; // @[Cat.scala 31:58]
  wire [10:0] _cs_decoder_decoded_orMatrixOutputs_T_4 = {_cs_decoder_decoded_T_11,_cs_decoder_decoded_T_89,
    _cs_decoder_decoded_T_117,_cs_decoder_decoded_T_141,_cs_decoder_decoded_T_147,_cs_decoder_decoded_T_231,
    cs_decoder_decoded_orMatrixOutputs_lo_1}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_5 = |_cs_decoder_decoded_orMatrixOutputs_T_4; // @[pla.scala 114:39]
  wire [4:0] cs_decoder_decoded_orMatrixOutputs_lo_2 = {_cs_decoder_decoded_T_243,_cs_decoder_decoded_T_247,
    _cs_decoder_decoded_T_251,_cs_decoder_decoded_T_261,_cs_decoder_decoded_T_315}; // @[Cat.scala 31:58]
  wire [10:0] _cs_decoder_decoded_orMatrixOutputs_T_6 = {_cs_decoder_decoded_T_11,_cs_decoder_decoded_T_91,
    _cs_decoder_decoded_T_117,_cs_decoder_decoded_T_141,_cs_decoder_decoded_T_147,_cs_decoder_decoded_T_231,
    cs_decoder_decoded_orMatrixOutputs_lo_2}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_7 = |_cs_decoder_decoded_orMatrixOutputs_T_6; // @[pla.scala 114:39]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_8 = |_cs_decoder_decoded_T_91; // @[pla.scala 114:39]
  wire [1:0] _cs_decoder_decoded_orMatrixOutputs_T_9 = {_cs_decoder_decoded_T_81,_cs_decoder_decoded_T_163}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_10 = |_cs_decoder_decoded_orMatrixOutputs_T_9; // @[pla.scala 114:39]
  wire [4:0] cs_decoder_decoded_orMatrixOutputs_lo_3 = {_cs_decoder_decoded_T_101,_cs_decoder_decoded_T_133,
    _cs_decoder_decoded_T_167,_cs_decoder_decoded_T_169,_cs_decoder_decoded_T_173}; // @[Cat.scala 31:58]
  wire [10:0] _cs_decoder_decoded_orMatrixOutputs_T_11 = {_cs_decoder_decoded_T_15,_cs_decoder_decoded_T_17,
    _cs_decoder_decoded_T_29,_cs_decoder_decoded_T_35,_cs_decoder_decoded_T_43,_cs_decoder_decoded_T_97,
    cs_decoder_decoded_orMatrixOutputs_lo_3}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_12 = |_cs_decoder_decoded_orMatrixOutputs_T_11; // @[pla.scala 114:39]
  wire [6:0] cs_decoder_decoded_orMatrixOutputs_lo_4 = {_cs_decoder_decoded_T_87,_cs_decoder_decoded_T_97,
    _cs_decoder_decoded_T_101,_cs_decoder_decoded_T_133,_cs_decoder_decoded_T_167,_cs_decoder_decoded_T_169,
    _cs_decoder_decoded_T_173}; // @[Cat.scala 31:58]
  wire [14:0] _cs_decoder_decoded_orMatrixOutputs_T_13 = {_cs_decoder_decoded_T_1,_cs_decoder_decoded_T_5,
    _cs_decoder_decoded_T_9,_cs_decoder_decoded_T_17,_cs_decoder_decoded_T_21,_cs_decoder_decoded_T_29,
    _cs_decoder_decoded_T_35,_cs_decoder_decoded_T_85,cs_decoder_decoded_orMatrixOutputs_lo_4}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_14 = |_cs_decoder_decoded_orMatrixOutputs_T_13; // @[pla.scala 114:39]
  wire [2:0] _cs_decoder_decoded_orMatrixOutputs_T_15 = {_cs_decoder_decoded_T_3,_cs_decoder_decoded_T_5,
    _cs_decoder_decoded_T_9}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_16 = |_cs_decoder_decoded_orMatrixOutputs_T_15; // @[pla.scala 114:39]
  wire [3:0] _cs_decoder_decoded_orMatrixOutputs_T_17 = {_cs_decoder_decoded_T_27,_cs_decoder_decoded_T_137,
    _cs_decoder_decoded_T_265,_cs_decoder_decoded_T_283}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_18 = |_cs_decoder_decoded_orMatrixOutputs_T_17; // @[pla.scala 114:39]
  wire [2:0] _cs_decoder_decoded_orMatrixOutputs_T_19 = {_cs_decoder_decoded_T_237,_cs_decoder_decoded_T_265,
    _cs_decoder_decoded_T_297}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_20 = |_cs_decoder_decoded_orMatrixOutputs_T_19; // @[pla.scala 114:39]
  wire [3:0] _cs_decoder_decoded_orMatrixOutputs_T_21 = {_cs_decoder_decoded_T_231,_cs_decoder_decoded_T_237,
    _cs_decoder_decoded_T_255,_cs_decoder_decoded_T_317}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_22 = |_cs_decoder_decoded_orMatrixOutputs_T_21; // @[pla.scala 114:39]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_23 = |_cs_decoder_decoded_T_141; // @[pla.scala 114:39]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_24 = |_cs_decoder_decoded_T_255; // @[pla.scala 114:39]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_25 = |_cs_decoder_decoded_T_93; // @[pla.scala 114:39]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_26 = |_cs_decoder_decoded_T_13; // @[pla.scala 114:39]
  wire [1:0] _cs_decoder_decoded_orMatrixOutputs_T_27 = {_cs_decoder_decoded_T_141,_cs_decoder_decoded_T_231}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_28 = |_cs_decoder_decoded_orMatrixOutputs_T_27; // @[pla.scala 114:39]
  wire [4:0] _cs_decoder_decoded_orMatrixOutputs_T_29 = {_cs_decoder_decoded_T_13,_cs_decoder_decoded_T_27,
    _cs_decoder_decoded_T_137,_cs_decoder_decoded_T_141,_cs_decoder_decoded_T_231}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_30 = |_cs_decoder_decoded_orMatrixOutputs_T_29; // @[pla.scala 114:39]
  wire [3:0] _cs_decoder_decoded_orMatrixOutputs_T_31 = {_cs_decoder_decoded_T_3,_cs_decoder_decoded_T_5,
    _cs_decoder_decoded_T_125,_cs_decoder_decoded_T_237}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_32 = |_cs_decoder_decoded_orMatrixOutputs_T_31; // @[pla.scala 114:39]
  wire [2:0] _cs_decoder_decoded_orMatrixOutputs_T_33 = {_cs_decoder_decoded_T_21,_cs_decoder_decoded_T_27,
    _cs_decoder_decoded_T_137}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_34 = |_cs_decoder_decoded_orMatrixOutputs_T_33; // @[pla.scala 114:39]
  wire [2:0] _cs_decoder_decoded_orMatrixOutputs_T_35 = {_cs_decoder_decoded_T_21,_cs_decoder_decoded_T_81,
    _cs_decoder_decoded_T_163}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_36 = |_cs_decoder_decoded_orMatrixOutputs_T_35; // @[pla.scala 114:39]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_37 = |_cs_decoder_decoded_T_87; // @[pla.scala 114:39]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_38 = |_cs_decoder_decoded_T_49; // @[pla.scala 114:39]
  wire [5:0] _cs_decoder_decoded_orMatrixOutputs_T_39 = {_cs_decoder_decoded_T_49,_cs_decoder_decoded_T_67,
    _cs_decoder_decoded_T_139,_cs_decoder_decoded_T_267,_cs_decoder_decoded_T_269,_cs_decoder_decoded_T_275}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_40 = |_cs_decoder_decoded_orMatrixOutputs_T_39; // @[pla.scala 114:39]
  wire [5:0] cs_decoder_decoded_orMatrixOutputs_lo_lo_4 = {_cs_decoder_decoded_T_299,_cs_decoder_decoded_T_303,
    _cs_decoder_decoded_T_307,_cs_decoder_decoded_T_313,_cs_decoder_decoded_T_323,_cs_decoder_decoded_T_325}; // @[Cat.scala 31:58]
  wire [11:0] cs_decoder_decoded_orMatrixOutputs_lo_10 = {_cs_decoder_decoded_T_147,_cs_decoder_decoded_T_167,
    _cs_decoder_decoded_T_171,_cs_decoder_decoded_T_237,_cs_decoder_decoded_T_245,_cs_decoder_decoded_T_249,
    cs_decoder_decoded_orMatrixOutputs_lo_lo_4}; // @[Cat.scala 31:58]
  wire [5:0] cs_decoder_decoded_orMatrixOutputs_hi_lo_4 = {_cs_decoder_decoded_T_89,_cs_decoder_decoded_T_97,
    _cs_decoder_decoded_T_103,_cs_decoder_decoded_T_117,_cs_decoder_decoded_T_125,_cs_decoder_decoded_T_133}; // @[Cat.scala 31:58]
  wire [24:0] _cs_decoder_decoded_orMatrixOutputs_T_41 = {_cs_decoder_decoded_T_1,_cs_decoder_decoded_T_5,
    _cs_decoder_decoded_T_11,_cs_decoder_decoded_T_17,_cs_decoder_decoded_T_21,_cs_decoder_decoded_T_85,
    _cs_decoder_decoded_T_87,cs_decoder_decoded_orMatrixOutputs_hi_lo_4,cs_decoder_decoded_orMatrixOutputs_lo_10}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_42 = |_cs_decoder_decoded_orMatrixOutputs_T_41; // @[pla.scala 114:39]
  wire [5:0] cs_decoder_decoded_orMatrixOutputs_lo_11 = {_cs_decoder_decoded_T_275,_cs_decoder_decoded_T_299,
    _cs_decoder_decoded_T_303,_cs_decoder_decoded_T_307,_cs_decoder_decoded_T_329,_cs_decoder_decoded_T_339}; // @[Cat.scala 31:58]
  wire [11:0] _cs_decoder_decoded_orMatrixOutputs_T_43 = {_cs_decoder_decoded_T_49,_cs_decoder_decoded_T_67,
    _cs_decoder_decoded_T_185,_cs_decoder_decoded_T_191,_cs_decoder_decoded_T_267,_cs_decoder_decoded_T_269,
    cs_decoder_decoded_orMatrixOutputs_lo_11}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_44 = |_cs_decoder_decoded_orMatrixOutputs_T_43; // @[pla.scala 114:39]
  wire [8:0] _cs_decoder_decoded_orMatrixOutputs_T_45 = {_cs_decoder_decoded_T_11,_cs_decoder_decoded_T_21,
    _cs_decoder_decoded_T_87,_cs_decoder_decoded_T_89,_cs_decoder_decoded_T_185,_cs_decoder_decoded_T_191,
    _cs_decoder_decoded_T_245,_cs_decoder_decoded_T_249,_cs_decoder_decoded_T_313}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_46 = |_cs_decoder_decoded_orMatrixOutputs_T_45; // @[pla.scala 114:39]
  wire [1:0] cs_decoder_decoded_orMatrixOutputs_lo_lo_7 = {_cs_decoder_decoded_T_333,_cs_decoder_decoded_T_349}; // @[Cat.scala 31:58]
  wire [9:0] _cs_decoder_decoded_orMatrixOutputs_T_47 = {_cs_decoder_decoded_T_51,_cs_decoder_decoded_T_67,
    _cs_decoder_decoded_T_129,_cs_decoder_decoded_T_275,_cs_decoder_decoded_T_279,_cs_decoder_decoded_T_301,
    _cs_decoder_decoded_T_305,_cs_decoder_decoded_T_307,_cs_decoder_decoded_T_333,_cs_decoder_decoded_T_349}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_48 = |_cs_decoder_decoded_orMatrixOutputs_T_47; // @[pla.scala 114:39]
  wire [7:0] cs_decoder_decoded_orMatrixOutputs_lo_lo_8 = {_cs_decoder_decoded_T_269,_cs_decoder_decoded_T_275,
    _cs_decoder_decoded_T_299,_cs_decoder_decoded_T_303,_cs_decoder_decoded_T_307,_cs_decoder_decoded_T_325,
    _cs_decoder_decoded_T_335,_cs_decoder_decoded_T_339}; // @[Cat.scala 31:58]
  wire [7:0] cs_decoder_decoded_orMatrixOutputs_hi_lo_8 = {_cs_decoder_decoded_T_85,_cs_decoder_decoded_T_87,
    _cs_decoder_decoded_T_95,_cs_decoder_decoded_T_101,_cs_decoder_decoded_T_117,_cs_decoder_decoded_T_125,
    _cs_decoder_decoded_T_133,_cs_decoder_decoded_T_141}; // @[Cat.scala 31:58]
  wire [16:0] cs_decoder_decoded_orMatrixOutputs_hi_18 = {_cs_decoder_decoded_T_1,_cs_decoder_decoded_T_5,
    _cs_decoder_decoded_T_17,_cs_decoder_decoded_T_21,_cs_decoder_decoded_T_29,_cs_decoder_decoded_T_31,
    _cs_decoder_decoded_T_33,_cs_decoder_decoded_T_51,_cs_decoder_decoded_T_67,
    cs_decoder_decoded_orMatrixOutputs_hi_lo_8}; // @[Cat.scala 31:58]
  wire [32:0] _cs_decoder_decoded_orMatrixOutputs_T_49 = {cs_decoder_decoded_orMatrixOutputs_hi_18,
    _cs_decoder_decoded_T_147,_cs_decoder_decoded_T_167,_cs_decoder_decoded_T_169,_cs_decoder_decoded_T_173,
    _cs_decoder_decoded_T_213,_cs_decoder_decoded_T_231,_cs_decoder_decoded_T_243,_cs_decoder_decoded_T_267,
    cs_decoder_decoded_orMatrixOutputs_lo_lo_8}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_50 = |_cs_decoder_decoded_orMatrixOutputs_T_49; // @[pla.scala 114:39]
  wire [5:0] cs_decoder_decoded_orMatrixOutputs_lo_15 = {_cs_decoder_decoded_T_101,_cs_decoder_decoded_T_133,
    _cs_decoder_decoded_T_163,_cs_decoder_decoded_T_167,_cs_decoder_decoded_T_169,_cs_decoder_decoded_T_173}; // @[Cat.scala 31:58]
  wire [12:0] _cs_decoder_decoded_orMatrixOutputs_T_51 = {_cs_decoder_decoded_T_15,_cs_decoder_decoded_T_17,
    _cs_decoder_decoded_T_29,_cs_decoder_decoded_T_35,_cs_decoder_decoded_T_43,_cs_decoder_decoded_T_81,
    _cs_decoder_decoded_T_97,cs_decoder_decoded_orMatrixOutputs_lo_15}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_52 = |_cs_decoder_decoded_orMatrixOutputs_T_51; // @[pla.scala 114:39]
  wire [2:0] _cs_decoder_decoded_orMatrixOutputs_T_53 = {_cs_decoder_decoded_T_23,_cs_decoder_decoded_T_85,
    _cs_decoder_decoded_T_87}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_54 = |_cs_decoder_decoded_orMatrixOutputs_T_53; // @[pla.scala 114:39]
  wire [8:0] _cs_decoder_decoded_orMatrixOutputs_T_55 = {_cs_decoder_decoded_T_3,_cs_decoder_decoded_T_5,
    _cs_decoder_decoded_T_7,_cs_decoder_decoded_T_13,_cs_decoder_decoded_T_123,_cs_decoder_decoded_T_141,
    _cs_decoder_decoded_T_231,_cs_decoder_decoded_T_237,_cs_decoder_decoded_T_259}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_56 = |_cs_decoder_decoded_orMatrixOutputs_T_55; // @[pla.scala 114:39]
  wire [1:0] _cs_decoder_decoded_orMatrixOutputs_T_57 = {_cs_decoder_decoded_T_197,_cs_decoder_decoded_T_199}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_58 = |_cs_decoder_decoded_orMatrixOutputs_T_57; // @[pla.scala 114:39]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_59 = |_cs_decoder_decoded_T_213; // @[pla.scala 114:39]
  wire [6:0] _cs_decoder_decoded_orMatrixOutputs_T_62 = {_cs_decoder_decoded_T_49,_cs_decoder_decoded_T_71,
    _cs_decoder_decoded_T_75,_cs_decoder_decoded_T_275,_cs_decoder_decoded_T_279,_cs_decoder_decoded_T_301,
    _cs_decoder_decoded_T_305}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_63 = |_cs_decoder_decoded_orMatrixOutputs_T_62; // @[pla.scala 114:39]
  wire [1:0] _cs_decoder_decoded_orMatrixOutputs_T_64 = {_cs_decoder_decoded_T_263,_cs_decoder_decoded_T_307}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_65 = |_cs_decoder_decoded_orMatrixOutputs_T_64; // @[pla.scala 114:39]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_67 = |cs_decoder_decoded_orMatrixOutputs_lo_lo_7; // @[pla.scala 114:39]
  wire [4:0] _cs_decoder_decoded_orMatrixOutputs_T_68 = {_cs_decoder_decoded_T_139,_cs_decoder_decoded_T_319,
    _cs_decoder_decoded_T_321,_cs_decoder_decoded_T_329,_cs_decoder_decoded_T_339}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_69 = |_cs_decoder_decoded_orMatrixOutputs_T_68; // @[pla.scala 114:39]
  wire [8:0] cs_decoder_decoded_orMatrixOutputs_lo_20 = {_cs_decoder_decoded_T_261,_cs_decoder_decoded_T_267,
    _cs_decoder_decoded_T_269,_cs_decoder_decoded_T_275,_cs_decoder_decoded_T_299,_cs_decoder_decoded_T_303,
    _cs_decoder_decoded_T_307,_cs_decoder_decoded_T_329,_cs_decoder_decoded_T_339}; // @[Cat.scala 31:58]
  wire [17:0] _cs_decoder_decoded_orMatrixOutputs_T_70 = {_cs_decoder_decoded_T_3,_cs_decoder_decoded_T_5,
    _cs_decoder_decoded_T_7,_cs_decoder_decoded_T_51,_cs_decoder_decoded_T_67,_cs_decoder_decoded_T_123,
    _cs_decoder_decoded_T_141,_cs_decoder_decoded_T_231,_cs_decoder_decoded_T_243,
    cs_decoder_decoded_orMatrixOutputs_lo_20}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_71 = |_cs_decoder_decoded_orMatrixOutputs_T_70; // @[pla.scala 114:39]
  wire [7:0] _cs_decoder_decoded_orMatrixOutputs_T_72 = {_cs_decoder_decoded_T_3,_cs_decoder_decoded_T_5,
    _cs_decoder_decoded_T_7,_cs_decoder_decoded_T_123,_cs_decoder_decoded_T_141,_cs_decoder_decoded_T_231,
    _cs_decoder_decoded_T_243,_cs_decoder_decoded_T_261}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_73 = |_cs_decoder_decoded_orMatrixOutputs_T_72; // @[pla.scala 114:39]
  wire [4:0] cs_decoder_decoded_orMatrixOutputs_lo_22 = {_cs_decoder_decoded_T_299,_cs_decoder_decoded_T_303,
    _cs_decoder_decoded_T_307,_cs_decoder_decoded_T_329,_cs_decoder_decoded_T_339}; // @[Cat.scala 31:58]
  wire [10:0] _cs_decoder_decoded_orMatrixOutputs_T_74 = {_cs_decoder_decoded_T_51,_cs_decoder_decoded_T_67,
    _cs_decoder_decoded_T_139,_cs_decoder_decoded_T_267,_cs_decoder_decoded_T_269,_cs_decoder_decoded_T_275,
    cs_decoder_decoded_orMatrixOutputs_lo_22}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_75 = |_cs_decoder_decoded_orMatrixOutputs_T_74; // @[pla.scala 114:39]
  wire [8:0] cs_decoder_decoded_orMatrixOutputs_lo_lo_14 = {_cs_decoder_decoded_T_285,_cs_decoder_decoded_T_287,
    _cs_decoder_decoded_T_289,_cs_decoder_decoded_T_295,_cs_decoder_decoded_T_303,_cs_decoder_decoded_T_309,
    _cs_decoder_decoded_T_331,_cs_decoder_decoded_T_345,_cs_decoder_decoded_T_347}; // @[Cat.scala 31:58]
  wire [17:0] cs_decoder_decoded_orMatrixOutputs_lo_23 = {_cs_decoder_decoded_T_189,_cs_decoder_decoded_T_207,
    _cs_decoder_decoded_T_217,_cs_decoder_decoded_T_231,_cs_decoder_decoded_T_235,_cs_decoder_decoded_T_237,
    _cs_decoder_decoded_T_239,_cs_decoder_decoded_T_249,_cs_decoder_decoded_T_259,
    cs_decoder_decoded_orMatrixOutputs_lo_lo_14}; // @[Cat.scala 31:58]
  wire [9:0] cs_decoder_decoded_orMatrixOutputs_hi_hi_20 = {_cs_decoder_decoded_T_5,_cs_decoder_decoded_T_17,
    _cs_decoder_decoded_T_23,_cs_decoder_decoded_T_37,_cs_decoder_decoded_T_53,_cs_decoder_decoded_T_65,
    _cs_decoder_decoded_T_73,_cs_decoder_decoded_T_87,_cs_decoder_decoded_T_97,_cs_decoder_decoded_T_109}; // @[Cat.scala 31:58]
  wire [18:0] cs_decoder_decoded_orMatrixOutputs_hi_28 = {cs_decoder_decoded_orMatrixOutputs_hi_hi_20,
    _cs_decoder_decoded_T_115,_cs_decoder_decoded_T_121,_cs_decoder_decoded_T_125,_cs_decoder_decoded_T_141,
    _cs_decoder_decoded_T_145,_cs_decoder_decoded_T_151,_cs_decoder_decoded_T_179,_cs_decoder_decoded_T_181,
    _cs_decoder_decoded_T_185}; // @[Cat.scala 31:58]
  wire [36:0] _cs_decoder_decoded_orMatrixOutputs_T_76 = {cs_decoder_decoded_orMatrixOutputs_hi_28,
    cs_decoder_decoded_orMatrixOutputs_lo_23}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_77 = |_cs_decoder_decoded_orMatrixOutputs_T_76; // @[pla.scala 114:39]
  wire [7:0] cs_decoder_decoded_orMatrixOutputs_lo_lo_15 = {_cs_decoder_decoded_T_245,_cs_decoder_decoded_T_257,
    _cs_decoder_decoded_T_299,_cs_decoder_decoded_T_303,_cs_decoder_decoded_T_309,_cs_decoder_decoded_T_313,
    _cs_decoder_decoded_T_329,_cs_decoder_decoded_T_339}; // @[Cat.scala 31:58]
  wire [16:0] cs_decoder_decoded_orMatrixOutputs_lo_24 = {_cs_decoder_decoded_T_175,_cs_decoder_decoded_T_177,
    _cs_decoder_decoded_T_183,_cs_decoder_decoded_T_187,_cs_decoder_decoded_T_191,_cs_decoder_decoded_T_209,
    _cs_decoder_decoded_T_225,_cs_decoder_decoded_T_231,_cs_decoder_decoded_T_233,
    cs_decoder_decoded_orMatrixOutputs_lo_lo_15}; // @[Cat.scala 31:58]
  wire [7:0] cs_decoder_decoded_orMatrixOutputs_hi_lo_16 = {_cs_decoder_decoded_T_99,_cs_decoder_decoded_T_101,
    _cs_decoder_decoded_T_107,_cs_decoder_decoded_T_119,_cs_decoder_decoded_T_137,_cs_decoder_decoded_T_141,
    _cs_decoder_decoded_T_149,_cs_decoder_decoded_T_153}; // @[Cat.scala 31:58]
  wire [16:0] cs_decoder_decoded_orMatrixOutputs_hi_29 = {_cs_decoder_decoded_T_13,_cs_decoder_decoded_T_23,
    _cs_decoder_decoded_T_25,_cs_decoder_decoded_T_27,_cs_decoder_decoded_T_41,_cs_decoder_decoded_T_59,
    _cs_decoder_decoded_T_77,_cs_decoder_decoded_T_85,_cs_decoder_decoded_T_89,
    cs_decoder_decoded_orMatrixOutputs_hi_lo_16}; // @[Cat.scala 31:58]
  wire [33:0] _cs_decoder_decoded_orMatrixOutputs_T_78 = {cs_decoder_decoded_orMatrixOutputs_hi_29,
    cs_decoder_decoded_orMatrixOutputs_lo_24}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_79 = |_cs_decoder_decoded_orMatrixOutputs_T_78; // @[pla.scala 114:39]
  wire [6:0] cs_decoder_decoded_orMatrixOutputs_lo_lo_16 = {_cs_decoder_decoded_T_223,_cs_decoder_decoded_T_253,
    _cs_decoder_decoded_T_263,_cs_decoder_decoded_T_291,_cs_decoder_decoded_T_309,_cs_decoder_decoded_T_325,
    _cs_decoder_decoded_T_335}; // @[Cat.scala 31:58]
  wire [13:0] cs_decoder_decoded_orMatrixOutputs_lo_25 = {_cs_decoder_decoded_T_167,_cs_decoder_decoded_T_175,
    _cs_decoder_decoded_T_187,_cs_decoder_decoded_T_197,_cs_decoder_decoded_T_203,_cs_decoder_decoded_T_211,
    _cs_decoder_decoded_T_221,cs_decoder_decoded_orMatrixOutputs_lo_lo_16}; // @[Cat.scala 31:58]
  wire [6:0] cs_decoder_decoded_orMatrixOutputs_hi_lo_17 = {_cs_decoder_decoded_T_85,_cs_decoder_decoded_T_87,
    _cs_decoder_decoded_T_105,_cs_decoder_decoded_T_119,_cs_decoder_decoded_T_151,_cs_decoder_decoded_T_161,
    _cs_decoder_decoded_T_165}; // @[Cat.scala 31:58]
  wire [27:0] _cs_decoder_decoded_orMatrixOutputs_T_80 = {_cs_decoder_decoded_T_19,_cs_decoder_decoded_T_21,
    _cs_decoder_decoded_T_39,_cs_decoder_decoded_T_45,_cs_decoder_decoded_T_57,_cs_decoder_decoded_T_61,
    _cs_decoder_decoded_T_79,cs_decoder_decoded_orMatrixOutputs_hi_lo_17,cs_decoder_decoded_orMatrixOutputs_lo_25}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_81 = |_cs_decoder_decoded_orMatrixOutputs_T_80; // @[pla.scala 114:39]
  wire [7:0] cs_decoder_decoded_orMatrixOutputs_lo_lo_17 = {_cs_decoder_decoded_T_257,_cs_decoder_decoded_T_279,
    _cs_decoder_decoded_T_281,_cs_decoder_decoded_T_299,_cs_decoder_decoded_T_303,_cs_decoder_decoded_T_311,
    _cs_decoder_decoded_T_313,_cs_decoder_decoded_T_325}; // @[Cat.scala 31:58]
  wire [7:0] cs_decoder_decoded_orMatrixOutputs_hi_lo_18 = {_cs_decoder_decoded_T_97,_cs_decoder_decoded_T_105,
    _cs_decoder_decoded_T_113,_cs_decoder_decoded_T_135,_cs_decoder_decoded_T_151,_cs_decoder_decoded_T_157,
    _cs_decoder_decoded_T_163,_cs_decoder_decoded_T_167}; // @[Cat.scala 31:58]
  wire [16:0] cs_decoder_decoded_orMatrixOutputs_hi_31 = {_cs_decoder_decoded_T_13,_cs_decoder_decoded_T_25,
    _cs_decoder_decoded_T_39,_cs_decoder_decoded_T_45,_cs_decoder_decoded_T_47,_cs_decoder_decoded_T_57,
    _cs_decoder_decoded_T_61,_cs_decoder_decoded_T_81,_cs_decoder_decoded_T_89,
    cs_decoder_decoded_orMatrixOutputs_hi_lo_18}; // @[Cat.scala 31:58]
  wire [32:0] _cs_decoder_decoded_orMatrixOutputs_T_82 = {cs_decoder_decoded_orMatrixOutputs_hi_31,
    _cs_decoder_decoded_T_205,_cs_decoder_decoded_T_215,_cs_decoder_decoded_T_217,_cs_decoder_decoded_T_219,
    _cs_decoder_decoded_T_229,_cs_decoder_decoded_T_241,_cs_decoder_decoded_T_245,_cs_decoder_decoded_T_249,
    cs_decoder_decoded_orMatrixOutputs_lo_lo_17}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_83 = |_cs_decoder_decoded_orMatrixOutputs_T_82; // @[pla.scala 114:39]
  wire [9:0] cs_decoder_decoded_orMatrixOutputs_lo_27 = {_cs_decoder_decoded_T_173,_cs_decoder_decoded_T_177,
    _cs_decoder_decoded_T_193,_cs_decoder_decoded_T_195,_cs_decoder_decoded_T_217,_cs_decoder_decoded_T_291,
    _cs_decoder_decoded_T_293,_cs_decoder_decoded_T_319,_cs_decoder_decoded_T_321,_cs_decoder_decoded_T_343}; // @[Cat.scala 31:58]
  wire [4:0] cs_decoder_decoded_orMatrixOutputs_hi_lo_19 = {_cs_decoder_decoded_T_143,_cs_decoder_decoded_T_151,
    _cs_decoder_decoded_T_159,_cs_decoder_decoded_T_163,_cs_decoder_decoded_T_169}; // @[Cat.scala 31:58]
  wire [20:0] _cs_decoder_decoded_orMatrixOutputs_T_84 = {_cs_decoder_decoded_T_57,_cs_decoder_decoded_T_61,
    _cs_decoder_decoded_T_71,_cs_decoder_decoded_T_75,_cs_decoder_decoded_T_81,_cs_decoder_decoded_T_113,
    cs_decoder_decoded_orMatrixOutputs_hi_lo_19,cs_decoder_decoded_orMatrixOutputs_lo_27}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_85 = |_cs_decoder_decoded_orMatrixOutputs_T_84; // @[pla.scala 114:39]
  wire [5:0] cs_decoder_decoded_orMatrixOutputs_lo_lo_19 = {_cs_decoder_decoded_T_245,_cs_decoder_decoded_T_249,
    _cs_decoder_decoded_T_259,_cs_decoder_decoded_T_263,_cs_decoder_decoded_T_307,_cs_decoder_decoded_T_313}; // @[Cat.scala 31:58]
  wire [11:0] cs_decoder_decoded_orMatrixOutputs_lo_28 = {_cs_decoder_decoded_T_191,_cs_decoder_decoded_T_193,
    _cs_decoder_decoded_T_195,_cs_decoder_decoded_T_201,_cs_decoder_decoded_T_217,_cs_decoder_decoded_T_219,
    cs_decoder_decoded_orMatrixOutputs_lo_lo_19}; // @[Cat.scala 31:58]
  wire [5:0] cs_decoder_decoded_orMatrixOutputs_hi_lo_20 = {_cs_decoder_decoded_T_87,_cs_decoder_decoded_T_89,
    _cs_decoder_decoded_T_101,_cs_decoder_decoded_T_155,_cs_decoder_decoded_T_169,_cs_decoder_decoded_T_185}; // @[Cat.scala 31:58]
  wire [23:0] _cs_decoder_decoded_orMatrixOutputs_T_86 = {_cs_decoder_decoded_T_13,_cs_decoder_decoded_T_23,
    _cs_decoder_decoded_T_25,_cs_decoder_decoded_T_45,_cs_decoder_decoded_T_63,_cs_decoder_decoded_T_85,
    cs_decoder_decoded_orMatrixOutputs_hi_lo_20,cs_decoder_decoded_orMatrixOutputs_lo_28}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_87 = |_cs_decoder_decoded_orMatrixOutputs_T_86; // @[pla.scala 114:39]
  wire [8:0] cs_decoder_decoded_orMatrixOutputs_lo_29 = {_cs_decoder_decoded_T_267,_cs_decoder_decoded_T_269,
    _cs_decoder_decoded_T_275,_cs_decoder_decoded_T_299,_cs_decoder_decoded_T_303,_cs_decoder_decoded_T_307,
    _cs_decoder_decoded_T_313,_cs_decoder_decoded_T_323,_cs_decoder_decoded_T_325}; // @[Cat.scala 31:58]
  wire [17:0] _cs_decoder_decoded_orMatrixOutputs_T_88 = {_cs_decoder_decoded_T_49,_cs_decoder_decoded_T_67,
    _cs_decoder_decoded_T_89,_cs_decoder_decoded_T_141,_cs_decoder_decoded_T_227,_cs_decoder_decoded_T_231,
    _cs_decoder_decoded_T_245,_cs_decoder_decoded_T_249,_cs_decoder_decoded_T_259,
    cs_decoder_decoded_orMatrixOutputs_lo_29}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_89 = |_cs_decoder_decoded_orMatrixOutputs_T_88; // @[pla.scala 114:39]
  wire [4:0] cs_decoder_decoded_orMatrixOutputs_lo_30 = {_cs_decoder_decoded_T_299,_cs_decoder_decoded_T_309,
    _cs_decoder_decoded_T_327,_cs_decoder_decoded_T_337,_cs_decoder_decoded_T_341}; // @[Cat.scala 31:58]
  wire [10:0] _cs_decoder_decoded_orMatrixOutputs_T_90 = {_cs_decoder_decoded_T_55,_cs_decoder_decoded_T_69,
    _cs_decoder_decoded_T_131,_cs_decoder_decoded_T_271,_cs_decoder_decoded_T_273,_cs_decoder_decoded_T_277,
    cs_decoder_decoded_orMatrixOutputs_lo_30}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_91 = |_cs_decoder_decoded_orMatrixOutputs_T_90; // @[pla.scala 114:39]
  wire [5:0] cs_decoder_decoded_orMatrixOutputs_lo_31 = {_cs_decoder_decoded_T_299,_cs_decoder_decoded_T_303,
    _cs_decoder_decoded_T_307,_cs_decoder_decoded_T_325,_cs_decoder_decoded_T_335,_cs_decoder_decoded_T_339}; // @[Cat.scala 31:58]
  wire [11:0] _cs_decoder_decoded_orMatrixOutputs_T_92 = {_cs_decoder_decoded_T_51,_cs_decoder_decoded_T_67,
    _cs_decoder_decoded_T_127,_cs_decoder_decoded_T_267,_cs_decoder_decoded_T_269,_cs_decoder_decoded_T_275,
    cs_decoder_decoded_orMatrixOutputs_lo_31}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_93 = |_cs_decoder_decoded_orMatrixOutputs_T_92; // @[pla.scala 114:39]
  wire [9:0] cs_decoder_decoded_orMatrixOutputs_lo_lo_23 = {_cs_decoder_decoded_T_267,_cs_decoder_decoded_T_269,
    _cs_decoder_decoded_T_275,_cs_decoder_decoded_T_299,_cs_decoder_decoded_T_303,_cs_decoder_decoded_T_307,
    _cs_decoder_decoded_T_315,_cs_decoder_decoded_T_325,_cs_decoder_decoded_T_335,_cs_decoder_decoded_T_339}; // @[Cat.scala 31:58]
  wire [9:0] cs_decoder_decoded_orMatrixOutputs_lo_hi_27 = {_cs_decoder_decoded_T_163,_cs_decoder_decoded_T_167,
    _cs_decoder_decoded_T_169,_cs_decoder_decoded_T_173,_cs_decoder_decoded_T_213,_cs_decoder_decoded_T_231,
    _cs_decoder_decoded_T_243,_cs_decoder_decoded_T_247,_cs_decoder_decoded_T_251,_cs_decoder_decoded_T_261}; // @[Cat.scala 31:58]
  wire [9:0] cs_decoder_decoded_orMatrixOutputs_hi_lo_24 = {_cs_decoder_decoded_T_83,_cs_decoder_decoded_T_87,
    _cs_decoder_decoded_T_91,_cs_decoder_decoded_T_95,_cs_decoder_decoded_T_101,_cs_decoder_decoded_T_111,
    _cs_decoder_decoded_T_123,_cs_decoder_decoded_T_133,_cs_decoder_decoded_T_141,_cs_decoder_decoded_T_147}; // @[Cat.scala 31:58]
  wire [4:0] cs_decoder_decoded_orMatrixOutputs_hi_hi_lo_12 = {_cs_decoder_decoded_T_29,_cs_decoder_decoded_T_31,
    _cs_decoder_decoded_T_33,_cs_decoder_decoded_T_51,_cs_decoder_decoded_T_67}; // @[Cat.scala 31:58]
  wire [40:0] _cs_decoder_decoded_orMatrixOutputs_T_94 = {_cs_decoder_decoded_T_1,_cs_decoder_decoded_T_5,
    _cs_decoder_decoded_T_7,_cs_decoder_decoded_T_11,_cs_decoder_decoded_T_17,_cs_decoder_decoded_T_21,
    cs_decoder_decoded_orMatrixOutputs_hi_hi_lo_12,cs_decoder_decoded_orMatrixOutputs_hi_lo_24,
    cs_decoder_decoded_orMatrixOutputs_lo_hi_27,cs_decoder_decoded_orMatrixOutputs_lo_lo_23}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_orMatrixOutputs_T_95 = |_cs_decoder_decoded_orMatrixOutputs_T_94; // @[pla.scala 114:39]
  wire [5:0] cs_decoder_decoded_orMatrixOutputs_lo_lo_lo_11 = {_cs_decoder_decoded_orMatrixOutputs_T_8,
    _cs_decoder_decoded_orMatrixOutputs_T_7,_cs_decoder_decoded_orMatrixOutputs_T_5,
    _cs_decoder_decoded_orMatrixOutputs_T_3,_cs_decoder_decoded_orMatrixOutputs_T_1,
    _cs_decoder_decoded_orMatrixOutputs_T}; // @[Cat.scala 31:58]
  wire [12:0] cs_decoder_decoded_orMatrixOutputs_lo_lo_24 = {_cs_decoder_decoded_orMatrixOutputs_T_22,
    _cs_decoder_decoded_orMatrixOutputs_T_20,_cs_decoder_decoded_orMatrixOutputs_T_18,
    _cs_decoder_decoded_orMatrixOutputs_T_16,_cs_decoder_decoded_orMatrixOutputs_T_14,
    _cs_decoder_decoded_orMatrixOutputs_T_12,_cs_decoder_decoded_orMatrixOutputs_T_10,
    cs_decoder_decoded_orMatrixOutputs_lo_lo_lo_11}; // @[Cat.scala 31:58]
  wire [5:0] cs_decoder_decoded_orMatrixOutputs_lo_hi_lo_12 = {_cs_decoder_decoded_orMatrixOutputs_T_30,
    _cs_decoder_decoded_orMatrixOutputs_T_28,_cs_decoder_decoded_orMatrixOutputs_T_26,
    _cs_decoder_decoded_orMatrixOutputs_T_25,_cs_decoder_decoded_orMatrixOutputs_T_24,
    _cs_decoder_decoded_orMatrixOutputs_T_23}; // @[Cat.scala 31:58]
  wire [25:0] cs_decoder_decoded_orMatrixOutputs_lo_33 = {_cs_decoder_decoded_orMatrixOutputs_T_42,
    _cs_decoder_decoded_orMatrixOutputs_T_40,_cs_decoder_decoded_orMatrixOutputs_T_38,
    _cs_decoder_decoded_orMatrixOutputs_T_37,_cs_decoder_decoded_orMatrixOutputs_T_36,
    _cs_decoder_decoded_orMatrixOutputs_T_34,_cs_decoder_decoded_orMatrixOutputs_T_32,
    cs_decoder_decoded_orMatrixOutputs_lo_hi_lo_12,cs_decoder_decoded_orMatrixOutputs_lo_lo_24}; // @[Cat.scala 31:58]
  wire [5:0] cs_decoder_decoded_orMatrixOutputs_hi_lo_lo_12 = {_cs_decoder_decoded_orMatrixOutputs_T_54,
    _cs_decoder_decoded_orMatrixOutputs_T_52,_cs_decoder_decoded_orMatrixOutputs_T_50,
    _cs_decoder_decoded_orMatrixOutputs_T_48,_cs_decoder_decoded_orMatrixOutputs_T_46,
    _cs_decoder_decoded_orMatrixOutputs_T_44}; // @[Cat.scala 31:58]
  wire [12:0] cs_decoder_decoded_orMatrixOutputs_hi_lo_25 = {_cs_decoder_decoded_orMatrixOutputs_T_67,
    _cs_decoder_decoded_orMatrixOutputs_T_65,_cs_decoder_decoded_orMatrixOutputs_T_63,
    _cs_decoder_decoded_orMatrixOutputs_T_3,_cs_decoder_decoded_orMatrixOutputs_T_59,
    _cs_decoder_decoded_orMatrixOutputs_T_58,_cs_decoder_decoded_orMatrixOutputs_T_56,
    cs_decoder_decoded_orMatrixOutputs_hi_lo_lo_12}; // @[Cat.scala 31:58]
  wire [6:0] cs_decoder_decoded_orMatrixOutputs_hi_hi_lo_13 = {_cs_decoder_decoded_orMatrixOutputs_T_81,
    _cs_decoder_decoded_orMatrixOutputs_T_79,_cs_decoder_decoded_orMatrixOutputs_T_77,
    _cs_decoder_decoded_orMatrixOutputs_T_75,_cs_decoder_decoded_orMatrixOutputs_T_73,
    _cs_decoder_decoded_orMatrixOutputs_T_71,_cs_decoder_decoded_orMatrixOutputs_T_69}; // @[Cat.scala 31:58]
  wire [52:0] cs_decoder_decoded_orMatrixOutputs = {_cs_decoder_decoded_orMatrixOutputs_T_95,
    _cs_decoder_decoded_orMatrixOutputs_T_93,_cs_decoder_decoded_orMatrixOutputs_T_91,
    _cs_decoder_decoded_orMatrixOutputs_T_89,_cs_decoder_decoded_orMatrixOutputs_T_87,
    _cs_decoder_decoded_orMatrixOutputs_T_85,_cs_decoder_decoded_orMatrixOutputs_T_83,
    cs_decoder_decoded_orMatrixOutputs_hi_hi_lo_13,cs_decoder_decoded_orMatrixOutputs_hi_lo_25,
    cs_decoder_decoded_orMatrixOutputs_lo_33}; // @[Cat.scala 31:58]
  wire  _cs_decoder_decoded_invMatrixOutputs_T_30 = ~cs_decoder_decoded_orMatrixOutputs[29]; // @[pla.scala 123:40]
  wire  _cs_decoder_decoded_invMatrixOutputs_T_42 = ~cs_decoder_decoded_orMatrixOutputs[40]; // @[pla.scala 123:40]
  wire [5:0] cs_decoder_decoded_invMatrixOutputs_lo_lo_lo = {cs_decoder_decoded_orMatrixOutputs[5],
    cs_decoder_decoded_orMatrixOutputs[4],cs_decoder_decoded_orMatrixOutputs[3],cs_decoder_decoded_orMatrixOutputs[2],
    cs_decoder_decoded_orMatrixOutputs[1],cs_decoder_decoded_orMatrixOutputs[0]}; // @[Cat.scala 31:58]
  wire [12:0] cs_decoder_decoded_invMatrixOutputs_lo_lo = {cs_decoder_decoded_orMatrixOutputs[12],
    cs_decoder_decoded_orMatrixOutputs[11],cs_decoder_decoded_orMatrixOutputs[10],cs_decoder_decoded_orMatrixOutputs[9],
    cs_decoder_decoded_orMatrixOutputs[8],cs_decoder_decoded_orMatrixOutputs[7],cs_decoder_decoded_orMatrixOutputs[6],
    cs_decoder_decoded_invMatrixOutputs_lo_lo_lo}; // @[Cat.scala 31:58]
  wire [5:0] cs_decoder_decoded_invMatrixOutputs_lo_hi_lo = {cs_decoder_decoded_orMatrixOutputs[18],
    cs_decoder_decoded_orMatrixOutputs[17],cs_decoder_decoded_orMatrixOutputs[16],cs_decoder_decoded_orMatrixOutputs[15]
    ,cs_decoder_decoded_orMatrixOutputs[14],cs_decoder_decoded_orMatrixOutputs[13]}; // @[Cat.scala 31:58]
  wire [25:0] cs_decoder_decoded_invMatrixOutputs_lo = {cs_decoder_decoded_orMatrixOutputs[25],
    cs_decoder_decoded_orMatrixOutputs[24],cs_decoder_decoded_orMatrixOutputs[23],cs_decoder_decoded_orMatrixOutputs[22]
    ,cs_decoder_decoded_orMatrixOutputs[21],cs_decoder_decoded_orMatrixOutputs[20],cs_decoder_decoded_orMatrixOutputs[19
    ],cs_decoder_decoded_invMatrixOutputs_lo_hi_lo,cs_decoder_decoded_invMatrixOutputs_lo_lo}; // @[Cat.scala 31:58]
  wire [5:0] cs_decoder_decoded_invMatrixOutputs_hi_lo_lo = {cs_decoder_decoded_orMatrixOutputs[31],
    cs_decoder_decoded_orMatrixOutputs[30],_cs_decoder_decoded_invMatrixOutputs_T_30,cs_decoder_decoded_orMatrixOutputs[
    28],cs_decoder_decoded_orMatrixOutputs[27],cs_decoder_decoded_orMatrixOutputs[26]}; // @[Cat.scala 31:58]
  wire [12:0] cs_decoder_decoded_invMatrixOutputs_hi_lo = {cs_decoder_decoded_orMatrixOutputs[38],
    cs_decoder_decoded_orMatrixOutputs[37],cs_decoder_decoded_orMatrixOutputs[36],cs_decoder_decoded_orMatrixOutputs[35]
    ,cs_decoder_decoded_orMatrixOutputs[34],cs_decoder_decoded_orMatrixOutputs[33],cs_decoder_decoded_orMatrixOutputs[32
    ],cs_decoder_decoded_invMatrixOutputs_hi_lo_lo}; // @[Cat.scala 31:58]
  wire [6:0] cs_decoder_decoded_invMatrixOutputs_hi_hi_lo = {cs_decoder_decoded_orMatrixOutputs[45],
    cs_decoder_decoded_orMatrixOutputs[44],cs_decoder_decoded_orMatrixOutputs[43],cs_decoder_decoded_orMatrixOutputs[42]
    ,cs_decoder_decoded_orMatrixOutputs[41],_cs_decoder_decoded_invMatrixOutputs_T_42,cs_decoder_decoded_orMatrixOutputs
    [39]}; // @[Cat.scala 31:58]
  wire [52:0] cs_decoder_decoded_invMatrixOutputs = {cs_decoder_decoded_orMatrixOutputs[52],
    cs_decoder_decoded_orMatrixOutputs[51],cs_decoder_decoded_orMatrixOutputs[50],cs_decoder_decoded_orMatrixOutputs[49]
    ,cs_decoder_decoded_orMatrixOutputs[48],cs_decoder_decoded_orMatrixOutputs[47],cs_decoder_decoded_orMatrixOutputs[46
    ],cs_decoder_decoded_invMatrixOutputs_hi_hi_lo,cs_decoder_decoded_invMatrixOutputs_hi_lo,
    cs_decoder_decoded_invMatrixOutputs_lo}; // @[Cat.scala 31:58]
  wire  cs_decoder_0 = cs_decoder_decoded_invMatrixOutputs[52]; // @[Decode.scala 50:77]
  wire  cs_decoder_1 = cs_decoder_decoded_invMatrixOutputs[51]; // @[Decode.scala 50:77]
  wire [6:0] cs_decoder_3 = cs_decoder_decoded_invMatrixOutputs[49:43]; // @[Decode.scala 50:77]
  wire [9:0] cs_decoder_5 = cs_decoder_decoded_invMatrixOutputs[39:30]; // @[Decode.scala 50:77]
  wire [1:0] cs_decoder_6 = cs_decoder_decoded_invMatrixOutputs[29:28]; // @[Decode.scala 50:77]
  wire [1:0] cs_decoder_8 = cs_decoder_decoded_invMatrixOutputs[25:24]; // @[Decode.scala 50:77]
  wire [2:0] cs_decoder_10 = cs_decoder_decoded_invMatrixOutputs[22:20]; // @[Decode.scala 50:77]
  wire [4:0] cs_decoder_16 = cs_decoder_decoded_invMatrixOutputs[14:10]; // @[Decode.scala 50:77]
  wire  cs_decoder_19 = cs_decoder_decoded_invMatrixOutputs[6]; // @[Decode.scala 50:77]
  wire  cs_decoder_22 = cs_decoder_decoded_invMatrixOutputs[3]; // @[Decode.scala 50:77]
  wire [2:0] cs_decoder_23 = cs_decoder_decoded_invMatrixOutputs[2:0]; // @[Decode.scala 50:77]
  wire  _csr_en_T = cs_decoder_23 == 3'h6; // @[package.scala 15:47]
  wire  _csr_en_T_1 = cs_decoder_23 == 3'h7; // @[package.scala 15:47]
  wire  _csr_en_T_2 = cs_decoder_23 == 3'h5; // @[package.scala 15:47]
  wire  _csr_en_T_3 = _csr_en_T | _csr_en_T_1; // @[package.scala 72:59]
  wire  csr_en = _csr_en_T | _csr_en_T_1 | _csr_en_T_2; // @[package.scala 72:59]
  wire  _T_11 = ~cs_decoder_19 & io_enq_uop_is_sfb; // @[micro-op.scala 110:33]
  wire [4:0] _GEN_1 = _T_11 & cs_decoder_3 == 7'hf & io_enq_uop_inst[19:15] == 5'h0 ? io_enq_uop_inst[11:7] :
    io_enq_uop_inst[19:15]; // @[decode.scala 536:18 552:90 554:21]
  wire [4:0] _GEN_7 = _T_11 & cs_decoder_8 == 2'h2 ? io_enq_uop_inst[19:15] : _GEN_1; // @[decode.scala 536:18 548:52]
  wire [5:0] uop_lrs1 = {{1'd0}, _GEN_7}; // @[decode.scala 479:17]
  wire  csr_ren = _csr_en_T_3 & uop_lrs1 == 6'h0; // @[decode.scala 495:50]
  wire  system_insn = cs_decoder_23 == 3'h4; // @[decode.scala 496:32]
  wire  sfence = cs_decoder_3 == 7'h6b; // @[decode.scala 497:24]
  wire  _id_illegal_insn_T_1 = cs_decoder_1 & io_csr_decode_fp_illegal; // @[decode.scala 503:15]
  wire  _id_illegal_insn_T_2 = ~cs_decoder_0 | _id_illegal_insn_T_1; // @[decode.scala 502:35]
  wire  _id_illegal_insn_T_15 = ~csr_ren; // @[decode.scala 507:46]
  wire  _id_illegal_insn_T_18 = csr_en & (io_csr_decode_read_illegal | ~csr_ren & io_csr_decode_write_illegal); // @[decode.scala 507:12]
  wire  _id_illegal_insn_T_19 = _id_illegal_insn_T_2 | _id_illegal_insn_T_18; // @[decode.scala 506:61]
  wire  _id_illegal_insn_T_21 = (sfence | system_insn) & io_csr_decode_system_illegal; // @[decode.scala 508:30]
  wire  id_illegal_insn = _id_illegal_insn_T_19 | _id_illegal_insn_T_21; // @[decode.scala 507:87]
  wire  _T_1 = io_interrupt & ~io_enq_uop_is_sfb; // @[decode.scala 516:19]
  wire [1:0] _T_6 = io_enq_uop_xcpt_ae_if ? 2'h1 : 2'h2; // @[Mux.scala 47:70]
  wire [3:0] _T_7 = io_enq_uop_xcpt_pf_if ? 4'hc : {{2'd0}, _T_6}; // @[Mux.scala 47:70]
  wire [3:0] _T_8 = io_enq_uop_bp_xcpt_if ? 4'h3 : _T_7; // @[Mux.scala 47:70]
  wire [3:0] _T_9 = io_enq_uop_bp_debug_if ? 4'he : _T_8; // @[Mux.scala 47:70]
  wire [5:0] uop_ldst = {{1'd0}, io_enq_uop_inst[11:7]}; // @[decode.scala 479:17 535:18]
  wire [6:0] _GEN_0 = _T_11 & cs_decoder_3 == 7'hf & io_enq_uop_inst[19:15] == 5'h0 ? 7'h6d : cs_decoder_3; // @[decode.scala 528:18 552:90 553:21]
  wire  _GEN_2 = _T_11 & cs_decoder_3 == 7'hf & io_enq_uop_inst[19:15] == 5'h0 | _T_11; // @[decode.scala 546:19 552:90 555:21]
  wire [4:0] _GEN_4 = _T_11 & cs_decoder_8 == 2'h2 ? io_enq_uop_inst[11:7] : io_enq_uop_inst[24:20]; // @[decode.scala 537:18 548:52 550:21]
  wire [6:0] uop_uopc = _T_11 & cs_decoder_8 == 2'h2 ? cs_decoder_3 : _GEN_0; // @[decode.scala 528:18 548:52]
  wire  _T_23 = cs_decoder_19 & io_enq_uop_is_sfb; // @[micro-op.scala 109:32]
  wire  _uop_mem_size_T = cs_decoder_16 == 5'h14; // @[package.scala 15:47]
  wire  _uop_mem_size_T_1 = cs_decoder_16 == 5'h5; // @[package.scala 15:47]
  wire  _uop_mem_size_T_2 = _uop_mem_size_T | _uop_mem_size_T_1; // @[package.scala 72:59]
  wire [5:0] uop_lrs2 = {{1'd0}, _GEN_4}; // @[decode.scala 479:17]
  wire  _uop_mem_size_T_3 = uop_lrs2 != 6'h0; // @[decode.scala 566:81]
  wire  _uop_mem_size_T_4 = uop_lrs1 != 6'h0; // @[decode.scala 566:99]
  wire [1:0] _uop_mem_size_T_5 = {_uop_mem_size_T_3,_uop_mem_size_T_4}; // @[Cat.scala 31:58]
  wire [4:0] di24_20 = cs_decoder_10 == 3'h2 | cs_decoder_10 == 3'h1 ? io_enq_uop_inst[11:7] : io_enq_uop_inst[24:20]; // @[decode.scala 583:20]
  wire [11:0] uop_imm_packed_hi = {io_enq_uop_inst[31:25],di24_20}; // @[Cat.scala 31:58]
  assign io_deq_uop_uopc = _T_11 & cs_decoder_8 == 2'h2 ? cs_decoder_3 : _GEN_0; // @[decode.scala 528:18 548:52]
  assign io_deq_uop_debug_inst = io_enq_uop_debug_inst; // @[decode.scala 479:17 480:7]
  assign io_deq_uop_is_rvc = io_enq_uop_is_rvc; // @[decode.scala 479:17 480:7]
  assign io_deq_uop_iq_type = cs_decoder_decoded_invMatrixOutputs[42:40]; // @[Decode.scala 50:77]
  assign io_deq_uop_fu_code = _T_23 ? 10'h2 : cs_decoder_5; // @[decode.scala 557:24 558:17 530:18]
  assign io_deq_uop_is_br = cs_decoder_decoded_invMatrixOutputs[6]; // @[Decode.scala 50:77]
  assign io_deq_uop_is_jalr = uop_uopc == 7'h26; // @[decode.scala 590:35]
  assign io_deq_uop_is_jal = uop_uopc == 7'h25; // @[decode.scala 589:35]
  assign io_deq_uop_is_sfb = io_enq_uop_is_sfb; // @[decode.scala 479:17 480:7]
  assign io_deq_uop_ftq_idx = io_enq_uop_ftq_idx; // @[decode.scala 479:17 480:7]
  assign io_deq_uop_edge_inst = io_enq_uop_edge_inst; // @[decode.scala 479:17 480:7]
  assign io_deq_uop_pc_lob = io_enq_uop_pc_lob; // @[decode.scala 479:17 480:7]
  assign io_deq_uop_taken = io_enq_uop_taken; // @[decode.scala 479:17 480:7]
  assign io_deq_uop_imm_packed = {uop_imm_packed_hi,io_enq_uop_inst[19:12]}; // @[Cat.scala 31:58]
  assign io_deq_uop_exception = _T_1 | io_enq_uop_bp_debug_if | io_enq_uop_bp_xcpt_if | io_enq_uop_xcpt_pf_if |
    io_enq_uop_xcpt_ae_if | id_illegal_insn; // @[decode.scala 513:26]
  assign io_deq_uop_exc_cause = _T_1 ? io_interrupt_cause : {{60'd0}, _T_9}; // @[Mux.scala 47:70]
  assign io_deq_uop_bypassable = cs_decoder_decoded_invMatrixOutputs[7]; // @[Decode.scala 50:77]
  assign io_deq_uop_mem_cmd = cs_decoder_decoded_invMatrixOutputs[14:10]; // @[Decode.scala 50:77]
  assign io_deq_uop_mem_size = _uop_mem_size_T_2 ? _uop_mem_size_T_5 : io_enq_uop_inst[13:12]; // @[decode.scala 566:24]
  assign io_deq_uop_mem_signed = ~cs_decoder_decoded_andMatrixInput_9_37; // @[decode.scala 567:21]
  assign io_deq_uop_is_fence = cs_decoder_decoded_invMatrixOutputs[16]; // @[Decode.scala 50:77]
  assign io_deq_uop_is_fencei = cs_decoder_decoded_invMatrixOutputs[15]; // @[Decode.scala 50:77]
  assign io_deq_uop_is_amo = cs_decoder_decoded_invMatrixOutputs[17]; // @[Decode.scala 50:77]
  assign io_deq_uop_uses_ldq = cs_decoder_decoded_invMatrixOutputs[19]; // @[Decode.scala 50:77]
  assign io_deq_uop_uses_stq = cs_decoder_decoded_invMatrixOutputs[18]; // @[Decode.scala 50:77]
  assign io_deq_uop_is_sys_pc2epc = cs_decoder_decoded_invMatrixOutputs[5]; // @[Decode.scala 50:77]
  assign io_deq_uop_is_unique = cs_decoder_decoded_invMatrixOutputs[4]; // @[Decode.scala 50:77]
  assign io_deq_uop_flush_on_commit = cs_decoder_22 | csr_en & _id_illegal_insn_T_15 & io_csr_decode_write_flush; // @[decode.scala 575:45]
  assign io_deq_uop_ldst_is_rs1 = _T_11 & cs_decoder_8 == 2'h2 ? 1'h0 : _GEN_2; // @[decode.scala 548:52 551:21]
  assign io_deq_uop_ldst = {{1'd0}, io_enq_uop_inst[11:7]}; // @[decode.scala 479:17 535:18]
  assign io_deq_uop_lrs1 = {{1'd0}, _GEN_7}; // @[decode.scala 479:17]
  assign io_deq_uop_lrs2 = {{1'd0}, _GEN_4}; // @[decode.scala 479:17]
  assign io_deq_uop_lrs3 = {{1'd0}, io_enq_uop_inst[31:27]}; // @[decode.scala 479:17 538:18]
  assign io_deq_uop_ldst_val = cs_decoder_6 != 2'h2 & ~(uop_ldst == 6'h0 & cs_decoder_6 == 2'h0); // @[decode.scala 540:42]
  assign io_deq_uop_dst_rtype = cs_decoder_decoded_invMatrixOutputs[29:28]; // @[Decode.scala 50:77]
  assign io_deq_uop_lrs1_rtype = cs_decoder_decoded_invMatrixOutputs[27:26]; // @[Decode.scala 50:77]
  assign io_deq_uop_lrs2_rtype = _T_11 & cs_decoder_8 == 2'h2 ? 2'h0 : cs_decoder_8; // @[decode.scala 543:18 548:52 549:21]
  assign io_deq_uop_frs3_en = cs_decoder_decoded_invMatrixOutputs[23]; // @[Decode.scala 50:77]
  assign io_deq_uop_fp_val = cs_decoder_decoded_invMatrixOutputs[51]; // @[Decode.scala 50:77]
  assign io_deq_uop_debug_fsrc = io_enq_uop_debug_fsrc; // @[decode.scala 479:17 480:7]
  assign io_csr_decode_inst = io_enq_uop_inst; // @[decode.scala 479:17 480:7]
endmodule