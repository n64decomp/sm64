/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "instructions/RabbitizerInstructionR5900.h"

#define RABBITIZER_DEF_INSTR_ID(prefix, caseBits, name, ...)    \
    case (caseBits):                                            \
        self->uniqueId = RABBITIZER_INSTR_ID_##prefix##_##name; \
        break;
#define RABBITIZER_DEF_INSTR_ID_ALTNAME(prefix, caseBits, name, altname, ...) RABBITIZER_DEF_INSTR_ID(prefix, caseBits, name, __VA_ARGS__)

void RabbitizerInstructionR5900_processUniqueId_Normal(RabbitizerInstruction *self) {
    uint32_t opcode = RAB_INSTR_GET_opcode(self);
    bool fetchDescriptor = true;

    self->_mandatorybits = RAB_INSTR_PACK_opcode(self->_mandatorybits, opcode);

    switch (opcode) {
#include "instructions/instr_id/r5900/r5900_normal.inc"

        default:
            RabbitizerInstruction_processUniqueId_Normal(self);
            fetchDescriptor = false;
            break;
    }

    if (fetchDescriptor) {
        self->descriptor = &RabbitizerInstrDescriptor_Descriptors[self->uniqueId];
    }
}

void RabbitizerInstructionR5900_processUniqueId_Special(RabbitizerInstruction *self) {
    uint32_t function = RAB_INSTR_GET_function(self);
    bool fetchDescriptor = true;
    uint32_t stype;

    self->_mandatorybits = RAB_INSTR_PACK_function(self->_mandatorybits, function);

    switch (function) {
#include "instructions/instr_id/r5900/r5900_special.inc"

        default:
            RabbitizerInstruction_processUniqueId_Special(self);
            fetchDescriptor = false;
            break;
    }

    switch (self->uniqueId) {
        case RABBITIZER_INSTR_ID_cpu_sync:
            stype = RAB_INSTR_GET_stype(self);
            self->_mandatorybits = RAB_INSTR_PACK_stype(self->_mandatorybits, stype);
            if ((stype & 0x10) == 0x10) {
                self->uniqueId = RABBITIZER_INSTR_ID_r5900_sync_p;
                fetchDescriptor = true;
            }
            break;

        default:
            break;
    }

    if (fetchDescriptor) {
        self->descriptor = &RabbitizerInstrDescriptor_Descriptors[self->uniqueId];
    }
}

void RabbitizerInstructionR5900_processUniqueId_Regimm(RabbitizerInstruction *self) {
    uint32_t rt = RAB_INSTR_GET_rt(self);
    bool fetchDescriptor = true;

    self->_mandatorybits = RAB_INSTR_PACK_rt(self->_mandatorybits, rt);

    switch (rt) {
#include "instructions/instr_id/r5900/r5900_regimm.inc"

        default:
            RabbitizerInstruction_processUniqueId_Regimm(self);
            fetchDescriptor = false;
            break;
    }

    if (fetchDescriptor) {
        self->descriptor = &RabbitizerInstrDescriptor_Descriptors[self->uniqueId];
    }
}

void RabbitizerInstructionR5900_processUniqueId_Coprocessor0_Tlb(RabbitizerInstruction *self) {
    uint32_t function = RAB_INSTR_GET_function(self);

    self->_mandatorybits = RAB_INSTR_PACK_function(self->_mandatorybits, function);

    switch (function) {
#include "instructions/instr_id/r5900/r5900_cop0_tlb.inc"

        default:
            RabbitizerInstruction_processUniqueId_Coprocessor0_Tlb(self);
            break;
    }
}

void RabbitizerInstructionR5900_processUniqueId_Coprocessor0(RabbitizerInstruction *self) {
    uint32_t fmt = RAB_INSTR_GET_fmt(self);

    self->_mandatorybits = RAB_INSTR_PACK_fmt(self->_mandatorybits, fmt);
    self->_handwrittenCategory = true;

    switch (fmt) {
#include "instructions/instr_id/cpu/cpu_cop0.inc"

        case 0x08:
            RabbitizerInstruction_processUniqueId_Coprocessor0_BC0(self);
            break;

        case 0x10:
            RabbitizerInstructionR5900_processUniqueId_Coprocessor0_Tlb(self);
            break;
    }

    self->descriptor = &RabbitizerInstrDescriptor_Descriptors[self->uniqueId];
}

