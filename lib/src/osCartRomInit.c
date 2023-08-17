#include "PR/os_internal.h"
#include "PR/R4300.h"
#include "PR/rcp.h"
#include "PR/os_pi.h"
#include "PR/os.h"
#include "libultra_internal.h"
#include "piint.h"

OSPiHandle __Dom1SpeedParam;

#ifdef VERSION_CN

OSPiHandle __CartRomHandle;

OSPiHandle* osCartRomInit(void) {
    register u32 a;
    register s32 status;
    register u32 prevInt;
    register u32 lastLatency;
    register u32 lastPageSize;
    register u32 lastRelDuration;
    register u32 lastPulse;

    static u32 notInitialized = 1;

    __osPiGetAccess();

    if (!notInitialized) {
        __osPiRelAccess();
        return &__CartRomHandle;
    }

    notInitialized = 0;
    __CartRomHandle.type = DEVICE_TYPE_CART;
    __CartRomHandle.baseAddress = PHYS_TO_K1(PI_DOM1_ADDR2);
    __CartRomHandle.domain = 0;
    __CartRomHandle.speed = 0;
    bzero(&__CartRomHandle.transferInfo, sizeof(__OSTranxInfo));

    WAIT_ON_IO_BUSY(status);

    lastLatency = IO_READ(PI_BSD_DOM1_LAT_REG);
    lastPageSize = IO_READ(PI_BSD_DOM1_PGS_REG);
    lastRelDuration = IO_READ(PI_BSD_DOM1_RLS_REG);
    lastPulse = IO_READ(PI_BSD_DOM1_PWD_REG);

    IO_WRITE(PI_BSD_DOM1_LAT_REG, 0xff);
    IO_WRITE(PI_BSD_DOM1_PGS_REG, 0);
    IO_WRITE(PI_BSD_DOM1_RLS_REG, 3);
    IO_WRITE(PI_BSD_DOM1_PWD_REG, 0xff);

    a = IO_READ(__CartRomHandle.baseAddress);
    __CartRomHandle.latency = a & 0xFF;
    __CartRomHandle.pageSize = (a >> 0x10) & 0xF;
    __CartRomHandle.relDuration = (a >> 0x14) & 0xF;
    __CartRomHandle.pulse = (a >> 8) & 0xFF;

    IO_WRITE(PI_BSD_DOM1_LAT_REG, lastLatency);
    IO_WRITE(PI_BSD_DOM1_PGS_REG, lastPageSize);
    IO_WRITE(PI_BSD_DOM1_RLS_REG, lastRelDuration);
    IO_WRITE(PI_BSD_DOM1_PWD_REG, lastPulse);

    prevInt = __osDisableInt();
    __CartRomHandle.next = __osPiTable;
    __osPiTable = &__CartRomHandle;
    __osRestoreInt(prevInt);
    __osPiRelAccess();

    return &__CartRomHandle;
}

#else

OSPiHandle *osCartRomInit(void) {
    u32 domain;
    u32 saveMask;

    domain = 0;

    if (__Dom1SpeedParam.baseAddress == PHYS_TO_K1(PI_DOM1_ADDR2)) {
        return &__Dom1SpeedParam;
    }

    __Dom1SpeedParam.type = DEVICE_TYPE_CART;
    __Dom1SpeedParam.baseAddress = PHYS_TO_K1(PI_DOM1_ADDR2);
    osPiRawReadIo(0, &domain);
    __Dom1SpeedParam.latency = domain & 0xff;
    __Dom1SpeedParam.pulse = (domain >> 8) & 0xff;
    __Dom1SpeedParam.pageSize = (domain >> 0x10) & 0xf;
    __Dom1SpeedParam.relDuration = (domain >> 0x14) & 0xf;
    __Dom1SpeedParam.domain = PI_DOMAIN1;
    //__Dom1SpeedParam.speed = 0;

    bzero(&__Dom1SpeedParam.transferInfo, sizeof(__OSTranxInfo));

    saveMask = __osDisableInt();
    __Dom1SpeedParam.next = __osPiTable;
    __osPiTable = &__Dom1SpeedParam;
    __osRestoreInt(saveMask);

    return &__Dom1SpeedParam;
}

#endif
