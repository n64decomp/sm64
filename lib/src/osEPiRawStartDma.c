#include "libultra_internal.h"
#include "PR/rcp.h"
#include "PR/ique.h"
#include "new_func.h"
#include "PR/R4300.h"
#include "piint.h"

// TODO: This define is from os.h, but including that causes problems...
#define PI_DOMAIN1 0

#if defined(VERSION_SH) || defined(VERSION_CN)
extern OSPiHandle *__osCurrentHandle[2];
#endif

s32 osEPiRawStartDma(OSPiHandle *pihandle, s32 dir, u32 devAddr, void *dram_addr, u32 size) {
#ifdef VERSION_CN
    u64 dummyBuf[2];
    u32 status;
    u32 domain;
    u32 buf;
    u32 mask;
    u16 *tmp;
    u32 i;
    u32 end;
#elif defined(VERSION_SH)
    u32 status;
    u32 domain;
#else
    register u32 status;
#endif

#if defined(VERSION_SH) || defined(VERSION_CN)
    EPI_SYNC(pihandle, status, domain);
#else
    WAIT_ON_IO_BUSY(status);
#endif

#ifdef VERSION_CN
    if (dir == OS_READ) {
        mask = 1;

        for (i = 1; i <= pihandle->pageSize + 2; i++) {
            mask *= 2;
        }

        if ((devAddr & (mask - 1)) == mask - 2) {
            osEPiRawReadIo(pihandle, devAddr - 2, &buf);

            tmp = (u16 *) PHYS_TO_K1(dram_addr);
            *(tmp++) = (u16) buf;

            devAddr += 2;
            dram_addr = tmp;
            size -= 2;

            if (size >= 4) {
                osEPiRawReadIo(pihandle, devAddr, &buf);

                tmp = (u16 *) dram_addr;
                *(tmp++) = buf >> 16;
                *(tmp++) = (u16) buf;

                devAddr += 4;
                dram_addr = tmp;
                size -= 4;

                if (size != 0) {
                    osEPiRawReadIo(pihandle, devAddr, &buf);

                    tmp = (u16 *) PHYS_TO_K1(dram_addr);
                    *(tmp++) = buf >> 16;

                    devAddr += 2;
                    dram_addr = tmp;
                    size -= 2;
                }
            }
        }

        end = devAddr + size;

        if (((end & (mask - 1)) == 2) | (size == 2)) {
            if (end & 2) {
                osEPiRawReadIo(pihandle, end - 2, &buf);
                tmp = (u16 *) PHYS_TO_K1(dram_addr) + (size - 2) / 2;
                *tmp = buf >> 16;
            } else {
                osEPiRawReadIo(pihandle, end - 4, &buf);
                tmp = (u16 *) PHYS_TO_K1(dram_addr) + (size - 2) / 2;
                *tmp = (u16) buf;
            }

            size -= 2;
        }

        if (size == 0) {
            size = 8;
            dram_addr = dummyBuf;
            devAddr = 0;
        }
    }
#endif

    IO_WRITE(PI_DRAM_ADDR_REG, osVirtualToPhysical(dram_addr));
    IO_WRITE(PI_CART_ADDR_REG, K1_TO_PHYS(pihandle->baseAddress | devAddr));

#ifdef VERSION_CN
    if ((u32) dir >= 2U) {
        return -1;
    }

    if ((pihandle->baseAddress | devAddr) <= 0x400) {
        IO_WRITE(dir == OS_READ ? PI_EX_WR_LEN_REG : PI_EX_RD_LEN_REG, size - 1);
    } else {
        IO_WRITE(dir == OS_READ ? PI_WR_LEN_REG : PI_RD_LEN_REG, size - 1);
    }
#else
    switch (dir) {
        case OS_READ:
            IO_WRITE(PI_WR_LEN_REG, size - 1);
            break;
        case OS_WRITE:
            IO_WRITE(PI_RD_LEN_REG, size - 1);
            break;
        default:
            return -1;
    }
#endif
    return 0;
}

