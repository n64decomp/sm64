/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "analysis/RegistersTracker.hpp"

using namespace rabbitizer;

RegistersTracker::RegistersTracker() {
    RabbitizerRegistersTracker_init(&this->tracker, NULL);
}
RegistersTracker::RegistersTracker(const RegistersTracker &other) {
    RabbitizerRegistersTracker_init(&this->tracker, &other.tracker);
}
RegistersTracker::~RegistersTracker() {
    RabbitizerRegistersTracker_destroy(&this->tracker);
}

RabbitizerRegistersTracker *RegistersTracker::getCPtr() {
    return &this->tracker;
}
const RabbitizerRegistersTracker *RegistersTracker::getCPtr() const {
    return &this->tracker;
}

bool RegistersTracker::moveRegisters(const InstructionBase &instr) {
    return RabbitizerRegistersTracker_moveRegisters(&this->tracker, instr.getCPtr());
}
void RegistersTracker::overwriteRegisters(const InstructionBase &instr, int instrOffset) {
    RabbitizerRegistersTracker_overwriteRegisters(&this->tracker, instr.getCPtr(), instrOffset);
}
void RegistersTracker::unsetRegistersAfterFuncCall(const InstructionBase &instr, const InstructionBase &prevInstr) {
    RabbitizerRegistersTracker_unsetRegistersAfterFuncCall(&this->tracker, instr.getCPtr(), prevInstr.getCPtr());
}
bool RegistersTracker::getAddressIfCanSetType(const InstructionBase &instr, int instrOffset, uint32_t *dstAddress) const {
    return RabbitizerRegistersTracker_getAddressIfCanSetType(&this->tracker, instr.getCPtr(), instrOffset, dstAddress);
}
bool RegistersTracker::getJrInfo(const InstructionBase &instr, int *dstOffset, uint32_t *dstAddress) const {
    return RabbitizerRegistersTracker_getJrInfo(&this->tracker, instr.getCPtr(), dstOffset, dstAddress);
}

void RegistersTracker::processLui(const InstructionBase &instr, int instrOffset) {
    RabbitizerRegistersTracker_processLui(&this->tracker, instr.getCPtr(), instrOffset, NULL);
}
void RegistersTracker::processLui(const InstructionBase &instr, int instrOffset, const InstructionBase &prevInstr) {
    RabbitizerRegistersTracker_processLui(&this->tracker, instr.getCPtr(), instrOffset, prevInstr.getCPtr());
}
void RegistersTracker::processGpLoad(const InstructionBase &instr, int instrOffset) {
    RabbitizerRegistersTracker_processGpLoad(&this->tracker, instr.getCPtr(), instrOffset);
}
bool RegistersTracker::getLuiOffsetForConstant(const InstructionBase &instr, int *dstOffset) const {
    return RabbitizerRegistersTracker_getLuiOffsetForConstant(&this->tracker, instr.getCPtr(), dstOffset);
}
void RegistersTracker::processConstant(const InstructionBase &instr, uint32_t value, int offset) {
    RabbitizerRegistersTracker_processConstant(&this->tracker, instr.getCPtr(), value, offset);
}
LoPairingInfo RegistersTracker::preprocessLoAndGetInfo(const InstructionBase &instr, int instrOffset) {
    return RabbitizerRegistersTracker_preprocessLoAndGetInfo(&this->tracker, instr.getCPtr(), instrOffset);
}
void RegistersTracker::processLo(const InstructionBase &instr, uint32_t value, int offset) {
    RabbitizerRegistersTracker_processLo(&this->tracker, instr.getCPtr(), value, offset);
}
bool RegistersTracker::hasLoButNoHi(const InstructionBase &instr) const {
    return RabbitizerRegistersTracker_hasLoButNoHi(&this->tracker, instr.getCPtr());
}
