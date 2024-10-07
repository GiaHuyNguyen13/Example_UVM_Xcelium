  import package_decode::*;
  import decode_table_package::*;
class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  function new(string name="scoreboard", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  uvm_analysis_imp #(item, scoreboard) m_analysis_imp;
    
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    m_analysis_imp = new("m_analysis_imp", this);
  endfunction
  
  virtual function write(item item);
  //RV32I
    //LUI        
    if ((item.instr & MASK_LUI) == EXPT_LUI) begin
      if (item.iq_type == LUI_struct.iq_type &&
          item.is_br == LUI_struct.is_br &&
          item.bypassable == LUI_struct.bypassable &&
          item.mem_cmd == LUI_struct.mem_cmd &&
          item.is_fence == LUI_struct.is_fence &&
          item.is_fencei == LUI_struct.is_fencei &&
          item.is_amo == LUI_struct.is_amo &&
          item.uses_ldq == LUI_struct.uses_ldq &&
          item.uses_stq == LUI_struct.uses_stq &&
          item.flush_on_commit == LUI_struct.flush_on_commit) begin
              `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "LUI"), UVM_HIGH)
          end else begin
              `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s with %d %d", "LUI",item.iq_type, LUI_struct.iq_type))
          end
    end 

    //AUIPC
    else if ((item.instr & MASK_AUIPC) == EXPT_AUIPC) begin
      if (item.iq_type == AUIPC_struct.iq_type &&
          item.is_br == AUIPC_struct.is_br &&
          item.bypassable == AUIPC_struct.bypassable &&
          item.mem_cmd == AUIPC_struct.mem_cmd &&
          item.is_fence == AUIPC_struct.is_fence &&
          item.is_fencei == AUIPC_struct.is_fencei &&
          item.is_amo == AUIPC_struct.is_amo &&
          item.uses_ldq == AUIPC_struct.uses_ldq &&
          item.uses_stq == AUIPC_struct.uses_stq &&
          item.flush_on_commit == AUIPC_struct.flush_on_commit) begin
              `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "AUIPC"), UVM_HIGH)
          end else begin
              `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AUIPC"))
          end
    end

      //JAL
      else if ((item.instr & MASK_JAL) == EXPT_JAL) begin
        if (item.iq_type == JAL_struct.iq_type &&
            item.is_br == JAL_struct.is_br &&
            item.bypassable == JAL_struct.bypassable &&
            item.mem_cmd == JAL_struct.mem_cmd &&
            item.is_fence == JAL_struct.is_fence &&
            item.is_fencei == JAL_struct.is_fencei &&
            item.is_amo == JAL_struct.is_amo &&
            item.uses_ldq == JAL_struct.uses_ldq &&
            item.uses_stq == JAL_struct.uses_stq &&
            item.flush_on_commit == JAL_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "JAL"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "JAL"))
        end
      end

      //JALR
      else if ((item.instr & MASK_JALR) == EXPT_JALR) begin
        if (item.iq_type == JALR_struct.iq_type &&
            item.is_br == JALR_struct.is_br &&
            item.bypassable == JALR_struct.bypassable &&
            item.mem_cmd == JALR_struct.mem_cmd &&
            item.is_fence == JALR_struct.is_fence &&
            item.is_fencei == JALR_struct.is_fencei &&
            item.is_amo == JALR_struct.is_amo &&
            item.uses_ldq == JALR_struct.uses_ldq &&
            item.uses_stq == JALR_struct.uses_stq &&
            item.flush_on_commit == JALR_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "JALR"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "JALR"))
        end
      end

      //BEQ
      else if ((item.instr & MASK_BEQ) == EXPT_BEQ) begin
        if (item.iq_type == BEQ_struct.iq_type &&
            item.is_br == BEQ_struct.is_br &&
            item.bypassable == BEQ_struct.bypassable &&
            item.mem_cmd == BEQ_struct.mem_cmd &&
            item.is_fence == BEQ_struct.is_fence &&
            item.is_fencei == BEQ_struct.is_fencei &&
            item.is_amo == BEQ_struct.is_amo &&
            item.uses_ldq == BEQ_struct.uses_ldq &&
            item.uses_stq == BEQ_struct.uses_stq &&
            item.flush_on_commit == BEQ_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "BEQ"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "BEQ"))
        end
      end

      //BNE
      else if ((item.instr & MASK_BNE) == EXPT_BNE) begin
        if (item.iq_type == BNE_struct.iq_type &&
            item.is_br == BNE_struct.is_br &&
            item.bypassable == BNE_struct.bypassable &&
            item.mem_cmd == BNE_struct.mem_cmd &&
            item.is_fence == BNE_struct.is_fence &&
            item.is_fencei == BNE_struct.is_fencei &&
            item.is_amo == BNE_struct.is_amo &&
            item.uses_ldq == BNE_struct.uses_ldq &&
            item.uses_stq == BNE_struct.uses_stq &&
            item.flush_on_commit == BNE_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "BNE"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "BNE"))
        end
      end

      //BLT
      else if ((item.instr & MASK_BLT) == EXPT_BLT) begin
        if (item.iq_type == BLT_struct.iq_type &&
            item.is_br == BLT_struct.is_br &&
            item.bypassable == BLT_struct.bypassable &&
            item.mem_cmd == BLT_struct.mem_cmd &&
            item.is_fence == BLT_struct.is_fence &&
            item.is_fencei == BLT_struct.is_fencei &&
            item.is_amo == BLT_struct.is_amo &&
            item.uses_ldq == BLT_struct.uses_ldq &&
            item.uses_stq == BLT_struct.uses_stq &&
            item.flush_on_commit == BLT_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "BLT"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "BLT"))
        end
      end

      //BGE
      else if ((item.instr & MASK_BGE) == EXPT_BGE) begin
        if (item.iq_type == BGE_struct.iq_type &&
            item.is_br == BGE_struct.is_br &&
            item.bypassable == BGE_struct.bypassable &&
            item.mem_cmd == BGE_struct.mem_cmd &&
            item.is_fence == BGE_struct.is_fence &&
            item.is_fencei == BGE_struct.is_fencei &&
            item.is_amo == BGE_struct.is_amo &&
            item.uses_ldq == BGE_struct.uses_ldq &&
            item.uses_stq == BGE_struct.uses_stq &&
            item.flush_on_commit == BGE_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "BGE"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "BGE"))
        end
      end

      //BLTU
      else if ((item.instr & MASK_BLTU) == EXPT_BLTU) begin
        if (item.iq_type == BLTU_struct.iq_type &&
            item.is_br == BLTU_struct.is_br &&
            item.bypassable == BLTU_struct.bypassable &&
            item.mem_cmd == BLTU_struct.mem_cmd &&
            item.is_fence == BLTU_struct.is_fence &&
            item.is_fencei == BLTU_struct.is_fencei &&
            item.is_amo == BLTU_struct.is_amo &&
            item.uses_ldq == BLTU_struct.uses_ldq &&
            item.uses_stq == BLTU_struct.uses_stq &&
            item.flush_on_commit == BLTU_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "BLTU"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "BLTU"))
        end
      end

      //BGEU
      else if ((item.instr & MASK_BGEU) == EXPT_BGEU) begin
        if (item.iq_type == BGEU_struct.iq_type &&
            item.is_br == BGEU_struct.is_br &&
            item.bypassable == BGEU_struct.bypassable &&
            item.mem_cmd == BGEU_struct.mem_cmd &&
            item.is_fence == BGEU_struct.is_fence &&
            item.is_fencei == BGEU_struct.is_fencei &&
            item.is_amo == BGEU_struct.is_amo &&
            item.uses_ldq == BGEU_struct.uses_ldq &&
            item.uses_stq == BGEU_struct.uses_stq &&
            item.flush_on_commit == BGEU_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "BGEU"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "BGEU"))
        end
      end

      //LB
      else if ((item.instr & MASK_LB) == EXPT_LB) begin
        if (item.iq_type == LB_struct.iq_type &&
            item.is_br == LB_struct.is_br &&
            item.bypassable == LB_struct.bypassable &&
            item.mem_cmd == LB_struct.mem_cmd &&
            item.is_fence == LB_struct.is_fence &&
            item.is_fencei == LB_struct.is_fencei &&
            item.is_amo == LB_struct.is_amo &&
            item.uses_ldq == LB_struct.uses_ldq &&
            item.uses_stq == LB_struct.uses_stq &&
            item.flush_on_commit == LB_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "LB"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "LB"))
        end
      end

      //LH
      else if ((item.instr & MASK_LH) == EXPT_LH) begin
        if (item.iq_type == LH_struct.iq_type &&
            item.is_br == LH_struct.is_br &&
            item.bypassable == LH_struct.bypassable &&
            item.mem_cmd == LH_struct.mem_cmd &&
            item.is_fence == LH_struct.is_fence &&
            item.is_fencei == LH_struct.is_fencei &&
            item.is_amo == LH_struct.is_amo &&
            item.uses_ldq == LH_struct.uses_ldq &&
            item.uses_stq == LH_struct.uses_stq &&
            item.flush_on_commit == LH_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "LH"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "LH"))
        end
      end

      //LW
      else if ((item.instr & MASK_LW) == EXPT_LW) begin
        if (item.iq_type == LW_struct.iq_type &&
            item.is_br == LW_struct.is_br &&
            item.bypassable == LW_struct.bypassable &&
            item.mem_cmd == LW_struct.mem_cmd &&
            item.is_fence == LW_struct.is_fence &&
            item.is_fencei == LW_struct.is_fencei &&
            item.is_amo == LW_struct.is_amo &&
            item.uses_ldq == LW_struct.uses_ldq &&
            item.uses_stq == LW_struct.uses_stq &&
            item.flush_on_commit == LW_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "LW"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "LW"))
        end
      end

      //LBU
      else if ((item.instr & MASK_LBU) == EXPT_LBU) begin
        if (item.iq_type == LBU_struct.iq_type &&
            item.is_br == LBU_struct.is_br &&
            item.bypassable == LBU_struct.bypassable &&
            item.mem_cmd == LBU_struct.mem_cmd &&
            item.is_fence == LBU_struct.is_fence &&
            item.is_fencei == LBU_struct.is_fencei &&
            item.is_amo == LBU_struct.is_amo &&
            item.uses_ldq == LBU_struct.uses_ldq &&
            item.uses_stq == LBU_struct.uses_stq &&
            item.flush_on_commit == LBU_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "LBU"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "LBU"))
        end
      end

      //LHU
      else if ((item.instr & MASK_LHU) == EXPT_LHU) begin
        if (item.iq_type == LHU_struct.iq_type &&
            item.is_br == LHU_struct.is_br &&
            item.bypassable == LHU_struct.bypassable &&
            item.mem_cmd == LHU_struct.mem_cmd &&
            item.is_fence == LHU_struct.is_fence &&
            item.is_fencei == LHU_struct.is_fencei &&
            item.is_amo == LHU_struct.is_amo &&
            item.uses_ldq == LHU_struct.uses_ldq &&
            item.uses_stq == LHU_struct.uses_stq &&
            item.flush_on_commit == LHU_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "LHU"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "LHU"))
        end
      end

      //SB
      else if ((item.instr & MASK_SB) == EXPT_SB) begin
        if (item.iq_type == SB_struct.iq_type &&
            item.is_br == SB_struct.is_br &&
            item.bypassable == SB_struct.bypassable &&
            item.mem_cmd == SB_struct.mem_cmd &&
            item.is_fence == SB_struct.is_fence &&
            item.is_fencei == SB_struct.is_fencei &&
            item.is_amo == SB_struct.is_amo &&
            item.uses_ldq == SB_struct.uses_ldq &&
            item.uses_stq == SB_struct.uses_stq &&
            item.flush_on_commit == SB_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SB"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SB"))
        end
      end

      //SH
      else if ((item.instr & MASK_SH) == EXPT_SH) begin
        if (item.iq_type == SH_struct.iq_type &&
            item.is_br == SH_struct.is_br &&
            item.bypassable == SH_struct.bypassable &&
            item.mem_cmd == SH_struct.mem_cmd &&
            item.is_fence == SH_struct.is_fence &&
            item.is_fencei == SH_struct.is_fencei &&
            item.is_amo == SH_struct.is_amo &&
            item.uses_ldq == SH_struct.uses_ldq &&
            item.uses_stq == SH_struct.uses_stq &&
            item.flush_on_commit == SH_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SH"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SH"))
        end
      end

      //SW
      else if ((item.instr & MASK_SW) == EXPT_SW) begin
        if (item.iq_type == SW_struct.iq_type &&
            item.is_br == SW_struct.is_br &&
            item.bypassable == SW_struct.bypassable &&
            item.mem_cmd == SW_struct.mem_cmd &&
            item.is_fence == SW_struct.is_fence &&
            item.is_fencei == SW_struct.is_fencei &&
            item.is_amo == SW_struct.is_amo &&
            item.uses_ldq == SW_struct.uses_ldq &&
            item.uses_stq == SW_struct.uses_stq &&
            item.flush_on_commit == SW_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SW"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SW"))
        end
      end

      //ADDI
      else if ((item.instr & MASK_ADDI) == EXPT_ADDI) begin
        if (item.iq_type == ADDI_struct.iq_type &&
            item.is_br == ADDI_struct.is_br &&
            item.bypassable == ADDI_struct.bypassable &&
            item.mem_cmd == ADDI_struct.mem_cmd &&
            item.is_fence == ADDI_struct.is_fence &&
            item.is_fencei == ADDI_struct.is_fencei &&
            item.is_amo == ADDI_struct.is_amo &&
            item.uses_ldq == ADDI_struct.uses_ldq &&
            item.uses_stq == ADDI_struct.uses_stq &&
            item.flush_on_commit == ADDI_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "ADDI"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "ADDI"))
        end
      end

      //SLTI
      else if ((item.instr & MASK_SLTI) == EXPT_SLTI) begin
        if (item.iq_type == SLTI_struct.iq_type &&
            item.is_br == SLTI_struct.is_br &&
            item.bypassable == SLTI_struct.bypassable &&
            item.mem_cmd == SLTI_struct.mem_cmd &&
            item.is_fence == SLTI_struct.is_fence &&
            item.is_fencei == SLTI_struct.is_fencei &&
            item.is_amo == SLTI_struct.is_amo &&
            item.uses_ldq == SLTI_struct.uses_ldq &&
            item.uses_stq == SLTI_struct.uses_stq &&
            item.flush_on_commit == SLTI_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SLTI"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SLTI"))
        end
      end

      //SLTIU
      else if ((item.instr & MASK_SLTIU) == EXPT_SLTIU) begin
        if (item.iq_type == SLTIU_struct.iq_type &&
            item.is_br == SLTIU_struct.is_br &&
            item.bypassable == SLTIU_struct.bypassable &&
            item.mem_cmd == SLTIU_struct.mem_cmd &&
            item.is_fence == SLTIU_struct.is_fence &&
            item.is_fencei == SLTIU_struct.is_fencei &&
            item.is_amo == SLTIU_struct.is_amo &&
            item.uses_ldq == SLTIU_struct.uses_ldq &&
            item.uses_stq == SLTIU_struct.uses_stq &&
            item.flush_on_commit == SLTIU_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SLTIU"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SLTIU"))
        end
      end

      //XORI
      else if ((item.instr & MASK_XORI) == EXPT_XORI) begin
        if (item.iq_type == XORI_struct.iq_type &&
            item.is_br == XORI_struct.is_br &&
            item.bypassable == XORI_struct.bypassable &&
            item.mem_cmd == XORI_struct.mem_cmd &&
            item.is_fence == XORI_struct.is_fence &&
            item.is_fencei == XORI_struct.is_fencei &&
            item.is_amo == XORI_struct.is_amo &&
            item.uses_ldq == XORI_struct.uses_ldq &&
            item.uses_stq == XORI_struct.uses_stq &&
            item.flush_on_commit == XORI_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "XORI"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "XORI"))
        end
      end

      //ORI
      else if ((item.instr & MASK_ORI) == EXPT_ORI) begin
        if (item.iq_type == ORI_struct.iq_type &&
            item.is_br == ORI_struct.is_br &&
            item.bypassable == ORI_struct.bypassable &&
            item.mem_cmd == ORI_struct.mem_cmd &&
            item.is_fence == ORI_struct.is_fence &&
            item.is_fencei == ORI_struct.is_fencei &&
            item.is_amo == ORI_struct.is_amo &&
            item.uses_ldq == ORI_struct.uses_ldq &&
            item.uses_stq == ORI_struct.uses_stq &&
            item.flush_on_commit == ORI_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "ORI"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "ORI"))
        end
      end

      //ANDI
      else if ((item.instr & MASK_ANDI) == EXPT_ANDI) begin
        if (item.iq_type == ANDI_struct.iq_type &&
            item.is_br == ANDI_struct.is_br &&
            item.bypassable == ANDI_struct.bypassable &&
            item.mem_cmd == ANDI_struct.mem_cmd &&
            item.is_fence == ANDI_struct.is_fence &&
            item.is_fencei == ANDI_struct.is_fencei &&
            item.is_amo == ANDI_struct.is_amo &&
            item.uses_ldq == ANDI_struct.uses_ldq &&
            item.uses_stq == ANDI_struct.uses_stq &&
            item.flush_on_commit == ANDI_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "ANDI"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "ANDI"))
        end
      end

      //SLLI32
      else if ((item.instr & MASK_SLLI32) == EXPT_SLLI32) begin
        if (item.iq_type == SLLI32_struct.iq_type &&
            item.is_br == SLLI32_struct.is_br &&
            item.bypassable == SLLI32_struct.bypassable &&
            item.mem_cmd == SLLI32_struct.mem_cmd &&
            item.is_fence == SLLI32_struct.is_fence &&
            item.is_fencei == SLLI32_struct.is_fencei &&
            item.is_amo == SLLI32_struct.is_amo &&
            item.uses_ldq == SLLI32_struct.uses_ldq &&
            item.uses_stq == SLLI32_struct.uses_stq &&
            item.flush_on_commit == SLLI32_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SLLI"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SLLI"))
        end
      end

      //SRLI32
      else if ((item.instr & MASK_SRLI32) == EXPT_SRLI32) begin
        if (item.iq_type == SRLI32_struct.iq_type &&
            item.is_br == SRLI32_struct.is_br &&
            item.bypassable == SRLI32_struct.bypassable &&
            item.mem_cmd == SRLI32_struct.mem_cmd &&
            item.is_fence == SRLI32_struct.is_fence &&
            item.is_fencei == SRLI32_struct.is_fencei &&
            item.is_amo == SRLI32_struct.is_amo &&
            item.uses_ldq == SRLI32_struct.uses_ldq &&
            item.uses_stq == SRLI32_struct.uses_stq &&
            item.flush_on_commit == SRLI32_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SRLI"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SRLI"))
        end
      end

      //SRAI32
      else if ((item.instr & MASK_SRAI32) == EXPT_SRAI32) begin
        if (item.iq_type == SRAI32_struct.iq_type &&
            item.is_br == SRAI32_struct.is_br &&
            item.bypassable == SRAI32_struct.bypassable &&
            item.mem_cmd == SRAI32_struct.mem_cmd &&
            item.is_fence == SRAI32_struct.is_fence &&
            item.is_fencei == SRAI32_struct.is_fencei &&
            item.is_amo == SRAI32_struct.is_amo &&
            item.uses_ldq == SRAI32_struct.uses_ldq &&
            item.uses_stq == SRAI32_struct.uses_stq &&
            item.flush_on_commit == SRAI32_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SRAI"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SRAI"))
        end
      end

      //ADD
      else if ((item.instr & MASK_ADD) == EXPT_ADD) begin
        if (item.iq_type == ADD_struct.iq_type &&
            item.is_br == ADD_struct.is_br &&
            item.bypassable == ADD_struct.bypassable &&
            item.mem_cmd == ADD_struct.mem_cmd &&
            item.is_fence == ADD_struct.is_fence &&
            item.is_fencei == ADD_struct.is_fencei &&
            item.is_amo == ADD_struct.is_amo &&
            item.uses_ldq == ADD_struct.uses_ldq &&
            item.uses_stq == ADD_struct.uses_stq &&
            item.flush_on_commit == ADD_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "ADD"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "ADD"))
        end
      end

      //SUB
      else if ((item.instr & MASK_SUB) == EXPT_SUB) begin
        if (item.iq_type == SUB_struct.iq_type &&
            item.is_br == SUB_struct.is_br &&
            item.bypassable == SUB_struct.bypassable &&
            item.mem_cmd == SUB_struct.mem_cmd &&
            item.is_fence == SUB_struct.is_fence &&
            item.is_fencei == SUB_struct.is_fencei &&
            item.is_amo == SUB_struct.is_amo &&
            item.uses_ldq == SUB_struct.uses_ldq &&
            item.uses_stq == SUB_struct.uses_stq &&
            item.flush_on_commit == SUB_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SUB"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SUB"))
        end
      end

      //SLL
      else if ((item.instr & MASK_SLL) == EXPT_SLL) begin
        if (item.iq_type == SLL_struct.iq_type &&
            item.is_br == SLL_struct.is_br &&
            item.bypassable == SLL_struct.bypassable &&
            item.mem_cmd == SLL_struct.mem_cmd &&
            item.is_fence == SLL_struct.is_fence &&
            item.is_fencei == SLL_struct.is_fencei &&
            item.is_amo == SLL_struct.is_amo &&
            item.uses_ldq == SLL_struct.uses_ldq &&
            item.uses_stq == SLL_struct.uses_stq &&
            item.flush_on_commit == SLL_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SLL"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SLL"))
        end
      end

      //SLT
      else if ((item.instr & MASK_SLT) == EXPT_SLT) begin
        if (item.iq_type == SLT_struct.iq_type &&
            item.is_br == SLT_struct.is_br &&
            item.bypassable == SLT_struct.bypassable &&
            item.mem_cmd == SLT_struct.mem_cmd &&
            item.is_fence == SLT_struct.is_fence &&
            item.is_fencei == SLT_struct.is_fencei &&
            item.is_amo == SLT_struct.is_amo &&
            item.uses_ldq == SLT_struct.uses_ldq &&
            item.uses_stq == SLT_struct.uses_stq &&
            item.flush_on_commit == SLT_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SLT"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SLT"))
        end
      end
     
      //SLTU
      else if ((item.instr & MASK_SLTU) == EXPT_SLTU) begin
        if (item.iq_type == SLTU_struct.iq_type &&
            item.is_br == SLTU_struct.is_br &&
            item.bypassable == SLTU_struct.bypassable &&
            item.mem_cmd == SLTU_struct.mem_cmd &&
            item.is_fence == SLTU_struct.is_fence &&
            item.is_fencei == SLTU_struct.is_fencei &&
            item.is_amo == SLTU_struct.is_amo &&
            item.uses_ldq == SLTU_struct.uses_ldq &&
            item.uses_stq == SLTU_struct.uses_stq &&
            item.flush_on_commit == SLTU_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SLTU"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SLTU"))
        end
      end

      //XOR
      else if ((item.instr & MASK_XOR) == EXPT_XOR) begin
        if (item.iq_type == XOR_struct.iq_type &&
            item.is_br == XOR_struct.is_br &&
            item.bypassable == XOR_struct.bypassable &&
            item.mem_cmd == XOR_struct.mem_cmd &&
            item.is_fence == XOR_struct.is_fence &&
            item.is_fencei == XOR_struct.is_fencei &&
            item.is_amo == XOR_struct.is_amo &&
            item.uses_ldq == XOR_struct.uses_ldq &&
            item.uses_stq == XOR_struct.uses_stq &&
            item.flush_on_commit == XOR_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "XOR"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "XOR"))
        end
      end

      //SRL
      else if ((item.instr & MASK_SRL) == EXPT_SRL) begin
        if (item.iq_type == SRL_struct.iq_type &&
            item.is_br == SRL_struct.is_br &&
            item.bypassable == SRL_struct.bypassable &&
            item.mem_cmd == SRL_struct.mem_cmd &&
            item.is_fence == SRL_struct.is_fence &&
            item.is_fencei == SRL_struct.is_fencei &&
            item.is_amo == SRL_struct.is_amo &&
            item.uses_ldq == SRL_struct.uses_ldq &&
            item.uses_stq == SRL_struct.uses_stq &&
            item.flush_on_commit == SRL_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SRL"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SRL"))
        end
      end

      //SRA
      else if ((item.instr & MASK_SRA) == EXPT_SRA) begin
        if (item.iq_type == SRA_struct.iq_type &&
            item.is_br == SRA_struct.is_br &&
            item.bypassable == SRA_struct.bypassable &&
            item.mem_cmd == SRA_struct.mem_cmd &&
            item.is_fence == SRA_struct.is_fence &&
            item.is_fencei == SRA_struct.is_fencei &&
            item.is_amo == SRA_struct.is_amo &&
            item.uses_ldq == SRA_struct.uses_ldq &&
            item.uses_stq == SRA_struct.uses_stq &&
            item.flush_on_commit == SRA_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SRA"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SRA"))
        end
      end

      //OR
      else if ((item.instr & MASK_OR) == EXPT_OR) begin
        if (item.iq_type == OR_struct.iq_type &&
            item.is_br == OR_struct.is_br &&
            item.bypassable == OR_struct.bypassable &&
            item.mem_cmd == OR_struct.mem_cmd &&
            item.is_fence == OR_struct.is_fence &&
            item.is_fencei == OR_struct.is_fencei &&
            item.is_amo == OR_struct.is_amo &&
            item.uses_ldq == OR_struct.uses_ldq &&
            item.uses_stq == OR_struct.uses_stq &&
            item.flush_on_commit == OR_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "OR"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "OR"))
        end
      end

      //AND
      else if ((item.instr & MASK_AND) == EXPT_AND) begin
        if (item.iq_type == AND_struct.iq_type &&
            item.is_br == AND_struct.is_br &&
            item.bypassable == AND_struct.bypassable &&
            item.mem_cmd == AND_struct.mem_cmd &&
            item.is_fence == AND_struct.is_fence &&
            item.is_fencei == AND_struct.is_fencei &&
            item.is_amo == AND_struct.is_amo &&
            item.uses_ldq == AND_struct.uses_ldq &&
            item.uses_stq == AND_struct.uses_stq &&
            item.flush_on_commit == AND_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "AND"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AND"))
        end
      end

      //FENCE
      else if ((item.instr & MASK_FENCE) == EXPT_FENCE) begin
        if (item.iq_type == FENCE_struct.iq_type &&
            item.is_br == FENCE_struct.is_br &&
            item.bypassable == FENCE_struct.bypassable &&
            item.mem_cmd == FENCE_struct.mem_cmd &&
            item.is_fence == FENCE_struct.is_fence &&
            item.is_fencei == FENCE_struct.is_fencei &&
            item.is_amo == FENCE_struct.is_amo &&
            item.uses_ldq == FENCE_struct.uses_ldq &&
            item.uses_stq == FENCE_struct.uses_stq &&
            item.flush_on_commit == FENCE_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "FENCE"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "FENCE"))
        end
      end

      //ECALL
      else if ((item.instr & MASK_ECALL) == EXPT_ECALL) begin
        if (item.iq_type == ECALL_struct.iq_type &&
            item.is_br == ECALL_struct.is_br &&
            item.bypassable == ECALL_struct.bypassable &&
            item.mem_cmd == ECALL_struct.mem_cmd &&
            item.is_fence == ECALL_struct.is_fence &&
            item.is_fencei == ECALL_struct.is_fencei &&
            item.is_amo == ECALL_struct.is_amo &&
            item.uses_ldq == ECALL_struct.uses_ldq &&
            item.uses_stq == ECALL_struct.uses_stq &&
            item.flush_on_commit == ECALL_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "ECALL"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "ECALL"))
        end
      end

      //EBREAK
      else if ((item.instr & MASK_EBREAK) == EXPT_EBREAK) begin
        if (item.iq_type == EBREAK_struct.iq_type &&
            item.is_br == EBREAK_struct.is_br &&
            item.bypassable == EBREAK_struct.bypassable &&
            item.mem_cmd == EBREAK_struct.mem_cmd &&
            item.is_fence == EBREAK_struct.is_fence &&
            item.is_fencei == EBREAK_struct.is_fencei &&
            item.is_amo == EBREAK_struct.is_amo &&
            item.uses_ldq == EBREAK_struct.uses_ldq &&
            item.uses_stq == EBREAK_struct.uses_stq &&
            item.flush_on_commit == EBREAK_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "EBREAK"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "EBREAK"))
        end
      end

  //RV64I
      //LWU
      else if ((item.instr & MASK_LWU) == EXPT_LWU) begin
        if (item.iq_type == LWU_struct.iq_type &&
            item.is_br == LWU_struct.is_br &&
            item.bypassable == LWU_struct.bypassable &&
            item.mem_cmd == LWU_struct.mem_cmd &&
            item.is_fence == LWU_struct.is_fence &&
            item.is_fencei == LWU_struct.is_fencei &&
            item.is_amo == LWU_struct.is_amo &&
            item.uses_ldq == LWU_struct.uses_ldq &&
            item.uses_stq == LWU_struct.uses_stq &&
            item.flush_on_commit == LWU_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "LWU"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "LWU"))
        end
      end

      //LD
      else if ((item.instr & MASK_LD) == EXPT_LD) begin
        if (item.iq_type == LD_struct.iq_type &&
            item.is_br == LD_struct.is_br &&
            item.bypassable == LD_struct.bypassable &&
            item.mem_cmd == LD_struct.mem_cmd &&
            item.is_fence == LD_struct.is_fence &&
            item.is_fencei == LD_struct.is_fencei &&
            item.is_amo == LD_struct.is_amo &&
            item.uses_ldq == LD_struct.uses_ldq &&
            item.uses_stq == LD_struct.uses_stq &&
            item.flush_on_commit == LD_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "LD"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "LD"))
        end
      end

      //SD
      else if ((item.instr & MASK_SD) == EXPT_SD) begin
        if (item.iq_type == SD_struct.iq_type &&
            item.is_br == SD_struct.is_br &&
            item.bypassable == SD_struct.bypassable &&
            item.mem_cmd == SD_struct.mem_cmd &&
            item.is_fence == SD_struct.is_fence &&
            item.is_fencei == SD_struct.is_fencei &&
            item.is_amo == SD_struct.is_amo &&
            item.uses_ldq == SD_struct.uses_ldq &&
            item.uses_stq == SD_struct.uses_stq &&
            item.flush_on_commit == SD_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SD"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SD"))
        end
      end

      //SLLI
      else if ((item.instr & MASK_SLLI) == EXPT_SLLI) begin
        if (item.iq_type == SLLI_struct.iq_type &&
            item.is_br == SLLI_struct.is_br &&
            item.bypassable == SLLI_struct.bypassable &&
            item.mem_cmd == SLLI_struct.mem_cmd &&
            item.is_fence == SLLI_struct.is_fence &&
            item.is_fencei == SLLI_struct.is_fencei &&
            item.is_amo == SLLI_struct.is_amo &&
            item.uses_ldq == SLLI_struct.uses_ldq &&
            item.uses_stq == SLLI_struct.uses_stq &&
            item.flush_on_commit == SLLI_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SLLI"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SLLI"))
        end
      end

      //SRLI
      else if ((item.instr & MASK_SRLI) == EXPT_SRLI) begin
        if (item.iq_type == SRLI_struct.iq_type &&
            item.is_br == SRLI_struct.is_br &&
            item.bypassable == SRLI_struct.bypassable &&
            item.mem_cmd == SRLI_struct.mem_cmd &&
            item.is_fence == SRLI_struct.is_fence &&
            item.is_fencei == SRLI_struct.is_fencei &&
            item.is_amo == SRLI_struct.is_amo &&
            item.uses_ldq == SRLI_struct.uses_ldq &&
            item.uses_stq == SRLI_struct.uses_stq &&
            item.flush_on_commit == SRLI_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SRLI"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SRLI"))
        end
      end

      //SRAI
      else if ((item.instr & MASK_SRAI) == EXPT_SRAI) begin
        if (item.iq_type == SRAI_struct.iq_type &&
            item.is_br == SRAI_struct.is_br &&
            item.bypassable == SRAI_struct.bypassable &&
            item.mem_cmd == SRAI_struct.mem_cmd &&
            item.is_fence == SRAI_struct.is_fence &&
            item.is_fencei == SRAI_struct.is_fencei &&
            item.is_amo == SRAI_struct.is_amo &&
            item.uses_ldq == SRAI_struct.uses_ldq &&
            item.uses_stq == SRAI_struct.uses_stq &&
            item.flush_on_commit == SRAI_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SRAI"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SRAI"))
        end
      end

      //ADDIW
      else if ((item.instr & MASK_ADDIW) == EXPT_ADDIW) begin
        if (item.iq_type == ADDIW_struct.iq_type &&
            item.is_br == ADDIW_struct.is_br &&
            item.bypassable == ADDIW_struct.bypassable &&
            item.mem_cmd == ADDIW_struct.mem_cmd &&
            item.is_fence == ADDIW_struct.is_fence &&
            item.is_fencei == ADDIW_struct.is_fencei &&
            item.is_amo == ADDIW_struct.is_amo &&
            item.uses_ldq == ADDIW_struct.uses_ldq &&
            item.uses_stq == ADDIW_struct.uses_stq &&
            item.flush_on_commit == ADDIW_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "ADDIW"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "ADDIW"))
        end
      end

      //SLLIW
      else if ((item.instr & MASK_SLLIW) == EXPT_SLLIW) begin
        if (item.iq_type == SLLIW_struct.iq_type &&
            item.is_br == SLLIW_struct.is_br &&
            item.bypassable == SLLIW_struct.bypassable &&
            item.mem_cmd == SLLIW_struct.mem_cmd &&
            item.is_fence == SLLIW_struct.is_fence &&
            item.is_fencei == SLLIW_struct.is_fencei &&
            item.is_amo == SLLIW_struct.is_amo &&
            item.uses_ldq == SLLIW_struct.uses_ldq &&
            item.uses_stq == SLLIW_struct.uses_stq &&
            item.flush_on_commit == SLLIW_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SLLIW"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SLLIW"))
        end
      end

      //SRLIW
      else if ((item.instr & MASK_SRLIW) == EXPT_SRLIW) begin
        if (item.iq_type == SRLIW_struct.iq_type &&
            item.is_br == SRLIW_struct.is_br &&
            item.bypassable == SRLIW_struct.bypassable &&
            item.mem_cmd == SRLIW_struct.mem_cmd &&
            item.is_fence == SRLIW_struct.is_fence &&
            item.is_fencei == SRLIW_struct.is_fencei &&
            item.is_amo == SRLIW_struct.is_amo &&
            item.uses_ldq == SRLIW_struct.uses_ldq &&
            item.uses_stq == SRLIW_struct.uses_stq &&
            item.flush_on_commit == SRLIW_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SRLIW"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SRLIW"))
        end
      end

      //SRAIW
      else if ((item.instr & MASK_SRAIW) == EXPT_SRAIW) begin
        if (item.iq_type == SRAIW_struct.iq_type &&
            item.is_br == SRAIW_struct.is_br &&
            item.bypassable == SRAIW_struct.bypassable &&
            item.mem_cmd == SRAIW_struct.mem_cmd &&
            item.is_fence == SRAIW_struct.is_fence &&
            item.is_fencei == SRAIW_struct.is_fencei &&
            item.is_amo == SRAIW_struct.is_amo &&
            item.uses_ldq == SRAIW_struct.uses_ldq &&
            item.uses_stq == SRAIW_struct.uses_stq &&
            item.flush_on_commit == SRAIW_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SRAIW"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SRAIW"))
        end
      end

      //ADDW
      else if ((item.instr & MASK_ADDW) == EXPT_ADDW) begin
        if (item.iq_type == ADDW_struct.iq_type &&
            item.is_br == ADDW_struct.is_br &&
            item.bypassable == ADDW_struct.bypassable &&
            item.mem_cmd == ADDW_struct.mem_cmd &&
            item.is_fence == ADDW_struct.is_fence &&
            item.is_fencei == ADDW_struct.is_fencei &&
            item.is_amo == ADDW_struct.is_amo &&
            item.uses_ldq == ADDW_struct.uses_ldq &&
            item.uses_stq == ADDW_struct.uses_stq &&
            item.flush_on_commit == ADDW_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "ADDW"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "ADDW"))
        end
      end

      //SUBW
      else if ((item.instr & MASK_SUBW) == EXPT_SUBW) begin
        if (item.iq_type == SUBW_struct.iq_type &&
            item.is_br == SUBW_struct.is_br &&
            item.bypassable == SUBW_struct.bypassable &&
            item.mem_cmd == SUBW_struct.mem_cmd &&
            item.is_fence == SUBW_struct.is_fence &&
            item.is_fencei == SUBW_struct.is_fencei &&
            item.is_amo == SUBW_struct.is_amo &&
            item.uses_ldq == SUBW_struct.uses_ldq &&
            item.uses_stq == SUBW_struct.uses_stq &&
            item.flush_on_commit == SUBW_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SUBW"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SUBW"))
        end
      end

      //SLLW
      else if ((item.instr & MASK_SLLW) == EXPT_SLLW) begin
        if (item.iq_type == SLLW_struct.iq_type &&
            item.is_br == SLLW_struct.is_br &&
            item.bypassable == SLLW_struct.bypassable &&
            item.mem_cmd == SLLW_struct.mem_cmd &&
            item.is_fence == SLLW_struct.is_fence &&
            item.is_fencei == SLLW_struct.is_fencei &&
            item.is_amo == SLLW_struct.is_amo &&
            item.uses_ldq == SLLW_struct.uses_ldq &&
            item.uses_stq == SLLW_struct.uses_stq &&
            item.flush_on_commit == SLLW_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SLLW"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SLLW"))
        end
      end

      //SRLW
      else if ((item.instr & MASK_SRLW) == EXPT_SRLW) begin
        if (item.iq_type == SRLW_struct.iq_type &&
            item.is_br == SRLW_struct.is_br &&
            item.bypassable == SRLW_struct.bypassable &&
            item.mem_cmd == SRLW_struct.mem_cmd &&
            item.is_fence == SRLW_struct.is_fence &&
            item.is_fencei == SRLW_struct.is_fencei &&
            item.is_amo == SRLW_struct.is_amo &&
            item.uses_ldq == SRLW_struct.uses_ldq &&
            item.uses_stq == SRLW_struct.uses_stq &&
            item.flush_on_commit == SRLW_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SRLW"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SRLW"))
        end
      end

      //SRAW
      else if ((item.instr & MASK_SRAW) == EXPT_SRAW) begin
        if (item.iq_type == SRAW_struct.iq_type &&
            item.is_br == SRAW_struct.is_br &&
            item.bypassable == SRAW_struct.bypassable &&
            item.mem_cmd == SRAW_struct.mem_cmd &&
            item.is_fence == SRAW_struct.is_fence &&
            item.is_fencei == SRAW_struct.is_fencei &&
            item.is_amo == SRAW_struct.is_amo &&
            item.uses_ldq == SRAW_struct.uses_ldq &&
            item.uses_stq == SRAW_struct.uses_stq &&
            item.flush_on_commit == SRAW_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SRAW"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SRAW"))
        end
      end

  //RV32M

      //MUL
      else if ((item.instr & MASK_MUL) == EXPT_MUL) begin
        if (item.iq_type == MUL_struct.iq_type &&
            item.is_br == MUL_struct.is_br &&
            item.bypassable == MUL_struct.bypassable &&
            item.mem_cmd == MUL_struct.mem_cmd &&
            item.is_fence == MUL_struct.is_fence &&
            item.is_fencei == MUL_struct.is_fencei &&
            item.is_amo == MUL_struct.is_amo &&
            item.uses_ldq == MUL_struct.uses_ldq &&
            item.uses_stq == MUL_struct.uses_stq &&
            item.flush_on_commit == MUL_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "MUL"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "MUL"))
        end
      end

      //MULH
      else if ((item.instr & MASK_MULH) == EXPT_MULH) begin
        if (item.iq_type == MULH_struct.iq_type &&
            item.is_br == MULH_struct.is_br &&
            item.bypassable == MULH_struct.bypassable &&
            item.mem_cmd == MULH_struct.mem_cmd &&
            item.is_fence == MULH_struct.is_fence &&
            item.is_fencei == MULH_struct.is_fencei &&
            item.is_amo == MULH_struct.is_amo &&
            item.uses_ldq == MULH_struct.uses_ldq &&
            item.uses_stq == MULH_struct.uses_stq &&
            item.flush_on_commit == MULH_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "MULH"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "MULH"))
        end
      end

      //MULHSU
      else if ((item.instr & MASK_MULHSU) == EXPT_MULHSU) begin
        if (item.iq_type == MULHSU_struct.iq_type &&
            item.is_br == MULHSU_struct.is_br &&
            item.bypassable == MULHSU_struct.bypassable &&
            item.mem_cmd == MULHSU_struct.mem_cmd &&
            item.is_fence == MULHSU_struct.is_fence &&
            item.is_fencei == MULHSU_struct.is_fencei &&
            item.is_amo == MULHSU_struct.is_amo &&
            item.uses_ldq == MULHSU_struct.uses_ldq &&
            item.uses_stq == MULHSU_struct.uses_stq &&
            item.flush_on_commit == MULHSU_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "MULHSU"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "MULHSU"))
        end
      end

      //MULHU
      else if ((item.instr & MASK_MULHU) == EXPT_MULHU) begin
        if (item.iq_type == MULHU_struct.iq_type &&
            item.is_br == MULHU_struct.is_br &&
            item.bypassable == MULHU_struct.bypassable &&
            item.mem_cmd == MULHU_struct.mem_cmd &&
            item.is_fence == MULHU_struct.is_fence &&
            item.is_fencei == MULHU_struct.is_fencei &&
            item.is_amo == MULHU_struct.is_amo &&
            item.uses_ldq == MULHU_struct.uses_ldq &&
            item.uses_stq == MULHU_struct.uses_stq &&
            item.flush_on_commit == MULHU_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "MULHU"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "MULHU"))
        end
      end

      //DIV
      else if ((item.instr & MASK_DIV) == EXPT_DIV) begin
        if (item.iq_type == DIV_struct.iq_type &&
            item.is_br == DIV_struct.is_br &&
            item.bypassable == DIV_struct.bypassable &&
            item.mem_cmd == DIV_struct.mem_cmd &&
            item.is_fence == DIV_struct.is_fence &&
            item.is_fencei == DIV_struct.is_fencei &&
            item.is_amo == DIV_struct.is_amo &&
            item.uses_ldq == DIV_struct.uses_ldq &&
            item.uses_stq == DIV_struct.uses_stq &&
            item.flush_on_commit == DIV_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "DIV"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "DIV"))
        end
      end

      //DIVU
      else if ((item.instr & MASK_DIVU) == EXPT_DIVU) begin
        if (item.iq_type == DIVU_struct.iq_type &&
            item.is_br == DIVU_struct.is_br &&
            item.bypassable == DIVU_struct.bypassable &&
            item.mem_cmd == DIVU_struct.mem_cmd &&
            item.is_fence == DIVU_struct.is_fence &&
            item.is_fencei == DIVU_struct.is_fencei &&
            item.is_amo == DIVU_struct.is_amo &&
            item.uses_ldq == DIVU_struct.uses_ldq &&
            item.uses_stq == DIVU_struct.uses_stq &&
            item.flush_on_commit == DIVU_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "DIVU"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "DIVU"))
        end
      end

      //REM
      else if ((item.instr & MASK_REM) == EXPT_REM) begin
        if (item.iq_type == REM_struct.iq_type &&
            item.is_br == REM_struct.is_br &&
            item.bypassable == REM_struct.bypassable &&
            item.mem_cmd == REM_struct.mem_cmd &&
            item.is_fence == REM_struct.is_fence &&
            item.is_fencei == REM_struct.is_fencei &&
            item.is_amo == REM_struct.is_amo &&
            item.uses_ldq == REM_struct.uses_ldq &&
            item.uses_stq == REM_struct.uses_stq &&
            item.flush_on_commit == REM_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "REM"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "REM"))
        end
      end

      //REMU
      else if ((item.instr & MASK_REMU) == EXPT_REMU) begin
        if (item.iq_type == REMU_struct.iq_type &&
            item.is_br == REMU_struct.is_br &&
            item.bypassable == REMU_struct.bypassable &&
            item.mem_cmd == REMU_struct.mem_cmd &&
            item.is_fence == REMU_struct.is_fence &&
            item.is_fencei == REMU_struct.is_fencei &&
            item.is_amo == REMU_struct.is_amo &&
            item.uses_ldq == REMU_struct.uses_ldq &&
            item.uses_stq == REMU_struct.uses_stq &&
            item.flush_on_commit == REMU_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "REMU"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "REMU"))
        end
      end

  //RV64M

      //MULW
      else if ((item.instr & MASK_MULW) == EXPT_MULW) begin
        if (item.iq_type == MULW_struct.iq_type &&
            item.is_br == MULW_struct.is_br &&
            item.bypassable == MULW_struct.bypassable &&
            item.mem_cmd == MULW_struct.mem_cmd &&
            item.is_fence == MULW_struct.is_fence &&
            item.is_fencei == MULW_struct.is_fencei &&
            item.is_amo == MULW_struct.is_amo &&
            item.uses_ldq == MULW_struct.uses_ldq &&
            item.uses_stq == MULW_struct.uses_stq &&
            item.flush_on_commit == MULW_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "MULW"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "MULW"))
        end
      end

      //DIVW
      else if ((item.instr & MASK_DIVW) == EXPT_DIVW) begin
        if (item.iq_type == DIVW_struct.iq_type &&
            item.is_br == DIVW_struct.is_br &&
            item.bypassable == DIVW_struct.bypassable &&
            item.mem_cmd == DIVW_struct.mem_cmd &&
            item.is_fence == DIVW_struct.is_fence &&
            item.is_fencei == DIVW_struct.is_fencei &&
            item.is_amo == DIVW_struct.is_amo &&
            item.uses_ldq == DIVW_struct.uses_ldq &&
            item.uses_stq == DIVW_struct.uses_stq &&
            item.flush_on_commit == DIVW_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "DIVW"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "DIVW"))
        end
      end

      //DIVUW
      else if ((item.instr & MASK_DIVUW) == EXPT_DIVUW) begin
        if (item.iq_type == DIVUW_struct.iq_type &&
            item.is_br == DIVUW_struct.is_br &&
            item.bypassable == DIVUW_struct.bypassable &&
            item.mem_cmd == DIVUW_struct.mem_cmd &&
            item.is_fence == DIVUW_struct.is_fence &&
            item.is_fencei == DIVUW_struct.is_fencei &&
            item.is_amo == DIVUW_struct.is_amo &&
            item.uses_ldq == DIVUW_struct.uses_ldq &&
            item.uses_stq == DIVUW_struct.uses_stq &&
            item.flush_on_commit == DIVUW_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "DIVUW"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "DIVUW"))
        end
      end

      //REMW
      else if ((item.instr & MASK_REMW) == EXPT_REMW) begin
        if (item.iq_type == REMW_struct.iq_type &&
            item.is_br == REMW_struct.is_br &&
            item.bypassable == REMW_struct.bypassable &&
            item.mem_cmd == REMW_struct.mem_cmd &&
            item.is_fence == REMW_struct.is_fence &&
            item.is_fencei == REMW_struct.is_fencei &&
            item.is_amo == REMW_struct.is_amo &&
            item.uses_ldq == REMW_struct.uses_ldq &&
            item.uses_stq == REMW_struct.uses_stq &&
            item.flush_on_commit == REMW_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "REMW"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "REMW"))
        end
      end

      //REMUW
      else if ((item.instr & MASK_REMUW) == EXPT_REMUW) begin
        if (item.iq_type == REMUW_struct.iq_type &&
            item.is_br == REMUW_struct.is_br &&
            item.bypassable == REMUW_struct.bypassable &&
            item.mem_cmd == REMUW_struct.mem_cmd &&
            item.is_fence == REMUW_struct.is_fence &&
            item.is_fencei == REMUW_struct.is_fencei &&
            item.is_amo == REMUW_struct.is_amo &&
            item.uses_ldq == REMUW_struct.uses_ldq &&
            item.uses_stq == REMUW_struct.uses_stq &&
            item.flush_on_commit == REMUW_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "REMUW"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "REMUW"))
        end
      end

  //RV32A

      //LR_W
      else if ((item.instr & MASK_LR_W) == EXPT_LR_W) begin
        if (item.iq_type == LR_W_struct.iq_type &&
            item.is_br == LR_W_struct.is_br &&
            item.bypassable == LR_W_struct.bypassable &&
            item.mem_cmd == LR_W_struct.mem_cmd &&
            item.is_fence == LR_W_struct.is_fence &&
            item.is_fencei == LR_W_struct.is_fencei &&
            item.is_amo == LR_W_struct.is_amo &&
            item.uses_ldq == LR_W_struct.uses_ldq &&
            item.uses_stq == LR_W_struct.uses_stq &&
            item.flush_on_commit == LR_W_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "LR_W"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "LR_W"))
        end
      end

      //SC_W
      else if ((item.instr & MASK_SC_W) == EXPT_SC_W) begin
        if (item.iq_type == SC_W_struct.iq_type &&
            item.is_br == SC_W_struct.is_br &&
            item.bypassable == SC_W_struct.bypassable &&
            item.mem_cmd == SC_W_struct.mem_cmd &&
            item.is_fence == SC_W_struct.is_fence &&
            item.is_fencei == SC_W_struct.is_fencei &&
            item.is_amo == SC_W_struct.is_amo &&
            item.uses_ldq == SC_W_struct.uses_ldq &&
            item.uses_stq == SC_W_struct.uses_stq &&
            item.flush_on_commit == SC_W_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SC_W"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SC_W"))
        end
      end

      //AMOSWAP_W
      else if ((item.instr & MASK_AMOSWAP_W) == EXPT_AMOSWAP_W) begin
        if (item.iq_type == AMOSWAP_W_struct.iq_type &&
            item.is_br == AMOSWAP_W_struct.is_br &&
            item.bypassable == AMOSWAP_W_struct.bypassable &&
            item.mem_cmd == AMOSWAP_W_struct.mem_cmd &&
            item.is_fence == AMOSWAP_W_struct.is_fence &&
            item.is_fencei == AMOSWAP_W_struct.is_fencei &&
            item.is_amo == AMOSWAP_W_struct.is_amo &&
            item.uses_ldq == AMOSWAP_W_struct.uses_ldq &&
            item.uses_stq == AMOSWAP_W_struct.uses_stq &&
            item.flush_on_commit == AMOSWAP_W_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "AMOSWAP_W"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AMOSWAP_W"))
        end
      end

      //AMOADD_W
      else if ((item.instr & MASK_AMOADD_W) == EXPT_AMOADD_W) begin
        if (item.iq_type == AMOADD_W_struct.iq_type &&
            item.is_br == AMOADD_W_struct.is_br &&
            item.bypassable == AMOADD_W_struct.bypassable &&
            item.mem_cmd == AMOADD_W_struct.mem_cmd &&
            item.is_fence == AMOADD_W_struct.is_fence &&
            item.is_fencei == AMOADD_W_struct.is_fencei &&
            item.is_amo == AMOADD_W_struct.is_amo &&
            item.uses_ldq == AMOADD_W_struct.uses_ldq &&
            item.uses_stq == AMOADD_W_struct.uses_stq &&
            item.flush_on_commit == AMOADD_W_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "AMOADD_W"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AMOADD_W"))
        end
      end

      //AMOXOR_W
      else if ((item.instr & MASK_AMOXOR_W) == EXPT_AMOXOR_W) begin
        if (item.iq_type == AMOXOR_W_struct.iq_type &&
            item.is_br == AMOXOR_W_struct.is_br &&
            item.bypassable == AMOXOR_W_struct.bypassable &&
            item.mem_cmd == AMOXOR_W_struct.mem_cmd &&
            item.is_fence == AMOXOR_W_struct.is_fence &&
            item.is_fencei == AMOXOR_W_struct.is_fencei &&
            item.is_amo == AMOXOR_W_struct.is_amo &&
            item.uses_ldq == AMOXOR_W_struct.uses_ldq &&
            item.uses_stq == AMOXOR_W_struct.uses_stq &&
            item.flush_on_commit == AMOXOR_W_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "AMOXOR_W"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AMOXOR_W"))
        end
      end

      //AMOAND_W
      else if ((item.instr & MASK_AMOAND_W) == EXPT_AMOAND_W) begin
        if (item.iq_type == AMOAND_W_struct.iq_type &&
            item.is_br == AMOAND_W_struct.is_br &&
            item.bypassable == AMOAND_W_struct.bypassable &&
            item.mem_cmd == AMOAND_W_struct.mem_cmd &&
            item.is_fence == AMOAND_W_struct.is_fence &&
            item.is_fencei == AMOAND_W_struct.is_fencei &&
            item.is_amo == AMOAND_W_struct.is_amo &&
            item.uses_ldq == AMOAND_W_struct.uses_ldq &&
            item.uses_stq == AMOAND_W_struct.uses_stq &&
            item.flush_on_commit == AMOAND_W_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "AMOAND_W"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AMOAND_W"))
        end
      end

      //AMOOR_W
      else if ((item.instr & MASK_AMOOR_W) == EXPT_AMOOR_W) begin
        if (item.iq_type == AMOOR_W_struct.iq_type &&
            item.is_br == AMOOR_W_struct.is_br &&
            item.bypassable == AMOOR_W_struct.bypassable &&
            item.mem_cmd == AMOOR_W_struct.mem_cmd &&
            item.is_fence == AMOOR_W_struct.is_fence &&
            item.is_fencei == AMOOR_W_struct.is_fencei &&
            item.is_amo == AMOOR_W_struct.is_amo &&
            item.uses_ldq == AMOOR_W_struct.uses_ldq &&
            item.uses_stq == AMOOR_W_struct.uses_stq &&
            item.flush_on_commit == AMOOR_W_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "AMOOR_W"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AMOOR_W"))
        end
      end

      //AMOMIN_W
      else if ((item.instr & MASK_AMOMIN_W) == EXPT_AMOMIN_W) begin
        if (item.iq_type == AMOMIN_W_struct.iq_type &&
            item.is_br == AMOMIN_W_struct.is_br &&
            item.bypassable == AMOMIN_W_struct.bypassable &&
            item.mem_cmd == AMOMIN_W_struct.mem_cmd &&
            item.is_fence == AMOMIN_W_struct.is_fence &&
            item.is_fencei == AMOMIN_W_struct.is_fencei &&
            item.is_amo == AMOMIN_W_struct.is_amo &&
            item.uses_ldq == AMOMIN_W_struct.uses_ldq &&
            item.uses_stq == AMOMIN_W_struct.uses_stq &&
            item.flush_on_commit == AMOMIN_W_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "AMOMIN_W"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AMOMIN_W"))
        end
      end

      //AMOMAX_W
      else if ((item.instr & MASK_AMOMAX_W) == EXPT_AMOMAX_W) begin
        if (item.iq_type == AMOMAX_W_struct.iq_type &&
            item.is_br == AMOMAX_W_struct.is_br &&
            item.bypassable == AMOMAX_W_struct.bypassable &&
            item.mem_cmd == AMOMAX_W_struct.mem_cmd &&
            item.is_fence == AMOMAX_W_struct.is_fence &&
            item.is_fencei == AMOMAX_W_struct.is_fencei &&
            item.is_amo == AMOMAX_W_struct.is_amo &&
            item.uses_ldq == AMOMAX_W_struct.uses_ldq &&
            item.uses_stq == AMOMAX_W_struct.uses_stq &&
            item.flush_on_commit == AMOMAX_W_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "AMOMAX_W"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AMOMAX_W"))
        end
      end
    
      //AMOMINU_W
      else if ((item.instr & MASK_AMOMINU_W) == EXPT_AMOMINU_W) begin
        if (item.iq_type == AMOMINU_W_struct.iq_type &&
            item.is_br == AMOMINU_W_struct.is_br &&
            item.bypassable == AMOMINU_W_struct.bypassable &&
            item.mem_cmd == AMOMINU_W_struct.mem_cmd &&
            item.is_fence == AMOMINU_W_struct.is_fence &&
            item.is_fencei == AMOMINU_W_struct.is_fencei &&
            item.is_amo == AMOMINU_W_struct.is_amo &&
            item.uses_ldq == AMOMINU_W_struct.uses_ldq &&
            item.uses_stq == AMOMINU_W_struct.uses_stq &&
            item.flush_on_commit == AMOMINU_W_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "AMOMINU_W"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AMOMINU_W"))
        end
      end

      //AMOMAXU_W
      else if ((item.instr & MASK_AMOMAXU_W) == EXPT_AMOMAXU_W) begin
        if (item.iq_type == AMOMAXU_W_struct.iq_type &&
            item.is_br == AMOMAXU_W_struct.is_br &&
            item.bypassable == AMOMAXU_W_struct.bypassable &&
            item.mem_cmd == AMOMAXU_W_struct.mem_cmd &&
            item.is_fence == AMOMAXU_W_struct.is_fence &&
            item.is_fencei == AMOMAXU_W_struct.is_fencei &&
            item.is_amo == AMOMAXU_W_struct.is_amo &&
            item.uses_ldq == AMOMAXU_W_struct.uses_ldq &&
            item.uses_stq == AMOMAXU_W_struct.uses_stq &&
            item.flush_on_commit == AMOMAXU_W_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "AMOMAXU_W"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AMOMAXU_W"))
        end
      end
	//RV64A

      //LR_D
      else if ((item.instr & MASK_LR_D) == EXPT_LR_D) begin
        if (item.iq_type == LR_D_struct.iq_type &&
            item.is_br == LR_D_struct.is_br &&
            item.bypassable == LR_D_struct.bypassable &&
            item.mem_cmd == LR_D_struct.mem_cmd &&
            item.is_fence == LR_D_struct.is_fence &&
            item.is_fencei == LR_D_struct.is_fencei &&
            item.is_amo == LR_D_struct.is_amo &&
            item.uses_ldq == LR_D_struct.uses_ldq &&
            item.uses_stq == LR_D_struct.uses_stq &&
            item.flush_on_commit == LR_D_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "LR_D"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "LR_D"))
        end
      end

      //SC_D
      else if ((item.instr & MASK_SC_D) == EXPT_SC_D) begin
        if (item.iq_type == SC_D_struct.iq_type &&
            item.is_br == SC_D_struct.is_br &&
            item.bypassable == SC_D_struct.bypassable &&
            item.mem_cmd == SC_D_struct.mem_cmd &&
            item.is_fence == SC_D_struct.is_fence &&
            item.is_fencei == SC_D_struct.is_fencei &&
            item.is_amo == SC_D_struct.is_amo &&
            item.uses_ldq == SC_D_struct.uses_ldq &&
            item.uses_stq == SC_D_struct.uses_stq &&
            item.flush_on_commit == SC_D_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "SC_D"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SC_D"))
        end
      end

      //AMOSWAP_D
      else if ((item.instr & MASK_AMOSWAP_D) == EXPT_AMOSWAP_D) begin
        if (item.iq_type == AMOSWAP_D_struct.iq_type &&
            item.is_br == AMOSWAP_D_struct.is_br &&
            item.bypassable == AMOSWAP_D_struct.bypassable &&
            item.mem_cmd == AMOSWAP_D_struct.mem_cmd &&
            item.is_fence == AMOSWAP_D_struct.is_fence &&
            item.is_fencei == AMOSWAP_D_struct.is_fencei &&
            item.is_amo == AMOSWAP_D_struct.is_amo &&
            item.uses_ldq == AMOSWAP_D_struct.uses_ldq &&
            item.uses_stq == AMOSWAP_D_struct.uses_stq &&
            item.flush_on_commit == AMOSWAP_D_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "AMOSWAP_D"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AMOSWAP_D"))
        end
      end


      //AMOADD_D
      else if ((item.instr & MASK_AMOADD_D) == EXPT_AMOADD_D) begin
        if (item.iq_type == AMOADD_D_struct.iq_type &&
            item.is_br == AMOADD_D_struct.is_br &&
            item.bypassable == AMOADD_D_struct.bypassable &&
            item.mem_cmd == AMOADD_D_struct.mem_cmd &&
            item.is_fence == AMOADD_D_struct.is_fence &&
            item.is_fencei == AMOADD_D_struct.is_fencei &&
            item.is_amo == AMOADD_D_struct.is_amo &&
            item.uses_ldq == AMOADD_D_struct.uses_ldq &&
            item.uses_stq == AMOADD_D_struct.uses_stq &&
            item.flush_on_commit == AMOADD_D_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "AMOADD_D"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AMOADD_D"))
        end
      end

      //AMOXOR_D
      else if ((item.instr & MASK_AMOXOR_D) == EXPT_AMOXOR_D) begin
        if (item.iq_type == AMOXOR_D_struct.iq_type &&
            item.is_br == AMOXOR_D_struct.is_br &&
            item.bypassable == AMOXOR_D_struct.bypassable &&
            item.mem_cmd == AMOXOR_D_struct.mem_cmd &&
            item.is_fence == AMOXOR_D_struct.is_fence &&
            item.is_fencei == AMOXOR_D_struct.is_fencei &&
            item.is_amo == AMOXOR_D_struct.is_amo &&
            item.uses_ldq == AMOXOR_D_struct.uses_ldq &&
            item.uses_stq == AMOXOR_D_struct.uses_stq &&
            item.flush_on_commit == AMOXOR_D_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "AMOXOR_D"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AMOXOR_D"))
        end
      end

      //AMOAND_D
      else if ((item.instr & MASK_AMOAND_D) == EXPT_AMOAND_D) begin
        if (item.iq_type == AMOAND_D_struct.iq_type &&
            item.is_br == AMOAND_D_struct.is_br &&
            item.bypassable == AMOAND_D_struct.bypassable &&
            item.mem_cmd == AMOAND_D_struct.mem_cmd &&
            item.is_fence == AMOAND_D_struct.is_fence &&
            item.is_fencei == AMOAND_D_struct.is_fencei &&
            item.is_amo == AMOAND_D_struct.is_amo &&
            item.uses_ldq == AMOAND_D_struct.uses_ldq &&
            item.uses_stq == AMOAND_D_struct.uses_stq &&
            item.flush_on_commit == AMOAND_D_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "AMOAND_D"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AMOAND_D"))
        end
      end

      //AMOOR_D
      else if ((item.instr & MASK_AMOOR_D) == EXPT_AMOOR_D) begin
        if (item.iq_type == AMOOR_D_struct.iq_type &&
            item.is_br == AMOOR_D_struct.is_br &&
            item.bypassable == AMOOR_D_struct.bypassable &&
            item.mem_cmd == AMOOR_D_struct.mem_cmd &&
            item.is_fence == AMOOR_D_struct.is_fence &&
            item.is_fencei == AMOOR_D_struct.is_fencei &&
            item.is_amo == AMOOR_D_struct.is_amo &&
            item.uses_ldq == AMOOR_D_struct.uses_ldq &&
            item.uses_stq == AMOOR_D_struct.uses_stq &&
            item.flush_on_commit == AMOOR_D_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "AMOOR_D"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AMOOR_D"))
        end
      end

      //AMOMIN_D
      else if ((item.instr & MASK_AMOMIN_D) == EXPT_AMOMIN_D) begin
        if (item.iq_type == AMOMIN_D_struct.iq_type &&
            item.is_br == AMOMIN_D_struct.is_br &&
            item.bypassable == AMOMIN_D_struct.bypassable &&
            item.mem_cmd == AMOMIN_D_struct.mem_cmd &&
            item.is_fence == AMOMIN_D_struct.is_fence &&
            item.is_fencei == AMOMIN_D_struct.is_fencei &&
            item.is_amo == AMOMIN_D_struct.is_amo &&
            item.uses_ldq == AMOMIN_D_struct.uses_ldq &&
            item.uses_stq == AMOMIN_D_struct.uses_stq &&
            item.flush_on_commit == AMOMIN_D_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "AMOMIN_D"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AMOMIN_D"))
        end
      end

      //AMOMAX_D
      else if ((item.instr & MASK_AMOMAX_D) == EXPT_AMOMAX_D) begin
        if (item.iq_type == AMOMAX_D_struct.iq_type &&
            item.is_br == AMOMAX_D_struct.is_br &&
            item.bypassable == AMOMAX_D_struct.bypassable &&
            item.mem_cmd == AMOMAX_D_struct.mem_cmd &&
            item.is_fence == AMOMAX_D_struct.is_fence &&
            item.is_fencei == AMOMAX_D_struct.is_fencei &&
            item.is_amo == AMOMAX_D_struct.is_amo &&
            item.uses_ldq == AMOMAX_D_struct.uses_ldq &&
            item.uses_stq == AMOMAX_D_struct.uses_stq &&
            item.flush_on_commit == AMOMAX_D_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "AMOMAX_D"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AMOMAX_D"))
        end
      end

      //AMOMINU_D
      else if ((item.instr & MASK_AMOMINU_D) == EXPT_AMOMINU_D) begin
        if (item.iq_type == AMOMINU_D_struct.iq_type &&
            item.is_br == AMOMINU_D_struct.is_br &&
            item.bypassable == AMOMINU_D_struct.bypassable &&
            item.mem_cmd == AMOMINU_D_struct.mem_cmd &&
            item.is_fence == AMOMINU_D_struct.is_fence &&
            item.is_fencei == AMOMINU_D_struct.is_fencei &&
            item.is_amo == AMOMINU_D_struct.is_amo &&
            item.uses_ldq == AMOMINU_D_struct.uses_ldq &&
            item.uses_stq == AMOMINU_D_struct.uses_stq &&
            item.flush_on_commit == AMOMINU_D_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "AMOMINU_D"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AMOMINU_D"))
        end
      end

      //AMOMAXU_D
      else if ((item.instr & MASK_AMOMAXU_D) == EXPT_AMOMAXU_D) begin
        if (item.iq_type == AMOMAXU_D_struct.iq_type &&
            item.is_br == AMOMAXU_D_struct.is_br &&
            item.bypassable == AMOMAXU_D_struct.bypassable &&
            item.mem_cmd == AMOMAXU_D_struct.mem_cmd &&
            item.is_fence == AMOMAXU_D_struct.is_fence &&
            item.is_fencei == AMOMAXU_D_struct.is_fencei &&
            item.is_amo == AMOMAXU_D_struct.is_amo &&
            item.uses_ldq == AMOMAXU_D_struct.uses_ldq &&
            item.uses_stq == AMOMAXU_D_struct.uses_stq &&
            item.flush_on_commit == AMOMAXU_D_struct.flush_on_commit) begin
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully done on %s !", "AMOMAXU_D"), UVM_HIGH)
        end else begin
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AMOMAXU_D"))
        end
      end
      //Not valid
      else if (item.instr)
              `uvm_warning("SCBD", $sformatf("WARNING ! Not a valid instruction!: 32'h%08x",item.instr))
  endfunction
endclass
