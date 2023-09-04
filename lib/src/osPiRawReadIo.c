#include "libultra_internal.h"
#include "PR/rcp.h"
#include "piint.h"

s32 osPiRawReadIo(u32 devAddr, u32 *data) {
    register u32 status;

    WAIT_ON_IO_BUSY(status);
    *data = IO_READ(osRomBase | devAddr);
    return 0;
}
