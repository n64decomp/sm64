#include <ultra64.h>

#include "sm64.h"
#include "game.h"
#include "mario.h"
#include "memory.h"
#include "save_file.h"
#include "engine/surface_collision.h"
#include "engine/graph_node.h"
#include "geo_misc.h"
#include "area.h"
#include "segment2.h"
#include "paintings.h"

s16 gPaintingMarioFloorType;
float gPaintingMarioXPos, gPaintingMarioYPos, gPaintingMarioZPos;
struct Thing *D_8035FFA0;
Vec3f *D_8035FFA4;
struct Painting *ripplingPainting;
s8 dddStatus;

struct Painting *hmcPaintings[] = {
    &cotmc_painting,
    NULL,
};

struct Painting *insideCastlePaintings[] = {
    &bob_painting, &ccm_painting, &wf_painting,  &jrb_painting,      &lll_painting,
    &ssl_painting, &hmc_painting, &ddd_painting, &wdw_painting,      &thi_tiny_painting,
    &ttm_painting, &ttc_painting, &sl_painting,  &thi_huge_painting, NULL,
};

struct Painting *ttmPaintings[] = {
    &ttm_slide_painting,
    NULL,
};

struct Painting **paintingGroups[] = {
    hmcPaintings,
    insideCastlePaintings,
    ttmPaintings,
};

s16 gPaintingUpdateCounter = 1;
s16 gLastPaintingUpdateCounter = 0;

void stopAllRippleExcept(s16 *idptr, struct Painting *paintingGroup[]) {
    s16 index;
    s16 id = *idptr;

    index = 0;
    while (paintingGroup[index] != NULL) // for each painting
    {
        struct Painting *painting = segmented_to_virtual(paintingGroup[index]);
        if (painting->id != id) {
            painting->rippleStatus = 0; // stop all rippling except for the selected painting
        }
        index++;
    }
}

float find_mario_y_position_on_painting(struct Painting *painting) {
    //! unnecessary use of double constants
    float marioYOffsetFromPainting = gPaintingMarioYPos - painting->vYPos + 50.0;

    if (marioYOffsetFromPainting < 0.0) {
        marioYOffsetFromPainting = 0.0; // If Mario is below the bottom, return the bottom
    } else if (marioYOffsetFromPainting
               > painting->vSize) { // If Mario is above the top, return the top
        marioYOffsetFromPainting = painting->vSize;
    }
    return marioYOffsetFromPainting;
}

float find_mario_z_position_on_painting(struct Painting *painting) {
    float marioZOffsetFromPainting = painting->vZPos - gPaintingMarioZPos;

    if (marioZOffsetFromPainting < 0.0) {
        marioZOffsetFromPainting = 0.0; // If Mario is past the left side, return the left side
    } else if (marioZOffsetFromPainting > painting->vSize) {
        marioZOffsetFromPainting =
            painting->vSize; // If Mario is past the right side, return the right side
    }
    return marioZOffsetFromPainting;
}

float painting_find_vertical_ripple_location(struct Painting *painting, s8 rippleSpot) {
    switch (rippleSpot) {
        case MARIO_Y:
            return find_mario_y_position_on_painting(painting); // normal vertical paintings
            break;
        case MARIO_Z:
            return find_mario_z_position_on_painting(painting); // horizontal paintings use X and Z
            break;
        case MIDDLE_Y:
            return painting->vSize / 2.0; // some concentric ripples don't care about Mario
            break;
    }
}

float find_part_of_painting_near_mario(struct Painting *painting) {
    float firstQuarter = painting->vSize / 4.0;       // 1/4 of the way across the painting
    float secondQuarter = painting->vSize / 2.0;      // 1/2 of the way across the painting
    float thirdQuarter = painting->vSize * 3.0 / 4.0; // 3/4 of the way across the painting

    if (painting->floorEntered & STAND_LEFT) {
        return firstQuarter;
    } else if (painting->floorEntered & STAND_MIDDLE) {
        return secondQuarter;
    } else if (painting->floorEntered & STAND_RIGHT) {
        return thirdQuarter;
    } else if (painting->floorEntered & ENTER_LEFT) {
        return firstQuarter;
    } else if (painting->floorEntered & ENTER_MIDDLE) {
        return secondQuarter;
    } else if (painting->floorEntered & ENTER_RIGHT) {
        return thirdQuarter;
    }
}

float find_mario_x_position_on_painting(struct Painting *painting) {
    float mario_x_offset_from_painting = gPaintingMarioXPos - painting->vXPos;

    if (mario_x_offset_from_painting < 0.0) {
        mario_x_offset_from_painting = 0.0; // If Mario is past the left side, return the left side
    } else if (mario_x_offset_from_painting > painting->vSize) {
        mario_x_offset_from_painting =
            painting->vSize; // If Mario is past the right side, return the right side
    }
    return mario_x_offset_from_painting;
}

float painting_find_horizontal_ripple_location(struct Painting *painting, s8 rippleSpot) {
    switch (rippleSpot) {
        case NEAR_MARIO_LATERALLY: // normal vertical paintings
            return find_part_of_painting_near_mario(painting);
            break;
        case MARIO_X: // horizontally placed paintings use X and Z
            return find_mario_x_position_on_painting(painting);
            break;
        case MIDDLE_X: // concentric rippling may not care about Mario
            return painting->vSize / 2.0;
            break;
    }
}

