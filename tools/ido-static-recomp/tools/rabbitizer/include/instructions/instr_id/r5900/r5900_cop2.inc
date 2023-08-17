/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

/*
    31--------26-25------21 ----------------------------------------0
    |  = COP2   |   fmt   |                                         |
    ------6----------5-----------------------------------------------
    |--000--|--001--|--010--|--011--|--100--|--101--|--110--|--111--| lo
 00 |  ---  | QMFC2 | CFC2  |  ---  |  ---  | QMTC2 | CTC2  |  ---  |
 01 | *1    |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |
 10 | *2    | *2    | *2    | *2    | *2    | *2    | *2    | *2    |
 11 | *2    | *2    | *2    | *2    | *2    | *2    | *2    | *2    |
 hi |-------|-------|-------|-------|-------|-------|-------|-------|
     *1 = BC instructions, see BC2 list   *2 =see special1 table
*/

// TODO: properties
RABBITIZER_DEF_INSTR_ID(r5900, 0x01, qmfc2, .operands={RAB_OPERAND_cpu_rt, RAB_OPERAND_r5900_vfs})
RABBITIZER_DEF_INSTR_ID(r5900, 0x02, cfc2,  .operands={RAB_OPERAND_cpu_rt, RAB_OPERAND_r5900_vis})
RABBITIZER_DEF_INSTR_ID(r5900, 0x05, qmtc2, .operands={RAB_OPERAND_cpu_rt, RAB_OPERAND_r5900_vfs})
RABBITIZER_DEF_INSTR_ID(r5900, 0x06, ctc2,  .operands={RAB_OPERAND_cpu_rt, RAB_OPERAND_r5900_vis})
