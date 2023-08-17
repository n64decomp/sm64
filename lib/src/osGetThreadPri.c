#include "libultra_internal.h"

OSPri osGetThreadPri(OSThread *thread) {
    if (thread == NULL) {
        thread = __osRunningThread;
    }
    return thread->priority;
}
