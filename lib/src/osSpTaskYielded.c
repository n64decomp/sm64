#include "libultra_internal.h"

OSYieldResult osSpTaskYielded(OSTask *task) {
    s32 status;
    u32 int_disabledult;
    status = __osSpGetStatus();
    int_disabledult = (status & SPSTATUS_SIGNAL1_SET) != 0 ? 1 : 0;
    if (status & SPSTATUS_SIGNAL0_SET) {
        task->t.flags |= int_disabledult;
        task->t.flags &= ~(M_TASK_FLAG1);
    }
    return int_disabledult;
}
