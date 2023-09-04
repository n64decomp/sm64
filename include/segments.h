#ifndef SEGMENTS_H
#define SEGMENTS_H

#include "config.h"

/*
 * Memory addresses for segments. Ideally, this header file would not be
 * needed, and the addresses would be defined in sm64.ld and linker-inserted
 * into C code. However, there are some cases where that would not match, where
 * addresses are loaded using lui/ori rather than lui/addiu.
 * To avoid duplication, this file is included from sm64.ld. We make sure not
 * to cast the addresses to pointers in this file, since that would be invalid
 * linker script syntax.
*/

#define SEG_START         0x8005C000

#define SEG_FRAMEBUFFERS_SIZE (2 * SCREEN_WIDTH * SCREEN_HEIGHT * 3)
#define SEG_GODDARD_POOL_OFFSET 0x52000 // Offset from right side of pool
#define SEG_GODDARD       (SEG_POOL_END - SEG_GODDARD_POOL_OFFSET)

#ifndef USE_EXT_RAM /* Default: Runs out of memory quickly when importing custom assets. */

#define RDRAM_END         0x80400000

#define SEG_POOL_START    SEG_START
#define SEG_POOL_SIZE     0x165000
#define SEG_POOL_END      (SEG_POOL_START + SEG_POOL_SIZE)

#define SEG_BUFFERS       SEG_POOL_END

#ifdef VERSION_EU
#define SEG_ENGINE        0x8036FF00
#else
#define SEG_ENGINE        0x80378800
#endif

#define SEG_FRAMEBUFFERS  (RDRAM_END - SEG_FRAMEBUFFERS_SIZE)

#else /* Use Expansion Pak space for pool. */

/*
 * Workaround for running out of pool space due to
 * importing large custom content.
 */

#ifdef VERSION_CN
#define RDRAM_END         0x807C0000 // iQue has stuff like EEPROM mapped at 807C0000 onwards. TODO: Code this using osMemSize
#else
#define RDRAM_END         0x80800000
#endif

#define SEG_BUFFERS       SEG_START
#define SEG_ENGINE        ((u32) &_engineSegmentStart)
#define SEG_FRAMEBUFFERS  ((u32) &_framebuffersSegmentNoloadStart)
#define SEG_POOL_START    ((u32) &_framebuffersSegmentNoloadEnd)
#define SEG_POOL_END      RDRAM_END
#define SEG_POOL_END_4MB  0x80400000 // For the error message screen enhancement.

#endif

#endif // SEGMENTS_H
