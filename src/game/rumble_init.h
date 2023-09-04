#ifndef RUMBLE_INIT_H
#define RUMBLE_INIT_H

#include "config.h"

#if ENABLE_RUMBLE

struct RumbleData {
    u8 unk00;
    u8 unk01;
    s16 unk02;
    s16 unk04;
};

struct StructSH8031D9B0 {
    s16 unk00;
    s16 unk02;
    s16 unk04;
    s16 unk06;
    s16 unk08;
    s16 unk0A;
    s16 unk0C;
    s16 unk0E;
};

extern OSThread gRumblePakThread;

extern OSPfs gRumblePakPfs;

extern OSMesg gRumblePakSchedulerMesgBuf;
extern OSMesgQueue gRumblePakSchedulerMesgQueue;
extern OSMesg gRumbleThreadVIMesgBuf;
extern OSMesgQueue gRumbleThreadVIMesgQueue;

extern struct RumbleData gRumbleDataQueue[3];
extern struct StructSH8031D9B0 gCurrRumbleSettings;

extern s32 gRumblePakTimer;

void init_rumble_pak_scheduler_queue(void);
void block_until_rumble_pak_free(void);
void release_rumble_pak_control(void);
void queue_rumble_data(s16 a0, s16 a1);
void func_sh_8024C89C(s16 a0);
u8 is_rumble_finished_and_queue_empty(void);
void reset_rumble_timers(void);
void reset_rumble_timers_2(s32 a0);
void func_sh_8024CA04(void);
void cancel_rumble(void);
void create_thread_6(void);
void rumble_thread_update_vi(void);

#endif // ENABLE_RUMBLE

#endif // RUMBLE_INIT_H
