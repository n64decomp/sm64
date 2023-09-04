/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "instructions/RabbitizerInstruction.h"

#include "common/RabbitizerConfig.h"
#include "instructions/RabbitizerRegister.h"

#define RABBITIZER_DEF_INSTR_ID(prefix, caseBits, name, ...)    \
    case (caseBits):                                            \
        self->uniqueId = RABBITIZER_INSTR_ID_##prefix##_##name; \
        break;
#define RABBITIZER_DEF_INSTR_ID_ALTNAME(prefix, caseBits, name, altname, ...) RABBITIZER_DEF_INSTR_ID(prefix, caseBits, name, __VA_ARGS__)

void RabbitizerInstruction_processUniqueId_Normal(RabbitizerInstruction *self) {
    uint32_t opcode = RAB_INSTR_GET_opcode(self);

    self->_mandatorybits = RAB_INSTR_PACK_opcode(self->_mandatorybits, opcode);

    switch (opcode) {
#include "instructions/instr_id/cpu/cpu_normal.inc"
    }

    if (RabbitizerConfig_Cfg.pseudos.enablePseudos) {
        switch (self->uniqueId) {
            case RABBITIZER_INSTR_ID_cpu_beq:
                if (RAB_INSTR_GET_rt(self) == 0) {
                    if (RAB_INSTR_GET_rs(self) == 0) {
                        if (RabbitizerConfig_Cfg.pseudos.pseudoB) {
                            self->uniqueId = RABBITIZER_INSTR_ID_cpu_b;
                        }
                    } else {
                        if (RabbitizerConfig_Cfg.pseudos.pseudoBeqz) {
                            self->uniqueId = RABBITIZER_INSTR_ID_cpu_beqz;
                        }
                    }
                }
                break;

            case RABBITIZER_INSTR_ID_cpu_bne:
                if (RAB_INSTR_GET_rt(self) == 0) {
                    if (RabbitizerConfig_Cfg.pseudos.pseudoBnez) {
                        self->uniqueId = RABBITIZER_INSTR_ID_cpu_bnez;
                    }
                }
                break;

            default:
                break;
        }
    }

    self->descriptor = &RabbitizerInstrDescriptor_Descriptors[self->uniqueId];
}

void RabbitizerInstruction_processUniqueId_Special(RabbitizerInstruction *self) {
    uint32_t function = RAB_INSTR_GET_function(self);

    self->_mandatorybits = RAB_INSTR_PACK_function(self->_mandatorybits, function);

    switch (function) {
#include "instructions/instr_id/cpu/cpu_special.inc"
    }

    if (RabbitizerInstruction_isNop(self)) {
        // NOP is special enough
        self->uniqueId = RABBITIZER_INSTR_ID_cpu_nop;
    } else if (RabbitizerConfig_Cfg.pseudos.enablePseudos) {
        switch (self->uniqueId) {
            case RABBITIZER_INSTR_ID_cpu_or:
                if (RAB_INSTR_GET_rt(self) == 0) {
                    if (RabbitizerConfig_Cfg.pseudos.pseudoMove) {
                        self->uniqueId = RABBITIZER_INSTR_ID_cpu_move;
                    }
                }
                break;

            case RABBITIZER_INSTR_ID_cpu_nor:
                if (RAB_INSTR_GET_rt(self) == 0) {
                    if (RabbitizerConfig_Cfg.pseudos.pseudoNot) {
                        self->uniqueId = RABBITIZER_INSTR_ID_cpu_not;
                    }
                }
                break;

            case RABBITIZER_INSTR_ID_cpu_subu:
                if (RAB_INSTR_GET_rs(self) == 0) {
                    if (RabbitizerConfig_Cfg.pseudos.pseudoNegu) {
                        self->uniqueId = RABBITIZER_INSTR_ID_cpu_negu;
                    }
                }
                break;

            default:
                break;
        }
    }

    self->descriptor = &RabbitizerInstrDescriptor_Descriptors[self->uniqueId];

    switch (self->uniqueId) {
        case RABBITIZER_INSTR_ID_cpu_jalr:
            self->_mandatorybits = RAB_INSTR_PACK_rd(self->_mandatorybits, RAB_INSTR_GET_rd(self));

            if (RabbitizerConfig_Cfg.regNames.gprAbiNames == RABBITIZER_ABI_NUMERIC || RabbitizerConfig_Cfg.regNames.gprAbiNames == RABBITIZER_ABI_O32) {
                if (RAB_INSTR_GET_rd(self) != RABBITIZER_REG_GPR_O32_ra) {
                    self->descriptor = &RabbitizerInstrDescriptor_Descriptors[RABBITIZER_INSTR_ID_cpu_jalr_rd];
                }
            } else {
                if (RAB_INSTR_GET_rd(self) != RABBITIZER_REG_GPR_N32_ra) {
                    self->descriptor = &RabbitizerInstrDescriptor_Descriptors[RABBITIZER_INSTR_ID_cpu_jalr_rd];
                }
            }
            break;

        case RABBITIZER_INSTR_ID_cpu_div:
            if (RabbitizerConfig_Cfg.toolchainTweaks.sn64DivFix && !self->inHandwrittenFunction) {
                self->descriptor = &RabbitizerInstrDescriptor_Descriptors[RABBITIZER_INSTR_ID_cpu_sn64_div];
            }
            break;

        case RABBITIZER_INSTR_ID_cpu_divu:
            if (RabbitizerConfig_Cfg.toolchainTweaks.sn64DivFix && !self->inHandwrittenFunction) {
                self->descriptor = &RabbitizerInstrDescriptor_Descriptors[RABBITIZER_INSTR_ID_cpu_sn64_divu];
            }
            break;

        default:
            break;
    }
}

