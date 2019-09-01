#ifndef _CAMERA_H
#define _CAMERA_H

#include "types.h"
#include "area.h"
#include "engine/geo_layout.h"

#define ABS(x) ((x) > 0.f ? (x) : -(x))
#define ABS2(x) ((x) >= 0.f ? (x) : -(x))

#define AREA_BBH                0x0041
#define AREA_CCM_OUTSIDE        0x0051
#define AREA_CCM_SLIDE          0x0052
#define AREA_CASTLE_LOBBY       0x0061
#define AREA_CASTLE_TIPPY       0x0062
#define AREA_CASTLE_BASTEMENT   0x0063
#define AREA_HMC                0x0071
#define AREA_SSL_OUTSIDE        0x0081
#define AREA_SSL_PYRAMID        0x0082
#define AREA_SSL_EYEROK         0x0083
#define AREA_BOB                0x0091
#define AREA_SL_OUTSIDE         0x00A1
#define AREA_SL_IGLOO           0x00A2
#define AREA_WDW_MAIN           0x00B1
#define AREA_WDW_TOWN           0x00B2
#define AREA_JRB_MAIN           0x00C1
#define AREA_JRB_SHIP           0x00C2
#define AREA_THI_HUGE           0x00D1
#define AREA_THI_TINY           0x00D2
#define AREA_THI_WIGGLER        0x00D3
#define AREA_TTC                0x00E1
#define AREA_RR                 0x00F1
#define AREA_OUTSIDE_CASTLE     0x0101
#define AREA_BITDW              0x0111
#define AREA_VCUTM              0x0121
#define AREA_BITFS              0x0131
#define AREA_SA                 0x0141
#define AREA_BITS               0x0151
#define AREA_LLL_OUTSIDE        0x0161
#define AREA_LLL_VOLCANO        0x0162
#define AREA_DDD_WHIRLPOOL      0x0171
#define AREA_DDD_SUB            0x0172
#define AREA_WF                 0x0181
#define AREA_ENDING             0x0191
#define AREA_COURTYARD          0x01A1
#define AREA_PSS                0x01B1
#define AREA_COTMC              0x01C1
#define AREA_TOTWC              0x01D1
#define AREA_BOWSER_1           0x01E1
#define AREA_WMOTR              0x01F1
#define AREA_BOWSER_2           0x0211
#define AREA_BOWSER_3           0x0221
#define AREA_TTM_OUTSIDE        0x0241

#define CAM_MODE_MARIO_ACTIVE           0x01
#define CAM_MODE_LAKITU_WAS_ZOOMED_OUT  0x02
#define CAM_MODE_MARIO_SELECTED         0x04

#define CAM_MOVE_RETURN_TO_MIDDLE       0x0001
#define CAM_MOVE_ZOOMED_OUT             0x0002
#define CAM_MOVE_ROTATE_RIGHT           0x0004
#define CAM_MOVE_ROTATE_LEFT            0x0008
#define CAM_MOVE_UNKNOWN_5              0x0010
#define CAM_MOVE_UNKNOWN_6              0x0020
#define CAM_MOVE_UNKNOWN_7              0x0040
#define CAM_MOVE_UNKNOWN_8              0x0080
#define CAM_MOVE_INTO_C_UP              0x0100
#define CAM_MOVE_UNKNOWN_10             0x0200
#define CAM_MOVE_UNKNOWN_11             0x0400
#define CAM_MOVE_INIT_CAMERA            0x0800
#define CAM_MOVE_UNK1000                0x1000
#define CAM_MOVE_C_UP_MODE              0x2000
#define CAM_MOVE_SUBMERGED              0x4000
#define CAM_MOVE_PAUSE_SCREEN           0x8000

#define CAM_FLAG_1_UNKNOWN_0 0x01
#define CAM_FLAG_1_UNKNOWN_1 0x02
#define CAM_FLAG_1_UNKNOWN_2 0x04
#define CAM_FLAG_1_UNUSED_3  0x08
#define CAM_FLAG_1_UNUSED_4  0x10
#define CAM_FLAG_1_UNKNOWN_5 0x20

#define CAM_FLAG_2_SMOOTH_MOVEMENT        0x0001
#define CAM_FLAG_2_UNKNOWN_1              0x0002
#define CAM_FLAG_2_FRAME_AFTER_CAM_INIT   0x0004
#define CAM_FLAG_2_UNKNOWN_3              0x0008
#define CAM_FLAG_2_CCM_SLIDE_SHORTCUT     0x0010
#define CAM_FLAG_2_COLLIDING_WITH_WALL    0x0020
#define CAM_FLAG_2_SLEEPING               0x0040
#define CAM_FLAG_2_UNUSED_7               0x0080
#define CAM_FLAG_2_UNUSED_8               0x0100
#define CAM_FLAG_2_UNKNOWN_9              0x0200
#define CAM_FLAG_2_UNKNOWN_10             0x0400
#define CAM_FLAG_2_UNKNOWN_11             0x0800
#define CAM_FLAG_2_BLOCK_LEVEL_SPECIFIC_UPDATES             0x1000
#define CAM_FLAG_2_UNUSED_13              0x2000
#define CAM_FLAG_2_UNUSED_CUTSCENE_ACTIVE 0x4000
#define CAM_FLAG_2_BEHIND_MARIO_POST_DOOR 0x8000

