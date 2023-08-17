/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "instructions/RabbitizerInstruction.h"

#include <assert.h>

#include "common/RabbitizerConfig.h"
#include "instructions/RabbitizerInstructionRsp.h"
#include "instructions/RabbitizerInstructionR5900.h"
#include "instructions/RabbitizerRegister.h"

bool RabbitizerInstruction_isImplemented(const RabbitizerInstruction *self) {
    switch (self->uniqueId) {
        case RABBITIZER_INSTR_ID_cpu_INVALID:
        case RABBITIZER_INSTR_ID_rsp_INVALID:
        case RABBITIZER_INSTR_ID_r5900_INVALID:
            return false;

        default:
            return true;
    }
}

bool RabbitizerInstruction_isLikelyHandwritten(const RabbitizerInstruction *self) {
    if (self->_handwrittenCategory) {
        return true;
    }

    if (RabbitizerInstrDescriptor_isIType(self->descriptor) && !RabbitizerInstrDescriptor_isFloat(self->descriptor)) {
        if (RAB_INSTR_GET_rs(self) == RABBITIZER_REG_GPR_O32_k0 || RAB_INSTR_GET_rs(self) == RABBITIZER_REG_GPR_O32_k1) {
            return true;
        }
        if (RAB_INSTR_GET_rt(self) == RABBITIZER_REG_GPR_O32_k0 || RAB_INSTR_GET_rt(self) == RABBITIZER_REG_GPR_O32_k1) {
            return true;
        }
    }

    if (RabbitizerInstrDescriptor_notEmitedByCompilers(self->descriptor)) {
        return true;
    }

    return false;
}

bool RabbitizerInstruction_isNop(const RabbitizerInstruction *self) {
    return self->word == 0;
}

bool RabbitizerInstruction_isUnconditionalBranch(const RabbitizerInstruction *self) {
    if (self->uniqueId == RABBITIZER_INSTR_ID_cpu_b) {
        return true;
    }
    if (self->uniqueId == RABBITIZER_INSTR_ID_cpu_beq && RAB_INSTR_GET_rt(self) == 0 && RAB_INSTR_GET_rs(self) == 0) {
        return true;
    }
    if (RabbitizerConfig_Cfg.toolchainTweaks.treatJAsUnconditionalBranch && self->uniqueId == RABBITIZER_INSTR_ID_cpu_j) {
        return true;
    }
    return false;
}

bool RabbitizerInstruction_isJrRa(const RabbitizerInstruction *self) {
    if (self->uniqueId == RABBITIZER_INSTR_ID_cpu_jr) {
        // TODO: abi stuffs
        return RAB_INSTR_GET_rs(self) == RABBITIZER_REG_GPR_O32_ra;
    }
    return false;
}

bool RabbitizerInstruction_isJrNotRa(const RabbitizerInstruction *self) {
    if (self->uniqueId == RABBITIZER_INSTR_ID_cpu_jr) {
        // TODO: abi stuffs
        return RAB_INSTR_GET_rs(self) != RABBITIZER_REG_GPR_O32_ra;
    }
    return false;
}

bool RabbitizerInstruction_hasDelaySlot(const RabbitizerInstruction *self) {
    return RabbitizerInstrDescriptor_isBranch(self->descriptor) || RabbitizerInstrDescriptor_isJump(self->descriptor);
}

const char *RabbitizerInstruction_mapInstrToType(const RabbitizerInstruction *self) {
    if (RabbitizerInstrDescriptor_isDouble(self->descriptor)) {
        return "f64";
    }
    if (RabbitizerInstrDescriptor_isFloat(self->descriptor)) {
        return "f32";
    }
    if (self->uniqueId == RABBITIZER_INSTR_ID_cpu_lwu) {
        return "u32";
    }
    if (self->uniqueId == RABBITIZER_INSTR_ID_cpu_lh || self->uniqueId == RABBITIZER_INSTR_ID_cpu_sh) {
        return "s16";
    }
    if (self->uniqueId == RABBITIZER_INSTR_ID_cpu_lhu) {
        return "u16";
    }
    if (self->uniqueId == RABBITIZER_INSTR_ID_cpu_lb || self->uniqueId == RABBITIZER_INSTR_ID_cpu_sb) {
        return "s8";
    }
    if (self->uniqueId == RABBITIZER_INSTR_ID_cpu_lbu) {
        return "u8";
    }
    if (self->uniqueId == RABBITIZER_INSTR_ID_cpu_ld || self->uniqueId == RABBITIZER_INSTR_ID_cpu_sd) {
        return "s64";
    }
    return NULL;
}