void RabbitizerInstruction_processUniqueId_Regimm(RabbitizerInstruction *self) {
    uint32_t rt = RAB_INSTR_GET_rt(self);

    self->_mandatorybits = RAB_INSTR_PACK_rt(self->_mandatorybits, rt);

    switch (rt) {
#include "instructions/instr_id/cpu/cpu_regimm.inc"
    }

    if (RabbitizerConfig_Cfg.pseudos.enablePseudos) {
        switch (self->uniqueId) {
            case RABBITIZER_INSTR_ID_cpu_bgezal:
                if (RAB_INSTR_GET_rs(self) == 0) {
                    if (RabbitizerConfig_Cfg.pseudos.pseudoBal) {
                        self->uniqueId = RABBITIZER_INSTR_ID_cpu_bal;
                    }
                }
                break;

            default:
                break;
        }
    }

    self->descriptor = &RabbitizerInstrDescriptor_Descriptors[self->uniqueId];
}

void RabbitizerInstruction_processUniqueId_Coprocessor0_BC0(RabbitizerInstruction *self) {
    uint32_t fmt = RAB_INSTR_GET_bc_fmt(self);

    self->_mandatorybits = RAB_INSTR_PACK_bc_fmt(self->_mandatorybits, fmt);

    switch (fmt) {
#include "instructions/instr_id/cpu/cpu_cop0_bc0.inc"
    }
}

void RabbitizerInstruction_processUniqueId_Coprocessor0_Tlb(RabbitizerInstruction *self) {
    uint32_t function = RAB_INSTR_GET_function(self);

    self->_mandatorybits = RAB_INSTR_PACK_function(self->_mandatorybits, function);

    switch (function) {
#include "instructions/instr_id/cpu/cpu_cop0_tlb.inc"
    }
}

void RabbitizerInstruction_processUniqueId_Coprocessor0(RabbitizerInstruction *self) {
    uint32_t fmt = RAB_INSTR_GET_fmt(self);

    self->_mandatorybits = RAB_INSTR_PACK_fmt(self->_mandatorybits, fmt);
    self->_handwrittenCategory = true;

    switch (fmt) {
#include "instructions/instr_id/cpu/cpu_cop0.inc"

        case 0x08:
            RabbitizerInstruction_processUniqueId_Coprocessor0_BC0(self);
            break;

        case 0x10:
            RabbitizerInstruction_processUniqueId_Coprocessor0_Tlb(self);
            break;
    }

    self->descriptor = &RabbitizerInstrDescriptor_Descriptors[self->uniqueId];
}

void RabbitizerInstruction_processUniqueId_Coprocessor1_BC1(RabbitizerInstruction *self) {
    uint32_t fmt = RAB_INSTR_GET_bc_fmt(self);

    self->_mandatorybits = RAB_INSTR_PACK_bc_fmt(self->_mandatorybits, fmt);

    switch (fmt) {
#include "instructions/instr_id/cpu/cpu_cop1_bc1.inc"
    }
}

