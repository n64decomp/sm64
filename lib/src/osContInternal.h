#ifndef _ULTRA64_CONTROLLER_INTERNAL_H_
#define _ULTRA64_CONTROLLER_INTERNAL_H_
#include <types.h>
typedef struct
{
    u8 unk00; //unknown, set to 255 a lot
    u8 unk01;
    u8 unk02; //probably status
    u8 unk03; //maybe errno
    u16 button;
    s8 rawStickX;
    s8 rawStickY;
} OSContPackedRead;

typedef struct
{
    u8 unk00; //unknown, set to 255 a lot
    u8 unk01;
    u8 unk02; //probably status
    u8 unk03; //maybe errno
    u8 unk04;
    u8 unk05;
    u8 unk06;
    u8 unk07;
} OSContPackedRequest;

typedef union {
    OSContPackedRead read;
    OSContPackedRequest request;
} OSContPackedStruct;


extern OSContPackedStruct D_80365CE0[7];

#endif
