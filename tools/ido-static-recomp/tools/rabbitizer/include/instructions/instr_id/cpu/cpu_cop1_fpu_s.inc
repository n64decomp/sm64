/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

// OP fd, fs, ft
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x00, add_s, add.s,          .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)        // Floating-Point Add
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x01, sub_s, sub.s,          .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)     // Floating-Point Sub
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x02, mul_s, mul.s,          .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)     // Floating-Point Multiply
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x03, div_s, div.s,          .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)     // Floating-Point Divide

// OP fd, fs
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x04, sqrt_s, sqrt.s,        .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)    // Floating-Point Square Root
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x05, abs_s, abs.s,          .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)     // Floating-Point Absolute Value
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x06, mov_s, mov.s,          .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)     // Floating-Point Move
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x07, neg_s, neg.s,          .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)     // Floating-Point Negate

RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x08, round_l_s, round.l.s,  .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true) // Floating-Point Round to Long Fixed-Point
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x09, trunc_l_s, trunc.l.s,  .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true) // Floating-Point Truncate to Long Fixed-Point
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x0A, ceil_l_s, ceil.l.s,    .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)  // Floating-Point Ceiling Convert to Long Fixed-Point
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x0B, floor_l_s, floor.l.s,  .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true) // Floating-Point Floor Convert to Long Fixed-Point

RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x0C, round_w_s, round.w.s,  .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true) // Floating-Point Round to Word Fixed-Point
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x0D, trunc_w_s, trunc.w.s,  .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true) // Floating-Point Truncate to Word Fixed-Point
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x0E, ceil_w_s, ceil.w.s,    .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)  // Floating-Point Ceiling Convert to Word Fixed-Point
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x0F, floor_w_s, floor.w.s,  .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true) // Floating-Point Floor Convert to Word Fixed-Point

// OP fd, fs
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x21, cvt_d_s, cvt.d.s,      .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true, .isDouble=true)
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x24, cvt_w_s, cvt.w.s,      .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x25, cvt_l_s, cvt.l.s,      .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)

// OP fs, ft
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x30, c_f_s, c.f.s,          .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x31, c_un_s, c.un.s,        .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x32, c_eq_s, c.eq.s,        .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x33, c_ueq_s, c.ueq.s,      .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x34, c_olt_s, c.olt.s,      .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x35, c_ult_s, c.ult.s,      .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x36, c_ole_s, c.ole.s,      .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x37, c_ule_s, c.ule.s,      .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)

RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x38, c_sf_s, c.sf.s,        .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x39, c_ngle_s, c.ngle.s,    .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x3A, c_seq_s, c.seq.s,      .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x3B, c_ngl_s, c.ngl.s,      .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x3C, c_lt_s, c.lt.s,        .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x3D, c_nge_s, c.nge.s,      .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x3E, c_le_s, c.le.s,        .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x3F, c_ngt_s, c.ngt.s,      .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)
