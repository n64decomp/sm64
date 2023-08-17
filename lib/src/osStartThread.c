#include "libultra_internal.h"

void osStartThread(OSThread *thread) {
    register u32 int_disabled;
    int_disabled = __osDisableInt();

    switch (thread->state) {
        case OS_STATE_WAITING:
            thread->state = OS_STATE_RUNNABLE;
            __osEnqueueThread(&__osRunQueue, thread);
            break;
        case OS_STATE_STOPPED:
            if (thread->queue == NULL || thread->queue == &__osRunQueue) {
                thread->state = OS_STATE_RUNNABLE;

                __osEnqueueThread(&__osRunQueue, thread);
            } else {
                thread->state = OS_STATE_WAITING;
                __osEnqueueThread(thread->queue, thread);
                __osEnqueueThread(&__osRunQueue, __osPopThread(thread->queue));
            }
            break;
    }

    if (__osRunningThread == NULL) {
        __osDispatchThread();
    } else {
        if (__osRunningThread->priority < __osRunQueue->priority) {
            __osRunningThread->state = OS_STATE_RUNNABLE;
            __osEnqueueAndYield(&__osRunQueue);
        }
    }

    __osRestoreInt(int_disabled);
}
