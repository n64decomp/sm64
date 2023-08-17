#include "libultra_internal.h"
#include "PR/rcp.h"

void __osSpSetStatus(u32 status) {
    IO_WRITE(SP_STATUS_REG, status);
}
