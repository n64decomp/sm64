/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

// OP vt[elementlow], offset(vs)
RABBITIZER_DEF_INSTR_ID(rsp, 0x00, sbv,     .operands={RAB_OPERAND_rsp_vt_elementlow, RAB_OPERAND_rsp_offset_rs})
RABBITIZER_DEF_INSTR_ID(rsp, 0x01, ssv,     .operands={RAB_OPERAND_rsp_vt_elementlow, RAB_OPERAND_rsp_offset_rs})
RABBITIZER_DEF_INSTR_ID(rsp, 0x02, slv,     .operands={RAB_OPERAND_rsp_vt_elementlow, RAB_OPERAND_rsp_offset_rs})
RABBITIZER_DEF_INSTR_ID(rsp, 0x03, sdv,     .operands={RAB_OPERAND_rsp_vt_elementlow, RAB_OPERAND_rsp_offset_rs})
RABBITIZER_DEF_INSTR_ID(rsp, 0x04, sqv,     .operands={RAB_OPERAND_rsp_vt_elementlow, RAB_OPERAND_rsp_offset_rs})
RABBITIZER_DEF_INSTR_ID(rsp, 0x05, srv,     .operands={RAB_OPERAND_rsp_vt_elementlow, RAB_OPERAND_rsp_offset_rs})
RABBITIZER_DEF_INSTR_ID(rsp, 0x06, spv,     .operands={RAB_OPERAND_rsp_vt_elementlow, RAB_OPERAND_rsp_offset_rs})
RABBITIZER_DEF_INSTR_ID(rsp, 0x07, suv,     .operands={RAB_OPERAND_rsp_vt_elementlow, RAB_OPERAND_rsp_offset_rs})
RABBITIZER_DEF_INSTR_ID(rsp, 0x08, shv,     .operands={RAB_OPERAND_rsp_vt_elementlow, RAB_OPERAND_rsp_offset_rs})
RABBITIZER_DEF_INSTR_ID(rsp, 0x09, sfv,     .operands={RAB_OPERAND_rsp_vt_elementlow, RAB_OPERAND_rsp_offset_rs})
RABBITIZER_DEF_INSTR_ID(rsp, 0x0B, stv,     .operands={RAB_OPERAND_rsp_vt_elementlow, RAB_OPERAND_rsp_offset_rs})

RABBITIZER_DEF_INSTR_ID(rsp, -0x07, swv,    .operands={RAB_OPERAND_rsp_vt_elementlow, RAB_OPERAND_rsp_offset_rs})