void painting_set_ripple_type(s8 intendedStatus, struct Painting *painting,
                              struct Painting *paintingGroup[], s8 hRippleSpot, s8 vRippleSpot,
                              s8 resetTimer) {
    stopAllRippleExcept(&painting->id, paintingGroup); // make sure no other paintings are rippling
    switch (intendedStatus) // set the variables necessary for the given ripple status
    {
        case RIPPLE_STATE_IDLE:
            painting->currRippleMag = painting->passiveRippleMag;
            painting->rippleMagMultiplier = painting->passiveRippleMagMultiplier;
            painting->currRippleRate = painting->passiveRippleRate;
            painting->dispersionFactor = painting->passiveDispersionFactor;
            break;
        case RIPPLE_STATE_ENTRY:
            painting->currRippleMag = painting->entryRippleMag;
            painting->rippleMagMultiplier = painting->entryRippleMagMultiplier;
            painting->currRippleRate = painting->entryRippleRate;
            painting->dispersionFactor = painting->entryDispersionFactor;
            break;
    }
    painting->rippleStatus = intendedStatus;
    painting->horizontalRippleSpot =
        painting_find_horizontal_ripple_location(painting, hRippleSpot); // find the ripple location
    painting->verticalRippleSpot = painting_find_vertical_ripple_location(painting, vRippleSpot);
    gPaintingMarioYEntry = gPaintingMarioYPos;
    if (resetTimer == RESET_TIMER) {
        painting->rippleTimer = 0.0f;
    }
    ripplingPainting = painting;
}

void vertical_proximity_ripple_painting_ripple(
    struct Painting *painting,
    struct Painting
        *paintingGroup[]) // For paintings aligned vertically that follow RIPPLE_TRIGGER_PROXIMITY, set
                          // some flags depending on where Mario is
{
    if (painting->floorEntered & STAND_LEFT) {
        painting_set_ripple_type(RIPPLE_STATE_IDLE, painting, paintingGroup, NEAR_MARIO_LATERALLY,
                                 MARIO_Y, RESET_TIMER);
    } else if (painting->floorEntered & STAND_MIDDLE) {
        painting_set_ripple_type(RIPPLE_STATE_IDLE, painting, paintingGroup, NEAR_MARIO_LATERALLY,
                                 MARIO_Y, RESET_TIMER);
    } else if (painting->floorEntered & STAND_RIGHT) {
        painting_set_ripple_type(RIPPLE_STATE_IDLE, painting, paintingGroup, NEAR_MARIO_LATERALLY,
                                 MARIO_Y, RESET_TIMER);
    } else if (painting->floorEntered & ENTER_LEFT) {
        painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, NEAR_MARIO_LATERALLY,
                                 MARIO_Y, RESET_TIMER);
    } else if (painting->floorEntered & ENTER_MIDDLE) {
        painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, NEAR_MARIO_LATERALLY,
                                 MARIO_Y, RESET_TIMER);
    } else if (painting->floorEntered & ENTER_RIGHT) {
        painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, NEAR_MARIO_LATERALLY,
                                 MARIO_Y, RESET_TIMER);
    }
}

void vertical_proximity_ripple_painting_ripple_if_mario_enters(
    struct Painting *painting,
    struct Painting *paintingGroup[]) // For paintings aligned vertically that follow
                                          // RIPPLE_TRIGGER_PROXIMITY, set some flags if Mario enters
{
    if (painting->floorEntered & ENTER_LEFT) {
        painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, NEAR_MARIO_LATERALLY,
                                 MARIO_Y, RESET_TIMER);
    } else if (painting->floorEntered & ENTER_MIDDLE) {
        painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, NEAR_MARIO_LATERALLY,
                                 MARIO_Y, RESET_TIMER);
    } else if (painting->floorEntered & ENTER_RIGHT) {
        painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, NEAR_MARIO_LATERALLY,
                                 MARIO_Y, RESET_TIMER);
    }
}

void vertical_continuous_ripple_painting_ripple(
    struct Painting *painting,
    struct Painting
        *paintingGroup[]) // For paintings aligned vertically that follow RIPPLE_TRIGGER_CONTINUOUS (DDD
                          // only), set some flags depending on where Mario is
{
    if (painting->floorEntered & STAND_LEFT) {
        painting_set_ripple_type(RIPPLE_STATE_IDLE, painting, paintingGroup, MIDDLE_X, MIDDLE_Y,
                                 RESET_TIMER);
    } else if (painting->floorEntered & STAND_MIDDLE) {
        painting_set_ripple_type(RIPPLE_STATE_IDLE, painting, paintingGroup, MIDDLE_X, MIDDLE_Y,
                                 RESET_TIMER);
    } else if (painting->floorEntered & STAND_RIGHT) {
        painting_set_ripple_type(RIPPLE_STATE_IDLE, painting, paintingGroup, MIDDLE_X, MIDDLE_Y,
                                 RESET_TIMER);
    } else if (painting->floorEntered & ENTER_LEFT) {
        painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, NEAR_MARIO_LATERALLY,
                                 MARIO_Y, RESET_TIMER);
    } else if (painting->floorEntered & ENTER_MIDDLE) {
        painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, NEAR_MARIO_LATERALLY,
                                 MARIO_Y, RESET_TIMER);
    } else if (painting->floorEntered & ENTER_RIGHT) {
        painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, NEAR_MARIO_LATERALLY,
                                 MARIO_Y, RESET_TIMER);
    }
}

