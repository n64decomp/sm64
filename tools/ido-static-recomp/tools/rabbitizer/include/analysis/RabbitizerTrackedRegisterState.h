/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_TRACKED_REGISTER_STATE_H
#define RABBITIZER_TRACKED_REGISTER_STATE_H
#pragma once

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

#include "common/Utils.h"

#ifdef __cplusplus
extern "C" {
#endif


typedef struct RabbitizerTrackedRegisterState {
    int registerNum;

    bool hasLuiValue;
    int luiOffset; // The offset of last lui which set a value to this register
    bool luiSetOnBranchLikely;

    bool hasGpGot;
    int gpGotOffset;

    bool hasLoValue;
    int loOffset;
    bool dereferenced;
    int dereferenceOffset;

    uint32_t value;
} RabbitizerTrackedRegisterState;


NON_NULL(1)
void RabbitizerTrackedRegisterState_init(RabbitizerTrackedRegisterState *self, int registerNum);
NON_NULL(1)
void RabbitizerTrackedRegisterState_destroy(RabbitizerTrackedRegisterState *self);

NON_NULL(1)
void RabbitizerTrackedRegisterState_clear(RabbitizerTrackedRegisterState *self);
NON_NULL(1)
void RabbitizerTrackedRegisterState_clearHi(RabbitizerTrackedRegisterState *self);
NON_NULL(1)
void RabbitizerTrackedRegisterState_clearGp(RabbitizerTrackedRegisterState *self);
NON_NULL(1)
void RabbitizerTrackedRegisterState_clearLo(RabbitizerTrackedRegisterState *self);

NON_NULL(1, 2)
void RabbitizerTrackedRegisterState_copyState(RabbitizerTrackedRegisterState *self, const RabbitizerTrackedRegisterState *other);

NON_NULL(1)
void RabbitizerTrackedRegisterState_setHi(RabbitizerTrackedRegisterState *self, uint32_t value, int offset);
NON_NULL(1)
void RabbitizerTrackedRegisterState_setGpLoad(RabbitizerTrackedRegisterState *self, uint32_t value, int offset);
NON_NULL(1)
void RabbitizerTrackedRegisterState_setLo(RabbitizerTrackedRegisterState *self, uint32_t value, int offset);

NON_NULL(1)
void RabbitizerTrackedRegisterState_deref(RabbitizerTrackedRegisterState *self, int offset);
NON_NULL(1, 2)
void RabbitizerTrackedRegisterState_dereferenceState(RabbitizerTrackedRegisterState *self, const RabbitizerTrackedRegisterState *other, int offset);

NODISCARD NON_NULL(1) PURE
bool RabbitizerTrackedRegisterState_hasAnyValue(const RabbitizerTrackedRegisterState *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerTrackedRegisterState_wasSetInCurrentOffset(const RabbitizerTrackedRegisterState *self, int offset);

NON_NULL(1)
void RabbitizerTrackedRegisterState_fprint(const RabbitizerTrackedRegisterState *self, FILE* outFile);


#ifdef __cplusplus
}
#endif

#endif
