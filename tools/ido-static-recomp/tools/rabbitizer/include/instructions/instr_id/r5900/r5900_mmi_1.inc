/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

/*
    31---------26------------------------------------------5--------0
    |           |                               |function  |  MMI1  |
    ------6----------------------------------------------------6-----
    |---00--|---01--|---10--|---11--| lo
000 |  ---  | PABSW | PCEQW | PMINW |
001 |PADSBH | PABSH | PCEQH | PMINH |
010 |  ---  |  ---  | PCEQB |  ---  |
011 |  ---  |  ---  |  ---  |  ---  |
100 |PADDUW |PSUBUW |PEXTUW |  ---  |
101 |PADDUH |PSUBUH |PEXTUH |  ---  |
110 |PADDUB |PSUBUB |PEXTUB | QFSRV |
111 |  ---  |  ---  |  ---  |  ---  |
 hi |-------|-------|-------|-------|
*/

// TODO: operands and properties
RABBITIZER_DEF_INSTR_ID(r5900, 0x01, pabsw,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel ABSolute Word
RABBITIZER_DEF_INSTR_ID(r5900, 0x02, pceqw,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel Compare for EQual Word
RABBITIZER_DEF_INSTR_ID(r5900, 0x03, pminw,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel MINimum Word

RABBITIZER_DEF_INSTR_ID(r5900, 0x04, padsbh,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel ADd/SuBtract Halfword
RABBITIZER_DEF_INSTR_ID(r5900, 0x05, pabsh,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel ABSolute Halfword
RABBITIZER_DEF_INSTR_ID(r5900, 0x06, pceqh,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel Compare for EQual Halfword
RABBITIZER_DEF_INSTR_ID(r5900, 0x07, pminh,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel MINimum Halfword

RABBITIZER_DEF_INSTR_ID(r5900, 0x0A, pceqb,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel Compare for EQual Byte

RABBITIZER_DEF_INSTR_ID(r5900, 0x10, padduw,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel ADD Unsigned saturation Word
RABBITIZER_DEF_INSTR_ID(r5900, 0x11, psubuw,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel SUBtract Unsigned saturation Word
RABBITIZER_DEF_INSTR_ID(r5900, 0x12, pextuw,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel EXTend Upper from Word

RABBITIZER_DEF_INSTR_ID(r5900, 0x14, padduh,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel ADD Unsigned saturation Halfword
RABBITIZER_DEF_INSTR_ID(r5900, 0x15, psubuh,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel SUBtract Unsigned saturation Halfword
RABBITIZER_DEF_INSTR_ID(r5900, 0x16, pextuh,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel EXTend Upper from Halfword

RABBITIZER_DEF_INSTR_ID(r5900, 0x18, paddub,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel ADD Unsigned saturation Byte
RABBITIZER_DEF_INSTR_ID(r5900, 0x19, psubub,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel SUBtract Unsigned saturation Byte
RABBITIZER_DEF_INSTR_ID(r5900, 0x1A, pextub,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel EXTend Upper from Byte
RABBITIZER_DEF_INSTR_ID(r5900, 0x1B, qfsrv,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Quadword Funnel Shift Right Variable