bool RabbitizerInstruction_sameOpcode(const RabbitizerInstruction *self, const RabbitizerInstruction *other) {
    if (!RabbitizerInstruction_isImplemented(self) || !RabbitizerInstruction_isImplemented(other)) {
        return false;
    }
    return self->uniqueId == other->uniqueId;
}

bool RabbitizerInstruction_sameOpcodeButDifferentArguments(const RabbitizerInstruction *self, const RabbitizerInstruction *other) {
    if (!RabbitizerInstruction_sameOpcode(self, other)) {
        return false;
    }
    return RabbitizerInstruction_getRaw(self) != RabbitizerInstruction_getRaw(other);
}

bool RabbitizerInstruction_hasOperand(const RabbitizerInstruction *self, RabbitizerOperandType operand) {
    size_t i;

    for (i = 0; i < ARRAY_COUNT(self->descriptor->operands) && self->descriptor->operands[i] != RAB_OPERAND_ALL_INVALID; i++) {
        if (self->descriptor->operands[i] == operand) {
            return true;
        }
    }

    return false;
}

bool RabbitizerInstruction_hasOperandAlias(const RabbitizerInstruction *self, RabbitizerOperandType operand) {
    switch (operand) {
        case RAB_OPERAND_cpu_rs:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_cpu_immediate_base)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_rsp_rs)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_rsp_offset_rs)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_rsp_immediate_base)) {
                return true;
            }
            break;

        case RAB_OPERAND_cpu_immediate:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_cpu_immediate_base)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_cpu_branch_target_label)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_rsp_immediate_base)) {
                return true;
            }
            break;

        case RAB_OPERAND_cpu_rt:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_rsp_rt)) {
                return true;
            }
            break;

        case RAB_OPERAND_cpu_rd:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_rsp_rd)) {
                return true;
            }
            break;

        case RAB_OPERAND_cpu_sa:
        case RAB_OPERAND_cpu_zero:
        // case RAB_OPERAND_cpu_function:
        case RAB_OPERAND_cpu_cop0d:
        case RAB_OPERAND_cpu_fs:
        case RAB_OPERAND_cpu_ft:
        case RAB_OPERAND_cpu_fd:
        case RAB_OPERAND_cpu_cop1cs:
        case RAB_OPERAND_cpu_cop2t:
        case RAB_OPERAND_cpu_op:
        case RAB_OPERAND_cpu_code:
        case RAB_OPERAND_cpu_code_lower:
        case RAB_OPERAND_cpu_copraw:
        case RAB_OPERAND_cpu_label:
            break;

        case RAB_OPERAND_cpu_branch_target_label:
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_cpu_immediate)) {
                return true;
            }
            break;

        case RAB_OPERAND_cpu_immediate_base:
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_cpu_rs)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_cpu_immediate)) {
                return true;
            }
            break;

        /* rsp */
        case RAB_OPERAND_rsp_rs:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_cpu_rs)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_rsp_offset_rs)) {
                return true;
            }
            break;

        case RAB_OPERAND_rsp_rt:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_cpu_rt)) {
                return true;
            }
            break;

        case RAB_OPERAND_rsp_rd:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_cpu_rd)) {
                return true;
            }
            break;

        case RAB_OPERAND_rsp_cop0d:
        case RAB_OPERAND_rsp_cop2t:
        case RAB_OPERAND_rsp_cop2cd:
            break;

            // case RAB_OPERAND_rsp_elementhigh:
            // case RAB_OPERAND_rsp_elementlow:
            // case RAB_OPERAND_rsp_index:
            // case RAB_OPERAND_rsp_offset:

        case RAB_OPERAND_rsp_vs:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_rsp_vs_index)) {
                return true;
            }
            break;

        case RAB_OPERAND_rsp_vt:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_rsp_vt_elementhigh)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_rsp_vt_elementlow)) {
                return true;
            }
            break;

        case RAB_OPERAND_rsp_vd:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_rsp_vd_de)) {
                return true;
            }
            break;

        case RAB_OPERAND_rsp_vt_elementhigh:
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_rsp_vt)) {
                return true;
            }
            break;

        case RAB_OPERAND_rsp_vt_elementlow:
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_rsp_vt)) {
                return true;
            }
            break;

        case RAB_OPERAND_rsp_vd_de:
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_rsp_vd)) {
                return true;
            }
            break;

        case RAB_OPERAND_rsp_vs_index:
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_rsp_vs)) {
                return true;
            }
            break;

        case RAB_OPERAND_rsp_offset_rs:
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_rsp_rs)) {
                return true;
            }
            break;

        case RAB_OPERAND_rsp_immediate_base:
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_rsp_rs)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_cpu_rs)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_cpu_immediate)) {
                return true;
            }
            break;
            /* rsp */

            /* r5900 */
        case RAB_OPERAND_r5900_I:
        case RAB_OPERAND_r5900_Q:
        case RAB_OPERAND_r5900_R:
            break;

        case RAB_OPERAND_r5900_ACC:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_ACCxyzw)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_ACCxyzw:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_ACC)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vfs:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vfsxyzw)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vfsn)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vfsl)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vfsm)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vft:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vftxyzw)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vftn)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vftl)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vftm)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vfd:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vfdxyzw)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vfdn)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vfdl)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vfdm)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vfsxyzw:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vfs)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vfsn)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vftxyzw:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vft)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vftn)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vfdxyzw:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vfd)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vfdn)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vfsn:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vfs)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vfsxyzw)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vftn:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vft)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vftxyzw)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vfdn:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vfd)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vfdxyzw)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vfsl:
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_r5900_vfs)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vftl:
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_r5900_vft)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vfdl:
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_r5900_vfd)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vfsm:
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_r5900_vfs)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vftm:
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_r5900_vft)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vfdm:
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_r5900_vfd)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vis:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vis_predecr)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vis_postincr)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vit:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vit_predecr)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vit_postincr)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vid:
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vid_predecr)) {
                return true;
            }
            if (RabbitizerInstruction_hasOperand(self, RAB_OPERAND_r5900_vid_postincr)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vis_predecr:
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_r5900_vis)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vit_predecr:
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_r5900_vit)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vid_predecr:
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_r5900_vid)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vis_postincr:
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_r5900_vis)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vit_postincr:
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_r5900_vit)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_vid_postincr:
            if (RabbitizerInstruction_hasOperandAlias(self, RAB_OPERAND_r5900_vid)) {
                return true;
            }
            break;

        case RAB_OPERAND_r5900_immediate5:
            break;
            /* r5900 */

        case RAB_OPERAND_ALL_INVALID:
        case RAB_OPERAND_ALL_MAX:
            assert(operand != RAB_OPERAND_ALL_INVALID && operand != RAB_OPERAND_ALL_MAX);
            break;
    }

    return RabbitizerInstruction_hasOperand(self, operand);
}

