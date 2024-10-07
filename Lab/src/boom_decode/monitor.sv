class monitor extends uvm_monitor;
   `uvm_component_utils (monitor)
   function new (string name="monitor", uvm_component parent);
      super.new (name, parent);
   endfunction

   uvm_analysis_port #(item)  mon_ap;
   virtual decode_if          vif;

  virtual function void build_phase (uvm_phase phase);
  super.build_phase(phase);
  if (!uvm_config_db #(virtual decode_if)::get(this, "", "decode_if", vif))
      `uvm_fatal("MON", "Could not get vif")
    mon_ap = new ("mon_ap", this); // create analysis port
  endfunction

  virtual task run_phase (uvm_phase phase);
    super.run_phase(phase);
    // This task monitors the interface for a complete 
    // transaction and writes into analysis port when complete
    forever begin
      @ (vif.cb);
			if (vif.rstn) begin
				item m_item = item::type_id::create("m_item");	 // create temporare item

                m_item.instr = vif.instr;
                m_item.out_instr = vif.out_instr;
                m_item.rstn = vif.rstn;
                m_item.iq_type = vif.iq_type;
                m_item.is_br = vif.is_br;
                m_item.bypassable = vif.bypassable;
                m_item.mem_cmd = vif.mem_cmd;
                m_item.is_fence = vif.is_fence;
                m_item.is_fencei = vif.is_fencei;
                m_item.is_amo = vif.is_amo;
                m_item.uses_ldq = vif.uses_ldq;
                m_item.uses_stq = vif.uses_stq;
                m_item.flush_on_commit = vif.flush_on_commit;
                m_item.uopc = vif.uopc;
                m_item.io_enq_uop_is_sfb = vif.io_enq_uop_is_sfb;
                m_item.io_deq_uop_is_sfb = vif.io_deq_uop_is_sfb;
                m_item.fu_code = vif.fu_code;
                m_item.is_jalr = vif.is_jalr;
                m_item.is_jal = vif.is_jal;
                m_item.imm_packed = vif.imm_packed;
                m_item.ldst = vif.ldst;
                m_item.lrs1 = vif.lrs1;
                m_item.lrs2 = vif.lrs2;
                m_item.lrs3 = vif.lrs3;
                m_item.is_unique = vif.is_unique;
                m_item.is_sys_pc2epc = vif.is_sys_pc2epc;
                m_item.ldst_is_rs1 = vif.ldst_is_rs1;
                m_item.ldst_val = vif.ldst_val;
                m_item.dst_rtype = vif.dst_rtype;
                m_item.lrs1_rtype = vif.lrs1_rtype;
                m_item.lrs2_rtype = vif.lrs2_rtype;
                m_item.frs3_en = vif.frs3_en;
                m_item.fp_val = vif.fp_val;
                m_item.mem_size = vif.mem_size;
                m_item.mem_signed = vif.mem_signed;
                m_item.io_interrupt_cause = vif.io_interrupt_cause;
                m_item.io_interrupt = vif.io_interrupt;
                m_item.io_csr_decode_fp_illegal = vif.io_csr_decode_fp_illegal;
                m_item.io_csr_decode_read_illegal = vif.io_csr_decode_read_illegal;
                m_item.io_csr_decode_write_illegal = vif.io_csr_decode_write_illegal;
                m_item.io_csr_decode_write_flush = vif.io_csr_decode_write_flush;
                m_item.io_csr_decode_system_illegal = vif.io_csr_decode_system_illegal;
                m_item.io_enq_uop_xcpt_pf_if = vif.io_enq_uop_xcpt_pf_if;
                m_item.io_enq_uop_xcpt_ae_if = vif.io_enq_uop_xcpt_ae_if;
                m_item.io_enq_uop_bp_debug_if = vif.io_enq_uop_bp_debug_if;
                m_item.io_enq_uop_bp_xcpt_if = vif.io_enq_uop_bp_xcpt_if;
                m_item.exception = vif.exception;
                m_item.exc_cause = vif.exc_cause;
                m_item.true_random_instr = vif.true_random_instr;	

				mon_ap.write(m_item); // send tempo item to analysis port, which will be sent to scoreboard
       //       `uvm_info("MON", $sformatf("Saw item %s", m_item.convert2str()), UVM_HIGH)
			end
    end
  endtask
endclass
