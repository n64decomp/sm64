// cheese_follow.c.inc


void bhv_cheese_follow_init(void) {

    o->oButterflyYPhase = random_float() * 10.0f;
    o->header.gfx.unk38.animFrame = random_float() * 7.0f;
    o->oHomeX = o->oPosX;
    o->oHomeY = o->oPosY;
    o->oHomeZ = o->oPosZ;
}

void bhv_cheese_act_follow_mario(void) {

    o->oPosY = gMarioState->pos[1] + 100.0f;
if (o->oDistanceToMario > 200.0f) {
  o->oMoveAngleYaw = o->oAngleToMario;
  o->oForwardVel = 30.0f;
  cur_obj_move_xz_using_fvel_and_yaw();
  o->oDistanceToMario = lateral_dist_between_objects(gMarioObject, o);
    }
    o->oFaceAngleYaw = o->oAngleToMario;
}