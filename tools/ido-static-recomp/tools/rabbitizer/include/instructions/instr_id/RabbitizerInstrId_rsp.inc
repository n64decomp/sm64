/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

// RSP instructions
RABBITIZER_DEF_INSTR_ID(rsp, , INVALID,               .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})

#include "instructions/instr_id/rsp/rsp_cop2.inc"
#include "instructions/instr_id/rsp/rsp_cop2_vu.inc"

#include "instructions/instr_id/rsp/rsp_normal_lwc2.inc"
#include "instructions/instr_id/rsp/rsp_normal_swc2.inc"

// CPU instructions but with rsp registers

#include "instructions/instr_id/rsp/rsp_normal.inc"
#include "instructions/instr_id/rsp/rsp_special.inc"
#include "instructions/instr_id/rsp/rsp_regimm.inc"
#include "instructions/instr_id/rsp/rsp_cop0.inc"

RABBITIZER_DEF_INSTR_ID(rsp, , USERDEF_00, .operands={0})
RABBITIZER_DEF_INSTR_ID(rsp, , USERDEF_01, .operands={0})
RABBITIZER_DEF_INSTR_ID(rsp, , USERDEF_02, .operands={0})
RABBITIZER_DEF_INSTR_ID(rsp, , USERDEF_03, .operands={0})
RABBITIZER_DEF_INSTR_ID(rsp, , USERDEF_04, .operands={0})
RABBITIZER_DEF_INSTR_ID(rsp, , USERDEF_05, .operands={0})
RABBITIZER_DEF_INSTR_ID(rsp, , USERDEF_06, .operands={0})
RABBITIZER_DEF_INSTR_ID(rsp, , USERDEF_07, .operands={0})
RABBITIZER_DEF_INSTR_ID(rsp, , USERDEF_08, .operands={0})
RABBITIZER_DEF_INSTR_ID(rsp, , USERDEF_09, .operands={0})
RABBITIZER_DEF_INSTR_ID(rsp, , USERDEF_10, .operands={0})
RABBITIZER_DEF_INSTR_ID(rsp, , USERDEF_11, .operands={0})
RABBITIZER_DEF_INSTR_ID(rsp, , USERDEF_12, .operands={0})
RABBITIZER_DEF_INSTR_ID(rsp, , USERDEF_13, .operands={0})
RABBITIZER_DEF_INSTR_ID(rsp, , USERDEF_14, .operands={0})
RABBITIZER_DEF_INSTR_ID(rsp, , USERDEF_15, .operands={0})
RABBITIZER_DEF_INSTR_ID(rsp, , USERDEF_16, .operands={0})
RABBITIZER_DEF_INSTR_ID(rsp, , USERDEF_17, .operands={0})
RABBITIZER_DEF_INSTR_ID(rsp, , USERDEF_18, .operands={0})
RABBITIZER_DEF_INSTR_ID(rsp, , USERDEF_19, .operands={0})

RABBITIZER_DEF_INSTR_ID(rsp, , MAX, .operands={0})
