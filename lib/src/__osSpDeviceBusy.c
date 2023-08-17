#include "libultra_internal.h"
#include "PR/rcp.h"

s32 __osSpDeviceBusy() {
    register u32 status = IO_READ(SP_STATUS_REG);

    if (status & (SPSTATUS_IO_FULL | SPSTATUS_DMA_FULL | SPSTATUS_DMA_BUSY)) {
        return 1;
    }

    return 0;
}
