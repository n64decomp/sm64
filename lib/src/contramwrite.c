#include "libultra_internal.h"
#include "PR/rcp.h"
#include "controller.h"
#include "macros.h"

extern s32 __osPfsGetStatus(OSMesgQueue *, s32);
void __osPackRamWriteData(s32 channel, u16 address, u8 *buffer);

s32 __osContRamWrite(OSMesgQueue *mq, s32 channel, u16 address, u8 *buffer, s32 force) {
    s32 ret;
    s32 i;
    u8 *ptr;
    __OSContRamReadFormat ramreadformat;
    s32 retry;

    ret = 0;
    ptr = (u8 *)&__osPfsPifRam;
    retry = 2;
    if (force != 1 && address < 7 && address != 0) {
        return 0;
    }
    __osSiGetAccess();
    __osContLastCmd = CONT_CMD_WRITE_MEMPACK;
    __osPackRamWriteData(channel, address, buffer);
    ret = __osSiRawStartDma(OS_WRITE, &__osPfsPifRam);
    osRecvMesg(mq, NULL, OS_MESG_BLOCK);
    do {
        ret = __osSiRawStartDma(OS_READ, &__osPfsPifRam);
        osRecvMesg(mq, NULL, OS_MESG_BLOCK);
        ptr = (u8 *)&__osPfsPifRam;
        if (channel != 0) {
            for (i = 0; i < channel; i++) {
                ptr++;
            }
        }

        ramreadformat = *(__OSContRamReadFormat *)ptr;

        ret = CHNL_ERR(ramreadformat);
        if (ret == 0) {
            if (__osContDataCrc(buffer) != ramreadformat.datacrc) {
                ret = __osPfsGetStatus(mq, channel);
                if (ret != 0) {
                    __osSiRelAccess();
                    return ret;
                }
                ret = PFS_ERR_CONTRFAIL;
            }
        } else {
            ret = PFS_ERR_NOPACK;
        }
        if (ret != PFS_ERR_CONTRFAIL) {
            break;
        }
    } while ((retry-- >= 0));
    __osSiRelAccess();
    return ret;
}

void __osPackRamWriteData(int channel, u16 address, u8 *buffer) {
    u8 *ptr;
    __OSContRamReadFormat ramreadformat;
    int i;

    ptr = (u8 *)__osPfsPifRam.ramarray;

    for (i = 0; i < ARRAY_COUNT(__osPfsPifRam.ramarray) + 1; i++) {
        __osPfsPifRam.ramarray[i] = 0;
    }

    __osPfsPifRam.pifstatus = CONT_CMD_EXE;
    ramreadformat.dummy = CONT_CMD_NOP;
    ramreadformat.txsize = CONT_CMD_WRITE_MEMPACK_TX;
    ramreadformat.rxsize = CONT_CMD_WRITE_MEMPACK_RX;
    ramreadformat.cmd = CONT_CMD_WRITE_MEMPACK;
    ramreadformat.address = (address << 0x5) | __osContAddressCrc(address);
    ramreadformat.datacrc = CONT_CMD_NOP;
    for (i = 0; i < ARRAY_COUNT(ramreadformat.data); i++) {
        ramreadformat.data[i] = *buffer++;
    }
    if (channel != 0) {
        for (i = 0; i < channel; i++) {
            *ptr++ = 0;
        }
    }
    *(__OSContRamReadFormat *)ptr = ramreadformat;
    ptr += sizeof(__OSContRamReadFormat);
    ptr[0] = CONT_CMD_END;
}
