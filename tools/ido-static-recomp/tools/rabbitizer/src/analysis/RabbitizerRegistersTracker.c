/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "analysis/RabbitizerRegistersTracker.h"

#include <assert.h>

#include "common/Utils.h"
#include "common/RabbitizerConfig.h"
#include "instructions/RabbitizerRegister.h"

// TODO: abi checks

void RabbitizerRegistersTracker_init(RabbitizerRegistersTracker *self, const RabbitizerRegistersTracker *other) {
    size_t i;

    for (i = 0; i < ARRAY_COUNT(self->registers); i++) {
        RabbitizerTrackedRegisterState_init(&self->registers[i], i);
        if (other != NULL) {
            RabbitizerTrackedRegisterState_copyState(&self->registers[i], &other->registers[i]);
        }
    }
}

void RabbitizerRegistersTracker_destroy(RabbitizerRegistersTracker *self) {
    for (size_t i = 0; i < ARRAY_COUNT(self->registers); i++) {
        RabbitizerTrackedRegisterState_destroy(&self->registers[i]);
    }
}

// TODO: simplify logic
bool RabbitizerRegistersTracker_moveRegisters(RabbitizerRegistersTracker *self, const RabbitizerInstruction *instr) {
    RabbitizerTrackedRegisterState *dstState;
    RabbitizerTrackedRegisterState *srcState;
    uint8_t reg;
    uint8_t rd = RAB_INSTR_GET_rd(instr);
    uint8_t rs = RAB_INSTR_GET_rs(instr);
    uint8_t rt = RAB_INSTR_GET_rt(instr);

    if (!RabbitizerInstrDescriptor_maybeIsMove(instr->descriptor)) {
        return false;
    }
    if (rt == 0 && rs == 0) {
        // ?
        // RabbitizerTrackedRegisterState_clear(dstState);
        return false;
    }

    if (rt == 0) {
        reg = rs;
    } else if (rs == 0) {
        reg = rt;
    } else {
        if (RabbitizerTrackedRegisterState_hasAnyValue(&self->registers[rs]) && !RabbitizerTrackedRegisterState_hasAnyValue(&self->registers[rt])) {
            reg = rs;
        } else if (RabbitizerTrackedRegisterState_hasAnyValue(&self->registers[rt]) && !RabbitizerTrackedRegisterState_hasAnyValue(&self->registers[rs])) {
            reg = rt;
        } else if (rd == rs) { // Check stuff like  `addu   $3, $3, $2`
            reg = rt;
            if (self->registers[rs].hasLuiValue || self->registers[rs].hasGpGot) {
                reg = rs;
            }
        } else if (rd == rt) {
            reg = rs;
            if (self->registers[rt].hasLuiValue || self->registers[rt].hasGpGot) {
                reg = rt;
            }
        } else {
            // ?
            // RabbitizerTrackedRegisterState_clear(dstState);
            return false;
        }

        srcState = &self->registers[reg];
        RabbitizerTrackedRegisterState_copyState(&self->registers[rd], srcState);
        return true;
    }

    srcState = &self->registers[reg];
    dstState = &self->registers[rd];

    if (RabbitizerTrackedRegisterState_hasAnyValue(srcState)) {
        RabbitizerTrackedRegisterState_copyState(dstState, srcState);
        return true;
    }

    RabbitizerTrackedRegisterState_clear(dstState);
    return false;
}