#define SHAKE_ATTACK         1
#define SHAKE_GROUND_POUND   2
#define SHAKE_SMALL_DAMAGE   3
#define SHAKE_MED_DAMAGE     4
#define SHAKE_LARGE_DAMAGE   5
#define SHAKE_HIT_FROM_BELOW 8
#define SHAKE_FALL_DAMAGE    9
#define SHAKE_SHOCK          10

#define SHAKE_2_UNKNOWN_1         1
#define SHAKE_2_UNKNOWN_2         2
#define SHAKE_2_UNKNOWN_3         3
#define SHAKE_2_UNKNOWN_5         5
#define SHAKE_2_UNKNOWN_6         6
#define SHAKE_2_UNKNOWN_7         7
#define SHAKE_2_UNKNOWN_8         8
#define SHAKE_2_JRB_SHIP_DRAIN    9
#define SHAKE_2_FALLING_BITS_PLAT 10

#define CUTSCENE_DOOR_0             130
#define CUTSCENE_DOOR_1             131
#define CUTSCENE_ENTER_CANNON       133
#define CUTSCENE_ENTER_PAINTING     134
#define CUTSCENE_DEATH_EXIT         135
#define CUTSCENE_DOOR_WARP          139
#define CUTSCENE_DOOR_A             140
#define CUTSCENE_DOOR_B             141
#define CUTSCENE_INTRO_PEACH        142
#define CUTSCENE_STAR_DANCE_1_1     143
#define CUTSCENE_ENTER_BOWSER_ARENA 144
#define CUTSCENE_0F_TODO            145
#define CUTSCENE_11_TODO            147
#define CUTSCENE_SLIDING_DOORS_OPEN 149
#define CUTSCENE_PREPARE_CANNON     150
#define CUTSCENE_UNLOCK_KEY_DOOR    151
#define CUTSCENE_STANDING_DEATH     152
#define CUTSCENE_DEATH_2            153
#define CUTSCENE_DEATH_ON_BACK      154
#define CUTSCENE_QUICKSAND_DEATH    155
#define CUTSCENE_SUFFOCATION_DEATH  156
#define CUTSCENE_EXIT_BOWSER_SUCC   157
#define CUTSCENE_1C_TODO            158
#define CUTSCENE_WATER_DEATH        159 //Not in cutscene switch
#define CUTSCENE_EXIT_PAINTING_SUCC 160
#define CUTSCENE_CAP_SWITCH_PRESS   161
#define CUTSCENE_DIALOG_1           162
#define CUTSCENE_DIALOG_2           163
#define CUTSCENE_ENTER_PYRAMID_TOP  164
#define CUTSCENE_STAR_DANCE_2       165
#define CUTSCENE_STAR_DANCE_3       166
#define CUTSCENE_KEY_DANCE          167
#define CUTSCENE_26_TODO            168
#define CUTSCENE_EXIT_BBH_SUCC      169
#define CUTSCENE_NONPAINTING_DEATH  170
#define CUTSCENE_READ_MESSAGE       171
#define CUTSCENE_PEACH_END          172
#define CUTSCENE_STAR_SPAWN         173
#define CUTSCENE_GRAND_STAR         174
#define CUTSCENE_STAR_DANCE_1_2     175
#define CUTSCENE_SPECIAL_STAR_SPAWN 176
#define CUTSCENE_END_WAVING         177
#define CUTSCENE_CREDITS            178
#define CUTSCENE_EXIT_WATERFALL     179
#define CUTSCENE_EXIT_FALL_WMOTR    180
#define CUTSCENE_ENTER_POOL         181

// sorted

struct CameraPlayerStatus
{
    /*0x00*/ u32 action;
    /*0x04*/ Vec3f pos;
    /*0x10*/ Vec3s faceAngle;
    /*0x16*/ Vec3s unk16;
    /*0x1C*/ s16 unk1C[2]; //only unk1C[1] seems used, represents an effective cutscene
    /*0x20*/ struct Object *usedObj;
};

struct TransitionCamera
{
    /*0x00*/ s16 pitch1;
    /*0x02*/ s16 yaw1;
    /*0x04*/ f32 dist1;
    /*0x08*/ s16 pitch2;
    /*0x0A*/ s16 yaw2;
    /*0x0C*/ f32 dist2;
    /*0x10*/ s32 timer;
    /*0x14*/ Vec3f marioPos;
    /*0x20*/ u8 pad; // for the structs to align, there has to be an extra unused variable here. type is unknown.
};

struct Struct8033B2B8
{
    /*0x00*/ s8 unk0;
    union {
        /*0x08*/ Vec3s unk8;
        /*0x08*/ long long int force_structure_alignment;
    } myUnion;
}; // size = 0x10

// unsorted

struct Struct80287404
{
    u8 filler0[0x18];
    s32 unk18;
    Vec3f unk1C;
    Vec3f unk28;
    u8 filler34[0x3A-0x34];
    s16 unk3A;
};

// Camera command procedures are marked as returning s32, but none of them
// actually return a value. This causes undefined behavior, which we'd rather
// avoid on modern GCC. Hence, typedef. Interestingly, the void vs s32
// difference doesn't affect -g, only -O2.
#ifdef __GNUC__
typedef void CmdRet;
#else
typedef s32 CmdRet;
#endif

