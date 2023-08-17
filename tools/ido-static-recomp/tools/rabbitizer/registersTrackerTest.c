/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "instructions/RabbitizerInstruction.h"
#include "analysis/RabbitizerRegistersTracker.h"


int main() {
    RabbitizerRegistersTracker regsTracker;
    RabbitizerInstruction instr;
    uint32_t word = 0x002D0821; // addu        $at, $at, $t5
    uint32_t vram = 0x0042F170;
    int instrOffset = 220;

    RabbitizerRegistersTracker_init(&regsTracker, NULL);

    RabbitizerInstruction_init(&instr, word, vram);
    RabbitizerInstruction_processUniqueId(&instr);

    regsTracker.registers[1] = (RabbitizerTrackedRegisterState){
        .dereferenceOffset = 212,
        .dereferenced = true,
        .gpGotOffset = 212,
        .hasGpGot = true,
        .hasLoValue = true,
        .hasLuiValue = false,
        .loOffset = 212,
        .luiOffset = 0,
        .luiSetOnBranchLikely = false,
        .value = 0x10010000,
        .registerNum = regsTracker.registers[1].registerNum,
    };

    RabbitizerRegistersTracker_overwriteRegisters(&regsTracker, &instr, instrOffset);

    RabbitizerInstruction_destroy(&instr);

    RabbitizerRegistersTracker_destroy(&regsTracker);

    return 0;
}
