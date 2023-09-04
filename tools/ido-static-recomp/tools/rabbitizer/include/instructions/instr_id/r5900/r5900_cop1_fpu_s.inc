/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

/*
    31--------26-25------21 -------------------------------5--------0
    |  = COP1   |  = S    |                               | function|
    ------6----------5-----------------------------------------6-----
    |--000--|--001--|--010--|--011--|--100--|--101--|--110--|--111--| lo
000 | ADD.S | SUB.S | MUL.S | DIV.S | SQRT.S| ABS.S | MOV.S | NEG.S |
001 |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  | ---   |
010 |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |RSQRT.S|  ---  |
011 | ADDA.S| SUBA.S| MULA.S|  ---  | MADD.S| MSUB.S|MADDA.S|MSUBA.S|
100 |  ---  | ---   |  ---  |  ---  | CVT.W |  ---  |  ---  |  ---  |
101 | MAX.S | MIN.S |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |
110 | C.F   | ---   | C.EQ  |  ---  | C.LT  |  ---  |  C.LE |  ---  |
111 | ---   | ---   |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |
 hi |-------|-------|-------|-------|-------|-------|-------|-------|
*/

// The other instructions are implemented using the main CPU table

RABBITIZER_DEF_INSTR_ID_ALTNAME(r5900, 0x04, c1__sqrt_s, c1,    .operands={RAB_OPERAND_cpu_copraw})

RABBITIZER_DEF_INSTR_ID_ALTNAME(r5900, 0x16, rsqrt_s, rsqrt.s,  .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .isFloat=true) // floating point Reciprocal SQuare RooT

RABBITIZER_DEF_INSTR_ID_ALTNAME(r5900, 0x18, adda_s, adda.s,    .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .isFloat=true) // floating point ADD to Accumulator
RABBITIZER_DEF_INSTR_ID_ALTNAME(r5900, 0x19, suba_s, suba.s,    .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .isFloat=true) // floating point SUBtract to Accumulator
RABBITIZER_DEF_INSTR_ID_ALTNAME(r5900, 0x1A, mula_s, mula.s,    .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .isFloat=true) // floating point MULtiply to Accumulator

RABBITIZER_DEF_INSTR_ID_ALTNAME(r5900, 0x1C, madd_s, madd.s,    .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .isFloat=true) // floating point Multiply-ADD
RABBITIZER_DEF_INSTR_ID_ALTNAME(r5900, 0x1D, msub_s, msub.s,    .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .isFloat=true) // floating point Multiply abd SUBtract
RABBITIZER_DEF_INSTR_ID_ALTNAME(r5900, 0x1E, madda_s, madda.s,  .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .isFloat=true) // floating point Multiply-ADD Accumulator
RABBITIZER_DEF_INSTR_ID_ALTNAME(r5900, 0x1F, msuba_s, msuba.s,  .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .isFloat=true) // floating point Multiply SUBtract from Accumulator

RABBITIZER_DEF_INSTR_ID_ALTNAME(r5900, 0x28, max_s, max.s,      .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .isFloat=true) // floating point MAXimum
RABBITIZER_DEF_INSTR_ID_ALTNAME(r5900, 0x29, min_s, min.s,      .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .isFloat=true) // floating point MINimum

// Due to the R5900's FPU being non properly complaint the instruction cvt.w.s always behaves as trunc.w.s because is because EE can only do round-to-zero.
// Assemblers like GAS workaround this issue by decoding cvt.w.s as trunc.w.s, so we mimic that behaviour to allow assembling with GAS.
// Here's some reading about the binutils rationale:
// https://sourceware.org/legacy-ml/binutils/2012-11/msg00360.html
// https://sourceware.org/pipermail/binutils/2013-January/079863.html
RABBITIZER_DEF_INSTR_ID_ALTNAME(r5900, 0x24, trunc_w_s, trunc.w.s,  .operands={RAB_OPERAND_cpu_fd, RAB_OPERAND_cpu_fs}, .isFloat=true) // Floating-Point Truncate to Word Fixed-Point

RABBITIZER_DEF_INSTR_ID_ALTNAME(r5900, 0x34, c_lt_s, c.lt.s,        .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .isFloat=true)
RABBITIZER_DEF_INSTR_ID_ALTNAME(r5900, 0x36, c_le_s, c.le.s,        .operands={RAB_OPERAND_cpu_fs, RAB_OPERAND_cpu_ft}, .isFloat=true)
