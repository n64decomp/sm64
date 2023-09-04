#include "libultra_internal.h"
#include "osint.h"

#pragma GCC diagnostic ignored "-Wunused-but-set-variable"

u32 osSetTimer(OSTimer *timer, OSTime countdown, OSTime interval, OSMesgQueue *mq, OSMesg msg) {
    OSTime time;
#ifdef VERSION_CN
    OSTimer *next;
    u32 count;
    u32 remaining;
    u32 prevInt;
#endif

    timer->next = NULL;
    timer->prev = NULL;
    timer->interval = interval;
    timer->remaining = countdown != 0 ? countdown : interval;
    timer->mq = mq;
    timer->msg = msg;

#ifdef VERSION_CN
    prevInt = __osDisableInt();
    if (__osTimerList->next == __osTimerList) {
    } else {
        next = __osTimerList->next;
        count = osGetCount();
        remaining = count - __osTimerCounter;

        if (remaining < next->remaining) {
            next->remaining -= remaining;
        } else {
            next->remaining = 1;
        }
    }

    time = __osInsertTimer(timer);
    __osSetTimerIntr(__osTimerList->next->remaining);

    __osRestoreInt(prevInt);
#else
    time = __osInsertTimer(timer);
    if (__osTimerList->next == timer) {
        __osSetTimerIntr(time);
    }
#endif

    return 0;
}
