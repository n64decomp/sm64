#include "libultra_internal.h"
#include "new_func.h"

void func_802F7140(u32 a0) {
    register u32 s0;
    s0 = __osDisableInt();
    D_8030208C &= ~(-0x402 & a0);
    __osRestoreInt(s0);
}
