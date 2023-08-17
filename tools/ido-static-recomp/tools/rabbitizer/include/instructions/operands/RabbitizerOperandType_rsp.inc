/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

RAB_DEF_OPERAND(rsp, rs)
RAB_DEF_OPERAND(rsp, rt)
RAB_DEF_OPERAND(rsp, rd)
RAB_DEF_OPERAND(rsp, cop0d)
RAB_DEF_OPERAND(rsp, cop2t)
RAB_DEF_OPERAND(rsp, cop2cd) // Coprocessor 2 control rd
RAB_DEF_OPERAND(rsp, vs)
RAB_DEF_OPERAND(rsp, vt)
RAB_DEF_OPERAND(rsp, vd)
// RAB_DEF_OPERAND(rsp, elementhigh)
// RAB_DEF_OPERAND(rsp, elementlow)
// RAB_DEF_OPERAND(rsp, index)
// RAB_DEF_OPERAND(rsp, offset)

// composed/aliased operands
RAB_DEF_OPERAND(rsp, vt_elementhigh)
RAB_DEF_OPERAND(rsp, vt_elementlow)
RAB_DEF_OPERAND(rsp, vd_de)
RAB_DEF_OPERAND(rsp, vs_index)
RAB_DEF_OPERAND(rsp, offset_rs)
RAB_DEF_OPERAND(rsp, immediate_base)
