#include <ultra64.h>
#include "sm64.h"
#include "game/level_update.h"
#include "level_commands.h"

#include "segment_symbols.h"

#include "actors/common0.h"
#include "actors/common1.h"
#include "actors/group0.h"
#include "actors/group1.h"
#include "actors/group2.h"
#include "actors/group3.h"
#include "actors/group4.h"
#include "actors/group5.h"
#include "actors/group6.h"
#include "actors/group7.h"
#include "actors/group8.h"
#include "actors/group9.h"
#include "actors/group10.h"
#include "actors/group11.h"
#include "actors/group12.h"
#include "actors/group13.h"
#include "actors/group14.h"
#include "actors/group15.h"
#include "actors/group16.h"
#include "actors/group17.h"

#include "levels/menu/header.h"
#include "levels/intro/header.h"
#include "levels/bbh/header.h"
#include "levels/ccm/header.h"
#include "levels/castle_inside/header.h"
#include "levels/hmc/header.h"
#include "levels/ssl/header.h"
#include "levels/bob/header.h"
#include "levels/sl/header.h"
#include "levels/wdw/header.h"
#include "levels/jrb/header.h"
#include "levels/thi/header.h"
#include "levels/ttc/header.h"
#include "levels/rr/header.h"
#include "levels/castle_grounds/header.h"
#include "levels/bitdw/header.h"
#include "levels/vcutm/header.h"
#include "levels/bitfs/header.h"
#include "levels/sa/header.h"
#include "levels/bits/header.h"
#include "levels/lll/header.h"
#include "levels/ddd/header.h"
#include "levels/wf/header.h"
#include "levels/ending/header.h"
#include "levels/castle_courtyard/header.h"
#include "levels/pss/header.h"
#include "levels/cotmc/header.h"
#include "levels/totwc/header.h"
#include "levels/bowser_1/header.h"
#include "levels/wmotr/header.h"
#include "levels/bowser_2/header.h"
#include "levels/bowser_3/header.h"
#include "levels/ttm/header.h"

static const LevelScript script_func_local_1[1 + 31 * 3 + 1];
static const LevelScript script_L1[4];
static const LevelScript script_L2[4];
static const LevelScript script_L3[4];
static const LevelScript script_L4[4];
static const LevelScript script_L5[4];
static const LevelScript script_L6[4 + 1];
static const LevelScript script_L7[4 + 1];
static const LevelScript script_L8[4 + 1];
static const LevelScript script_L9[4 + 1];
static const LevelScript script_L10[4 + 1];
static const LevelScript script_L11[4 + 1];
static const LevelScript script_L12[4 + 1];
static const LevelScript script_L13[4 + 1];
static const LevelScript script_L14[4 + 1];
static const LevelScript script_L15[4 + 1];
static const LevelScript script_L16[4 + 1];
static const LevelScript script_L17[4 + 1];
static const LevelScript script_L18[4 + 1];
static const LevelScript script_L19[4 + 1];
static const LevelScript script_L20[4 + 1];
static const LevelScript script_L21[4 + 1];
static const LevelScript script_L22[4 + 1];
static const LevelScript script_L23[4 + 1];
static const LevelScript script_L24[4 + 1];
static const LevelScript script_L25[4 + 1];
static const LevelScript script_L26[4 + 1];
static const LevelScript script_L27[4 + 1];
static const LevelScript script_L28[4 + 1];
static const LevelScript script_L29[4 + 1];
static const LevelScript script_L30[4 + 1];
static const LevelScript script_L31[4 + 1];
static const LevelScript script_L32[4 + 1];
static const LevelScript script_L33[4 + 1];
static const LevelScript script_L34[4 + 1];
static const LevelScript script_L35[4 + 1];
static const LevelScript script_L36[4 + 1];


