/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "instructions/RabbitizerInstructionRsp.h"

#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>


int main() {
    uint32_t word;
    RabbitizerInstruction instr;
    char *buffer;
    int extraLJust = 5;
    uint32_t validbits;

    //word = 0x4B01C8E8; // vand    $v3, $v25, $v1[0]
    word = 0x48952000; // mtc2    $21, $v4[0]

    RabbitizerInstructionRsp_init(&instr, word, 0x80000000);

    RabbitizerInstructionRsp_processUniqueId(&instr);

    buffer = malloc(RabbitizerInstruction_getSizeForBuffer(&instr, 0, extraLJust) + 1);
    assert(buffer != NULL);

    RabbitizerInstruction_disassemble(&instr, buffer, NULL, 0, extraLJust);

    printf("%08X: %s\n", word, buffer);

    validbits = RabbitizerInstruction_getValidBits(&instr);

    printf("word:           %08X\n", instr.word);
    printf("mandatory bits: %08X\n", instr._mandatorybits);
    printf("valid bits:     %08X\n", validbits);
    printf("invalid bits:   %08X\n", (~validbits) & instr.word);

    free(buffer);
    RabbitizerInstructionRsp_destroy(&instr);

    return 0;
}
