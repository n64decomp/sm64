/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

/*
    31---------26---------------------------------------------------0
    |  opcode   |                                                   |
    ------6----------------------------------------------------------
    |--000--|--001--|--010--|--011--|--100--|--101--|--110--|--111--| lo
000 | *1    | *2    | J     | JAL   | BEQ   | BNE   | BLEZ  | BGTZ  |
001 | ADDI  | ADDIU | SLTI  | SLTIU | ANDI  | ORI   | XORI  | LUI   |
010 | *3    | *4    |  *5   | ---   | BEQL  | BNEL  | BLEZL | BGTZL |
011 | DADDI |DADDIU | LDL   | LDR   |  *6   |  ---  |  LQ   | SQ    |
100 | LB    | LH    | LWL   | LW    | LBU   | LHU   | LWR   | LWU   |
101 | SB    | SH    | SWL   | SW    | SDL   | SDR   | SWR   | CACHE |
110 | ---   | LWC1  | ---   | PREF  | ---   | ---   | LQC2  | LD    |
111 | ---   | SWC1  | ---   | ---   | ---   | ---   | SQC2  | SD    |
 hi |-------|-------|-------|-------|-------|-------|-------|-------|
     *1 = SPECIAL, see SPECIAL list    *2 = REGIMM, see REGIMM list
     *3 = COP0                         *4 = COP1
     *5 = COP2                         *6 = MMI table
*/

// The other instructions are implemented using the main CPU table


RABBITIZER_DEF_INSTR_ID(r5900, 0x1E, lq,    .operands={RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_immediate_base}, .instrType=RABBITIZER_INSTR_TYPE_I, .modifiesRt=true, .canBeLo=true, .doesDereference=true, .doesLoad=true) // Load Quadword
RABBITIZER_DEF_INSTR_ID(r5900, 0x1F, sq,    .operands={RAB_OPERAND_cpu_rt, RAB_OPERAND_cpu_immediate_base}, .instrType=RABBITIZER_INSTR_TYPE_I, .canBeLo=true, .doesDereference=true, .doesStore=true) // Store Quadword

RABBITIZER_DEF_INSTR_ID(r5900, 0x36, lqc2,  .operands={RAB_OPERAND_r5900_vft, RAB_OPERAND_cpu_immediate_base}, .canBeLo=true, .doesDereference=true, .doesLoad=true)

RABBITIZER_DEF_INSTR_ID(r5900, 0x3E, sqc2,  .operands={RAB_OPERAND_r5900_vft, RAB_OPERAND_cpu_immediate_base}, .canBeLo=true, .doesDereference=true, .doesStore=true)
