/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "instructions/InstructionCpu.hpp"


int main() {
    uint32_t word = 0x8D4A7E18; // lw
    uint32_t vram = 0x80000000;
    int extraLJust = 5;
    rabbitizer::InstructionCpu instr(word, vram);

    printf("%08X: %s\n", word, instr.disassemble(extraLJust).c_str());

    return 0;
}
