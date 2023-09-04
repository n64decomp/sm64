/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

/*
    31---------26------------------------------------------5--------0
    |           |                              |function   |  MMI2  |
    ------6----------------------------------------------------6-----
    |---00--|---01--|---10--|---11--| lo
000 |PMADDW |  ---  |PSLLVW |PSRLVW |
001 |PMSUBW |  ---  |  ---  |  ---  |
010 |PMFHI  |PMFLO  |PINTH  |  ---  |
011 |PMULTW |PDIVW  |PCPYLD |  ---  |
100 |PMADDH |PHMADH | PAND  |  PXOR |
101 |PMSUBH |PHMSBH |  ---  |  ---  |
110 | ---   |  ---  | PEXEH | PREVH |
111 |PMULTH |PDIVBW | PEXEW |PROT3W |
 hi |-------|-------|-------|-------|
*/

RABBITIZER_DEF_INSTR_ID(r5900, 0x00, pmaddw,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel Multiply-ADD Word
RABBITIZER_DEF_INSTR_ID(r5900, 0x02, psllvw,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_rs}, .modifiesRd=true) // Parallel Shift Left Logical Variable Word
RABBITIZER_DEF_INSTR_ID(r5900, 0x03, psrlvw,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_rs}, .modifiesRd=true) // Parallel Shift Right Logical Variable Word

RABBITIZER_DEF_INSTR_ID(r5900, 0x04, pmsubw,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel Multiply-SUBtract Word

RABBITIZER_DEF_INSTR_ID(r5900, 0x08, pmfhi,     .operands={RAB_OPERAND_cpu_rd}, .modifiesRd=true) // Parallel Move From HI register
RABBITIZER_DEF_INSTR_ID(r5900, 0x09, pmflo,     .operands={RAB_OPERAND_cpu_rd}, .modifiesRd=true) // Parallel Move From LO register
RABBITIZER_DEF_INSTR_ID(r5900, 0x0A, pinth,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel INTerleave Halfword

RABBITIZER_DEF_INSTR_ID(r5900, 0x0C, pmultw,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel MULTiply Word
RABBITIZER_DEF_INSTR_ID(r5900, 0x0D, pdivw,     .operands={RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}) // Parallel DIVide Word
RABBITIZER_DEF_INSTR_ID(r5900, 0x0E, pcpyld,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel CoPY Lower Doubleword

RABBITIZER_DEF_INSTR_ID(r5900, 0x10, pmaddh,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel Multiply-ADD Halfword
RABBITIZER_DEF_INSTR_ID(r5900, 0x11, phmadh,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel Horizontal Multiply-ADd Halfword
RABBITIZER_DEF_INSTR_ID(r5900, 0x12, pand,      .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel AND
RABBITIZER_DEF_INSTR_ID(r5900, 0x13, pxor,      .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel eXclusive OR

RABBITIZER_DEF_INSTR_ID(r5900, 0x14, pmsubh,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel Multiply-SUBtract Halfword
RABBITIZER_DEF_INSTR_ID(r5900, 0x15, phmsbh,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel Horizontal Multiply-Subtract Halfword

RABBITIZER_DEF_INSTR_ID(r5900, 0x1A, pexeh,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel EXchange Even Halfword
RABBITIZER_DEF_INSTR_ID(r5900, 0x1B, prevh,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel REVerse Halfword

RABBITIZER_DEF_INSTR_ID(r5900, 0x1C, pmulth,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel Multiply Halfword
RABBITIZER_DEF_INSTR_ID(r5900, 0x1D, pdivbw,    .operands={RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel DIVide Broadcast Word
RABBITIZER_DEF_INSTR_ID(r5900, 0x1E, pexew,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel EXchange Even Word
RABBITIZER_DEF_INSTR_ID(r5900, 0x1F, prot3w,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel ROTate 3 Words left