void vertical_continuous_ripple_painting_ripple_if_mario_enters(
    struct Painting *painting,
    struct Painting
        *paintingGroup[]) // For paintings aligned vertically that follow RIPPLE_TRIGGER_CONTINUOUS (DDD
                          // only), set some flags if Mario enters
{
    if (painting->floorEntered & ENTER_LEFT) {
        painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, NEAR_MARIO_LATERALLY,
                                 MARIO_Y, DONT_RESET_TIMER);
    } else if (painting->floorEntered & ENTER_MIDDLE) {
        painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, NEAR_MARIO_LATERALLY,
                                 MARIO_Y, DONT_RESET_TIMER);
    } else if (painting->floorEntered & ENTER_RIGHT) {
        painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, NEAR_MARIO_LATERALLY,
                                 MARIO_Y, DONT_RESET_TIMER);
    }
}

void horizontal_proximity_ripple_painting_ripple(
    struct Painting *painting,
    struct Painting
        *paintingGroup[]) // For paintings aligned horizontally that follow RIPPLE_TRIGGER_PROXIMITY
                          // (these are not found in-game), set some flags depending on where Mario is
{
    if (painting->floorEntered & STAND_LEFT) {
        painting_set_ripple_type(RIPPLE_STATE_IDLE, painting, paintingGroup, MARIO_X, MARIO_Z,
                                 RESET_TIMER);
    } else if (painting->floorEntered & STAND_MIDDLE) {
        painting_set_ripple_type(RIPPLE_STATE_IDLE, painting, paintingGroup, MARIO_X, MARIO_Z,
                                 RESET_TIMER);
    } else if (painting->floorEntered & STAND_RIGHT) {
        painting_set_ripple_type(RIPPLE_STATE_IDLE, painting, paintingGroup, MARIO_X, MARIO_Z,
                                 RESET_TIMER);
    } else if (painting->marioNewlyUnderPainting) {
        if (painting->currFloor & ENTER_LEFT) {
            painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, MARIO_X, MARIO_Z,
                                     RESET_TIMER);
        } else if (painting->currFloor & ENTER_MIDDLE) {
            painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, MARIO_X, MARIO_Z,
                                     RESET_TIMER);
        } else if (painting->currFloor & ENTER_RIGHT) {
            painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, MARIO_X, MARIO_Z,
                                     RESET_TIMER);
        }
    }
}

void horizontal_proximity_ripple_painting_ripple_if_mario_enters(
    struct Painting *painting,
    struct Painting
        *paintingGroup[]) // For paintings aligned horizontally that follow RIPPLE_TRIGGER_PROXIMITY
                          // (these are not found in-game), set some flags if Mario enters
{
    if (painting->marioNewlyUnderPainting) {
        if (painting->currFloor & ENTER_LEFT) {
            painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, MARIO_X, MARIO_Z,
                                     RESET_TIMER);
        } else if (painting->currFloor & ENTER_MIDDLE) {
            painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, MARIO_X, MARIO_Z,
                                     RESET_TIMER);
        } else if (painting->currFloor & ENTER_RIGHT) {
            painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, MARIO_X, MARIO_Z,
                                     RESET_TIMER);
        }
    }
}

void horizontal_continuous_ripple_painting_ripple(
    struct Painting *painting,
    struct Painting
        *paintingGroup[]) // For paintings aligned horizontally that follow RIPPLE_TRIGGER_CONTINUOUS
                          // (HMC and CotMC), set some flags depending on where Mario is
{
    if (painting->floorEntered & STAND_LEFT) {
        painting_set_ripple_type(RIPPLE_STATE_IDLE, painting, paintingGroup, MIDDLE_X, MIDDLE_Y,
                                 RESET_TIMER);
    } else if (painting->floorEntered & STAND_MIDDLE) {
        painting_set_ripple_type(RIPPLE_STATE_IDLE, painting, paintingGroup, MIDDLE_X, MIDDLE_Y,
                                 RESET_TIMER);
    } else if (painting->floorEntered & STAND_RIGHT) {
        painting_set_ripple_type(RIPPLE_STATE_IDLE, painting, paintingGroup, MIDDLE_X, MIDDLE_Y,
                                 RESET_TIMER);
    } else if (painting->currFloor & ENTER_LEFT) {
        painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, MARIO_X, MARIO_Z,
                                 RESET_TIMER);
    } else if (painting->currFloor & ENTER_MIDDLE) {
        painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, MARIO_X, MARIO_Z,
                                 RESET_TIMER);
    } else if (painting->currFloor & ENTER_RIGHT) {
        painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, MARIO_X, MARIO_Z,
                                 RESET_TIMER);
    }
}

void horizontal_continuous_ripple_painting_ripple_if_mario_enters(
    struct Painting *painting,
    struct Painting
        *paintingGroup[]) // For paintings aligned horizontally that follow RIPPLE_TRIGGER_CONTINUOUS
                          // (HMC and CotMC), set some flags if Mario enters
{
    if (painting->marioNewlyUnderPainting) {
        if (painting->currFloor & ENTER_LEFT) {
            painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, MARIO_X, MARIO_Z,
                                     DONT_RESET_TIMER);
        } else if (painting->currFloor & ENTER_MIDDLE) {
            painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, MARIO_X, MARIO_Z,
                                     DONT_RESET_TIMER);
        } else if (painting->currFloor & ENTER_RIGHT) {
            painting_set_ripple_type(RIPPLE_STATE_ENTRY, painting, paintingGroup, MARIO_X, MARIO_Z,
                                     DONT_RESET_TIMER);
        }
    }
}

