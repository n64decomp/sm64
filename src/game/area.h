#ifndef _AREA_H
#define _AREA_H

#include "types.h"

enum CourseNum
{
    COURSE_NONE,                       // (0)  Overworld (Castle Grounds, etc)
    COURSE_MIN,
    /* -------------- Main Courses -------------- */
    COURSE_STAGES_MIN = COURSE_MIN,
    COURSE_BOB = COURSE_STAGES_MIN,    // (1)  Bob Omb Battlefield
    COURSE_WF,                         // (2)  Whomp's Fortress
    COURSE_JRB,                        // (3)  Jolly Rodger's Bay
    COURSE_CCM,                        // (4)  Cool Cool Mountain
    COURSE_BBH,                        // (5)  Big Boo's Haunt
    COURSE_HMC,                        // (6)  Hazy Maze Cave
    COURSE_LLL,                        // (7)  Lethal Lava Land
    COURSE_SSL,                        // (8)  Shifting Sand Land
    COURSE_DDD,                        // (9)  Dire Dire Docks
    COURSE_SL,                         // (10) Snowman's Land
    COURSE_WDW,                        // (11) Wet Dry World
    COURSE_TTM,                        // (12) Tall Tall Mountain
    COURSE_THI,                        // (13) Tiny Huge Island
    COURSE_TTC,                        // (14) Tick Tock Clock
    COURSE_RR,                         // (15) Rainbow Ride
    COURSE_BONUS_STAGES,
    COURSE_STAGES_MAX = COURSE_BONUS_STAGES - 1,
    COURSE_STAGES_COUNT = COURSE_STAGES_MAX,
    /* -------------- Bonus Courses -------------- */
    COURSE_BITDW,                      // (16) Bowser in the Dark World
    COURSE_BITFS,                      // (17) Bowser in the Fire Sea
    COURSE_BITS,                       // (18) Bowser in the Sky
    COURSE_PSS,                        // (19) Princess's Secret Slide
    COURSE_CAP_COURSES,
    COURSE_COTMC = COURSE_CAP_COURSES, // (20) Cavern of the Metal Cap
    COURSE_TOTWC,                      // (21) Tower of the Wing Cap
    COURSE_VCUTM,                      // (22) Vanish Cap Under the Moat
    COURSE_WMOTR,                      // (23) Winged Mario over the Rainbow
    COURSE_SA,                         // (24) Secret Aquarium
    COURSE_CAKE_END,                   // (25) The End (Cake Scene)
    COURSE_AFTER_END,
    COURSE_MAX = COURSE_AFTER_END - 1,
    COURSE_COUNT = COURSE_MAX
};

#define COURSE_IS_MAIN_COURSE(cmd) (cmd >= COURSE_STAGES_MIN && cmd <= COURSE_STAGES_MAX)

enum LevelNum
{
    LEVEL_NONE,                  // not indexed
    LEVEL_MIN,
    LEVEL_UNKNOWN_1 = LEVEL_MIN, // (1)  ""
    LEVEL_UNKNOWN_2,             // (2)  ""
    LEVEL_UNKNOWN_3,             // (3)  ""
    LEVEL_BBH,                   // (4)  "TERESA OBAKE"   Big Boo's Haunt
    LEVEL_CCM,                   // (5)  "YYAMA1 % YSLD1" Cool Cool Mountain
    LEVEL_CASTLE,                // (6)  "SELECT ROOM"    Castle lobby
    LEVEL_HMC,                   // (7)  "HORROR DUNGEON" Hazy Maze Cave
    LEVEL_SSL,                   // (8)  "SABAKU % PYRMD" Shifting Sand Land
    LEVEL_BOB,                   // (9)  "BATTLE FIELD"   Bob Omb Battlefield
    LEVEL_SL,                    // (10) "YUKIYAMA2"      Snowman's Land
    LEVEL_WDW,                   // (11) "POOL KAI"       Wet Dry World
    LEVEL_JRB,                   // (12) "WTDG % TINBOTU" Jolly Rodger's Bay
    LEVEL_THI,                   // (13) "BIG WORLD"      Tiny Huge Island
    LEVEL_TTC,                   // (14) "CLOCK TOWER"    Tick Tock Clock
    LEVEL_RR,                    // (15) "RAINBOW CRUISE" Rainbow Ride
    LEVEL_CASTLE_GROUNDS,        // (16) "MAIN MAP"       Castle grounds (outside)
    LEVEL_BITDW,                 // (17) "EXT1 YOKO SCRL" Bowser in the Dark World
    LEVEL_VCUTM,                 // (18) "EXT7 HORI MINI" Vanish Cap under the Moat
    LEVEL_BITFS,                 // (19) "EXT2 TIKA LAVA" Bowser in the Fire Sea
    LEVEL_SA,                    // (20) "EXT9 SUISOU"    Secret Aquarium
    LEVEL_BITS,                  // (21) "EXT3 HEAVEN"    Bowser in the Sky
    LEVEL_LLL,                   // (22) "FIREB1 % INVLC" Lethal Lava Land
    LEVEL_DDD,                   // (23) "WATER LAND"     Dire Dire Docks
    LEVEL_WF,                    // (24) "MOUNTAIN"       Whomp's Fortress
    LEVEL_ENDING,                // (25) "ENDING"         (Ending Cutscene)
    LEVEL_CASTLE_COURTYARD,      // (26) "URANIWA"        Castle courtyard (BBH entrance)
    LEVEL_PSS,                   // (27) "EXT4 MINI SLID" Princess's Secret Slide
    LEVEL_COTMC,                 // (28) "IN THE FALL"    Cavern of the Metal Cap
    LEVEL_TOTWC,                 // (29) "EXT6 MARIO FLY" Tower of the Wing Cap
    LEVEL_BOWSER_1,              // (30) "KUPPA1"         Bowser in the Dark World (Boss)
    LEVEL_WMOTR,                 // (31) "EXT8 BLUE SKY"  Winged Mario over the Rainbow
    LEVEL_UNKNOWN_32,            // (32) ""
    LEVEL_BOWSER_2,              // (33) "KUPPA2"         Bowser in the Fire Sea (Boss)
    LEVEL_BOWSER_3,              // (34) "KUPPA3"         Bowser in the Sky (Final Boss)
    LEVEL_UNKNOWN_35,            // (35) ""
    LEVEL_TTM,                   // (36) "DONKEY % SLID2" Tall Tall Mountain
    LEVEL_UNKNOWN_37,            // (37) ""
    LEVEL_UNKNOWN_38,            // (38) ""
    LEVEL_COUNT,
    LEVEL_MAX = LEVEL_COUNT - 1
};

