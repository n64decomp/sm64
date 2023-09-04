/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

/*
    31---------26------------------------------------------5--------0
    |           |                               |function  |  MMI3  |
    ------6----------------------------------------------------6-----
    |---00--|---01--|---10--|---11--| lo
000 |PMADDUW|  ---  |  ---  |PSRAVW |
001 |  ---  |  ---  |  ---  |  ---  |
010 |PMTHI  | PMTLO |PINTEH |  ---  |
011 |PMULTUW| PDIVUW|PCPYUD |  ---  |
100 |  ---  |  ---  |  POR  | PNOR  |
101 |  ---  |  ---  |  ---  |  ---  |
110 |  ---  |  ---  | PEXCH | PCPYH |
111 |  ---  |  ---  | PEXCW |  ---  |
 hi |-------|-------|-------|-------|
*/

RABBITIZER_DEF_INSTR_ID(r5900, 0x00, pmadduw,   .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel Multiply-ADD Unsigned Word
RABBITIZER_DEF_INSTR_ID(r5900, 0x03, psravw,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_rs}, .modifiesRd=true) // Parallel Shift Right Arithmetic Variable Word

RABBITIZER_DEF_INSTR_ID(r5900, 0x08, pmthi,     .operands={RAB_OPERAND_cpu_rs}) // Parallel Move To HI register
RABBITIZER_DEF_INSTR_ID(r5900, 0x09, pmtlo,     .operands={RAB_OPERAND_cpu_rs}) // Parallel Move To LO register
RABBITIZER_DEF_INSTR_ID(r5900, 0x0A, pinteh,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel INTerleave Even Halfword

RABBITIZER_DEF_INSTR_ID(r5900, 0x0C, pmultuw,   .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel MULTiply Unsigned Word
RABBITIZER_DEF_INSTR_ID(r5900, 0x0D, pdivuw,    .operands={RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}) // Prallel DIVide Unsigned Word
RABBITIZER_DEF_INSTR_ID(r5900, 0x0E, pcpyud,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel CoPY Upper Doubleword

RABBITIZER_DEF_INSTR_ID(r5900, 0x12, por,       .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel OR
RABBITIZER_DEF_INSTR_ID(r5900, 0x13, pnor,      .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel Not OR

RABBITIZER_DEF_INSTR_ID(r5900, 0x1A, pexch,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel EXchange Center Halfword
RABBITIZER_DEF_INSTR_ID(r5900, 0x1B, pcpyh,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel CoPY Halfword

RABBITIZER_DEF_INSTR_ID(r5900, 0x1E, pexcw,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel EXchange Center Word
