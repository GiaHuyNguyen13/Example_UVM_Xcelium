class driver extends uvm_driver #(item);              
  `uvm_component_utils(driver)
  function new(string name = "driver", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  virtual decode_if vif;
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual decode_if)::get(this, "", "decode_if", vif))
      `uvm_fatal("DRV", "Could not get vif")
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      item m_item;
      `uvm_info("DRV", $sformatf("Wait for item from sequencer"), UVM_HIGH)
      seq_item_port.get_next_item(m_item); // get next item
      drive_item(m_item); // forward item to DUT through interface
      seq_item_port.item_done(); // item get done
    end
  endtask
  
  bit [31:0] vif_cb_instr_temp;

  virtual task drive_item(item m_item);
    @(posedge vif.clk);
    if (m_item.extension == RV32I) begin
        case(m_item.RV32I_type)
            RV32I_RType: vif_cb_instr_temp = { m_item.RV32I_RType_funct7,
                                               m_item.rs2,
                                               m_item.rs1,
                                               m_item.RV32I_RType_funct3,
                                               m_item.rd,
                                               m_item.RV32I_RType_opcode};
            RV32I_IType: vif_cb_instr_temp = { m_item.RV32I_IType_imm,
                                               m_item.RV32I_IType_rs1,
                                               m_item.RV32I_IType_funct3,
                                               m_item.RV32I_IType_rd,
                                               m_item.RV32I_IType_opcode};
            RV32I_SType: vif_cb_instr_temp = { m_item.RV32I_SType_imm[11:5],
                                               m_item.rs2,
                                               m_item.rs1,
                                               m_item.RV32I_SType_funct3,
                                               m_item.RV32I_SType_imm[4:0],
                                               m_item.RV32I_SType_opcode};
            RV32I_BType: vif_cb_instr_temp = { m_item.RV32I_BType_imm[12],
                                               m_item.RV32I_BType_imm[10:5],
                                               m_item.rs2,
                                               m_item.rs1,
                                               m_item.RV32I_BType_funct3,
                                               m_item.RV32I_BType_imm[4:1],
                                               m_item.RV32I_BType_imm[11],
                                               m_item.RV32I_BType_opcode};
            RV32I_UType: vif_cb_instr_temp = { m_item.RV32I_UType_imm,
                                               m_item.rd,
                                               m_item.RV32I_UType_opcode};
            RV32I_JType: vif_cb_instr_temp = { m_item.RV32I_JType_imm,
                                               m_item.rd,
                                               m_item.RV32I_JType_opcode};
        endcase
    end
    else if (m_item.extension == RV64I) begin
        case(m_item.RV64I_type)
            RV64I_RType: begin
               case(m_item.RV64I_RType_types)
                    RV64I_RType_I: vif_cb_instr_temp = {m_item.RV64I_RType_funct7_I,
                                                        m_item.RV64I_RType_shamt_I,
                                                        m_item.rs1,
                                                        m_item.RV64I_RType_funct3,
                                                        m_item.rd,
                                                        m_item.RV64I_RType_opcode};
                    RV64I_RType_W: vif_cb_instr_temp = {m_item.RV64I_RType_funct7_W,
                                                        m_item.RV64I_RType_shamt_W,
                                                        m_item.rs1,
                                                        m_item.RV64I_RType_funct3,
                                                        m_item.rd,
                                                        m_item.RV64I_RType_opcode};
               endcase
            end
            RV64I_IType: vif_cb_instr_temp = { m_item.RV64I_IType_imm,
                                               m_item.rs1,
                                               m_item.RV64I_IType_funct3,
                                               m_item.rd,
                                               m_item.RV64I_IType_opcode};
            RV64I_SType: vif_cb_instr_temp = { m_item.RV64I_SType_imm[11:5],
                                               m_item.rs2,
                                               m_item.rs1,
                                               m_item.RV64I_SType_funct3,
                                               m_item.RV64I_SType_imm[4:0],
                                               m_item.RV64I_SType_opcode};
        endcase
    end
    else if (m_item.extension == RV32M) begin
        vif_cb_instr_temp = { m_item.RV32M_funct7,
                              m_item.rs2,
                              m_item.rs1,
                              m_item.RV32M_funct3,
                              m_item.rd,
                              m_item.RV32M_opcode};
    end
    else if (m_item.extension == RV64M) begin
        vif_cb_instr_temp = { m_item.RV64M_funct7,
                              m_item.rs2,
                              m_item.rs1,
                              m_item.RV64M_funct3,
                              m_item.rd,
                              m_item.RV64M_opcode};
    end
    else if (m_item.extension == RV32A) begin
        vif_cb_instr_temp = { m_item.RV32A_funct7,
                              m_item.RV32A_aq_rl,
                              m_item.RV32A_rs2,
                              m_item.rs1,
                              m_item.RV32A_funct3,
                              m_item.rd,
                              m_item.RV32A_opcode};
    end
    else if (m_item.extension == RV64A) begin
        vif_cb_instr_temp = { m_item.RV64A_funct7,
                              m_item.RV64A_aq_rl,
                              m_item.RV64A_rs2,
                              m_item.rs1,
                              m_item.RV64A_funct3,
                              m_item.rd,
                              m_item.RV64A_opcode};
    end
     
// sending generated instruction from sequencer to virtual interface
  vif.cb.instr <= vif_cb_instr_temp;
// sending other inputs to virtual interface
  vif.cb.io_enq_uop_is_sfb <= m_item.io_enq_uop_is_sfb;
  vif.cb.io_interrupt_cause <= m_item.io_interrupt_cause;
  vif.cb.io_interrupt  <= 1'b0;//m_item.io_interrupt;
  vif.cb.io_csr_decode_fp_illegal  <= 1'b0;//m_item.io_csr_decode_fp_illegal;
  vif.cb.io_csr_decode_read_illegal  <= 1'b0;//m_item.io_csr_decode_read_illegal;
  vif.cb.io_csr_decode_write_illegal  <= 1'b0;//m_item.io_csr_decode_write_illegal;
  vif.cb.io_csr_decode_write_flush  <= 1'b0;//m_item.io_csr_decode_write_flush;
  vif.cb.io_csr_decode_system_illegal  <= 1'b0;//m_item.io_csr_decode_system_illegal;
  vif.cb.io_enq_uop_xcpt_pf_if  <= 1'b0;//m_item.io_enq_uop_xcpt_pf_if;
  vif.cb.io_enq_uop_xcpt_ae_if  <= 1'b0;//m_item.io_enq_uop_xcpt_ae_if;
  vif.cb.io_enq_uop_bp_debug_if  <= 1'b0;//m_item.io_enq_uop_bp_debug_if;
  vif.cb.io_enq_uop_bp_xcpt_if  <= 1'b0;//m_item.io_enq_uop_bp_xcpt_if;
  vif.cb.true_random_instr <= m_item.true_random_instr;
/*      vif.instr <= m_item.instr;
      vif.out_instr <= m_item.out_instr;
      vif.rstn <= m_item.rstn;
      //vif.clk <= m_item.clk;
      vif.iq_type <= m_item.iq_type;
      vif.is_br <= m_item.is_br;
      vif.bypassable <= m_item.bypassable;
      vif.mem_cmd <= m_item.mem_cmd;
      vif.is_fence <= m_item.is_fence;
      vif.is_fencei <= m_item.is_fencei;
      vif.is_amo <= m_item.is_amo;
      vif.uses_ldq <= m_item.uses_ldq;
      vif.uses_stq <= m_item.uses_stq;
      vif.flush_on_commit <= m_item.flush_on_commit;
      vif.uopc <= m_item.uopc;
      vif.io_enq_uop_is_sfb <= m_item.io_enq_uop_is_sfb;
      vif.io_deq_uop_is_sfb <= m_item.io_deq_uop_is_sfb;
      vif.fu_code <= m_item.fu_code;
      vif.is_jalr <= m_item.is_jalr;
      vif.is_jal <= m_item.is_jal;
      vif.imm_packed <= m_item.imm_packed;
      vif.ldst <= m_item.ldst;
      vif.lrs1 <= m_item.lrs1;
      vif.lrs2 <= m_item.lrs2;
      vif.lrs3 <= m_item.lrs3;
      vif.is_unique <= m_item.is_unique;
      vif.is_sys_pc2epc <= m_item.is_sys_pc2epc;
      vif.ldst_is_rs1 <= m_item.ldst_is_rs1;
      vif.ldst_val <= m_item.ldst_val;
      vif.dst_rtype <= m_item.dst_rtype;
      vif.lrs1_rtype <= m_item.lrs1_rtype;
      vif.lrs2_rtype <= m_item.lrs2_rtype;
      vif.frs3_en <= m_item.frs3_en;
      vif.fp_val <= m_item.fp_val;
      vif.mem_size <= m_item.mem_size;
      vif.mem_signed <= m_item.mem_signed;
      vif.io_interrupt_cause <= m_item.io_interrupt_cause;
      vif.io_interrupt <= m_item.io_interrupt;
      vif.io_csr_decode_fp_illegal <= m_item.io_csr_decode_fp_illegal;
      vif.io_csr_decode_read_illegal <= m_item.io_csr_decode_read_illegal;
      vif.io_csr_decode_write_illegal <= m_item.io_csr_decode_write_illegal;
      vif.io_csr_decode_write_flush <= m_item.io_csr_decode_write_flush;
      vif.io_csr_decode_system_illegal <= m_item.io_csr_decode_system_illegal;
      vif.io_enq_uop_xcpt_pf_if <= m_item.io_enq_uop_xcpt_pf_if;
      vif.io_enq_uop_xcpt_ae_if <= m_item.io_enq_uop_xcpt_ae_if;
      vif.io_enq_uop_bp_debug_if <= m_item.io_enq_uop_bp_debug_if;
      vif.io_enq_uop_bp_xcpt_if <= m_item.io_enq_uop_bp_xcpt_if;
      vif.exception <= m_item.exception;
      vif.exc_cause <= m_item.exc_cause;
      vif.true_random_instr <= m_item.true_random_instr;
*/

  endtask
endclass