void RabbitizerInstruction_processUniqueId_Coprocessor1_FpuS(RabbitizerInstruction *self) {
    uint32_t function = RAB_INSTR_GET_function(self);

    self->_mandatorybits = RAB_INSTR_PACK_function(self->_mandatorybits, function);

    switch (function) {
#include "instructions/instr_id/cpu/cpu_cop1_fpu_s.inc"
    }
}

void RabbitizerInstruction_processUniqueId_Coprocessor1_FpuD(RabbitizerInstruction *self) {
    uint32_t function = RAB_INSTR_GET_function(self);

    self->_mandatorybits = RAB_INSTR_PACK_function(self->_mandatorybits, function);

    switch (function) {
#include "instructions/instr_id/cpu/cpu_cop1_fpu_d.inc"
    }
}

void RabbitizerInstruction_processUniqueId_Coprocessor1_FpuW(RabbitizerInstruction *self) {
    uint32_t function = RAB_INSTR_GET_function(self);

    self->_mandatorybits = RAB_INSTR_PACK_function(self->_mandatorybits, function);

    switch (function) {
#include "instructions/instr_id/cpu/cpu_cop1_fpu_w.inc"
    }
}

void RabbitizerInstruction_processUniqueId_Coprocessor1_FpuL(RabbitizerInstruction *self) {
    uint32_t function = RAB_INSTR_GET_function(self);

    self->_mandatorybits = RAB_INSTR_PACK_function(self->_mandatorybits, function);

    switch (function) {
#include "instructions/instr_id/cpu/cpu_cop1_fpu_l.inc"
    }
}

void RabbitizerInstruction_processUniqueId_Coprocessor1(RabbitizerInstruction *self) {
    uint8_t fmt = RAB_INSTR_GET_fmt(self);

    self->_mandatorybits = RAB_INSTR_PACK_fmt(self->_mandatorybits, fmt);

    switch (fmt) {
#include "instructions/instr_id/cpu/cpu_cop1.inc"

        case 0x08: // fmt = BC
            RabbitizerInstruction_processUniqueId_Coprocessor1_BC1(self);
            break;

        case 0x10:
            RabbitizerInstruction_processUniqueId_Coprocessor1_FpuS(self);
            break;

        case 0x11:
            RabbitizerInstruction_processUniqueId_Coprocessor1_FpuD(self);
            break;

        case 0x14:
            RabbitizerInstruction_processUniqueId_Coprocessor1_FpuW(self);
            break;

        case 0x15:
            RabbitizerInstruction_processUniqueId_Coprocessor1_FpuL(self);
            break;
    }

    self->descriptor = &RabbitizerInstrDescriptor_Descriptors[self->uniqueId];
}

void RabbitizerInstruction_processUniqueId_Coprocessor2(RabbitizerInstruction *self) {
    self->_handwrittenCategory = true;

    self->descriptor = &RabbitizerInstrDescriptor_Descriptors[self->uniqueId];
}

#undef RABBITIZER_DEF_INSTR_ID
#undef RABBITIZER_DEF_INSTR_ID_ALTNAME

void RabbitizerInstruction_processUniqueId(RabbitizerInstruction *self) {
    uint32_t opcode = RAB_INSTR_GET_opcode(self);

    self->_mandatorybits = RAB_INSTR_PACK_opcode(self->_mandatorybits, opcode);

    self->uniqueId = RABBITIZER_INSTR_ID_cpu_INVALID;

    switch (opcode) {
        default:
            RabbitizerInstruction_processUniqueId_Normal(self);
            break;
        case 0x00:
            RabbitizerInstruction_processUniqueId_Special(self);
            break;
        case 0x01:
            RabbitizerInstruction_processUniqueId_Regimm(self);
            break;
        case 0x10:
            RabbitizerInstruction_processUniqueId_Coprocessor0(self);
            break;
        case 0x11:
            RabbitizerInstruction_processUniqueId_Coprocessor1(self);
            break;
        case 0x12:
            RabbitizerInstruction_processUniqueId_Coprocessor2(self);
            break;
    }
}
