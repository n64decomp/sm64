#include "libultra_internal.h"
#include "controller.h"

s32 osEepromLongRead(OSMesgQueue *mq, u8 address, u8 *buffer, s32 nbytes) {
    s32 status = 0;

#ifndef VERSION_CN
    if (address > 0x40) {
        return -1;
    }
#endif

    while (nbytes > 0) {
        status = osEepromRead(mq, address, buffer);
        if (status != 0) {
            return status;
        }

        nbytes -= EEPROM_BLOCK_SIZE;
        address++;
        buffer += EEPROM_BLOCK_SIZE;
#ifndef VERSION_CN
        osSetTimer(&__osEepromTimer, 12000 * osClockRate / 1000000, 0, &__osEepromTimerQ, __osEepromTimerMsg);
        osRecvMesg(&__osEepromTimerQ, NULL, OS_MESG_BLOCK);
#endif
    }

    return status;
}