const LevelScript level_main_scripts_entry[] = {
    LOAD_MIO0(/*seg*/ 0x04, _group0_mio0SegmentRomStart, _group0_mio0SegmentRomEnd),
    LOAD_MIO0(/*seg*/ 0x03, _common1_mio0SegmentRomStart, _common1_mio0SegmentRomEnd),
    LOAD_RAW( /*seg*/ 0x17, _group0_geoSegmentRomStart, _group0_geoSegmentRomEnd),
    LOAD_RAW( /*seg*/ 0x16, _common1_geoSegmentRomStart, _common1_geoSegmentRomEnd),
    LOAD_RAW( /*seg*/ 0x13, _behaviorSegmentRomStart, _behaviorSegmentRomEnd),
    ALLOC_LEVEL_POOL(),
    LOAD_MODEL_FROM_GEO(MODEL_MARIO,                   mario_geo),
    LOAD_MODEL_FROM_GEO(MODEL_SMOKE,                   smoke_geo),
    LOAD_MODEL_FROM_GEO(MODEL_SPARKLES,                sparkles_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BUBBLE,                  bubble_geo),
    LOAD_MODEL_FROM_GEO(MODEL_SPOT_ON_GROUND,          spot_on_ground_geo),
    LOAD_MODEL_FROM_GEO(MODEL_WATER_WAVES_SURF,        water_waves_surface_geo),
    LOAD_MODEL_FROM_GEO(MODEL_WATER_SPLASH,            water_splash_geo),
    LOAD_MODEL_FROM_GEO(MODEL_WATER_WAVES,             water_waves_geo),
    LOAD_MODEL_FROM_GEO(MODEL_YELLOW_COIN,             yellow_coin_geo),
    LOAD_MODEL_FROM_GEO(MODEL_STAR,                    star_geo),
    LOAD_MODEL_FROM_GEO(MODEL_TRANSPARENT_STAR,        transparent_star_geo),
    LOAD_MODEL_FROM_GEO(MODEL_WOODEN_SIGNPOST,         wooden_signpost_geo),
    LOAD_MODEL_FROM_DL( MODEL_WHITE_PARTICLE_SMALL,    white_particle_small_dl,     LAYER_ALPHA),
    LOAD_MODEL_FROM_GEO(MODEL_RED_FLAME,               red_flame_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BLUE_FLAME,              blue_flame_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BURN_SMOKE,              burn_smoke_geo),
    LOAD_MODEL_FROM_GEO(MODEL_LEAVES,                  leaves_geo),
    LOAD_MODEL_FROM_GEO(MODEL_PURPLE_MARBLE,           purple_marble_geo),
    LOAD_MODEL_FROM_GEO(MODEL_FISH,                    fish_geo),
    LOAD_MODEL_FROM_GEO(MODEL_FISH_SHADOW,             fish_shadow_geo),
    LOAD_MODEL_FROM_GEO(MODEL_SPARKLES_ANIMATION,      sparkles_animation_geo),
    LOAD_MODEL_FROM_DL( MODEL_SAND_DUST,               sand_seg3_dl_0302BCD0,       LAYER_ALPHA),
    LOAD_MODEL_FROM_GEO(MODEL_BUTTERFLY,               butterfly_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BURN_SMOKE_UNUSED,       burn_smoke_geo),
    LOAD_MODEL_FROM_DL( MODEL_PEBBLE,                  pebble_seg3_dl_0301CB00,     LAYER_ALPHA),
    LOAD_MODEL_FROM_GEO(MODEL_MIST,                    mist_geo),
    LOAD_MODEL_FROM_GEO(MODEL_WHITE_PUFF,              white_puff_geo),
    LOAD_MODEL_FROM_DL( MODEL_WHITE_PARTICLE_DL,       white_particle_dl,           LAYER_ALPHA),
    LOAD_MODEL_FROM_GEO(MODEL_WHITE_PARTICLE,          white_particle_geo),
    LOAD_MODEL_FROM_GEO(MODEL_YELLOW_COIN_NO_SHADOW,   yellow_coin_no_shadow_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BLUE_COIN,               blue_coin_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BLUE_COIN_NO_SHADOW,     blue_coin_no_shadow_geo),
    LOAD_MODEL_FROM_GEO(MODEL_MARIOS_WINGED_METAL_CAP, marios_winged_metal_cap_geo),
    LOAD_MODEL_FROM_GEO(MODEL_MARIOS_METAL_CAP,        marios_metal_cap_geo),
    LOAD_MODEL_FROM_GEO(MODEL_MARIOS_WING_CAP,         marios_wing_cap_geo),
    LOAD_MODEL_FROM_GEO(MODEL_MARIOS_CAP,              marios_cap_geo),
    LOAD_MODEL_FROM_GEO(MODEL_MARIOS_CAP,              marios_cap_geo), // repeated
    LOAD_MODEL_FROM_GEO(MODEL_BOWSER_KEY_CUTSCENE,     bowser_key_cutscene_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BOWSER_KEY,              bowser_key_geo),
    LOAD_MODEL_FROM_GEO(MODEL_RED_FLAME_SHADOW,        red_flame_shadow_geo),
    LOAD_MODEL_FROM_GEO(MODEL_1UP,                     mushroom_1up_geo),
    LOAD_MODEL_FROM_GEO(MODEL_RED_COIN,                red_coin_geo),
    LOAD_MODEL_FROM_GEO(MODEL_RED_COIN_NO_SHADOW,      red_coin_no_shadow_geo),
    LOAD_MODEL_FROM_GEO(MODEL_NUMBER,                  number_geo),
    LOAD_MODEL_FROM_GEO(MODEL_EXPLOSION,               explosion_geo),
    LOAD_MODEL_FROM_GEO(MODEL_DIRT_ANIMATION,          dirt_animation_geo),
    LOAD_MODEL_FROM_GEO(MODEL_CARTOON_STAR,            cartoon_star_geo),
    FREE_LEVEL_POOL(),
    CALL(/*arg*/ 0, /*func*/ lvl_init_from_save_file),
    LOOP_BEGIN(),
        EXECUTE(/*seg*/ 0x14, _menuSegmentRomStart, _menuSegmentRomEnd, level_main_menu_entry_2),
        JUMP_LINK(script_func_local_1),
        SLEEP(/*frames*/ 1),
    LOOP_UNTIL(/*op*/ OP_LT, /*arg*/ 0),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ -1, script_L2),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ -2, script_L3),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ -3, script_L4),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ -8, script_L1),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ -9, script_L5),
};

