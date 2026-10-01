/*
 * src/ios/libultra_shim/multilibultra_mesg.c
 *
 * Replaces lib/src/osCreateMesgQueue.c / osSendMesg.c / osJamMesg.c /
 * osRecvMesg.c / osSetEventMesg.c for the iOS target. Same rationale as
 * multilibultra_thread.c: the real decomp versions rely on MIPS interrupt
 * masking (__osDisableInt/__osRestoreInt) for thread-safety, which doesn't
 * exist here. include/PR/os_message.h (OSMesgQueue/OSMesg/OSEvent) is
 * unchanged -- game code is untouched.
 *
 * OSMesgQueue already describes a ring buffer (`msg`, `msgCount`,
 * `validCount`, `first`), which we reuse directly. We only need to add
 * real synchronization: a lazily-allocated mutex+condvar pair stashed in
 * the otherwise-unused `mtqueue`/`fullqueue` OSThread* fields (those exist
 * on real hardware to track threads blocked on the queue; game code never
 * reads them itself).
 */
#include <pthread.h>
#include <stdlib.h>
#include <string.h>

#include <ultra64.h>

typedef struct IosMesgQueueSync {
    pthread_mutex_t mutex;
    pthread_cond_t not_empty;
    pthread_cond_t not_full;
} IosMesgQueueSync;

/* Up to OS_NUM_EVENTS distinct hardware "events" (SP/DP/VI/SI/PRENMI/...)
 * can each be wired to a queue + message via osSetEventMesg. */
typedef struct IosEventBinding {
    OSMesgQueue *queue;
    OSMesg msg;
    int bound;
} IosEventBinding;

static IosEventBinding sEventBindings[OS_NUM_EVENTS];

static IosMesgQueueSync *ios_mesg_sync(OSMesgQueue *mq) {
    IosMesgQueueSync *sync;
    memcpy(&sync, &mq->mtqueue, sizeof(sync));
    return sync;
}

void osCreateMesgQueue(OSMesgQueue *mq, OSMesg *msgBuf, s32 count) {
    IosMesgQueueSync *sync = (IosMesgQueueSync *) calloc(1, sizeof(IosMesgQueueSync));
    pthread_mutex_init(&sync->mutex, NULL);
    pthread_cond_init(&sync->not_empty, NULL);
    pthread_cond_init(&sync->not_full, NULL);

    mq->fullqueue = NULL;
    memcpy(&mq->mtqueue, &sync, sizeof(sync));
    mq->validCount = 0;
    mq->first = 0;
    mq->msgCount = count;
    mq->msg = msgBuf;
}

s32 osSendMesg(OSMesgQueue *mq, OSMesg msg, s32 flag) {
    IosMesgQueueSync *sync = ios_mesg_sync(mq);
    pthread_mutex_lock(&sync->mutex);

    while (mq->validCount >= mq->msgCount) {
        if (flag == OS_MESG_NOBLOCK) {
            pthread_mutex_unlock(&sync->mutex);
            return -1;
        }
        pthread_cond_wait(&sync->not_full, &sync->mutex);
    }

    {
        s32 writeIndex = (mq->first + mq->validCount) % mq->msgCount;
        mq->msg[writeIndex] = msg;
        mq->validCount++;
    }

    pthread_cond_signal(&sync->not_empty);
    pthread_mutex_unlock(&sync->mutex);
    return 0;
}

s32 osJamMesg(OSMesgQueue *mq, OSMesg msg, s32 flag) {
    IosMesgQueueSync *sync = ios_mesg_sync(mq);
    pthread_mutex_lock(&sync->mutex);

    while (mq->validCount >= mq->msgCount) {
        if (flag == OS_MESG_NOBLOCK) {
            pthread_mutex_unlock(&sync->mutex);
            return -1;
        }
        pthread_cond_wait(&sync->not_full, &sync->mutex);
    }

    /* Jam: push to the front of the queue instead of the back. */
    mq->first = (mq->first - 1 + mq->msgCount) % mq->msgCount;
    mq->msg[mq->first] = msg;
    mq->validCount++;

    pthread_cond_signal(&sync->not_empty);
    pthread_mutex_unlock(&sync->mutex);
    return 0;
}

s32 osRecvMesg(OSMesgQueue *mq, OSMesg *msg, s32 flag) {
    IosMesgQueueSync *sync = ios_mesg_sync(mq);
    pthread_mutex_lock(&sync->mutex);

    while (mq->validCount <= 0) {
        if (flag == OS_MESG_NOBLOCK) {
            pthread_mutex_unlock(&sync->mutex);
            return -1;
        }
        pthread_cond_wait(&sync->not_empty, &sync->mutex);
    }

    if (msg != NULL) {
        *msg = mq->msg[mq->first];
    }
    mq->first = (mq->first + 1) % mq->msgCount;
    mq->validCount--;

    pthread_cond_signal(&sync->not_full);
    pthread_mutex_unlock(&sync->mutex);
    return 0;
}

void osSetEventMesg(OSEvent event, OSMesgQueue *mq, OSMesg msg) {
    if (event >= OS_NUM_EVENTS) {
        return;
    }
    sEventBindings[event].queue = mq;
    sEventBindings[event].msg = msg;
    sEventBindings[event].bound = 1;
}

/*
 * Internal helper (not part of libultra's public API) used by the VI/SP/DP
 * drivers in src/ios/libultra_shim/multilibultra_vi.c and the SP task
 * dispatch shim to post hardware-equivalent events exactly like real
 * interrupt handlers would via osSetEventMesg's registered queue.
 */
s32 ios_libultra_post_event(OSEvent event) {
    if (event >= OS_NUM_EVENTS || !sEventBindings[event].bound) {
        return -1;
    }
    return osSendMesg(sEventBindings[event].queue, sEventBindings[event].msg, OS_MESG_NOBLOCK);
}
