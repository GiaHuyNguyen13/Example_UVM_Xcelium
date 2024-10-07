// @author: hungnc5
import package_decode::*;
class item extends uvm_sequence_item;
    `uvm_object_utils(item)

    // this is for monitor
    bit rstn;
    bit [31:0] instr; 
    bit [31:0] out_instr;
    bit [2:0] iq_type;
    bit is_br;
    bit bypassable;
    bit [4:0] mem_cmd;
    bit is_fence;
    bit is_fencei;
    bit is_amo;
    bit uses_ldq;
    bit uses_stq;
    bit flush_on_commit;
    bit [6:0] uopc;
    bit [9:0] fu_code;
    bit is_jalr;
    bit is_jal;
    bit [19:0] imm_packed;
    bit [5:0] ldst;
    bit [5:0] lrs1;
    bit [5:0] lrs2;
    bit [5:0] lrs3;
    bit is_unique;
    bit is_sys_pc2epc;
    bit ldst_is_rs1;
    bit ldst_val;
    bit [1:0] dst_rtype;
    bit [1:0] lrs1_rtype;
    bit [1:0] lrs2_rtype;
    bit frs3_en;
    bit fp_val;
    bit [1:0] mem_size;
    bit mem_signed;
    bit exception;

    rand bit io_enq_uop_is_sfb;
    bit io_deq_uop_is_sfb;

    rand bit [63:0] io_interrupt_cause;
    rand bit io_interrupt;

    rand bit io_csr_decode_fp_illegal;
    rand bit io_csr_decode_read_illegal;
    rand bit io_csr_decode_write_illegal;
    rand bit io_csr_decode_write_flush;
    rand bit io_csr_decode_system_illegal;

    rand bit io_enq_uop_xcpt_pf_if;
    rand bit io_enq_uop_xcpt_ae_if;
    rand bit io_enq_uop_bp_debug_if;
    rand bit io_enq_uop_bp_xcpt_if;

    bit [63:0] exc_cause;

    rand bit [31:0] true_random_instr; 

    // random val
        // extension
        rand bit [3:0] extension;
        // rs1, rs2, rd
        rand bit [4:0] rs1; // value from 0 to 31
        rand bit [4:0] rs2; // value from 0 to 31
        rand bit [4:0] rs3; // value from 0 to 31
        rand bit [4:0] rd ; // value from 0 to 31
        // RV32I Base Instruction
            // Types
            rand bit [2:0] RV32I_type;
            // R-Type
            rand bit [6:0] RV32I_RType_opcode;
            rand bit [2:0] RV32I_RType_funct3;
            rand bit [6:0] RV32I_RType_funct7;
            // I-Type
            rand bit [6:0] RV32I_IType_opcode;
            rand bit [2:0] RV32I_IType_funct3;
            rand bit [4:0] RV32I_IType_rs1;
            rand bit [4:0] RV32I_IType_rd;
            rand bit [11:0] RV32I_IType_imm;
            // S-Type
            rand bit [6:0] RV32I_SType_opcode;
            rand bit [2:0] RV32I_SType_funct3;
            rand bit [11:0] RV32I_SType_imm;
            // B-Type
            rand bit [6:0] RV32I_BType_opcode;
            rand bit [2:0] RV32I_BType_funct3;
            rand bit [12:0] RV32I_BType_imm;
            // U-Type
            rand bit [6:0] RV32I_UType_opcode;
            rand bit [31:12] RV32I_UType_imm;
            // J-Type
            rand bit [6:0] RV32I_JType_opcode;
            rand bit [20:1] RV32I_JType_imm;
        // RV64I Base instruction
            // Types
            rand bit [2:0] RV64I_type;
            // R-Type
            rand bit       RV64I_RType_types;
            rand bit [6:0] RV64I_RType_opcode;
            rand bit [2:0] RV64I_RType_funct3;
            rand bit [5:0] RV64I_RType_funct7_I;
            rand bit [6:0] RV64I_RType_funct7_W;
            rand bit [5:0] RV64I_RType_shamt_I;
            rand bit [4:0] RV64I_RType_shamt_W;
            // I-Type
            rand bit [6:0] RV64I_IType_opcode;
            rand bit [2:0] RV64I_IType_funct3;
            rand bit [11:0] RV64I_IType_imm;
            // S-Type
            rand bit [6:0] RV64I_SType_opcode;
            rand bit [2:0] RV64I_SType_funct3;
            rand bit [11:0] RV64I_SType_imm;

        // RV32M Base instruction
            rand bit [6:0] RV32M_opcode;
            rand bit [2:0] RV32M_funct3;
            rand bit [6:0] RV32M_funct7;

        // RV64M Base instruction
            rand bit [6:0] RV64M_opcode;
            rand bit [2:0] RV64M_funct3;
            rand bit [6:0] RV64M_funct7;

        // RV32A Base instruction
            rand bit [6:0] RV32A_opcode;
            rand bit [2:0] RV32A_funct3;
            rand bit [4:0] RV32A_rs2;
            rand bit [1:0] RV32A_aq_rl;
            rand bit [4:0] RV32A_funct7;

        // RV64A Base instruction
            rand bit [6:0] RV64A_opcode;
            rand bit [2:0] RV64A_funct3;
            rand bit [4:0] RV64A_rs2;
            rand bit [1:0] RV64A_aq_rl;
            rand bit [4:0] RV64A_funct7;

    //virtual function string convert2str();
     //   return $sformatf("in=%0d, out=%0d", in, out);
    //endfunction
  
    function new(string name = "item");
        super.new(name);
    endfunction

    // constraint hierarchy
        // extension
            constraint solve_extension { 
                solve extension before   RV32I_type,
                                         RV64I_type,
                                         RV32M_opcode,
                                         RV64M_opcode,
                                         RV32A_opcode,
                                         RV64A_opcode;                             
            }

        // RV32I_Type
            constraint solve_RV32I_type { solve RV32I_type before   RV32I_RType_opcode, 
                                                                    RV32I_IType_opcode,
                                                                    RV32I_SType_opcode,
                                                                    RV32I_BType_opcode,
                                                                    RV32I_UType_opcode,
                                                                    RV32I_JType_opcode ;
            }
            
            // R-Type
            constraint solve_RV32I_RType_opcode { solve RV32I_RType_opcode before   RV32I_RType_funct3, 
                                                                                    RV32I_RType_funct7 ;
            }
            
            constraint solve_RV32I_RType_funct { solve RV32I_RType_funct3 before RV32I_RType_funct7;
            }

            // I-Type
            constraint solve_RV32I_IType_opcode { solve RV32I_IType_opcode before   RV32I_IType_funct3, 
                                                                                    RV32I_IType_rs1,
                                                                                    RV32I_IType_rd,
                                                                                    RV32I_IType_imm ; 
            }

            // S-Type
            constraint solve_RV32I_SType_opcode { solve RV32I_SType_opcode before   RV32I_SType_funct3, 
                                                                                    RV32I_SType_imm ;
            }

            // B-Type
            constraint solve_RV32I_BType_opcode { solve RV32I_BType_opcode before   RV32I_BType_funct3, 
                                                                                    RV32I_BType_imm ;
            }

            // U-Type
            constraint solve_RV32I_UType_opcode { solve RV32I_UType_opcode before RV32I_UType_imm; }

            // J-Type
            constraint solve_RV32I_JType_opcode { solve RV32I_JType_opcode before RV32I_JType_imm; }
    

        // RV64I_Type
            constraint solve_RV64I_type { solve RV64I_type before   RV64I_RType_types, 
                                                                    RV64I_IType_opcode,
                                                                    RV64I_SType_opcode ;
            }

            // R-Type
            constraint solve_RV64I_RType_types { solve RV64I_RType_types before  RV64I_RType_opcode ;
            }
           
            constraint solve_RV64I_RType_opcode { solve RV64I_RType_opcode before   RV64I_RType_funct3, 
                                                                                    RV64I_RType_funct7_I,
                                                                                    RV64I_RType_funct7_W ;
            }
            
            constraint solve_RV64I_RType_funct { solve RV64I_RType_funct3 before   RV64I_RType_funct7_I,
                                                                                   RV64I_RType_funct7_W ;
            }

            // I-Type
            constraint solve_RV64I_IType_opcode { solve RV64I_IType_opcode before   RV64I_IType_funct3,                                                              
                                                                                    RV64I_IType_imm ; 
            }

            // S-Type
            constraint solve_RV64I_SType_opcode { solve RV64I_SType_opcode before   RV64I_SType_funct3, 
                                                                                    RV64I_SType_imm ;
            }
        

        // RV32M
            
            /* NONE */

        // RV64M

            /* NONE */
           
        // RV32A
            constraint c_RV32A_funct7_rs2{
                solve RV32A_funct7 before RV32A_rs2;
            }
        // RV64A
            constraint c_RV64A_funct7_rs2{
                solve RV64A_funct7 before RV64A_rs2;
            }
        
//----------------------------------------------------------------------------------------------------------------------         

    // constraint
        // extension
            constraint c_extension { extension inside { RV32I   , 
                                                        RV64I   ,
                                                        RV32M   ,
                                                        RV64M   ,
                                                        RV32A   ,
                                                        RV64A   };
            }

        // RV32I_type
            // Intruction Type
            constraint c_RV32I_type { RV32I_type inside { RV32I_RType,
                                                          RV32I_IType,
                                                          RV32I_SType,
                                                          RV32I_BType,
                                                          RV32I_UType,
                                                          RV32I_JType
            };
            }

            // opcode 
            constraint c_RV32I_RType_opcode { RV32I_RType_opcode inside {7'b0010011, 7'b0110011};}
            constraint c_RV32I_IType_opcode { RV32I_IType_opcode inside {7'b1100111, 7'b0000011, 7'b0010011, 7'b1110011};}
            constraint c_RV32I_SType_opcode { RV32I_SType_opcode == 7'b0100011;}
            constraint c_RV32I_BType_opcode { RV32I_BType_opcode == 7'b1100011;}
            constraint c_RV32I_UType_opcode { RV32I_UType_opcode inside {7'b0110111, 7'b0010111};}
            constraint c_RV32I_JType_opcode { RV32I_JType_opcode == 7'b1101111;}

            // R-Type
            constraint c_RV32I_RType_funct {
                if(RV32I_RType_opcode == 7'b0010011){
                    RV32I_RType_funct3 inside {3'b001, 3'b101};
                    (RV32I_RType_funct3 == 3'b001) -> RV32I_RType_funct7 == 7'b0000000;
                    (RV32I_RType_funct3 == 3'b101) -> RV32I_RType_funct7 inside {7'b0000000, 7'b0100000};
                }
                else if(RV32I_RType_opcode == 7'b0110011){
                    RV32I_RType_funct3 inside {3'b000, 3'b001, 3'b010, 3'b011, 3'b100, 3'b101, 3'b110, 3'b111};
                    (RV32I_RType_funct3 == 3'b000) -> RV32I_RType_funct7 inside {7'b0000000, 7'b0100000};
                    (RV32I_RType_funct3 == 3'b001) -> RV32I_RType_funct7 == 7'b0000000;
                    (RV32I_RType_funct3 == 3'b010) -> RV32I_RType_funct7 == 7'b0000000;
                    (RV32I_RType_funct3 == 3'b011) -> RV32I_RType_funct7 == 7'b0000000;
                    (RV32I_RType_funct3 == 3'b100) -> RV32I_RType_funct7 == 7'b0000000;
                    (RV32I_RType_funct3 == 3'b101) -> RV32I_RType_funct7 inside {7'b0000000, 7'b0100000};
                    (RV32I_RType_funct3 == 3'b110) -> RV32I_RType_funct7 == 7'b0000000;
                    (RV32I_RType_funct3 == 3'b111) -> RV32I_RType_funct7 == 7'b0000000;
                }
            }

            // I-Type
            constraint c_RV32I_IType_funct {
                if(RV32I_IType_opcode == 7'b1100111){ 
                    RV32I_IType_funct3 == 3'b000;
                }
                else if(RV32I_IType_opcode == 7'b0000011){
                    RV32I_IType_funct3 inside {3'b000, 3'b001, 3'b010, 3'b100, 3'b101};
                }
                else if(RV32I_IType_opcode == 7'b0010011 ){
                    RV32I_IType_funct3 inside {3'b000, 3'b010, 3'b011, 3'b100, 3'b110, 3'b111};
                }
                else if(RV32I_IType_opcode == 7'b1110011){
                    RV32I_IType_rd == 5'b00000;
                    RV32I_IType_funct3 == 3'b000;
                    RV32I_IType_rs1 == 5'b00000;
                    RV32I_IType_imm inside {12'b000000000000, 12'b000000000001};
                }
            }
            // S-Type
            constraint c_RV32I_SType_funct {
                (RV32I_SType_opcode == 7'b0100011) -> RV32I_SType_funct3 inside {3'b000, 3'b001, 3'b010}; 
            }
            // B-Type
            constraint c_RV32I_BType_funct {
                (RV32I_BType_opcode == 7'b1100011) -> RV32I_BType_funct3 inside {3'b000, 3'b001, 3'b100, 3'b101, 3'b110, 3'b111};
            }
            // U-Type
            
                /* NONE */

            // J-Type

                /* NONE */

        // RV64I-Type
            // Intruction Type
            constraint c_RV64I_type { RV64I_type inside { RV64I_RType,
                                                          RV64I_IType,
                                                          RV64I_SType
            };
            }

            // RV64I_RType Type
            constraint c_RV64I_RType_types { RV64I_RType_types inside { RV64I_RType_I,
                                                                        RV64I_RType_W 
            };
            }

            // opcode 
            constraint c_RV64I_RType_opcode { 
                if ( RV64I_RType_types == RV64I_RType_I ){
                    RV64I_RType_opcode == 7'b0010011;
                }
                else if ( RV64I_RType_types == RV64I_RType_W ){
                    RV64I_RType_opcode inside {7'b0011011, 7'b0111011};
                }
            }
            constraint c_RV64I_IType_opcode { RV64I_IType_opcode inside {7'b0000011, 7'b0011011};}
            constraint c_RV64I_SType_opcode { RV64I_SType_opcode == 7'b0100011;}

            // R-Type
            constraint c_RV64I_RType_funct {
                if(RV64I_RType_opcode == 7'b0010011){
                    RV64I_RType_funct3 inside {3'b001, 3'b101};
                    (RV64I_RType_funct3 == 3'b001) -> RV64I_RType_funct7_I == 6'b000000;
                    (RV64I_RType_funct3 == 3'b101) -> RV64I_RType_funct7_I inside {6'b000000, 6'b010000};
                }
                else if(RV64I_RType_opcode == 7'b0011011){
                    RV64I_RType_funct3 inside {3'b001, 3'b101};
                    (RV64I_RType_funct3 == 3'b001) -> RV64I_RType_funct7_W == 7'b0000000;
                    (RV64I_RType_funct3 == 3'b101) -> RV64I_RType_funct7_W inside {7'b0000000, 7'b0100000};
                }
                else if(RV64I_RType_opcode == 7'b0111011){
                    RV64I_RType_funct3 inside {3'b000, 3'b001, 3'b101};
                    (RV64I_RType_funct3 == 3'b000) -> RV64I_RType_funct7_W inside {7'b0000000, 7'b0100000};
                    (RV64I_RType_funct3 == 3'b001) -> RV64I_RType_funct7_W == 7'b0000000;
                    (RV64I_RType_funct3 == 3'b101) -> RV64I_RType_funct7_W inside {7'b0000000, 7'b0100000};
                }
            }
            // I-Type
            constraint c_RV64I_IType_funct {
                if(RV64I_IType_opcode == 7'b0000011){
                    RV64I_IType_funct3 inside {3'b011, 3'b110};
                }
                else if(RV64I_IType_opcode == 7'b0011011){
                    RV64I_IType_funct3 == 3'b000;
                }
            }
            // S-Type
            constraint c_RV64I_SType_funct {
                (RV64I_SType_opcode == 7'b0100011) -> RV64I_SType_funct3 == 3'b011;
            }


        // RV32M
            // opcode
            constraint c_RV32M_opcode { RV32M_opcode == 7'b0110011;}

            // funct
            constraint c_RV32M_funct {
                    RV32M_funct3 inside {3'b000, 3'b001, 3'b010, 3'b011, 3'b100, 3'b101, 3'b110, 3'b111};
                    RV32M_funct7 == 7'b0000001;
            }

        // RV64M
            // opcode
            constraint c_RV64M_opcode { RV64M_opcode == 7'b0111011;}

            // funct
            constraint c_RV64M_funct {
                    RV64M_funct3 inside {3'b000, 3'b100, 3'b101, 3'b110, 3'b111};
                    RV64M_funct7 == 7'b0000001;
            }

        // RV32A
            // opcode
            constraint c_RV32A_opcode { RV32A_opcode == 7'b0101111;}

            // funct
            constraint c_RV32A_funct {
                    RV32A_funct3 == 3'b010;
                    RV32A_funct7 inside {5'b00000, 5'b00001, 5'b00010, 5'b00011, 5'b00100, 5'b01000, 5'b01100, 5'b10000, 5'b10100, 5'b11000, 5'b11100};
                    (RV32A_funct7 == 5'b00010) -> RV32A_rs2 == 5'b00000;
            }

        // RV64A
            // opcode
            constraint c_RV64A_opcode { RV64A_opcode == 7'b0101111;}

            // funct
            constraint c_RV64A_funct {
                    RV64A_funct3 == 3'b011;
                    RV64A_funct7 inside {5'b00000, 5'b00001, 5'b00010, 5'b00011, 5'b00100, 5'b01000, 5'b01100, 5'b10000, 5'b10100, 5'b11000, 5'b11100};
                    (RV64A_funct7 == 5'b00010) -> RV64A_rs2 == 5'b00000;
            }
        
endclass                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                