typedef CmdRet (*CameraCommandProc)(struct LevelCamera *a);

struct TableCamera
{
    s8 area;
    CameraCommandProc unk4;
    s16 unk8;
    s16 unkA;
    s16 unkC;
    s16 unkE;
    s16 unk10;
    s16 unk12;
    s16 unk14;
};

struct CutsceneTableEntry
{
    CameraCommandProc unk0;
    s16 unk4;
};

struct Struct8033B230
{
    /*0x00*/ u8 unk0;
    /*0x04*/ f32 fieldOfView;
    /*0x08*/ f32 unk8;
    /*0x0C*/ u32 unkC;
    /*0x10*/ f32 unk10;
    /*0x14*/ s16 unk14;
    /*0x16*/ s16 unk16;
    /*0x18*/ s16 unk18;
};

struct CinematicCameraTable
{
    /*0x00*/ s8 unk0;
    /*0x01*/ u8 unk1;
    /*0x02*/ Vec3s unk2;
}; // size = 0x08

struct PlayerGeometry
{
    /*0x00*/ struct Surface *currFloor;
    /*0x04*/ f32 currFloorHeight;
    /*0x08*/ s16 currFloorType;
    /*0x0C*/ struct Surface *currCeil;
    /*0x10*/ s16 currCeilType;
    /*0x14*/ f32 currCeilHeight;
    /*0x18*/ struct Surface *prevFloor;
    /*0x1C*/ f32 prevFloorHeight;
    /*0x20*/ s16 prevFloorType;
    /*0x24*/ struct Surface *prevCeil;
    /*0x28*/ f32 prevCeilHeight;
    /*0x2C*/ s16 prevCeilType;
    /*0x30*/ f32 waterHeight;
};

struct Struct8033B418_sub
{
    Vec3f unk0;
    Vec3f unkC;
    f32 unk18;
    s16 unk1C;
    s16 unk1E;
};

struct Struct8033B418
{
    s16 unk0;
    s16 unk2;
    s16 unk4;
    s16 unk6;
    struct Struct8033B418_sub unk8;
    struct Struct8033B418_sub unk28;
};

struct ParallelTrackingTable
{
    s16 unk0;
    Vec3f unk4;
    f32 unk10;
    f32 unk14;
};

struct Struct8033B4B8
{
    /*0x00*/ Vec3f pos;
    /*0x0C*/ Vec3f focus;
    /*0x18*/ f32 unk18;
    /*0x1C*/ f32 unk1C;
};

struct Struct8033B6F0
{
    s32 unk0;
    Vec3f unk4;
    Vec3f unk10;
    Vec3s unk1C;
    s16 unk22;
};

struct CameraState
{
    /*0x00*/ Vec3f camFocAndPosCurrAndGoal[4];
    /*0x30*/ u8 filler30[12]; // extra unused Vec3f?
    /*0x3C*/ u8 modeActive;
    /*0x3D*/ u8 modeDefault;
    /*0x3E*/ u8 filler3E[10];
    /*0x48*/ float focusDistance; //unused
    /*0x4C*/ s16 pitch; //unused
    /*0x4E*/ s16 yaw;   //unused
    /*0x50*/ u8 filler50[2];
    /*0x52*/ Vec3s shakeMagnitude;
    /*0x58*/ s16 shakePitchOffset;
    /*0x5A*/ s16 shakePitchIncrement;
    /*0x5C*/ s16 shakePitchMagIncrement;
    /*0x5E*/ u8 filler5E[2];
    /*0x60*/ Vec3f unk60;   //unused
    /*0x6C*/ Vec3s unk6C;   //unused
    /*0x72*/ u8 filler72[8];
    /*0x7A*/ s16 roll;
    /*0x7C*/ s16 trueYaw;
    /*0x7E*/ s16 storedYaw;
    /*0x80*/ Vec3f focus;
    /*0x8C*/ Vec3f pos;
    /*0x98*/ s16 shakeRollOffset;
    /*0x9A*/ s16 shakeRollIncrement;
    /*0x9C*/ s16 shakeRollMagIncrement;
    /*0x9E*/ s16 shakeYawOffset;
    /*0xA0*/ s16 shakeYawIncrement;
    /*0xA2*/ s16 shakeYawMagIncrement;
    /*0xA4*/ float unkA4;
    /*0xA8*/ float unkA8;
    /*0xAC*/ float unkAC;
    /*0xB0*/ float unkB0;
    /*0xB4*/ s16 cameraKeyCutsceneRollOffset;
    /*0xB8*/ u32 lastFrameAction;
    /*0xBC*/ s16 unkBC;
};

// bss order hack to not affect BSS order. if possible, remove me, but it will be hard to match otherwise
#ifndef INCLUDED_FROM_CAMERA_C
// BSS
extern struct CameraPlayerStatus gPlayerStatusForCamera[2];
extern s16 gCameraModeFlags;
extern s16 sCameraSideCFlags;
extern s16 gCameraFlags1;
extern u16 gCButtonsPressed;
extern struct CameraState gCameraStatus;
extern s16 gCameraMovementFlags;
extern s32 gCutsceneActive;
extern struct LevelCamera *gCurrLevelCamera;
#endif

