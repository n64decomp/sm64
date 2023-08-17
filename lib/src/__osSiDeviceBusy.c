#include "libultra_internal.h"
#include "PR/rcp.h"

s32 __osSiDeviceBusy() {
    register u32 status;
    status = IO_READ(SI_STATUS_REG);
    if (status & (SI_STATUS_DMA_BUSY | SI_STATUS_RD_BUSY)) {
        return 1;
    } else {
        return 0;
    }
}