void painting_update_floors(struct Painting *painting) {
    s16 paintingId = painting->id;
    s8 leftSideStand = 0;
    s8 middleStand = 0;
    s8 rightSideStand = 0;
    s8 leftSideEnter = 0;
    s8 middleEnter = 0;
    s8 rightSideEnter = 0;

    /* The area in front of every painting in the game (except HMC and CotMC, which   *\
    |* act a little differently) is made up of 3 special floor triangles with special *|
    |* (unique) surface types. This code checks which surface Mario is currently on   *|
    \* and sets a bitfield accordingly.                                               */

    if (gPaintingMarioFloorType
        == paintingId * 3
               + SURFACE_PAINTING_WOBBLE_A6) { // check if Mario's current floor is one of the
                                               // special floors
        leftSideStand = STAND_LEFT;
    }
    if (gPaintingMarioFloorType == paintingId * 3 + SURFACE_PAINTING_WOBBLE_A7) {
        middleStand = STAND_MIDDLE;
    }
    if (gPaintingMarioFloorType == paintingId * 3 + SURFACE_PAINTING_WOBBLE_A8) {
        rightSideStand = STAND_RIGHT;
    }
    if (gPaintingMarioFloorType == paintingId * 3 + SURFACE_PAINTING_WARP_D3) {
        leftSideEnter = ENTER_LEFT;
    }
    if (gPaintingMarioFloorType == paintingId * 3 + SURFACE_PAINTING_WARP_D4) {
        middleEnter = ENTER_MIDDLE;
    }
    if (gPaintingMarioFloorType == paintingId * 3 + SURFACE_PAINTING_WARP_D5) {
        rightSideEnter = ENTER_RIGHT;
    }

    painting->lastFloor = painting->currFloor;
    painting->currFloor = leftSideStand + middleStand + rightSideStand + leftSideEnter + middleEnter
                          + rightSideEnter; // at most 1 of these will be nonzero;
    painting->floorEntered =
        (painting->lastFloor ^ painting->currFloor)
        & painting->currFloor; // floorEntered is true iff currFloor is true and lastFloor is false
                               // (Mario just entered the floor on this frame)
    painting->lastMarioUnderPainting = painting->currMarioUnderPainting;
    if (gPaintingMarioYPos < painting->vYPos) {
        painting->currMarioUnderPainting = 1; // If Mario is below the painting, set a variable
    } else {
        painting->currMarioUnderPainting = 0; // Otherwise, reset it
    }
    painting->marioNewlyUnderPainting =
        (painting->lastMarioUnderPainting ^ painting->currMarioUnderPainting)
        & painting->currMarioUnderPainting; // Again, marioNewlyUnderPainting is true iff he is under it
                                            // this frame but wasn't last frame.
}

void painting_update_ripple_status(struct Painting *painting) {
    if (gPaintingUpdateCounter != gLastPaintingUpdateCounter) {
        painting->currRippleMag *= painting->rippleMagMultiplier;
        painting->rippleTimer +=
            1.0; //! After ~6.47 days, paintings with RIPPLE_TRIGGER_CONTINUOUS will increment this to
                 //! 16777216 (1 << 24), at which point it will freeze (due to floating-point
                 //! imprecision?) and the painting will stop rippling. This happens to HMC, DDD, and
                 //! CotMC. This happens on Wii VC. Untested on N64 and Wii U VC.
    }
    if (painting->rippleTrigger == RIPPLE_TRIGGER_PROXIMITY) {
        if (painting->currRippleMag <= 1.0) // if the painting is barely rippling, make it stop rippling
        {
            painting->rippleStatus = RIPPLE_STATE_NONE;
            ripplingPainting = NULL;
        }
    } else if (painting->rippleTrigger == RIPPLE_TRIGGER_CONTINUOUS) {

        if (painting->rippleStatus == RIPPLE_STATE_ENTRY
            && painting->currRippleMag
                   <= painting->passiveRippleMag) // if the painting is doing the entry ripple but the
                                                  // ripples are as small as those from the passive
                                                  // ripple, make it do a passive ripple
        {
            painting->rippleStatus = RIPPLE_STATE_IDLE;
            painting->currRippleMag = painting->passiveRippleMag;
            painting->rippleMagMultiplier = painting->passiveRippleMagMultiplier;
            painting->currRippleRate = painting->passiveRippleRate;
            painting->dispersionFactor = painting->passiveDispersionFactor;
        }
    }
}

s16 painting_calculate_point_ripple(struct Painting *painting, float xpos,
                                    float ypos) // note that xpos and ypos correspond to a point on the
                                                // face of the painting, not actual axes
{
    float rippleMag = painting->currRippleMag;
    float rippleRate = painting->currRippleRate;
    float dispersionFactor = painting->dispersionFactor;
    float rippleTimer = painting->rippleTimer;
    float hRippleSpot = painting->horizontalRippleSpot;
    float vRippleSpot = painting->verticalRippleSpot;
    float distanceToRippleSpot;
    float scaledDistance;

    xpos *= painting->vSize / DEFAULT_HEIGHT; // scale x position of point by painting size
    ypos *= painting->vSize / DEFAULT_HEIGHT; // scale y position of point by painting size
    distanceToRippleSpot =
        sqrtf((xpos - hRippleSpot) * (xpos - hRippleSpot)
              + (ypos - vRippleSpot) * (ypos - vRippleSpot)); // distance from point to ripple spot
    scaledDistance =
        distanceToRippleSpot / dispersionFactor; // scale distance by dispersion factor so that ripples
                                                 // farther from the ripple spot are smaller
    if (rippleTimer < scaledDistance) {
        return 0; // if the ripple hasn't reached the point yet, make the point magnitude 0
    } else {

        float rippleHeight =
            rippleMag
            * cosf(rippleRate * (2 * M_PI)
                   * (rippleTimer
                      - scaledDistance)); // use a cosine wave to make the ripple go up and down, and
                                          // scale it by the painting's ripple magnitude

        return round_float(rippleHeight); // round it to an int and return it
    }
}

