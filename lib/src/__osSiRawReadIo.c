#include "libultra_internal.h"
#include "PR/rcp.h"

s32 __osSiRawReadIo(u32 devAddr, u32 *data) {
    if (__osSiDeviceBusy()) {
        return -1;
    }
    *data = IO_READ(devAddr);
    return 0;
}
