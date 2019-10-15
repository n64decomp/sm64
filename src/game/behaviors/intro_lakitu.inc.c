/**
 * @file intro_lakitu.inc.c
 * This file implements lakitu's behvaior during the intro cutscene.
 * It's also used during the ending cutscene.
 */


/**
 * Add the camera's position to `offset`, rotate the point to be relative to the camera's focus, then
 * set lakitu's location.
 */
void intro_lakitu_set_offset_from_camera(struct Object *o, Vec3f offset) {
    f32 dist;
    Vec3s focusAngles;
    s16 offsetPitch, offsetYaw;

    vec3f_add(offset, gCurrLevelCamera->pos);
    vec3f_get_dist_and_angle(gCurrLevelCamera->pos, gCurrLevelCamera->focus,
                             &dist, &focusAngles[0], &focusAngles[1]);
    vec3f_get_dist_and_angle(gCurrLevelCamera->pos, offset, &dist, &offsetPitch, &offsetYaw);
    vec3f_set_dist_and_angle(gCurrLevelCamera->pos, offset, dist,
                             focusAngles[0] + offsetPitch, focusAngles[1] + offsetYaw);
    vec3f_to_object_pos(o, offset);
}

void intro_lakitu_set_focus(struct Object *o, Vec3f newFocus) {
    UNUSED Vec3f unusedVec3f;
    Vec3f origin;
    f32 dist;
    s16 pitch, yaw;
    UNUSED u32 unused;

    // newFocus is an offset from lakitu's origin, not a point in the world.
    vec3f_set(origin, 0.f, 0.f, 0.f);
    vec3f_get_dist_and_angle(origin, newFocus, &dist, &pitch, &yaw);
    o->oFaceAnglePitch = pitch;
    o->oFaceAngleYaw = yaw;
}

/**
 * Move lakitu along the spline `offset`, relative to the camera, and face him towards the corresponding
 * location along the spline `focus`.
 */
s32 intro_lakitu_set_pos_and_focus(struct Object *o, struct CutsceneSplinePoint offset[],
                                   struct CutsceneSplinePoint focus[]) {
    Vec3f newOffset, newFocus;
    s32 splineFinished = 0;
    s16 splineSegment = o->oIntroLakituSplineSegment;

    if ((move_point_along_spline(newFocus, offset, &splineSegment, &(o->oIntroLakituSplineSegmentProgress)) == 1)
        || (move_point_along_spline(newOffset, focus, &splineSegment, &(o->oIntroLakituSplineSegmentProgress)) == 1))
        splineFinished += 1;

    o->oIntroLakituSplineSegment = splineSegment;
    intro_lakitu_set_offset_from_camera(o, newOffset);
    intro_lakitu_set_focus(o, newFocus);
    return splineFinished;
}