static const LevelScript script_L1[] = {
    EXIT_AND_EXECUTE(/*seg*/ 0x14, _introSegmentRomStart, _introSegmentRomEnd, level_intro_entry_1),
};

static const LevelScript script_L2[] = {
    EXIT_AND_EXECUTE(/*seg*/ 0x0E, _endingSegmentRomStart, _endingSegmentRomEnd, level_ending_entry),
};

static const LevelScript script_L3[] = {
    EXIT_AND_EXECUTE(/*seg*/ 0x14, _introSegmentRomStart, _introSegmentRomEnd, level_intro_entry_2),
};

static const LevelScript script_L4[] = {
    EXIT_AND_EXECUTE(/*seg*/ 0x14, _introSegmentRomStart, _introSegmentRomEnd, level_intro_entry_3),
};

static const LevelScript script_L5[] = {
    EXIT_AND_EXECUTE(/*seg*/ 0x14, _introSegmentRomStart, _introSegmentRomEnd, level_intro_entry_4),
};

static const LevelScript script_func_local_1[] = {
    GET_OR_SET(/*op*/ OP_GET, /*var*/ VAR_CURR_LEVEL_NUM),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 4, script_L6),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 5, script_L7),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 6, script_L8),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 7, script_L9),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 8, script_L10),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 9, script_L11),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 10, script_L12),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 11, script_L13),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 12, script_L14),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 13, script_L15),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 14, script_L16),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 15, script_L17),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 16, script_L18),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 17, script_L19),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 18, script_L20),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 19, script_L21),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 20, script_L22),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 21, script_L23),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 22, script_L24),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 23, script_L25),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 24, script_L26),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 25, script_L27),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 26, script_L28),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 27, script_L29),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 28, script_L30),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 29, script_L31),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 30, script_L32),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 31, script_L33),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 33, script_L34),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 34, script_L35),
    JUMP_IF(/*op*/ OP_EQ, /*arg*/ 36, script_L36),
    EXIT(),
};

