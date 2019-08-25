#include "libultra_internal.h"

u32 osVirtualToPhysical(void *addr) {
    if ((u32) addr >= 0x80000000 && (u32) addr < 0xa0000000) {
        return ((u32) addr & 0x1fffffff);
    }

    else if ((u32) addr >= 0xa0000000 && (u32) addr < 0xc0000000) {
        return ((u32) addr & 0x1fffffff);
    } else {
        return __osProbeTLB(addr);
    }
}