void bhv_intro_lakitu_loop(void) {
    Vec3f sp64, sp58, sp4C;
    UNUSED u32 pad[4];

    switch (gCurrentObject->oAction) {
        case 0:
            obj_disable_rendering();
            gCurrentObject->oIntroLakituSplineSegment = 0.f;
            gCurrentObject->oIntroLakituSplineSegmentProgress = 0.f;
            gCurrentObject->oIntroLakituCloud =
                spawn_object_relative_with_scale(1, 0, 0, 0, 2.f, gCurrentObject, MODEL_MIST, bhvCloud);
            if (gCurrLevelCamera->cutscene == CUTSCENE_END_WAVING)
                gCurrentObject->oAction = 100;
            else
                gCurrentObject->oAction += 1;
            break;

        case 1:
            obj_enable_rendering();
            if ((gCutsceneTimer > 350) && (gCutsceneTimer < 458)) {
                gCurrentObject->oPosX = gCurrLevelCamera->pos[0];
                gCurrentObject->oPosY = gCurrLevelCamera->pos[1] + 500.f;
                gCurrentObject->oPosZ = gCurrLevelCamera->pos[2];
            }
            if (gCutsceneTimer > 52)
                PlaySound(SOUND_AIR_LAKITU_FLY_HIGHPRIO);

            if (intro_lakitu_set_pos_and_focus(gCurrentObject, gIntroLakituStartToPipeOffsetFromCamera,
                                               gIntroLakituStartToPipeFocus) == 1)
                gCurrentObject->oAction += 1;

            switch (gCurrentObject->oTimer) {
#ifdef VERSION_US
                case 534:
                    PlaySound2(SOUND_ACTION_UNKNOWN456);
                    break;
                case 581:
                    PlaySound2(SOUND_ACTION_UNKNOWN45E);
                    break;
#endif
                case 73:
                    gCurrentObject->oAnimState += 1;
                    break;
                case 74:
                    gCurrentObject->oAnimState -= 1;
                    break;
                case 82:
                    gCurrentObject->oAnimState += 1;
                    break;
                case 84:
                    gCurrentObject->oAnimState -= 1;
                    break;
            }
#ifdef VERSION_EU
            if (gCurrentObject->oTimer == 446)
                PlaySound2(SOUND_ACTION_UNKNOWN456);
            if (gCurrentObject->oTimer == 485)
                PlaySound2(SOUND_ACTION_UNKNOWN45E);
#endif
            break;
        case 2:
            if (gCutsceneTimer > 720) {
                gCurrentObject->oAction += 1;
                gCurrentObject->oIntroLakituUnk100 = 1400.f;
                gCurrentObject->oIntroLakituUnk104 = -4096.f;
                gCurrentObject->oIntroLakituUnk108 = 2048.f;
                gCurrentObject->oIntroLakituUnk10C = -200.f;
                gCurrentObject->oMoveAngleYaw = 0x8000;
                gCurrentObject->oFaceAngleYaw = gCurrentObject->oMoveAngleYaw + 0x4000;
                gCurrentObject->oMoveAnglePitch = 0x800;
            }
            PlaySound(SOUND_AIR_LAKITU_FLY_HIGHPRIO);
            break;

        case 3:
            PlaySound(SOUND_AIR_LAKITU_FLY_HIGHPRIO);
            vec3f_set(sp58, -1128.f, 560.f, 4664.f);
            gCurrentObject->oMoveAngleYaw += 0x200;
            gCurrentObject->oIntroLakituUnk100 =
                approach_f32_exponential(gCurrentObject->oIntroLakituUnk100, 100.f, 0.03f);
            gCurrentObject->oFaceAnglePitch = atan2s(200.f, gCurrentObject->oPosY - 400.f);
            gCurrentObject->oFaceAngleYaw = approach_s16_exponential(
                gCurrentObject->oFaceAngleYaw, gCurrentObject->oMoveAngleYaw + 0x8000, 4);
            vec3f_set_dist_and_angle(sp58, sp4C, gCurrentObject->oIntroLakituUnk100, 0,
                                     gCurrentObject->oMoveAngleYaw);
            sp4C[1] += 150.f * coss((s16) gCurrentObject->oIntroLakituUnk104);
            gCurrentObject->oIntroLakituUnk104 += gCurrentObject->oIntroLakituUnk108;
            gCurrentObject->oIntroLakituUnk108 =
                approach_f32_exponential(gCurrentObject->oIntroLakituUnk108, 512.f, 0.05f);
            sp4C[0] += gCurrentObject->oIntroLakituUnk10C;
            gCurrentObject->oIntroLakituUnk10C =
                approach_f32_exponential(gCurrentObject->oIntroLakituUnk10C, 0.f, 0.05f);
            vec3f_to_object_pos(gCurrentObject, sp4C);

            if (gCurrentObject->oTimer == 31) {
                gCurrentObject->oPosY -= 158.f;
                // Spawn white ground particles
                func_802ADA94();
                gCurrentObject->oPosY += 158.f;
            }
#ifdef VERSION_EU
#define TIMER 74
#else
#define TIMER 98
#endif

            if (gCurrentObject->oTimer == TIMER) {
                mark_object_for_deletion(gCurrentObject);
                mark_object_for_deletion(gCurrentObject->oIntroLakituCloud);
            }
#ifndef VERSION_JP
            if (gCurrentObject->oTimer == 14)
                PlaySound2(SOUND_ACTION_UNKNOWN45F);
#endif
            break;
        case 100:
            obj_enable_rendering();
            vec3f_set(sp64, -100.f, 100.f, 300.f);
            set_pos_from_face_angle_and_vec3f(sp4C, gCurrLevelCamera->pos, sp64,
                                              sMarioStatusForCamera->faceAngle);
            vec3f_to_object_pos(gCurrentObject, sp4C);
            gCurrentObject->oMoveAnglePitch = 0x1000;
            gCurrentObject->oMoveAngleYaw = 0x9000;
            gCurrentObject->oFaceAnglePitch = gCurrentObject->oMoveAnglePitch / 2;
            gCurrentObject->oFaceAngleYaw = gCurrentObject->oMoveAngleYaw;
            gCurrentObject->oAction += 1;
            break;

        case 101:
            object_pos_to_vec3f(sp4C, gCurrentObject);
            if (gCurrentObject->oTimer > 60) {
                gCurrentObject->oForwardVel =
                    approach_f32_exponential(gCurrentObject->oForwardVel, -10.f, 0.05f);
                gCurrentObject->oMoveAngleYaw += 0x78;
                gCurrentObject->oMoveAnglePitch += 0x40;
                gCurrentObject->oFaceAngleYaw = camera_approach_s16_symmetric(
                    gCurrentObject->oFaceAngleYaw, (s16) calculate_yaw(sp4C, gCurrLevelCamera->pos),
                    0x200);
            }
            if (gCurrentObject->oTimer > 105) {
                gCurrentObject->oAction += 1;
                gCurrentObject->oMoveAnglePitch = 0xE00;
            }
            gCurrentObject->oFaceAnglePitch = 0;
            func_802A2A38();
            break;

        case 102:
            object_pos_to_vec3f(sp4C, gCurrentObject);
            gCurrentObject->oForwardVel =
                approach_f32_exponential(gCurrentObject->oForwardVel, 60.f, 0.05f);
            gCurrentObject->oFaceAngleYaw = camera_approach_s16_symmetric(
                gCurrentObject->oFaceAngleYaw, (s16) calculate_yaw(sp4C, gCurrLevelCamera->pos), 0x200);
            if (gCurrentObject->oTimer < 62)
                gCurrentObject->oMoveAngleYaw =
                    approach_s16_exponential(gCurrentObject->oMoveAngleYaw, 0x1800, 0x1E);
            gCurrentObject->oMoveAnglePitch =
                camera_approach_s16_symmetric(gCurrentObject->oMoveAnglePitch, -0x2000, 0x5A);
            gCurrentObject->oFaceAnglePitch = 0;
            func_802A2A38();
            break;
    }
}
#undef TIMER