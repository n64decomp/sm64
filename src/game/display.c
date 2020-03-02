#include <ultra64.h>

#include "sm64.h"
#include "audio/external.h"
#include "buffers/buffers.h"
#include "buffers/gfx_output_buffer.h"
#include "game.h"
#include "main.h"
#include "memory.h"
#include "profiler.h"
#include "display.h"

int unused8032C690 = 0;
u32 gGlobalTimer = 0;
static u16 sCurrFBNum = 0;
u16 frameBufferIndex = 0;

/**
 * Initializes the Reality Display Processor (RDP).
 * This function initializes settings such as texture filtering mode,
 * scissoring, and render mode (although keep in mind that this render
 * mode is not used in-game, where it is set in render_graph_node.c).
 */
void my_rdp_init(void) {
    gDPPipeSync(gDisplayListHead++);
    gDPPipelineMode(gDisplayListHead++, G_PM_1PRIMITIVE);

    gDPSetScissor(gDisplayListHead++, G_SC_NON_INTERLACE, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    gDPSetCombineMode(gDisplayListHead++, G_CC_SHADE, G_CC_SHADE);

    gDPSetTextureLOD(gDisplayListHead++, G_TL_TILE);
    gDPSetTextureLUT(gDisplayListHead++, G_TT_NONE);
    gDPSetTextureDetail(gDisplayListHead++, G_TD_CLAMP);
    gDPSetTexturePersp(gDisplayListHead++, G_TP_PERSP);
    gDPSetTextureFilter(gDisplayListHead++, G_TF_BILERP);
    gDPSetTextureConvert(gDisplayListHead++, G_TC_FILT);

    gDPSetCombineKey(gDisplayListHead++, G_CK_NONE);
    gDPSetAlphaCompare(gDisplayListHead++, G_AC_NONE);
    gDPSetRenderMode(gDisplayListHead++, G_RM_OPA_SURF, G_RM_OPA_SURF2);
    gDPSetColorDither(gDisplayListHead++, G_CD_MAGICSQ);
    gDPSetCycleType(gDisplayListHead++, G_CYC_FILL);

    gDPPipeSync(gDisplayListHead++);
}

/**
 * Initializes the RSP's built-in geometry and lighting engines.
 * Most of these (with the notable exception of gSPNumLights), are
 * almost immediately overwritten.
 */
void my_rsp_init(void) {
    gSPClearGeometryMode(gDisplayListHead++, G_SHADE | G_SHADING_SMOOTH | G_CULL_BOTH | G_FOG
                        | G_LIGHTING | G_TEXTURE_GEN | G_TEXTURE_GEN_LINEAR | G_LOD);

    gSPSetGeometryMode(gDisplayListHead++, G_SHADE | G_SHADING_SMOOTH | G_CULL_BACK | G_LIGHTING);

    gSPNumLights(gDisplayListHead++, NUMLIGHTS_1);
    gSPTexture(gDisplayListHead++, 0, 0, 0, G_TX_RENDERTILE, G_OFF);

    // @bug Nintendo did not explicitly define the clipping ratio.
    // For Fast3DEX2, this causes the dreaded warped vertices issue
    // unless the clipping ratio is changed back to the intended value,
    // as Fast3DEX2 uses a different initial value than Fast3D(EX).
#ifdef F3DEX_GBI_2
    gSPClipRatio(gDisplayListHead++, FRUSTRATIO_1);
#endif
}

/** Clear the Z buffer. */
void clear_z_buffer(void) {
    gDPPipeSync(gDisplayListHead++);

    gDPSetDepthSource(gDisplayListHead++, G_ZS_PIXEL);
    gDPSetDepthImage(gDisplayListHead++, gPhysicalZBuffer);

    gDPSetColorImage(gDisplayListHead++, G_IM_FMT_RGBA, G_IM_SIZ_16b, SCREEN_WIDTH, gPhysicalZBuffer);
    gDPSetFillColor(gDisplayListHead++,
                    GPACK_ZDZ(G_MAXFBZ, 0) << 16 | GPACK_ZDZ(G_MAXFBZ, 0));

    gDPFillRectangle(gDisplayListHead++, 0, BORDER_HEIGHT, SCREEN_WIDTH - 1,
                     SCREEN_HEIGHT - 1 - BORDER_HEIGHT);
}

/** Sets up the final framebuffer image. */
void display_frame_buffer(void) {
    gDPPipeSync(gDisplayListHead++);

    gDPSetCycleType(gDisplayListHead++, G_CYC_1CYCLE);
    gDPSetColorImage(gDisplayListHead++, G_IM_FMT_RGBA, G_IM_SIZ_16b, SCREEN_WIDTH,
                     gPhysicalFrameBuffers[frameBufferIndex]);
    gDPSetScissor(gDisplayListHead++, G_SC_NON_INTERLACE, 0, BORDER_HEIGHT, SCREEN_WIDTH,
                  SCREEN_HEIGHT - BORDER_HEIGHT);
}

/** Clears the framebuffer, allowing it to be overwritten. */
void clear_frame_buffer(s32 a) {
    gDPPipeSync(gDisplayListHead++);

    gDPSetRenderMode(gDisplayListHead++, G_RM_OPA_SURF, G_RM_OPA_SURF2);
    gDPSetCycleType(gDisplayListHead++, G_CYC_FILL);

    gDPSetFillColor(gDisplayListHead++, a);
    gDPFillRectangle(gDisplayListHead++, 0, BORDER_HEIGHT, SCREEN_WIDTH - 1,
                     SCREEN_HEIGHT - 1 - BORDER_HEIGHT);

    gDPPipeSync(gDisplayListHead++);

    gDPSetCycleType(gDisplayListHead++, G_CYC_1CYCLE);
}

/** Clears and initializes the viewport. */
void clear_viewport(Vp *viewport, s32 b) {
    s16 vpUlx = (viewport->vp.vtrans[0] - viewport->vp.vscale[0]) / 4 + 1;
    s16 vpUly = (viewport->vp.vtrans[1] - viewport->vp.vscale[1]) / 4 + 1;
    s16 VpLrx = (viewport->vp.vtrans[0] + viewport->vp.vscale[0]) / 4 - 2;
    s16 vpLry = (viewport->vp.vtrans[1] + viewport->vp.vscale[1]) / 4 - 2;

    gDPPipeSync(gDisplayListHead++);

    gDPSetRenderMode(gDisplayListHead++, G_RM_OPA_SURF, G_RM_OPA_SURF2);
    gDPSetCycleType(gDisplayListHead++, G_CYC_FILL);

    gDPSetFillColor(gDisplayListHead++, b);
    gDPFillRectangle(gDisplayListHead++, vpUlx, vpUly, VpLrx, vpLry);

    gDPPipeSync(gDisplayListHead++);

    gDPSetCycleType(gDisplayListHead++, G_CYC_1CYCLE);
}

/** Draws the horizontal screen borders */
void draw_screen_borders(void) {
    gDPPipeSync(gDisplayListHead++);

    gDPSetScissor(gDisplayListHead++, G_SC_NON_INTERLACE, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    gDPSetRenderMode(gDisplayListHead++, G_RM_OPA_SURF, G_RM_OPA_SURF2);
    gDPSetCycleType(gDisplayListHead++, G_CYC_FILL);

    gDPSetFillColor(gDisplayListHead++, GPACK_RGBA5551(0, 0, 0, 0) << 16 | GPACK_RGBA5551(0, 0, 0, 0));

#if BORDER_HEIGHT != 0
    gDPFillRectangle(gDisplayListHead++, 0, 0, SCREEN_WIDTH - 1, BORDER_HEIGHT - 1);
    gDPFillRectangle(gDisplayListHead++, 0, SCREEN_HEIGHT - BORDER_HEIGHT, SCREEN_WIDTH - 1,
                     SCREEN_HEIGHT - 1);
#endif
}

void make_viewport_clip_rect(Vp *viewport) {
    s16 vpUlx = (viewport->vp.vtrans[0] - viewport->vp.vscale[0]) / 4 + 1;
    s16 vpPly = (viewport->vp.vtrans[1] - viewport->vp.vscale[1]) / 4 + 1;
    s16 vpLrx = (viewport->vp.vtrans[0] + viewport->vp.vscale[0]) / 4 - 1;
    s16 vpLry = (viewport->vp.vtrans[1] + viewport->vp.vscale[1]) / 4 - 1;

    gDPSetScissor(gDisplayListHead++, G_SC_NON_INTERLACE, vpUlx, vpPly, vpLrx, vpLry);
}

/**
 * Loads the F3D microcodes.
 * Refer to this function if you would like to load
 * other microcodes (i.e. S2DEX).
 */
void create_task_structure(void) {
    s32 entries = gDisplayListHead - gGfxPool->buffer;

    gGfxSPTask->msgqueue = &D_80339CB8;
    gGfxSPTask->msg = (OSMesg) 2;
    gGfxSPTask->task.t.type = M_GFXTASK;
    gGfxSPTask->task.t.ucode_boot = rspF3DBootStart;
    gGfxSPTask->task.t.ucode_boot_size = ((u8 *) rspF3DBootEnd - (u8 *) rspF3DBootStart);
    gGfxSPTask->task.t.flags = 0;
    gGfxSPTask->task.t.ucode = rspF3DStart;
    gGfxSPTask->task.t.ucode_data = rspF3DDataStart;
    gGfxSPTask->task.t.ucode_size = SP_UCODE_SIZE; // (this size is ignored)
    gGfxSPTask->task.t.ucode_data_size = SP_UCODE_DATA_SIZE;
    gGfxSPTask->task.t.dram_stack = (u64 *) gGfxSPTaskStack;
    gGfxSPTask->task.t.dram_stack_size = SP_DRAM_STACK_SIZE8;
    #ifdef VERSION_EU
    // terrible hack
    gGfxSPTask->task.t.output_buff = 
        (u64 *)((u8 *) gGfxSPTaskOutputBuffer - 0x670 + 0x280);
    gGfxSPTask->task.t.output_buff_size =
        (u64 *)((u8 *) gGfxSPTaskOutputBuffer+ 0x280 + 0x17790);
    #else
    gGfxSPTask->task.t.output_buff = gGfxSPTaskOutputBuffer;
    gGfxSPTask->task.t.output_buff_size =
        (u64 *)((u8 *) gGfxSPTaskOutputBuffer + sizeof(gGfxSPTaskOutputBuffer));
    #endif
    gGfxSPTask->task.t.data_ptr = (u64 *) &gGfxPool->buffer;
    gGfxSPTask->task.t.data_size = entries * sizeof(Gfx);
    gGfxSPTask->task.t.yield_data_ptr = (u64 *) gGfxSPTaskYieldBuffer;
    gGfxSPTask->task.t.yield_data_size = OS_YIELD_DATA_SIZE;
}

/** Starts rendering the scene. */
void init_render_image(void) {
    move_segment_table_to_dmem();
    my_rdp_init();
    my_rsp_init();
    clear_z_buffer();
    display_frame_buffer();
}

/** Ends the master display list. */
void end_master_display_list(void) {
    draw_screen_borders();
    if (gShowProfiler) {
        draw_profiler();
    }

    gDPFullSync(gDisplayListHead++);
    gSPEndDisplayList(gDisplayListHead++);

    create_task_structure();
}

void draw_reset_bars(void) {
    s32 sp24;
    s32 sp20;
    s32 fbNum;
    u64 *sp18;

    if (gResetTimer != 0 && D_8032C648 < 15) {
        if (sCurrFBNum == 0) {
            fbNum = 2;
        } else {
            fbNum = sCurrFBNum - 1;
        }

        sp18 = (u64 *) PHYSICAL_TO_VIRTUAL(gPhysicalFrameBuffers[fbNum]);
        sp18 += D_8032C648++ * (SCREEN_WIDTH / 4);

        for (sp24 = 0; sp24 < ((SCREEN_HEIGHT / 16) + 1); sp24++) {
            // Must be on one line to match -O2
            for (sp20 = 0; sp20 < (SCREEN_WIDTH / 4); sp20++) *sp18++ = 0;
            sp18 += ((SCREEN_WIDTH / 4) * 14);
        }
    }

    osWritebackDCacheAll();
    osRecvMesg(&gGameVblankQueue, &D_80339BEC, OS_MESG_BLOCK);
    osRecvMesg(&gGameVblankQueue, &D_80339BEC, OS_MESG_BLOCK);
}

void rendering_init(void) {
    gGfxPool = &gGfxPools[0];
    set_segment_base_addr(1, gGfxPool->buffer);
    gGfxSPTask = &gGfxPool->spTask;
    gDisplayListHead = gGfxPool->buffer;
    gGfxPoolEnd = (u8 *) (gGfxPool->buffer + GFX_POOL_SIZE);
    init_render_image();
    clear_frame_buffer(0);
    end_master_display_list();
    send_display_list(&gGfxPool->spTask);

    frameBufferIndex++;
    gGlobalTimer++;
}

void config_gfx_pool(void) {
    gGfxPool = &gGfxPools[gGlobalTimer % 2];
    set_segment_base_addr(1, gGfxPool->buffer);
    gGfxSPTask = &gGfxPool->spTask;
    gDisplayListHead = gGfxPool->buffer;
    gGfxPoolEnd = (u8 *) (gGfxPool->buffer + GFX_POOL_SIZE);
}

/** Handles vsync. */
void display_and_vsync(void) {
    profiler_log_thread5_time(BEFORE_DISPLAY_LISTS);
    osRecvMesg(&D_80339CB8, &D_80339BEC, OS_MESG_BLOCK);
    if (D_8032C6A0 != NULL) {
        D_8032C6A0();
        D_8032C6A0 = NULL;
    }
    send_display_list(&gGfxPool->spTask);
    profiler_log_thread5_time(AFTER_DISPLAY_LISTS);
    osRecvMesg(&gGameVblankQueue, &D_80339BEC, OS_MESG_BLOCK);
    osViSwapBuffer((void *) PHYSICAL_TO_VIRTUAL(gPhysicalFrameBuffers[sCurrFBNum]));
    profiler_log_thread5_time(THREAD5_END);
    osRecvMesg(&gGameVblankQueue, &D_80339BEC, OS_MESG_BLOCK);
    if (++sCurrFBNum == 3) {
        sCurrFBNum = 0;
    }
    if (++frameBufferIndex == 3) {
        frameBufferIndex = 0;
    }
    gGlobalTimer++;
}
