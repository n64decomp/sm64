#ifndef PAINTINGS_H
#define PAINTINGS_H

#include "prevent_bss_reordering.h"

#define DEFAULT_HEIGHT 614.0

#define PAINTING_ID_DDD 7

#define DIRE_DIRE_DOCKS 9
#define BOARD_BOWSERS_SUB 1

#define BOWSERS_SUB_BEATEN 0x2
#define DDD_BACK 0x1

#define STAND_LEFT 0x20
#define STAND_MIDDLE 0x10
#define STAND_RIGHT 0x8
#define ENTER_LEFT 0x4
#define ENTER_MIDDLE 0x2
#define ENTER_RIGHT 0x1

#define RIPPLE_SHAPE_WAVE 0
#define RIPPLE_SHAPE_CONCENTRIC 1

#define RIPPLE_STATE_NONE 0
#define RIPPLE_STATE_IDLE 1
#define RIPPLE_STATE_ENTRY 2

#define RIPPLE_TRIGGER_PROXIMITY 10
#define RIPPLE_TRIGGER_CONTINUOUS 20

#define ROTATION_VERTICAL 0

#define NEAR_MARIO_LATERALLY 30
#define MARIO_X 40
#define MIDDLE_X 50
#define MARIO_Y 60
#define MARIO_Z 70
#define MIDDLE_Y 80

#define DONT_RESET_TIMER -56
#define RESET_TIMER 100

struct PaintingData
{
    s16 id;
    s8 faceCount;
    s8 rippleShape;
    s8 lastFloor;
    s8 currFloor;
    s8 floorEntered;
    s8 rippleStatus;
    float vXRotation;
    float vYRotation;
    float vXPos;
    float vYPos;
    float vZPos;
    float currRippleMag;
    float passiveRippleMag;
    float entryRippleMag;
    float rippleMagMultiplier;
    float passiveRippleMagMultiplier;
    float entryRippleMagMultiplier;
    float currRippleRate;
    float passiveRippleRate;
    float entryRippleRate;
    float dispersionFactor; // the rate at which the magnitude of the ripple decreases as you move farther from the central point of the ripple
    float passiveDispersionFactor;
    float entryDispersionFactor;
    float rippleTimer;
    float horizontalRippleSpot;
    float verticalRippleSpot;
    Gfx *displayList58;
    u16 **meshData;
    u8 **textureArray;
    s16 textureWidth;
    s16 textureHeight;
    Gfx *displayList68;
    s8 rippleTrigger;
    u8 brightness;
    s8 lastMarioUnderPainting;
    s8 currMarioUnderPainting;
    s8 marioNewlyUnderPainting;
    u8 filler71[3];
    float vSize;
};

extern struct MemoryPool *D_8033A124;

extern struct PaintingData cotmc_painting[];

extern struct PaintingData bob_painting[];
extern struct PaintingData ccm_painting[];
extern struct PaintingData wf_painting[];
extern struct PaintingData jrb_painting[];
extern struct PaintingData lll_painting[];
extern struct PaintingData ssl_painting[];
extern struct PaintingData hmc_painting[];
extern struct PaintingData ddd_painting[];
extern struct PaintingData wdw_painting[];
extern struct PaintingData thi_tiny_painting[];
extern struct PaintingData ttm_painting[];
extern struct PaintingData ttc_painting[];
extern struct PaintingData sl_painting[];
extern struct PaintingData thi_huge_painting[];

extern struct PaintingData ttm_slide_painting[];

extern u16 gAreaUpdateCounter;
extern float gPaintingMarioYEntry;

// defined in file
extern s16 gPaintingMarioFloorType;
extern float gPaintingMarioXPos, gPaintingMarioYPos, gPaintingMarioZPos;

struct Thing { //TODO: Give me a better name
    /*0x00*/ s16 unk0[3];
    /*0x06*/ s8 unk6[3];
};

extern struct Thing *D_8035FFA0;
extern float (*D_8035FFA4)[3];
extern struct PaintingData *ripplingPainting;
extern s8 dddStatus;

#endif /* PAINTINGS_H */