s16 painting_conditionally_calculate_point_ripple(struct Painting *painting, s16 condition,
                                                  s16 xpos, s16 ypos) {
    s16 rippleHeight = 0;

    if (condition) {
        rippleHeight = painting_calculate_point_ripple(painting, xpos, ypos);
    }
    return rippleHeight;
}

void Print1(struct Painting *painting, s16 *b, s16 c) {
    s16 sp1E;

    D_8035FFA0 = mem_pool_alloc(gEffectsMemoryPool, c * sizeof(struct Thing));
    if (D_8035FFA0 == NULL) {
    }
    for (sp1E = 0; sp1E < c; sp1E++) {
        D_8035FFA0[sp1E].unk0[0] = b[sp1E * 3 + 1];
        D_8035FFA0[sp1E].unk0[1] = b[sp1E * 3 + 2];
        D_8035FFA0[sp1E].unk0[2] = painting_conditionally_calculate_point_ripple(
            painting, b[(sp1E + 1) * 3], D_8035FFA0[sp1E].unk0[0], D_8035FFA0[sp1E].unk0[1]);
    }
}

void Print2(s16 *a, s16 b, s16 c) {
    s16 sp46;

    D_8035FFA4 = mem_pool_alloc(gEffectsMemoryPool, c * sizeof(Vec3f));
    if (D_8035FFA4 == NULL) {
    }
    for (sp46 = 0; sp46 < c; sp46++) {
        s16 sp44 = b * 3 + sp46 * 3 + 2;
        s16 sp42 = a[sp44];
        s16 sp40 = a[sp44 + 1];
        s16 sp3E = a[sp44 + 2];
        f32 sp38 = D_8035FFA0[sp42].unk0[0];
        f32 sp34 = D_8035FFA0[sp42].unk0[1];
        f32 sp30 = D_8035FFA0[sp42].unk0[2];
        f32 sp2C = D_8035FFA0[sp40].unk0[0];
        f32 sp28 = D_8035FFA0[sp40].unk0[1];
        f32 sp24 = D_8035FFA0[sp40].unk0[2];
        f32 sp20 = D_8035FFA0[sp3E].unk0[0];
        f32 sp1C = D_8035FFA0[sp3E].unk0[1];
        f32 sp18 = D_8035FFA0[sp3E].unk0[2];

        D_8035FFA4[sp46][0] = (sp28 - sp34) * (sp18 - sp24) - (sp24 - sp30) * (sp1C - sp28);
        D_8035FFA4[sp46][1] = (sp24 - sp30) * (sp20 - sp2C) - (sp2C - sp38) * (sp18 - sp24);
        D_8035FFA4[sp46][2] = (sp2C - sp38) * (sp1C - sp28) - (sp28 - sp34) * (sp20 - sp2C);
    }
}

s8 small_float_to_byte(float decimal) // This function converts a decimal to a signed byte by
                                      // multiplying it by 127 or 128 and rounding away from 0.
{
    s8 convertedFloat;

    if (decimal > 0.0) {
        convertedFloat = decimal * 127.0 + 0.5; // round up
    } else if (decimal < 0.0) {
        convertedFloat = decimal * 128.0 - 0.5; // round down
    } else {
        convertedFloat = 0; // don't round 0
    }
    return convertedFloat;
}

void func_802D39DC(s16 *a, s16 b) {
    UNUSED s16 unused;
    s16 sp34;
    s16 index;
    s16 index2;
    s16 sp2E;
    s16 sp2C = 0;

    for (index = 0; index < b; index++) {
        f32 sp28 = 0.0f;
        f32 sp24 = 0.0f;
        f32 sp20 = 0.0f;
        f32 sp1C;

        sp2E = a[sp2C];
        for (index2 = 0; index2 < sp2E; index2++) {
            sp34 = a[sp2C + index2 + 1];
            sp28 += D_8035FFA4[sp34][0];
            sp24 += D_8035FFA4[sp34][1];
            sp20 += D_8035FFA4[sp34][2];
        }
        sp2C += sp2E + 1;
        sp28 /= sp2E;
        sp24 /= sp2E;
        sp20 /= sp2E;
        sp1C = sqrtf(sp28 * sp28 + sp24 * sp24 + sp20 * sp20);
        if (sp1C == 0.0) {
            D_8035FFA0[index].unk6[0] = 0;
            D_8035FFA0[index].unk6[1] = 0;
            D_8035FFA0[index].unk6[2] = 0;
        } else {
            D_8035FFA0[index].unk6[0] = small_float_to_byte(sp28 / sp1C);
            D_8035FFA0[index].unk6[1] = small_float_to_byte(sp24 / sp1C);
            D_8035FFA0[index].unk6[2] = small_float_to_byte(sp20 / sp1C);
        }
    }
}

