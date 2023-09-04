#include "libultra_internal.h"
#include "osint.h"

__OSEventState __osEventStateTab[OS_NUM_EVENTS];

#ifdef VERSION_CN
u32 __osPreNMI = 0;
#endif

void osSetEventMesg(OSEvent e, OSMesgQueue *mq, OSMesg msg) {
    register u32 int_disabled;
    __OSEventState *msgs;
    int_disabled = __osDisableInt();

    msgs = __osEventStateTab + e;
    msgs->messageQueue = mq;
    msgs->message = msg;

#ifdef VERSION_CN
    if (e == OS_EVENT_PRENMI) {
        if (__osShutdown && !__osPreNMI) {
            osSendMesg(mq, msg, OS_MESG_NOBLOCK);
        }

        __osPreNMI = TRUE;
    }
#endif

    __osRestoreInt(int_disabled);
}
