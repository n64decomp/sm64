/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

/*
    31---------26------------------------------10--------6-5--------0
    |          |                              |function  |   MMI0   |
    ------6----------------------------------------------------6-----
    |---00--|---01--|---10--|---11--| lo
000 |PADDW  | PSUBW | PCGTW | PMAXW |
001 |PADDH  | PSUBH | PCGTH | PMAXH |
010 |PADDB  | PSUBB | PCGTB |  ---  |
011 | ---   | ---   |  ---  |  ---  |
100 |PADDSW |PSUBSW |PEXTLW | PPACW |
101 |PADDSH |PSUBSH |PEXTLH | PPACH |
110 |PADDSB |PSUBSB |PEXTLB | PPACB |
111 | ---   |  ---  | PEXT5 | PPAC5 |
 hi |-------|-------|-------|-------|
*/

RABBITIZER_DEF_INSTR_ID(r5900, 0x00, paddw,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel ADD Word
RABBITIZER_DEF_INSTR_ID(r5900, 0x01, psubw,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel SUBtract Word
RABBITIZER_DEF_INSTR_ID(r5900, 0x02, pcgtw,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel Compare for Greater Than Word
RABBITIZER_DEF_INSTR_ID(r5900, 0x03, pmaxw,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel MAXimum Word

RABBITIZER_DEF_INSTR_ID(r5900, 0x04, paddh,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel ADD Halfword
RABBITIZER_DEF_INSTR_ID(r5900, 0x05, psubh,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel SUBtract Halfword
RABBITIZER_DEF_INSTR_ID(r5900, 0x06, pcgth,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel Compare for Greater Than Halfword
RABBITIZER_DEF_INSTR_ID(r5900, 0x07, pmaxh,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel MAXimum Halfword

RABBITIZER_DEF_INSTR_ID(r5900, 0x08, paddb,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel ADD Byte
RABBITIZER_DEF_INSTR_ID(r5900, 0x09, psubb,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel SUBtract Byte
RABBITIZER_DEF_INSTR_ID(r5900, 0x0A, pcgtb,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel Compare for Greater Than Byte

RABBITIZER_DEF_INSTR_ID(r5900, 0x10, paddsw,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel ADD with Signed saturation Word
RABBITIZER_DEF_INSTR_ID(r5900, 0x11, psubsw,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel SUBtract with Signed saturation Word
RABBITIZER_DEF_INSTR_ID(r5900, 0x12, pextlw,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel EXTend Lower from Word
RABBITIZER_DEF_INSTR_ID(r5900, 0x13, ppacw,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel PACk to Word

RABBITIZER_DEF_INSTR_ID(r5900, 0x14, paddsh,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel ADD with Signed saturation Halfword
RABBITIZER_DEF_INSTR_ID(r5900, 0x15, psubsh,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel SUBtract with Signed saturation Halfword
RABBITIZER_DEF_INSTR_ID(r5900, 0x16, pextlh,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel EXTend Lower from Halfword
RABBITIZER_DEF_INSTR_ID(r5900, 0x17, ppach,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel PACk to Halfword

RABBITIZER_DEF_INSTR_ID(r5900, 0x18, paddsb,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel ADD with Signed saturation Bytes
RABBITIZER_DEF_INSTR_ID(r5900, 0x19, psubsb,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel SUBtract with Signed saturation Bytes
RABBITIZER_DEF_INSTR_ID(r5900, 0x1A, pextlb,    .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel EXTend Lower from Bytes
RABBITIZER_DEF_INSTR_ID(r5900, 0x1B, ppacb,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel PACk to Bytes

RABBITIZER_DEF_INSTR_ID(r5900, 0x1E, pext5,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel EXTend from 5-bits
RABBITIZER_DEF_INSTR_ID(r5900, 0x1F, ppac5,     .operands={RAB_OPERAND_cpu_rd, RAB_OPERAND_cpu_rt}, .modifiesRd=true) // Parallel PACk to 5-bits
