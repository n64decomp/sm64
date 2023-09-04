#include "libultra_internal.h"
#include "PR/rcp.h"

s32 __osSpSetPc(void *pc) {
    register u32 status = IO_READ(SP_STATUS_REG);
    if (!(status & SPSTATUS_HALT)) {
        return -1;
    } else {
        IO_WRITE(SP_PC_REG, pc);
        return 0;
    }
}