uint32_t RabbitizerInstruction_getValidBits(const RabbitizerInstruction *self) {
    size_t i;
    uint32_t validbits;

    validbits = self->_mandatorybits;

    for (i = 0; i < ARRAY_COUNT(self->descriptor->operands) && self->descriptor->operands[i] != RAB_OPERAND_ALL_INVALID; i++) {

        switch (self->descriptor->operands[i]) {
            case RAB_OPERAND_cpu_rs:
                validbits = RAB_INSTR_PACK_rs(validbits, ~0);
                break;

            case RAB_OPERAND_cpu_rt:
                validbits = RAB_INSTR_PACK_rt(validbits, ~0);
                break;

            case RAB_OPERAND_cpu_rd:
                validbits = RAB_INSTR_PACK_rd(validbits, ~0);
                break;

            case RAB_OPERAND_cpu_sa:
                validbits = RAB_INSTR_PACK_sa(validbits, ~0);
                break;

            case RAB_OPERAND_cpu_zero:
                break;

            case RAB_OPERAND_cpu_cop0d:
                validbits = RAB_INSTR_PACK_cop0d(validbits, ~0);
                break;

            case RAB_OPERAND_cpu_fs:
                validbits = RAB_INSTR_PACK_fs(validbits, ~0);
                break;

            case RAB_OPERAND_cpu_ft:
                validbits = RAB_INSTR_PACK_ft(validbits, ~0);
                break;

            case RAB_OPERAND_cpu_fd:
                validbits = RAB_INSTR_PACK_fd(validbits, ~0);
                break;

            case RAB_OPERAND_cpu_cop1cs:
                validbits = RAB_INSTR_PACK_cop1cs(validbits, ~0);
                break;

            case RAB_OPERAND_cpu_cop2t:
                validbits = RAB_INSTR_PACK_cop2t(validbits, ~0);
                break;

            case RAB_OPERAND_cpu_op:
                validbits = RAB_INSTR_PACK_op(validbits, ~0);
                break;

            case RAB_OPERAND_cpu_code:
                validbits = RAB_INSTR_PACK_code(validbits, ~0);
                break;

            case RAB_OPERAND_cpu_code_lower:
                validbits = RAB_INSTR_PACK_code_lower(validbits, ~0);
                break;

            case RAB_OPERAND_cpu_copraw:
                validbits = RAB_INSTR_PACK_copraw(validbits, ~0);
                break;

            case RAB_OPERAND_cpu_label:
                validbits = RAB_INSTR_PACK_instr_index(validbits, ~0);
                break;

            case RAB_OPERAND_cpu_immediate:
                validbits = RAB_INSTR_PACK_immediate(validbits, ~0);
                break;

            case RAB_OPERAND_cpu_branch_target_label:
                validbits = RAB_INSTR_PACK_immediate(validbits, ~0);
                break;

            case RAB_OPERAND_cpu_immediate_base:
                validbits = RAB_INSTR_PACK_immediate(validbits, ~0);
                validbits = RAB_INSTR_PACK_rs(validbits, ~0);
                break;

            /* rsp */
            case RAB_OPERAND_rsp_rs:
                validbits = RAB_INSTR_PACK_rs(validbits, ~0);
                break;

            case RAB_OPERAND_rsp_rt:
                validbits = RAB_INSTR_PACK_rt(validbits, ~0);
                break;

            case RAB_OPERAND_rsp_rd:
                validbits = RAB_INSTR_PACK_rd(validbits, ~0);
                break;

            case RAB_OPERAND_rsp_cop0d:
                validbits = RAB_INSTR_PACK_cop0d(validbits, ~0);
                break;

            case RAB_OPERAND_rsp_cop2t:
                validbits = RAB_INSTR_RSP_PACK_cop2t(validbits, ~0);
                break;

            case RAB_OPERAND_rsp_cop2cd:
                validbits = RAB_INSTR_RSP_PACK_cop2cd(validbits, ~0);
                break;

            case RAB_OPERAND_rsp_vs:
                validbits = RAB_INSTR_RSP_PACK_vs(validbits, ~0);
                break;

            case RAB_OPERAND_rsp_vt:
                validbits = RAB_INSTR_RSP_PACK_vt(validbits, ~0);
                break;

            case RAB_OPERAND_rsp_vd:
                validbits = RAB_INSTR_RSP_PACK_vd(validbits, ~0);
                break;

            case RAB_OPERAND_rsp_vt_elementhigh:
                validbits = RAB_INSTR_RSP_PACK_vt(validbits, ~0);
                validbits = RAB_INSTR_RSP_PACK_elementhigh(validbits, ~0);
                break;

            case RAB_OPERAND_rsp_vt_elementlow:
                validbits = RAB_INSTR_RSP_PACK_vt(validbits, ~0);
                validbits = RAB_INSTR_RSP_PACK_elementlow(validbits, ~0);
                break;

            case RAB_OPERAND_rsp_vd_de:
                validbits = RAB_INSTR_RSP_PACK_vd(validbits, ~0);
                validbits = RAB_INSTR_RSP_PACK_de(validbits, ~0);
                break;

            case RAB_OPERAND_rsp_vs_index:
                validbits = RAB_INSTR_RSP_PACK_vs(validbits, ~0);
                validbits = RAB_INSTR_RSP_PACK_index(validbits, ~0);
                break;

            case RAB_OPERAND_rsp_offset_rs:
                validbits = RAB_INSTR_RSP_PACK_offset(validbits, ~0);
                validbits = RAB_INSTR_PACK_rs(validbits, ~0);
                break;

            case RAB_OPERAND_rsp_immediate_base:
                validbits = RAB_INSTR_PACK_immediate(validbits, ~0);
                validbits = RAB_INSTR_PACK_rs(validbits, ~0);
                break;
            /* rsp */

            /* r5900 */
            case RAB_OPERAND_r5900_I:
            case RAB_OPERAND_r5900_Q:
            case RAB_OPERAND_r5900_R:
            case RAB_OPERAND_r5900_ACC:
                // Not real registers encoded on the instruction itself
                break;

            case RAB_OPERAND_r5900_ACCxyzw:
                validbits = RAB_INSTR_R5900_PACK_xyzw_x(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_xyzw_y(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_xyzw_z(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_xyzw_w(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vfs:
                validbits = RAB_INSTR_R5900_PACK_vfs(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vft:
                validbits = RAB_INSTR_R5900_PACK_vft(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vfd:
                validbits = RAB_INSTR_R5900_PACK_vfd(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vfsxyzw:
                validbits = RAB_INSTR_R5900_PACK_vfs(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_xyzw_x(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_xyzw_y(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_xyzw_z(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_xyzw_w(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vftxyzw:
                validbits = RAB_INSTR_R5900_PACK_vft(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_xyzw_x(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_xyzw_y(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_xyzw_z(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_xyzw_w(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vfdxyzw:
                validbits = RAB_INSTR_R5900_PACK_vfd(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_xyzw_x(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_xyzw_y(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_xyzw_z(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_xyzw_w(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vfsn:
                validbits = RAB_INSTR_R5900_PACK_vfs(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_n(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vftn:
                validbits = RAB_INSTR_R5900_PACK_vft(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_n(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vfdn:
                validbits = RAB_INSTR_R5900_PACK_vfd(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_n(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vfsl:
                validbits = RAB_INSTR_R5900_PACK_vfs(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_l(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vftl:
                validbits = RAB_INSTR_R5900_PACK_vft(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_l(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vfdl:
                validbits = RAB_INSTR_R5900_PACK_vfd(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_l(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vfsm:
                validbits = RAB_INSTR_R5900_PACK_vfs(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_m(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vftm:
                validbits = RAB_INSTR_R5900_PACK_vft(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_m(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vfdm:
                validbits = RAB_INSTR_R5900_PACK_vfd(validbits, ~0);
                validbits = RAB_INSTR_R5900_PACK_m(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vis:
                validbits = RAB_INSTR_R5900_PACK_vis(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vit:
                validbits = RAB_INSTR_R5900_PACK_vit(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vid:
                validbits = RAB_INSTR_R5900_PACK_vid(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vis_predecr:
                validbits = RAB_INSTR_R5900_PACK_vis(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vit_predecr:
                validbits = RAB_INSTR_R5900_PACK_vit(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vid_predecr:
                validbits = RAB_INSTR_R5900_PACK_vid(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vis_postincr:
                validbits = RAB_INSTR_R5900_PACK_vis(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vit_postincr:
                validbits = RAB_INSTR_R5900_PACK_vit(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_vid_postincr:
                validbits = RAB_INSTR_R5900_PACK_vid(validbits, ~0);
                break;

            case RAB_OPERAND_r5900_immediate5:
                validbits = RAB_INSTR_R5900_PACK_imm5(validbits, ~0);
                break;
                /* r5900 */

            case RAB_OPERAND_ALL_INVALID:
            case RAB_OPERAND_ALL_MAX:
                assert(self->descriptor->operands[i] != RAB_OPERAND_ALL_INVALID && self->descriptor->operands[i] != RAB_OPERAND_ALL_MAX);
                break;
        }
    }

    return validbits;
}

bool RabbitizerInstruction_isValid(const RabbitizerInstruction *self) {
    uint32_t validbits;

    validbits = RabbitizerInstruction_getValidBits(self);

    return ((~validbits) & self->word) == 0;
}