void RabbitizerRegistersTracker_overwriteRegisters(RabbitizerRegistersTracker *self, const RabbitizerInstruction *instr, int instrOffset) {
    bool shouldRemove = false;
    uint8_t reg = 0;
    RabbitizerTrackedRegisterState *state = NULL;

    if (RabbitizerRegistersTracker_moveRegisters(self, instr)) {
        return;
    }

    if (RabbitizerInstrDescriptor_isFloat(instr->descriptor)) {
        switch (instr->uniqueId) {
            case RABBITIZER_INSTR_ID_cpu_mtc1:
            case RABBITIZER_INSTR_ID_cpu_dmtc1:
            case RABBITIZER_INSTR_ID_cpu_ctc1:
                // IDO usually use a reg as a temp when loading a constant value
                // into the float coprocessor, after that IDO never re-uses the value
                // in that reg for anything else
                shouldRemove = true;
                reg = RAB_INSTR_GET_rt(instr);
                break;

            default:
                break;
        }
    } else if (RabbitizerInstrDescriptor_isRType(instr->descriptor) ||
               (RabbitizerInstrDescriptor_isBranch(instr->descriptor) && RabbitizerInstrDescriptor_isIType(instr->descriptor))) {
        // $at usually is a one-use reg
        uint8_t at = 0;

        if (RAB_INSTR_GET_rs(instr) == 1) {
            at = RAB_INSTR_GET_rs(instr);
        } else if (RAB_INSTR_GET_rt(instr) == 1) {
            at = RAB_INSTR_GET_rt(instr);
        }

        state = &self->registers[at];
        if (state->hasLoValue || state->hasLuiValue || state->hasGpGot) {
            shouldRemove = true;
            reg = at;
        }
    }

    if (RabbitizerInstrDescriptor_modifiesRt(instr->descriptor)) {
        shouldRemove = true;
        reg = RAB_INSTR_GET_rt(instr);
        if (RabbitizerInstrDescriptor_canBeHi(instr->descriptor)) {
            RabbitizerTrackedRegisterState_clearLo(&self->registers[RAB_INSTR_GET_rt(instr)]);
            shouldRemove = false;
        }
    }
    if (RabbitizerInstrDescriptor_modifiesRd(instr->descriptor)) {
        shouldRemove = true;
        reg = RAB_INSTR_GET_rd(instr);
    }

    if (shouldRemove) {
        state = &self->registers[reg];
#if 0
        if (state->hasLuiValue) {
            self->_printDebugInfo_clearRegister(instr, reg)
        }
#endif

        RabbitizerTrackedRegisterState_clearHi(state);
        if (!RabbitizerTrackedRegisterState_wasSetInCurrentOffset(state, instrOffset)) {
            RabbitizerTrackedRegisterState_clearGp(state);
            RabbitizerTrackedRegisterState_clearLo(state);
        }
    }
}

void RabbitizerRegistersTracker_unsetRegistersAfterFuncCall(RabbitizerRegistersTracker *self, UNUSED const RabbitizerInstruction *instr,
                                                            const RabbitizerInstruction *prevInstr) {
    RabbitizerTrackedRegisterState *state = NULL;

    if (!RabbitizerInstrDescriptor_doesLink(prevInstr->descriptor)) {
        return;
    }

    if (RabbitizerConfig_Cfg.regNames.gprAbiNames == RABBITIZER_ABI_O32 || RabbitizerConfig_Cfg.regNames.gprAbiNames == RABBITIZER_ABI_NUMERIC) {
        for (size_t reg = 0; reg < ARRAY_COUNT(self->registers); reg++) {
            switch (reg) {
                case RABBITIZER_REG_GPR_O32_at:
                case RABBITIZER_REG_GPR_O32_v0:
                case RABBITIZER_REG_GPR_O32_v1:
                case RABBITIZER_REG_GPR_O32_a0:
                case RABBITIZER_REG_GPR_O32_a1:
                case RABBITIZER_REG_GPR_O32_a2:
                case RABBITIZER_REG_GPR_O32_a3:
                case RABBITIZER_REG_GPR_O32_t0:
                case RABBITIZER_REG_GPR_O32_t1:
                case RABBITIZER_REG_GPR_O32_t2:
                case RABBITIZER_REG_GPR_O32_t3:
                case RABBITIZER_REG_GPR_O32_t4:
                case RABBITIZER_REG_GPR_O32_t5:
                case RABBITIZER_REG_GPR_O32_t6:
                case RABBITIZER_REG_GPR_O32_t7:
                case RABBITIZER_REG_GPR_O32_t8:
                case RABBITIZER_REG_GPR_O32_t9:
                case RABBITIZER_REG_GPR_O32_ra:
                    state = &self->registers[reg];
#if 0
                    if (state.hasLuiValue) {
                        self->_printDebugInfo_clearRegister(instr, reg)
                    }
#endif
                    RabbitizerTrackedRegisterState_clear(state);
                    break;

                default:
                    break;
            }
        }
    } else if (RabbitizerConfig_Cfg.regNames.gprAbiNames == RABBITIZER_ABI_N32 || RabbitizerConfig_Cfg.regNames.gprAbiNames == RABBITIZER_ABI_N64) {
        for (size_t reg = 0; reg < ARRAY_COUNT(self->registers); reg++) {
            switch (reg) {
                case RABBITIZER_REG_GPR_N32_at:
                case RABBITIZER_REG_GPR_N32_v0:
                case RABBITIZER_REG_GPR_N32_v1:
                case RABBITIZER_REG_GPR_N32_a0:
                case RABBITIZER_REG_GPR_N32_a1:
                case RABBITIZER_REG_GPR_N32_a2:
                case RABBITIZER_REG_GPR_N32_a3:
                case RABBITIZER_REG_GPR_N32_a4:
                case RABBITIZER_REG_GPR_N32_a5:
                case RABBITIZER_REG_GPR_N32_a6:
                case RABBITIZER_REG_GPR_N32_a7:
                case RABBITIZER_REG_GPR_N32_t0:
                case RABBITIZER_REG_GPR_N32_t1:
                case RABBITIZER_REG_GPR_N32_t2:
                case RABBITIZER_REG_GPR_N32_t3:
                case RABBITIZER_REG_GPR_N32_t8:
                case RABBITIZER_REG_GPR_N32_t9:
                case RABBITIZER_REG_GPR_N32_ra:
                    state = &self->registers[reg];
#if 0
                    if (state.hasLuiValue) {
                        self->_printDebugInfo_clearRegister(instr, reg)
                    }
#endif
                    RabbitizerTrackedRegisterState_clear(state);
                    break;

                default:
                    break;
            }
        }
    }
}