void *func_802D3CF0(u8 *img, s16 tWidth, s16 tHeight, s16 *d, s16 e, s16 f, u8 g) {
    s16 sp9E;
    s16 sp9C;
    s16 sp9A;
    s16 sp98;
    s16 sp96;
    s16 tx;
    s16 ty;
    s16 sp90 = f / 5;
    s16 sp8E = f % 5;
    s16 sp8C = f * 3;
    s16 sp8A = sp90 * 2 + sp8E + 7;
    Vtx *verts = alloc_display_list(sp8C * sizeof(*verts));
    Gfx *sp80 = alloc_display_list(sp8A * sizeof(*sp80));
    Gfx *sp7C = sp80;

    if (verts == NULL || sp80 == NULL) {
    }

    gDPSetTextureImage(sp7C++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, img);
    gDPTileSync(sp7C++);
    gDPSetTile(sp7C++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, 
        G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD);
    gDPLoadSync(sp7C++);
    gDPLoadBlock(sp7C++, G_TX_LOADTILE, 0, 0, tWidth * tHeight - 1, CALC_DXT(tWidth, G_IM_SIZ_16b_BYTES))

    for (sp9E = 0; sp9E < sp90; sp9E++) {
        sp9A = e * 3 + sp9E * 15 + 2;
        for (sp9C = 0; sp9C < 15; sp9C++) {
            sp98 = d[sp9A + sp9C];
            sp96 = d[sp98 * 3 + 1];
            tx = d[sp98 * 3 + 2];
            ty = d[sp98 * 3 + 3];
            make_vertex(verts, sp9E * 15 + sp9C, D_8035FFA0[sp96].unk0[0], D_8035FFA0[sp96].unk0[1],
                        D_8035FFA0[sp96].unk0[2], tx, ty, D_8035FFA0[sp96].unk6[0],
                        D_8035FFA0[sp96].unk6[1], D_8035FFA0[sp96].unk6[2], g);
        }
        gSPVertex(sp7C++, VIRTUAL_TO_PHYSICAL(verts + sp9E * 15), 15, 0);
        gSPDisplayList(sp7C++, dl_paintings_draw_ripples);
    }

    sp9A = e * 3 + sp90 * 15 + 2;
    for (sp9C = 0; sp9C < sp8E * 3; sp9C++) {
        sp98 = d[sp9A + sp9C];
        sp96 = d[sp98 * 3 + 1];
        tx = d[sp98 * 3 + 2];
        ty = d[sp98 * 3 + 3];
        make_vertex(verts, sp90 * 15 + sp9C, D_8035FFA0[sp96].unk0[0], D_8035FFA0[sp96].unk0[1],
                    D_8035FFA0[sp96].unk0[2], tx, ty, D_8035FFA0[sp96].unk6[0],
                    D_8035FFA0[sp96].unk6[1], D_8035FFA0[sp96].unk6[2], g);
    }
    gSPVertex(sp7C++, VIRTUAL_TO_PHYSICAL(verts + sp90 * 15), sp8E * 3, 0);
    for (sp9E = 0; sp9E < sp8E; sp9E++)
        gSP1Triangle(sp7C++, sp9E * 3, sp9E * 3 + 1, sp9E * 3 + 2, 0);
    gSPEndDisplayList(sp7C);
    return sp80;
}

Gfx *func_802D43FC(struct Painting *painting) {
    float sp4C = painting->vSize / DEFAULT_HEIGHT;
    Mtx *sp48 = alloc_display_list(sizeof(Mtx));
    Mtx *sp44 = alloc_display_list(sizeof(Mtx));
    Mtx *sp40 = alloc_display_list(sizeof(Mtx));
    Mtx *sp3C = alloc_display_list(sizeof(Mtx));
    Gfx *sp38 = alloc_display_list(5 * sizeof(Gfx));
    Gfx *sp34 = sp38;

    if (sp48 == NULL || sp44 == NULL || sp40 == NULL || sp38 == NULL) {
    }

    guTranslate(sp40, painting->vXPos, painting->vYPos, painting->vZPos);
    guRotate(sp48, painting->vXRotation, 1.0f, 0.0f, 0.0f);
    guRotate(sp44, painting->vYRotation, 0.0f, 1.0f, 0.0f);
    guScale(sp3C, sp4C, sp4C, sp4C);

    gSPMatrix(sp34++, sp40, G_MTX_MODELVIEW | G_MTX_MUL | G_MTX_PUSH);
    gSPMatrix(sp34++, sp48, G_MTX_MODELVIEW | G_MTX_MUL | G_MTX_NOPUSH);
    gSPMatrix(sp34++, sp44, G_MTX_MODELVIEW | G_MTX_MUL | G_MTX_NOPUSH);
    gSPMatrix(sp34++, sp3C, G_MTX_MODELVIEW | G_MTX_MUL | G_MTX_NOPUSH);
    gSPEndDisplayList(sp34);

    return sp38;
}