void RabbitizerInstructionR5900_processUniqueId_Coprocessor1_FpuS(RabbitizerInstruction *self) {
    uint32_t function = RAB_INSTR_GET_function(self);

    self->_mandatorybits = RAB_INSTR_PACK_function(self->_mandatorybits, function);

    switch (function) {
#include "instructions/instr_id/r5900/r5900_cop1_fpu_s.inc"

        default:
            RabbitizerInstruction_processUniqueId_Coprocessor1_FpuS(self);
            break;
    }
}

void RabbitizerInstructionR5900_processUniqueId_Coprocessor1(RabbitizerInstruction *self) {
    uint8_t fmt = RAB_INSTR_GET_fmt(self);

    self->_mandatorybits = RAB_INSTR_PACK_fmt(self->_mandatorybits, fmt);

    switch (fmt) {
#include "instructions/instr_id/cpu/cpu_cop1.inc"

        case 0x08: // fmt = BC
            RabbitizerInstruction_processUniqueId_Coprocessor1_BC1(self);
            break;

        case 0x10:
            RabbitizerInstructionR5900_processUniqueId_Coprocessor1_FpuS(self);
            break;

        case 0x14:
            RabbitizerInstruction_processUniqueId_Coprocessor1_FpuW(self);
            break;
    }

    self->descriptor = &RabbitizerInstrDescriptor_Descriptors[self->uniqueId];
}

void RabbitizerInstruction_processUniqueId_Coprocessor2_BC2(RabbitizerInstruction *self) {
    uint32_t fmt = RAB_INSTR_GET_bc_fmt(self);

    self->_mandatorybits = RAB_INSTR_PACK_bc_fmt(self->_mandatorybits, fmt);

    switch (fmt) {
#include "instructions/instr_id/r5900/r5900_cop2_bc2.inc"
    }
}

void RabbitizerInstructionR5900_processUniqueId_Coprocessor2_Special2(UNUSED RabbitizerInstruction *self) {
    uint32_t fhiflo = RAB_INSTR_R5900_GET_fhi_flo(self);

    self->_mandatorybits = RAB_INSTR_R5900_PACK_fhi_flo(self->_mandatorybits, fhiflo);

    switch (fhiflo) {
#include "instructions/instr_id/r5900/r5900_cop2_special2.inc"
    }
}

void RabbitizerInstructionR5900_processUniqueId_Coprocessor2_Special1(RabbitizerInstruction *self) {
    uint32_t function = RAB_INSTR_GET_function(self);

    self->_mandatorybits = RAB_INSTR_PACK_function(self->_mandatorybits, function);

    switch (function) {
#include "instructions/instr_id/r5900/r5900_cop2_special1.inc"

        case 0x3C:
        case 0x3D:
        case 0x3E:
        case 0x3F:
            RabbitizerInstructionR5900_processUniqueId_Coprocessor2_Special2(self);
            break;
    }
}

void RabbitizerInstructionR5900_processUniqueId_Coprocessor2(RabbitizerInstruction *self) {
    uint8_t fmt = RAB_INSTR_GET_fmt(self);

    self->_mandatorybits = RAB_INSTR_PACK_fmt(self->_mandatorybits, fmt);

    switch (fmt) {
#include "instructions/instr_id/r5900/r5900_cop2.inc"

        case 0x08:
            RabbitizerInstruction_processUniqueId_Coprocessor2_BC2(self);
            break;

        case 0x10:
        case 0x11:
        case 0x12:
        case 0x13:
        case 0x14:
        case 0x15:
        case 0x16:
        case 0x17:
        case 0x18:
        case 0x19:
        case 0x1A:
        case 0x1B:
        case 0x1C:
        case 0x1D:
        case 0x1E:
        case 0x1F:
            RabbitizerInstructionR5900_processUniqueId_Coprocessor2_Special1(self);
            break;
    }

    self->descriptor = &RabbitizerInstrDescriptor_Descriptors[self->uniqueId];
}

