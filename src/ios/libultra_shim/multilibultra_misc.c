/*
 * src/ios/libultra_shim/multilibultra_misc.c
 *
 * Replaces a handful of small lib/src/os*.c files whose real
 * implementations are meaningless on ARM/iOS:
 *
 * - osVirtualToPhysical/osPhysicalToVirtual: on real N64 hardware these
 *   strip/add the KSEG0 (0x80000000) or KSEG1 (0xA0000000) segment bits
 *   MIPS uses to select cached vs. uncached access to the *same*
 *   physical RAM. We have no MIPS segmentation at all -- every pointer
 *   here is already a plain, dereferenceable ARM address -- so these are
 *   pure identity passthroughs. (Used only by src/goddard/renderer.c,
 *   the credits-sequence renderer, to build gSPMatrix/gSPVertex/etc.
 *   display-list words the way the real game already does; our F3D
 *   interpreter dereferences those addresses directly, so identity is
 *   exactly correct here, whereas naively reusing the real bit-masking
 *   logic would corrupt arbitrary heap pointers.)
 * - osGetTime/osGetCount/osSetTime: real N64 hardware has a free-running
 *   COP0 Count register incrementing at OS_CPU_COUNTER Hz (see
 *   include/PR/os.h); we reproduce the same tick rate from the device's
 *   monotonic clock so existing OS_CYCLES_TO_USEC-based profiling code
 *   (src/game/profiler.c) keeps working unmodified. osSetTime is only
 *   ever called from src/game/main.c's unreachable/dead
 *   unknown_main_func, so it's a harmless no-op bias.
 * - osSetTimer: declared but never actually called anywhere in this
 *   codebase (confirmed by repo-wide search) -- a no-op stub is
 *   sufficient to satisfy the linker.
 * - osMapTLB/osUnmapTLBAll: real MIPS TLB management, meaningless on
 *   ARM; also only reachable from the same dead unknown_main_func.
 */
#include <mach/mach_time.h>
#include <stdint.h>

#include <ultra64.h>

/* Must match include/PR/os_misc.h's declaration exactly: uintptr_t, not
 * u32 -- they're the same size here but distinct types in C, and os_misc.h
 * (included transitively via <ultra64.h>) is the only declaration of this
 * function actually reachable by game code in this repo. */
uintptr_t osVirtualToPhysical(void *ptr) {
    return (uintptr_t) ptr;
}

/* Not reachable from any ultra64.h-visible declaration in this repo
 * (real include/PR/os.h declares it, but nothing here includes that
 * header, and no game code calls it) -- kept as an internal convenience
 * the iOS platform layer itself may use, with its own prototype. */
void *osPhysicalToVirtual(u32 addr);
void *osPhysicalToVirtual(u32 addr) {
    return (void *) (uintptr_t) addr;
}

static s64 sTimeBiasTicks = 0;

/* Real N64 hardware's free-running COP0 Count register increments at
 * OS_CPU_COUNTER Hz == 62500000 * 3 / 4 (see include/PR/os.h, which is
 * not reachable via <ultra64.h> in this repo and therefore not actually
 * used by any current game code -- only src/game/profiler.c's own raw
 * OSTime deltas are, which this reproduces faithfully). */
#define IOS_OS_CPU_COUNTER_HZ (62500000LL * 3 / 4)

static u64 ios_mach_time_to_os_ticks(void) {
    static mach_timebase_info_data_t sTimebase;
    static int sTimebaseInit = 0;
    u64 now = mach_absolute_time();
    long double nanos;

    if (!sTimebaseInit) {
        mach_timebase_info(&sTimebase);
        sTimebaseInit = 1;
    }
    nanos = (long double) now * sTimebase.numer / sTimebase.denom;
    /* nanos is in units of 1e-9 sec; convert to OS_CPU_COUNTER ticks. */
    return (u64) (nanos * ((long double) IOS_OS_CPU_COUNTER_HZ / 1000000000.0L));
}

OSTime osGetTime(void) {
    return (OSTime) ((s64) ios_mach_time_to_os_ticks() + sTimeBiasTicks);
}

u32 osGetCount(void) {
    return (u32) osGetTime();
}

void osSetTime(OSTime time) {
    sTimeBiasTicks = (s64) time - (s64) ios_mach_time_to_os_ticks();
}

u32 osSetTimer(OSTimer *timer, OSTime countdown, OSTime interval, OSMesgQueue *mq, OSMesg msg) {
    (void) timer;
    (void) countdown;
    (void) interval;
    (void) mq;
    (void) msg;
    return 0;
}

void osMapTLB(s32 index, OSPageMask pageSize, void *va, u32 pm0, u32 pm1, s32 asid) {
    (void) index;
    (void) pageSize;
    (void) va;
    (void) pm0;
    (void) pm1;
    (void) asid;
}

void osUnmapTLBAll(void) {
}
