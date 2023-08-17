/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

// OP LABEL
RABBITIZER_DEF_INSTR_ID(rsp, 0x02, j,       .operands={RAB_OPERAND_cpu_label}, .instrType=RABBITIZER_INSTR_TYPE_J, .isJump=true)         // Jump
RABBITIZER_DEF_INSTR_ID(rsp, 0x03, jal,     .operands={RAB_OPERAND_cpu_label}, .instrType=RABBITIZER_INSTR_TYPE_J, .isJump=true, .doesLink=true)       // Jump And Link

// OP rs, rt, IMM
RABBITIZER_DEF_INSTR_ID(rsp, 0x04, beq,     .operands={RAB_OPERAND_rsp_rs, RAB_OPERAND_rsp_rt, RAB_OPERAND_cpu_branch_target_label}, .instrType=RABBITIZER_INSTR_TYPE_REGIMM, .isBranch=true)       // Branch on EQual
RABBITIZER_DEF_INSTR_ID(rsp, 0x05, bne,     .operands={RAB_OPERAND_rsp_rs, RAB_OPERAND_rsp_rt, RAB_OPERAND_cpu_branch_target_label}, .instrType=RABBITIZER_INSTR_TYPE_REGIMM, .isBranch=true)       // Branch on Not Equal

// OP rs, IMM
RABBITIZER_DEF_INSTR_ID(rsp, 0x06, blez,    .operands={RAB_OPERAND_rsp_rs, RAB_OPERAND_cpu_branch_target_label}, .instrType=RABBITIZER_INSTR_TYPE_REGIMM, .isBranch=true)      // Branch on Less than or Equal to Zero
RABBITIZER_DEF_INSTR_ID(rsp, 0x07, bgtz,    .operands={RAB_OPERAND_rsp_rs, RAB_OPERAND_cpu_branch_target_label}, .instrType=RABBITIZER_INSTR_TYPE_REGIMM, .isBranch=true)      // Branch on Greater Than Zero

// OP rt, rs, IMM
RABBITIZER_DEF_INSTR_ID(rsp, 0x08, addi,    .operands={RAB_OPERAND_rsp_rt, RAB_OPERAND_rsp_rs, RAB_OPERAND_cpu_immediate}, .instrType=RABBITIZER_INSTR_TYPE_I, .modifiesRt=true, .notEmitedByCompilers=true, .canBeLo=true)      // Add Immediate
RABBITIZER_DEF_INSTR_ID(rsp, 0x09, addiu,   .operands={RAB_OPERAND_rsp_rt, RAB_OPERAND_rsp_rs, RAB_OPERAND_cpu_immediate}, .instrType=RABBITIZER_INSTR_TYPE_I, .modifiesRt=true, .canBeLo=true)     // Add Immediate Unsigned Word
RABBITIZER_DEF_INSTR_ID(rsp, 0x0A, slti,    .operands={RAB_OPERAND_rsp_rt, RAB_OPERAND_rsp_rs, RAB_OPERAND_cpu_immediate}, .instrType=RABBITIZER_INSTR_TYPE_I, .modifiesRt=true)      // Set on Less Than Immediate
RABBITIZER_DEF_INSTR_ID(rsp, 0x0B, sltiu,   .operands={RAB_OPERAND_rsp_rt, RAB_OPERAND_rsp_rs, RAB_OPERAND_cpu_immediate}, .instrType=RABBITIZER_INSTR_TYPE_I, .modifiesRt=true)     // Set on Less Than Immediate Unsigned
RABBITIZER_DEF_INSTR_ID(rsp, 0x0C, andi,    .operands={RAB_OPERAND_rsp_rt, RAB_OPERAND_rsp_rs, RAB_OPERAND_cpu_immediate}, .instrType=RABBITIZER_INSTR_TYPE_I, .isUnsigned=true, .modifiesRt=true)      // And Immediate
RABBITIZER_DEF_INSTR_ID(rsp, 0x0D, ori,     .operands={RAB_OPERAND_rsp_rt, RAB_OPERAND_rsp_rs, RAB_OPERAND_cpu_immediate}, .instrType=RABBITIZER_INSTR_TYPE_I, .isUnsigned=true, .modifiesRt=true, .canBeLo=true)       // Or Immediate
RABBITIZER_DEF_INSTR_ID(rsp, 0x0E, xori,    .operands={RAB_OPERAND_rsp_rt, RAB_OPERAND_rsp_rs, RAB_OPERAND_cpu_immediate}, .instrType=RABBITIZER_INSTR_TYPE_I, .isUnsigned=true, .modifiesRt=true)      // eXclusive OR Immediate

// OP rt, IMM
RABBITIZER_DEF_INSTR_ID(rsp, 0x0F, lui,     .operands={RAB_OPERAND_rsp_rt, RAB_OPERAND_cpu_immediate}, .instrType=RABBITIZER_INSTR_TYPE_I, .isUnsigned=true, .modifiesRt=true, .canBeHi=true)       // Load Upper Immediate

