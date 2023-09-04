/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

/*
    31--------26-25------21-20------16------------------------------0
    |  = COP0   |   BC2   |   fmt   |                               |
    ------6----------5----------5------------------------------------
    |--000--|--001--|--010--|--011--|--100--|--101--|--110--|--111--| lo
 00 | BC2F  | BC2T  | BC2FL | BC2TL |  ---  |  ---  |  ---  |  ---  |
 01 |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |
 10 |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |
 11 |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |
 hi |-------|-------|-------|-------|-------|-------|-------|-------|
*/

// TODO: operands and properties

RABBITIZER_DEF_INSTR_ID(r5900, 0x00, bc2f,  .operands={RAB_OPERAND_cpu_branch_target_label}, .isBranch=true)
RABBITIZER_DEF_INSTR_ID(r5900, 0x01, bc2t,  .operands={RAB_OPERAND_cpu_branch_target_label}, .isBranch=true)
RABBITIZER_DEF_INSTR_ID(r5900, 0x02, bc2fl, .operands={RAB_OPERAND_cpu_branch_target_label}, .isBranch=true, .isBranchLikely=true)
RABBITIZER_DEF_INSTR_ID(r5900, 0x03, bc2tl, .operands={RAB_OPERAND_cpu_branch_target_label}, .isBranch=true, .isBranchLikely=true)
