/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

// OP rd, rt, sa
RABBITIZER_DEF_INSTR_ID(rsp, 0x00, sll,                    .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rt, RAB_OPERAND_cpu_sa}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)       // Shift word Left Logical
RABBITIZER_DEF_INSTR_ID(rsp, 0x02, srl,                    .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rt, RAB_OPERAND_cpu_sa}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)       // Shift word Right Logical
RABBITIZER_DEF_INSTR_ID(rsp, 0x03, sra,                    .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rt, RAB_OPERAND_cpu_sa}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)       // Shift word Right Arithmetic

// OP rd, rt, rs
RABBITIZER_DEF_INSTR_ID(rsp, 0x04, sllv,                   .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rt, RAB_OPERAND_rsp_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)      // Shift word Left Logical Variable
RABBITIZER_DEF_INSTR_ID(rsp, 0x06, srlv,                   .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rt, RAB_OPERAND_rsp_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)      // Shift word Right Logical Variable
RABBITIZER_DEF_INSTR_ID(rsp, 0x07, srav,                   .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rt, RAB_OPERAND_rsp_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)      // Shift word Right Arithmetic Variable

// OP rs
RABBITIZER_DEF_INSTR_ID(rsp, 0x08, jr,                     .operands={RAB_OPERAND_rsp_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .isJump=true)                        // Jump Register
RABBITIZER_DEF_INSTR_ID(rsp, 0x09, jalr,                   .operands={RAB_OPERAND_rsp_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .isJump=true, .modifiesRd=true, .doesLink=true)      // Jump And Link Register

// OP rd, rs
RABBITIZER_DEF_INSTR_ID_ALTNAME(rsp, -0x09, jalr_rd, jalr,  .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .isJump=true, .modifiesRd=true, .doesLink=true)   // Jump And Link Register // Special case for rd != 31

// OP rd, rs, rt
RABBITIZER_DEF_INSTR_ID(rsp, 0x0A, movz,                   .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rs, RAB_OPERAND_rsp_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)      // MOVe conditional on Zero
RABBITIZER_DEF_INSTR_ID(rsp, 0x0B, movn,                   .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rs, RAB_OPERAND_rsp_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)      // MOVe conditional on Not zero

RABBITIZER_DEF_INSTR_ID(rsp, 0x20, add,                    .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rs, RAB_OPERAND_rsp_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .notEmitedByCompilers=true)       // ADD word
RABBITIZER_DEF_INSTR_ID(rsp, 0x21, addu,                   .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rs, RAB_OPERAND_rsp_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)      // ADD Unsigned word
RABBITIZER_DEF_INSTR_ID(rsp, 0x22, sub,                    .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rs, RAB_OPERAND_rsp_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)       // Subtract word
RABBITIZER_DEF_INSTR_ID(rsp, 0x23, subu,                   .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rs, RAB_OPERAND_rsp_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)      // SUBtract Unsigned word
RABBITIZER_DEF_INSTR_ID(rsp, 0x24, and,                    .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rs, RAB_OPERAND_rsp_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)       // AND
RABBITIZER_DEF_INSTR_ID(rsp, 0x25, or,                     .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rs, RAB_OPERAND_rsp_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)        // OR
RABBITIZER_DEF_INSTR_ID(rsp, 0x26, xor,                    .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rs, RAB_OPERAND_rsp_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)       // eXclusive OR
RABBITIZER_DEF_INSTR_ID(rsp, 0x27, nor,                    .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rs, RAB_OPERAND_rsp_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)       // Not OR
RABBITIZER_DEF_INSTR_ID(rsp, 0x2A, slt,                    .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rs, RAB_OPERAND_rsp_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)       // Set on Less Than
RABBITIZER_DEF_INSTR_ID(rsp, 0x2B, sltu,                   .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rs, RAB_OPERAND_rsp_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)      // Set on Less Than Unsigned

// OP code
RABBITIZER_DEF_INSTR_ID(rsp, 0x0D, break,                  .operands={RAB_OPERAND_cpu_code}, .instrType=RABBITIZER_INSTR_TYPE_R)     // Break


// Pseudo-Instruction Unique IDs
// OP
RABBITIZER_DEF_INSTR_ID(rsp, -0x01, nop,                    .operands={0}, .instrType=RABBITIZER_INSTR_TYPE_R)       // No OPeration

// OP rd, rs
RABBITIZER_DEF_INSTR_ID(rsp, -0x25, move,                   .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)      // Move
RABBITIZER_DEF_INSTR_ID(rsp, -0x27, not,                    .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)       // Not

// OP rd, rt
RABBITIZER_DEF_INSTR_ID(rsp, -0x23, negu,                   .operands={RAB_OPERAND_rsp_rd, RAB_OPERAND_rsp_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)
