#include "libultra_internal.h"
#include "controller.h"

s32 __osPfsGetStatus(OSMesgQueue *queue, s32 channel) {
    s32 ret = 0;
    OSMesg dummy;
    u8 pattern;
    OSContStatus data[4];

    __osPfsRequestData(CONT_CMD_REQUEST_STATUS);
    ret = __osSiRawStartDma(OS_WRITE, &__osPfsPifRam);
    osRecvMesg(queue, &dummy, OS_MESG_BLOCK);
    ret = __osSiRawStartDma(OS_READ, &__osPfsPifRam);
    osRecvMesg(queue, &dummy, OS_MESG_BLOCK);
    __osPfsGetInitData(&pattern, data);
    if (data[channel].status & CONT_CARD_ON && data[channel].status & CONT_CARD_PULL) {
        return PFS_ERR_NEW_PACK;
    }
    if (data[channel].errnum || !(data[channel].status & CONT_CARD_ON)) {
        return PFS_ERR_NOPACK;
    }
    if (data[channel].status & CONT_ADDR_CRC_ER) {
        return PFS_ERR_CONTRFAIL;
    }
    return ret;
}
