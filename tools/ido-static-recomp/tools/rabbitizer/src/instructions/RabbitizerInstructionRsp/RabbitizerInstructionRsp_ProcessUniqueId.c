/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "instructions/RabbitizerInstructionRsp.h"

#include "common/RabbitizerConfig.h"

#define RABBITIZER_DEF_INSTR_ID(prefix, caseBits, name, ...)    \
    case (caseBits):                                            \
        self->uniqueId = RABBITIZER_INSTR_ID_##prefix##_##name; \
        break;
#define RABBITIZER_DEF_INSTR_ID_ALTNAME(prefix, caseBits, name, altname, ...) RABBITIZER_DEF_INSTR_ID(prefix, caseBits, name, __VA_ARGS__)

void RabbitizerInstructionRsp_processUniqueId_Normal_Lwc2(RabbitizerInstruction *self) {
    uint32_t rd = RAB_INSTR_GET_rd(self);

    self->_mandatorybits = RAB_INSTR_PACK_rd(self->_mandatorybits, rd);

    switch (rd) {
#include "instructions/instr_id/rsp/rsp_normal_lwc2.inc"
    }
}

void RabbitizerInstructionRsp_processUniqueId_Normal_Swc2(RabbitizerInstruction *self) {
    uint32_t rd = RAB_INSTR_GET_rd(self);
    uint32_t elementlow;

    self->_mandatorybits = RAB_INSTR_PACK_rd(self->_mandatorybits, rd);

    switch (rd) {
#include "instructions/instr_id/rsp/rsp_normal_swc2.inc"
    }

    switch (self->uniqueId) {
        case RABBITIZER_INSTR_ID_rsp_suv:
            elementlow = RAB_INSTR_RSP_GET_elementlow(self);
            self->_mandatorybits = RAB_INSTR_RSP_PACK_elementlow(self->_mandatorybits, elementlow);
            if (elementlow != 0) {
                self->uniqueId = RABBITIZER_INSTR_ID_rsp_swv;
            }
            break;

        default:
            break;
    }
}

void RabbitizerInstructionRsp_processUniqueId_Normal(RabbitizerInstruction *self) {
    uint32_t opcode = RAB_INSTR_GET_opcode(self);

    self->_mandatorybits = RAB_INSTR_PACK_opcode(self->_mandatorybits, opcode);

    switch (opcode) {
#include "instructions/instr_id/rsp/rsp_normal.inc"

        // new rsp stuff
        case 0x32:
            RabbitizerInstructionRsp_processUniqueId_Normal_Lwc2(self);
            break;

        case 0x3A:
            RabbitizerInstructionRsp_processUniqueId_Normal_Swc2(self);
            break;
    }

    if (RabbitizerConfig_Cfg.pseudos.enablePseudos) {
        if (RAB_INSTR_GET_rt(self) == 0) {
            if (self->uniqueId == RABBITIZER_INSTR_ID_rsp_beq) {
                if (RAB_INSTR_GET_rs(self) == 0) {
                    if (RabbitizerConfig_Cfg.pseudos.pseudoB) {
                        self->uniqueId = RABBITIZER_INSTR_ID_rsp_b;
                    }
                } else {
                    if (RabbitizerConfig_Cfg.pseudos.pseudoBeqz) {
                        self->uniqueId = RABBITIZER_INSTR_ID_rsp_beqz;
                    }
                }
            } else if (self->uniqueId == RABBITIZER_INSTR_ID_rsp_bne) {
                if (RabbitizerConfig_Cfg.pseudos.pseudoBnez) {
                    self->uniqueId = RABBITIZER_INSTR_ID_rsp_bnez;
                }
            }
        }
    }

    self->descriptor = &RabbitizerInstrDescriptor_Descriptors[self->uniqueId];
}

void RabbitizerInstructionRsp_processUniqueId_Special(RabbitizerInstruction *self) {
    uint32_t function = RAB_INSTR_GET_function(self);

    self->_mandatorybits = RAB_INSTR_PACK_function(self->_mandatorybits, function);

    switch (function) {
#include "instructions/instr_id/rsp/rsp_special.inc"
    }

    if (RabbitizerInstruction_isNop(self)) {
        // NOP is special enough
        self->uniqueId = RABBITIZER_INSTR_ID_rsp_nop;
    } else if (RabbitizerConfig_Cfg.pseudos.enablePseudos) {
        if (RAB_INSTR_GET_rt(self) == 0) {
            if (self->uniqueId == RABBITIZER_INSTR_ID_rsp_or) {
                if (RabbitizerConfig_Cfg.pseudos.pseudoMove) {
                    self->uniqueId = RABBITIZER_INSTR_ID_rsp_move;
                }
            } else if (self->uniqueId == RABBITIZER_INSTR_ID_rsp_nor) {
                if (RabbitizerConfig_Cfg.pseudos.pseudoNot) {
                    self->uniqueId = RABBITIZER_INSTR_ID_rsp_not;
                }
            }
        } else if (self->uniqueId == RABBITIZER_INSTR_ID_rsp_subu) {
            if (RAB_INSTR_GET_rs(self) == 0) {
                if (RabbitizerConfig_Cfg.pseudos.pseudoNegu) {
                    self->uniqueId = RABBITIZER_INSTR_ID_rsp_negu;
                }
            }
        }
    }

    self->descriptor = &RabbitizerInstrDescriptor_Descriptors[self->uniqueId];

    if (self->uniqueId == RABBITIZER_INSTR_ID_rsp_jalr) {
        // $ra
        if (RAB_INSTR_GET_rd(self) != 31) {
            self->descriptor = &RabbitizerInstrDescriptor_Descriptors[RABBITIZER_INSTR_ID_rsp_jalr_rd];
        }
    }
}