bool RabbitizerRegistersTracker_getAddressIfCanSetType(const RabbitizerRegistersTracker *self, const RabbitizerInstruction *instr, int instrOffset,
                                                       uint32_t *dstAddress) {
    const RabbitizerTrackedRegisterState *state = &self->registers[RAB_INSTR_GET_rs(instr)];

    if (!state->hasLoValue) {
        return false;
    }

    if (!state->dereferenced || instrOffset == state->dereferenceOffset) {
        *dstAddress = state->value;
        return true;
    }

    return false;
}

bool RabbitizerRegistersTracker_getJrInfo(const RabbitizerRegistersTracker *self, const RabbitizerInstruction *instr, int *dstOffset, uint32_t *dstAddress) {
    const RabbitizerTrackedRegisterState *state = &self->registers[RAB_INSTR_GET_rs(instr)];

    if (!state->hasLoValue || !state->dereferenced) {
        return false;
    }

    *dstOffset = state->loOffset;
    *dstAddress = state->value;
    return true;
}

// prevInstr can be NULL
void RabbitizerRegistersTracker_processLui(RabbitizerRegistersTracker *self, const RabbitizerInstruction *instr, int instrOffset,
                                           const RabbitizerInstruction *prevInstr) {
    RabbitizerTrackedRegisterState *state = NULL;

    assert(RabbitizerInstrDescriptor_canBeHi(instr->descriptor));

    state = &self->registers[RAB_INSTR_GET_rt(instr)];
    RabbitizerTrackedRegisterState_clear(state);
    RabbitizerTrackedRegisterState_setHi(state, RabbitizerInstruction_getImmediate(instr), instrOffset);

    if (prevInstr != NULL) {
        // If the previous instructions is a branch likely, then nulify
        // the effects of this instruction for future analysis
        state->luiSetOnBranchLikely = RabbitizerInstrDescriptor_isBranchLikely(prevInstr->descriptor) || RabbitizerInstruction_isUnconditionalBranch(prevInstr);
    }
}

void RabbitizerRegistersTracker_processGpLoad(RabbitizerRegistersTracker *self, const RabbitizerInstruction *instr, int instrOffset) {
    RabbitizerTrackedRegisterState *state = NULL;

    assert(RabbitizerInstrDescriptor_canBeLo(instr->descriptor));

    state = &self->registers[RAB_INSTR_GET_rt(instr)];

    RabbitizerTrackedRegisterState_clear(state);
    RabbitizerTrackedRegisterState_setGpLoad(state, RabbitizerInstruction_getImmediate(instr), instrOffset);
}

bool RabbitizerRegistersTracker_getLuiOffsetForConstant(const RabbitizerRegistersTracker *self, const RabbitizerInstruction *instr, int *dstOffset) {
    const RabbitizerTrackedRegisterState *state = &self->registers[RAB_INSTR_GET_rs(instr)];

    if (!state->hasLuiValue) {
        return false;
    }

    *dstOffset = state->luiOffset;
    return true;
}

void RabbitizerRegistersTracker_processConstant(RabbitizerRegistersTracker *self, const RabbitizerInstruction *instr, uint32_t value, int offset) {
    RabbitizerTrackedRegisterState *stateDst = &self->registers[RAB_INSTR_GET_rt(instr)];

    RabbitizerTrackedRegisterState_setLo(stateDst, value, offset);
}