struct WarpNode
{
    /*00*/ u8 id;
    /*01*/ u8 destLevel;
    /*02*/ u8 destArea;
    /*03*/ u8 destNode;
};

struct ObjectWarpNode
{
    /*0x00*/ struct WarpNode node;
    /*0x04*/ struct Object *object;
    /*0x08*/ struct ObjectWarpNode *next;
};

// From Surface 0x1B to 0x1E
#define INSTANT_WARP_INDEX_START  0x00 // Equal and greater than Surface 0x1B
#define INSTANT_WARP_INDEX_STOP   0x04 // Less than Surface 0x1F

struct InstantWarp
{
    /*0x00*/ u8 id; // 0 = 0x1B / 1 = 0x1C / 2 = 0x1D / 3 = 0x1E
    /*0x01*/ u8 area;
    /*0x02*/ Vec3s displacement;
};

struct SpawnInfo
{
    /*0x00*/ Vec3s startPos;
    /*0x06*/ Vec3s startAngle;
    /*0x0C*/ s8 areaIndex;
    /*0x0D*/ s8 activeAreaIndex;
    /*0x10*/ u32 behaviorArg;
    /*0x14*/ void *behaviorScript;
    /*0x18*/ struct GraphNode *unk18;
    /*0x1C*/ struct SpawnInfo *next;
};

// Some of these might need to be renamed at some point.
#define CAMERA_PRESET_NONE              0x00
#define CAMERA_PRESET_OPEN_CAMERA       0x01
#define CAMERA_PRESET_REVERSE_TOWER     0x02
#define CAMERA_PRESET_BEHIND_MARIO      0x03
#define CAMERA_PRESET_CLOSE             0x04 // Inside Castle / Big Boo's Haunt
#define CAMERA_PRESET_C_UP_LOOK         0x06
#define CAMERA_PRESET_WATER_SURFACE     0x08
#define CAMERA_PRESET_SLIDE_HOOT        0x09
#define CAMERA_PRESET_INSIDE_CANNON     0x0A
#define CAMERA_PRESET_BOSS_FIGHT        0x0B
#define CAMERA_PRESET_PARALLEL_TRACKING 0x0C
#define CAMERA_PRESET_FIXED_REF_POINT   0x0D
#define CAMERA_PRESET_PLATFORM_LEVEL    0x0E // Bowser Courses / Rainbow Road
#define CAMERA_PRESET_FREE_ROAM         0x10
#define CAMERA_PRESET_SPIRAL_STAIRS     0x11

// Used mostly in camera.c
struct LevelCamera
{
    /*0x00*/ u8 currPreset; // What type of preset the camera uses (see defines above)
    /*0x01*/ u8 defPreset;
    /*0x02*/ s16 trueYaw;
    /*0x04*/ Vec3f focus;
    /*0x10*/ Vec3f pos;
    /*0x1C*/ u8 filler1C[0x28-0x1C];
    /*0x28*/ f32 xFocus;
    /*0x2C*/ f32 zFocus;
    /*0x30*/ u8 cutscene;
    /*0x31*/ u8 filler31[0x9];
    /*0x3A*/ s16 storedYaw;
    /*0x3C*/ u8 filler3C[0x64-0x3C];
    /*0x64*/ u8 unk64;
    /*0x65*/ u8 filler65[3];
    /*0x68*/ f32 unk68;
};

