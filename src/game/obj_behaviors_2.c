#include <ultra64.h>

#include "sm64.h"
#include "prevent_bss_reordering.h"
#include "behavior_actions.h"
#include "engine/behavior_script.h"
#include "camera.h"
#include "display.h"
#include "engine/math_util.h"
#include "object_helpers.h"
#include "mario_actions_cutscene.h"
#include "behavior_data.h"
#include "mario.h"
#include "engine/surface_collision.h"
#include "obj_behaviors_2.h"
#include "audio/external.h"
#include "seq_ids.h"
#include "level_update.h"
#include "memory.h"
#include "platform_displacement.h"
#include "rendering_graph_node.h"
#include "engine/surface_load.h"
#include "obj_behaviors.h"
#include "object_constants.h"
#include "interaction.h"
#include "object_list_processor.h"
#include "spawn_sound.h"
#include "geo_misc.h"
#include "save_file.h"
#include "room.h"

extern u32 wiggler_seg5_anims_0500C874[];
extern u32 spiny_egg_seg5_anims_050157E4[];
extern struct ObjectNode *gObjectLists;
extern u8 jrb_seg7_trajectory_unagi_1[];
extern u8 jrb_seg7_trajectory_unagi_2[];
extern u8 dorrie_seg6_collision_0600FBB8[];
extern u8 dorrie_seg6_collision_0600F644[];
extern u8 ssl_seg7_collision_070284B0[];
extern u8 ssl_seg7_collision_07028274[];
extern u8 ssl_seg7_collision_07028370[];
extern u8 ssl_seg7_collision_070282F8[];
extern u8 ccm_seg7_trajectory_penguin_race[];
extern u8 bob_seg7_trajectory_koopa[];
extern u8 thi_seg7_trajectory_koopa[];
extern u8 rr_seg7_collision_07029038[];
extern u8 ccm_seg7_collision_070163F8[];
extern u8 checkerboard_platform_seg8_collision_0800D710[];
extern u8 bitfs_seg7_collision_070157E0[];
extern u8 rr_seg7_trajectory_0702EC3C[];
extern u8 rr_seg7_trajectory_0702ECC0[];
extern u8 ccm_seg7_trajectory_0701669C[];
extern u8 bitfs_seg7_trajectory_070159AC[];
extern u8 hmc_seg7_trajectory_0702B86C[];
extern u8 lll_seg7_trajectory_0702856C[];
extern u8 lll_seg7_trajectory_07028660[];
extern u8 rr_seg7_trajectory_0702ED9C[];
extern u8 rr_seg7_trajectory_0702EEE0[];
extern u8 bitdw_seg7_collision_0700F70C[];
extern u8 bits_seg7_collision_0701ADD8[];
extern u8 bits_seg7_collision_0701AE5C[];
extern u8 bob_seg7_collision_bridge[];
extern u8 bitfs_seg7_collision_07015928[];
extern u8 rr_seg7_collision_07029750[];
extern u8 rr_seg7_collision_07029858[];
extern u8 vcutm_seg7_collision_0700AC44[];
extern u8 bits_seg7_collision_0701ACAC[];
extern u8 bits_seg7_collision_0701AC28[];
extern u8 bitdw_seg7_collision_0700F7F0[];
extern u8 bitdw_seg7_collision_0700F898[];
extern u8 ttc_seg7_collision_07014F70[];
extern u8 ttc_seg7_collision_07015008[];
extern u8 ttc_seg7_collision_070152B4[];
extern u8 ttc_seg7_collision_070153E0[];
extern u8 ttc_seg7_collision_07015584[];
extern u8 ttc_seg7_collision_07015650[];
extern u8 ttc_seg7_collision_07015754[];
extern u8 ttc_seg7_collision_070157D8[];
extern u8 bits_seg7_collision_0701A9A0[];
extern u8 bits_seg7_collision_0701AA0C[];
extern u8 bitfs_seg7_collision_07015714[];
extern u8 bitfs_seg7_collision_07015768[];
extern u8 rr_seg7_collision_070295F8[];
extern u8 rr_seg7_collision_0702967C[];
extern u8 bitdw_seg7_collision_0700F688[];
extern u8 bits_seg7_collision_0701AA84[];
extern u8 rr_seg7_collision_07029508[];
extern u8 bits_seg7_collision_0701B734[];
extern u8 bits_seg7_collision_0701B59C[];
extern u8 bits_seg7_collision_0701B404[];
extern u8 bits_seg7_collision_0701B26C[];
extern u8 bits_seg7_collision_0701B0D4[];
extern u8 bitdw_seg7_collision_0700FD9C[];
extern u8 bitdw_seg7_collision_0700FC7C[];
extern u8 bitdw_seg7_collision_0700FB5C[];
extern u8 bitdw_seg7_collision_0700FA3C[];
extern u8 bitdw_seg7_collision_0700F91C[];
extern u8 rr_seg7_collision_0702A6B4[];
extern u8 rr_seg7_collision_0702A32C[];
extern u8 rr_seg7_collision_07029FA4[];
extern u8 rr_seg7_collision_07029C1C[];
extern u8 rr_seg7_collision_07029924[];
extern u8 bits_seg7_collision_0701AD54[];
extern u8 bitfs_seg7_collision_070157E0[];
extern u8 bitfs_seg7_collision_07015124[];
extern u32 spiny_seg5_anims_05016EAC[];

#define POS_OP_SAVE_POSITION 0
#define POS_OP_COMPUTE_VELOCITY 1
#define POS_OP_RESTORE_POSITION 2

#define o gCurrentObject

f32 sObjSavedPosX;
f32 sObjSavedPosY;
f32 sObjSavedPosZ;

void shelled_koopa_attack_handler(s32 attackType);
void wiggler_jumped_on_attack_handler(void);
void huge_goomba_weakly_attacked(void);

