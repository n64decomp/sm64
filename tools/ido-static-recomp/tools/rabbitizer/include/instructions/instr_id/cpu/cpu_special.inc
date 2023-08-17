/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

// OP rd, rt, sa
RABBITIZER_DEF_INSTR_ID(cpu, 0x00, sll,                         .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_sa}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)       // Shift word Left Logical
RABBITIZER_DEF_INSTR_ID(cpu, 0x02, srl,                         .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_sa}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)       // Shift word Right Logical
RABBITIZER_DEF_INSTR_ID(cpu, 0x03, sra,                         .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_sa}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)       // Shift word Right Arithmetic
RABBITIZER_DEF_INSTR_ID(cpu, 0x38, dsll,                        .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_sa}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_III)      // Doubleword Shift Left Logical
RABBITIZER_DEF_INSTR_ID(cpu, 0x3A, dsrl,                        .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_sa}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_III)      // Doubleword Shift Right Logical
RABBITIZER_DEF_INSTR_ID(cpu, 0x3B, dsra,                        .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_sa}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_III)      // Doubleword Shift Right Arithmetic
RABBITIZER_DEF_INSTR_ID(cpu, 0x3C, dsll32,                      .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_sa}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_III)    // Doubleword Shift Left Logical plus 32
RABBITIZER_DEF_INSTR_ID(cpu, 0x3E, dsrl32,                      .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_sa}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_III)    // Doubleword Shift Right Logical plus 32
RABBITIZER_DEF_INSTR_ID(cpu, 0x3F, dsra32,                      .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_sa}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_III)    // Doubleword Shift Right Arithmetic plus 32

// OP rd, rt, rs
RABBITIZER_DEF_INSTR_ID(cpu, 0x14, dsllv,                       .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_III)     // Doubleword Shift Left Logical Variable
RABBITIZER_DEF_INSTR_ID(cpu, 0x16, dsrlv,                       .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_III)     // Doubleword Shift Right Logical Variable
RABBITIZER_DEF_INSTR_ID(cpu, 0x17, dsrav,                       .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_III)     // Doubleword Shift Right Arithmetic Variable
RABBITIZER_DEF_INSTR_ID(cpu, 0x04, sllv,                        .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)      // Shift word Left Logical Variable
RABBITIZER_DEF_INSTR_ID(cpu, 0x06, srlv,                        .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)      // Shift word Right Logical Variable
RABBITIZER_DEF_INSTR_ID(cpu, 0x07, srav,                        .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)      // Shift word Right Arithmetic Variable

