#include "macros.h"
#include "libultra_internal.h"

extern u32 __osBbEepromSize;

s32 __osEepStatus(OSMesgQueue *, OSContStatus *);
s32 osEepromProbe(UNUSED OSMesgQueue *mq) {
    s32 ret = 0;
#ifndef VERSION_CN
    OSContStatus status;
#endif

    __osSiGetAccess();
#ifdef VERSION_CN
    if (__osBbEepromSize == 0x200) {
        ret = EEPROM_TYPE_4K;
    } else if (__osBbEepromSize == 0x800) {
        ret = EEPROM_TYPE_16K;
    }
#else
    ret = __osEepStatus(mq, &status);
    ret = (ret == 0 && (status.type & CONT_EEPROM) != 0) ? EEPROM_TYPE_4K : 0;
#endif
    __osSiRelAccess();
    return ret;
}
