// @author: hungnc5
package decode_table_package;
  parameter Y = 1'b1;
  parameter N = 1'b0;
  parameter X = 1'bx;
  parameter uopNOP  =  0;
  parameter uopLD   =  1;
  parameter uopSTA  =  2;
  parameter uopSTD  =  3;
  parameter uopLUI  =  4;

  parameter uopADDI =  5;
  parameter uopANDI =  6;
  parameter uopORI  =  7;
  parameter uopXORI =  8;
  parameter uopSLTI =  9;
  parameter uopSLTIU= 10;
  parameter uopSLLI = 11;
  parameter uopSRAI = 12;
  parameter uopSRLI = 13;

  parameter uopSLL  = 14;
  parameter uopADD  = 15;
  parameter uopSUB  = 16;
  parameter uopSLT  = 17;
  parameter uopSLTU = 18;
  parameter uopAND  = 19;
  parameter uopOR   = 20;
  parameter uopXOR  = 21;
  parameter uopSRA  = 22;
  parameter uopSRL  = 23;

  parameter uopBEQ  = 24;
  parameter uopBNE  = 25;
  parameter uopBGE  = 26;
  parameter uopBGEU = 27;
  parameter uopBLT  = 28;
  parameter uopBLTU = 29;
  parameter uopCSRRW= 30;
  parameter uopCSRRS= 31;
  parameter uopCSRRC= 32;
  parameter uopCSRRWI=33;
  parameter uopCSRRSI=34;
  parameter uopCSRRCI=35;

  parameter uopJ    = 36;
  parameter uopJAL  = 37;
  parameter uopJALR = 38;
  parameter uopAUIPC= 39;

  parameter uopCFLSH= 41;
  parameter uopFENCE= 42;
  parameter uopADDIW= 43;
  parameter uopADDW = 44;
  parameter uopSUBW = 45;
  parameter uopSLLIW= 46;
  parameter uopSLLW = 47;
  parameter uopSRAIW= 48;
  parameter uopSRAW = 49;
  parameter uopSRLIW= 50;
  parameter uopSRLW = 51;
  parameter uopMUL  = 52;
  parameter uopMULH = 53;
  parameter uopMULHU= 54;
  parameter uopMULHSU=55;
  parameter uopMULW = 56;
  parameter uopDIV  = 57;
  parameter uopDIVU = 58;
  parameter uopREM  = 59;
  parameter uopREMU = 60;
  parameter uopDIVW = 61;
  parameter uopDIVUW= 62;
  parameter uopREMW = 63;
  parameter uopREMUW= 64;
  parameter uopFENCEI    =  65;
  parameter uopAMO_AG    =  67;

  parameter uopFMV_W_X   =  68;
  parameter uopFMV_D_X   =  69;
  parameter uopFMV_X_W   =  70;
  parameter uopFMV_X_D   =  71;

  parameter uopFSGNJ_S   =  72;
  parameter uopFSGNJ_D   =  73;

  parameter uopFCVT_S_D  =  74;
  parameter uopFCVT_D_S  =  75;

  parameter uopFCVT_S_X  =  76;
  parameter uopFCVT_D_X  =  77;

  parameter uopFCVT_X_S  =  78;
  parameter uopFCVT_X_D  =  79;

  parameter uopCMPR_S    =  80;
  parameter uopCMPR_D    =  81;

  parameter uopFCLASS_S  =  82;
  parameter uopFCLASS_D  =  83;

  parameter uopFMINMAX_S =  84;
  parameter uopFMINMAX_D =  85;

  parameter uopFADD_S    =  87;
  parameter uopFSUB_S    =  88;
  parameter uopFMUL_S    =  89;
  parameter uopFADD_D    =  90;
  parameter uopFSUB_D    =  91;
  parameter uopFMUL_D    =  92;

  parameter uopFMADD_S   =  93;
  parameter uopFMSUB_S   =  94;
  parameter uopFNMADD_S  =  95;
  parameter uopFNMSUB_S  =  96;
  parameter uopFMADD_D   =  97;
  parameter uopFMSUB_D   =  98;
  parameter uopFNMADD_D  =  99;
  parameter uopFNMSUB_D  = 100;

  parameter uopFDIV_S    = 101;
  parameter uopFDIV_D    = 102;
  parameter uopFSQRT_S   = 103;
  parameter uopFSQRT_D   = 104;

  parameter uopWFI       = 105;
  parameter uopERET      = 106;
  parameter uopSFENCE    = 107;

  parameter uopROCC      = 108;

  parameter uopMOV       = 109;

  parameter IQT_INT = 'd1;
  parameter IQT_MEM = 'd2;
  parameter IQT_FP = 'd4;
  parameter IQT_MFP = 'd6;

  parameter FU_X   =  10'bx;
  parameter FU_ALU =   1;
  parameter FU_JMP =   2;
  parameter FU_MEM =   4;
  parameter FU_MUL =   8;
  parameter FU_DIV =  16;
  parameter FU_CSR =  32;
  parameter FU_FPU =  64;
  parameter FU_FDV = 128;
  parameter FU_I2F = 256;
  parameter FU_F2I = 512;
  parameter FU_F2IMEM = 516;

  parameter RT_FIX = 'd0;
  parameter RT_FLT = 'd1;
  parameter RT_PAS = 'd3;
  parameter RT_X = 'd2;

  parameter IS_S   = 1;
  parameter IS_B   = 2;
  parameter IS_U   = 3;
  parameter IS_J   = 4;
  parameter IS_X   = 3'bxxx;
  parameter IS_I = 0;
  
  parameter M_X       = 'b00000;
  parameter M_XRD     = 'b00000;
  parameter M_XWR     = 'b00001;
  parameter M_PFR     = 'b00010;
  parameter M_PFW     = 'b00011;
  parameter M_XA_SWAP = 'b00100;
  parameter M_FLUSH_ALL = 'b00101;
  parameter M_XLR     = 'b00110;
  parameter M_XSC     = 'b00111;
  parameter M_XA_ADD  = 'b01000;
  parameter M_XA_XOR  = 'b01001;
  parameter M_XA_OR   = 'b01010;
  parameter M_XA_AND  = 'b01011;
  parameter M_XA_MIN  = 'b01100;
  parameter M_XA_MAX  = 'b01101;
  parameter M_XA_MINU = 'b01110;
  parameter M_XA_MAXU = 'b01111;
  parameter M_FLUSH   = 'b10000;
  parameter M_PWR     = 'b10001;
  parameter M_PRODUCE = 'b10010;
  parameter M_CLEAN   = 'b10011;
  parameter M_SFENCE  = 'b10100;
  parameter M_HFENCEV = 'b10101;
  parameter M_HFENCEG = 'b10110;
  parameter M_WOK     = 'b10111;
  parameter M_HLVX    = 'b10000;

  parameter CSR_N  = 'd0;
  parameter CSR_R = 'd2;
  parameter CSR_I = 'd4;
  parameter CSR_W = 'd5;
  parameter CSR_S = 'd6;
  parameter CSR_C = 'd7;
  
  parameter UOPC_SZ = 'd7;
  parameter IQT_SZ = 'd3;
  parameter FUC_SZ = 'd10;
  parameter IMM_W = 'd3;
  parameter M_SZ = 'd5;

  typedef struct {bit legal, fp_val, fp_single;
          bit [UOPC_SZ-1:0] uopc;
          bit [IQT_SZ-1:0] iq_type;
          bit [FUC_SZ-1:0] fu_code;
          bit [1:0] dst_type;
          bit [1:0] rs1_type;
          bit [1:0] rs2_type;
          bit frs3_en;
          bit [IMM_W-1:0] imm_sel;
          bit uses_ldq, uses_stq, is_amo, is_fence, is_fencei; //last 2 not match
          bit [M_SZ-1:0] mem_cmd;
          bit [1:0] wakeup_delay; //not match
          bit bypassable, is_br, is_sys_pc2epc, inst_unique, flush_on_commit;
          bit [2:0] csr_cmd;
          bit [UOPC_SZ-1:0] uopc_sfb_active;}
  decode_ctrl_sig_s;

  //decode_ctrl_sig_s LW_struct      = '{Y, N, X, uopLD   , IQT_MEM, FU_MEM , RT_FIX, RT_FIX, RT_X  , N, IS_I, Y, N, N, N, N, M_XRD, 3, N, N, N, N, N, CSR_N, , uopLD};
  //decode_ctrl_sig_s LH_struct      = '{Y, N, X, uopLD   , IQT_MEM, FU_MEM , RT_FIX, RT_FIX, RT_X  , N, IS_I, Y, N, N, N, N, M_XRD, 3, N, N, N, N, N, CSR_N, , uopLD};
  //decode_ctrl_sig_s LHU_struct     = '{Y, N, X, uopLD   , IQT_MEM, FU_MEM , RT_FIX, RT_FIX, RT_X  , N, IS_I, Y, N, N, N, N, M_XRD, 3, N, N, N, N, N, CSR_N, , uopLD};
  //decode_ctrl_sig_s LB_struct      = '{Y, N, X, uopLD   , IQT_MEM, FU_MEM , RT_FIX, RT_FIX, RT_X  , N, IS_I, Y, N, N, N, N, M_XRD, 3, N, N, N, N, N, CSR_N, , uopLD};
  //decode_ctrl_sig_s LBU_struct     = '{Y, N, X, uopLD   , IQT_MEM, FU_MEM , RT_FIX, RT_FIX, RT_X  , N, IS_I, Y, N, N, N, N, M_XRD, 3, N, N, N, N, N, CSR_N, , uopLD};

  //start here is my code

  //RV32I
  decode_ctrl_sig_s LUI_struct      = '{Y, N, X, uopLUI  , IQT_INT, FU_ALU , RT_FIX, RT_X  , RT_X  , N, IS_U, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopLUI};
  decode_ctrl_sig_s AUIPC_struct    = '{Y, N, X, uopAUIPC, IQT_INT, FU_JMP , RT_FIX, RT_X  , RT_X  , N, IS_U, N, N, N, N, N, M_X  , 1 , N, N, N, N, N, CSR_N, uopAUIPC};
  decode_ctrl_sig_s JAL_struct      = '{Y, N, X, uopJAL  , IQT_INT, FU_JMP , RT_FIX, RT_X  , RT_X  , N, IS_J, N, N, N, N, N, M_X  , 1 , N, N, N, N, N, CSR_N, uopJAL};
  decode_ctrl_sig_s JALR_struct     = '{Y, N, X, uopJALR , IQT_INT, FU_JMP , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1 , N, N, N, N, N, CSR_N, uopJALR};
  decode_ctrl_sig_s BEQ_struct      = '{Y, N, X, uopBEQ  , IQT_INT, FU_ALU , RT_X  , RT_FIX, RT_FIX, N, IS_B, N, N, N, N, N, M_X  , 0 , N, Y, N, N, N, CSR_N, uopBEQ};
  decode_ctrl_sig_s BNE_struct      = '{Y, N, X, uopBNE  , IQT_INT, FU_ALU , RT_X  , RT_FIX, RT_FIX, N, IS_B, N, N, N, N, N, M_X  , 0 , N, Y, N, N, N, CSR_N, uopBNE};
  decode_ctrl_sig_s BLT_struct      = '{Y, N, X, uopBLT  , IQT_INT, FU_ALU , RT_X  , RT_FIX, RT_FIX, N, IS_B, N, N, N, N, N, M_X  , 0 , N, Y, N, N, N, CSR_N, uopBLT};
  decode_ctrl_sig_s BGE_struct      = '{Y, N, X, uopBGE  , IQT_INT, FU_ALU , RT_X  , RT_FIX, RT_FIX, N, IS_B, N, N, N, N, N, M_X  , 0 , N, Y, N, N, N, CSR_N, uopBGE};
  decode_ctrl_sig_s BLTU_struct     = '{Y, N, X, uopBLTU , IQT_INT, FU_ALU , RT_X  , RT_FIX, RT_FIX, N, IS_B, N, N, N, N, N, M_X  , 0 , N, Y, N, N, N, CSR_N, uopBLTU};
  decode_ctrl_sig_s BGEU_struct     = '{Y, N, X, uopBGEU , IQT_INT, FU_ALU , RT_X  , RT_FIX, RT_FIX, N, IS_B, N, N, N, N, N, M_X  , 0 , N, Y, N, N, N, CSR_N, uopBGEU};
  decode_ctrl_sig_s LB_struct       = '{Y, N, X, uopLD   , IQT_MEM, FU_MEM , RT_FIX, RT_FIX, RT_X  , N, IS_I, Y, N, N, N, N, M_XRD, 3 , N, N, N, N, N, CSR_N, uopLD};
  decode_ctrl_sig_s LH_struct       = '{Y, N, X, uopLD   , IQT_MEM, FU_MEM , RT_FIX, RT_FIX, RT_X  , N, IS_I, Y, N, N, N, N, M_XRD, 3 , N, N, N, N, N, CSR_N, uopLD};
  decode_ctrl_sig_s LW_struct       = '{Y, N, X, uopLD   , IQT_MEM, FU_MEM , RT_FIX, RT_FIX, RT_X  , N, IS_I, Y, N, N, N, N, M_XRD, 3 , N, N, N, N, N, CSR_N, uopLD};
  decode_ctrl_sig_s LBU_struct      = '{Y, N, X, uopLD   , IQT_MEM, FU_MEM , RT_FIX, RT_FIX, RT_X  , N, IS_I, Y, N, N, N, N, M_XRD, 3 , N, N, N, N, N, CSR_N, uopLD};
  decode_ctrl_sig_s LHU_struct      = '{Y, N, X, uopLD   , IQT_MEM, FU_MEM , RT_FIX, RT_FIX, RT_X  , N, IS_I, Y, N, N, N, N, M_XRD, 3 , N, N, N, N, N, CSR_N, uopLD};
  decode_ctrl_sig_s SB_struct       = '{Y, N, X, uopSTA  , IQT_MEM, FU_MEM , RT_X  , RT_FIX, RT_FIX, N, IS_S, N, Y, N, N, N, M_XWR, 0 , N, N, N, N, N, CSR_N, uopSTA};
  decode_ctrl_sig_s SH_struct       = '{Y, N, X, uopSTA  , IQT_MEM, FU_MEM , RT_X  , RT_FIX, RT_FIX, N, IS_S, N, Y, N, N, N, M_XWR, 0 , N, N, N, N, N, CSR_N, uopSTA};
  decode_ctrl_sig_s SW_struct       = '{Y, N, X, uopSTA  , IQT_MEM, FU_MEM , RT_X  , RT_FIX, RT_FIX, N, IS_S, N, Y, N, N, N, M_XWR, 0 , N, N, N, N, N, CSR_N, uopSTA};
  decode_ctrl_sig_s ADDI_struct     = '{Y, N, X, uopADDI , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopADDI};
  decode_ctrl_sig_s SLTI_struct     = '{Y, N, X, uopSLTI , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSLTI};
  decode_ctrl_sig_s SLTIU_struct    = '{Y, N, X, uopSLTIU, IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSLTIU};
  decode_ctrl_sig_s XORI_struct     = '{Y, N, X, uopXORI , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopXORI};
  decode_ctrl_sig_s ORI_struct      = '{Y, N, X, uopORI  , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopORI};
  decode_ctrl_sig_s ANDI_struct     = '{Y, N, X, uopANDI , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopANDI};
  decode_ctrl_sig_s SLLI32_struct   = '{Y, N, X, uopSLLI , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSLLI};
  decode_ctrl_sig_s SRLI32_struct   = '{Y, N, X, uopSRLI , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSRLI};
  decode_ctrl_sig_s SRAI32_struct   = '{Y, N, X, uopSRAI , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSRAI};
  decode_ctrl_sig_s ADD_struct      = '{Y, N, X, uopADD  , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopADD};
  decode_ctrl_sig_s SUB_struct      = '{Y, N, X, uopSUB  , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSUB};
  decode_ctrl_sig_s SLL_struct      = '{Y, N, X, uopSLL  , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSLL};
  decode_ctrl_sig_s SLT_struct      = '{Y, N, X, uopSLT  , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSLT};
  decode_ctrl_sig_s SLTU_struct     = '{Y, N, X, uopSLTU , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSLTU};
  decode_ctrl_sig_s XOR_struct      = '{Y, N, X, uopXOR  , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopXOR};
  decode_ctrl_sig_s SRL_struct      = '{Y, N, X, uopSRL  , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSRL};
  decode_ctrl_sig_s SRA_struct      = '{Y, N, X, uopSRA  , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSRA};
  decode_ctrl_sig_s OR_struct       = '{Y, N, X, uopOR   , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopOR};
  decode_ctrl_sig_s AND_struct      = '{Y, N, X, uopAND  , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopAND};
  decode_ctrl_sig_s FENCE_struct    = '{Y, N, X, uopFENCE, IQT_INT, FU_MEM , RT_X  , RT_X  , RT_X  , N, IS_X, N, Y, N, Y, N, M_X  , 0 , N, N, N, Y, Y, CSR_N, uopFENCE};
  decode_ctrl_sig_s ECALL_struct    = '{Y, N, X, uopERET  ,IQT_INT, FU_CSR , RT_X  , RT_X  , RT_X  , N, IS_I, N, N, N, N, N, M_X  , 0 , N, N, Y, Y, Y, CSR_I, uopERET};
  decode_ctrl_sig_s EBREAK_struct   = '{Y, N, X, uopERET  ,IQT_INT, FU_CSR , RT_X  , RT_X  , RT_X  , N, IS_I, N, N, N, N, N, M_X  , 0 , N, N, Y, Y, Y, CSR_I, uopERET};

  //RV64I
  decode_ctrl_sig_s LWU_struct      = '{Y, N, X, uopLD   , IQT_MEM, FU_MEM , RT_FIX, RT_FIX, RT_X  , N, IS_I, Y, N, N, N, N, M_XRD, 3 , N, N, N, N, N, CSR_N, uopLD};
  decode_ctrl_sig_s LD_struct       = '{Y, N, X, uopLD   , IQT_MEM, FU_MEM , RT_FIX, RT_FIX, RT_X  , N, IS_I, Y, N, N, N, N, M_XRD, 3 , N, N, N, N, N, CSR_N, uopLD};
  decode_ctrl_sig_s SD_struct       = '{Y, N, X, uopSTA  , IQT_MEM, FU_MEM , RT_X  , RT_FIX, RT_FIX, N, IS_S, N, Y, N, N, N, M_XWR, 0 , N, N, N, N, N, CSR_N, uopSTA};
  decode_ctrl_sig_s SLLI_struct     = '{Y, N, X, uopSLLI , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSLLI};
  decode_ctrl_sig_s SRLI_struct     = '{Y, N, X, uopSRLI , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSRLI};
  decode_ctrl_sig_s SRAI_struct     = '{Y, N, X, uopSRAI , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSRAI};
  decode_ctrl_sig_s ADDIW_struct    = '{Y, N, X, uopADDIW, IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopADDIW};
  decode_ctrl_sig_s SLLIW_struct    = '{Y, N, X, uopSLLIW, IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSLLIW};
  decode_ctrl_sig_s SRLIW_struct    = '{Y, N, X, uopSRLIW, IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSRLIW};
  decode_ctrl_sig_s SRAIW_struct    = '{Y, N, X, uopSRAIW, IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSRAIW};
  decode_ctrl_sig_s ADDW_struct     = '{Y, N, X, uopADDW , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopADDW};
  decode_ctrl_sig_s SUBW_struct     = '{Y, N, X, uopSUBW , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSUBW};
  decode_ctrl_sig_s SLLW_struct     = '{Y, N, X, uopSLLW , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSLLW};
  decode_ctrl_sig_s SRLW_struct     = '{Y, N, X, uopSRLW , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSRLW};
  decode_ctrl_sig_s SRAW_struct     = '{Y, N, X, uopSRAW , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1 , Y, N, N, N, N, CSR_N, uopSRAW};

  //RV32M
  decode_ctrl_sig_s MUL_struct      = '{Y, N, X, uopMUL  , IQT_INT, FU_MUL , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0 , N, N, N, N, N, CSR_N, uopMUL};
  decode_ctrl_sig_s MULH_struct     = '{Y, N, X, uopMULH , IQT_INT, FU_MUL , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0 , N, N, N, N, N, CSR_N, uopMULH};
  decode_ctrl_sig_s MULHSU_struct   = '{Y, N, X, uopMULHSU,IQT_INT, FU_MUL , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0 , N, N, N, N, N, CSR_N, uopMULHSU};
  decode_ctrl_sig_s MULHU_struct    = '{Y, N, X, uopMULHU, IQT_INT, FU_MUL , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0 , N, N, N, N, N, CSR_N, uopMULHU};
  decode_ctrl_sig_s DIV_struct      = '{Y, N, X, uopDIV  , IQT_INT, FU_DIV , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0 , N, N, N, N, N, CSR_N, uopDIV};
  decode_ctrl_sig_s DIVU_struct     = '{Y, N, X, uopDIVU , IQT_INT, FU_DIV , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0 , N, N, N, N, N, CSR_N, uopDIVU};
  decode_ctrl_sig_s REM_struct      = '{Y, N, X, uopREM  , IQT_INT, FU_DIV , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0 , N, N, N, N, N, CSR_N, uopREM};
  decode_ctrl_sig_s REMU_struct     = '{Y, N, X, uopREMU , IQT_INT, FU_DIV , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0 , N, N, N, N, N, CSR_N, uopREMU};

  //RV64M
  decode_ctrl_sig_s MULW_struct     = '{Y, N, X, uopMULW , IQT_INT, FU_MUL , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0 , N, N, N, N, N, CSR_N, uopMULW};
  decode_ctrl_sig_s DIVW_struct     = '{Y, N, X, uopDIVW , IQT_INT, FU_DIV , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0 , N, N, N, N, N, CSR_N, uopDIVW};
  decode_ctrl_sig_s DIVUW_struct    = '{Y, N, X, uopDIVUW, IQT_INT, FU_DIV , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0 , N, N, N, N, N, CSR_N, uopDIVUW};
  decode_ctrl_sig_s REMW_struct     = '{Y, N, X, uopREMW , IQT_INT, FU_DIV , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0 , N, N, N, N, N, CSR_N, uopREMW};
  decode_ctrl_sig_s REMUW_struct    = '{Y, N, X, uopREMUW, IQT_INT, FU_DIV , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0 , N, N, N, N, N, CSR_N, uopREMUW};

  //RV32A
  decode_ctrl_sig_s LR_W_struct      = '{Y, N, X, uopLD    , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_X  , N, IS_X, Y, N, N, N, N, M_XLR   , 0 ,N, N, N, Y, Y, CSR_N, uopLD};
  decode_ctrl_sig_s SC_W_struct      = '{Y, N, X, uopAMO_AG, IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XSC   , 0 ,N, N, N, Y, Y, CSR_N, uopAMO_AG};
  decode_ctrl_sig_s AMOSWAP_W_struct = '{Y, N, X, uopAMO_AG, IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_SWAP,0 ,N, N, N, Y, Y, CSR_N, uopAMO_AG};
  decode_ctrl_sig_s AMOADD_W_struct  = '{Y, N, X, uopAMO_AG, IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_ADD, 0 ,N, N, N, Y, Y, CSR_N, uopAMO_AG};
  decode_ctrl_sig_s AMOXOR_W_struct  = '{Y, N, X, uopAMO_AG, IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_XOR, 0 ,N, N, N, Y, Y, CSR_N, uopAMO_AG};
  decode_ctrl_sig_s AMOAND_W_struct  = '{Y, N, X, uopAMO_AG, IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_AND, 0 ,N, N, N, Y, Y, CSR_N, uopAMO_AG};
  decode_ctrl_sig_s AMOOR_W_struct   = '{Y, N, X, uopAMO_AG, IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_OR,  0 ,N, N, N, Y, Y, CSR_N, uopAMO_AG};
  decode_ctrl_sig_s AMOMIN_W_struct  = '{Y, N, X, uopAMO_AG, IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_MIN, 0 ,N, N, N, Y, Y, CSR_N, uopAMO_AG};
  decode_ctrl_sig_s AMOMAX_W_struct  = '{Y, N, X, uopAMO_AG, IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_MAX, 0 ,N, N, N, Y, Y, CSR_N, uopAMO_AG};
  decode_ctrl_sig_s AMOMINU_W_struct = '{Y, N, X, uopAMO_AG, IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_MINU,0 ,N, N, N, Y, Y, CSR_N, uopAMO_AG};
  decode_ctrl_sig_s AMOMAXU_W_struct = '{Y, N, X, uopAMO_AG, IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_MAXU,0 ,N, N, N, Y, Y, CSR_N, uopAMO_AG};

  //RV64A
  decode_ctrl_sig_s LR_D_struct      = '{Y, N, X, uopLD    , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_X  , N, IS_X, Y, N, N, N, N, M_XLR   , 0 ,N, N, N, Y, Y, CSR_N, uopLD};
  decode_ctrl_sig_s SC_D_struct      = '{Y, N, X, uopAMO_AG, IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XSC   , 0 ,N, N, N, Y, Y, CSR_N, uopAMO_AG};
  decode_ctrl_sig_s AMOSWAP_D_struct = '{Y, N, X, uopAMO_AG, IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_SWAP,0 ,N, N, N, Y, Y, CSR_N, uopAMO_AG};
  decode_ctrl_sig_s AMOADD_D_struct  = '{Y, N, X, uopAMO_AG, IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_ADD, 0 ,N, N, N, Y, Y, CSR_N, uopAMO_AG};
  decode_ctrl_sig_s AMOXOR_D_struct  = '{Y, N, X, uopAMO_AG, IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_XOR, 0 ,N, N, N, Y, Y, CSR_N, uopAMO_AG};
  decode_ctrl_sig_s AMOAND_D_struct  = '{Y, N, X, uopAMO_AG, IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_AND, 0 ,N, N, N, Y, Y, CSR_N, uopAMO_AG};
  decode_ctrl_sig_s AMOOR_D_struct   = '{Y, N, X, uopAMO_AG, IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_OR,  0 ,N, N, N, Y, Y, CSR_N, uopAMO_AG};
  decode_ctrl_sig_s AMOMIN_D_struct  = '{Y, N, X, uopAMO_AG, IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_MIN, 0 ,N, N, N, Y, Y, CSR_N, uopAMO_AG};
  decode_ctrl_sig_s AMOMAX_D_struct  = '{Y, N, X, uopAMO_AG, IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_MAX, 0 ,N, N, N, Y, Y, CSR_N, uopAMO_AG};
  decode_ctrl_sig_s AMOMINU_D_struct = '{Y, N, X, uopAMO_AG, IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_MINU,0 ,N, N, N, Y, Y, CSR_N, uopAMO_AG};
  decode_ctrl_sig_s AMOMAXU_D_struct = '{Y, N, X, uopAMO_AG, IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_MAXU,0 ,N, N, N, Y, Y, CSR_N, uopAMO_AG};

  //..//
endpackage
