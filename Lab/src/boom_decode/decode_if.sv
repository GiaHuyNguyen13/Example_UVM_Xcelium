// @author: hungnc5
interface decode_if (input bit clk);
    logic [31:0] instr; // bidirect
    logic [31:0] out_instr;
    logic rstn;
    logic [2:0] iq_type;
    logic is_br;
    logic bypassable;
    logic [4:0] mem_cmd;
    logic is_fence;
    logic is_fencei;
    logic is_amo;
    logic uses_ldq;
    logic uses_stq;
    logic flush_on_commit;
    bit [6:0] uopc;
    bit io_enq_uop_is_sfb; // bidirect
    bit io_deq_uop_is_sfb;
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
    bit [63:0] io_interrupt_cause; // bidirect
    bit io_interrupt; // bidirect
    bit io_csr_decode_fp_illegal;
    bit io_csr_decode_read_illegal;
    bit io_csr_decode_write_illegal;
    bit io_csr_decode_write_flush;
    bit io_csr_decode_system_illegal;
    bit io_enq_uop_xcpt_pf_if;
    bit io_enq_uop_xcpt_ae_if;
    bit io_enq_uop_bp_debug_if;
    bit io_enq_uop_bp_xcpt_if;
    bit exception;
    bit [63:0] exc_cause;
    bit [31:0] true_random_instr;

    clocking cb @(posedge clk);
        output instr;
        output io_enq_uop_is_sfb;
        output io_interrupt_cause;
        output io_interrupt;
        output io_csr_decode_fp_illegal;
        output io_csr_decode_read_illegal;
        output io_csr_decode_write_illegal;
        output io_csr_decode_write_flush;
        output io_csr_decode_system_illegal;
        output io_enq_uop_xcpt_pf_if;
        output io_enq_uop_xcpt_ae_if;
        output io_enq_uop_bp_debug_if;
        output io_enq_uop_bp_xcpt_if;
        output true_random_instr;
    endclocking

    modport DRV (clocking cb,
                input clk
    );
    modport MON (input instr,
                 input out_instr,
                 input rstn,
                 input clk,
                 input iq_type,
                 input is_br,
                 input bypassable,
                 input mem_cmd,
                 input is_fence,
                 input is_fencei,
                 input is_amo,
                 input uses_ldq,
                 input uses_stq,
                 input flush_on_commit,
                 input uopc,
                 input io_enq_uop_is_sfb,
                 input io_deq_uop_is_sfb,
                 input fu_code,
                 input is_jalr,
                 input is_jal,
                 input imm_packed,
                 input ldst,
                 input lrs1,
                 input lrs2,
                 input lrs3,
                 input is_unique,
                 input is_sys_pc2epc,
                 input ldst_is_rs1,
                 input ldst_val,
                 input dst_rtype,
                 input lrs1_rtype,
                 input lrs2_rtype,
                 input frs3_en,
                 input fp_val,
                 input mem_size,
                 input mem_signed,
                 input io_interrupt_cause,
                 input io_interrupt,
                 input io_csr_decode_fp_illegal,
                 input io_csr_decode_read_illegal,
                 input io_csr_decode_write_illegal,
                 input io_csr_decode_write_flush,
                 input io_csr_decode_system_illegal,
                 input io_enq_uop_xcpt_pf_if,
                 input io_enq_uop_xcpt_ae_if,
                 input io_enq_uop_bp_debug_if,
                 input io_enq_uop_bp_xcpt_if,
                 input exception,
                 input exc_cause,
                 input true_random_instr
    );
endinterface