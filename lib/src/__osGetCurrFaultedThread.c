#include "libultra_internal.h"
extern OSThread* D_8033489C;
OSThread *__osGetCurrFaultedThread() {
    return D_8033489C; // 80302efc
}