static const LevelScript script_L6[] = {
    EXECUTE(/*seg*/ 0x0E, _bbhSegmentRomStart, _bbhSegmentRomEnd, level_bbh_entry),
    RETURN(),
};

static const LevelScript script_L7[] = {
    EXECUTE(/*seg*/ 0x0E, _ccmSegmentRomStart, _ccmSegmentRomEnd, level_ccm_entry),
    RETURN(),
};

static const LevelScript script_L8[] = {
    EXECUTE(/*seg*/ 0x0E, _castle_insideSegmentRomStart, _castle_insideSegmentRomEnd, level_castle_entry),
    RETURN(),
};

static const LevelScript script_L9[] = {
    EXECUTE(/*seg*/ 0x0E, _hmcSegmentRomStart, _hmcSegmentRomEnd, level_hmc_entry),
    RETURN(),
};

static const LevelScript script_L10[] = {
    EXECUTE(/*seg*/ 0x0E, _sslSegmentRomStart, _sslSegmentRomEnd, level_ssl_entry),
    RETURN(),
};

static const LevelScript script_L11[] = {
    EXECUTE(/*seg*/ 0x0E, _bobSegmentRomStart, _bobSegmentRomEnd, level_bob_entry),
    RETURN(),
};

static const LevelScript script_L12[] = {
    EXECUTE(/*seg*/ 0x0E, _slSegmentRomStart, _slSegmentRomEnd, level_sl_entry),
    RETURN(),
};

static const LevelScript script_L13[] = {
    EXECUTE(/*seg*/ 0x0E, _wdwSegmentRomStart, _wdwSegmentRomEnd, level_wdw_entry),
    RETURN(),
};

static const LevelScript script_L14[] = {
    EXECUTE(/*seg*/ 0x0E, _jrbSegmentRomStart, _jrbSegmentRomEnd, level_jrb_entry),
    RETURN(),
};

static const LevelScript script_L15[] = {
    EXECUTE(/*seg*/ 0x0E, _thiSegmentRomStart, _thiSegmentRomEnd, level_thi_entry),
    RETURN(),
};

static const LevelScript script_L16[] = {
    EXECUTE(/*seg*/ 0x0E, _ttcSegmentRomStart, _ttcSegmentRomEnd, level_ttc_entry),
    RETURN(),
};

static const LevelScript script_L17[] = {
    EXECUTE(/*seg*/ 0x0E, _rrSegmentRomStart, _rrSegmentRomEnd, level_rr_entry),
    RETURN(),
};

static const LevelScript script_L18[] = {
    EXECUTE(/*seg*/ 0x0E, _castle_groundsSegmentRomStart, _castle_groundsSegmentRomEnd, level_castle_grounds_entry),
    RETURN(),
};

static const LevelScript script_L19[] = {
    EXECUTE(/*seg*/ 0x0E, _bitdwSegmentRomStart, _bitdwSegmentRomEnd, level_bitdw_entry),
    RETURN(),
};

static const LevelScript script_L20[] = {
    EXECUTE(/*seg*/ 0x0E, _vcutmSegmentRomStart, _vcutmSegmentRomEnd, level_vcutm_entry),
    RETURN(),
};

static const LevelScript script_L21[] = {
    EXECUTE(/*seg*/ 0x0E, _bitfsSegmentRomStart, _bitfsSegmentRomEnd, level_bitfs_entry),
    RETURN(),
};

static const LevelScript script_L22[] = {
    EXECUTE(/*seg*/ 0x0E, _saSegmentRomStart, _saSegmentRomEnd, level_sa_entry),
    RETURN(),
};

