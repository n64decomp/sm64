/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

// OP cop2t, vd[index]
RABBITIZER_DEF_INSTR_ID(rsp, 0x00, mfc2,    .operands={RAB_OPERAND_rsp_cop2t, RAB_OPERAND_rsp_vs_index}, .modifiesRt=true)
RABBITIZER_DEF_INSTR_ID(rsp, 0x04, mtc2,    .operands={RAB_OPERAND_rsp_cop2t, RAB_OPERAND_rsp_vs_index})

// OP rt, cop2cd
RABBITIZER_DEF_INSTR_ID(rsp, 0x02, cfc2,    .operands={RAB_OPERAND_cpu_rt, RAB_OPERAND_rsp_cop2cd}, .modifiesRt=true)
RABBITIZER_DEF_INSTR_ID(rsp, 0x06, ctc2,    .operands={RAB_OPERAND_cpu_rt, RAB_OPERAND_rsp_cop2cd})
