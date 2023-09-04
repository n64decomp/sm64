/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "instructions/RabbitizerInstruction.h"

#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>


int main() {
    uint32_t word;
    RabbitizerInstruction instr;
    char *buffer;
    int extraLJust = 5;
    size_t bufferSize;
    size_t disassembledSize;

    word = 0x8D4A7E18; // lw
    //word = 0x00004010; // mfhi

    RabbitizerInstruction_init(&instr, word, 0x80000000);

    RabbitizerInstruction_processUniqueId(&instr);

    bufferSize = RabbitizerInstruction_getSizeForBuffer(&instr, 0, extraLJust);
    buffer = malloc(bufferSize + 1);
    assert(buffer != NULL);

    disassembledSize = RabbitizerInstruction_disassemble(&instr, buffer, NULL, 0, extraLJust);
    assert(disassembledSize <= bufferSize);

    printf("%08X: %s\n", word, buffer);

    free(buffer);
    RabbitizerInstruction_destroy(&instr);

    return 0;
}
