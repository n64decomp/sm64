/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

/*
    31---------26----------20-------16------------------------------0
    | = REGIMM  |          |   rt    |                              |
    ------6---------------------5------------------------------------
    |--000--|--001--|--010--|--011--|--100--|--101--|--110--|--111--| lo
 00 | BLTZ  | BGEZ  | BLTZL | BGEZL |  ---  |  ---  |  ---  |  ---  |
 01 | TGEI  | TGEIU | TLTI  | TLTIU | TEQI  |  ---  | TNEI  |  ---  |
 10 | BLTZAL| BGEZAL|BLTZALL|BGEZALL|  ---  |  ---  |  ---  |  ---  |
 11 | MTSAB | MTSAH |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |
 hi |-------|-------|-------|-------|-------|-------|-------|-------|
*/

// The other instructions are implemented using the main CPU table

// OP rs, IMM
RABBITIZER_DEF_INSTR_ID(r5900, 0x18, mtsab, .operands={RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_immediate}, .instrType=RABBITIZER_INSTR_TYPE_REGIMM)
RABBITIZER_DEF_INSTR_ID(r5900, 0x19, mtsah, .operands={RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_immediate}, .instrType=RABBITIZER_INSTR_TYPE_REGIMM)
