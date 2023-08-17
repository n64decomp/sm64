#include "libultra_internal.h"

void osSetThreadPri(OSThread *thread, OSPri pri) {
    register u32 int_disabled = __osDisableInt();
    if (thread == NULL) {
        thread = __osRunningThread;
    }

    if (thread->priority != pri) {
        thread->priority = pri;
        if (thread != __osRunningThread) {
            if (thread->state != OS_STATE_STOPPED) {
                __osDequeueThread(thread->queue, thread);
                __osEnqueueThread(thread->queue, thread);
            }
        }
        if (__osRunningThread->priority < __osRunQueue->priority) {
            __osRunningThread->state = OS_STATE_RUNNABLE;
            __osEnqueueAndYield(&__osRunQueue);
        }
    }

    __osRestoreInt(int_disabled);
}