// TODO: this function should not be changing the state of the tracker
bool RabbitizerRegistersTracker_getLuiOffsetForLo(RabbitizerRegistersTracker *self, const RabbitizerInstruction *instr, int instrOffset, int *dstOffset,
                                                  bool *dstIsGp) {
    const RabbitizerTrackedRegisterState *state = &self->registers[RAB_INSTR_GET_rs(instr)];

    if (state->hasLuiValue && !state->luiSetOnBranchLikely) {
        *dstOffset = state->luiOffset;
        *dstIsGp = false;
        return true;
    }

    // TODO: abi
    if (RAB_INSTR_GET_rs(instr) == 28) { // $gp
        *dstOffset = 0;
        *dstIsGp = true;
        return true;
    }

    if (RabbitizerInstrDescriptor_modifiesRt(instr->descriptor) && RabbitizerInstrDescriptor_doesDereference(instr->descriptor)) {
        if (state->hasLoValue && !state->dereferenced) {
            // Simulate a dereference
            RabbitizerTrackedRegisterState_dereferenceState(&self->registers[RAB_INSTR_GET_rt(instr)], state, instrOffset);
        }
    }

    return false;
}

RabbitizerLoPairingInfo RabbitizerRegistersTracker_preprocessLoAndGetInfo(RabbitizerRegistersTracker *self, const RabbitizerInstruction *instr,
                                                                          int instrOffset) {
    const RabbitizerTrackedRegisterState *state = &self->registers[RAB_INSTR_GET_rs(instr)];
    RabbitizerLoPairingInfo pairingInfo;

    RabbitizerLoPairingInfo_Init(&pairingInfo);

    if (state->hasLuiValue && !state->luiSetOnBranchLikely) {
        pairingInfo.instrOffset = state->luiOffset;
        pairingInfo.value = state->value;
        pairingInfo.shouldProcess = true;
        return pairingInfo;
    }

    if ((RAB_INSTR_GET_rs(instr) == RABBITIZER_REG_GPR_O32_gp) || (RAB_INSTR_GET_rs(instr) == RABBITIZER_REG_GPR_N32_gp)) {
        pairingInfo.value = state->value;
        pairingInfo.isGpRel = true;
        pairingInfo.shouldProcess = true;
        return pairingInfo;
    }

    if (state->hasGpGot) {
        pairingInfo.instrOffset = state->gpGotOffset;
        pairingInfo.value = state->value;
        pairingInfo.shouldProcess = true;
        pairingInfo.isGpGot = true;
        return pairingInfo;
    }

    if (RabbitizerInstrDescriptor_modifiesRt(instr->descriptor) && RabbitizerInstrDescriptor_doesDereference(instr->descriptor)) {
        if (state->hasLoValue && !state->dereferenced) {
            // Simulate a dereference
            RabbitizerTrackedRegisterState_dereferenceState(&self->registers[RAB_INSTR_GET_rt(instr)], state, instrOffset);
        }
    }

    return pairingInfo;
}

void RabbitizerRegistersTracker_processLo(RabbitizerRegistersTracker *self, const RabbitizerInstruction *instr, uint32_t value, int offset) {
    RabbitizerTrackedRegisterState *stateDst;

    if (!RabbitizerInstrDescriptor_modifiesRt(instr->descriptor)) {
        return;
    }

    stateDst = &self->registers[RAB_INSTR_GET_rt(instr)];
    RabbitizerTrackedRegisterState_setLo(stateDst, value, offset);
    if (RabbitizerInstrDescriptor_doesDereference(instr->descriptor)) {
        RabbitizerTrackedRegisterState_deref(stateDst, offset);
    }
    if (RAB_INSTR_GET_rt(instr) == RAB_INSTR_GET_rs(instr)) {
        RabbitizerTrackedRegisterState_clearHi(stateDst);
        RabbitizerTrackedRegisterState_clearGp(stateDst);
    }
}

bool RabbitizerRegistersTracker_hasLoButNoHi(const RabbitizerRegistersTracker *self, const RabbitizerInstruction *instr) {
    const RabbitizerTrackedRegisterState *state;

    assert(instr != NULL);

    state = &self->registers[RAB_INSTR_GET_rs(instr)];
    return state->hasLoValue && !state->hasLuiValue;
}

#if 0
def _printDebugInfo_clearRegister(self, instr: rabbitizer.Instruction, reg: int, currentVram: int|None=None) -> None:
    if not common.GlobalConfig.PRINT_SYMBOL_FINDER_DEBUG_INFO:
        return

    if currentVram is None:
        return

    print("Clearing reg:")
    // print()
    print(f"vram: {currentVram:X}")
    print(instr)
    print(self->registers)
    // TODO
    // print(f"deleting {reg} / {instr->getRegisterName(reg)}")
    print()
#endif
