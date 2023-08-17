#include <ultra64.h>

#include "macros.h"
#include "types.h"

// This file is used to place iQue COMMON/.scommon symbols in the right locations.

#ifdef VERSION_CN
// Can't include the .h files directly because they have extern declarations
struct HudDisplay {
    /*0x00*/ s16 lives;
    /*0x02*/ s16 coins;
    /*0x04*/ s16 stars;
    /*0x06*/ s16 wedges;
    /*0x08*/ s16 keys;
    /*0x0A*/ s16 flags;
    /*0x0C*/ u16 timer;
};

typedef struct {
    /* 0x00 */ u32 ramarray[15];
    /* 0x3C */ u32 pifstatus;
} OSPifRam;

struct SpawnInfo {
    /*0x00*/ Vec3s startPos;
    /*0x06*/ Vec3s startAngle;
    /*0x0C*/ s8 areaIndex;
    /*0x0D*/ s8 activeAreaIndex;
    /*0x10*/ u32 behaviorArg;
    /*0x14*/ void *behaviorScript;
    /*0x18*/ struct GraphNode *model;
    /*0x1C*/ struct SpawnInfo *next;
};

struct WarpTransitionData {
    /*0x00*/ u8 red;
    /*0x01*/ u8 green;
    /*0x02*/ u8 blue;

    /*0x04*/ s16 startTexRadius;
    /*0x06*/ s16 endTexRadius;
    /*0x08*/ s16 startTexX;
    /*0x0A*/ s16 startTexY;
    /*0x0C*/ s16 endTexX;
    /*0x0E*/ s16 endTexY;

    /*0x10*/ s16 texTimer; // always 0, does seems to affect transition when disabled
};

struct WarpTransition {
    /*0x00*/ u8 isActive;       // Is the transition active. (either TRUE or FALSE)
    /*0x01*/ u8 type;           // Determines the type of transition to use (circle, star, etc.)
    /*0x02*/ u8 time;           // Amount of time to complete the transition (in frames)
    /*0x03*/ u8 pauseRendering; // Should the game stop rendering. (either TRUE or FALSE)
    /*0x04*/ struct WarpTransitionData data;
};

typedef struct __OSEventState
{
    OSMesgQueue *messageQueue;
    OSMesg message;
} __OSEventState;

struct Area {
    /*0x00*/ s8 index;
    /*0x01*/ s8 flags; // Only has 1 flag: 0x01 = Is this the active area?
    /*0x02*/ u16 terrainType; // default terrain of the level (set from level script cmd 0x31)
    /*0x04*/ struct GraphNodeRoot *unk04; // geometry layout data
    /*0x08*/ TerrainData *terrainData; // collision data (set from level script cmd 0x2E)
    /*0x0C*/ RoomData *surfaceRooms; // (set from level script cmd 0x2F)
    /*0x10*/ s16 *macroObjects; // Macro Objects Ptr (set from level script cmd 0x39)
    /*0x14*/ struct ObjectWarpNode *warpNodes;
    /*0x18*/ struct WarpNode *paintingWarpNodes;
    /*0x1C*/ struct InstantWarp *instantWarps;
    /*0x20*/ struct SpawnInfo *objectSpawnInfos;
    /*0x24*/ struct Camera *camera;
    /*0x28*/ struct UnusedArea28 *unused; // Filled by level script 0x3A, but is unused.
    /*0x2C*/ struct Whirlpool *whirlpools[2];
    /*0x34*/ u8 dialog[2]; // Level start dialog number (set by level script cmd 0x30)
    /*0x36*/ u16 musicParam;
    /*0x38*/ u16 musicParam2;
};

FORCE_BSS struct HudDisplay gHudDisplay;
FORCE_BSS OSThread __osThreadSave;
FORCE_BSS OSPifRam __osContPifRam;
FORCE_BSS OSPiHandle __Dom2SpeedParam;
FORCE_BSS struct SpawnInfo gPlayerSpawnInfos[1];
FORCE_BSS struct GraphNode *D_8033A160[0x100];
FORCE_BSS OSPiHandle __CartRomHandle;
FORCE_BSS u8 sBssPad[0x48]; //! TODO: What is this space in the bss?
FORCE_BSS OSMesgQueue gOsPiMessageQueue;
FORCE_BSS OSPiHandle __Dom1SpeedParam;
FORCE_BSS OSTimer __osBaseTimer;
FORCE_BSS struct WarpTransition gWarpTransition;
FORCE_BSS OSTimer __osEepromTimer;
FORCE_BSS struct MarioState gMarioStates[1];
FORCE_BSS __OSEventState __osEventStateTab[OS_NUM_EVENTS];
FORCE_BSS OSMesgQueue __osEepromTimerQ;
FORCE_BSS struct Area gAreaData[8];
FORCE_BSS OSMesgQueue gOsSiMessageQueue;
#endif
