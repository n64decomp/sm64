#include "libultra_internal.h"

s32 osRecvMesg(OSMesgQueue *mq, OSMesg *msg, s32 flag) {
    register u32 int_disabled;
    int_disabled = __osDisableInt();

    while (!mq->validCount) {
        if (!flag) {
            __osRestoreInt(int_disabled);
            return -1;
        } else {
            __osRunningThread->state = OS_STATE_WAITING;
            __osEnqueueAndYield(&mq->mtqueue);
        }
    }

    if (msg != NULL) {
        *msg = *(mq->first + mq->msg);
    }

    mq->first = (mq->first + 1) % mq->msgCount;
    mq->validCount--;

    if (mq->fullqueue->next != NULL) {
        osStartThread(__osPopThread(&mq->fullqueue));
    }

    __osRestoreInt(int_disabled);
    return 0;
}