// OP rt, IMM(base)
RABBITIZER_DEF_INSTR_ID(rsp, 0x20, lb,      .operands={RAB_OPERAND_rsp_rt, RAB_OPERAND_rsp_immediate_base}, .instrType=RABBITIZER_INSTR_TYPE_I, .modifiesRt=true, .canBeLo=true, .doesDereference=true, .doesLoad=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)        // Load Byte
RABBITIZER_DEF_INSTR_ID(rsp, 0x21, lh,      .operands={RAB_OPERAND_rsp_rt, RAB_OPERAND_rsp_immediate_base}, .instrType=RABBITIZER_INSTR_TYPE_I, .modifiesRt=true, .canBeLo=true, .doesDereference=true, .doesLoad=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)        // Load Halfword
RABBITIZER_DEF_INSTR_ID(rsp, 0x23, lw,      .operands={RAB_OPERAND_rsp_rt, RAB_OPERAND_rsp_immediate_base}, .instrType=RABBITIZER_INSTR_TYPE_I, .modifiesRt=true, .canBeLo=true, .doesDereference=true, .doesLoad=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)        // Load Word
RABBITIZER_DEF_INSTR_ID(rsp, 0x24, lbu,     .operands={RAB_OPERAND_rsp_rt, RAB_OPERAND_rsp_immediate_base}, .instrType=RABBITIZER_INSTR_TYPE_I, .modifiesRt=true, .canBeLo=true, .doesDereference=true, .doesLoad=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)       // Load Byte Insigned
RABBITIZER_DEF_INSTR_ID(rsp, 0x25, lhu,     .operands={RAB_OPERAND_rsp_rt, RAB_OPERAND_rsp_immediate_base}, .instrType=RABBITIZER_INSTR_TYPE_I, .modifiesRt=true, .canBeLo=true, .doesDereference=true, .doesLoad=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)       // Load Halfword Unsigned
RABBITIZER_DEF_INSTR_ID(rsp, 0x28, sb,      .operands={RAB_OPERAND_rsp_rt, RAB_OPERAND_rsp_immediate_base}, .instrType=RABBITIZER_INSTR_TYPE_I, .canBeLo=true, .doesDereference=true, .doesStore=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)        // Store Byte
RABBITIZER_DEF_INSTR_ID(rsp, 0x29, sh,      .operands={RAB_OPERAND_rsp_rt, RAB_OPERAND_rsp_immediate_base}, .instrType=RABBITIZER_INSTR_TYPE_I, .canBeLo=true, .doesDereference=true, .doesStore=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)        // Store Halfword
RABBITIZER_DEF_INSTR_ID(rsp, 0x2B, sw,      .operands={RAB_OPERAND_rsp_rt, RAB_OPERAND_rsp_immediate_base}, .instrType=RABBITIZER_INSTR_TYPE_I, .canBeLo=true, .doesDereference=true, .doesStore=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)        // Store Word
RABBITIZER_DEF_INSTR_ID(rsp, 0x33, pref,    .operands={RAB_OPERAND_rsp_rt, RAB_OPERAND_rsp_immediate_base}, .instrType=RABBITIZER_INSTR_TYPE_I, .modifiesRt=true, .canBeLo=true, .doesDereference=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_IV)      // Prefetch

RABBITIZER_DEF_INSTR_ID(rsp, 0x2F, cache,   .operands={RAB_OPERAND_cpu_op, RAB_OPERAND_rsp_immediate_base}, .instrType=RABBITIZER_INSTR_TYPE_I, .notEmitedByCompilers=true)     // Cache

// OP ft, IMM(base)
RABBITIZER_DEF_INSTR_ID(rsp, 0x31, lwc1,    .operands={RAB_OPERAND_cpu_ft, RAB_OPERAND_rsp_immediate_base}, .instrType=RABBITIZER_INSTR_TYPE_I, .isFloat=true, .canBeLo=true, .doesDereference=true, .doesLoad=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)      // Load Word to Coprocessor z
RABBITIZER_DEF_INSTR_ID(rsp, 0x39, swc1,    .operands={RAB_OPERAND_cpu_ft, RAB_OPERAND_rsp_immediate_base}, .instrType=RABBITIZER_INSTR_TYPE_I, .isFloat=true, .canBeLo=true, .doesDereference=true, .doesStore=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)      // Store Word from Coprocessor z


// Pseudo-Instruction Unique IDs

// OP IMM
RABBITIZER_DEF_INSTR_ID(rsp, -0x03, b,      .operands={RAB_OPERAND_cpu_branch_target_label}, .instrType=RABBITIZER_INSTR_TYPE_REGIMM, .isBranch=true)         // Branch (unconditional)

// OP rs, IMM
RABBITIZER_DEF_INSTR_ID(rsp, -0x04, beqz,   .operands={RAB_OPERAND_rsp_rs, RAB_OPERAND_cpu_branch_target_label}, .instrType=RABBITIZER_INSTR_TYPE_REGIMM, .isBranch=true)      // Branch on EQual Zero
RABBITIZER_DEF_INSTR_ID(rsp, -0x05, bnez,   .operands={RAB_OPERAND_rsp_rs, RAB_OPERAND_cpu_branch_target_label}, .instrType=RABBITIZER_INSTR_TYPE_REGIMM, .isBranch=true)      // Branch on Not Equal Zero