static const LevelScript script_L23[] = {
    EXECUTE(/*seg*/ 0x0E, _bitsSegmentRomStart, _bitsSegmentRomEnd, level_bits_entry),
    RETURN(),
};

static const LevelScript script_L24[] = {
    EXECUTE(/*seg*/ 0x0E, _lllSegmentRomStart, _lllSegmentRomEnd, level_lll_entry),
    RETURN(),
};

static const LevelScript script_L25[] = {
    EXECUTE(/*seg*/ 0x0E, _dddSegmentRomStart, _dddSegmentRomEnd, level_ddd_entry),
    RETURN(),
};

static const LevelScript script_L26[] = {
    EXECUTE(/*seg*/ 0x0E, _wfSegmentRomStart, _wfSegmentRomEnd, level_wf_entry),
    RETURN(),
};

static const LevelScript script_L27[] = {
    EXECUTE(/*seg*/ 0x0E, _endingSegmentRomStart, _endingSegmentRomEnd, level_ending_entry),
    RETURN(),
};

static const LevelScript script_L28[] = {
    EXECUTE(/*seg*/ 0x0E, _castle_courtyardSegmentRomStart, _castle_courtyardSegmentRomEnd, level_castle_courtyard_entry),
    RETURN(),
};

static const LevelScript script_L29[] = {
    EXECUTE(/*seg*/ 0x0E, _pssSegmentRomStart, _pssSegmentRomEnd, level_pss_entry),
    RETURN(),
};

static const LevelScript script_L30[] = {
    EXECUTE(/*seg*/ 0x0E, _cotmcSegmentRomStart, _cotmcSegmentRomEnd, level_cotmc_entry),
    RETURN(),
};

static const LevelScript script_L31[] = {
    EXECUTE(/*seg*/ 0x0E, _totwcSegmentRomStart, _totwcSegmentRomEnd, level_totwc_entry),
    RETURN(),
};

static const LevelScript script_L32[] = {
    EXECUTE(/*seg*/ 0x0E, _bowser_1SegmentRomStart, _bowser_1SegmentRomEnd, level_bowser_1_entry),
    RETURN(),
};

static const LevelScript script_L33[] = {
    EXECUTE(/*seg*/ 0x0E, _wmotrSegmentRomStart, _wmotrSegmentRomEnd, level_wmotr_entry),
    RETURN(),
};

static const LevelScript script_L34[] = {
    EXECUTE(/*seg*/ 0x0E, _bowser_2SegmentRomStart, _bowser_2SegmentRomEnd, level_bowser_2_entry),
    RETURN(),
};

static const LevelScript script_L35[] = {
    EXECUTE(/*seg*/ 0x0E, _bowser_3SegmentRomStart, _bowser_3SegmentRomEnd, level_bowser_3_entry),
    RETURN(),
};

static const LevelScript script_L36[] = {
    EXECUTE(/*seg*/ 0x0E, _ttmSegmentRomStart, _ttmSegmentRomEnd, level_ttm_entry),
    RETURN(),
};

