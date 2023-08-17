/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

// OP fd, fs
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x20, cvt_s_l, cvt.s.l,    .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true)
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, 0x21, cvt_d_l, cvt.d.l,    .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isFloat=true, .isDouble=true)
