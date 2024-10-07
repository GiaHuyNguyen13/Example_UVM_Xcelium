package package_decode;

    // convert to string
    function string convert2str(bit a);
        return $sformatf("Instruction=%0d", a);
    endfunction

    // localparam
        // Short forward branch active?
            localparam IS_SFB_ACTIVE = 1; // choose between 0 and 1
        // number of generated instruction
            localparam MIN_NUM = 10000;
            localparam MAX_NUM = 10000;
        // extension
            localparam RV32I       = 0;
            localparam RV64I       = 1;
            localparam RV32M       = 2;
            localparam RV64M       = 3;
            localparam RV32A       = 4;
            localparam RV64A       = 5;
        // RV32 Types
            localparam RV32I_RType = 0;
            localparam RV32I_IType = 1;
            localparam RV32I_SType = 2;
            localparam RV32I_BType = 3;
            localparam RV32I_UType = 4;
            localparam RV32I_JType = 5;
        // RV64 Types
            localparam RV64I_RType = 0;
            localparam RV64I_IType = 1;
            localparam RV64I_SType = 2;
            localparam RV64I_RType_I = 0;
            localparam RV64I_RType_W = 1;
    
//my code for scoreboard
    //RV32I

          //LUI
                localparam MASK_LUI = 32'h0000007f;
                localparam EXPT_LUI = 32'h00000037;

          //AUIPC
                localparam MASK_AUIPC = 32'h0000007f;
                localparam EXPT_AUIPC = 32'h00000017;

          //JAL
                localparam MASK_JAL = 32'h0000007f;
                localparam EXPT_JAL = 32'h0000006f;

          //JALR
                localparam MASK_JALR = 32'h0000707f;
                localparam EXPT_JALR = 32'h00000067;

          //BEQ
                localparam MASK_BEQ = 32'h0000707f;
                localparam EXPT_BEQ = 32'h00000063;

          //BNE
                localparam MASK_BNE = 32'h0000707f;
                localparam EXPT_BNE = 32'h00001063;

          //BLT
                localparam MASK_BLT = 32'h0000707f;
                localparam EXPT_BLT = 32'h00004063;

          //BGE
                localparam MASK_BGE = 32'h0000707f;
                localparam EXPT_BGE = 32'h00005063;

          //BLTU
                localparam MASK_BLTU = 32'h0000707f;
                localparam EXPT_BLTU = 32'h00006063;

          //BGEU
                localparam MASK_BGEU = 32'h0000707f;
                localparam EXPT_BGEU = 32'h00007063;

          //LB
                localparam MASK_LB = 32'h0000707f;
                localparam EXPT_LB = 32'h00000003;

          //LH
                localparam MASK_LH = 32'h0000707f;
                localparam EXPT_LH = 32'h00001003;

          //LW
                localparam MASK_LW = 32'h0000707f;
                localparam EXPT_LW = 32'h00002003;

          //LBU
                localparam MASK_LBU = 32'h0000707f;
                localparam EXPT_LBU = 32'h00004003;

          //LHU
                localparam MASK_LHU = 32'h0000707f;
                localparam EXPT_LHU = 32'h00005003;

          //SB
                localparam MASK_SB = 32'h0000707f;
                localparam EXPT_SB = 32'h00000023;

          //SH
                localparam MASK_SH = 32'h0000707f;
                localparam EXPT_SH = 32'h00001023;

          //SW
                localparam MASK_SW = 32'h0000707f;
                localparam EXPT_SW = 32'h00002023;

          //ADDI
                localparam MASK_ADDI = 32'h0000707f;
                localparam EXPT_ADDI = 32'h00000013;

          //SLTI
                localparam MASK_SLTI = 32'h0000707f;
                localparam EXPT_SLTI = 32'h00002013;

          //SLTIU
                localparam MASK_SLTIU = 32'h0000707f;
                localparam EXPT_SLTIU = 32'h00003013;

          //XORI
                localparam MASK_XORI = 32'h0000707f;
                localparam EXPT_XORI = 32'h00004013;

          //ORI
                localparam MASK_ORI = 32'h0000707f;
                localparam EXPT_ORI = 32'h00006013;

          //ANDI
                localparam MASK_ANDI = 32'h0000707f;
                localparam EXPT_ANDI = 32'h00007013;

          //SLLI32
                localparam MASK_SLLI32 = 32'hfe00707f;
                localparam EXPT_SLLI32 = 32'h00001013;

          //SRLI32
                localparam MASK_SRLI32 = 32'hfe00707f;
                localparam EXPT_SRLI32 = 32'h00005013;

          //SRAI32
                localparam MASK_SRAI32 = 32'hfe00707f;
                localparam EXPT_SRAI32 = 32'h40005013;

          //ADD
                localparam MASK_ADD = 32'hfe00707f;
                localparam EXPT_ADD = 32'h00000033;

          //SUB
                localparam MASK_SUB = 32'hfe00707f;
                localparam EXPT_SUB = 32'h40000033;

          //SLL
                localparam MASK_SLL = 32'hfe00707f;
                localparam EXPT_SLL = 32'h00001033;

          //SLT
                localparam MASK_SLT = 32'hfe00707f;
                localparam EXPT_SLT = 32'h00002033;

          //SLTU
                localparam MASK_SLTU = 32'hfe00707f;
                localparam EXPT_SLTU = 32'h00003033;

          //XOR
                localparam MASK_XOR = 32'hfe00707f;
                localparam EXPT_XOR = 32'h00004033;

          //SRL
                localparam MASK_SRL = 32'hfe00707f;
                localparam EXPT_SRL = 32'h00005033;

          //SRA
                localparam MASK_SRA = 32'hfe00707f;
                localparam EXPT_SRA = 32'h40005033;

          //OR
                localparam MASK_OR = 32'hfe00707f;
                localparam EXPT_OR = 32'h00006033;

          //AND
                localparam MASK_AND = 32'hfe00707f;
                localparam EXPT_AND = 32'h00007033;

          //FENCE
                localparam MASK_FENCE = 32'h0000707f;
                localparam EXPT_FENCE = 32'h0000000f;

          //ECALL
                localparam MASK_ECALL = 32'hffffffff;
                localparam EXPT_ECALL = 32'h00000073;

          //EBREAK
                localparam MASK_EBREAK = 32'hffffffff;
                localparam EXPT_EBREAK = 32'h00100073;

    //RV64I  

          //LWU
                localparam MASK_LWU = 32'h0000707f;
                localparam EXPT_LWU = 32'h00006003;

          //LD
                localparam MASK_LD = 32'h0000707f;
                localparam EXPT_LD = 32'h00003003;

          //SD
                localparam MASK_SD = 32'h0000707f;
                localparam EXPT_SD = 32'h00003023;

          //SLLI
                localparam MASK_SLLI = 32'hfc00707f;
                localparam EXPT_SLLI = 32'h00001013;

          //SRLI
                localparam MASK_SRLI = 32'hfc00707f;
                localparam EXPT_SRLI = 32'h00005013;

          //SRAI
                localparam MASK_SRAI = 32'hfc00707f;
                localparam EXPT_SRAI = 32'h40005013;

          //ADDIW
                localparam MASK_ADDIW = 32'h0000707f;
                localparam EXPT_ADDIW = 32'h0000001b;

          //SLLIW
                localparam MASK_SLLIW = 32'hfe00707f;
                localparam EXPT_SLLIW = 32'h0000101b;

          //SRLIW
                localparam MASK_SRLIW = 32'hfe00707f;
                localparam EXPT_SRLIW = 32'h0000501b;

          //SRAIW
                localparam MASK_SRAIW = 32'hfe00707f;
                localparam EXPT_SRAIW = 32'h4000501b;

          //ADDW
                localparam MASK_ADDW = 32'hfe00707f;
                localparam EXPT_ADDW = 32'h0000003b;

          //SUBW
                localparam MASK_SUBW = 32'hfe00707f;
                localparam EXPT_SUBW = 32'h4000003b;

          //SLLW
                localparam MASK_SLLW = 32'hfe00707f;
                localparam EXPT_SLLW = 32'h0000103b;

          //SRLW
                localparam MASK_SRLW = 32'hfe00707f;
                localparam EXPT_SRLW = 32'h0000503b;

          //SRAW
                localparam MASK_SRAW = 32'hfe00707f;
                localparam EXPT_SRAW = 32'h4000503b;

    //RV32M
          
          //MUL
                localparam MASK_MUL = 32'hfe00707f;
                localparam EXPT_MUL = 32'h02000033;

          //MULH
                localparam MASK_MULH = 32'hfe00707f;
                localparam EXPT_MULH = 32'h02001033;

          //MULHSU
                localparam MASK_MULHSU = 32'hfe00707f;
                localparam EXPT_MULHSU = 32'h02002033;

          //MULHU
                localparam MASK_MULHU = 32'hfe00707f;
                localparam EXPT_MULHU = 32'h02003033;

          //DIV
                localparam MASK_DIV = 32'hfe00707f;
                localparam EXPT_DIV = 32'h02004033;

          //DIVU
                localparam MASK_DIVU = 32'hfe00707f;
                localparam EXPT_DIVU = 32'h02005033;

          //REM
                localparam MASK_REM = 32'hfe00707f;
                localparam EXPT_REM = 32'h02006033;

          //REMU
                localparam MASK_REMU = 32'hfe00707f;
                localparam EXPT_REMU = 32'h02007033;

    //RV64M

          //MULW
                localparam MASK_MULW = 32'hfe00707f;
                localparam EXPT_MULW = 32'h0200003b;

          //DIVW
                localparam MASK_DIVW = 32'hfe00707f;
                localparam EXPT_DIVW = 32'h0200403b;

          //DIVUW
                localparam MASK_DIVUW = 32'hfe00707f;
                localparam EXPT_DIVUW = 32'h0200503b;

          //REMW
                localparam MASK_REMW = 32'hfe00707f;
                localparam EXPT_REMW = 32'h0200603b;

          //REMUW
                localparam MASK_REMUW = 32'hfe00707f;
                localparam EXPT_REMUW = 32'h0200703b;

    //RV32A

          //LR_W
                localparam MASK_LR_W = 32'hf9f0707f;
                localparam EXPT_LR_W = 32'h1000202f;

          //SC_W
                localparam MASK_SC_W = 32'hf800707f;
                localparam EXPT_SC_W = 32'h1800202f;

          //AMOSWAP_W
                localparam MASK_AMOSWAP_W = 32'hf800707f;
                localparam EXPT_AMOSWAP_W = 32'h0800202f;

          //AMOADD_W
                localparam MASK_AMOADD_W = 32'hf800707f;
                localparam EXPT_AMOADD_W = 32'h0000202f;

          //AMOXOR_W
                localparam MASK_AMOXOR_W = 32'hf800707f;
                localparam EXPT_AMOXOR_W = 32'h2000202f;

          //AMOAND_W
                localparam MASK_AMOAND_W = 32'hf800707f;
                localparam EXPT_AMOAND_W = 32'h6000202f;

          //AMOOR_W
                localparam MASK_AMOOR_W = 32'hf800707f;
                localparam EXPT_AMOOR_W = 32'h4000202f;

          //AMOMIN_W
                localparam MASK_AMOMIN_W = 32'hf800707f;
                localparam EXPT_AMOMIN_W = 32'h8000202f;

          //AMOMAX_W
                localparam MASK_AMOMAX_W = 32'hf800707f;
                localparam EXPT_AMOMAX_W = 32'ha000202f;

          //AMOMINU_W
                localparam MASK_AMOMINU_W = 32'hf800707f;
                localparam EXPT_AMOMINU_W = 32'hc000202f;

          //AMOMAXU_W
                localparam MASK_AMOMAXU_W = 32'hf800707f;
                localparam EXPT_AMOMAXU_W = 32'he000202f;

    //RV64A

          //LR_D
                localparam MASK_LR_D = 32'hf9f0707f;
                localparam EXPT_LR_D = 32'h1000302F;

          //SC_D
                localparam MASK_SC_D = 32'hf800707f;
                localparam EXPT_SC_D = 32'h1800302f;

          //AMOSWAP_D
                localparam MASK_AMOSWAP_D = 32'hf800707f;
                localparam EXPT_AMOSWAP_D = 32'h0800302f;

          //AMOADD_D
                localparam MASK_AMOADD_D = 32'hf800707f;
                localparam EXPT_AMOADD_D = 32'h0000302f;

          //AMOXOR_D
                localparam MASK_AMOXOR_D = 32'hf800707f;
                localparam EXPT_AMOXOR_D = 32'h2000302f;

          //AMOAND_D
                localparam MASK_AMOAND_D = 32'hf800707f;
                localparam EXPT_AMOAND_D = 32'h6000302f;

          //AMOOR_D
                localparam MASK_AMOOR_D = 32'hf800707f;
                localparam EXPT_AMOOR_D = 32'h4000302f;

          //AMOMIN_D
                localparam MASK_AMOMIN_D = 32'hf800707f;
                localparam EXPT_AMOMIN_D = 32'h8000302f;

          //AMOMAX_D
                localparam MASK_AMOMAX_D = 32'hf800707f;
                localparam EXPT_AMOMAX_D = 32'ha000302f;

          //AMOMINU_D
                localparam MASK_AMOMINU_D = 32'hf800707f;
                localparam EXPT_AMOMINU_D = 32'hc000302f;

          //AMOMAXU_D
                localparam MASK_AMOMAXU_D = 32'hf800707f;
                localparam EXPT_AMOMAXU_D = 32'he000302f;


endpackage