const LevelScript script_func_global_1[] = {
    LOAD_MODEL_FROM_GEO(MODEL_BLUE_COIN_SWITCH,        blue_coin_switch_geo),
    LOAD_MODEL_FROM_GEO(MODEL_AMP,                     amp_geo),
    LOAD_MODEL_FROM_GEO(MODEL_PURPLE_SWITCH,           purple_switch_geo),
    LOAD_MODEL_FROM_GEO(MODEL_CHECKERBOARD_PLATFORM,   checkerboard_platform_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BREAKABLE_BOX,           breakable_box_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BREAKABLE_BOX_SMALL,     breakable_box_small_geo),
    LOAD_MODEL_FROM_GEO(MODEL_EXCLAMATION_BOX_OUTLINE, exclamation_box_outline_geo),
    LOAD_MODEL_FROM_GEO(MODEL_EXCLAMATION_BOX,         exclamation_box_geo),
    LOAD_MODEL_FROM_GEO(MODEL_GOOMBA,                  goomba_geo),
    LOAD_MODEL_FROM_DL( MODEL_EXCLAMATION_POINT,       exclamation_box_outline_seg8_dl_08025F08, LAYER_ALPHA),
    LOAD_MODEL_FROM_GEO(MODEL_KOOPA_SHELL,             koopa_shell_geo),
    LOAD_MODEL_FROM_GEO(MODEL_METAL_BOX,               metal_box_geo),
    LOAD_MODEL_FROM_DL( MODEL_METAL_BOX_DL,            metal_box_dl,                             LAYER_OPAQUE),
    LOAD_MODEL_FROM_GEO(MODEL_BLACK_BOBOMB,            black_bobomb_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BOBOMB_BUDDY,            bobomb_buddy_geo),
    LOAD_MODEL_FROM_DL( MODEL_DL_CANNON_LID,           cannon_lid_seg8_dl_080048E0,              LAYER_OPAQUE),
    LOAD_MODEL_FROM_GEO(MODEL_BOWLING_BALL,            bowling_ball_geo),
    LOAD_MODEL_FROM_GEO(MODEL_CANNON_BARREL,           cannon_barrel_geo),
    LOAD_MODEL_FROM_GEO(MODEL_CANNON_BASE,             cannon_base_geo),
    LOAD_MODEL_FROM_GEO(MODEL_HEART,                   heart_geo),
    LOAD_MODEL_FROM_GEO(MODEL_FLYGUY,                  flyguy_geo),
    LOAD_MODEL_FROM_GEO(MODEL_CHUCKYA,                 chuckya_geo),
    LOAD_MODEL_FROM_GEO(MODEL_TRAJECTORY_MARKER_BALL,      bowling_ball_track_geo),
    RETURN(),
};

const LevelScript script_func_global_2[] = {
    LOAD_MODEL_FROM_GEO(MODEL_BULLET_BILL,             bullet_bill_geo),
    LOAD_MODEL_FROM_GEO(MODEL_YELLOW_SPHERE,           yellow_sphere_geo),
    LOAD_MODEL_FROM_GEO(MODEL_HOOT,                    hoot_geo),
    LOAD_MODEL_FROM_GEO(MODEL_YOSHI_EGG,               yoshi_egg_geo),
    LOAD_MODEL_FROM_GEO(MODEL_THWOMP,                  thwomp_geo),
    LOAD_MODEL_FROM_GEO(MODEL_HEAVE_HO,                heave_ho_geo),
    RETURN(),
};

const LevelScript script_func_global_3[] = {
    LOAD_MODEL_FROM_GEO(MODEL_BLARGG,                  blargg_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BULLY,                   bully_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BULLY_BOSS,              bully_boss_geo),
    RETURN(),
};

const LevelScript script_func_global_4[] = {
    LOAD_MODEL_FROM_GEO(MODEL_WATER_BOMB,              water_bomb_geo),
    LOAD_MODEL_FROM_GEO(MODEL_WATER_BOMB_SHADOW,       water_bomb_shadow_geo),
    LOAD_MODEL_FROM_GEO(MODEL_KING_BOBOMB,             king_bobomb_geo),
    RETURN(),
};

const LevelScript script_func_global_5[] = {
    LOAD_MODEL_FROM_GEO(MODEL_MANTA_RAY,               manta_seg5_geo_05008D14),
    LOAD_MODEL_FROM_GEO(MODEL_UNAGI,                   unagi_geo),
    LOAD_MODEL_FROM_GEO(MODEL_SUSHI,                   sushi_geo),
    LOAD_MODEL_FROM_DL( MODEL_DL_WHIRLPOOL,            whirlpool_seg5_dl_05013CB8, LAYER_TRANSPARENT),
    LOAD_MODEL_FROM_GEO(MODEL_CLAM_SHELL,              clam_shell_geo),
    RETURN(),
};

