#include "libultra_internal.h"
#include "PR/R4300.h"
#include "piint.h"
#include "PR/rcp.h"
#include "PR/ique.h"
#include <macros.h>

typedef struct {
    u32 inst1;
    u32 inst2;
    u32 inst3;
    u32 inst4;
} __osExceptionVector;
extern __osExceptionVector __osExceptionPreamble;

#if defined(VERSION_EU) || defined(VERSION_SH) || defined(VERSION_CN)
extern u32 __osSetHWintrRoutine(OSHWIntr, s32 (*));
extern s32 __osLeoInterrupt(void);
#endif

u32 __osFinalrom; // maybe initialized?
u64 osClockRate = OS_CLOCK_RATE;

#if defined(VERSION_SH) || defined(VERSION_CN)
u32 osViClock = VI_NTSC_CLOCK;
#endif

u32 __osShutdown = 0; // used in __osException

#if defined(VERSION_EU) || defined(VERSION_SH) || defined(VERSION_CN)
u32 EU_D_80336C40;
u32 EU_D_80336C44;

u32 __OSGlobalIntMask = OS_IM_ALL;
u32 osDDActive = 0;
u8 EU_unusedZeroes[8] = { 0 };
#endif


#ifdef VERSION_CN

void __createSpeedParam(void) {
    __Dom1SpeedParam.type = DEVICE_TYPE_INIT;
    __Dom1SpeedParam.latency = IO_READ(PI_BSD_DOM1_LAT_REG);
    __Dom1SpeedParam.pulse = IO_READ(PI_BSD_DOM1_PWD_REG);
    __Dom1SpeedParam.pageSize = IO_READ(PI_BSD_DOM1_PGS_REG);
    __Dom1SpeedParam.relDuration = IO_READ(PI_BSD_DOM1_RLS_REG);

    __Dom2SpeedParam.type = DEVICE_TYPE_INIT;
    __Dom2SpeedParam.latency = IO_READ(PI_BSD_DOM2_LAT_REG);
    __Dom2SpeedParam.pulse = IO_READ(PI_BSD_DOM2_PWD_REG);
    __Dom2SpeedParam.pageSize = IO_READ(PI_BSD_DOM2_PGS_REG);
    __Dom2SpeedParam.relDuration = IO_READ(PI_BSD_DOM2_RLS_REG);
}
#endif

#ifdef VERSION_CN
void __osInitialize_common(void)
#else
void osInitialize(void)
#endif
{
    u32 pifdata;
#ifndef VERSION_CN
    u32 clock = 0;
#endif
#ifdef VERSION_CN
    u32 intrMask1, intrMask2;
#endif

#ifdef VERSION_EU
    u32 leoStatus;
    u32 status;
#endif

    UNUSED u32 ptr;

    __osFinalrom = TRUE;
    __osSetSR(__osGetSR() | SR_CU1);
    __osSetFpcCsr(FPCSR_FS | FPCSR_EV);
#ifdef VERSION_CN
    __osSetWatchLo(0x4900000);
    intrMask1 = IO_WRITE(MI_HW_INTR_MASK_REG, 0x22000);
    intrMask2 = IO_WRITE(MI_HW_INTR_MASK_REG, 0x11000);
    __osBbIsBb = (intrMask1 & 0x140) == 0x140 && (intrMask2 & 0x140) == 0 ? 1 : 0;
    if (__osBbIsBb != 0 && (IO_READ(PI_MISC_REG) & 0xC0000000) != 0) {
        __osBbIsBb = 2;
    }
    if (__osBbIsBb != 0) {
        osTvType = TV_TYPE_NTSC;
        osRomType = DEVICE_TYPE_CART;
        osResetType = RESET_TYPE_COLD_RESET;
        osVersion = 1;
        osMemSize = 4 * 1024 * 1024;
    }
    if (__osBbIsBb == 0) {
#endif
        while (__osSiRawReadIo(PIF_RAM_END - 3, &pifdata)) {
            ;
        }
        while (__osSiRawWriteIo(PIF_RAM_END - 3, pifdata | 8)) {
            ;
        }
#ifdef VERSION_CN
    }
#endif
    *(__osExceptionVector *) UT_VEC = __osExceptionPreamble;
    *(__osExceptionVector *) XUT_VEC = __osExceptionPreamble;
    *(__osExceptionVector *) ECC_VEC = __osExceptionPreamble;
    *(__osExceptionVector *) E_VEC = __osExceptionPreamble;
    osWritebackDCache((void *) UT_VEC, E_VEC - UT_VEC + sizeof(__osExceptionVector));
    osInvalICache((void *) UT_VEC, E_VEC - UT_VEC + sizeof(__osExceptionVector));
#ifdef VERSION_CN
    __createSpeedParam();
    osUnmapTLBAll();
#endif
    osMapTLBRdb();
#ifndef VERSION_CN
    osPiRawReadIo(4, &clock);
    clock &= ~0xf;
    if (clock) {
        osClockRate = clock;
    }
#endif
    osClockRate = osClockRate * 3 / 4;
    if (osResetType == RESET_TYPE_COLD_RESET) {
        bzero(osAppNmiBuffer, sizeof(osAppNmiBuffer));
    }
#if defined(VERSION_SH) || defined(VERSION_CN)
    if (osTvType == TV_TYPE_PAL) {
        osViClock = VI_PAL_CLOCK;
    } else if (osTvType == TV_TYPE_MPAL) {
        osViClock = VI_MPAL_CLOCK;
    } else {
        osViClock = VI_NTSC_CLOCK;
    }
#elif defined(VERSION_EU)
    WAIT_ON_IO_BUSY(status);

    if (!((leoStatus = IO_READ(LEO_STATUS)) & LEO_STATUS_PRESENCE_MASK)) {
        osDDActive = 1;
        __osSetHWIntrRoutine(1, __osLeoInterrupt);
    } else {
        osDDActive = 0;
    }
#endif

#ifdef VERSION_CN
    if (__osGetCause() & 0x1000) {
        while (TRUE) {
        }
    }
    if (__osBbIsBb == 0) {
        __osBbEepromSize = 0x200;
        __osBbPakSize = 0x8000;
        __osBbFlashSize = 0x20000;
        __osBbEepromAddress = (u8 *) 0x803FFE00;
        __osBbPakAddress[0] = (u32 *) 0x803F7E00;
        __osBbPakAddress[1] = NULL;
        __osBbPakAddress[2] = NULL;
        __osBbPakAddress[3] = NULL;
        __osBbFlashAddress = 0x803E0000;
        __osBbSramSize = __osBbFlashSize;
        __osBbSramAddress = __osBbFlashAddress;
    }
    if (__osBbIsBb != 0) {
        IO_WRITE(PI_BASE_REG+0x64, IO_READ(PI_BASE_REG+0x64) & 0x7FFFFFFF);
        IO_WRITE(MI_HW_INTR_MASK_REG, 0x20000);
        IO_WRITE(SI_BASE_REG+0x0C, 0); // a "reserved" register
        IO_WRITE(SI_BASE_REG+0x1C, (IO_READ(SI_BASE_REG+0x1C) & 0x80FFFFFF) | 0x2F400000);
    }

    IO_WRITE(AI_CONTROL_REG, 1);
    IO_WRITE(AI_DACRATE_REG, 0x3fff);
    IO_WRITE(AI_BITRATE_REG, 0xf);
#endif
}

#ifdef VERSION_CN
void __osInitialize_autodetect(void) {
}
#endif
