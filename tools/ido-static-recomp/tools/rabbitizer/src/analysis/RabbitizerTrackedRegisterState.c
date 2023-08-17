/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "analysis/RabbitizerTrackedRegisterState.h"

#include <assert.h>

#include "common/Utils.h"
#include "instructions/RabbitizerRegister.h"

void RabbitizerTrackedRegisterState_init(RabbitizerTrackedRegisterState *self, int registerNum) {
    self->registerNum = registerNum;

    self->hasLuiValue = false;
    self->luiOffset = 0;
    self->luiSetOnBranchLikely = false;

    self->hasGpGot = false;
    self->gpGotOffset = 0;

    self->hasLoValue = false;
    self->loOffset = 0;
    self->dereferenced = false;
    self->dereferenceOffset = 0;

    self->value = 0;
}

void RabbitizerTrackedRegisterState_destroy(UNUSED RabbitizerTrackedRegisterState *self) {
}

void RabbitizerTrackedRegisterState_clear(RabbitizerTrackedRegisterState *self) {
    self->hasLuiValue = false;
    self->luiOffset = 0;
    self->luiSetOnBranchLikely = false;

    self->hasGpGot = false;
    self->gpGotOffset = 0;

    self->hasLoValue = false;
    self->loOffset = 0;
    self->dereferenced = false;
    self->dereferenceOffset = 0;
    self->value = 0;
}

void RabbitizerTrackedRegisterState_clearHi(RabbitizerTrackedRegisterState *self) {
    self->hasLuiValue = false;
    self->luiOffset = 0;
    self->luiSetOnBranchLikely = false;
}

void RabbitizerTrackedRegisterState_clearGp(RabbitizerTrackedRegisterState *self) {
    self->hasGpGot = false;
    self->gpGotOffset = 0;
}

void RabbitizerTrackedRegisterState_clearLo(RabbitizerTrackedRegisterState *self) {
    self->hasLoValue = false;
    self->loOffset = 0;
    self->dereferenced = false;
    self->dereferenceOffset = 0;
}

void RabbitizerTrackedRegisterState_copyState(RabbitizerTrackedRegisterState *self, const RabbitizerTrackedRegisterState *other) {
    self->hasLuiValue = other->hasLuiValue;
    self->luiOffset = other->luiOffset;
    self->luiSetOnBranchLikely = other->luiSetOnBranchLikely;

    self->hasGpGot = other->hasGpGot;
    self->gpGotOffset = other->gpGotOffset;

    self->hasLoValue = other->hasLoValue;
    self->loOffset = other->loOffset;
    self->dereferenced = other->dereferenced;
    self->dereferenceOffset = other->dereferenceOffset;

    self->value = other->value;
}

void RabbitizerTrackedRegisterState_setHi(RabbitizerTrackedRegisterState *self, uint32_t value, int offset) {
    assert(!self->hasGpGot);

    self->hasLuiValue = true;
    self->luiOffset = offset;
    self->value = value << 16;
}

void RabbitizerTrackedRegisterState_setGpLoad(RabbitizerTrackedRegisterState *self, uint32_t value, int offset) {
    assert(!self->hasLuiValue);

    self->hasGpGot = true;
    self->gpGotOffset = offset;
    self->value = value;
}

void RabbitizerTrackedRegisterState_setLo(RabbitizerTrackedRegisterState *self, uint32_t value, int offset) {
    self->value = value;
    self->loOffset = offset;
    self->hasLoValue = true;
    self->dereferenced = false;
    self->dereferenceOffset = 0;
}

void RabbitizerTrackedRegisterState_deref(RabbitizerTrackedRegisterState *self, int offset) {
    self->dereferenced = true;
    self->dereferenceOffset = offset;
}

void RabbitizerTrackedRegisterState_dereferenceState(RabbitizerTrackedRegisterState *self, const RabbitizerTrackedRegisterState *other, int offset) {
    assert(other->hasLoValue);
    assert(!other->dereferenced);

    RabbitizerTrackedRegisterState_copyState(self, other);
    RabbitizerTrackedRegisterState_deref(self, offset);
}

bool RabbitizerTrackedRegisterState_hasAnyValue(const RabbitizerTrackedRegisterState *self) {
    return self->hasLuiValue || self->hasLoValue || self->hasGpGot;
}

bool RabbitizerTrackedRegisterState_wasSetInCurrentOffset(const RabbitizerTrackedRegisterState *self, int offset) {
    return self->loOffset == offset || self->dereferenceOffset == offset;
}

void RabbitizerTrackedRegisterState_fprint(const RabbitizerTrackedRegisterState *self, FILE *outFile) {
    fprintf(outFile, "TrackedRegisterState(%i / %s)\n", self->registerNum, RabbitizerRegister_getNameGpr(self->registerNum));

    fprintf(outFile, "    hasLuiValue: %s\n", self->hasLuiValue ? "true" : "false");
    fprintf(outFile, "    luiOffset: 0x%X\n", self->luiOffset);
    fprintf(outFile, "    luiSetOnBranchLikely: %s\n", self->luiSetOnBranchLikely ? "true" : "false");

    fprintf(outFile, "    hasGpGot: %s\n", self->hasGpGot ? "true" : "false");
    fprintf(outFile, "    gpGotOffset: 0x%X\n", self->gpGotOffset);

    fprintf(outFile, "    hasLoValue: %s\n", self->hasLoValue ? "true" : "false");
    fprintf(outFile, "    loOffset: %X\n", self->loOffset);
    fprintf(outFile, "    dereferenced: %s\n", self->dereferenced ? "true" : "false");
    fprintf(outFile, "    dereferenceOffset: %X\n", self->dereferenceOffset);

    fprintf(outFile, "    value: %X\n", self->value);
}