static s32 obj_is_rendering_enabled(void) {
    if (o->header.gfx.node.flags & GRAPH_RENDER_ACTIVE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

static s16 obj_get_pitch_from_vel(void) {
    return -atan2s(o->oForwardVel, o->oVelY);
}

/**
 * Show dialog proposing a race.
 * If the player accepts the race, then leave time stop enabled and mario in the
 * text action so that the racing object can wait before starting the race.
 * If the player declines the race, then disable time stop and allow mario to
 * move again.
 */
static s32 obj_update_race_proposition_dialog(s16 arg0) {
    s32 dialogResponse =
        obj_update_dialog_unk2(2, DIALOG_UNK2_FLAG_0 | DIALOG_UNK2_LEAVE_TIME_STOP_ENABLED, 0xA3, arg0);

    if (dialogResponse == 2) {
        set_mario_npc_dialog(0);
        disable_time_stop_including_mario();
    }

    return dialogResponse;
}

static void obj_set_dist_from_home(f32 distFromHome) {
    o->oPosX = o->oHomeX + distFromHome * coss(o->oMoveAngleYaw);
    o->oPosZ = o->oHomeZ + distFromHome * sins(o->oMoveAngleYaw);
}

static s32 obj_is_near_to_and_facing_mario(f32 maxDist, s16 maxAngleDiff) {
    if (o->oDistanceToMario < maxDist
        && abs_angle_diff(o->oMoveAngleYaw, o->oAngleToMario) < maxAngleDiff) {
        return TRUE;
    }
    return FALSE;
}

static void obj_perform_position_op(s32 op) {
    switch (op) {
        case POS_OP_SAVE_POSITION:
            sObjSavedPosX = o->oPosX;
            sObjSavedPosY = o->oPosY;
            sObjSavedPosZ = o->oPosZ;
            break;

        case POS_OP_COMPUTE_VELOCITY:
            o->oVelX = o->oPosX - sObjSavedPosX;
            o->oVelY = o->oPosY - sObjSavedPosY;
            o->oVelZ = o->oPosZ - sObjSavedPosZ;
            break;

        case POS_OP_RESTORE_POSITION:
            o->oPosX = sObjSavedPosX;
            o->oPosY = sObjSavedPosY;
            o->oPosZ = sObjSavedPosZ;
            break;
    }
}

static void platform_on_track_update_pos_or_spawn_ball(s32 ballIndex, f32 x, f32 y, f32 z) {
    struct Object *trackBall;
    struct Waypoint *initialPrevWaypoint;
    struct Waypoint *nextWaypoint;
    struct Waypoint *prevWaypoint;
    UNUSED s32 unused;
    f32 amountToMove;
    f32 dx;
    f32 dy;
    f32 dz;
    f32 distToNextWaypoint;

    if (ballIndex == 0 || ((u16)(o->oBehParams >> 16) & 0x0080)) {
        initialPrevWaypoint = o->oPlatformOnTrackPrevWaypoint;
        nextWaypoint = initialPrevWaypoint;

        if (ballIndex != 0) {
            amountToMove = 300.0f * ballIndex;
        } else {
            obj_perform_position_op(POS_OP_SAVE_POSITION);
            o->oPlatformOnTrackPrevWaypointFlags = 0;
            amountToMove = o->oForwardVel;
        }

        do {
            prevWaypoint = nextWaypoint;

            nextWaypoint += 1;
            if (nextWaypoint->flags == WAYPOINT_FLAGS_END) {
                if (ballIndex == 0) {
                    o->oPlatformOnTrackPrevWaypointFlags = WAYPOINT_FLAGS_END;
                }

                if (((u16)(o->oBehParams >> 16) & PLATFORM_ON_TRACK_BP_RETURN_TO_START)) {
                    nextWaypoint = o->oPlatformOnTrackStartWaypoint;
                } else {
                    return;
                }
            }

            dx = nextWaypoint->pos[0] - x;
            dy = nextWaypoint->pos[1] - y;
            dz = nextWaypoint->pos[2] - z;

            distToNextWaypoint = sqrtf(dx * dx + dy * dy + dz * dz);

            // Move directly to the next waypoint, even if it's farther away
            // than amountToMove
            amountToMove -= distToNextWaypoint;
            x += dx;
            y += dy;
            z += dz;
        } while (amountToMove > 0.0f);

        // If we moved farther than amountToMove, move in the opposite direction
        // No risk of near-zero division: If distToNextWaypoint is close to
        // zero, then that means we didn't cross a waypoint this frame (since
        // otherwise distToNextWaypoint would equal the distance between two
        // waypoints, which should never be that small). But this implies that
        // amountToMove - distToNextWaypoint <= 0, and amountToMove is at least
        // 0.1 (from platform on track behavior).
        distToNextWaypoint = amountToMove / distToNextWaypoint;
        x += dx * distToNextWaypoint;
        y += dy * distToNextWaypoint;
        z += dz * distToNextWaypoint;

        if (ballIndex != 0) {
            trackBall = spawn_object_relative(o->oPlatformOnTrackBaseBallIndex + ballIndex, 0, 0, 0, o,
                                              MODEL_TRAJECTORY_MARKER_BALL, bhvTrackBall);

            if (trackBall != NULL) {
                trackBall->oPosX = x;
                trackBall->oPosY = y;
                trackBall->oPosZ = z;
            }
        } else {
            if (prevWaypoint != initialPrevWaypoint) {
                if (o->oPlatformOnTrackPrevWaypointFlags == 0) {
                    o->oPlatformOnTrackPrevWaypointFlags = initialPrevWaypoint->flags;
                }
                o->oPlatformOnTrackPrevWaypoint = prevWaypoint;
            }

            o->oPosX = x;
            o->oPosY = y;
            o->oPosZ = z;

            obj_perform_position_op(POS_OP_COMPUTE_VELOCITY);

            o->oPlatformOnTrackPitch =
                atan2s(sqrtf(o->oVelX * o->oVelX + o->oVelZ * o->oVelZ), -o->oVelY);
            o->oPlatformOnTrackYaw = atan2s(o->oVelZ, o->oVelX);
        }
    }
}

static void func_802F8D78(f32 arg0, f32 arg1) {
    f32 val24;
    f32 val20;
    f32 val1C;
    f32 c;
    f32 s;
    f32 val10;
    f32 val0C;
    f32 val08;
    f32 val04;
    f32 val00;

    if (o->oForwardVel == 0.0f) {
        val24 = val20 = val1C = 0.0f;

        if (o->oMoveFlags & OBJ_MOVE_IN_AIR) {
            val20 = 50.0f;
        } else {
            if (o->oFaceAnglePitch < 0) {
                val1C = -arg0;
            } else if (o->oFaceAnglePitch > 0) {
                val1C = arg0;
            }

            if (o->oFaceAngleRoll < 0) {
                val24 = -arg1;
            } else if (o->oFaceAngleRoll > 0) {
                val24 = arg1;
            }
        }

        c = coss(o->oFaceAnglePitch);
        s = sins(o->oFaceAnglePitch);
        val08 = val1C * c + val20 * s;
        val0C = val20 * c - val1C * s;

        c = coss(o->oFaceAngleRoll);
        s = sins(o->oFaceAngleRoll);
        val04 = val24 * c + val0C * s;
        val0C = val0C * c - val24 * s;

        c = coss(o->oFaceAngleYaw);
        s = sins(o->oFaceAngleYaw);
        val10 = val04 * c - val08 * s;
        val08 = val08 * c + val04 * s;

        val04 = val24 * c - val1C * s;
        val00 = val1C * c + val24 * s;

        o->oPosX = o->oHomeX - val04 + val10;
        o->oGraphYOffset = val20 - val0C;
        o->oPosZ = o->oHomeZ + val00 - val08;
    }
}

static void obj_rotate_yaw_and_bounce_off_walls(s16 targetYaw, s16 turnAmount) {
    if (o->oMoveFlags & OBJ_MOVE_HIT_WALL) {
        targetYaw = obj_reflect_move_angle_off_wall();
    }
    obj_rotate_yaw_toward(targetYaw, turnAmount);
}

static s16 obj_get_pitch_to_home(f32 latDistToHome) {
    return atan2s(latDistToHome, o->oPosY - o->oHomeY);
}

static void obj_compute_vel_from_move_pitch(f32 speed) {
    o->oForwardVel = speed * coss(o->oMoveAnglePitch);
    o->oVelY = speed * -sins(o->oMoveAnglePitch);
}

static s32 clamp_s16(s16 *value, s16 minimum, s16 maximum) {
    if (*value <= minimum) {
        *value = minimum;
    } else if (*value >= maximum) {
        *value = maximum;
    } else {
        return FALSE;
    }

    return TRUE;
}

static s32 clamp_f32(f32 *value, f32 minimum, f32 maximum) {
    if (*value <= minimum) {
        *value = minimum;
    } else if (*value >= maximum) {
        *value = maximum;
    } else {
        return FALSE;
    }

    return TRUE;
}

static void func_802F927C(s32 arg0) {
    set_obj_animation_and_sound_state(arg0);
    func_8029F728();
}

static s32 func_802F92B0(s32 arg0) {
    set_obj_animation_and_sound_state(arg0);
    return func_8029F788();
}

static s32 func_802F92EC(s32 arg0, s32 arg1) {
    set_obj_animation_and_sound_state(arg0);
    return obj_check_anim_frame(arg1);
}

static s32 func_802F932C(s32 arg0) {
    if (func_8029F828()) {
        set_obj_animation_and_sound_state(arg0);
        return TRUE;
    }
    return FALSE;
}

static s32 func_802F9378(s8 arg0, s8 arg1, u32 sound) {
    s32 val04;

    if ((val04 = o->header.gfx.unk38.animAccel / 0x10000) <= 0) {
        val04 = 1;
    }

    if (obj_check_anim_frame_in_range(arg0, val04) || obj_check_anim_frame_in_range(arg1, val04)) {
        PlaySound2(sound);
        return TRUE;
    }

    return FALSE;
}

static s16 obj_turn_pitch_toward_mario(f32 targetOffsetY, s16 turnAmount) {
    s16 targetPitch;

    o->oPosY -= targetOffsetY;
    targetPitch = obj_turn_toward_object(o, gMarioObject, O_MOVE_ANGLE_PITCH_INDEX, turnAmount);
    o->oPosY += targetOffsetY;

    return targetPitch;
}

static s32 approach_f32_ptr(f32 *px, f32 target, f32 delta) {
    if (*px > target) {
        delta = -delta;
    }

    *px += delta;

    if ((*px - target) * delta >= 0) {
        *px = target;
        return TRUE;
    }
    return FALSE;
}

static s32 obj_forward_vel_approach(f32 target, f32 delta) {
    return approach_f32_ptr(&o->oForwardVel, target, delta);
}

static s32 obj_y_vel_approach(f32 target, f32 delta) {
    return approach_f32_ptr(&o->oVelY, target, delta);
}

static s32 obj_move_pitch_approach(s16 target, s16 delta) {
    o->oMoveAnglePitch = approach_s16_symmetric(o->oMoveAnglePitch, target, delta);

    if ((s16) o->oMoveAnglePitch == target) {
        return TRUE;
    }

    return FALSE;
}

static s32 obj_face_pitch_approach(s16 targetPitch, s16 deltaPitch) {
    o->oFaceAnglePitch = approach_s16_symmetric(o->oFaceAnglePitch, targetPitch, deltaPitch);

    if ((s16) o->oFaceAnglePitch == targetPitch) {
        return TRUE;
    }

    return FALSE;
}

static s32 obj_face_yaw_approach(s16 targetYaw, s16 deltaYaw) {
    o->oFaceAngleYaw = approach_s16_symmetric(o->oFaceAngleYaw, targetYaw, deltaYaw);

    if ((s16) o->oFaceAngleYaw == targetYaw) {
        return TRUE;
    }

    return FALSE;
}

static s32 obj_face_roll_approach(s16 targetRoll, s16 deltaRoll) {
    o->oFaceAngleRoll = approach_s16_symmetric(o->oFaceAngleRoll, targetRoll, deltaRoll);

    if ((s16) o->oFaceAngleRoll == targetRoll) {
        return TRUE;
    }

    return FALSE;
}

static s32 obj_smooth_turn(s16 *angleVel, s32 *angle, s16 targetAngle, f32 targetSpeedProportion,
                           s16 accel, s16 minSpeed, s16 maxSpeed) {
    s16 currentSpeed;
    s16 currentAngle = (s16)(*angle);

    *angleVel =
        approach_s16_symmetric(*angleVel, (targetAngle - currentAngle) * targetSpeedProportion, accel);

    currentSpeed = absi(*angleVel);
    clamp_s16(&currentSpeed, minSpeed, maxSpeed);

    *angle = approach_s16_symmetric(*angle, targetAngle, currentSpeed);
    return (s16)(*angle) == targetAngle;
}

static void obj_roll_to_match_yaw_turn(s16 targetYaw, s16 maxRoll, s16 rollSpeed) {
    s16 targetRoll = o->oMoveAngleYaw - targetYaw;
    clamp_s16(&targetRoll, -maxRoll, maxRoll);
    obj_face_roll_approach(targetRoll, rollSpeed);
}

static s16 random_linear_offset(s16 base, s16 range) {
    return base + (s16)(range * RandomFloat());
}

static s16 random_mod_offset(s16 base, s16 step, s16 mod) {
    return base + step * (RandomU16() % mod);
}

static s16 obj_random_fixed_turn(s16 delta) {
    return o->oMoveAngleYaw + (s16) RandomSign() * delta;
}

/**
 * Begin by increasing the object's scale by *scaleVel, and slowly decreasing
 * scaleVel. Once the object starts to shrink, wait a bit, and then begin to
 * scale the object toward endScale. The first time it reaches below
 * shootFireScale during this time, return 1.
 * Return -1 once it's reached endScale.
 */
static s32 obj_grow_then_shrink(f32 *scaleVel, f32 shootFireScale, f32 endScale) {
    if (o->oTimer < 2) {
        o->header.gfx.scale[0] += *scaleVel;

        if ((*scaleVel -= 0.01f) > -0.03f) {
            o->oTimer = 0;
        }
    } else if (o->oTimer > 10) {
        if (approach_f32_ptr(&o->header.gfx.scale[0], endScale, 0.05f)) {
            return -1;
        } else if (*scaleVel != 0.0f && o->header.gfx.scale[0] < shootFireScale) {
            *scaleVel = 0.0f;
            return 1;
        }
    }

    return 0;
}

static s32 oscillate_toward(s32 *value, f32 *vel, s32 target, f32 velCloseToZero, f32 accel,
                            f32 slowdown) {
    s32 startValue = *value;
    *value += (s32) *vel;

    if (*value == target
        || ((*value - target) * (startValue - target) < 0 && *vel > -velCloseToZero
            && *vel < velCloseToZero)) {
        *value = target;
        *vel = 0.0f;
        return TRUE;
    } else {
        if (*value >= target) {
            accel = -accel;
        }
        if (*vel * accel < 0.0f) {
            accel *= slowdown;
        }

        *vel += accel;
    }

    return FALSE;
}

static void obj_update_blinking(s32 *blinkTimer, s16 baseCycleLength, s16 cycleLengthRange,
                                s16 blinkLength) {
    if (*blinkTimer != 0) {
        *blinkTimer -= 1;
    } else {
        *blinkTimer = random_linear_offset(baseCycleLength, cycleLengthRange);
    }

    if (*blinkTimer > blinkLength) {
        o->oAnimState = 0;
    } else {
        o->oAnimState = 1;
    }
}

static s32 obj_resolve_object_collisions(s32 *targetYaw) {
    struct Object *otherObject;
    f32 dx;
    f32 dz;
    s16 angle;
    f32 radius;
    f32 otherRadius;
    f32 relativeRadius;
    f32 newCenterX;
    f32 newCenterZ;

    if (o->numCollidedObjs != 0) {
        otherObject = o->collidedObjs[0];
        if (otherObject != gMarioObject) {
            //! If one object moves after collisions are detected and this code
            //  runs, the objects can move toward each other (transport cloning)

            dx = otherObject->oPosX - o->oPosX;
            dz = otherObject->oPosZ - o->oPosZ;
            angle = atan2s(dx, dz); //! This should be atan2s(dz, dx)

            radius = o->hitboxRadius;
            otherRadius = otherObject->hitboxRadius;
            relativeRadius = radius / (radius + otherRadius);

            newCenterX = o->oPosX + dx * relativeRadius;
            newCenterZ = o->oPosZ + dz * relativeRadius;

            o->oPosX = newCenterX - radius * coss(angle);
            o->oPosZ = newCenterZ - radius * sins(angle);

            otherObject->oPosX = newCenterX + otherRadius * coss(angle);
            otherObject->oPosZ = newCenterZ + otherRadius * sins(angle);

            if (targetYaw != NULL && abs_angle_diff(o->oMoveAngleYaw, angle) < 0x4000) {
                // Bounce off object (or it would, if the above atan2s bug
                // were fixed)
                *targetYaw = (s16)(angle - o->oMoveAngleYaw + angle + 0x8000);
                return TRUE;
            }
        }
    }

    return FALSE;
}

static s32 obj_bounce_off_walls_edges_objects(s32 *targetYaw) {
    if (o->oMoveFlags & OBJ_MOVE_HIT_WALL) {
        *targetYaw = obj_reflect_move_angle_off_wall();
    } else if (o->oMoveFlags & OBJ_MOVE_HIT_EDGE) {
        *targetYaw = (s16)(o->oMoveAngleYaw + 0x8000);
    } else if (!obj_resolve_object_collisions(targetYaw)) {
        return FALSE;
    }

    return TRUE;
}

static s32 obj_resolve_collisions_and_turn(s16 targetYaw, s16 turnSpeed) {
    obj_resolve_object_collisions(NULL);

    if (obj_rotate_yaw_toward(targetYaw, turnSpeed)) {
        return FALSE;
    } else {
        return TRUE;
    }
}

static void obj_die_if_health_non_positive(void) {
    if (o->oHealth <= 0) {
        if (o->oDeathSound == 0) {
            func_802A3034(SOUND_OBJECT_DEFAULTDEATH);
        } else if (o->oDeathSound > 0) {
            func_802A3034(o->oDeathSound);
        } else {
            func_802A3004();
        }

        if (o->oNumLootCoins < 0) {
            spawn_object(o, MODEL_BLUE_COIN, bhvMrIBlueCoin);
        } else {
            spawn_object_loot_yellow_coins(o, o->oNumLootCoins, 20.0f);
        }
        // This doesn't do anything
        spawn_object_loot_yellow_coins(o, o->oNumLootCoins, 20.0f);

        if (o->oHealth < 0) {
            obj_hide();
            obj_become_intangible();
        } else {
            mark_object_for_deletion(o);
        }
    }
}

static void obj_unused_die(void) {
    o->oHealth = 0;
    obj_die_if_health_non_positive();
}

static void obj_set_knockback_action(s32 attackType) {
    switch (attackType) {
        case ATTACK_KICK_OR_TRIP:
        case ATTACK_FAST_ATTACK:
            o->oAction = OBJ_ACT_VERTICAL_KNOCKBACK;
            o->oForwardVel = 20.0f;
            o->oVelY = 50.0f;
            break;

        default:
            o->oAction = OBJ_ACT_HORIZONTAL_KNOCKBACK;
            o->oForwardVel = 50.0f;
            o->oVelY = 30.0f;
            break;
    }

    o->oFlags &= ~OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW;
    o->oMoveAngleYaw = angle_to_object(gMarioObject, o);
}

static void obj_set_squished_action(void) {
    PlaySound2(SOUND_OBJECT_STOMPED);
    o->oAction = OBJ_ACT_SQUISHED;
}

static s32 obj_die_if_above_lava_and_health_non_positive(void) {
    if (o->oMoveFlags & OBJ_MOVE_UNDERWATER_ON_GROUND) {
        if (o->oGravity + o->oBuoyancy > 0.0f
            || find_water_level(o->oPosX, o->oPosZ) - o->oPosY < 150.0f) {
            return FALSE;
        }
    } else if (!(o->oMoveFlags & OBJ_MOVE_ABOVE_LAVA)) {
        if (o->oMoveFlags & OBJ_MOVE_ENTERED_WATER) {
            if (o->oWallHitboxRadius < 200.0f) {
                PlaySound2(SOUND_OBJECT_DIVINGINTOWATER);
            } else {
                PlaySound2(SOUND_OBJECT_DIVINGINWATER);
            }
        }
        return FALSE;
    }

    obj_die_if_health_non_positive();
    return TRUE;
}

static s32 obj_handle_attacks(struct ObjectHitbox *hitbox, s32 attackedMarioAction,
                              u8 *attackHandlers) {
    s32 attackType;

    set_object_hitbox(o, hitbox);

    //! Die immediately if above lava
    if (obj_die_if_above_lava_and_health_non_positive()) {
        return 1;
    } else if (o->oInteractStatus & INT_STATUS_INTERACTED) {
        if (o->oInteractStatus & INT_STATUS_ATTACKED_MARIO) {
            if (o->oAction != attackedMarioAction) {
                o->oAction = attackedMarioAction;
                o->oTimer = 0;
            }
        } else {
            attackType = o->oInteractStatus & INT_STATUS_ATTACK_MASK;

            switch (attackHandlers[attackType - 1]) {
                case ATTACK_HANDLER_NOP:
                    break;

                case ATTACK_HANDLER_DIE_IF_HEALTH_NON_POSITIVE:
                    obj_die_if_health_non_positive();
                    break;

                case ATTACK_HANDLER_KNOCKBACK:
                    obj_set_knockback_action(attackType);
                    break;

                case ATTACK_HANDLER_SQUISHED:
                    obj_set_squished_action();
                    break;

                case ATTACK_HANDLER_SPECIAL_KOOPA_LOSE_SHELL:
                    shelled_koopa_attack_handler(attackType);
                    break;

                case ATTACK_HANDLER_SET_SPEED_TO_ZERO:
                    obj_set_speed_to_zero();
                    break;

                case ATTACK_HANDLER_SPECIAL_WIGGLER_JUMPED_ON:
                    wiggler_jumped_on_attack_handler();
                    break;

                case ATTACK_HANDLER_SPECIAL_HUGE_GOOMBA_WEAKLY_ATTACKED:
                    huge_goomba_weakly_attacked();
                    break;

                case ATTACK_HANDLER_SQUISHED_WITH_BLUE_COIN:
                    o->oNumLootCoins = -1;
                    obj_set_squished_action();
                    break;
            }

            o->oInteractStatus = 0;
            return attackType;
        }
    }

    o->oInteractStatus = 0;
    return 0;
}

static void obj_act_knockback(UNUSED f32 baseScale) {
    obj_update_floor_and_walls();

    if (o->header.gfx.unk38.curAnim != NULL) {
        func_8029F728();
    }

    //! Dies immediately if above lava
    if ((o->oMoveFlags
         & (OBJ_MOVE_MASK_ON_GROUND | OBJ_MOVE_MASK_IN_WATER | OBJ_MOVE_HIT_WALL | OBJ_MOVE_ABOVE_LAVA))
        || (o->oAction == OBJ_ACT_VERTICAL_KNOCKBACK && o->oTimer >= 9)) {
        obj_die_if_health_non_positive();
    }

    obj_move_standard(-78);
}

static void obj_act_squished(f32 baseScale) {
    f32 targetScaleY = baseScale * 0.3f;

    obj_update_floor_and_walls();

    if (o->header.gfx.unk38.curAnim != NULL) {
        func_8029F728();
    }

    if (approach_f32_ptr(&o->header.gfx.scale[1], targetScaleY, baseScale * 0.14f)) {
        o->header.gfx.scale[0] = o->header.gfx.scale[2] = baseScale * 2.0f - o->header.gfx.scale[1];

        if (o->oTimer >= 16) {
            obj_die_if_health_non_positive();
        }
    }

    o->oForwardVel = 0.0f;
    obj_move_standard(-78);
}

static s32 obj_update_standard_actions(f32 scale) {
    if (o->oAction < 100) {
        return TRUE;
    } else {
        obj_become_intangible();

        switch (o->oAction) {
            case OBJ_ACT_HORIZONTAL_KNOCKBACK:
            case OBJ_ACT_VERTICAL_KNOCKBACK:
                obj_act_knockback(scale);
                break;

            case OBJ_ACT_SQUISHED:
                obj_act_squished(scale);
                break;
        }

        return FALSE;
    }
}

static s32 obj_check_attacks(struct ObjectHitbox *hitbox, s32 attackedMarioAction) {
    s32 attackType;

    set_object_hitbox(o, hitbox);

    //! Dies immediately if above lava
    if (obj_die_if_above_lava_and_health_non_positive()) {
        return 1;
    } else if (o->oInteractStatus & INT_STATUS_INTERACTED) {
        if (o->oInteractStatus & INT_STATUS_ATTACKED_MARIO) {
            if (o->oAction != attackedMarioAction) {
                o->oAction = attackedMarioAction;
                o->oTimer = 0;
            }
        } else {
            attackType = o->oInteractStatus & INT_STATUS_ATTACK_MASK;
            obj_die_if_health_non_positive();
            o->oInteractStatus = 0;
            return attackType;
        }
    }

    o->oInteractStatus = 0;
    return 0;
}

static s32 obj_move_for_one_second(s32 endAction) {
    obj_update_floor_and_walls();
    func_8029F728();

    if (o->oTimer > 30) {
        o->oAction = endAction;
        return TRUE;
    }

    obj_move_standard(-78);
    return FALSE;
}

/**
 * If we are far from home (> threshold away), then set oAngleToMario to the
 * angle to home and oDistanceToMario to 25000.
 * If we are close to home, but Mario is far from us (> threshold away), then
 * keep oAngleToMario the same and set oDistanceToMario to 20000.
 * If we are close to both home and Mario, then keep both oAngleToMario and
 * oDistanceToMario the same.
 *
 * The point of this function is to avoid having to write extra code to get
 * the object to return to home. When mario is far away and the object is far
 * from home, it could theoretically re-use the "approach mario" logic to approach
 * its home instead.
 * However, most objects that use this function handle the far-from-home case
 * separately anyway.
 * This function causes seemingly erroneous behavior in some objects that try to
 * attack mario (e.g. fly guy shooting fire or lunging), especially when combined
 * with partial updates.
 */
static void treat_far_home_as_mario(f32 threshold) {
    f32 dx = o->oHomeX - o->oPosX;
    f32 dy = o->oHomeY - o->oPosY;
    f32 dz = o->oHomeZ - o->oPosZ;
    f32 distance = sqrtf(dx * dx + dy * dy + dz * dz);

    if (distance > threshold) {
        o->oAngleToMario = atan2s(dz, dx);
        o->oDistanceToMario = 25000.0f;
    } else {
        dx = o->oHomeX - gMarioObject->oPosX;
        dy = o->oHomeY - gMarioObject->oPosY;
        dz = o->oHomeZ - gMarioObject->oPosZ;
        distance = sqrtf(dx * dx + dy * dy + dz * dz);

        if (distance > threshold) {
            o->oDistanceToMario = 20000.0f;
        }
    }
}

#include "behaviors/koopa.inc.c" // TODO: Text arg field name
#include "behaviors/pokey.inc.c"
#include "behaviors/swoop.inc.c"
#include "behaviors/fly_guy.inc.c"
#include "behaviors/goomba.inc.c"
#include "behaviors/chain_chomp.inc.c" // TODO: chain_chomp_sub_act_lunge documentation
#include "behaviors/wiggler.inc.c"     // TODO
#include "behaviors/spiny.inc.c"
#include "behaviors/enemy_lakitu.inc.c" // TODO
#include "behaviors/cloud.inc.c"
#include "behaviors/camera_lakitu.inc.c" // TODO: 104 label, follow cam documentation
#include "behaviors/monty_mole.inc.c"    // TODO
#include "behaviors/platform_on_track.inc.c"
#include "behaviors/seesaw_platform.inc.c"
#include "behaviors/ferris_wheel.inc.c"
#include "behaviors/water_bomb.inc.c" // TODO: Shadow position
#include "behaviors/ttc_rotating_solid.inc.c"
#include "behaviors/ttc_pendulum.inc.c"
#include "behaviors/ttc_treadmill.inc.c" // TODO
#include "behaviors/ttc_moving_bar.inc.c"
#include "behaviors/ttc_cog.inc.c"
#include "behaviors/ttc_pit_block.inc.c"
#include "behaviors/ttc_elevator.inc.c"
#include "behaviors/ttc_2d_rotator.inc.c"
#include "behaviors/ttc_spinner.inc.c"
// Finished included files up to here

struct Struct80331A54 {
    void *unk00;
    s16 unk04;
};

struct Struct80331B30 {
    s16 unk00;
    s16 unk02;
};

struct RacingPenguinData {
    s16 text;
    f32 radius;
    f32 height;
};

struct Struct80331C00 {
    s16 unk00;
    s16 unk02;
};

struct Struct80331C38 {
    s16 unk00;
    s16 unk02;
};

struct Struct80331C48 {
    s16 unk00;
    s16 unk02;
    s16 unk04;
};

struct TripletButterflyActivationData {
    s32 model;
    void *behavior;
    f32 scale;
};

struct Struct80331874 {
    s8 unk01;
    s8 unk03;
    s8 unk04;
    s8 unk05;
    s8 unk06;
    s8 unk0C;
    u8 filler00[0x14 - 0x00];
};

// TODO: Finish
#include "behaviors/mr_blizzard.inc.c"

void *D_80331A24[] = {
    bits_seg7_collision_0701A9A0,
    bits_seg7_collision_0701AA0C,
    bitfs_seg7_collision_07015714,
    bitfs_seg7_collision_07015768,
    rr_seg7_collision_070295F8,
    rr_seg7_collision_0702967C,
    NULL,
    bitdw_seg7_collision_0700F688,
};

void BehSlidingPlatform2Init(void) {
    s32 val04;

    val04 = ((u16)(o->oBehParams >> 16) & 0x0380) >> 7;
    o->collisionData = segmented_to_virtual(D_80331A24[val04]);
    o->oBackAndForthPlatformUnkF8 = 50.0f * ((u16)(o->oBehParams >> 16) & 0x003F);

    if (val04 < 5 || val04 > 6) {
        o->oBackAndForthPlatformUnk100 = 15.0f;
        if ((u16)(o->oBehParams >> 16) & 0x0040) {
            o->oMoveAngleYaw += 0x8000;
        }
    } else {
        o->oBackAndForthPlatformUnk100 = 10.0f;
        if ((u16)(o->oBehParams >> 16) & 0x0040) {
            o->oBackAndForthPlatformUnkF4 = -1.0f;
        } else {
            o->oBackAndForthPlatformUnkF4 = 1.0f;
        }
    }
}

void BehSlidingPlatform2Loop(void) {
    if (o->oTimer > 10) {
        o->oBackAndForthPlatformUnkFC += o->oBackAndForthPlatformUnk100;
        if (clamp_f32(&o->oBackAndForthPlatformUnkFC, -o->oBackAndForthPlatformUnkF8, 0.0f)) {
            o->oBackAndForthPlatformUnk100 = -o->oBackAndForthPlatformUnk100;
            o->oTimer = 0;
        }
    }

    obj_perform_position_op(0);

    if (o->oBackAndForthPlatformUnkF4 != 0.0f) {
        o->oPosY = o->oHomeY + o->oBackAndForthPlatformUnkFC * o->oBackAndForthPlatformUnkF4;
    } else {
        obj_set_dist_from_home(o->oBackAndForthPlatformUnkFC);
    }

    obj_perform_position_op(1);
}

void *D_80331A44[] = {
    bits_seg7_collision_0701AA84,
    rr_seg7_collision_07029508,
};

s16 D_80331A4C[] = { 300, -300, 600, -600 };

void BehOctagonalPlatformRotatingInit(void) {
    o->collisionData = segmented_to_virtual(D_80331A44[(u8)(o->oBehParams >> 16)]);
    o->oAngleVelYaw = D_80331A4C[(u8)(o->oBehParams >> 24)];
}

void BehOctagonalPlatformRotatingLoop(void) {
    o->oFaceAngleYaw += o->oAngleVelYaw;
}

struct Struct80331A54 D_80331A54[][5] = {
    {
        { bits_seg7_collision_0701B734, MODEL_BITS_STAIRCASE_FRAME4 },
        { bits_seg7_collision_0701B59C, MODEL_BITS_STAIRCASE_FRAME3 },
        { bits_seg7_collision_0701B404, MODEL_BITS_STAIRCASE_FRAME2 },
        { bits_seg7_collision_0701B26C, MODEL_BITS_STAIRCASE_FRAME1 },
        { bits_seg7_collision_0701B0D4, MODEL_BITS_STAIRCASE },
    },
    {
        { bitdw_seg7_collision_0700FD9C, MODEL_BITDW_STAIRCASE },
        { bitdw_seg7_collision_0700FC7C, MODEL_BITDW_STAIRCASE_FRAME1 },
        { bitdw_seg7_collision_0700FB5C, MODEL_BITDW_STAIRCASE_FRAME2 },
        { bitdw_seg7_collision_0700FA3C, MODEL_BITDW_STAIRCASE_FRAME3 },
        { bitdw_seg7_collision_0700F91C, MODEL_BITDW_STAIRCASE_FRAME4 },
    },
    {
        { rr_seg7_collision_0702A6B4, MODEL_RR_TRICKY_TRIANGLES_FRAME4 },
        { rr_seg7_collision_0702A32C, MODEL_RR_TRICKY_TRIANGLES_FRAME3 },
        { rr_seg7_collision_07029FA4, MODEL_RR_TRICKY_TRIANGLES_FRAME2 },
        { rr_seg7_collision_07029C1C, MODEL_RR_TRICKY_TRIANGLES_FRAME1 },
        { rr_seg7_collision_07029924, MODEL_RR_TRICKY_TRIANGLES },
    },
};

s16 D_80331ACC[] = { 250, 200, 200 };

void BehAnimatesOnFloorSwitchPressInit(void) {
    o->parentObj = obj_nearest_object_with_behavior(bhvFloorSwitchAnimatesObject);
}

void BehAnimatesOnFloorSwitchPressLoop(void) {
    if (o->oFloorSwitchPressAnimationUnk100 != 0) {
        if (o->parentObj->oAction != 2) {
            o->oFloorSwitchPressAnimationUnk100 = 0;
        }

        if (o->oFloorSwitchPressAnimationUnkFC != 0) {
            o->oFloorSwitchPressAnimationUnkF4 = D_80331ACC[o->oBehParams2ndByte];
        } else {
            o->oFloorSwitchPressAnimationUnkF4 = 0;
        }
    } else if (o->parentObj->oAction == 2) {
        o->oFloorSwitchPressAnimationUnkFC ^= 1;
        o->oFloorSwitchPressAnimationUnk100 = 1;
    }

    if (o->oFloorSwitchPressAnimationUnkF4 != 0) {
        if (o->oFloorSwitchPressAnimationUnkF4 < 60) {
            PlaySound(SOUND_CH8_SWITCH6);
        } else {
            PlaySound(SOUND_CH8_SWITCH5);
        }

        if (--o->oFloorSwitchPressAnimationUnkF4 == 0) {
            o->oFloorSwitchPressAnimationUnkFC = 0;
        }

        if (o->oFloorSwitchPressAnimationUnkF8 < 9) {
            o->oFloorSwitchPressAnimationUnkF8 += 1;
        }
    } else if ((o->oFloorSwitchPressAnimationUnkF8 -= 2) < 0) {
        o->oFloorSwitchPressAnimationUnkF8 = 0;
        o->oFloorSwitchPressAnimationUnkFC = 1;
    }

    o->collisionData = segmented_to_virtual(
        D_80331A54[o->oBehParams2ndByte][o->oFloorSwitchPressAnimationUnkF8 / 2].unk00);

    obj_set_model(D_80331A54[o->oBehParams2ndByte][o->oFloorSwitchPressAnimationUnkF8 / 2].unk04);
}

#include "behaviors/activated_bf_plat.inc.c"
#include "behaviors/recovery_heart.inc.c"

void BehCannonBarrelBubblesLoop(void) {
    struct Object *val04;

    if (o->parentObj->oAction == 2) {
        mark_object_for_deletion(o);
    } else {
        o->oMoveAngleYaw = o->parentObj->oFaceAngleYaw;
        o->oMoveAnglePitch = o->parentObj->oMoveAnglePitch + 0x4000;
        o->oFaceAnglePitch = o->parentObj->oMoveAnglePitch;

        if ((o->oCannonBarrelBubblesUnkF4 += o->oForwardVel) > 0.0f) {
            func_802A2A38();
            obj_forward_vel_approach(-5.0f, 18.0f);
        } else {
            o->oCannonBarrelBubblesUnkF4 = 0.0f;
            copy_object_pos(o, o->parentObj);

            // check this
            if (o->parentObj->oCannonUnkF4 != 0) {
                if (o->oForwardVel == 0.0f) {
                    o->oForwardVel = 35.0f;

                    val04 = spawn_object(o, MODEL_WATER_BOMB, bhvWaterBomb);
                    if (val04 != NULL) {
                        val04->oForwardVel = -100.0f;
                        val04->header.gfx.scale[1] = 1.7f;
                    }

                    func_8027F440(2, o->oPosX, o->oPosY, o->oPosZ);
                }
            } else {
                o->oForwardVel = 0.0f;
            }
        }
    }
}

void func_80308DF0(void) {
    if (o->oDistanceToMario < 2000.0f) {
        spawn_object(o, MODEL_CANNON_BARREL, bhvCannonBarrelBubbles);
        obj_unhide();

        o->oAction = 1;
        o->oMoveAnglePitch = o->oCannonUnkFC = 0x1C00;
    }
}

void func_80308E84(void) {
    if (o->oDistanceToMario > 2500.0f) {
        o->oAction = 2;
    } else if (o->oBehParams2ndByte == 0) {
        if (o->oCannonUnkF4 != 0) {
            o->oCannonUnkF4 -= 1;
        } else {
            obj_move_pitch_approach(o->oCannonUnkFC, 0x80);
            obj_face_yaw_approach(o->oCannonUnk100, 0x100);

            if ((s16) o->oFaceAngleYaw == (s16) o->oCannonUnk100) {
                if (o->oCannonUnkF8 != 0) {
                    o->oCannonUnkF8 -= 1;
                } else {
                    PlaySound2(SOUND_OBJECT_CANNON4);
                    o->oCannonUnkF4 = 70;
                    o->oCannonUnkFC = 0x1000 + 0x400 * (RandomU16() & 0x3);
                    o->oCannonUnk100 = -0x2000 + o->oMoveAngleYaw + 0x1000 * (RandomU16() % 5);
                    o->oCannonUnkF8 = 60;
                }
            }
        }
    }
}

void func_80309004(void) {
    obj_hide();
    o->oAction = 0;
}

void BehWaterBombCannonLoop(void) {
    obj_push_mario_away_from_cylinder(220.0f, 300.0f);

    switch (o->oAction) {
        case 0:
            func_80308DF0();
            break;
        case 1:
            func_80308E84();
            break;
        case 2:
            func_80309004();
            break;
    }
}

struct ObjectHitbox sUnagiHitbox = {
    /* interactType:      */ INTERACT_CLAM_OR_BUBBA,
    /* downOffset:        */ 50,
    /* damageOrCoinValue: */ 3,
    /* health:            */ 99,
    /* numLootCoins:      */ 0,
    /* radius:            */ 150,
    /* height:            */ 150,
    /* hurtboxRadius:     */ 150,
    /* hurtboxHeight:     */ 150,
};

void BehUnagiInit(void) {
    if (o->oBehParams2ndByte != 1) {
        o->oUnagiUnkFC = segmented_to_virtual(jrb_seg7_trajectory_unagi_1);
        if (o->oBehParams2ndByte == 0) {
            o->oFaceAnglePitch = -7600;
        } else {
            o->oAction = 1;
        }
    } else {
        o->oUnagiUnkFC = segmented_to_virtual(jrb_seg7_trajectory_unagi_2);
        o->oAction = 3;
        o->oAnimState = 1;

        o->oUnagiUnk1B0 = o->oMoveAngleYaw;
    }

    o->oUnagiUnk100 = o->oUnagiUnkFC;
}

void func_803091C4(void) {
    if (o->oDistanceToMario > 4500.0f && o->oSubAction != 0) {
        o->oAction = 1;
        o->oPosX = o->oUnagiUnkFC[1];
        o->oPosY = o->oUnagiUnkFC[2];
        o->oPosZ = o->oUnagiUnkFC[3];
    } else if (o->oUnagiUnk1AC < 700.0f) {
        o->oSubAction = 1;
    }
}

void func_803092AC(s32 arg0) {
    if (o->oSoundStateID == 3) {
        if (obj_check_anim_frame(30)) {
            o->oForwardVel = 40.0f;
        }
    } else {
        if (func_8029F828()) {
            if (o->oAction != arg0 && (o->oUnagiUnk104 & 0xFF) >= 7) {
                set_obj_animation_and_sound_state(3);
            } else {
                set_obj_animation_and_sound_state(2);
            }
        }
    }

    if (obj_check_anim_frame(6)) {
        PlaySound2(SOUND_GENERAL_MOVINGWATER);
    }

    if (obj_follow_path(0) == -1) {
        o->oAction = arg0;
    }

    o->oMoveAnglePitch = o->oFaceAnglePitch =
        approach_s16_symmetric(o->oMoveAnglePitch, o->oUnagiUnk108, 50);

    obj_rotate_yaw_toward(o->oUnagiUnk10C, 120);
    obj_roll_to_match_yaw_turn(o->oUnagiUnk10C, 0x2000, 100);

    obj_forward_vel_approach(10.0f, 0.2f);
    func_802A2A38();
}

void func_80309430(void) {
    o->oUnagiUnk100 = o->oUnagiUnkFC;
    o->oUnagiUnk104 = 0;

    obj_set_pos_to_home();

    o->oMoveAnglePitch = o->oFaceAnglePitch = 0;
    o->oMoveAngleYaw = o->oFaceAngleYaw = o->oUnagiUnk1B0;
    o->oFaceAngleRoll = 0;

    o->oForwardVel = o->oVelX = o->oVelZ = o->oUnagiUnkF8 = 0.0f;

    o->oUnagiUnkF4 = -800.0f;

    o->oAction = 3;
}

void func_80309530(void) {
    if (o->oUnagiUnkF4 < 0.0f) {
        set_obj_animation_and_sound_state(6);

        if ((o->oUnagiUnkF4 += 10.0f) > 0.0f) {
            o->oUnagiUnkF4 = 0.0f;
        }
    } else {
        if (o->oUnagiUnkF4 == 0.0f) {
            set_obj_animation_and_sound_state(6);

            if (o->oTimer > 60 && o->oUnagiUnk1AC < 1000.0f) {
                PlaySound2(SOUND_OBJECT_EEL_2);
                o->oUnagiUnkF8 = o->oUnagiUnk110 = 30.0f;
            } else {
                o->oUnagiUnk110 = 0.0f;
            }
        } else if (o->oUnagiUnk110 > 0.0f) {
            if (func_802F92B0(5)) {
                o->oUnagiUnk110 = 0.0f;
            }
        } else if (o->oUnagiUnk110 == 0.0f) {
            set_obj_animation_and_sound_state(0);
            if (func_8029F828()) {
                if (o->oUnagiUnk1AC < 1000.0f) {
                    o->oAction = 4;
                    o->oForwardVel = o->oUnagiUnkF8;
                    set_obj_animation_and_sound_state(1);
                } else {
                    o->oUnagiUnk110 = -50.0f;
                    set_obj_animation_and_sound_state(4);
                }
            }
        }

        approach_f32_ptr(&o->oUnagiUnkF8, o->oUnagiUnk110, 4.0f);

        if ((o->oUnagiUnkF4 += o->oUnagiUnkF8) < 0.0f) {
            o->oUnagiUnkF4 = o->oUnagiUnkF8 = 0.0f;
            o->oTimer = 0;
        }
    }

    o->oPosX = o->oHomeX + o->oUnagiUnkF4 * sins(o->oMoveAngleYaw);
    o->oPosZ = o->oHomeZ + o->oUnagiUnkF4 * coss(o->oMoveAngleYaw);
}

void BehUnagiLoop(void) {
    s32 val04;

    if (o->oUnagiUnk1B2 == 0) {
        o->oUnagiUnk1AC = 99999.0f;
        if (o->oDistanceToMario < 3000.0f) {
            for (val04 = -4; val04 < 4; val04++) {
                spawn_object_relative(val04, 0, 0, 0, o, MODEL_NONE, bhvUnagiSubobject);
            }
            o->oUnagiUnk1B2 = 1;
        }
    } else if (o->oDistanceToMario > 4000.0f) {
        o->oUnagiUnk1B2 = 0;
    }

    switch (o->oAction) {
        case 0:
            func_803091C4();
            break;
        case 1:
            func_803092AC(o->oAction);
            break;
        case 2:
            func_80309430();
        case 3:
            func_80309530();
            break;
        case 4:
            func_803092AC(2);
            break;
    }
}

void BehUnagiSubobjectLoop(void) {
    f32 val04;

    if (o->parentObj->oUnagiUnk1B2 == 0) {
        mark_object_for_deletion(o);
    } else {
        val04 = 300.0f * o->oBehParams2ndByte;

        o->oPosY = o->parentObj->oPosY - val04 * sins(o->parentObj->oFaceAnglePitch) * 1.13f;

        val04 = coss(o->parentObj->oFaceAnglePitch / 2) * val04;

        o->oPosX = o->parentObj->oPosX + val04 * sins(o->parentObj->oFaceAngleYaw);
        o->oPosZ = o->parentObj->oPosZ + val04 * coss(o->parentObj->oFaceAngleYaw);

        if (o->oBehParams2ndByte == -4) {
            if (o->parentObj->oAnimState != 0 && o->oDistanceToMario < 150.0f) {
                o->oBehParams = o->parentObj->oBehParams;
                CreateStar(6833.0f, -3654.0f, 2230.0f);
                o->parentObj->oAnimState = 0;
            }
        } else {
            obj_check_attacks(&sUnagiHitbox, o->oAction);
            if (o->oBehParams2ndByte == 3) {
                o->parentObj->oUnagiUnk1AC = o->oDistanceToMario;
            }
        }
    }
}

#include "behaviors/dorrie.inc.c"

struct ObjectHitbox sHauntedChairHitbox = {
    /* interactType:      */ INTERACT_MR_BLIZZARD,
    /* downOffset:        */ 0,
    /* damageOrCoinValue: */ 2,
    /* health:            */ 0,
    /* numLootCoins:      */ 0,
    /* radius:            */ 50,
    /* height:            */ 50,
    /* hurtboxRadius:     */ 50,
    /* hurtboxHeight:     */ 50,
};

void BehHauntedChairInit(void) {
    struct Object *val04;
    f32 val00;

    val04 = obj_find_nearest_object_with_behavior(bhvMadPiano, &val00);
    if (val04 != NULL && val00 < 300.0f) {
        o->parentObj = val04;
    } else {
        o->oHauntedChairUnkF4 = 1;
    }
}

void func_8030A5D8(void) {
    s16 val0E;
    f32 val08;

    if (o->parentObj != o) {
        if (o->oHauntedChairUnk104 == 0) {
            if (lateral_dist_between_objects(o, o->parentObj) < 250.0f) {
                val0E = angle_to_object(o, o->parentObj) - o->oFaceAngleYaw + 0x2000;
                if (val0E & 0x4000) {
                    o->oHauntedChairUnk100 = &o->oFaceAngleRoll;
                    if (val0E > 0) {
                        o->oHauntedChairUnk104 = 0x4000;
                    } else {
                        o->oHauntedChairUnk104 = -0x4000;
                    }
                } else {
                    o->oHauntedChairUnk100 = &o->oFaceAnglePitch;
                    if (val0E < 0) {
                        o->oHauntedChairUnk104 = 0x5000;
                    } else {
                        o->oHauntedChairUnk104 = -0x4000;
                    }
                }

                if (o->oHauntedChairUnk104 < 0) {
                    o->oHauntedChairUnkF8 = -1500.0f;
                } else {
                    o->oHauntedChairUnkF8 = 1500.0f;
                }
            }
        } else {
            oscillate_toward(o->oHauntedChairUnk100, &o->oHauntedChairUnkF8, o->oHauntedChairUnk104,
                             4000.0f, 20.0f, 2.0f);
        }
    } else if (o->oHauntedChairUnkF4 != 0) {
        if (o->oDistanceToMario < 500.0f) {
            o->oHauntedChairUnkF4 -= 1;
        }
        o->oTimer = 0.0f;
    } else {
        if ((o->oTimer & 0x8) != 0) {
            if (o->oFaceAnglePitch < 0) {
                PlaySound2(SOUND_GENERAL_MOVINGBOOMAYBE);
                val08 = 4.0f;
            } else {
                val08 = -4.0f;
            }

            o->oHomeX -= val08;
            o->oHomeZ -= val08;

            o->oFaceAnglePitch = o->oFaceAngleRoll = (s32)(50.0f * val08);
            ;
        } else {
            o->oFaceAnglePitch = o->oFaceAngleRoll = 0;
        }

        if (o->oTimer > 30) {
            o->oAction = 1;
            o->oHauntedChairUnkF8 = 0.0f;
            o->oHauntedChairUnkFC = 200.0f;
            o->oHauntedChairUnkF4 = 40;
        }
    }

    obj_push_mario_away_from_cylinder(80.0f, 120.0f);
}

void func_8030A968(void) {
    obj_update_floor_and_walls();

    if (o->oTimer < 70) {
        if (o->oTimer < 50) {
            o->oVelY = 6.0f;
        } else {
            o->oVelY = 0.0f;
        }

        o->oGravity = 0.0f;
        oscillate_toward(&o->oFaceAnglePitch, &o->oHauntedChairUnkF8, -4000, 200.0f, 20.0f, 2.0f);
        oscillate_toward(&o->oFaceAngleRoll, &o->oHauntedChairUnkFC, 0, 0.0f, 20.0f, 1.0f);
    } else {
        if (o->oHauntedChairUnkF4 != 0) {
            if (--o->oHauntedChairUnkF4 == 0) {
                PlaySound2(SOUND_GENERAL_HAUNTEDCHAIR);
                o->oMoveAnglePitch = obj_turn_pitch_toward_mario(120.0f, 0);
                o->oMoveAngleYaw = o->oAngleToMario;
                obj_compute_vel_from_move_pitch(50.0f);
            } else if (o->oHauntedChairUnkF4 > 20) {
                if (gGlobalTimer % 4 == 0) {
                    PlaySound2(SOUND_GENERAL_SWISHAIR_2);
                }
                o->oFaceAngleYaw += 0x2710;
            }
        } else if (o->oMoveFlags & 0x00000203) {
            obj_die_if_health_non_positive();
        }
    }

    obj_check_attacks(&sHauntedChairHitbox, o->oAction);
    obj_move_standard(78);
}

void BehHauntedChairLoop(void) {
    if (!(o->activeFlags & 0x0008)) {
        switch (o->oAction) {
            case 0:
                func_8030A5D8();
                break;
            case 1:
                func_8030A968();
                break;
        }
        func_802F8D78(30.0f, 30.0f);
    }
}

#include "behaviors/mad_piano.inc.c"

struct ObjectHitbox sFlyingBookendHitbox = {
    /* interactType:      */ INTERACT_HIT_FROM_BELOW,
    /* downOffset:        */ 0,
    /* damageOrCoinValue: */ 2,
    /* health:            */ 0,
    /* numLootCoins:      */ -1,
    /* radius:            */ 60,
    /* height:            */ 30,
    /* hurtboxRadius:     */ 40,
    /* hurtboxHeight:     */ 30,
};

struct Struct80331B30 D_80331B30[] = {
    { 52, 150 },
    { 135, 3 },
    { -75, 78 },
};

struct ObjectHitbox sBookSwitchHitbox = {
    /* interactType:      */ INTERACT_BREAKABLE,
    /* downOffset:        */ 0,
    /* damageOrCoinValue: */ 0,
    /* health:            */ 99,
    /* numLootCoins:      */ 0,
    /* radius:            */ 20,
    /* height:            */ 30,
    /* hurtboxRadius:     */ 20,
    /* hurtboxHeight:     */ 30,
};

void func_8030AF6C(void) {
    if (obj_is_near_to_and_facing_mario(400.0f, 0x3000)) {
        PlaySound2(SOUND_OBJECT_DEFAULTDEATH);
        o->oAction = 1;
        o->oBookendUnkF4 = o->oFaceAnglePitch + 0x7FFF;
        o->oBookendUnkF8 = o->oFaceAngleRoll - 0x7FFF;
        obj_set_model(MODEL_BOOKEND_PART);
    }
}

void func_8030AFF0(void) {
    if (obj_forward_vel_approach(3.0f, 1.0f)) {
        if (func_802F92B0(2)) {
            o->oAction = 2;
            o->oForwardVel = 0.0f;
        } else {
            o->oForwardVel = 3.0f;
            if (o->oTimer > 5) {
                obj_face_pitch_approach(o->oBookendUnkF4, 2000);
                if (o->oTimer >= 10) {
                    obj_face_roll_approach(o->oBookendUnkF8, 2000);
                    if (o->oTimer >= 20) {
                        approach_f32_ptr(&o->header.gfx.scale[0], 3.0f, 0.2f);
                    }
                }
            }
        }
    }

    obj_move_using_fvel_and_gravity();
}

void func_8030B110(void) {
    set_obj_animation_and_sound_state(1);
    obj_update_floor_and_walls();

    if (o->oForwardVel == 0.0f) {
        obj_turn_pitch_toward_mario(120.0f, 1000);
        o->oFaceAnglePitch = o->oMoveAnglePitch + 0x7FFF;
        obj_rotate_yaw_toward(o->oAngleToMario, 1000);

        if (o->oTimer > 30) {
            obj_compute_vel_from_move_pitch(50.0f);
        }
    }

    obj_move_standard(78);
}

void func_8030B1C8(void) {
    o->oDamageOrCoinValue = 1;
    o->oNumLootCoins = 0;

    if (o->oTimer >= 4) {
        o->oAction = 2;
        o->oForwardVel = 50.0f;
    }

    obj_forward_vel_approach(50.0f, 2.0f);
    obj_move_using_fvel_and_gravity();
}

void BehFlyingBookendLoop(void) {
    if (!(o->activeFlags & 0x0008)) {
        o->oDeathSound = SOUND_OBJECT_POUNDING1;
        obj_scale(o->header.gfx.scale[0]);

        switch (o->oAction) {
            case 0:
                func_8030AF6C();
                break;
            case 1:
                func_8030AFF0();
                break;
            case 2:
                func_8030B110();
                break;
            case 3:
                func_8030B1C8();
                break;
        }

        obj_check_attacks(&sFlyingBookendHitbox, -1);
        if (o->oAction == -1 || (o->oMoveFlags & 0x00000203)) {
            o->oNumLootCoins = 0;
            obj_die_if_health_non_positive();
        }

        o->oGraphYOffset = 30.0f * o->header.gfx.scale[0];
    }
}

void BehBookendSpawnLoop(void) {
    struct Object *sp1C;

    if (!(o->activeFlags & 0x0008)) {
        if (o->oTimer > 40 && obj_is_near_to_and_facing_mario(600.0f, 0x2000)) {
            sp1C = spawn_object(o, MODEL_BOOKEND, bhvFlyingBookend);
            if (sp1C != NULL) {
                sp1C->oAction = 3;
                PlaySound2(SOUND_OBJECT_DEFAULTDEATH);
            }
            o->oTimer = 0;
        }
    }
}

void func_8030B464(void) {
    s32 val04;

    if (!(o->activeFlags & 0x0008)) {
        for (val04 = 0; val04 < 3; val04++) {
            spawn_object_relative(val04, D_80331B30[val04].unk00, D_80331B30[val04].unk02, 0, o,
                                  MODEL_BOOKEND, bhvBookSwitch);
        }

        o->oAction = 1;
    }
}

void func_8030B50C(void) {
    if (o->oBookSwitchManagerUnkF8 == 0) {
        if (obj_is_near_to_and_facing_mario(500.0f, 0x3000)) {
            o->oBookSwitchManagerUnkF8 = 1;
        }
    } else if (o->oTimer > 60) {
        o->oAction = 2;
        o->oBookSwitchManagerUnkF8 = 0;
    }
}

void func_8030B5A4(void) {
    if (!(o->activeFlags & 0x0008)) {
        if (o->oBookSwitchManagerUnkF4 < 0) {
            if (o->oTimer > 30) {
                o->oBookSwitchManagerUnkF4 = o->oBookSwitchManagerUnkF8 = 0;
            } else if (o->oTimer > 10) {
                o->oBookSwitchManagerUnkF8 = 1;
            }
        } else {
            if (o->oBookSwitchManagerUnkF4 >= 3) {
                if (o->oTimer > 100) {
                    o->parentObj = obj_nearest_object_with_behavior(bhvHauntedBookshelf);
                    o->parentObj->oAction = 1;
                    o->oPosX = o->parentObj->oPosX;
                    o->oAction = 3;
                } else if (o->oTimer == 30) {
                    play_puzzle_jingle();
                }
            } else {
                o->oTimer = 0;
            }
        }
    } else {
        o->oAction = 4;
    }
}

void func_8030B728(void) {
    if (o->oTimer > 85) {
        o->oAction = 4;
    } else {
        o->oForwardVel = o->parentObj->oPosX - o->oPosX;
        o->oPosX = o->parentObj->oPosX;
    }
}

void func_8030B794(void) {
    if (o->oBookSwitchManagerUnkF4 >= 3) {
        mark_object_for_deletion(o);
    } else {
        o->oAction = 0;
    }
}

void bhv_haunted_bookshelf_manager_loop(void) {
    switch (o->oAction) {
        case 0:
            func_8030B464();
            break;
        case 2:
            func_8030B5A4();
            break;
        case 1:
            func_8030B50C();
            break;
        case 3:
            func_8030B728();
            break;
        case 4:
            func_8030B794();
            break;
    }
}

void bhv_book_switch_loop(void) {
    s32 sp3C;
    struct Object *sp38;
    s16 sp36;
    s16 sp34;

    o->header.gfx.scale[0] = 2.0f;
    o->header.gfx.scale[1] = 0.9f;

    if (o->parentObj->oAction == 4) {
        mark_object_for_deletion(o);
    } else {
        sp3C = obj_check_attacks(&sBookSwitchHitbox, o->oAction);
        if (o->parentObj->oBookSwitchManagerUnkF8 != 0 || o->oAction == 1) {
            if (o->oDistanceToMario < 100.0f) {
                obj_become_tangible();
            } else {
                obj_become_intangible();
            }

            o->oAction = 1;
            if (o->oBookSwitchUnkF4 == 0.0f) {
                PlaySound2(SOUND_OBJECT_DEFAULTDEATH);
            }

            if (approach_f32_ptr(&o->oBookSwitchUnkF4, 50.0f, 20.0f)) {
                if (o->parentObj->oBookSwitchManagerUnkF4 >= 0 && o->oTimer > 60) {
                    if (sp3C == 1 || sp3C == 2 || sp3C == 6) {
                        o->oAction = 2;
                    }
                }
            } else {
                o->oTimer = 0;
            }
        } else {
            obj_become_intangible();
            if (approach_f32_ptr(&o->oBookSwitchUnkF4, 0.0f, 20.0f)) {
                if (o->oAction != 0) {
                    if (o->parentObj->oBookSwitchManagerUnkF4 == o->oBehParams2ndByte) {
                        play_sound(SOUND_CH8_RIGHTANSWER, gDefaultSoundArgs);
                        o->parentObj->oBookSwitchManagerUnkF4 += 1;
                    } else {
                        sp36 = RandomU16() & 0x1;
                        sp34 = gMarioObject->oPosZ + 1.5f * gMarioStates[0].vel[2];

                        play_sound(SOUND_MENU_CAMERABUZZ, gDefaultSoundArgs);
                        if (sp34 > 0) {
                            sp34 = 0;
                        }

                        sp38 = spawn_object_abs_with_rot(o, 0, MODEL_BOOKEND, bhvFlyingBookend,
                                                         0x1FC * sp36 - 0x8CA, 890, sp34, 0,
                                                         0x8000 * sp36 + 0x4000, 0);

                        if (sp38 != NULL) {
                            sp38->oAction = 3;
                        }

                        o->parentObj->oBookSwitchManagerUnkF4 = -1;
                    }

                    o->oAction = 0;
                }
            }
        }

        o->oPosX += o->parentObj->oForwardVel;
        o->oPosZ = o->oHomeZ - o->oBookSwitchUnkF4;
        obj_push_mario_away_from_cylinder(70.0f, 70.0f);
    }
}

void obj_spit_fire(s16 relativePosX, s16 relativePosY, s16 relativePosZ, f32 scale, s32 model,
                   f32 startSpeed, f32 endSpeed, s16 movePitch) {
    struct Object *sp2C;

    sp2C = spawn_object_relative_with_scale(1, relativePosX, relativePosY, relativePosZ, scale, o,
                                            model, bhvSmallPiranhaFlame);

    if (sp2C != NULL) {
        sp2C->oSmallPiranhaFlameUnkF4 = startSpeed;
        sp2C->oSmallPiranhaFlameUnkF8 = endSpeed;
        sp2C->oSmallPiranhaFlameUnkFC = model;
        sp2C->oMoveAnglePitch = movePitch;
    }
}

#include "behaviors/fire_piranha_plant.inc.c"
#include "behaviors/fire_spitter.inc.c"

void BehSmallPiranhaFlameLoop(void) {
    f32 sp2C;

    if ((u16)(o->oBehParams >> 16) == 0) {
        if (o->oTimer > 0) {
            mark_object_for_deletion(o);
        } else {
            sp2C = RandomFloat() - 0.5f;
            o->header.gfx.scale[1] = o->header.gfx.scale[2] * (1.0f + 0.7f * sp2C);
            o->header.gfx.scale[0] = o->header.gfx.scale[2] * (0.9f - 0.5f * sp2C);

            o->oAnimState = RandomU16();
        }
    } else {
        obj_update_floor_and_walls();
        if (approach_f32_ptr(&o->oSmallPiranhaFlameUnkF4, o->oSmallPiranhaFlameUnkF8, 0.6f)) {
            obj_rotate_yaw_toward(o->oAngleToMario, 0x200);
        }

        obj_compute_vel_from_move_pitch(o->oSmallPiranhaFlameUnkF4);
        obj_move_standard(-78);
        spawn_object_with_scale(o, o->oSmallPiranhaFlameUnkFC, bhvSmallPiranhaFlame,
                                0.4f * o->header.gfx.scale[0]);

        if (o->oTimer > o->oSmallPiranhaFlameUnk100) {
            spawn_object_relative_with_scale(1, 0, o->oGraphYOffset, 0, o->header.gfx.scale[0], o,
                                             o->oSmallPiranhaFlameUnkFC, bhvFlyguyFlame);
            o->oSmallPiranhaFlameUnk100 = random_linear_offset(8, 15);
            o->oTimer = 0;
        }

        obj_check_attacks(&sPiranhaPlantFireHitbox, o->oAction);
        o->oSmallPiranhaFlameUnk104 += o->oSmallPiranhaFlameUnkF4;

        if (o->oSmallPiranhaFlameUnk104 > 1500.0f || (o->oMoveFlags & 0x00000278)) {
            obj_die_if_health_non_positive();
        }
    }

    o->oGraphYOffset = 15.0f * o->header.gfx.scale[1];
}

void BehFlyGuyFlameLoop(void) {
    obj_move_using_fvel_and_gravity();

    if (approach_f32_ptr(&o->header.gfx.scale[0], 0.0f, 0.6f)) {
        mark_object_for_deletion(o);
    }

    obj_scale(o->header.gfx.scale[0]);
}

Gfx *Geo18_8030D93C(s32 arg0, struct GraphNode *node, UNUSED void *arg2) {
    struct Object *sp4;
    struct GraphNodeTranslationRotation *sp0;

    if (arg0 == 1) {
        sp4 = (struct Object *) gCurGraphNodeObject;
        sp0 = (struct GraphNodeTranslationRotation *) node->next;

        sp0->translation[0] = sp4->OBJECT_FIELD_S16(0x49, 0);
        sp0->translation[1] = sp4->OBJECT_FIELD_S16(0x49, 1);
        sp0->translation[2] = sp4->OBJECT_FIELD_S16(0x4A, 0);
    }

    return NULL;
}

Gfx *Geo18_8030D9AC(s32 arg0, struct GraphNode *node, UNUSED void *arg2) {
    struct Object *sp4;
    struct GraphNodeScale *sp0;

    if (arg0 == 1) {
        sp4 = (struct Object *) gCurGraphNodeObject;
        sp0 = (struct GraphNodeScale *) node->next;

        sp0->scale = sp4->OBJECT_FIELD_S16(0x4A, 1) / 1000.0f;
    }

    return NULL;
}

struct ObjectHitbox sSnufitHitbox = {
    /* interactType:      */ INTERACT_HIT_FROM_BELOW,
    /* downOffset:        */ 0,
    /* damageOrCoinValue: */ 2,
    /* health:            */ 0,
    /* numLootCoins:      */ 2,
    /* radius:            */ 100,
    /* height:            */ 60,
    /* hurtboxRadius:     */ 70,
    /* hurtboxHeight:     */ 50,
};

struct ObjectHitbox sSnufitBulletHitbox = {
    /* interactType:      */ INTERACT_SNUFIT_BULLET,
    /* downOffset:        */ 50,
    /* damageOrCoinValue: */ 1,
    /* health:            */ 0,
    /* numLootCoins:      */ 0,
    /* radius:            */ 100,
    /* height:            */ 50,
    /* hurtboxRadius:     */ 100,
    /* hurtboxHeight:     */ 50,
};

void func_8030C914(void) {
    s32 sp1C;

    sp1C = (s32)(o->oDistanceToMario / 10.0f);
    if (o->oTimer > sp1C && o->oDistanceToMario < 800.0f) {
        o->oSnufitUnk104 = approach_s16_symmetric(o->oSnufitUnk104, 0, 1500);
        o->oSnufitUnk108 = approach_s16_symmetric(o->oSnufitUnk108, 600, 15);

        if ((s16) o->oSnufitUnk104 == 0 && o->oSnufitUnk108 == 600) {
            o->oAction = 1;
            o->oSnufitUnk10C = 0;
        }
    } else {
        o->oSnufitUnk100 += 400;
    }
}

void func_8030CA38(void) {
    o->oSnufitUnk104 = approach_s16_symmetric(o->oSnufitUnk104, -0x8000, 3000);
    o->oSnufitUnk108 = approach_s16_symmetric(o->oSnufitUnk108, 0xA7, 20);

    if ((u16) o->oSnufitUnk104 == 0x8000 && o->oSnufitUnk108 == 0xA7) {
        o->oAction = 0;
    } else if (o->oSnufitUnk10C < 3 && o->oTimer >= 3) {
        o->oSnufitUnk10C += 1;
        PlaySound2(SOUND_OBJECT_SNUFITSHOOT);
        spawn_object_relative(0, 0, -20, 40, o, MODEL_BOWLING_BALL, bhvSnufitBalls);
        o->oSnufitUnkF4 = -30;
        o->oTimer = 0;
    }
}

void BehSnufitLoop(void) {
    if (!(o->activeFlags & 0x0008)) {
        o->oDeathSound = SOUND_OBJECT_SNUFITDEATH;
        if (o->oDistanceToMario < 800.0f) {
            obj_turn_pitch_toward_mario(120.0f, 2000);

            if ((s16) o->oMoveAnglePitch > 0x2000) {
                o->oMoveAnglePitch = 0x2000;
            } else if ((s16) o->oMoveAnglePitch < -0x2000) {
                o->oMoveAnglePitch = -0x2000;
            }

            obj_rotate_yaw_toward(o->oAngleToMario, 2000);
        } else {
            obj_move_pitch_approach(0, 0x200);
            o->oMoveAngleYaw += 200;
        }

        o->oFaceAnglePitch = o->oMoveAnglePitch;

        switch (o->oAction) {
            case 0:
                func_8030C914();
                break;
            case 1:
                func_8030CA38();
                break;
        }

        o->oPosX = o->oHomeX + 100.0f * coss(o->oSnufitUnk100);
        o->oPosY = o->oHomeY + 8.0f * coss(4000 * gGlobalTimer);
        o->oPosZ = o->oHomeZ + 100.0f * sins(o->oSnufitUnk100);

        o->oSnufitUnk1AE = -0x20;
        o->oSnufitUnk1B0 = o->oSnufitUnkF4 + 180;
        o->oSnufitUnk1B2 = (s16)(o->oSnufitUnk108 + 666 + o->oSnufitUnk108 * coss(o->oSnufitUnk104));

        if (o->oSnufitUnk1B2 > 1000) {
            o->oSnufitUnkF8 = (o->oSnufitUnk1B2 - 1000) / 1000.0f + 1.0f;
            o->oSnufitUnk1B2 = 1000;
        } else {
            o->oSnufitUnkF8 = 1.0f;
        }

        obj_scale(o->oSnufitUnkF8);
        obj_check_attacks(&sSnufitHitbox, o->oAction);
    }
}

void BehSnufitBallsLoop(void) {
    if ((o->activeFlags & 0x0008) || (o->oTimer != 0 && o->oDistanceToMario > 1500.0f)) {
        mark_object_for_deletion(o);
    }

    if (o->oGravity == 0.0f) {
        obj_update_floor_and_walls();

        obj_compute_vel_from_move_pitch(40.0f);
        if (obj_check_attacks(&sSnufitBulletHitbox, 1)) {
            o->oMoveAngleYaw += 0x8000;
            o->oForwardVel *= 0.05f;
            o->oVelY = 30.0f;
            o->oGravity = -4.0f;

            obj_become_intangible();
        } else if (o->oAction == 1 || (o->oMoveFlags & 0x00000203)) {
            o->oDeathSound = -1;
            obj_die_if_health_non_positive();
        }

        obj_move_standard(78);
    } else {
        obj_move_using_fvel_and_gravity();
    }
}

#include "behaviors/horizontal_grindel.inc.c"
#include "behaviors/eyerok.inc.c"
#include "behaviors/klepto.inc.c"
#include "behaviors/bird.inc.c"
#include "behaviors/racing_penguin.inc.c"

struct Struct80331C00 D_80331C00[] = {
    { 0x019C, 0xFF6A }, { 0x02FA, 0xFF6A }, { 0x0458, 0xFF6A },
    { 0x019C, 0x0096 }, { 0x02FA, 0x0096 }, { 0x0458, 0x0096 },
};

void BehHauntedRoomCheckLoop(void) {
    struct Object *val0C;
    s32 val08;
    s16 val06;

    if (o->oAction == 0) {
        if (!(o->activeFlags & 0x0008)) {
            for (val08 = 0; val08 < 6; val08++) {
                val06 = D_80331C00[val08].unk02;

                val0C = spawn_object_relative(val08 & 0x00000001, D_80331C00[val08].unk00, 0, val06, o,
                                              MODEL_BBH_WOODEN_TOMB, bhvHauntedRoomCheckSubobject);
                if (val0C != NULL) {
                    if (val06 > 0) {
                        val0C->oFaceAngleYaw = 0x8000;
                    }
                }
            }

            o->oAction += 1;
        }
    } else if (o->activeFlags & 0x0008) {
        o->oAction = 0;
    }
}

void func_80311264(void) {
    f32 val14;
    f32 val10;
    f32 val0C;
    f32 val08;
    f32 val04;
    f32 val00;

    if (o->oBehParams2ndByte != 0) {
        if (o->oFaceAnglePitch != 0) {
            o->oAngleVelPitch = approach_s16_symmetric(o->oAngleVelPitch, -2000, 200);

            if (obj_face_pitch_approach(0, -o->oAngleVelPitch)) {
                PlaySound2(SOUND_GENERAL_ELEVATORMOVE_2);
                obj_perform_position_op(0);
                o->oMoveAngleYaw = o->oFaceAngleYaw - 0x4000;

                obj_set_dist_from_home(200.0f);
                func_802ADA94();
                obj_perform_position_op(2);
            }

            o->oTimer = 0;
        } else {
            val14 = coss(o->oFaceAngleYaw);
            val10 = sins(o->oFaceAngleYaw);

            val0C = gMarioObject->oPosX - o->oPosX;
            val08 = gMarioObject->oPosZ - o->oPosZ;

            val04 = val0C * val14 + val08 * val10;
            val00 = val08 * val14 - val0C * val10;

            if (o->oTimer > 60
                && (o->oDistanceToMario > 100.0f || gMarioState->action == ACT_SQUISHED)) {
                if (gMarioObject->oPosY - o->oPosY < 200.0f && absf(val04) < 140.0f) {
                    if (val00 < 150.0f && val00 > -450.0f) {
                        PlaySound2(SOUND_GENERAL_BUTTONPRESS_2_LOWPRIO);
                        o->oAction = 1;
                    }
                }
            }

            o->oAngleVelPitch = 0;
        }
    }
}

void func_80311520(void) {
    if (o->oFaceAnglePitch != 0x4000) {
        o->oAngleVelPitch = approach_s16_symmetric(o->oAngleVelPitch, 1000, 200);
        obj_face_pitch_approach(0x4000, o->oAngleVelPitch);
    } else {
        if (o->oTimer > 60) {
            o->oAction = 0;
            o->oFaceAngleRoll = 0;
        } else if (o->oTimer > 30) {
            if (gGlobalTimer % 4 == 0) {
                PlaySound2(SOUND_GENERAL_ELEVATORMOVE_2);
            }
            o->oFaceAngleRoll = 400 * (gGlobalTimer % 2) - 200;
        }

        o->oAngleVelPitch = 0;
    }
}

void BehHauntedRoomCheckSubobjectLoop(void) {
    if (o->parentObj->oAction == 0) {
        mark_object_for_deletion(o);
    } else {
        o->header.gfx.scale[1] = 1.1f;

        switch (o->oAction) {
            case 0:
                func_80311264();
                break;
            case 1:
                func_80311520();
                break;
        }

        load_object_collision_model();
    }
}

struct ObjectHitbox sClamShellHitbox = {
    /* interactType:      */ INTERACT_CLAM_OR_BUBBA,
    /* downOffset:        */ 0,
    /* damageOrCoinValue: */ 2,
    /* health:            */ 99,
    /* numLootCoins:      */ 0,
    /* radius:            */ 150,
    /* height:            */ 80,
    /* hurtboxRadius:     */ 150,
    /* hurtboxHeight:     */ 80,
};

void func_803116F8(void) {
    if (func_802F92EC(0, 25)) {
        PlaySound2(SOUND_GENERAL_CLAMSHELL4);
        func_802ADA94();
        obj_become_tangible();

        o->oClamUnkF4 = 10;
        o->oTimer = 0;
    } else if (o->oTimer > 150 && o->oDistanceToMario < 500.0f) {
        PlaySound2(SOUND_GENERAL_CLAMSHELL3);
        o->oAction = 1;
    } else if (o->oClamUnkF4 != 0) {
        o->oClamUnkF4 -= 1;
        obj_shake_y(3.0f);
    }
}

void func_803117F4(void) {
    s16 val06;
    s16 val04;
    s16 val02;

    if (o->oTimer > 150) {
        o->oAction = 0;
    } else if (obj_is_rendering_enabled() && func_802F92EC(1, 8)) {
        for (val06 = -0x2000; val06 < 0x2000; val06 += 0x555) {
            val04 = (s16)(100.0f * sins(val06));
            val02 = (s16)(100.0f * coss(val06));

            spawn_object_relative(0, val04, 30, val02, o, MODEL_BUBBLE, bhvBubbleMaybe);
        }
    } else if (obj_check_anim_frame(30)) {
        obj_become_intangible();
    }
}

void BehClamShellLoop(void) {
    o->header.gfx.scale[1] = 1.5f;

    switch (o->oAction) {
        case 0:
            func_803116F8();
            break;
        case 1:
            func_803117F4();
            break;
    }

    obj_check_attacks(&sClamShellHitbox, o->oAction);
}

#include "behaviors/skeeter.inc.c"
#include "behaviors/swing_platform.inc.c"
#include "behaviors/donut_platform.inc.c"
#include "behaviors/ddd_pole.inc.c"
#include "behaviors/reds_star_marker.inc.c"
#include "behaviors/triplet_butterfly.inc.c"

static struct ObjectHitbox sBubbaHitbox = {
    /* interactType:      */ INTERACT_CLAM_OR_BUBBA,
    /* downOffset:        */ 0,
    /* damageOrCoinValue: */ 1,
    /* health:            */ 99,
    /* numLootCoins:      */ 0,
    /* radius:            */ 300,
    /* height:            */ 200,
    /* hurtboxRadius:     */ 300,
    /* hurtboxHeight:     */ 200,
};

void func_80312F8C(void) {
    f32 sp24;

    sp24 = obj_lateral_dist_to_home();
    treat_far_home_as_mario(2000.0f);
    o->oAnimState = 0;

    o->oBubbaUnk1AC = obj_get_pitch_to_home(sp24);

    approach_f32_ptr(&o->oBubbaUnkF4, 5.0f, 0.5f);

    if (o->oBubbaUnkFC != 0) {
        if (abs_angle_diff(o->oMoveAngleYaw, o->oBubbaUnk1AE) < 800) {
            o->oBubbaUnkFC = 0;
        }
    } else {
        if (o->oDistanceToMario >= 25000.0f) {
            o->oBubbaUnk1AE = o->oAngleToMario;
            o->oBubbaUnkF8 = random_linear_offset(20, 30);
        }

        if ((o->oBubbaUnkFC = o->oMoveFlags & 0x00000200) != 0) {
            o->oBubbaUnk1AE = obj_reflect_move_angle_off_wall();
        } else if (o->oTimer > 30 && o->oDistanceToMario < 2000.0f) {
            o->oAction = 1;
        } else if (o->oBubbaUnkF8 != 0) {
            o->oBubbaUnkF8 -= 1;
        } else {
            o->oBubbaUnk1AE = obj_random_fixed_turn(0x2000);
            o->oBubbaUnkF8 = random_linear_offset(100, 100);
        }
    }
}

void func_80313170(void) {
    s16 val06;
    s16 val04;

    treat_far_home_as_mario(2500.0f);
    if (o->oDistanceToMario > 2500.0f) {
        o->oAction = 0;
    } else if (o->oBubbaUnk100 != 0) {
        if (--o->oBubbaUnk100 == 0) {
            PlaySound2(SOUND_OBJECT_CHOMPINGSOUND);
            o->oAction = 0;
        } else if (o->oBubbaUnk100 < 15) {
            o->oAnimState = 1;
        } else if (o->oBubbaUnk100 == 20) {
            val06 = 10000 - (s16)(20.0f * (find_water_level(o->oPosX, o->oPosZ) - o->oPosY));
            o->oBubbaUnk1AC -= val06;
            o->oMoveAnglePitch = o->oBubbaUnk1AC;
            o->oBubbaUnkF4 = 40.0f;
            obj_compute_vel_from_move_pitch(o->oBubbaUnkF4);
            o->oAnimState = 0;
            ;
        } else {
            o->oBubbaUnk1AE = o->oAngleToMario;
            o->oBubbaUnk1AC = o->oBubbaUnk104;

            obj_rotate_yaw_toward(o->oBubbaUnk1AE, 400);
            obj_move_pitch_approach(o->oBubbaUnk1AC, 400);
        }
    } else {
        if (abs_angle_diff(gMarioObject->oFaceAngleYaw, o->oAngleToMario) < 0x3000) {
            val04 = 0x4000 - atan2s(800.0f, o->oDistanceToMario - 800.0f);
            if ((s16)(o->oMoveAngleYaw - o->oAngleToMario) < 0) {
                val04 = -val04;
            }

            o->oBubbaUnk1AE = o->oAngleToMario + val04;
            ;
        } else {
            o->oBubbaUnk1AE = o->oAngleToMario;
        }

        o->oBubbaUnk1AC = o->oBubbaUnk104;

        if (obj_is_near_to_and_facing_mario(500.0f, 3000)
            && abs_angle_diff(o->oBubbaUnk1AC, o->oMoveAnglePitch) < 3000) {
            o->oBubbaUnk100 = 30;
            o->oBubbaUnkF4 = 0;
            o->oAnimState = 1;
        } else {
            approach_f32_ptr(&o->oBubbaUnkF4, 20.0f, 0.5f);
        }
    }
}

void BehBubbaLoop(void) {
    UNUSED s32 unused;
    struct Object *sp38;
    s16 sp36;

    o->oUnk190 &= ~0x00002000;
    o->oBubbaUnk104 = obj_turn_pitch_toward_mario(120.0f, 0);

    if (abs_angle_diff(o->oAngleToMario, o->oMoveAngleYaw) < 0x1000
        && abs_angle_diff(o->oBubbaUnk104 + 0x800, o->oMoveAnglePitch) < 0x2000) {
        if (o->oAnimState != 0 && o->oDistanceToMario < 250.0f) {
            o->oUnk190 |= 0x00002000;
        }

        o->hurtboxRadius = 100.0f;
    } else {
        o->hurtboxRadius = 150.0f;
    }

    obj_update_floor_and_walls();

    switch (o->oAction) {
        case 0:
            func_80312F8C();
            break;
        case 1:
            func_80313170();
            break;
    }

    if (o->oMoveFlags & 0x00000078) {
        if (o->oMoveFlags & 0x00000008) {
            sp38 = spawn_object(o, MODEL_WATER_SPLASH, bhvWaterSplash);
            if (sp38 != NULL) {
                scale_object(sp38, 3.0f);
            }

            o->oBubbaUnk108 = o->oVelY;
            o->oBubbaUnk10C = 0.0f;
            ;
        } else {
            approach_f32_ptr(&o->oBubbaUnk108, 0.0f, 4.0f);
            if ((o->oBubbaUnk10C -= o->oBubbaUnk108) > 1.0f) {
                sp36 = RandomU16();
                o->oBubbaUnk10C -= 1.0f;
                spawn_object_relative(0, 150.0f * coss(sp36), 0x64, 150.0f * sins(sp36), o,
                                      MODEL_WHITE_PARTICLE_SMALL, bhvSmallParticleSnow);
            }
        }

        obj_smooth_turn(&o->oBubbaUnk1B0, &o->oMoveAnglePitch, o->oBubbaUnk1AC, 0.05f, 10, 50, 2000);
        obj_smooth_turn(&o->oBubbaUnk1B2, &o->oMoveAngleYaw, o->oBubbaUnk1AE, 0.05f, 10, 50, 2000);
        obj_compute_vel_from_move_pitch(o->oBubbaUnkF4);
    } else {
        o->oBubbaUnkF4 = sqrtf(o->oForwardVel * o->oForwardVel + o->oVelY * o->oVelY);
        o->oMoveAnglePitch = obj_get_pitch_from_vel();
        obj_face_pitch_approach(o->oMoveAnglePitch, 400);
        o->oBubbaUnk1B0 = 0;
    }

    obj_face_pitch_approach(o->oMoveAnglePitch, 400);
    obj_check_attacks(&sBubbaHitbox, o->oAction);

    obj_move_standard(78);

    o->oFloorHeight += 150.0f;
    if (o->oPosY < o->oFloorHeight) {
        o->oPosY = o->oFloorHeight;
    }
}
