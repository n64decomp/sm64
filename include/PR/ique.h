#ifndef IQUE_H
#define IQUE_H

#include "rcp.h"

#define MI_SK_EXCEPTION_REG (MI_BASE_REG+0x14)
#define MI_SK_WATCHDOG_TIMER (MI_BASE_REG+0x18)

// Hardware interrupts
// 0x40 = NAND DMA, 0x80 = MD, 0x100 = RDB, 0x200 = AES,
// 0x400 = PI_ERR, 0x800 = USB0, 0x1000 = USB1, 0x2000 = NAND
#define MI_HW_INTR_REG (MI_BASE_REG+0x38)
#define MI_HW_INTR_MASK_REG (MI_BASE_REG+0x3C)

#define PI_CARD_ADDR_REG (PI_BASE_REG+0x48)
#define PI_EX_RD_LEN_REG (PI_BASE_REG+0x58)
#define PI_EX_WR_LEN_REG (PI_BASE_REG+0x5C)
#define PI_MISC_REG (PI_BASE_REG+0x60)

#if defined(_LANGUAGE_C) || defined(_LANGUAGE_C_PLUS_PLUS)

extern u8 *__osBbEepromAddress;
extern u32 __osBbEepromSize;
extern u32 __osBbFlashAddress;
extern u32 __osBbFlashSize;
extern u32 __osBbSramAddress;
extern u32 __osBbSramSize;
extern u32 *__osBbPakAddress[];
extern u32 __osBbPakSize;
extern u32 __osBbIsBb;
extern u32 __osBbHackFlags;

void skKeepAlive(void);

#endif

#endif