Gfx *func_802D45FC(struct Painting *painting) {
    s16 sp66;
    s16 sp64;
    s16 sp62;
    s16 *sp5C;
    s16 faceCount = painting->faceCount;
    s16 tWidth = painting->textureWidth;
    s16 tHeight = painting->textureHeight;
    s16 **meshArray = segmented_to_virtual(painting->meshData);
    u8 **tArray = segmented_to_virtual(painting->textureArray);
    Gfx *sp48 = alloc_display_list((faceCount + 6) * sizeof(Gfx));
    Gfx *sp44 = sp48;

    if (sp48 == NULL) {
        return sp48;
    }

    gSPDisplayList(sp44++, func_802D43FC(painting));
    gSPDisplayList(sp44++, dl_paintings_rippling_begin);
    gSPDisplayList(sp44++, painting->displayList68);

    for (sp62 = 0; sp62 < faceCount; sp62++) {
        sp5C = segmented_to_virtual(meshArray[sp62]);
        sp66 = sp5C[0];
        sp64 = sp5C[sp66 * 3 + 1];
        gSPDisplayList(sp44++, func_802D3CF0(tArray[sp62], tWidth, tHeight, sp5C, sp66, sp64,
                                             painting->brightness));
    }
    painting_update_ripple_status(painting);
    gSPPopMatrix(sp44++, G_MTX_MODELVIEW);
    gSPDisplayList(sp44++, dl_paintings_rippling_end);
    gSPEndDisplayList(sp44);
    return sp48;
}

Gfx *func_802D4874(struct Painting *painting) {
    s16 sp5E;
    s16 sp5C;
    s16 *sp58;
    s16 tWidth = painting->textureWidth;
    s16 tHeight = painting->textureHeight;
    s16 **meshArray = segmented_to_virtual(painting->meshData);
    u8 **tArray = segmented_to_virtual(painting->textureArray);
    Gfx *sp48 = alloc_display_list(7 * sizeof(Gfx));
    Gfx *sp44 = sp48;

    if (sp48 == NULL) {
        return sp48;
    }

    gSPDisplayList(sp44++, func_802D43FC(painting));
    gSPDisplayList(sp44++, dl_paintings_env_mapped_begin);
    gSPDisplayList(sp44++, painting->displayList68);
    sp58 = segmented_to_virtual(meshArray[0]);
    sp5E = sp58[0];
    sp5C = sp58[sp5E * 3 + 1];
    gSPDisplayList(sp44++,
                   func_802D3CF0(tArray[0], tWidth, tHeight, sp58, sp5E, sp5C, painting->brightness));
    painting_update_ripple_status(painting);
    gSPPopMatrix(sp44++, G_MTX_MODELVIEW);
    gSPDisplayList(sp44++, dl_paintings_env_mapped_end);
    gSPEndDisplayList(sp44);
    return sp48;
}

Gfx *display_painting_rippling(struct Painting *painting) {
    s16 *sp34 = segmented_to_virtual(seg2_triangle_mesh);
    s16 *sp30 = segmented_to_virtual(seg2_mesh_order);
    s16 sp2E = sp34[0];
    s16 sp2C = sp34[sp2E * 3 + 1];
    Gfx *sp28;

    Print1(painting, sp34, sp2E);
    Print2(sp34, sp2E, sp2C);
    func_802D39DC(sp30, sp2E);
    switch (painting->rippleShape) {
        case RIPPLE_SHAPE_WAVE:
            sp28 = func_802D45FC(painting);
            break;
        case RIPPLE_SHAPE_CONCENTRIC:
            sp28 = func_802D4874(painting);
            break;
    }
    mem_pool_free(gEffectsMemoryPool, D_8035FFA0);
    mem_pool_free(gEffectsMemoryPool, D_8035FFA4);
    return sp28;
}

Gfx *display_painting_not_rippling(struct Painting *painting) {
    Gfx *sp2C = alloc_display_list(4 * sizeof(Gfx));
    Gfx *sp28 = sp2C;

    if (sp2C == NULL) {
        return sp2C;
    }
    gSPDisplayList(sp28++, func_802D43FC(painting));
    gSPDisplayList(sp28++, painting->displayList58);
    gSPPopMatrix(sp28++, G_MTX_MODELVIEW);
    gSPEndDisplayList(sp28);
    return sp2C;
}

void reset_painting(struct Painting *painting) {
    painting->lastFloor = 0;
    painting->currFloor = 0;
    painting->floorEntered = 0;
    painting->lastMarioUnderPainting = 0;
    painting->currMarioUnderPainting = 0;
    painting->marioNewlyUnderPainting = 0;
    ripplingPainting = NULL;
}

void update_ddd_painting(struct Painting *painting, float frontPos, float backPos,
                         float speed) // Tells the DDD painting whether to move back
{
    u32 dddFlags = save_file_get_star_flags(gCurrSaveFileNum - 1,
                                            DIRE_DIRE_DOCKS - 1); // Obtain the DDD star flags
    u32 saveFileFlags = save_file_get_flags();                    // Get the other save file flags
    u32 bowsersSubBeaten =
        dddFlags & BOARD_BOWSERS_SUB; // Find out whether Board Bowser's Sub was collected
    u32 dddBack = saveFileFlags & SAVE_FLAG_DDD_MOVED_BACK; // Check whether DDD has already moved back

    if (!bowsersSubBeaten && !dddBack) {
        painting->vXPos = frontPos; // If we haven't collected the star or moved the painting, put the
                                    // painting at the front
        dddStatus = 0;
    } else if (bowsersSubBeaten
               && !dddBack) // If we've collected the star but not moved the painting back,
    {
        painting->vXPos +=
            speed; // Each frame, move the painting by a certain speed towards the back area.
        dddStatus = BOWSERS_SUB_BEATEN;
        if (painting->vXPos >= backPos) {
            painting->vXPos = backPos;
            save_file_set_flags(
                SAVE_FLAG_DDD_MOVED_BACK); // Tell the save file that we've moved DDD back.
        }
    } else if (bowsersSubBeaten && dddBack) {
        painting->vXPos =
            backPos; // If the painting has already moved back, place it in the back position.
        dddStatus = BOWSERS_SUB_BEATEN | DDD_BACK;
    }
}

