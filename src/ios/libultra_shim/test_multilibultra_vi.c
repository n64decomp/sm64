/*
 * Standalone test for the VI vblank shim: validates osViSetEvent wiring
 * and that ios_libultra_vi_tick() posts the registered message every
 * retraceCount ticks, exactly matching what src/game/main.c's
 * setup_mesg_queues() (osViSetEvent(&gIntrMesgQueue, MESG_VI_VBLANK, 1))
 * and thread3_main (osRecvMesg(&gIntrMesgQueue, ...)) expect, plus a
 * sanity check that the misc os*() shims (time/TLB/virtual-to-physical)
 * link and behave reasonably.
 */
#include <stdint.h>
#include <stdio.h>

#include <ultra64.h>

extern void ios_libultra_vi_tick(void);

static OSMesgQueue sIntrQueue;
static OSMesg sIntrQueueBuf[8];

static int sFailures = 0;

#define CHECK(cond, msg) \
    do { \
        if (!(cond)) { \
            printf("FAIL: %s\n", msg); \
            sFailures++; \
        } else { \
            printf("OK:   %s\n", msg); \
        } \
    } while (0)

int main(void) {
    OSMesg msg;
    OSTime t1;
    OSTime t2;
    int i;

    osCreateMesgQueue(&sIntrQueue, sIntrQueueBuf, 8);
    osViSetEvent(&sIntrQueue, (OSMesg) (intptr_t) 102, 1);

    ios_libultra_vi_tick();
    CHECK(osRecvMesg(&sIntrQueue, &msg, OS_MESG_NOBLOCK) == 0, "vi tick posts a message when retraceCount==1");
    CHECK((intptr_t) msg == 102, "posted message matches osViSetEvent's msg");

    osViSetEvent(&sIntrQueue, (OSMesg) (intptr_t) 102, 3);
    ios_libultra_vi_tick();
    ios_libultra_vi_tick();
    CHECK(osRecvMesg(&sIntrQueue, &msg, OS_MESG_NOBLOCK) == -1, "no message before retraceCount ticks elapse");
    ios_libultra_vi_tick();
    CHECK(osRecvMesg(&sIntrQueue, &msg, OS_MESG_NOBLOCK) == 0, "message posted on the Nth tick");

    osViBlack(TRUE);
    ios_libultra_vi_tick();
    CHECK(osRecvMesg(&sIntrQueue, &msg, OS_MESG_NOBLOCK) == -1, "osViBlack(TRUE) suppresses vblank messages");
    osViBlack(FALSE);

    /* Misc shims: osGetTime should be monotonically increasing and
     * roughly track OS_CPU_COUNTER ticks/sec. */
    t1 = osGetTime();
    for (i = 0; i < 1000000; i++) {
        /* busy loop */
    }
    t2 = osGetTime();
    CHECK(t2 >= t1, "osGetTime is monotonically non-decreasing");

    CHECK(osVirtualToPhysical(&msg) == (uintptr_t) &msg, "osVirtualToPhysical is an identity passthrough");
    {
        extern void *osPhysicalToVirtual(u32 addr);
        CHECK(osPhysicalToVirtual((u32) (intptr_t) &msg) == (void *) &msg, "osPhysicalToVirtual is an identity passthrough");
    }

    osMapTLB(0, OS_PM_4K, NULL, 0, 0, 0);
    osUnmapTLBAll();
    CHECK(1, "osMapTLB/osUnmapTLBAll link and don't crash");

    printf("\n%s (%d failures)\n", sFailures == 0 ? "ALL TESTS PASSED" : "SOME TESTS FAILED", sFailures);
    return sFailures == 0 ? 0 : 1;
}