const LevelScript script_func_global_6[] = {
    LOAD_MODEL_FROM_GEO(MODEL_POKEY_HEAD,              pokey_head_geo),
    LOAD_MODEL_FROM_GEO(MODEL_POKEY_BODY_PART,         pokey_body_part_geo),
    LOAD_MODEL_FROM_GEO(MODEL_TORNADO,                 tornado_seg5_geo_05014630),
    LOAD_MODEL_FROM_GEO(MODEL_KLEPTO,                  klepto_geo),
    LOAD_MODEL_FROM_GEO(MODEL_EYEROK_LEFT_HAND,        eyerok_left_hand_geo),
    LOAD_MODEL_FROM_GEO(MODEL_EYEROK_RIGHT_HAND,       eyerok_right_hand_geo),
    RETURN(),
};

const LevelScript script_func_global_7[] = {
    LOAD_MODEL_FROM_DL( MODEL_DL_MONTY_MOLE_HOLE,      monty_mole_hole_seg5_dl_05000840, LAYER_TRANSPARENT_DECAL),
    LOAD_MODEL_FROM_GEO(MODEL_MONTY_MOLE,              monty_mole_geo),
    LOAD_MODEL_FROM_GEO(MODEL_UKIKI,                   ukiki_geo),
    LOAD_MODEL_FROM_GEO(MODEL_FWOOSH,                  fwoosh_geo),
    RETURN(),
};

const LevelScript script_func_global_8[] = {
    LOAD_MODEL_FROM_GEO(MODEL_SPINDRIFT,               spindrift_geo),
    LOAD_MODEL_FROM_GEO(MODEL_MR_BLIZZARD_HIDDEN,      mr_blizzard_hidden_geo),
    LOAD_MODEL_FROM_GEO(MODEL_MR_BLIZZARD,             mr_blizzard_geo),
    LOAD_MODEL_FROM_GEO(MODEL_PENGUIN,                 penguin_geo),
    RETURN(),
};

const LevelScript script_func_global_9[] = {
    LOAD_MODEL_FROM_DL( MODEL_CAP_SWITCH_EXCLAMATION,  cap_switch_exclamation_seg5_dl_05002E00, LAYER_ALPHA),
    LOAD_MODEL_FROM_GEO(MODEL_CAP_SWITCH,              cap_switch_geo),
    LOAD_MODEL_FROM_DL( MODEL_CAP_SWITCH_BASE,         cap_switch_base_seg5_dl_05003120,        LAYER_OPAQUE),
    RETURN(),
};

const LevelScript script_func_global_10[] = {
    LOAD_MODEL_FROM_GEO(MODEL_BOO,                     boo_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BETA_BOO_KEY,               small_key_geo),
    LOAD_MODEL_FROM_GEO(MODEL_HAUNTED_CHAIR,           haunted_chair_geo),
    LOAD_MODEL_FROM_GEO(MODEL_MAD_PIANO,               mad_piano_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BOOKEND_PART,            bookend_part_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BOOKEND,                 bookend_geo),
    LOAD_MODEL_FROM_GEO(MODEL_HAUNTED_CAGE,            haunted_cage_geo),
    RETURN(),
};

const LevelScript script_func_global_11[] = {
    LOAD_MODEL_FROM_GEO(MODEL_BIRDS,                   birds_geo),
    LOAD_MODEL_FROM_GEO(MODEL_PEACH,                   peach_geo),
    LOAD_MODEL_FROM_GEO(MODEL_YOSHI,                   yoshi_geo),
    RETURN(),
};

const LevelScript script_func_global_12[] = {
    LOAD_MODEL_FROM_GEO(MODEL_ENEMY_LAKITU,            enemy_lakitu_geo),
    LOAD_MODEL_FROM_GEO(MODEL_SPINY_BALL,              spiny_ball_geo),
    LOAD_MODEL_FROM_GEO(MODEL_SPINY,                   spiny_geo),
    LOAD_MODEL_FROM_GEO(MODEL_WIGGLER_HEAD,            wiggler_head_geo),
    LOAD_MODEL_FROM_GEO(MODEL_WIGGLER_BODY,            wiggler_body_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BUBBA,                   bubba_geo),
    RETURN(),
};

