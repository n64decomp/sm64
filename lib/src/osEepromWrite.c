#include "libultra_internal.h"
#include "osContInternal.h"
#include "PR/ique.h"
#include "controller.h"
#include "macros.h"

#ifdef VERSION_CN

s32 osEepromWrite(UNUSED OSMesgQueue *mq, u8 address, u8 *buffer) {
    s32 ret = 0;
    s32 i;

    __osSiGetAccess();

    if (__osBbEepromSize == 0x200) {
        if (address >= 0x200 / 8) {
            ret = -1;
        }
    } else if (__osBbEepromSize != 0x800) {
        ret = 8;
    }

    if (ret == 0) {
        for (i = 0; i < 8; i++) {
            (__osBbEepromAddress + address * 8)[i] = buffer[i];
        }
    }

    __osSiRelAccess();
    return ret;
}

#else

OSPifRam __osEepPifRam;

void __osPackEepWriteData(u8, u8 *);

s32 osEepromWrite(OSMesgQueue *mq, u8 address, u8 *buffer) {
    s32 ret = 0;
    s32 i;
    u8 *ptr = (u8 *) &__osEepPifRam.ramarray;
    __OSContEepromFormat eepromformat;
    OSContStatus sdata;

    if (address > EEPROM_MAXBLOCKS) {
        return -1;
    }

    __osSiGetAccess();
    ret = __osEepStatus(mq, &sdata);

    if (ret != 0 || sdata.type != CONT_EEPROM) {
        return CONT_NO_RESPONSE_ERROR;
    }

    while (sdata.status & CONT_EEPROM_BUSY) {
        __osEepStatus(mq, &sdata);
    }

    __osPackEepWriteData(address, buffer);

    ret = __osSiRawStartDma(OS_WRITE, &__osEepPifRam);
    osRecvMesg(mq, NULL, OS_MESG_BLOCK);

    for (i = 0; i < ARRAY_COUNT(__osEepPifRam.ramarray) + 1; i++) {
        __osEepPifRam.ramarray[i] = CONT_CMD_NOP;
    }

    __osEepPifRam.pifstatus = 0;
    ret = __osSiRawStartDma(OS_READ, &__osEepPifRam);
    __osContLastCmd = CONT_CMD_WRITE_EEPROM;
    osRecvMesg(mq, NULL, OS_MESG_BLOCK);

    for (i = 0; i < 4; i++) {
        ptr++;
    }

    eepromformat = *(__OSContEepromFormat *) ptr;
    ret = CHNL_ERR(eepromformat);
    __osSiRelAccess();
    return ret;
}

void __osPackEepWriteData(u8 address, u8 *buffer) {
    u8 *ptr = (u8 *) &__osEepPifRam.ramarray;
    __OSContEepromFormat eepromformat;
    s32 i;

    for (i = 0; i < ARRAY_COUNT(__osEepPifRam.ramarray) + 1; i++) {
        __osEepPifRam.ramarray[i] = CONT_CMD_NOP;
    }
    __osEepPifRam.pifstatus = CONT_CMD_EXE;

    eepromformat.txsize = CONT_CMD_WRITE_EEPROM_TX;
    eepromformat.rxsize = CONT_CMD_WRITE_EEPROM_RX;
    eepromformat.cmd = CONT_CMD_WRITE_EEPROM;
    eepromformat.address = address;

    for (i = 0; i < ARRAY_COUNT(eepromformat.data); i++) {
        eepromformat.data[i] = *buffer++;
    }

    for (i = 0; i < 4; i++) {
        *ptr++ = 0;
    }
    *(__OSContEepromFormat *) ptr = eepromformat;
    ptr += sizeof(__OSContEepromFormat);
    *ptr = CONT_CMD_END;
}

s32 __osEepStatus(OSMesgQueue *mq, OSContStatus *data) {
    u32 ret = 0;
    s32 i;
    u8 *ptr = (u8 *) __osEepPifRam.ramarray;
    __OSContRequesFormat requestformat;

    for (i = 0; i < ARRAY_COUNT(__osEepPifRam.ramarray) + 1; i++) {
        __osEepPifRam.ramarray[i] = 0;
    }
    __osEepPifRam.pifstatus = CONT_CMD_EXE;

    ptr = (u8 *) __osEepPifRam.ramarray;
    for (i = 0; i < 4; i++) {
        *ptr++ = 0;
    }

    requestformat.dummy = CONT_CMD_NOP;
    requestformat.txsize = CONT_CMD_REQUEST_STATUS_TX;
    requestformat.rxsize = CONT_CMD_REQUEST_STATUS_RX;
    requestformat.cmd = CONT_CMD_REQUEST_STATUS;
    requestformat.typeh = CONT_CMD_NOP;
    requestformat.typel = CONT_CMD_NOP;
    requestformat.status = CONT_CMD_NOP;
    requestformat.dummy1 = CONT_CMD_NOP;
    *(__OSContRequesFormat *) ptr = requestformat;

    ptr += sizeof(__OSContRequesFormat);
    *ptr = CONT_CMD_END;

    ret = __osSiRawStartDma(OS_WRITE, &__osEepPifRam);
    osRecvMesg(mq, NULL, OS_MESG_BLOCK);

    __osContLastCmd = CONT_CMD_WRITE_EEPROM;

    ret = __osSiRawStartDma(OS_READ, &__osEepPifRam);
    osRecvMesg(mq, NULL, OS_MESG_BLOCK);

    if (ret != 0) {
        return ret;
    }

    ptr = (u8 *) __osEepPifRam.ramarray;
    for (i = 0; i < 4; i++) {
        *ptr++ = 0;
    }

    requestformat = *(__OSContRequesFormat *) ptr;
    data->errnum = CHNL_ERR(requestformat);
    data->type = (requestformat.typel << 8) | requestformat.typeh;
    data->status = requestformat.status;
    if (data->errnum != 0) {
        return data->errnum;
    }
    return 0;
}

#endif
