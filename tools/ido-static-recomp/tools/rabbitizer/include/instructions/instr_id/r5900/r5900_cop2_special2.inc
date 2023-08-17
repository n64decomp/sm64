/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

/*
    31---------26-25-----21-20------------------11-10------6-5-2-1--0
    |  =COP2   | Special2 |                        |  fhi  |1111|flo|
    ------6----------5-----------------------------------------------
Note: opcode is flo | (fhi * 4).
     |--000--|--001--|--010--|--011--|--100--|--101--|--110--|--111--| lo
0000 |VADDAx |VADDAy |VADDAz |VADDAw |VSUBAx |VSUBAy |VSUBAz |VSUBAw |
0001 |VMADDAx|VMADDAy|VMADDAz|VMADDAw|VMSUBAx|VMSUBAy|VMSUBAz|VMSUBAw|
0010 |VITOF0 |VITOF4 |VITOF12|VITOF15|VFTOI0 |VFTOI4 |VFTOI12|VFTOI15|
0011 |VMULAx |VMULAy |VMULAz |VMULAw |VMULAq |VABS   |VMULAi |VCLIPw |
0100 |VADDAq |VMADDAq|VADDAi |VMADDAi|VSUBAq |VMSUBAq|VSUBAi |VMSUBAi|
0101 |VADDA  |VMADDA |VMULA  |  ---  |VSUBA  |VMSUBA |VOPMULA|VNOP   |
0110 |VMOVE  |VMR32  |  ---  |  ---  |VLQI   |VSQI   |VLQD   |VSQD   |
0111 |VDIV   |VSQRT  |VRSQRT |VWAITQ |VMTIR  |VMFIR  |VILWR  |VISWR  |
1000 |VRNEXT |VRGET  |VRINIT |VRXOR  |  ---  |  ---  |  ---  |  ---  |
1001 |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |
1010 |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |
1011 |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |
1100 |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |
1101 |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |
1110 |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |
1111 |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |  ---  |
 hi  |-------|-------|-------|-------|-------|-------|-------|-------|
*/

// TODO: operands and properties

RABBITIZER_DEF_INSTR_ID(r5900, 0x00, vaddax,    .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Add accumulator broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x01, vadday,    .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Add accumulator broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x02, vaddaz,    .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Add accumulator broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x03, vaddaw,    .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Add accumulator broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x04, vsubax,    .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply and substract accumulator broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x05, vsubay,    .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply and substract accumulator broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x06, vsubaz,    .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply and substract accumulator broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x07, vsubaw,    .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply and substract accumulator broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x08, vmaddax,   .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw) // Multiply and add accumulator broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x09, vmadday,   .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw) // Multiply and add accumulator broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x0A, vmaddaz,   .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw) // Multiply and add accumulator broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x0B, vmaddaw,   .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw) // Multiply and add accumulator broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x0C, vmsubax,   .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply and substract accumulator broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x0D, vmsubay,   .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply and substract accumulator broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x0E, vmsubaz,   .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply and substract accumulator broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x0F, vmsubaw,   .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply and substract accumulator broadcast

