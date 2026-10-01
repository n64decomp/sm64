/*
 * Standalone test for the SP task dispatch shim: validates that
 * osSpTaskStartGo for M_AUDTASK posts exactly one SP-bound completion
 * message, and for M_GFXTASK posts an SP-bound message followed by a
 * DP-bound message -- the exact shape src/game/main.c's
 * handle_sp_complete/handle_dp_complete expect, wired through
 * osSetEventMesg exactly like real game startup (setup_mesg_queues) does.
 */
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include <PR/os_message.h>
#include <PR/sptask.h>

extern void (*ios_gfx_interpret_dl)(const void *dl, u32 size);
extern void (*ios_audio_interpret_abi)(const void *abi, u32 size);

static OSMesgQueue sIntrQueue;
static OSMesg sIntrQueueBuf[16];

#define MESG_SP_COMPLETE 100
#define MESG_DP_COMPLETE 101

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

static int sAudioInterpretCalls = 0;
static int sGfxInterpretCalls = 0;

static void fake_audio_interpret(const void *abi, u32 size) {
    (void) abi;
    (void) size;
    sAudioInterpretCalls++;
}

static void fake_gfx_interpret(const void *dl, u32 size) {
    (void) dl;
    (void) size;
    sGfxInterpretCalls++;
}

static int recv_blocking_with_timeout(OSMesgQueue *mq, OSMesg *msg, int timeout_ms) {
    int waited = 0;
    while (osRecvMesg(mq, msg, OS_MESG_NOBLOCK) == -1) {
        if (waited >= timeout_ms) {
            return -1;
        }
        usleep(1000);
        waited++;
    }
    return 0;
}

int main(void) {
    OSTask audTask;
    OSTask gfxTask;
    OSMesg msg;
    u8 fakeAbiData[16];
    u8 fakeDlData[16];

    ios_audio_interpret_abi = fake_audio_interpret;
    ios_gfx_interpret_dl = fake_gfx_interpret;

    osCreateMesgQueue(&sIntrQueue, sIntrQueueBuf, 16);
    osSetEventMesg(OS_EVENT_SP, &sIntrQueue, (OSMesg) (intptr_t) MESG_SP_COMPLETE);
    osSetEventMesg(OS_EVENT_DP, &sIntrQueue, (OSMesg) (intptr_t) MESG_DP_COMPLETE);

    /* Audio task: expect exactly one SP_COMPLETE, no DP_COMPLETE. */
    memset(&audTask, 0, sizeof(audTask));
    audTask.t.type = M_AUDTASK;
    audTask.t.data_ptr = (u64 *) fakeAbiData;
    audTask.t.data_size = sizeof(fakeAbiData);

    osSpTaskLoad(&audTask);
    osSpTaskStartGo(&audTask);

    CHECK(recv_blocking_with_timeout(&sIntrQueue, &msg, 500) == 0, "audio task posts a completion message");
    CHECK((intptr_t) msg == MESG_SP_COMPLETE, "audio task completion is SP_COMPLETE");
    CHECK(recv_blocking_with_timeout(&sIntrQueue, &msg, 100) == -1, "audio task posts no DP_COMPLETE");
    CHECK(sAudioInterpretCalls == 1, "audio interpreter hook was invoked exactly once");

    /* Gfx task: expect SP_COMPLETE followed by DP_COMPLETE, in that order. */
    memset(&gfxTask, 0, sizeof(gfxTask));
    gfxTask.t.type = M_GFXTASK;
    gfxTask.t.data_ptr = (u64 *) fakeDlData;
    gfxTask.t.data_size = sizeof(fakeDlData);

    osSpTaskLoad(&gfxTask);
    osSpTaskStartGo(&gfxTask);

    CHECK(recv_blocking_with_timeout(&sIntrQueue, &msg, 500) == 0, "gfx task posts first completion message");
    CHECK((intptr_t) msg == MESG_SP_COMPLETE, "gfx task first message is SP_COMPLETE");
    CHECK(recv_blocking_with_timeout(&sIntrQueue, &msg, 500) == 0, "gfx task posts second completion message");
    CHECK((intptr_t) msg == MESG_DP_COMPLETE, "gfx task second message is DP_COMPLETE");
    CHECK(sGfxInterpretCalls == 1, "gfx interpreter hook was invoked exactly once");

    printf("\n%s (%d failures)\n", sFailures == 0 ? "ALL TESTS PASSED" : "SOME TESTS FAILED", sFailures);
    return sFailures == 0 ? 0 : 1;
}
