#include "libultra_internal.h"
#include "PR/rcp.h"

extern OSViContext *__osViNext;
extern OSViContext *__osViCurr;

extern u32 __additional_scanline;

void __osViSwapContext() {
    register OSViMode *viMode;
    register OSViContext *s1;
    u32 origin;
    u32 hStart;
#ifdef VERSION_CN
    u32 vStart;
#endif
    u32 sp34;
    u32 field;
    field = 0;
    s1 = __osViNext;
    viMode = s1->modep;
    field = IO_READ(VI_V_CURRENT_LINE_REG) & 1;
    origin = osVirtualToPhysical(s1->buffer) + viMode->fldRegs[field].origin;
    if (s1->unk00 & 2) {
        s1->unk20 |= viMode->comRegs.xScale & ~0xfff;
    } else {
        s1->unk20 = viMode->comRegs.xScale;
    }
    if (s1->unk00 & 4) {
        sp34 = (u32)(viMode->fldRegs[field].yScale & 0xfff);
        s1->unk2c = s1->unk24 * sp34;
        s1->unk2c |= viMode->fldRegs[field].yScale & ~0xfff;
    } else {
        s1->unk2c = viMode->fldRegs[field].yScale;
    }

#ifdef VERSION_CN
    vStart = viMode->fldRegs[field].vStart - (__additional_scanline << 0x10) + __additional_scanline;
#endif
    hStart = viMode->comRegs.hStart;

    if (s1->unk00 & 0x20) {
        hStart = 0;
    }
    if (s1->unk00 & 0x40) {
        s1->unk2c = 0;
        origin = osVirtualToPhysical(s1->buffer);
    }
    if (s1->unk00 & 0x80) {
        s1->unk2c = (s1->unk28 << 0x10) & 0x3ff0000;
        origin = osVirtualToPhysical(s1->buffer);
    }
    IO_WRITE(VI_ORIGIN_REG, origin);
    IO_WRITE(VI_WIDTH_REG, viMode->comRegs.width);
    IO_WRITE(VI_BURST_REG, viMode->comRegs.burst);
    IO_WRITE(VI_V_SYNC_REG, viMode->comRegs.vSync);
    IO_WRITE(VI_H_SYNC_REG, viMode->comRegs.hSync);
    IO_WRITE(VI_LEAP_REG, viMode->comRegs.leap);
    IO_WRITE(VI_H_START_REG, hStart);
#ifdef VERSION_CN
    IO_WRITE(VI_V_START_REG, vStart);
#else
    IO_WRITE(VI_V_START_REG, viMode->fldRegs[field].vStart);
#endif
    IO_WRITE(VI_V_BURST_REG, viMode->fldRegs[field].vBurst);
    IO_WRITE(VI_INTR_REG, viMode->fldRegs[field].vIntr);
    IO_WRITE(VI_X_SCALE_REG, s1->unk20);
    IO_WRITE(VI_Y_SCALE_REG, s1->unk2c);
    IO_WRITE(VI_CONTROL_REG, s1->features);
    __osViNext = __osViCurr;
    __osViCurr = s1;
    *__osViNext = *__osViCurr;
}
