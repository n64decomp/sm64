#include "libultra_internal.h"
#include "osContInternal.h"
#include "PR/ique.h"
#include <macros.h>
#include "controller.h"

ALIGNED8 OSPifRam __osContPifRam;

extern u8 __osContLastCmd;
extern u8 __osMaxControllers;

void __osPackReadData(void);

s32 osContStartReadData(OSMesgQueue *mesg) {
#ifdef VERSION_CN
    s32 ret;
#else
    s32 ret = 0;
    s32 i;
#endif
    __osSiGetAccess();
    if (__osContLastCmd != CONT_CMD_READ_BUTTON) {
        __osPackReadData();
        ret = __osSiRawStartDma(OS_WRITE, __osContPifRam.ramarray);
        osRecvMesg(mesg, NULL, OS_MESG_BLOCK);
    }
#ifndef VERSION_CN
    for (i = 0; i < ARRAY_COUNT(__osContPifRam.ramarray) + 1; i++) {
        __osContPifRam.ramarray[i] = 0xff;
    }
    __osContPifRam.pifstatus = 0;
#endif

    ret = __osSiRawStartDma(OS_READ, __osContPifRam.ramarray);
#ifdef VERSION_CN
    __osContLastCmd = 0xfd;
#else
    __osContLastCmd = CONT_CMD_READ_BUTTON;
#endif
    __osSiRelAccess();
    return ret;
}

void osContGetReadData(OSContPad *pad) {
    u8 *cmdBufPtr;
    OSContPackedRead response;
    s32 i;
    cmdBufPtr = (u8 *) __osContPifRam.ramarray;
    for (i = 0; i < __osMaxControllers; i++, cmdBufPtr += sizeof(OSContPackedRead), pad++) {
        response = * (OSContPackedRead *) cmdBufPtr;
        pad->errnum = (response.rxLen & 0xc0) >> 4;
        if (pad->errnum == 0) {
            pad->button = response.button;
            pad->stick_x = response.rawStickX;
            pad->stick_y = response.rawStickY;
        }
    }
#ifdef VERSION_CN
    if (__osBbIsBb != 0 && __osBbHackFlags != 0) {
        OSContPad tmp;
        pad -= __osMaxControllers;
        tmp = *pad;
        *pad = pad[__osBbHackFlags];
        pad[__osBbHackFlags] = tmp;
    }
#endif
}

void __osPackReadData() {
    u8 *cmdBufPtr;
    OSContPackedRead request;
    s32 i;
    cmdBufPtr = (u8 *) __osContPifRam.ramarray;

#ifdef VERSION_CN
    for (i = 0; i < ARRAY_COUNT(__osContPifRam.ramarray); i++) {
#else
    for (i = 0; i < ARRAY_COUNT(__osContPifRam.ramarray) + 1; i++) {
#endif
        __osContPifRam.ramarray[i] = 0;
    }

    __osContPifRam.pifstatus = 1;
    request.padOrEnd = 255;
    request.txLen = 1;
    request.rxLen = 4;
    request.command = 1;
    request.button = 65535;
    request.rawStickX = -1;
    request.rawStickY = -1;
    for (i = 0; i < __osMaxControllers; i++) {
        * (OSContPackedRead *) cmdBufPtr = request;
        cmdBufPtr += sizeof(OSContPackedRead);
    }
    *cmdBufPtr = 254;
}
