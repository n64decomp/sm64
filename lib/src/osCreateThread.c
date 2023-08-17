#include "libultra_internal.h"
#include <PR/R4300.h>

void __osCleanupThread(void);

// Don't warn about pointer->u64 cast
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpointer-to-int-cast"

void osCreateThread(OSThread *thread, OSId id, void (*entry)(void *), void *arg, void *sp, OSPri pri) {
    register u32 saveMask;
    OSIntMask mask;

    thread->id = id;
    thread->priority = pri;
    thread->next = NULL;
    thread->queue = NULL;
    thread->context.pc = (u32) entry;
    thread->context.a0 = (u64) arg;
    thread->context.sp = (u64) sp - 16;
    thread->context.ra = (u64) __osCleanupThread;

    mask = OS_IM_ALL;
    thread->context.sr = (mask & OS_IM_CPU) | SR_EXL;
    thread->context.rcp = (mask & RCP_IMASK) >> RCP_IMASKSHIFT;
    thread->context.fpcsr = (u32) (FPCSR_FS | FPCSR_EV);
    thread->fp = 0;
    thread->state = OS_STATE_STOPPED;
    thread->flags = 0;
    saveMask = __osDisableInt();
    thread->tlnext = __osActiveQueue;

    __osActiveQueue = thread;
    __osRestoreInt(saveMask);
}

#pragma GCC diagnostic pop
