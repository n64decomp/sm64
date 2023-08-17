#include "libultra_internal.h"
#include "PR/rcp.h"
#include "piint.h"

s32 osEPiRawReadIo(OSPiHandle *pihandle, u32 devAddr, u32 *data) {
    register s32 stat;
#ifdef VERSION_CN
    u32 domain;
#endif

#ifdef VERSION_CN
    EPI_SYNC(pihandle, stat, domain);
#else
    WAIT_ON_IO_BUSY(stat);
#endif

    *data = IO_READ(pihandle->baseAddress | devAddr);

    return 0;
}
