#include "libultra_internal.h"

OSThread *__osGetCurrFaultedThread() {
    return __osActiveQueue;
}