extern struct Object *gCutsceneFocus;
extern struct Object *gSecondCameraFocus;

// TODO: sort all of this extremely messy shit out after the split
// TODO: bring in some externs from camera.c

extern Vec3f sFixedPresetBasePosition;
extern u8 D_8032D0B8[];

extern void set_camera_shake(s16);
extern void set_camera_shake_2(s16);
extern void func_8027F440(s16, f32, f32, f32);
extern void operate_c_up_looking(struct LevelCamera *); // static (ASM)
extern void init_transitional_movement(UNUSED struct LevelCamera *, s16);
extern void func_80285BD8(struct LevelCamera *, s16, s16);
extern void update_camera(struct LevelCamera *);
extern void reset_camera(struct LevelCamera *);
extern void init_camera(struct LevelCamera *);
extern void select_mario_cam_mode(void);
extern void dummy_802877D8(struct LevelCamera *);
extern void dummy_802877EC(struct LevelCamera *);
extern void vec3f_sub(Vec3f, Vec3f);
extern void object_pos_to_vec3f(Vec3f, struct Object *);
extern void vec3f_to_object_pos(struct Object *, Vec3f); // static (ASM)
extern s32 func_80287CFC(Vec3f, struct CinematicCameraTable[], s16 *, f32 *);
extern s32 select_or_activate_mario_cam(s32);
extern s32 test_or_set_mario_cam_active(s32);
extern void set_spline_values(u8);
extern void set_face_angle_from_spline(Vec3f, Vec3f);
extern s32 find_c_buttons_pressed(u16, u16, u16);
extern s32 update_camera_status(struct LevelCamera *);
extern s32 find_and_return_count_wall_collisions(Vec3f, f32, f32);
extern s32 clamp_pitch(Vec3f a, Vec3f b, s16 c, s16 d);
extern s32 is_within_100_units_of_mario(f32, f32, f32);
extern s32 set_or_approach_f32_exponential(f32 *, f32, f32);
extern s32 approach_f32_exponential_bool(f32 *, f32, f32);
extern f32 approach_f32_exponential(f32, f32, f32); // static (ASM)
extern s32 approach_s16_exponential_bool(s16 *, s16, s16);
extern s32 approach_s16_exponential(s16, s16, s16); // static (ASM)
extern void approach_vec3f_exponential(Vec3f, Vec3f, f32, f32, f32); // static (ASM)