void RabbitizerInstructionR5900_processUniqueId_MMI_0(RabbitizerInstruction *self) {
    uint32_t function = RAB_INSTR_R5900_GET_mmi_function(self);

    self->_mandatorybits = RAB_INSTR_R5900_PACK_mmi_function(self->_mandatorybits, function);

    switch (function) {
#include "instructions/instr_id/r5900/r5900_mmi_0.inc"
    }
}

void RabbitizerInstructionR5900_processUniqueId_MMI_1(RabbitizerInstruction *self) {
    uint32_t function = RAB_INSTR_R5900_GET_mmi_function(self);

    self->_mandatorybits = RAB_INSTR_R5900_PACK_mmi_function(self->_mandatorybits, function);

    switch (function) {
#include "instructions/instr_id/r5900/r5900_mmi_1.inc"
    }
}

void RabbitizerInstructionR5900_processUniqueId_MMI_2(RabbitizerInstruction *self) {
    uint32_t function = RAB_INSTR_R5900_GET_mmi_function(self);

    self->_mandatorybits = RAB_INSTR_R5900_PACK_mmi_function(self->_mandatorybits, function);

    switch (function) {
#include "instructions/instr_id/r5900/r5900_mmi_2.inc"
    }
}

void RabbitizerInstructionR5900_processUniqueId_MMI_3(RabbitizerInstruction *self) {
    uint32_t function = RAB_INSTR_R5900_GET_mmi_function(self);

    self->_mandatorybits = RAB_INSTR_R5900_PACK_mmi_function(self->_mandatorybits, function);

    switch (function) {
#include "instructions/instr_id/r5900/r5900_mmi_3.inc"
    }
}

void RabbitizerInstructionR5900_processUniqueId_MMI(RabbitizerInstruction *self) {
    uint32_t function = RAB_INSTR_GET_function(self);

    self->_mandatorybits = RAB_INSTR_PACK_function(self->_mandatorybits, function);

    switch (function) {
#include "instructions/instr_id/r5900/r5900_mmi.inc"

        case 0x08:
            RabbitizerInstructionR5900_processUniqueId_MMI_0(self);
            break;
        case 0x09:
            RabbitizerInstructionR5900_processUniqueId_MMI_2(self);
            break;
        case 0x28:
            RabbitizerInstructionR5900_processUniqueId_MMI_1(self);
            break;
        case 0x29:
            RabbitizerInstructionR5900_processUniqueId_MMI_3(self);
            break;
    }

    self->descriptor = &RabbitizerInstrDescriptor_Descriptors[self->uniqueId];
}

#undef RABBITIZER_DEF_INSTR_ID
#undef RABBITIZER_DEF_INSTR_ID_ALTNAME

void RabbitizerInstructionR5900_processUniqueId(RabbitizerInstruction *self) {
    uint32_t opcode = RAB_INSTR_GET_opcode(self);

    self->_mandatorybits = RAB_INSTR_PACK_opcode(self->_mandatorybits, opcode);

    switch (opcode) {
        default:
            RabbitizerInstructionR5900_processUniqueId_Normal(self);
            break;
        case 0x00:
            RabbitizerInstructionR5900_processUniqueId_Special(self);
            break;
        case 0x01:
            RabbitizerInstructionR5900_processUniqueId_Regimm(self);
            break;
        case 0x10:
            RabbitizerInstructionR5900_processUniqueId_Coprocessor0(self);
            break;
        case 0x11:
            RabbitizerInstructionR5900_processUniqueId_Coprocessor1(self);
            break;
        case 0x12:
            RabbitizerInstructionR5900_processUniqueId_Coprocessor2(self);
            break;
        case 0x1C:
            RabbitizerInstructionR5900_processUniqueId_MMI(self);
            break;
    }
}