void RabbitizerInstructionRsp_processUniqueId_Regimm(RabbitizerInstruction *self) {
    uint32_t rt = RAB_INSTR_GET_rt(self);

    self->_mandatorybits = RAB_INSTR_PACK_rt(self->_mandatorybits, rt);

    switch (rt) {
#include "instructions/instr_id/rsp/rsp_regimm.inc"
    }

    if (RabbitizerConfig_Cfg.pseudos.enablePseudos) {
        switch (self->uniqueId) {
            case RABBITIZER_INSTR_ID_rsp_bgezal:
                if (RAB_INSTR_GET_rs(self) == 0) {
                    if (RabbitizerConfig_Cfg.pseudos.pseudoBal) {
                        self->uniqueId = RABBITIZER_INSTR_ID_rsp_bal;
                    }
                }
                break;

            default:
                break;
        }
    }

    self->descriptor = &RabbitizerInstrDescriptor_Descriptors[self->uniqueId];
}

void RabbitizerInstructionRsp_processUniqueId_Coprocessor0(RabbitizerInstruction *self) {
    uint32_t fmt = RAB_INSTR_GET_fmt(self);

    self->_mandatorybits = RAB_INSTR_PACK_fmt(self->_mandatorybits, fmt);

    switch (fmt) {
#include "instructions/instr_id/cpu/cpu_cop0.inc"
    }

    self->descriptor = &RabbitizerInstrDescriptor_Descriptors[self->uniqueId];
}

void RabbitizerInstructionRsp_processUniqueId_Coprocessor2_Vu(RabbitizerInstruction *self) {
    uint32_t aux = SHIFTR(self->word, 25, 1);
    uint32_t function = RAB_INSTR_GET_function(self);

    if (aux != 1) {
        return;
    }

    // TODO: name this bit range
    self->_mandatorybits = BITREPACK(self->_mandatorybits, aux, 25, 1);
    self->_mandatorybits = RAB_INSTR_PACK_function(self->_mandatorybits, function);

    switch (function) {
#include "instructions/instr_id/rsp/rsp_cop2_vu.inc"
    }
}

void RabbitizerInstructionRsp_processUniqueId_Coprocessor2(RabbitizerInstruction *self) {
    uint32_t fmt = RAB_INSTR_GET_fmt(self);

    self->_mandatorybits = RAB_INSTR_PACK_fmt(self->_mandatorybits, fmt);

    switch (fmt) {
#include "instructions/instr_id/cpu/cpu_cop0.inc"

        default:
            RabbitizerInstructionRsp_processUniqueId_Coprocessor2_Vu(self);
            break;
    }

    self->descriptor = &RabbitizerInstrDescriptor_Descriptors[self->uniqueId];
}

#undef RABBITIZER_DEF_INSTR_ID
#undef RABBITIZER_DEF_INSTR_ID_ALTNAME

void RabbitizerInstructionRsp_processUniqueId(RabbitizerInstruction *self) {
    uint32_t opcode = RAB_INSTR_GET_opcode(self);

    self->_mandatorybits = RAB_INSTR_PACK_opcode(self->_mandatorybits, opcode);

    self->uniqueId = RABBITIZER_INSTR_ID_rsp_INVALID;

    switch (opcode) {
        default:
            RabbitizerInstructionRsp_processUniqueId_Normal(self);
            break;
        case 0x00:
            RabbitizerInstructionRsp_processUniqueId_Special(self);
            break;
        case 0x01:
            RabbitizerInstructionRsp_processUniqueId_Regimm(self);
            break;
        case 0x10:
            RabbitizerInstructionRsp_processUniqueId_Coprocessor0(self);
            break;
        // case 0x11:
        //    RabbitizerInstructionRsp_processUniqueId_Coprocessor1(self);
        //    break;
        case 0x12:
            RabbitizerInstructionRsp_processUniqueId_Coprocessor2(self);
            break;
    }
}
