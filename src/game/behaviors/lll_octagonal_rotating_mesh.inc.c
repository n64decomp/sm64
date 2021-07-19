// lll_octagonal_rotating_mesh.c.inc

enum {
	LLL_OCTMESH_CHANGE_DIR = 1, // 1
	LLL_OCTMESH_LINEAR_MOVE,    // 2
	LLL_OCTMESH_RESET,          // 3
	LLL_OCTMESH_WAIT_FOR_MARIO  // 4
};

//! Note: useless zero at the reset instruction, there's no accesses beyond that anyway
s16 gLllOctagonalMeshAction0[] = { 
    // instruction            time moveAngle  forwardVel
	LLL_OCTMESH_LINEAR_MOVE,    30,   0x4000,         0, 
	LLL_OCTMESH_CHANGE_DIR,    220,      900,        30, 
	LLL_OCTMESH_CHANGE_DIR,     30,        0,       -30, 
	LLL_OCTMESH_LINEAR_MOVE,    30,  -0x4000,         0,
	LLL_OCTMESH_CHANGE_DIR,    220,      900,        30,  
	LLL_OCTMESH_CHANGE_DIR,     30,        0,       -30, 
	LLL_OCTMESH_RESET,           0 
};
s16 gLllOctagonalMeshAction1[] = { 
    // instruction              time moveAngle  forwardVel
	LLL_OCTMESH_WAIT_FOR_MARIO,    0,        0,         0, 
	LLL_OCTMESH_CHANGE_DIR,      475,      900,        30, 
	LLL_OCTMESH_CHANGE_DIR,       30,        0,       -30, 
	LLL_OCTMESH_LINEAR_MOVE,      30,   0x8000,         0, 
	LLL_OCTMESH_CHANGE_DIR,      475,      900,        30,  
	LLL_OCTMESH_CHANGE_DIR,       30,        0,       -30, 
	LLL_OCTMESH_RESET,             0 
};

// picked by oBehParams2ndByte
s16 *gLllOctagonalMeshActionList[] = { gLllOctagonalMeshAction0, gLllOctagonalMeshAction1 };


s32 lll_octagonal_mesh_move(s16 *actionTable, s32 actionOffset) {
    switch (actionTable[actionOffset]) {
        case LLL_OCTMESH_WAIT_FOR_MARIO:
            o->oMoveAngleYaw = actionTable[actionOffset + 2];
            o->oForwardVel   = actionTable[actionOffset + 3] / 100.0f;
            if (cur_obj_is_mario_on_platform()) {
                actionOffset += 4;
                o->oTimer = 0;
            }
            break;
        case LLL_OCTMESH_LINEAR_MOVE:
            o->oMoveAngleYaw = actionTable[actionOffset + 2];
            o->oForwardVel = actionTable[actionOffset + 3] / 100.0f;
            if (o->oTimer > actionTable[actionOffset + 1]) {
                actionOffset += 4;
                o->oTimer = 0;
            }
            break;
        case LLL_OCTMESH_CHANGE_DIR:
            approach_f32_signed(&o->oForwardVel, actionTable[actionOffset + 2] / 100.0f, actionTable[actionOffset + 3] / 100.0f);
            if (o->oTimer > actionTable[actionOffset + 1]) {
                actionOffset += 4;
                o->oTimer = 0;
            }
            break;
        case LLL_OCTMESH_RESET:
            o->oForwardVel = 0.0f;
            actionOffset = 0;
            break;
    }
    return actionOffset;
}

s32 lll_octagonal_mesh_find_y_offset(s32 *standTimer, f32 *posOffset, s32 standTimerInc, s32 moveDownAmount) {
	// if Mario is on the platform...
    if (cur_obj_is_mario_on_platform()) {
		// move standTimer up by 'standTimerInc' until it hits 0x4000
		// since standTimerInc is 0x400, this takes 10 frames, or 1/3 seconds
        if (standTimer[0] < 0x4000)
            standTimer[0] += standTimerInc;
        else
            standTimer[0] = 0x4000;
    } else {
		// move standTimer back down to zero
        if (standTimer[0] > 0)
            standTimer[0] -= standTimerInc;
        else
            standTimer[0] = 0;
    }
    posOffset[0] = sins(standTimer[0]) * moveDownAmount;
    if (standTimer[0] == 0 || standTimer[0] == 0x4000)
        return 1;
    else
        return 0;
}

void bhv_lll_moving_octagonal_mesh_platform_loop(void) {
    if (o->oAction == 0) {
		// reset the platform (when initting?)
        o->oLllOctmeshActionOffset = 0;
        o->oAction++;
    } else
        o->oLllOctmeshActionOffset =
            lll_octagonal_mesh_move(gLllOctagonalMeshActionList[o->oBehParams2ndByte], o->oLllOctmeshActionOffset);
	
	// prints the current actionOffset to the screen
    print_debug_top_down_objectinfo("number %d\n", o->oLllOctmeshActionOffset);
	
    cur_obj_move_using_fvel_and_gravity();
	
	// are we transitioning between Mario standing and not standing?
    if (lll_octagonal_mesh_find_y_offset(&o->oLllOctmeshStandTimer, &o->oLllOctmeshWaveOffset2, 0x400, -80)) {
		// nope, wave as usual
        o->oLllOctmeshWaveTimer += 0x800;
        o->oLllOctmeshWaveOffset1 -= sins(o->oLllOctmeshWaveTimer) * 2;
    }
	//! oHomeY is not initialized, it's always 0. Moving the object upwards in the script has no effect.
    o->oPosY = o->oLllOctmeshWaveOffset1 + o->oHomeY + o->oLllOctmeshWaveOffset2;
}
