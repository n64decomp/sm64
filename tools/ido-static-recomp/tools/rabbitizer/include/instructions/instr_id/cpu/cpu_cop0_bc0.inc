/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

// OP IMM
RABBITIZER_DEF_INSTR_ID(cpu, 0x00, bc0f,    .operands={RAB_OPERAND_cpu_branch_target_label}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isBranch=true)      // Branch on FP False
RABBITIZER_DEF_INSTR_ID(cpu, 0x01, bc0t,    .operands={RAB_OPERAND_cpu_branch_target_label}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isBranch=true)      // Branch on FP True
RABBITIZER_DEF_INSTR_ID(cpu, 0x02, bc0fl,   .operands={RAB_OPERAND_cpu_branch_target_label}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isBranch=true, .isBranchLikely=true)     // Branch on FP False Likely
RABBITIZER_DEF_INSTR_ID(cpu, 0x03, bc0tl,   .operands={RAB_OPERAND_cpu_branch_target_label}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .isBranch=true, .isBranchLikely=true)     // Branch on FP True Likely
