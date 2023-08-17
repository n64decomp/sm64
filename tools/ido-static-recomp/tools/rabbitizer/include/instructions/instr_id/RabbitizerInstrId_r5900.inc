/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

RABBITIZER_DEF_INSTR_ID(r5900, , INVALID,     .operands={RAB_OPERAND_cpu_rs, RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_immediate}, .instrType=RABBITIZER_INSTR_TYPE_UNKNOWN, .architectureVersion=-1)

#include "instructions/instr_id/r5900/r5900_normal.inc"
#include "instructions/instr_id/r5900/r5900_special.inc"
#include "instructions/instr_id/r5900/r5900_regimm.inc"

#include "instructions/instr_id/r5900/r5900_mmi.inc"
#include "instructions/instr_id/r5900/r5900_mmi_0.inc"
#include "instructions/instr_id/r5900/r5900_mmi_1.inc"
#include "instructions/instr_id/r5900/r5900_mmi_2.inc"
#include "instructions/instr_id/r5900/r5900_mmi_3.inc"

#include "instructions/instr_id/r5900/r5900_cop0_tlb.inc"

#include "instructions/instr_id/r5900/r5900_cop1_fpu_s.inc"

#include "instructions/instr_id/r5900/r5900_cop2.inc"
#include "instructions/instr_id/r5900/r5900_cop2_bc2.inc"
#include "instructions/instr_id/r5900/r5900_cop2_special1.inc"
#include "instructions/instr_id/r5900/r5900_cop2_special2.inc"

RABBITIZER_DEF_INSTR_ID(r5900, , USERDEF_00, .operands={0})
RABBITIZER_DEF_INSTR_ID(r5900, , USERDEF_01, .operands={0})
RABBITIZER_DEF_INSTR_ID(r5900, , USERDEF_02, .operands={0})
RABBITIZER_DEF_INSTR_ID(r5900, , USERDEF_03, .operands={0})
RABBITIZER_DEF_INSTR_ID(r5900, , USERDEF_04, .operands={0})
RABBITIZER_DEF_INSTR_ID(r5900, , USERDEF_05, .operands={0})
RABBITIZER_DEF_INSTR_ID(r5900, , USERDEF_06, .operands={0})
RABBITIZER_DEF_INSTR_ID(r5900, , USERDEF_07, .operands={0})
RABBITIZER_DEF_INSTR_ID(r5900, , USERDEF_08, .operands={0})
RABBITIZER_DEF_INSTR_ID(r5900, , USERDEF_09, .operands={0})
RABBITIZER_DEF_INSTR_ID(r5900, , USERDEF_10, .operands={0})
RABBITIZER_DEF_INSTR_ID(r5900, , USERDEF_11, .operands={0})
RABBITIZER_DEF_INSTR_ID(r5900, , USERDEF_12, .operands={0})
RABBITIZER_DEF_INSTR_ID(r5900, , USERDEF_13, .operands={0})
RABBITIZER_DEF_INSTR_ID(r5900, , USERDEF_14, .operands={0})
RABBITIZER_DEF_INSTR_ID(r5900, , USERDEF_15, .operands={0})
RABBITIZER_DEF_INSTR_ID(r5900, , USERDEF_16, .operands={0})
RABBITIZER_DEF_INSTR_ID(r5900, , USERDEF_17, .operands={0})
RABBITIZER_DEF_INSTR_ID(r5900, , USERDEF_18, .operands={0})
RABBITIZER_DEF_INSTR_ID(r5900, , USERDEF_19, .operands={0})

RABBITIZER_DEF_INSTR_ID(r5900, , MAX, .operands={0})