struct Struct802D4E04 {
    u8 filler0[2];
    s16 unk2;
    u8 filler4[20];
    u32 unk18; // the upper half is the painting's id
};

void func_802D4E04(struct GraphNodeGenerated *a, struct Painting *b) {
    switch (b->brightness) {
        case 0xFF: // brightest
            a->fnNode.node.flags = (a->fnNode.node.flags & 0xFF) | 0x100;
            break;
        default:
            a->fnNode.node.flags = (a->fnNode.node.flags & 0xFF) | 0x500;
            break;
    }
}

Gfx *display_painting(struct Painting *painting) {
    switch (painting->rippleStatus) {
        case RIPPLE_STATE_NONE:
            return display_painting_not_rippling(painting);
            break;
        default:
            return display_painting_rippling(painting);
            break;
    }
}

void vertical_painting_ripple(struct Painting *painting, struct Painting *paintingGroup[]) {
    if (painting->rippleTrigger
        == RIPPLE_TRIGGER_PROXIMITY) // make the painting ripple using a different function based on its
                                     // ripple trigger and status
    {
        switch (painting->rippleStatus) {
            case RIPPLE_STATE_NONE:
                vertical_proximity_ripple_painting_ripple(painting, paintingGroup);
                break;
            case RIPPLE_STATE_IDLE:
                vertical_proximity_ripple_painting_ripple_if_mario_enters(painting, paintingGroup);
                break;
        }
    } else if (painting->rippleTrigger == RIPPLE_TRIGGER_CONTINUOUS) {
        switch (painting->rippleStatus) {
            case RIPPLE_STATE_NONE:
                vertical_continuous_ripple_painting_ripple(painting, paintingGroup);
                break;
            case RIPPLE_STATE_IDLE:
                vertical_continuous_ripple_painting_ripple_if_mario_enters(painting, paintingGroup);
                break;
        }
    }
}

void horizontal_painting_ripple(struct Painting *painting, struct Painting *paintingGroup[]) {
    if (painting->rippleTrigger
        == RIPPLE_TRIGGER_PROXIMITY) // make the painting ripple using a different function based on its
                                     // ripple trigger and status
    {
        switch (painting->rippleStatus) // No horizontal proximity ripple paintings exist in-game.
        {
            case RIPPLE_STATE_NONE:
                horizontal_proximity_ripple_painting_ripple(painting, paintingGroup);
                break;
            case RIPPLE_STATE_IDLE:
                horizontal_proximity_ripple_painting_ripple_if_mario_enters(painting, paintingGroup);
                break;
        }
    } else if (painting->rippleTrigger == RIPPLE_TRIGGER_CONTINUOUS) {
        switch (painting->rippleStatus) {
            case RIPPLE_STATE_NONE:
                horizontal_continuous_ripple_painting_ripple(painting, paintingGroup);
                break;
            case RIPPLE_STATE_IDLE:
                horizontal_continuous_ripple_painting_ripple_if_mario_enters(painting, paintingGroup);
                break;
        }
    }
}

Gfx *Geo18_802D5B98(s32 run, struct GraphNode *node, UNUSED void *context) {
    struct GraphNodeGenerated *sp2C = (struct GraphNodeGenerated *) node;
    s32 sp28 = (sp2C->parameter >> 8) & 0xFF;
    s32 id = sp2C->parameter & 0xFF;
    Gfx *sp20 = NULL;
    struct Painting **paintingGroup = paintingGroups[sp28];
    struct Painting *painting = segmented_to_virtual(paintingGroup[id]);

    if (run != TRUE) {
        reset_painting(painting);
    } else if (run == TRUE) // because the extra comparison was really necessary...
    {
        if (sp28 == 1 && id == PAINTING_ID_DDD) { // painting is DDD painting
            update_ddd_painting(painting, 3456.0f, 5529.6f, 20.0f);
        }
        func_802D4E04(sp2C, painting);
        sp20 = display_painting(painting);
        painting_update_floors(painting);
        switch ((s16) painting->vXRotation) {
            case ROTATION_VERTICAL:
                vertical_painting_ripple(painting, paintingGroup);
                break;
            default:
                horizontal_painting_ripple(painting, paintingGroup);
                break;
        }
    }
    return sp20;
}

Gfx *Geo18_802D5D0C(s32 run, UNUSED struct GraphNode *node, UNUSED f32 c[4][4]) {
    struct Surface *surface;

    if (run != TRUE) {
        gLastPaintingUpdateCounter = gAreaUpdateCounter - 1;
        gPaintingUpdateCounter = gAreaUpdateCounter;
    } else {
        gLastPaintingUpdateCounter = gPaintingUpdateCounter;
        gPaintingUpdateCounter = gAreaUpdateCounter;
        find_floor(gMarioObject->oPosX, gMarioObject->oPosY, gMarioObject->oPosZ, &surface);
        gPaintingMarioFloorType = surface->type;
        gPaintingMarioXPos = gMarioObject->oPosX;
        gPaintingMarioYPos = gMarioObject->oPosY;
        gPaintingMarioZPos = gMarioObject->oPosZ;
    }
    return NULL;
}
