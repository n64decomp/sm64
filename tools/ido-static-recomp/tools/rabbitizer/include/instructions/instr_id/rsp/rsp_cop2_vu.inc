/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

// OP vd, vs, vt[elementhigh]
RABBITIZER_DEF_INSTR_ID(rsp, 0x00, vmulf,                 .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x01, vmulu,                 .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x02, vrndp,                 .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x03, vmulq,                 .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x04, vmudl,                 .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x05, vmudm,                 .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x06, vmudn,                 .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x07, vmudh,                 .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x08, vmacf,                 .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x09, vmacu,                 .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x0A, vrndn,                 .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x0B, vmacq,                 .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x0C, vmadl,                 .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x0D, vmadm,                 .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x0E, vmadn,                 .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x0F, vmadh,                 .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x10, vadd,                  .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x11, vsub,                  .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x13, vabs,                  .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x14, vaddc,                 .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x15, vsubc,                 .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x1D, vsar,                  .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x28, vand,                  .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x29, vnand,                 .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x2A, vor,                   .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x2B, vnor,                  .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x2C, vxor,                  .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x2D, vnxor,                 .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})

RABBITIZER_DEF_INSTR_ID(rsp, 0x20, vlt,                   .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x21, veq,                   .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x22, vne,                   .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x23, vge,                   .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x24, vcl,                   .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x25, vch,                   .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x26, vcr,                   .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x27, vmrg,                  .operands={RAB_OPERAND_rsp_vd, RAB_OPERAND_rsp_vs, RAB_OPERAND_rsp_vt_elementhigh})

// OP vd[de], vt[elementhigh]
RABBITIZER_DEF_INSTR_ID(rsp, 0x30, vrcp,                  .operands={RAB_OPERAND_rsp_vd_de, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x31, vrcpl,                 .operands={RAB_OPERAND_rsp_vd_de, RAB_OPERAND_rsp_vt_elementhigh}) // operands may be wrong
RABBITIZER_DEF_INSTR_ID(rsp, 0x32, vrcph,                 .operands={RAB_OPERAND_rsp_vd_de, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x33, vmov,                  .operands={RAB_OPERAND_rsp_vd_de, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x34, vrsq,                  .operands={RAB_OPERAND_rsp_vd_de, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x35, vrsql,                 .operands={RAB_OPERAND_rsp_vd_de, RAB_OPERAND_rsp_vt_elementhigh})
RABBITIZER_DEF_INSTR_ID(rsp, 0x36, vrsqh,                 .operands={RAB_OPERAND_rsp_vd_de, RAB_OPERAND_rsp_vt_elementhigh})

// OP
RABBITIZER_DEF_INSTR_ID(rsp, 0x37, vnop,                  .operands={0})
