#ifndef _GAME_H_
#define _GAME_H_

#include "memory.h"
struct DemoInput
{ // TODO: see if timer matches with s8
 /*0x00*/ u8 timer; // until next input: if this value
                    // is 0 proceeding on the demo input, it
                    // means the demo is over.
 /*0x01*/ s8 rawStickX;
 /*0x02*/ s8 rawStickY;
 /*0x03*/ u8 button;
};

extern struct Controller gControllers[3];
extern OSContStatus gControllerStatuses[4];
extern OSContPad gControllerPads[4];
extern OSMesgQueue gGameVblankQueue;
extern OSMesgQueue D_80339CB8;
extern OSMesg D_80339CD0;
extern OSMesg D_80339CD4;
extern struct VblankHandler gGameVblankHandler;
extern u32 gFrameBuffers[3];
extern u32 zBufferPtr;
extern void *D_80339CF0;
extern void *D_80339CF4;
extern struct SPTask *gGfxSPTask;
extern Gfx *gDisplayListHead;
extern u8 *gGfxPoolEnd;
extern struct GfxPool *gGfxPool;
extern u8 gControllerBits;
extern s8 gEepromProbe;

extern void (*D_8032C6A0)(void);
extern struct Controller *gPlayer1Controller;
extern struct Controller *gPlayer2Controller;
extern struct Controller *gPlayer3Controller;
extern struct DemoInput *gCurrDemoInput;
extern u16 gDemoInputListID;
extern struct DemoInput gRecordedDemoInput;

extern void init_controllers(void);
extern void setup_game_memory(void);
extern void thread5_game_loop(void *);
extern u16 func_802495B0(u32);

// this area is the demo input + the header. when the demo is loaded in, there is a header the size
// of a single word next to the input list. this word is the current ID count.
extern struct MarioAnimation D_80339D10;
extern struct MarioAnimation gDemo; // gDemo

extern u8 gZBuffer[];
extern u8 gMarioAnims[];
extern u8 gDemoInputs[];
extern u8 D_10000000[];

#endif
