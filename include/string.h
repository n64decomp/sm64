#ifndef _STRING_H_
#define _STRING_H_
#include "PR/ultratypes.h"
void* memcpy(void*, const void*, size_t);
size_t strlen(const u8 *str);
const u8 *strchr(const u8 *str, s32 ch);

#endif