extern void set_or_approach_vec3f_exponential(Vec3f, Vec3f, f32, f32, f32); // postdefined
// extern ? approach_vec3s_exponential(?);
extern s32 camera_approach_s16_symmetric_bool(s16 *a, s16 b, s16 c);
// extern ? camera_approach_s16_symmetric(?);
extern s32 set_or_approach_s16_symmetric(s16 *a, s16 b, s16 c); // postdefined
extern s32 camera_approach_f32_symmetric_bool(f32 *, f32, f32);
extern f32 camera_approach_f32_symmetric(f32, f32, f32);
void random_vec3s(Vec3s a, s16 b, s16 c, s16 d); // postdefined
// extern ? func_80289738(?);
extern s32 clamp_positions_and_find_yaw_angle(Vec3f, Vec3f, f32, f32, f32, f32);
// extern ? func_80289A98(?);
// extern ? is_pos_less_than_bounds(?);
// extern ? is_behind_surface(?);
extern s32 func_8028A0D4(Vec3f a, Vec3f b, struct Surface *c, s16 d, s16 e);
// extern ? is_mario_behind_surface(?);
extern void scale_along_line(Vec3f, Vec3f, Vec3f, f32);
// extern ? check_if_vector_fits_in_bounds(?);
extern s16 calculate_verticle_angle(Vec3f, Vec3f);
extern s16 calculate_yaw(Vec3f, Vec3f);
extern void calculate_angles(Vec3f, Vec3f, s16 *, s16 *);
extern f32 calc_abs_dist(Vec3f, Vec3f);
extern f32 calc_hor_dist(Vec3f, Vec3f);
extern void rotate_in_xz(Vec3f, Vec3f, s16);
extern void rotate_in_yz(Vec3f, Vec3f, s16);
extern void set_camera_pitch_shake(s16, s16, s16);
extern void set_camera_yaw_shake(s16, s16, s16);
extern void set_camera_roll_shake(s16, s16, s16);
extern void func_8028AA80(s16, s16, s16, f32, f32, f32, f32);
// extern ? Unknown8028AB34(?);
// extern ? increment_shake_offset(?);
extern void shake_camera_pitch(); // postdefined
extern void shake_camera_yaw(); // postdefined
extern void shake_camera_roll(s16 *); // postdefined
extern s32 func_8028AF24(struct LevelCamera *a, s16 b);
// extern ? func_8028B13C(?);
// extern ? func_8028B16C(?);
extern void play_camera_buzz_if_cdown(void);
extern void play_camera_buzz_if_cbutton(void);
extern void play_camera_buzz_if_c_sideways(void);
extern void play_sound_cbutton_up(void);
extern void play_sound_cbutton_down(void);
extern void play_sound_cbutton_side(void);
extern void play_sound_button_change_blocked(void); // postdefined
extern void play_sound_rbutton_changed(void); // postdefined
extern void func_8028B36C(void); // postdefined
extern s32 func_8028B3DC(struct LevelCamera *a, f32 b);
extern s32 stop_mario(s32);
extern void handle_c_button_movement(struct LevelCamera *);
// extern ? func_8028BA38(?);
extern void set_camera_cutscene_table(struct LevelCamera *a, u8 b); // postdefined
// extern ? determine_star_fadeout_cutscene_table(?);
// extern ? return_table_door_push_or_pull(?);
extern u8 return_cutscene_table(); // postdefined
extern void instant_warp_camera_update(f32, f32, f32);
extern void approach_camera_height(struct LevelCamera *, f32, f32);
// extern ? Unknown8028C3AC(?);
// extern ? set_focus_position(?);
// extern ? Unknown8028C508(?);
extern void set_pos_from_face_angle_and_vec3f(Vec3f, Vec3f, Vec3f, Vec3s);
// extern ? set_pos_from_face_angle_and_rel_coords(?);
// extern ? determine_pushing_or_pulling_door(?);
s16 func_8028C824(Vec3f a, Vec3f b, Vec3f c, Vec3f d, Vec3f e, Vec3f f, s16 g); // postdefined
// extern ? Unknown8028CE1C(?);
// extern ? set_camera_preset_fixed_ref_point(?);
// extern ? set_camera_preset_platform_level(?);
// extern ? set_camera_preset_boss_fight(?);
// extern ? set_camera_preset_close_cam(?);
// extern ? set_camera_preset_open_camera(?);
// extern ? parallel_tracking_init(?);
extern void set_fixed_cam_axis_sa_lobby(s16 preset); // postdefined
// extern ? func_8028D32C(?);
// extern ? CameraRR00(?);
// extern ? CameraRR04(?);
// extern ? CameraRR02(?);
// extern ? CameraRR0305(?);
// extern ? CameraRR01(?);
// extern ? CameraCotMC00(?);
// extern ? CameraSL00(?);
// extern ? camera_change_set_free_roam_mode(?);
// extern ? camera_change_hmc_maze_entrance(?);
// extern ? CameraHMC02(?);
// extern ? CameraHMC03(?);
// extern ? CameraHMC04(?);
// extern ? CameraHMC05(?);
// extern ? CameraSSL00(?);
// extern ? CameraSSL0102(?);
// extern ? CameraSSL03(?);
// extern ? CameraTHI00(?);
// extern ? CameraTHI01(?);
// extern ? CameraRR07(?);
// extern ? CameraRR08(?);
// extern ? camera_change_hmc_cotmc_pool_entry(?);
// extern ? CameraInside20(?);
// extern ? CameraInside1E(?);
// extern ? CameraInside1F(?);
// extern ? CameraInside01(?);
// extern ? CameraInside1213(?);
// extern ? CameraUnused(?);
// extern ? CameraInside00(?);
// extern ? CameraInside0E(?);
// extern ? CameraInside0F(?);
// extern ? bbh_room_6_camera(?);
// extern ? CameraBBH24(?);
// extern ? CameraBBH2E2F(?);
// extern ? bbh_room_1_camera(?);
// extern ? CameraBBH01(?);
// extern ? bbh_room_2_lower_camera(?);
// extern ? bbh_room_4_camera(?);
// extern ? bbh_room_8_camera(?);
// extern ? bbh_room_5_library_camera(?);
// extern ? bbh_room_5_library_to_hidden_transition(?);
// extern ? bbh_room_5_hidden_to_library_transition(?);
// extern ? bbh_room_5_hidden_camera(?);
// extern ? bbh_room_3_camera(?);
// extern ? bbh_room_7_mr_i_camera(?);
// extern ? bbh_room_7_mr_i_to_coffins_transition(?);
// extern ? bbh_room_7_coffins_to_mr_i_transition(?);
// extern ? CameraBBH3033(?);
// extern ? CameraBBH34(?);
// extern ? CameraBBH38(?);
// extern ? bbh_room_12_upper_camera(?);
// extern ? CameraBBH00(?);
// extern ? bbh_room_2_library_camera(?);
// extern ? bbh_room_2_library_to_trapdoor_transition(?);
// extern ? bbh_room_2_trapdoor_camera(?);
// extern ? bbh_room_2_trapdoor_transition(?);
// extern ? bbh_room_9_attic_camera(?);
// extern ? bbh_room_9_attic_transition(?);
// extern ? bbh_room_9_mr_i_transition(?);
// extern ? bbh_room_13_balcony_camera(?);
// extern ? bbh_room_0_camera(?);
// extern ? camera_change_activate_ccm_slide_flag(?);
// extern ? camera_change_deactivate_ccm_slide_flag(?);
// extern ? surface_type_presets(?);
// extern ? set_preset_via_surface_or_input(?);
// extern ? surface_type_presets_thi(?);
extern s16 level_specific_camera_update(struct LevelCamera *); // postdefined
extern void resolve_geometry_collisions(Vec3f, Vec3f);
extern s32 func_8028F2F0(struct LevelCamera *, Vec3f, s16 *, s16);
extern void find_mario_relative_geometry(struct PlayerGeometry *); // postdefined
// extern ? func_8028F800(?);
extern u8 func_8028F834(u8);
extern s16 func_8028F8E0(u8, struct Object *, s16);
extern s16 func_8028F9A4(u8, struct Object *);
extern s16 func_8028F9E8(u8, struct Object *);
// extern ? set_cam_yaw_from_focus_and_pos(?);
// extern ? func_8028FABC(?);
// extern ? func_8028FAE0(?);
// extern ? cap_switch_save(?);
// extern ? func_8028FB80(?);
// extern ? func_8028FBD8(?);
// extern ? func_8028FD94(?);
// extern ? Unknown8028FDE8(?);
// extern ? Cutscene26Todo_0(?);
// extern ? Unknown8028FE50(?);
// extern ? CutsceneIntroPeach0_2(?);
// extern ? CutsceneIntroPeach2_1(?);
// extern ? func_8028FEDC(?);
// extern ? move_credits_camera(?);
// extern ? func_80290144(?);
// extern ? func_802901B4(?);
// extern ? func_80290224(?);
// extern ? func_802902A8(?);
// extern ? unused_vec3s_to_vec3f(?);
// extern ? unused_vec3f_to_vec3s(?);
// extern ? rotate_camera(?);
// extern ? CutsceneEnterSomething8029041C(?);
// extern ? Unknown80290450(?);
// extern ? rotate_and_move_vec3f(?);
// extern ? func_80290514(?);
// extern ? func_80290564(?);
// extern ? func_80290598(?);
// extern ? Unknown802905C8(?);
// extern ? Cutscene0FTodo_0(?);
// extern ? Cutscene0FTodo_1(?);
// extern ? CutscenePeachEnd80290604(?);
// extern ? CutscenePeachEnd8029065C(?);
// extern ? CutscenePeachEnd0(?);
// extern ? CutscenePeachEnd2(?);
// extern ? CutscenePeachEnd367_1(?);
// extern ? CutscenePeachEnd80290870(?);
// extern ? CutscenePeachEnd3(?);
// extern ? CutscenePeachEnd1(?);
// extern ? CutscenePeachEnd80290A34(?);
// extern ? CutscenePeachEnd4(?);
// extern ? CutscenePeachEnd80290B88(?);
// extern ? CutscenePeachEnd80290BC8(?);
// extern ? CutscenePeachEnd80290C3C(?);
// extern ? CutscenePeachEnd80290C78(?);
// extern ? CutscenePeachEnd5(?);
// extern ? CutscenePeachEnd6(?);
// extern ? CutscenePeachEnd80290E8C(?);
// extern ? CutscenePeachEnd7(?);
// extern ? CutscenePeachEnd8(?);
// extern ? CutscenePeachEnd80291014(?);
// extern ? CutscenePeachEnd80291078(?);
// extern ? CutscenePeachEnd9(?);
// extern ? CutscenePeachEnd802911A4(?);
// extern ? CutscenePeachEnd8029120C(?);
// extern ? CutscenePeachEndA(?);
// extern ? CutscenePeachEndB(?);
// extern ? CutsceneGrandStar80291324(?);
// extern ? CutsceneGrandStar8029139C(?);
// extern ? CutsceneGrandStar80291474(?);
// extern ? CutsceneGrandStar802914D8(?);
// extern ? CutsceneGrandStar80291528(?);
// extern ? CutsceneGrandStar802915B4(?);
// extern ? CutsceneGrandStar802915FC(?);
// extern ? CutsceneGrandStar0(?);
// extern ? CutsceneGrandStar80291770(?);
// extern ? CutsceneGrandStar80291844(?);
// extern ? CutsceneGrandStar802918D8(?);
// extern ? CutsceneGrandStar802919F8(?);
// extern ? CutsceneGrandStar1(?);
// extern ? func_80291BBC(?);
// extern ? CutsceneDance80291C4C(?);
// extern ? CutsceneStarDance80291CE4(?);
// extern ? CutsceneStarDance80291D30(?);
// extern ? CutsceneStarDance80291D78(?);
// extern ? Unknown80291DC0(?);
// extern ? CutsceneStarDance80291DD4(?);
// extern ? CutsceneStarDance80291E0C(?);
// extern ? CutsceneStarDance80291E44(?);
// extern ? CutsceneStarDance1(?);
// extern ? func_80291FE8(?);
// extern ? CutsceneStarDance8029209C(?);
// extern ? CutsceneStarDance80292190(?);
// extern ? CutsceneStarDance80292228(?);
// extern ? CutsceneStarDance80292334(?);
// extern ? CutsceneStarDance802923E0(?);
// extern ? CutsceneStarDance8029240C(?);
// extern ? CutsceneStarDance3(?);
// extern ? CutsceneStarDance802925C0(?);
// extern ? CutsceneStarDance80292740(?);
// extern ? CutsceneStarDance802927EC(?);
// extern ? func_80292884(?);
// extern ? CutsceneStarDance80292900(?);
// extern ? CutsceneStarDance80292958(?);
// extern ? CutsceneStarDance802929A4(?);
// extern ? CutsceneStarDance2(?);
// extern ? CutsceneKeyDance80292AB0(?);
// extern ? CutsceneKeyDance80292B24(?);
// extern ? CutsceneKeyDance80292B80(?);
// extern ? CutsceneKeyDance80292BE0(?);
// extern ? CutsceneKeyDance80292C4C(?);
// extern ? CutsceneKeyDance80292CB4(?);
// extern ? CutsceneKeyDance80292CE8(?);
// extern ? CutsceneKeyDance80292D14(?);
// extern ? CutsceneKeyDance(?);
// extern ? CutsceneEnterBowserPlatform80292E48(?);
// extern ? CutsceneEnterBowserPlatform80292E74(?);
// extern ? CutsceneEnterBowserPlatform80292E98(?);
// extern ? CutsceneEnterBowserPlatform80292F08(?);
// extern ? CutsceneEnterBowserPlatform80292FA0(?);
// extern ? CutsceneEnterBowserPlatform80292FE4(?);
// extern ? CutsceneEnterBowserPlatform8029305C(?);
// extern ? CutsceneEnterBowserPlatform8029309C(?);
// extern ? func_802930C8(?);
// extern ? CutsceneEnterBowserPlatform802930F4(?);
// extern ? CutsceneEnterBowserPlatform802931A8(?);
// extern ? CutsceneEnterBowserPlatform1(?);
// extern ? CutsceneEnterBowserPlatform2(?);
// extern ? CutsceneEnterBowserPlatform0(?);
// extern ? CutsceneStarSpawn8029347C(?);
// extern ? CutsceneStarSpawn802934A8(?);
// extern ? CutsceneStarSpawn80293530(?);
// extern ? CutsceneStarSpawn802935B4(?);
// extern ? CutsceneStarSpawn0(?);
// extern ? CutsceneStarSpawn1(?);
// extern ? CutsceneStarSpawn2(?);
// extern ? CutsceneExitWaterfall80293750(?);
// extern ? Cutscene80293794(?);
// extern ? CutsceneExitWaterfall0(?);
// extern ? CutsceneFallCommon1(?);
// extern ? CutsceneFallToCastleGrounds802938EC(?);
// extern ? CutsceneFallToCastleGrounds0(?);
// extern ? CutsceneSpecialStarSpawn8029398C(?);
// extern ? CutsceneSpecialStarSpawn802939E4(?);
// extern ? CutsceneSpecialStarSpawn80293A48(?);
// extern ? CutsceneSpecialStarSpawn80293A8C(?);
// extern ? CutsceneSpecialStarSpawn80293ACC(?);
// extern ? CutsceneSpecialStarSpawn80293C8C(?);
// extern ? CutsceneSpecialStarSpawn0(?);
// extern ? CutsceneSpecialStarSpawn1(?);
// extern ? func_80293DE8(?);
// extern ? CutscenePrepareCannon802940D8(?);
// extern ? CutscenePrepareCannon80294164(?);
// extern ? func_802941CC(?);
// extern ? CutscenePrepareCannon80294260(?);
// extern ? CutscenePrepareCannon0(?);
// extern ? CutscenePrepareCannon1(?);
// extern ? func_802944A8(?);
// extern ? func_80294538(?);
// extern ? CutsceneDeath80294574(?);
// extern ? CutsceneDeath802945E8(?);
// extern ? CutsceneDeath1(?);
// extern ? CutsceneDeath80294684(?);
// extern ? CutsceneDeath80294708(?);
// extern ? Unknown80294748(?);
// extern ? CutsceneDeath2(?);
// extern ? CutsceneBBHDeath802947E4(?);
// extern ? CutsceneBBHDeath80294868(?);
// extern ? CutsceneBBHDeath(?);
// extern ? CutsceneQuicksandDeath80294918(?);
// extern ? CutsceneQuicksandDeath80294954(?);
// extern ? CutsceneQuicksandDeath0(?);
// extern ? Cutscene1ATodo80294A70(?);
// extern ? Cutscene1ATodo80294B00(?);
// extern ? Cutscene1ATodo80294BB0(?);
// extern ? Cutscene1ATodo(?);
// extern ? CutsceneEnterPool80294CD0(?);
// extern ? CutsceneEnterPool80294D9C(?);
// extern ? CutsceneEnterPool0(?);
// extern ? Cutscene26Todo80294E40(?);
// extern ? Cutscene26Todo80294EAC(?);
// extern ? Cutscene26Todo80294ED8(?);
// extern ? Cutscene26Todo80294F40(?);
// extern ? Cutscene26Todo80295030(?);
// extern ? Cutscene26Todo80295100(?);
// extern ? Cutscene26Todo8029512C(?);
// extern ? Cutscene26Todo_1(?);
// extern ? Cutscene26Todo_2(?);
// extern ? CutsceneEnterPyramidTop80295294(?);
// extern ? CutsceneEnterPyramidTop0(?);
// extern ? Unknown8029538C(?);
// extern ? CutsceneDialog80295418(?);
// extern ? CutsceneDialog80295568(?);
// extern ? CutsceneDialog8029579C(?);
// extern ? CutsceneDialog0(?);
// extern ? CutsceneDialog1(?);
// extern ? CutsceneDialog2(?);
// extern ? CutsceneReadMessage80295998(?);
// extern ? Unknown80295A28(?);
// extern ? CutsceneReadMessage0(?);
// extern ? CutsceneReadMessage1(?);
// extern ? CutsceneReadMessage2(?);
// extern ? CutsceneExitSuccess1(?);
// extern ? CutsceneExitSuccess2(?);
// extern ? CutsceneExitSuccess4(?);
// extern ? CutsceneExitSuccess3(?);
// extern ? CutsceneExitBowserSuccess80296014(?);
// extern ? CutsceneExitSuccess5(?);
// extern ? CutsceneExitBowserSuccess0(?);
// extern ? CutsceneExitNonPainting1(?);
// extern ? CutsceneBBHExitSuccess02961D4(?);
// extern ? CutsceneBBHExitSuccess0(?);
// extern ? CutsceneNonPaintingDeath0_1(?);
// extern ? Cutscene1CTodo_0(?);
// extern ? CutsceneNonPaintingDeath0_2(?);
// extern ? CutsceneNonPaintingDeath0(?);
// extern ? CutsceneCapSwitchPress0_1(?);
// extern ? CutsceneCapSwitchPress0_4(?);
// extern ? CutsceneCapSwitchPress0_5(?);
// extern ? CutsceneCapSwitchPress0_2(?);
// extern ? CutsceneCapSwitchPress0_3(?);
// extern ? CutsceneCapSwitchPress0_6(?);
// extern ? Unknown802968E8(?);
// extern ? CutsceneCapSwitchPress(?);
// extern ? CutsceneUnlockKeyDoor80296AC0(?);
// extern ? CutsceneUnlockKeyDoor80296B84(?);
// extern ? CutsceneUnlockKeyDoor80296C08(?);
// extern ? CutsceneUnlockKeyDoor80296C64(?);
// extern ? CutsceneUnlockKeyDoor80296C78(?);
// extern ? CutsceneUnlockKeyDoor80296CFC(?);
// extern ? CutsceneUnlockKeyDoor0(?);
// extern ? func_80296DDC(?);
// extern ? peach_letter_text(?);
// extern ? CutsceneIntroPeachCommon(?);
// extern ? CutsceneIntroPeach4(?);
// extern ? CutsceneIntroPeach3_2(?);
// extern ? CutsceneIntroPeach2_2(?);
// extern ? CutsceneIntroPeach0_1(?);
// extern ? CutsceneIntroPeach3_1(?);
// extern ? CutsceneIntroPeach3_3(?);
// extern ? intro_pipe_exit_text(?);
// extern ? CutsceneIntroPeach2(?);
// extern ? CutsceneIntroPeach3(?);
// extern ? CutsceneIntroPeach1(?);
// extern ? CutsceneIntroPeach0(?);
// extern ? CutsceneEndWaving0_1(?);
// extern ? CutsceneEndWaving0(?);
// extern ? CutsceneCredits0_1(?);
// extern ? CutsceneCredits0(?);
// extern ? CutsceneSlidingDoorsOpen0_1(?);
// extern ? CutsceneSlidingDoorsOpen0_2(?);
// extern ? CutsceneSlidingDoorsOpen0_3(?);
// extern ? CutsceneSlidingDoorsOpen0_4(?);
// extern ? CutsceneSlidingDoorsOpen0_5(?);
// extern ? CutsceneSlidingDoorsOpen0(?);
// extern ? CutsceneDoubleDoorsOpen1(?);
// extern ? CutsceneEnterPainting0_1(?);
// extern ? CutsceneEnterPainting0(?);
// extern ? CutsceneExitPainting80298094(?);
// extern ? CutsceneExitPainting80298230(?);
// extern ? CutsceneExitPainting802982CC(?);
// extern ? CutsceneExitPainting0(?);
// extern ? Cutscene11Todo_0(?);
// extern ? Cutscene11Todo_1(?);
// extern ? CutsceneExitPainting1(?);
// extern ? CutsceneEnterCannon2(?);
// extern ? CutsceneEnterCannon1(?);
// extern ? CutsceneEnterCannon0(?);
// extern ? CutsceneDoor0(?);
// extern ? CutsceneDoor1(?);
// extern ? CutsceneDoorWarp1(?);
// extern ? CutsceneDoor2(?);
// extern ? CutsceneDoor3(?);
// extern ? CutsceneDoor4(?);
// extern ? CutsceneDoorAB_2(?);
extern void handle_cutscenes(struct LevelCamera *);
extern s32 call_cutscene_func_in_time_range(CameraCommandProc, struct LevelCamera *, s16, s16);
extern s32 func_80299C60(s32, s16);
extern void func_80299C98(s16, s16, s16);
// extern ? func_80299D00(?);

extern void set_fov_function(u8);
extern void func_8029A494(u8);
extern void func_8029A514(u8, f32, f32, f32);
// extern ? Unknown8029A664(?);
// extern ? Unknown8029A724(?);
extern void func_8029A7DC(struct Object *, Vec3f, s16, s16, s16, s16);
// extern ? func_8029A87C(?);
// extern ? bhv_intro_peach_loop(?);
// extern ? func_8029AB70(?);
// extern ? func_8029AC3C(?);
// extern ? func_8029ACAC(?);
// extern ? bhv_intro_lakitu_loop(?);
// extern ? bhv_end_birds_1_loop(?);
// extern ? bhv_end_birds_2_loop(?);
// extern ? func_8029B964(?);
// extern ? bhv_intro_scene_loop(?);

#endif /* _CAMERA_H */