// OP rs
RABBITIZER_DEF_INSTR_ID(cpu, 0x11, mthi,                        .operands={RAB_OPERAND_cpu_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I) // Move To HI register
RABBITIZER_DEF_INSTR_ID(cpu, 0x13, mtlo,                        .operands={RAB_OPERAND_cpu_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)      // Move To LO register
RABBITIZER_DEF_INSTR_ID(cpu, 0x08, jr,                          .operands={RAB_OPERAND_cpu_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .isJump=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)                        // Jump Register
RABBITIZER_DEF_INSTR_ID(cpu, 0x09, jalr,                        .operands={RAB_OPERAND_cpu_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .isJump=true, .modifiesRd=true, .doesLink=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)      // Jump And Link Register

// OP rd, rs
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, -0x09, jalr_rd, jalr,      .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .isJump=true, .modifiesRd=true, .doesLink=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)   // Jump And Link Register // Special case for rd != 31

// OP rd
RABBITIZER_DEF_INSTR_ID(cpu, 0x10, mfhi,                        .operands={RAB_OPERAND_cpu_rd}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)      // Move From HI register
RABBITIZER_DEF_INSTR_ID(cpu, 0x12, mflo,                        .operands={RAB_OPERAND_cpu_rd}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)      // Move From LO register

// OP rd, rs, rt
RABBITIZER_DEF_INSTR_ID(cpu, 0x0A, movz,                        .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_IV)      // MOVe conditional on Zero
RABBITIZER_DEF_INSTR_ID(cpu, 0x0B, movn,                        .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_IV)      // MOVe conditional on Not zero
RABBITIZER_DEF_INSTR_ID(cpu, 0x1A, div,                         .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)       // DIVide word
RABBITIZER_DEF_INSTR_ID(cpu, 0x1B, divu,                        .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)      // DIVide Unsigned word

RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, -0x1A, sn64_div, div,      .operands={RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)  // DIVide word
RABBITIZER_DEF_INSTR_ID_ALTNAME(cpu, -0x1B, sn64_divu, divu,    .operands={RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I) // DIVide Unsigned word

RABBITIZER_DEF_INSTR_ID(cpu, 0x1E, ddiv,                        .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_III)      // Doubleword DIVide
RABBITIZER_DEF_INSTR_ID(cpu, 0x1F, ddivu,                       .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_III)     // Doubleword DIVide Unsigned
// RABBITIZER_DEF_INSTR_ID(cpu, , ddiv,                          .operands={RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_III)
// RABBITIZER_DEF_INSTR_ID(cpu, , ddivu,                         .operands={RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_III)
RABBITIZER_DEF_INSTR_ID(cpu, 0x20, add,                         .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .notEmitedByCompilers=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)       // ADD word
RABBITIZER_DEF_INSTR_ID(cpu, 0x21, addu,                        .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .maybeIsMove=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)      // ADD Unsigned word
RABBITIZER_DEF_INSTR_ID(cpu, 0x22, sub,                         .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)       // Subtract word
RABBITIZER_DEF_INSTR_ID(cpu, 0x23, subu,                        .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)      // SUBtract Unsigned word
RABBITIZER_DEF_INSTR_ID(cpu, 0x24, and,                         .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)       // AND
RABBITIZER_DEF_INSTR_ID(cpu, 0x25, or,                          .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .maybeIsMove=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)        // OR
RABBITIZER_DEF_INSTR_ID(cpu, 0x26, xor,                         .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)       // eXclusive OR
RABBITIZER_DEF_INSTR_ID(cpu, 0x27, nor,                         .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)       // Not OR
RABBITIZER_DEF_INSTR_ID(cpu, 0x2A, slt,                         .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)       // Set on Less Than
RABBITIZER_DEF_INSTR_ID(cpu, 0x2B, sltu,                        .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)      // Set on Less Than Unsigned
RABBITIZER_DEF_INSTR_ID(cpu, 0x2C, dadd,                        .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_III)      // Doubleword Add
RABBITIZER_DEF_INSTR_ID(cpu, 0x2D, daddu,                       .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .maybeIsMove=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_III)     // Doubleword Add Unsigned
RABBITIZER_DEF_INSTR_ID(cpu, 0x2E, dsub,                        .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_III)      // Doubleword SUBtract
RABBITIZER_DEF_INSTR_ID(cpu, 0x2F, dsubu,                       .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_III)     // Doubleword SUBtract Unsigned

// OP code
RABBITIZER_DEF_INSTR_ID(cpu, 0x0C, syscall,                     .operands={RAB_OPERAND_cpu_code}, .instrType=RABBITIZER_INSTR_TYPE_R, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)   // SYStem CALL
RABBITIZER_DEF_INSTR_ID(cpu, 0x0D, break,                       .operands={RAB_OPERAND_cpu_code}, .instrType=RABBITIZER_INSTR_TYPE_R, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)     // Break
RABBITIZER_DEF_INSTR_ID(cpu, 0x0F, sync,                        .operands={0}, .instrType=RABBITIZER_INSTR_TYPE_R, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_II)      // Sync

// OP rs, rt
RABBITIZER_DEF_INSTR_ID(cpu, 0x18, mult,                        .operands={RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)      // MULTtiply word
RABBITIZER_DEF_INSTR_ID(cpu, 0x19, multu,                       .operands={RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_I)     // MULTtiply Unsigned word
RABBITIZER_DEF_INSTR_ID(cpu, 0x1C, dmult,                       .operands={RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_III)     // Doubleword MULTiply
RABBITIZER_DEF_INSTR_ID(cpu, 0x1D, dmultu,                      .operands={RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_III)    // Doubleword MULTiply Unsigned

RABBITIZER_DEF_INSTR_ID(cpu, 0x30, tge,                         .operands={RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_code_lower}, .instrType=RABBITIZER_INSTR_TYPE_R, .isTrap=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_II)       // Trap if Greater or Equal
RABBITIZER_DEF_INSTR_ID(cpu, 0x31, tgeu,                        .operands={RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_code_lower}, .instrType=RABBITIZER_INSTR_TYPE_R, .isTrap=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_II)      // Trap if Greater or Equal Unsigned
RABBITIZER_DEF_INSTR_ID(cpu, 0x32, tlt,                         .operands={RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_code_lower}, .instrType=RABBITIZER_INSTR_TYPE_R, .isTrap=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_II)       // Trap if Less Than
RABBITIZER_DEF_INSTR_ID(cpu, 0x33, tltu,                        .operands={RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_code_lower}, .instrType=RABBITIZER_INSTR_TYPE_R, .isTrap=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_II)      // Trap if Less Than Unsigned
RABBITIZER_DEF_INSTR_ID(cpu, 0x34, teq,                         .operands={RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_code_lower}, .instrType=RABBITIZER_INSTR_TYPE_R, .isTrap=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_II)       // Trap if EQual
RABBITIZER_DEF_INSTR_ID(cpu, 0x36, tne,                         .operands={RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_code_lower}, .instrType=RABBITIZER_INSTR_TYPE_R, .isTrap=true, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_II)       // Trap if Not Equal


// Pseudo-Instruction Unique IDs

// OP
RABBITIZER_DEF_INSTR_ID(cpu, -0x01, nop,                        .operands={0}, .instrType=RABBITIZER_INSTR_TYPE_R, .isPseudo=true)       // No OPeration

// OP rd, rs
RABBITIZER_DEF_INSTR_ID(cpu, -0x25, move,                       .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .maybeIsMove=true, .isPseudo=true)      // Move
RABBITIZER_DEF_INSTR_ID(cpu, -0x27, not,                        .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .isPseudo=true)       // Not

// OP rd, rt
RABBITIZER_DEF_INSTR_ID(cpu, -0x23, negu,                       .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true, .isPseudo=true)
