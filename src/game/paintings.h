#ifndef PAINTINGS_H
#define PAINTINGS_H

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

struct Painting
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

    const Gfx *displayList58;
    const s16 *const *meshData;
    const u8 *const *textureArray;
    s16 textureWidth;
    s16 textureHeight;
    const Gfx *displayList68;
    s8 rippleTrigger;
    u8 brightness;
    s8 lastMarioUnderPainting;
    s8 currMarioUnderPainting;
    s8 marioNewlyUnderPainting;
    float vSize;
};

extern struct Painting cotmc_painting;

extern struct Painting bob_painting;
extern struct Painting ccm_painting;
extern struct Painting wf_painting;
extern struct Painting jrb_painting;
extern struct Painting lll_painting;
extern struct Painting ssl_painting;
extern struct Painting hmc_painting;
extern struct Painting ddd_painting;
extern struct Painting wdw_painting;
extern struct Painting thi_tiny_painting;
extern struct Painting ttm_painting;
extern struct Painting ttc_painting;
extern struct Painting sl_painting;
extern struct Painting thi_huge_painting;

extern struct Painting ttm_slide_painting;

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
extern Vec3f *D_8035FFA4;
extern struct Painting *ripplingPainting;
extern s8 dddStatus;

extern Gfx *Geo18_802D5B98(s32 run, struct GraphNode *node, void *context);
extern Gfx *Geo18_802D5D0C(s32 run, struct GraphNode *node, f32 c[4][4]);

#endif /* PAINTINGS_H */
