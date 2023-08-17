#include "libultra_internal.h"

void osDestroyThread(OSThread *thread) {
    register s32 int_disabled;
    register OSThread *s1;
    register OSThread *s2;

    int_disabled = __osDisableInt();

    if (thread == NULL) {
        thread = __osRunningThread;
    } else if (thread->state != OS_STATE_STOPPED) {
        __osDequeueThread(thread->queue, thread);
    }

    if (__osActiveQueue == thread) {
        __osActiveQueue = __osActiveQueue->tlnext;
    } else {
        s1 = __osActiveQueue;
#ifdef VERSION_CN
        while (s1->priority != -1) {
            s2 = s1->tlnext;
            if (s2 == thread) {
                s1->tlnext = thread->tlnext;
                break;
            }
            s1 = s2;
        }
#else
        s2 = s1->tlnext;
        while (s2 != NULL) {
            if (s2 == thread) {
                s1->tlnext = thread->tlnext;
                break;
            }
            s1 = s2;
            s2 = s1->tlnext;
        }
#endif
    }

    if (thread == __osRunningThread) {
        __osDispatchThread();
    }

    __osRestoreInt(int_disabled);
}