const LevelScript script_func_global_13[] = {
    LOAD_MODEL_FROM_GEO(MODEL_BOWSER,                  bowser_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BOWSER_BOMB_CHILD_OBJ,   bowser_bomb_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BOWSER_BOMB,             bowser_bomb_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BOWSER_SMOKE,            bowser_impact_smoke_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BOWSER_FLAMES,           bowser_flames_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BOWSER_WAVE,             invisible_bowser_accessory_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BOWSER2,                 bowser2_geo),
    RETURN(),
};

const LevelScript script_func_global_14[] = {
    LOAD_MODEL_FROM_GEO(MODEL_BUB,                     bub_geo),
    LOAD_MODEL_FROM_GEO(MODEL_TREASURE_CHEST_BASE,     treasure_chest_base_geo),
    LOAD_MODEL_FROM_GEO(MODEL_TREASURE_CHEST_LID,      treasure_chest_lid_geo),
    LOAD_MODEL_FROM_GEO(MODEL_CYAN_FISH,               cyan_fish_geo),
    LOAD_MODEL_FROM_GEO(MODEL_WATER_RING,              water_ring_geo),
    LOAD_MODEL_FROM_GEO(MODEL_WATER_MINE,              water_mine_geo),
    LOAD_MODEL_FROM_GEO(MODEL_SEAWEED,                 seaweed_geo),
    LOAD_MODEL_FROM_GEO(MODEL_SKEETER,                 skeeter_geo),
    RETURN(),
};

const LevelScript script_func_global_15[] = {
    LOAD_MODEL_FROM_GEO(MODEL_PIRANHA_PLANT,           piranha_plant_geo),
    LOAD_MODEL_FROM_GEO(MODEL_WHOMP,                   whomp_geo),
    LOAD_MODEL_FROM_GEO(MODEL_KOOPA_WITH_SHELL,        koopa_with_shell_geo),
    LOAD_MODEL_FROM_GEO(MODEL_KOOPA_WITHOUT_SHELL,     koopa_without_shell_geo),
    LOAD_MODEL_FROM_GEO(MODEL_METALLIC_BALL,           metallic_ball_geo),
    LOAD_MODEL_FROM_GEO(MODEL_CHAIN_CHOMP,             chain_chomp_geo),
    LOAD_MODEL_FROM_GEO(MODEL_KOOPA_FLAG,              koopa_flag_geo),
    LOAD_MODEL_FROM_GEO(MODEL_WOODEN_POST,             wooden_post_geo),
    RETURN(),
};

const LevelScript script_func_global_16[] = {
    LOAD_MODEL_FROM_GEO(MODEL_MIPS,                    mips_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BOO_CASTLE,              boo_castle_geo),
    LOAD_MODEL_FROM_GEO(MODEL_LAKITU,                  lakitu_geo),
    LOAD_MODEL_FROM_GEO(MODEL_TOAD,                    toad_geo),
    RETURN(),
};

const LevelScript script_func_global_17[] = {
    LOAD_MODEL_FROM_GEO(MODEL_CHILL_BULLY,             chilly_chief_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BIG_CHILL_BULLY,         chilly_chief_big_geo),
    LOAD_MODEL_FROM_GEO(MODEL_MONEYBAG,                moneybag_geo),
    RETURN(),
};

const LevelScript script_func_global_18[] = {
    LOAD_MODEL_FROM_GEO(MODEL_SWOOP,                   swoop_geo),
    LOAD_MODEL_FROM_GEO(MODEL_SCUTTLEBUG,              scuttlebug_geo),
    LOAD_MODEL_FROM_GEO(MODEL_MR_I_IRIS,               mr_i_iris_geo),
    LOAD_MODEL_FROM_GEO(MODEL_MR_I,                    mr_i_geo),
    LOAD_MODEL_FROM_GEO(MODEL_DORRIE,                  dorrie_geo),
    LOAD_MODEL_FROM_GEO(MODEL_SNUFIT,                  snufit_geo),
    RETURN(),
};
