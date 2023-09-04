#include "libultra_internal.h"
#include "PR/rcp.h"
#include "PR/os.h"

OSPiHandle __Dom2SpeedParam;
OSPiHandle *__osDiskHandle;

OSPiHandle *osLeoDiskInit(void) {
    s32 saveMask;

    __Dom2SpeedParam.type = DEVICE_TYPE_64DD;
    __Dom2SpeedParam.baseAddress = PHYS_TO_K1(PI_DOM2_ADDR1);
    __Dom2SpeedParam.latency = 3;
    __Dom2SpeedParam.pulse = 6;
    __Dom2SpeedParam.pageSize = 6;
    __Dom2SpeedParam.relDuration = 2;
#ifdef VERSION_SH
    __Dom2SpeedParam.domain = 1;
#endif
    IO_WRITE(PI_BSD_DOM2_LAT_REG, __Dom2SpeedParam.latency);
    IO_WRITE(PI_BSD_DOM2_PWD_REG, __Dom2SpeedParam.pulse);
    IO_WRITE(PI_BSD_DOM2_PGS_REG, __Dom2SpeedParam.pageSize);
    IO_WRITE(PI_BSD_DOM2_RLS_REG, __Dom2SpeedParam.relDuration);
    bzero(&__Dom2SpeedParam.transferInfo, sizeof(__OSTranxInfo));
    saveMask = __osDisableInt();
    __Dom2SpeedParam.next = __osPiTable;
    __osPiTable = &__Dom2SpeedParam;
    __osDiskHandle = &__Dom2SpeedParam;
    __osRestoreInt(saveMask);
    return &__Dom2SpeedParam;
}
