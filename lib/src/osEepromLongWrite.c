#include "libultra_internal.h"
#include "controller.h"

#ifdef VERSION_CN
#define CLOCK_RATE (62500000ULL * 3 / 4)
#else
#define CLOCK_RATE osClockRate
#endif

s32 osEepromLongWrite(OSMesgQueue *mq, u8 address, u8 *buffer, int nbytes) {
    s32 result = 0;
#ifndef VERSION_CN
    if (address > 0x40) {
        return -1;
    }
#endif

    while (nbytes > 0) {
        result = osEepromWrite(mq, address, buffer);
        if (result != 0) {
            return result;
        }

        nbytes -= EEPROM_BLOCK_SIZE;
        address++;
        buffer += EEPROM_BLOCK_SIZE;
        osSetTimer(&__osEepromTimer, 12000 * CLOCK_RATE / 1000000, 0, &__osEepromTimerQ, __osEepromTimerMsg);
        osRecvMesg(&__osEepromTimerQ, NULL, OS_MESG_BLOCK);
    }

    return result;
}
