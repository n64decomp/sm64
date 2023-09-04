/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

/*
    31---------26------------------------------------------5--------0
    | = SPECIAL |                                         | function|
    ------6----------------------------------------------------6-----
    |--000--|--001--|--010--|--011--|--100--|--101--|--110--|--111--| lo
000 | SLL   | ---   | SRL   | SRA   | SLLV  |  ---  | SRLV  | SRAV  |
001 | JR    | JALR  | MOVZ  | MOVN  |SYSCALL| BREAK |  ---  | SYNC  |
010 | MFHI  | MTHI  | MFLO  | MTLO  | DSLLV |  ---  | DSRLV | DSRAV |
011 | MULT  | MULTU | DIV   | DIVU  | ----  |  ---  | ----  | ----- |
100 | ADD   | ADDU  | SUB   | SUBU  | AND   | OR    | XOR   | NOR   |
101 | MFSA  | MTSA  | SLT   | SLTU  | DADD  | DADDU | DSUB  | DSUBU |
110 | TGE   | TGEU  | TLT   | TLTU  | TEQ   |  ---  | TNE   |  ---  |
111 | DSLL  |  ---  | DSRL  | DSRA  |DSLL32 |  ---  |DSRL32 |DSRA32 |
 hi |-------|-------|-------|-------|-------|-------|-------|-------|
*/

// The other instructions are implemented using the main CPU table

RABBITIZER_DEF_INSTR_ID_ALTNAME(r5900, -0x0F, sync_p, sync.p,   .operands={0}, .instrType=RABBITIZER_INSTR_TYPE_R, .architectureVersion=RABBITIZER_ARCHVERSION_MIPS_II)      // Sync

RABBITIZER_DEF_INSTR_ID(r5900, 0x18, mult,                      .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .instrType=RABBITIZER_INSTR_TYPE_R, .modifiesRd=true)      // MULTtiply word

RABBITIZER_DEF_INSTR_ID(r5900, 0x28, mfsa,                      .operands={RAB_OPERAND_cpu_rd}, .modifiesRd=true) // Move From Shift Amount register
RABBITIZER_DEF_INSTR_ID(r5900, 0x29, mtsa,                      .operands={RAB_OPERAND_cpu_rs}) // Move To Shift Amount register
