/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

// OP rs, IMM
RABBITIZER_DEF_INSTR_ID(rsp, 0x00, bltz,    .operands={RAB_OPERAND_rsp_rs, RAB_OPERAND_cpu_branch_target_label}, .instrType=RABBITIZER_INSTR_TYPE_REGIMM, .isBranch=true)      // Branch on Less Than Zero
RABBITIZER_DEF_INSTR_ID(rsp, 0x01, bgez,    .operands={RAB_OPERAND_rsp_rs, RAB_OPERAND_cpu_branch_target_label}, .instrType=RABBITIZER_INSTR_TYPE_REGIMM, .isBranch=true)      // Branch on Greater than or Equal to Zero

RABBITIZER_DEF_INSTR_ID(rsp, 0x10, bltzal,  .operands={RAB_OPERAND_rsp_rs, RAB_OPERAND_cpu_branch_target_label}, .instrType=RABBITIZER_INSTR_TYPE_REGIMM, .isBranch=true, .doesLink=true) // Branch on Less Than Zero and Link
RABBITIZER_DEF_INSTR_ID(rsp, 0x11, bgezal,  .operands={RAB_OPERAND_rsp_rs, RAB_OPERAND_cpu_branch_target_label}, .instrType=RABBITIZER_INSTR_TYPE_REGIMM, .isBranch=true, .doesLink=true) // Branch on Greater Than or Equal to Zero and Link


// Pseudo-Instruction Unique IDs

RABBITIZER_DEF_INSTR_ID(rsp, -0x11, bal,    .operands={RAB_OPERAND_cpu_branch_target_label}, .instrType=RABBITIZER_INSTR_TYPE_REGIMM, .isBranch=true, .doesLink=true, .isPseudo=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I) // Branch and Link
