#include "libultra_internal.h"
#include "PR/rcp.h"
#include "bstring.h"
#include "new_func.h"
#include "macros.h"
#include "piint.h"
#include "osint.h"

u8 leoDiskStack[OS_PIM_STACKSIZE]; // technically should have a OS_LEO_STACKSIZE or something..

static void __osLeoResume(void);
static void __osLeoAbnormalResume(void);

s32 __osLeoInterrupt(void) {
    u32 stat;
#ifdef VERSION_EU
    u32 pi_stat;
#else // VERSION_SH
    volatile u32 pi_stat;
#endif
    u32 bm_stat;
    __OSTranxInfo *info;
    __OSBlockInfo *blockInfo;

#ifdef VERSION_EU
    if (!osDDActive) {
        return 0;
    }
#else // VERSION_SH
    stat = 0;
#endif

    info = &__osDiskHandle->transferInfo;
    blockInfo = &info->block[info->blockNum];
    pi_stat = IO_READ(PI_STATUS_REG);
    if (pi_stat & PI_STATUS_DMA_BUSY) {
#ifdef VERSION_EU
        IO_WRITE(PI_STATUS_REG, PI_STATUS_RESET | PI_STATUS_CLR_INTR);
        WAIT_ON_LEO_IO_BUSY(pi_stat);
        stat = IO_READ(LEO_STATUS);
        if (stat & LEO_STATUS_MECHANIC_INTERRUPT) {
            WAIT_ON_LEO_IO_BUSY(pi_stat);
            IO_WRITE(LEO_BM_CTL, info->bmCtlShadow | LEO_BM_CTL_CLR_MECHANIC_INTR);
        }
        info->errStatus = LEO_ERROR_75;
        __osLeoAbnormalResume();
#else // VERSION_SH
        __OSGlobalIntMask = __OSGlobalIntMask & ~SR_IBIT4; //cartridge interrupt
        blockInfo->errStatus = LEO_ERROR_29;
        __osLeoResume();
#endif
        return 1;
    }
    WAIT_ON_LEO_IO_BUSY(pi_stat);
    stat = IO_READ(LEO_STATUS);
    if (stat & LEO_STATUS_MECHANIC_INTERRUPT) {
        WAIT_ON_LEO_IO_BUSY(pi_stat);
        IO_WRITE(LEO_BM_CTL, info->bmCtlShadow | LEO_BM_CTL_CLR_MECHANIC_INTR);
#ifdef VERSION_EU
        info->errStatus = LEO_ERROR_GOOD;
#else // VERSION_SH
        blockInfo->errStatus = LEO_ERROR_GOOD;
#endif
        return 0;
    }

#ifdef VERSION_SH
    if (info->cmdType == LEO_CMD_TYPE_2) {
        return 1;
    }
#endif

    if (stat & LEO_STATUS_BUFFER_MANAGER_ERROR) {
#ifdef VERSION_EU
        info->errStatus = LEO_ERROR_3;
        __osLeoAbnormalResume();
#else //VERSION_SH
        WAIT_ON_LEO_IO_BUSY(pi_stat);
        stat = IO_READ(LEO_STATUS);
        blockInfo->errStatus = LEO_ERROR_22;
        __osLeoResume();
        IO_WRITE(PI_STATUS_REG, PI_STATUS_CLR_INTR);
        __OSGlobalIntMask |= OS_IM_PI;
#endif
        return 1;
    }

    if (info->cmdType == LEO_CMD_TYPE_1) {
        if ((stat & LEO_STATUS_DATA_REQUEST) == 0) {
            if (info->sectorNum + 1 != info->transferMode * 85) {
#ifdef VERSION_EU
                info->errStatus = LEO_ERROR_6;
#else // VERSION_SH
                blockInfo->errStatus = LEO_ERROR_24;
#endif
                __osLeoAbnormalResume();
                return 1;
            }
            IO_WRITE(PI_STATUS_REG, PI_STATUS_CLR_INTR);
            __OSGlobalIntMask |= OS_IM_PI;
#ifdef VERSION_EU
            info->errStatus = LEO_ERROR_GOOD;
#else // VERSION_SH
            blockInfo->errStatus = LEO_ERROR_GOOD;
#endif
            __osLeoResume();
            return 1;
        }
        blockInfo->dramAddr = (void *) ((u32)blockInfo->dramAddr + blockInfo->sectorSize);
        info->sectorNum++;
        osEPiRawStartDma(__osDiskHandle, OS_WRITE, LEO_SECTOR_BUFF, blockInfo->dramAddr, blockInfo->sectorSize);
        return 1;
    }
    if (info->cmdType == LEO_CMD_TYPE_0) {
        if (info->transferMode == LEO_SECTOR_MODE) {
            if ((s32)blockInfo->C1ErrNum + 17 < info->sectorNum) {
#ifdef VERSION_EU
                info->errStatus = LEO_ERROR_GOOD;
#else // VERSION_SH
                blockInfo->errStatus = LEO_ERROR_GOOD;
#endif
                __osLeoAbnormalResume();
                return 1;
            }
            if ((stat & LEO_STATUS_DATA_REQUEST) == 0) {
#ifdef VERSION_EU
                info->errStatus = LEO_ERROR_17;
#else // VERSION_SH
                blockInfo->errStatus = LEO_ERROR_23;
#endif
                __osLeoAbnormalResume();
                return 1;
            }
        } else {
            blockInfo->dramAddr = (void *)((u32)blockInfo->dramAddr + blockInfo->sectorSize);
        }
        bm_stat = IO_READ(LEO_BM_STATUS);
        if ((bm_stat & LEO_BM_STATUS_C1SINGLE && bm_stat & LEO_BM_STATUS_C1DOUBLE) || bm_stat & LEO_BM_STATUS_MICRO) {
            if (blockInfo->C1ErrNum > 3) {
                if (info->transferMode != LEO_SECTOR_MODE || info->sectorNum > 0x52) {
#ifdef VERSION_EU
                info->errStatus = LEO_ERROR_17;
#else // VERSION_SH
                blockInfo->errStatus = LEO_ERROR_23;
#endif
                    __osLeoAbnormalResume();
                    return 1;
                }
            } else {
                s32 errNum = blockInfo->C1ErrNum;
                blockInfo->C1ErrSector[errNum] = info->sectorNum + 1;
            }
            blockInfo->C1ErrNum++;
        }

        if (stat & LEO_STATUS_C2_TRANSFER) {
            if (info->sectorNum != 87) {
#ifdef VERSION_EU
                info->errStatus = LEO_ERROR_6;
#else // VERSION_SH
                blockInfo->errStatus = LEO_ERROR_24;
#endif
                __osLeoAbnormalResume();
            }
            if (info->transferMode == LEO_TRACK_MODE && info->blockNum == 0) {
                info->blockNum = 1;
                info->sectorNum = -1;
                info->block[1].dramAddr = (void *)((u32)info->block[1].dramAddr - info->block[1].sectorSize);
#ifdef VERSION_SH
                blockInfo->errStatus = LEO_ERROR_22;
#endif
            } else {
                IO_WRITE(PI_STATUS_REG, PI_STATUS_CLR_INTR);
                __OSGlobalIntMask |= OS_IM_PI;
#ifdef VERSION_SH
                info->cmdType = LEO_CMD_TYPE_2;
                blockInfo->errStatus = LEO_ERROR_GOOD;
#endif
            }
            osEPiRawStartDma(__osDiskHandle, OS_READ, LEO_C2_BUFF, blockInfo->C2Addr, blockInfo->sectorSize * 4);
#ifdef VERSION_EU
            info->errStatus = LEO_ERROR_GOOD;
#endif
            return 1;
        }
        if (info->sectorNum == -1 && info->transferMode == LEO_TRACK_MODE && info->blockNum == 1) {
            __OSBlockInfo *bptr = &info->block[0];
            if (bptr->C1ErrNum == 0) {
                if (((u32 *)bptr->C2Addr)[0] | ((u32 *)bptr->C2Addr)[1] | ((u32 *)bptr->C2Addr)[2] | ((u32 *)bptr->C2Addr)[3]) {
#ifdef VERSION_EU
                info->errStatus = LEO_ERROR_6;
#else // VERSION_SH
                bptr->errStatus = LEO_ERROR_24;
#endif
                    __osLeoAbnormalResume();
                    return 1;
                }
            }
#ifdef VERSION_EU
                info->errStatus = LEO_ERROR_GOOD;
#else // VERSION_SH
                bptr->errStatus = LEO_ERROR_GOOD;
#endif
            __osLeoResume();
        }
        info->sectorNum++;
        if (stat & LEO_STATUS_DATA_REQUEST) {
            if (info->sectorNum > 0x54) {
#ifdef VERSION_EU
                info->errStatus = LEO_ERROR_6;
#else // VERSION_SH
                blockInfo->errStatus = LEO_ERROR_24;
#endif
                __osLeoAbnormalResume();
                return 1;
            }
            osEPiRawStartDma(__osDiskHandle, 0, LEO_SECTOR_BUFF, blockInfo->dramAddr, blockInfo->sectorSize);
#ifdef VERSION_EU
                info->errStatus = LEO_ERROR_GOOD;
#else // VERSION_SH
                blockInfo->errStatus = LEO_ERROR_GOOD;
#endif
            return 1;
        }
        if (info->sectorNum <= 0x54) {
#ifdef VERSION_EU
            info->errStatus = LEO_ERROR_6;
#else // VERSION_SH
            blockInfo->errStatus = LEO_ERROR_24;
#endif
            __osLeoAbnormalResume();
            return 1;
        }
        return 1;
    }
#ifdef VERSION_EU
    info->errStatus = LEO_ERROR_75;
#else // VERSION_SH
    blockInfo->errStatus = LEO_ERROR_4;
#endif

    __osLeoAbnormalResume();
    return 1;
}

static void __osLeoAbnormalResume(void) {
    __OSTranxInfo *info;
    u32 pi_stat;
    info = &__osDiskHandle->transferInfo;
    WAIT_ON_LEO_IO_BUSY(pi_stat);
    IO_WRITE(LEO_BM_CTL, info->bmCtlShadow | LEO_BM_CTL_RESET);
    WAIT_ON_LEO_IO_BUSY(pi_stat);
    IO_WRITE(LEO_BM_CTL, info->bmCtlShadow);
    __osLeoResume();
    IO_WRITE(PI_STATUS_REG, PI_STATUS_CLR_INTR);
    __OSGlobalIntMask |= OS_IM_PI;
}

static void __osLeoResume(void) {
    __OSEventState *es;
    OSMesgQueue *mq;
    s32 last;
    es = &__osEventStateTab[OS_EVENT_PI];
    mq = es->messageQueue;
    if (mq == NULL || MQ_IS_FULL(mq)) {
        return;
    }
    last = (mq->first + mq->validCount) % mq->msgCount;
    mq->msg[last] = es->message;
    mq->validCount++;
    if (mq->mtqueue->next != NULL) {
        __osEnqueueThread(&__osRunQueue, __osPopThread(&mq->mtqueue));
    }
}
