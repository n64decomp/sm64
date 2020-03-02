#ifndef _MAIN_H_
#define _MAIN_H_

extern OSThread D_80339210;
extern OSThread gIdleThread;
extern OSThread gMainThread;
extern OSThread gGameLoopThread;
extern OSThread gSoundThread;
extern OSMesgQueue gPIMesgQueue;
extern OSMesgQueue gIntrMesgQueue;
extern OSMesgQueue gSPTaskMesgQueue;
extern OSMesg gDmaMesgBuf[1];
extern OSMesg gPIMesgBuf[32];
extern OSMesg gSIEventMesgBuf[1];
extern OSMesg gIntrMesgBuf[16];
extern OSMesg gUnknownMesgBuf[16];
extern OSIoMesg gDmaIoMesg;
extern OSMesg D_80339BEC;
extern OSMesgQueue gDmaMesgQueue;
extern OSMesgQueue gSIEventMesgQueue;

extern struct VblankHandler *gVblankHandler1;
extern struct VblankHandler *gVblankHandler2;
extern struct SPTask *gActiveSPTask;
extern struct SPTask *D_8032C62C;
extern struct SPTask *D_8032C630;
extern OSMesg D_8032C634;
extern OSMesg D_8032C638;
extern s8 D_8032C63C;
extern u32 sNumVblanks;
extern s8 gResetTimer;
extern s8 D_8032C648;
extern s8 gDebugLevelSelect;
extern s8 D_8032C650;
extern s8 gShowProfiler;
extern s8 gShowDebugText;

extern void set_vblank_handler(s32 a, struct VblankHandler *b, OSMesgQueue *queue, OSMesg *msg);
extern void dispatch_audio_sptask(struct SPTask *spTask);
extern void send_display_list(struct SPTask *a);
extern void main(void);

#endif
