/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

/*
    31---------26-25-----21-20-----------------------------5--------0
    |  =COP2   | Special1 |                                |function|
    ------6----------5------------------------------------------6----
    |--000--|--001--|--010--|--011--|--100--|--101--|--110--|--111--| lo
000 |VADDx  |VADDy  |VADDz  |VADDw  |VSUBx  |VSUBy  |VSUBz  |VSUBw  |
001 |VMADDx |VMADDy |VMADDz |VMADDw |VMSUBx |VMSUBy |VMSUBz |VMSUBw |
010 |VMAXx  |VMAXy  |VMAXz  |VMAXw  |VMINIx |VMINIy |VMINIz |VMINIw |
011 |VMULx  |VMULy  |VMULz  |VMULw  |VMULq  |VMAXi  |VMULi  |VMINIi |
100 |VADDq  |VMADDq |VADDi  |VMADDi |VSUBq  |VMSUBq |VSUbi  |VMSUBi |
101 |VADD   |VMADD  |VMUL   |VMAX   |VSUB   |VMSUB  |VOPMSUB|VMINI  |
110 |VIADD  |VISUB  |VIADDI |  ---  |VIAND  |VIOR   |  ---  |  ---  |
111 |VCALLMS|VCALLMSR| ---  |  ---  |  *1   |  *1   |  *1   |  *1   |
 hi |-------|-------|-------|-------|-------|-------|-------|-------|
    *1=see special2 table
*/

// TODO: properties

RABBITIZER_DEF_INSTR_ID(r5900, 0x00, vaddx,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // ADD broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x01, vaddy,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // ADD broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x02, vaddz,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // ADD broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x03, vaddw,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // ADD broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x04, vsubx,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // SUBtract broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x05, vsuby,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // SUBtract broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x06, vsubz,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // SUBtract broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x07, vsubw,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // SUBtract broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x08, vmaddx,    .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply-ADD broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x09, vmaddy,    .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply-ADD broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x0A, vmaddz,    .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply-ADD broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x0B, vmaddw,    .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply-ADD broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x0C, vmsubx,    .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply-SUBtract broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x0D, vmsuby,    .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply-SUBtract broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x0E, vmsubz,    .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply-SUBtract broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x0F, vmsubw,    .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply-SUBtract broadcast

RABBITIZER_DEF_INSTR_ID(r5900, 0x10, vmaxx,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // MAXimum broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x11, vmaxy,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // MAXimum broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x12, vmaxz,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // MAXimum broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x13, vmaxw,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // MAXimum broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x14, vminix,    .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // MINimum broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x15, vminiy,    .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // MINimum broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x16, vminiz,    .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // MINimum broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x17, vminiw,    .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // MINimum broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x18, vmulx,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // MULtiply broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x19, vmuly,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // MULtiply broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x1A, vmulz,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // MULtiply broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x1B, vmulw,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftn}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // MULtiply broadcast
RABBITIZER_DEF_INSTR_ID(r5900, 0x1C, vmulq,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_Q}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // MULtiply Q
RABBITIZER_DEF_INSTR_ID(r5900, 0x1D, vmaxi,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_I}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // MAXimum I
RABBITIZER_DEF_INSTR_ID(r5900, 0x1E, vmuli,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_I}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // MULtiply I
RABBITIZER_DEF_INSTR_ID(r5900, 0x1F, vminii,    .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_I}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // MINImum I

RABBITIZER_DEF_INSTR_ID(r5900, 0x20, vaddq,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_Q}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // ADD Q
RABBITIZER_DEF_INSTR_ID(r5900, 0x21, vmaddq,    .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_Q}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply-ADD Q
RABBITIZER_DEF_INSTR_ID(r5900, 0x22, vaddi,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_I}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // ADD I
RABBITIZER_DEF_INSTR_ID(r5900, 0x23, vmaddi,    .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_I}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply-ADD I
RABBITIZER_DEF_INSTR_ID(r5900, 0x24, vsubq,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_Q}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // SUBtract Q
RABBITIZER_DEF_INSTR_ID(r5900, 0x25, vmsubq,    .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_Q}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply-SUBtract Q
RABBITIZER_DEF_INSTR_ID(r5900, 0x26, vsubi,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_I}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // SUBtract I
RABBITIZER_DEF_INSTR_ID(r5900, 0x27, vmsubi,    .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_I}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply-SUBtract I
RABBITIZER_DEF_INSTR_ID(r5900, 0x28, vadd,      .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // ADD
RABBITIZER_DEF_INSTR_ID(r5900, 0x29, vmadd,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply-ADD
RABBITIZER_DEF_INSTR_ID(r5900, 0x2A, vmul,      .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // MULtiply
RABBITIZER_DEF_INSTR_ID(r5900, 0x2B, vmax,      .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // MAXimum
RABBITIZER_DEF_INSTR_ID(r5900, 0x2C, vsub,      .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // SUBtract
RABBITIZER_DEF_INSTR_ID(r5900, 0x2D, vmsub,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Multiply-SUBtract
RABBITIZER_DEF_INSTR_ID(r5900, 0x2E, vopmsub,   .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // Outer product post decrement
RABBITIZER_DEF_INSTR_ID(r5900, 0x2F, vmini,     .operands={RAB_OPERAND_r5900_vfdxyzw, RAB_OPERAND_r5900_vfsxyzw, RAB_OPERAND_r5900_vftxyzw}, .instrSuffix=RABINSTRSUFFIX_R5900_xyzw, .isFloat=true) // MINImum

RABBITIZER_DEF_INSTR_ID(r5900, 0x30, viadd,     .operands={RAB_OPERAND_r5900_vid, RAB_OPERAND_r5900_vis, RAB_OPERAND_r5900_vit}) // Integer ADD
RABBITIZER_DEF_INSTR_ID(r5900, 0x31, visub,     .operands={RAB_OPERAND_r5900_vid, RAB_OPERAND_r5900_vis, RAB_OPERAND_r5900_vit}) // Integer SUBtract
RABBITIZER_DEF_INSTR_ID(r5900, 0x32, viaddi,    .operands={RAB_OPERAND_r5900_vit, RAB_OPERAND_r5900_vis, RAB_OPERAND_r5900_immediate5}) // Integer ADD Immediate
RABBITIZER_DEF_INSTR_ID(r5900, 0x34, viand,     .operands={RAB_OPERAND_r5900_vid, RAB_OPERAND_r5900_vis, RAB_OPERAND_r5900_vit}) // Integer AND
RABBITIZER_DEF_INSTR_ID(r5900, 0x35, vior,      .operands={RAB_OPERAND_r5900_vid, RAB_OPERAND_r5900_vis, RAB_OPERAND_r5900_vit}) // Integer OR

// TODO: operands and properties
RABBITIZER_DEF_INSTR_ID(r5900, 0x38, vcallms,   .operands={0})
RABBITIZER_DEF_INSTR_ID(r5900, 0x39, vcallmsr,  .operands={RAB_OPERAND_r5900_vis})
