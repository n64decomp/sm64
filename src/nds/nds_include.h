#ifndef NDS_INCLUDE_H
#define NDS_INCLUDE_H

// Workaround for libnds type redefinitions
#define u64 _u64
#define s64 _s64
#define u32 _u32
#define vu32 _vu32
#define vs32 _vs32
#define s32 _s32
#define u16 _u16
#define s16 _s16
#define u8 _u8
#define s8 _s8
#include <nds.h>
#undef u64
#undef s64
#undef u32
#undef vu32
#undef vs32
#undef s32
#undef u16
#undef s16
#undef u8

#endif // NDS_INCLUDE_H
