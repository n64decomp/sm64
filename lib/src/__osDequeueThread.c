#include "libultra_internal.h"

// these don't feel like they belong here
// but it makes the most logical since there was printf data before
#ifndef AVOID_UB
OSThread *__osThreadTail = NULL;
u32 D_80334894 = -1;
OSThread *__osRunQueue = (OSThread *) &__osThreadTail;
OSThread *__osActiveQueue = (OSThread *) &__osThreadTail;
OSThread *__osRunningThread = { 0 };
OSThread *__osFaultedThread = { 0 };
#else
OSThread_ListHead __osThreadTail_fix = {NULL, -1, (OSThread *) &__osThreadTail_fix, (OSThread *) &__osThreadTail_fix, NULL, 0};
#endif

void __osDequeueThread(register OSThread **queue, register OSThread *thread) {
    register OSThread **a2;
    register OSThread *a3;
    a2 = queue;
    a3 = *a2;
    while (a3 != NULL) {
        if (a3 == thread) {
            *a2 = thread->next;
            return;
        }
        a2 = &a3->next;
        a3 = *a2;
    }
}
