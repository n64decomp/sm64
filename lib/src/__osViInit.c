#include "libultra_internal.h"
#include "PR/rcp.h"
#include "PR/os.h"

OSViContext sViContexts[2] = { 0 };
OSViContext *__osViCurr = &sViContexts[0];
OSViContext *__osViNext = &sViContexts[1];

#ifdef VERSION_EU
u32 osViClock = VI_NTSC_CLOCK;
u32 sTvType = TV_TYPE_PAL;
#elif !defined(VERSION_SH) && !defined(VERSION_CN)
u32 sTvType = TV_TYPE_NTSC;
u32 osViClock = VI_NTSC_CLOCK;
#endif

extern OSViMode osViModePalLan1;
extern OSViMode osViModeMpalLan1;
#if defined(VERSION_EU) || defined(VERSION_SH) || defined(VERSION_CN)
extern OSViMode osViModeNtscLan1;
#endif

void __osViInit(void) {
#ifdef VERSION_US
    sTvType = osTvType;
#endif

    bzero(sViContexts, sizeof(sViContexts));
    __osViCurr = &sViContexts[0];
    __osViNext = &sViContexts[1];
    __osViNext->retraceCount = 1;
    __osViCurr->retraceCount = 1;

#if defined(VERSION_JP)
    if (sTvType != TV_TYPE_PAL) {
        __osViNext->modep = &osViModePalLan1;
        osViClock = VI_NTSC_CLOCK;
    } else {
        __osViNext->modep = &osViModeMpalLan1;
        osViClock = VI_PAL_CLOCK;
    }
#elif defined(VERSION_US)
    if (sTvType == TV_TYPE_NTSC) {
        __osViNext->modep = &osViModePalLan1;
        osViClock = VI_NTSC_CLOCK;
    } else {
        __osViNext->modep = &osViModeMpalLan1;
        osViClock = VI_MPAL_CLOCK;
    }
#elif defined(VERSION_EU)
    if (osTvType == TV_TYPE_PAL) {
        __osViNext->modep = &osViModePalLan1;
        osViClock = VI_PAL_CLOCK;
    } else if (osTvType == TV_TYPE_MPAL) {
        __osViNext->modep = &osViModeMpalLan1;
        osViClock = VI_MPAL_CLOCK;
    } else {
        __osViNext->modep = &osViModeNtscLan1;
        osViClock = VI_NTSC_CLOCK;
    }
#else
    __osViNext->buffer = (void *) 0x80000000;
    __osViCurr->buffer = (void *) 0x80000000;
    if (osTvType == TV_TYPE_PAL) {
        __osViNext->modep = &osViModePalLan1;
    } else if (osTvType == TV_TYPE_MPAL) {
        __osViNext->modep = &osViModeMpalLan1;
    } else {
        __osViNext->modep = &osViModeNtscLan1;
    }

#endif

    __osViNext->unk00 = VI_STATE_BLACK;
    __osViNext->features = __osViNext->modep->comRegs.ctrl;

#ifndef VERSION_JP
    while (IO_READ(VI_CURRENT_REG) > 10) {
        ;
    }
    IO_WRITE(VI_STATUS_REG, 0);
#endif
    __osViSwapContext();
}
