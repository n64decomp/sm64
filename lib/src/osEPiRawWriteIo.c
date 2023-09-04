#include "libultra_internal.h"
#include "PR/rcp.h"
#include "piint.h"

s32 osEPiRawWriteIo(OSPiHandle *pihandle, u32 devAddr, u32 data) {
    register u32 stat;
#ifdef VERSION_CN
    u32 domain;
#endif

#ifdef VERSION_CN
    EPI_SYNC(pihandle, stat, domain);
#else
    WAIT_ON_IO_BUSY(stat);
#endif

    IO_WRITE(pihandle->baseAddress | devAddr, data);

    return 0;
}
