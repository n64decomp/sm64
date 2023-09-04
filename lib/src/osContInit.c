#include "libultra_internal.h"
#include "osContInternal.h"
#include "PR/os.h"
#include "controller.h"
#include "PR/ique.h"

void __osPackRequestData(u8);
void __osContGetInitData(u8 *, OSContStatus *);

u32 _osContInitialized = 0; // probably initialized

#ifdef VERSION_CN
#define CLOCK_RATE (62500000ULL * 3 / 4)
#else
#define CLOCK_RATE osClockRate
#endif

// these probably belong in EEPROMlongread or something
u8 __osContLastCmd;
u8 __osMaxControllers;
OSTimer __osEepromTimer;
OSMesgQueue __osEepromTimerQ;
OSMesg __osEepromTimerMsg[4];

s32 osContInit(OSMesgQueue *mq, u8 *bitpattern, OSContStatus *status) {
    OSMesg mesg;
    u32 ret = 0;
    OSTime currentTime;
    OSTimer timer;
    OSMesgQueue timerMesgQueue;

    if (_osContInitialized) {
        return 0;
    }
    _osContInitialized = 1;
    currentTime = osGetTime();
    if (500000 * CLOCK_RATE / 1000000 > currentTime) {
        osCreateMesgQueue(&timerMesgQueue, &mesg, 1);
        osSetTimer(&timer, 500000 * CLOCK_RATE / 1000000 - currentTime, 0, &timerMesgQueue, &mesg);
        osRecvMesg(&timerMesgQueue, &mesg, OS_MESG_BLOCK);
    }
    __osMaxControllers = MAXCONTROLLERS;
#if defined(VERSION_EU) || defined(VERSION_SH) || defined(VERSION_CN)
    __osPackRequestData(0);
#else
    __osPackRequestData(255);
#endif
    ret = __osSiRawStartDma(OS_WRITE, __osContPifRam.ramarray);
    osRecvMesg(mq, &mesg, OS_MESG_BLOCK);
    ret = __osSiRawStartDma(OS_READ, __osContPifRam.ramarray);
    osRecvMesg(mq, &mesg, OS_MESG_BLOCK);
    __osContGetInitData(bitpattern, status);
#if defined(VERSION_EU) || defined(VERSION_SH)
    __osContLastCmd = CONT_CMD_REQUEST_STATUS;
#elif defined(VERSION_CN)
    __osContLastCmd = 0xfd;
#else
    __osContLastCmd = CONT_CMD_RESET;
#endif
    __osSiCreateAccessQueue();
    osCreateMesgQueue(&__osEepromTimerQ, __osEepromTimerMsg, 1);
    return ret;
}

void __osContGetInitData(u8 *bitpattern, OSContStatus *status) {
    u8 *cmdBufPtr;
    OSContPackedRequest response;
    s32 i;
    u8 sp7;

    sp7 = 0;
    cmdBufPtr = (u8 *) __osContPifRam.ramarray;
    for (i = 0; i < __osMaxControllers; i++, cmdBufPtr += sizeof(OSContPackedRequest), status++) {
        response = *(OSContPackedRequest *) cmdBufPtr;
        status->errnum = (response.rxLen & 0xc0) >> 4;
        if (status->errnum == 0) {
            status->type = response.data2 << 8 | response.data1;
#ifdef VERSION_CN
            status->status = __osBbPakAddress[i] != NULL ? 1 : 0;
#else
            status->status = response.data3;
#endif

            sp7 |= 1 << i;
        }
    }
#ifdef VERSION_CN
    if (__osBbIsBb != 0 && __osBbHackFlags != 0) {
        OSContStatus tmp;
        status -= __osMaxControllers;
        sp7 = (sp7 & ~((1 << __osBbHackFlags) | 1)) |
                ((sp7 & 1) << __osBbHackFlags) |
                ((sp7 & (1 << __osBbHackFlags)) >> __osBbHackFlags);
        tmp = *status;
        *status = status[__osBbHackFlags];
        status[__osBbHackFlags] = tmp;
    }
#endif
    *bitpattern = sp7;
}

void __osPackRequestData(u8 command) {
    u8 *cmdBufPtr;
    OSContPackedRequest request;
    s32 i;

#ifdef VERSION_CN
    for (i = 0; i < ARRAY_COUNT(__osContPifRam.ramarray); i++) {
#else
    for (i = 0; i < ARRAY_COUNT(__osContPifRam.ramarray) + 1; i++) {
#endif
        __osContPifRam.ramarray[i] = 0;
    }

    __osContPifRam.pifstatus = 1;
    cmdBufPtr = (u8 *) __osContPifRam.ramarray;
    request.padOrEnd = 255;
    request.txLen = 1;
    request.rxLen = 3;
    request.command = command;
    request.data1 = 255;
    request.data2 = 255;
    request.data3 = 255;
    request.data4 = 255;

    for (i = 0; i < __osMaxControllers; i++) {
        * (OSContPackedRequest *) cmdBufPtr = request;
        cmdBufPtr += sizeof(OSContPackedRequest);
    }
    *cmdBufPtr = 254;
}
