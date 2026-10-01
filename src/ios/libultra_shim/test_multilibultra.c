/*
 * Standalone test for the libultra threading/messaging shim: not part of
 * the game build. Exercises osCreateThread/osStartThread, osCreateMesgQueue,
 * osSendMesg/osRecvMesg (blocking + non-blocking), osJamMesg ordering, and
 * osSetEventMesg + ios_libultra_post_event, to validate correctness before
 * wiring this shim into the real game loop (src/game/main.c).
 */
#include <stdint.h>
#include <stdio.h>
#include <unistd.h>

#include <ultra64.h>

extern s32 ios_libultra_post_event(OSEvent event);

static OSThread sWorkerThread;
static OSMesgQueue sQueue;
static OSMesg sQueueBuf[4];

static OSMesgQueue sToWorkerQueue;
static OSMesg sToWorkerQueueBuf[1];
static OSMesgQueue sFromWorkerQueue;
static OSMesg sFromWorkerQueueBuf[1];

static OSMesgQueue sEventQueue;
static OSMesg sEventQueueBuf[1];

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

static void worker_entry(void *arg) {
    OSMesg msg;
    (void) arg;
    osRecvMesg(&sToWorkerQueue, &msg, OS_MESG_BLOCK);
    printf("worker received: %ld\n", (long) (intptr_t) msg);
    osSendMesg(&sFromWorkerQueue, (OSMesg) (intptr_t) 999, OS_MESG_BLOCK);
}

int main(void) {
    OSMesg msg;
    s32 rc;

    osCreateMesgQueue(&sQueue, sQueueBuf, 4);

    /* Non-blocking receive on empty queue must fail immediately. */
    rc = osRecvMesg(&sQueue, &msg, OS_MESG_NOBLOCK);
    CHECK(rc == -1, "osRecvMesg NOBLOCK on empty queue returns -1");

    /* Fill then overflow with NOBLOCK send. */
    osSendMesg(&sQueue, (OSMesg) (intptr_t) 1, OS_MESG_NOBLOCK);
    osSendMesg(&sQueue, (OSMesg) (intptr_t) 2, OS_MESG_NOBLOCK);
    osSendMesg(&sQueue, (OSMesg) (intptr_t) 3, OS_MESG_NOBLOCK);
    osSendMesg(&sQueue, (OSMesg) (intptr_t) 4, OS_MESG_NOBLOCK);
    rc = osSendMesg(&sQueue, (OSMesg) (intptr_t) 5, OS_MESG_NOBLOCK);
    CHECK(rc == -1, "osSendMesg NOBLOCK on full queue returns -1");

    /* FIFO ordering. */
    osRecvMesg(&sQueue, &msg, OS_MESG_BLOCK);
    CHECK((intptr_t) msg == 1, "FIFO order preserved (first=1)");

    /* osJamMesg pushes to the front. */
    rc = osJamMesg(&sQueue, (OSMesg) (intptr_t) 100, OS_MESG_NOBLOCK);
    CHECK(rc == 0, "osJamMesg succeeds when space available");
    osRecvMesg(&sQueue, &msg, OS_MESG_BLOCK);
    CHECK((intptr_t) msg == 100, "osJamMesg message received before older ones");

    /* Drain remaining 2,3,4. */
    osRecvMesg(&sQueue, &msg, OS_MESG_BLOCK);
    CHECK((intptr_t) msg == 2, "drain order (2)");
    osRecvMesg(&sQueue, &msg, OS_MESG_BLOCK);
    CHECK((intptr_t) msg == 3, "drain order (3)");
    osRecvMesg(&sQueue, &msg, OS_MESG_BLOCK);
    CHECK((intptr_t) msg == 4, "drain order (4)");

    /* Cross-thread blocking round trip (two distinct queues, one per
     * direction, so there's no race between main and the worker both
     * being potential consumers of the same queue). */
    osCreateMesgQueue(&sToWorkerQueue, sToWorkerQueueBuf, 1);
    osCreateMesgQueue(&sFromWorkerQueue, sFromWorkerQueueBuf, 1);
    osCreateThread(&sWorkerThread, 1, worker_entry, NULL, NULL, 10);
    osStartThread(&sWorkerThread);
    usleep(50000); /* let the worker reach its blocking osRecvMesg */
    osSendMesg(&sToWorkerQueue, (OSMesg) (intptr_t) 42, OS_MESG_BLOCK);
    osRecvMesg(&sFromWorkerQueue, &msg, OS_MESG_BLOCK);
    CHECK((intptr_t) msg == 999, "cross-thread blocking round trip");

    /* Event binding (mirrors how VI vblank / SP / DP completion are
     * delivered through gIntrMesgQueue in src/game/main.c). */
    osCreateMesgQueue(&sEventQueue, sEventQueueBuf, 1);
    osSetEventMesg(OS_EVENT_VI, &sEventQueue, (OSMesg) (intptr_t) 777);
    rc = ios_libultra_post_event(OS_EVENT_VI);
    CHECK(rc == 0, "ios_libultra_post_event delivers bound event");
    osRecvMesg(&sEventQueue, &msg, OS_MESG_NOBLOCK);
    CHECK((intptr_t) msg == 777, "bound event message matches osSetEventMesg");

    printf("\n%s (%d failures)\n", sFailures == 0 ? "ALL TESTS PASSED" : "SOME TESTS FAILED", sFailures);
    return sFailures == 0 ? 0 : 1;
}