RABBITIZER_DEF_INSTR_ID(r5900, 0x10, vitof0,    .operands={RAB_OPERAND_r5900_vftxyzw, RAB_OPERAND_r5900_vfsxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Integer to floating point
RABBITIZER_DEF_INSTR_ID(r5900, 0x11, vitof4,    .operands={RAB_OPERAND_r5900_vftxyzw, RAB_OPERAND_r5900_vfsxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Integer to floating point
RABBITIZER_DEF_INSTR_ID(r5900, 0x12, vitof12,   .operands={RAB_OPERAND_r5900_vftxyzw, RAB_OPERAND_r5900_vfsxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Integer to floating point
RABBITIZER_DEF_INSTR_ID(r5900, 0x13, vitof15,   .operands={RAB_OPERAND_r5900_vftxyzw, RAB_OPERAND_r5900_vfsxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Integer to floating point
RABBITIZER_DEF_INSTR_ID(r5900, 0x14, vftoi0,    .operands={RAB_OPERAND_r5900_vftxyzw, RAB_OPERAND_r5900_vfsxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Floating to integer
RABBITIZER_DEF_INSTR_ID(r5900, 0x15, vftoi4,    .operands={RAB_OPERAND_r5900_vftxyzw, RAB_OPERAND_r5900_vfsxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Floating to integer
RABBITIZER_DEF_INSTR_ID(r5900, 0x16, vftoi12,   .operands={RAB_OPERAND_r5900_vftxyzw, RAB_OPERAND_r5900_vfsxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Floating to integer
RABBITIZER_DEF_INSTR_ID(r5900, 0x17, vftoi15,   .operands={RAB_OPERAND_r5900_vftxyzw, RAB_OPERAND_r5900_vfsxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Floating to integer

RABBITIZER_DEF_INSTR_ID(r5900, 0x18, vmulax,    .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw)
RABBITIZER_DEF_INSTR_ID(r5900, 0x19, vmulay,    .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw)
RABBITIZER_DEF_INSTR_ID(r5900, 0x1A, vmulaz,    .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw)
RABBITIZER_DEF_INSTR_ID(r5900, 0x1B, vmulaw,    .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw)
// TODO
RABBITIZER_DEF_INSTR_ID(r5900, 0x1C, vmulaq,    .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_Q}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw)

RABBITIZER_DEF_INSTR_ID(r5900, 0x1D, vabs,      .operands={RAB_OPERAND_r5900_vftxyzw, RAB_OPERAND_r5900_vfsxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Absolute

// TODO
RABBITIZER_DEF_INSTR_ID(r5900, 0x1E, vmulai,    .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_I}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw)

RABBITIZER_DEF_INSTR_ID(r5900, 0x1F, vclipw,    .operands={RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Clip

RABBITIZER_DEF_INSTR_ID(r5900, 0x20, vaddaq,    .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_Q}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Add accumulator Q
RABBITIZER_DEF_INSTR_ID(r5900, 0x21, vmaddaq,   .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_Q}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply and add accumulator Q
RABBITIZER_DEF_INSTR_ID(r5900, 0x22, vaddai,    .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_I}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Add accumulator I
RABBITIZER_DEF_INSTR_ID(r5900, 0x23, vmaddai,   .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_I}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply and add accumulator I
RABBITIZER_DEF_INSTR_ID(r5900, 0x24, vsubaq,    .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_Q}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Subtract accumulator Q
RABBITIZER_DEF_INSTR_ID(r5900, 0x25, vmsubaq,   .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_Q}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply and Subtract accumulator Q
RABBITIZER_DEF_INSTR_ID(r5900, 0x26, vsubai,    .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_I}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Subtract accumulator I
RABBITIZER_DEF_INSTR_ID(r5900, 0x27, vmsubai,   .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_I}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply and Subtract accumulator I
RABBITIZER_DEF_INSTR_ID(r5900, 0x28, vadda,     .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vftxyzw, RAB_OPERAND_r5900_vfsxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Add accumulator
RABBITIZER_DEF_INSTR_ID(r5900, 0x29, vmadda,    .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply and add accumulator

// TODO
RABBITIZER_DEF_INSTR_ID(r5900, 0x2A, vmula,     .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw)

RABBITIZER_DEF_INSTR_ID(r5900, 0x2C, vsuba,     .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true)
RABBITIZER_DEF_INSTR_ID(r5900, 0x2D, vmsuba,    .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vftxyzw, RAB_OPERAND_r5900_vfsxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply and substract accumulator
RABBITIZER_DEF_INSTR_ID(r5900, 0x2E, vopmula,   .operands={RAB_OPERAND_r5900_ACCxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Outer product pre increment
RABBITIZER_DEF_INSTR_ID(r5900, 0x2F, vnop,      .operands={0}) // No operation

RABBITIZER_DEF_INSTR_ID(r5900, 0x30, vmove,     .operands={RAB_OPERAND_r5900_vftxyzw, RAB_OPERAND_r5900_vfsxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Move floating point registers
RABBITIZER_DEF_INSTR_ID(r5900, 0x31, vmr32,     .operands={RAB_OPERAND_r5900_vftxyzw, RAB_OPERAND_r5900_vfsxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Move and rotate per word
RABBITIZER_DEF_INSTR_ID(r5900, 0x34, vlqi,      .operands={RAB_OPERAND_r5900_vftxyzw, RAB_OPERAND_r5900_vis_postincr}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Load quadraword post increment
RABBITIZER_DEF_INSTR_ID(r5900, 0x35, vsqi,      .operands={RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vit_postincr}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Store quadraword post increment
RABBITIZER_DEF_INSTR_ID(r5900, 0x36, vlqd,      .operands={RAB_OPERAND_r5900_vftxyzw, RAB_OPERAND_r5900_vis_predecr}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Load quadraword pre decrement
RABBITIZER_DEF_INSTR_ID(r5900, 0x37, vsqd,      .operands={RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vit_predecr}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Store quadraword pre decrement

RABBITIZER_DEF_INSTR_ID(r5900, 0x38, vdiv,      .operands={RAB_OPERAND_r5900_Q, RAB_OPERAND_r5900_vfsl, RAB_OPERAND_r5900_vftm})
RABBITIZER_DEF_INSTR_ID(r5900, 0x39, vsqrt,     .operands={RAB_OPERAND_r5900_Q, RAB_OPERAND_r5900_vftm})
RABBITIZER_DEF_INSTR_ID(r5900, 0x3A, vrsqrt,    .operands={RAB_OPERAND_r5900_Q, RAB_OPERAND_r5900_vfsl,RAB_OPERAND_r5900_vftm})

RABBITIZER_DEF_INSTR_ID(r5900, 0x3B, vwaitq,    .operands={0}) // Wait Q operation

RABBITIZER_DEF_INSTR_ID(r5900, 0x3C, vmtir,     .operands={RAB_OPERAND_r5900_vit, RAB_OPERAND_r5900_vfsl})

RABBITIZER_DEF_INSTR_ID(r5900, 0x3D, vmfir,     .operands={RAB_OPERAND_r5900_vftxyzw, RAB_OPERAND_r5900_vis}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Move from integer register

RABBITIZER_DEF_INSTR_ID(r5900, 0x3E, vilwr,     .operands={RAB_OPERAND_r5900_vit, RAB_OPERAND_r5900_vis}, .isFloat=true, .doesDereference=true, .doesLoad=true) // Integer load word register
RABBITIZER_DEF_INSTR_ID(r5900, 0x3F, viswr,     .operands={RAB_OPERAND_r5900_vit, RAB_OPERAND_r5900_vis}, .isFloat=true, .doesDereference=true, .doesStore=true) // Integer store word register
/*
"vilwr.w",		RAB_OPERAND_r5900_vit,(RAB_OPERAND_r5900_vis)
"vilwr.x",		RAB_OPERAND_r5900_vit,(RAB_OPERAND_r5900_vis)
"vilwr.y",		RAB_OPERAND_r5900_vit,(RAB_OPERAND_r5900_vis)
"vilwr.z",		RAB_OPERAND_r5900_vit,(RAB_OPERAND_r5900_vis)
"viswr.w",		RAB_OPERAND_r5900_vit,(RAB_OPERAND_r5900_vis)
"viswr.x",		RAB_OPERAND_r5900_vit,(RAB_OPERAND_r5900_vis)
"viswr.y",		RAB_OPERAND_r5900_vit,(RAB_OPERAND_r5900_vis)
"viswr.z",		RAB_OPERAND_r5900_vit,(RAB_OPERAND_r5900_vis)
*/

RABBITIZER_DEF_INSTR_ID(r5900, 0x40, vrnext,    .operands={RAB_OPERAND_r5900_vftxyzw, RAB_OPERAND_r5900_R}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // R next
RABBITIZER_DEF_INSTR_ID(r5900, 0x41, vrget,     .operands={RAB_OPERAND_r5900_vftxyzw, RAB_OPERAND_r5900_R}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // R move

// TODO
RABBITIZER_DEF_INSTR_ID(r5900, 0x42, vrinit,    .operands={RAB_OPERAND_r5900_R, RAB_OPERAND_r5900_vfsl})
RABBITIZER_DEF_INSTR_ID(r5900, 0x43, vrxor,     .operands={RAB_OPERAND_r5900_R, RAB_OPERAND_r5900_vfsl})