struct UnusedArea28
{
    /*0x00*/ s16 unk00;
    /*0x02*/ s16 unk02;
    /*0x04*/ s16 unk04;
    /*0x06*/ s16 unk06;
    /*0x08*/ s16 unk08;
};

struct Whirlpool
{
    /*0x00*/ Vec3s pos;
    /*0x03*/ s16 strength;
};

struct Area
{
    /*0x00*/ s8 index;
    /*0x01*/ s8 flags; // Only has 1 flag: 0x01 = Is this the active area?
    /*0x02*/ u16 terrainType; // default terrain of the level (set from level script cmd 0x31)
    /*0x04*/ struct GraphNode *unk04; // geometry layout data
    /*0x08*/ s16 *terrainData; // collision data (set from level script cmd 0x2E)
    /*0x0C*/ s8 *surfaceRooms; // (set from level script cmd 0x2F)
    /*0x10*/ s16 *macroObjects; // Macro Objects Ptr (set from level script cmd 0x39)
    /*0x14*/ struct ObjectWarpNode *warpNodes;
    /*0x18*/ struct WarpNode *paintingWarpNodes;
    /*0x1C*/ struct InstantWarp *instantWarps;
    /*0x20*/ struct SpawnInfo *objectSpawnInfos;
    /*0x24*/ struct LevelCamera *camera;
    /*0x28*/ struct UnusedArea28 *unused28; // Filled by level script 0x3A, but is unused.
    /*0x2C*/ struct Whirlpool *whirlpools[2];
    /*0x34*/ u8 dialog[2]; // Level start dialog number (set by level script cmd 0x30)
    /*0x36*/ u16 musicParam;
    /*0x38*/ u16 musicParam2;
};

// All the transition data to be used in screen_transition.c
struct WarpTransitionData
{
    /*0x00*/ u8 red;
    /*0x01*/ u8 green;
    /*0x02*/ u8 blue;

    /*0x04*/ s16 startCircleRadius;
    /*0x06*/ s16 endCircleRadius;
    /*0x08*/ s16 startCircleX;
    /*0x0A*/ s16 startCircleY;
    /*0x0C*/ s16 endCircleX;
    /*0x0E*/ s16 endCircleY;

    /*0x10*/ s16 unk10;
};

#define WARP_TRANSITION_FADE_FROM_COLOR  0x00
#define WARP_TRANSITION_FADE_INTO_COLOR  0x01
#define WARP_TRANSITION_FADE_FROM_STAR   0x08
#define WARP_TRANSITION_FADE_INTO_STAR   0x09
#define WARP_TRANSITION_FADE_FROM_CIRCLE 0x0A
#define WARP_TRANSITION_FADE_INTO_CIRCLE 0x0B
#define WARP_TRANSITION_FADE_FROM_MARIO  0x10
#define WARP_TRANSITION_FADE_INTO_MARIO  0x11
#define WARP_TRANSITION_FADE_FROM_BOWSER 0x12
#define WARP_TRANSITION_FADE_INTO_BOWSER 0x13

struct WarpTransition
{
    /*0x00*/ u8 isActive;       // Is the transition active. (either TRUE or FALSE)
    /*0x01*/ u8 type;           // Determines the type of transition to use (circle, star, etc.)
    /*0x02*/ u8 time;           // Amount of time to complete the transition (in frames)
    /*0x03*/ u8 pauseRendering; // Should the game stop rendering. (either TRUE or FALSE)
    /*0x04*/ struct WarpTransitionData data;
};

extern struct SpawnInfo gPlayerSpawnInfos[];
extern struct GraphNode *D_8033A160[];
extern struct Area gAreaData[];
extern struct WarpTransition gWarpTransition;
extern s16 gCurrCourseNum;
extern s16 gCurrActNum;
extern s16 gCurrAreaIndex;
extern s16 gSavedCourseNum;
extern s16 gPauseScreenMode;
extern s16 gSaveOptSelectIndex;

extern struct SpawnInfo *gMarioSpawnInfo;

extern struct Area *gAreas;
extern struct Area *gCurrentArea;

extern s16 gCurrSaveFileNum;
extern s16 gCurrLevelNum;


void func_8027A220(Vp *a, Vp *b, u8 c, u8 d, u8 e);
void print_intro_text(void);
u32 get_mario_spawn_type(struct Object *o);
struct ObjectWarpNode *area_get_warp_node(u8 id);
void clear_areas(void);
void func_8027A7C4(void);
void load_area(s32 index);
void func_8027A998(void);
void load_mario_area(void);
void func_8027AA88(void);
void change_area(s32 index);
void area_update_objects(void);
void play_transition(s16 transType, s16 time, u8 red, u8 green, u8 blue);
void play_transition_after_delay(s16 transType, s16 time, u8 red, u8 green, u8 blue, s16 delay);
void render_game(void);


#endif
