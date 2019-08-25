/*
 * Graphics Binary Interface
 * This supports Fast3D, Fast3DEX, and Fast3DEX2.
 */

/* Fast3DZEX support */
.ifdef F3DZEX_GBI
   .set F3DEX_GBI_2, 1
.endif

/* Macros */

/* commands with no parameters */
.macro f3d_noparam cmd
   .word (\cmd << 24), 0x00000000
.endm

.macro gsImmp1 cmd, param
   .word (\cmd << 24), \param
.endm

/* DMA helper */
.macro gsDma1p cmd, segAddr, length, params
   .word (\cmd << 24) | ((\params & 0xFFFF) << 16) | (\length & 0xFFFF)
   .word \segAddr
.endm

/* DMA helper 3*/
.macro gsDma3p cmd, byte2, byte3, byte4, segAddr
   .byte \cmd, \byte2, \byte3, \byte4
   .word \segAddr
.endm

/* Helper for RGBA colors. */
.macro sDPRGBColor cmd r, g, b, a
   .word \cmd << 24
   .byte \r, \g, \b, \a
.endm

/* Opcodes */

.ifdef F3DEX_GBI_2
.set G_MTX, 0xDA
.set G_MOVEMEM, 0xDC
.set G_VTX, 0x01
.set G_DL, 0xDE
.set G_TRI2, 0x06
.set G_RDPHALF_1, 0xE1
.set G_RDPHALF_2, 0xF1
.set G_GEOMETRYMODE, 0xD9 /* Fast3DEX2 uses one GeometryMode opcode. */
.set G_ENDDL, 0xDF
.set G_SETOTHERMODE_L, 0xE2
.set G_SETOTHERMODE_H, 0xE3
.set G_TEXTURE, 0xD7
.set G_MOVEWORD, 0xDB
.set G_TRI1, 0x05
.set G_NOOP, 0xC0
.set G_RDPLOADSYNC, 0xE6
.set G_RDPPIPESYNC, 0xE7
.set G_RDPTILESYNC, 0xE8
.set G_RDPFULLSYNC, 0xE9
.set G_LOADTLUT, 0xF0
.set G_SETTILESIZE, 0xF2
.set G_LOADBLOCK, 0xF3
.set G_SETTILE, 0xF5
.set G_SETFILLCOLOR, 0xF7
.set G_SETFOGCOLOR, 0xF8
.set G_SETBLENDCOLOR, 0xF9
.set G_SETPRIMCOLOR, 0xFA
.set G_SETENVCOLOR, 0xFB
.set G_SETCOMBINE, 0xFC
.set G_SETTIMG, 0xFD
.set G_TEXRECT, 0xE4

.else /* F3D and F3DEX */
.set G_MTX, 0x01
.set G_MOVEMEM, 0x03
.set G_VTX, 0x04
.set G_DL, 0x06
.set G_TRI2, 0xB1
.set G_RDPHALF_CONT, 0xB2
.set G_RDPHALF_2, 0xB3
.set G_RDPHALF_1, 0xB4
.set G_CLEARGEOMETRYMODE, 0xB6
.set G_SETGEOMETRYMODE, 0xB7
.set G_ENDDL, 0xB8
.set G_SETOTHERMODE_L, 0xB9
.set G_SETOTHERMODE_H, 0xBA
.set G_TEXTURE, 0xBB
.set G_MOVEWORD, 0xBC
.set G_TRI1, 0xBF
.set G_NOOP, 0xC0
.set G_TEXRECT, 0xE4
.set G_RDPLOADSYNC, 0xE6
.set G_RDPPIPESYNC, 0xE7
.set G_RDPTILESYNC, 0xE8
.set G_RDPFULLSYNC, 0xE9
.set G_LOADTLUT, 0xF0
.set G_SETTILESIZE, 0xF2
.set G_LOADBLOCK, 0xF3
.set G_SETTILE, 0xF5
.set G_FILLRECT, 0xF6
.set G_SETFILLCOLOR, 0xF7
.set G_SETFOGCOLOR, 0xF8
.set G_SETBLENDCOLOR, 0xF9
.set G_SETPRIMCOLOR, 0xFA
.set G_SETENVCOLOR, 0xFB
.set G_SETCOMBINE, 0xFC
.set G_SETTIMG, 0xFD
.endif

/* Arguments */

/* gSPMatrix */
.ifdef F3DEX_GBI_2
.set G_MTX_MODELVIEW,  0x00
.set G_MTX_PROJECTION, 0x04
.set G_MTX_MUL,        0x00
.set G_MTX_LOAD,       0x02
.set G_MTX_NOPUSH,     0x00
.set G_MTX_PUSH,       0x01

.else /* F3D and F3DEX */
.set G_MTX_MODELVIEW,  0x00
.set G_MTX_PROJECTION, 0x01
.set G_MTX_MUL,        0x00
.set G_MTX_LOAD,       0x02
.set G_MTX_NOPUSH,     0x00
.set G_MTX_PUSH,       0x04
.endif

/* gSPLight */
.ifdef F3DEX_GBI_2
.set G_MVO_L0, (2*24)
.else
.set G_MV_L0, 0x86
.endif

/* gSPDisplayList / gSPBranchDisplayList */
.set G_DL_PUSH,   0x00
.set G_DL_NOPUSH, 0x01

/* gSPXGeometryMode */
.ifdef F3DEX_GBI_2
.set G_ZBUFFER,            0x00000001
.set G_SHADE,              0x00000004
.set G_SHADING_SMOOTH,     0x00200000
.set G_CULL_FRONT,         0x00000200
.set G_CULL_BACK,          0x00000400
.set G_FOG,                0x00010000
.set G_LIGHTING,           0x00020000
.set G_TEXTURE_GEN,        0x00040000
.set G_TEXTURE_GEN_LINEAR, 0x00080000

.else /* F3D and F3DEX */
.set G_ZBUFFER,            0x00000001
.set G_SHADE,              0x00000004
.set G_SHADING_SMOOTH,     0x00000200
.set G_CULL_FRONT,         0x00001000
.set G_CULL_BACK,          0x00002000
.set G_FOG,                0x00010000
.set G_LIGHTING,           0x00020000
.set G_TEXTURE_GEN,        0x00040000
.set G_TEXTURE_GEN_LINEAR, 0x00080000
.endif

/*
 * Used for matching F3DEX2-style geometry mode usage.
 * Ignored when building with Fast3DEX2.
 */
.set G_ORDER_SFIRST, 0
.set G_ORDER_CFIRST, 1

/* gSPSetOtherMode (L) */
.set G_MDSFT_ALPHACOMPARE, 0
.set G_MDSFT_ZSRCSEL,      2
.set G_MDSFT_RENDERMODE,   3
.set G_MDSFT_BLENDER,     16

.set G_AC_NONE,      (0 << G_MDSFT_ALPHACOMPARE)
.set G_AC_THRESHOLD, (1 << G_MDSFT_ALPHACOMPARE)
.set G_AC_DITHER,    (3 << G_MDSFT_ALPHACOMPARE)

.set G_ZS_PIXEL, (0 << G_MDSFT_ZSRCSEL)
.set G_ZS_PRIM,  (1 << G_MDSFT_ZSRCSEL)

/************************* Set Render Mode *************************/

/* Cycle-Independent Blender Settings */

.set AA_EN, 0x8
.set Z_CMP, 0x10
.set Z_UPD, 0x20
.set IM_RD, 0x40
.set CLR_ON_CVG, 0x80
.set CVG_DST_CLAMP, 0
.set CVG_DST_WRAP, 0x100
.set CVG_DST_FULL, 0x200
.set CVG_DST_SAVE, 0x300
.set ZMODE_OPA, 0
.set ZMODE_INTER, 0x400
.set ZMODE_XLU, 0x800
.set ZMODE_DEC, 0xc00
.set CVG_X_ALPHA, 0x1000
.set ALPHA_CVG_SEL, 0x2000
.set FORCE_BL, 0x4000
.set TEX_EDGE, 0x0000 /* used to be 0x8000 */

/* Cycle-Dependent Blender Settings */
/* Blender runs the formula: (P * A + M - B) / (A + B) */
/* P and M values */
.set G_BL_CLR_IN,       0 /* 1st cycle: get color from input pixel. 
                         2nd cycle: param is the numerator of the formula as computed for the first cycle. */
.set G_BL_CLR_MEM,      1 /* Takes color from the framebuffer */
.set G_BL_CLR_BL,       2 /* Takes color from the blend color register */
.set G_BL_CLR_FOG,      3 /* Takes color from the fog color register */
/* A values */
.set G_BL_A_IN,     0 /* Parameter is alpha value of input pixel */
.set G_BL_A_FOG,    1 /* Alpha value from the fog color register */
.set G_BL_A_SHADE,  2 /* Calculated alpha value for the pixel, presumably */
/* B values */
.set G_BL_1MA,      0 /* 1.0 - source alpha */
.set G_BL_A_MEM,    1 /* Framebuffer alpha value */
.set G_BL_1,        2 /* Constant 1.0 */
/* A and B values */
.set G_BL_0,        3 /* Constant 0.0 */

.macro .BL_DEPENDENT_SETTING label, p, a, m, b
    .set \label\()_CYCLE1, ((\p << 30) | (\a << 26) | (\m << 22) | (\b << 18))
    .set \label\()_CYCLE2, ((\p << 28) | (\a << 24) | (\m << 20) | (\b << 16))
.endm

.macro .BL_DEPENDENT_SETTING_CYCLE1_ONLY label, p, a, m, b
    .set \label, ((\p << 30) | (\a << 26) | (\m << 22) | (\b << 18))
.endm

.BL_DEPENDENT_SETTING BL_DEP_SETTING_ZERO, G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_IN, G_BL_1MA /* Basically (0, 0, 0 ,0) */

/* Properly label these later! */
.BL_DEPENDENT_SETTING BL_DEP_SETTING_1, G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_A_MEM
.BL_DEPENDENT_SETTING BL_DEP_SETTING_2, G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA
.BL_DEPENDENT_SETTING BL_DEP_SETTING_3, G_BL_CLR_IN, G_BL_0, G_BL_CLR_IN, G_BL_1
.BL_DEPENDENT_SETTING BL_DEP_SETTING_4, G_BL_CLR_IN, G_BL_A_FOG, G_BL_CLR_MEM, G_BL_1
.BL_DEPENDENT_SETTING BL_DEP_SETTING_5, G_BL_CLR_IN, G_BL_0, G_BL_CLR_BL, G_BL_A_MEM

.BL_DEPENDENT_SETTING_CYCLE1_ONLY BL_DEP_SETTING_FOG_SHADE_A, G_BL_CLR_FOG, G_BL_A_SHADE, G_BL_CLR_IN, G_BL_1MA
.BL_DEPENDENT_SETTING_CYCLE1_ONLY BL_DEP_SETTING_FOG_PRIM_A, G_BL_CLR_FOG, G_BL_A_FOG, G_BL_CLR_IN, G_BL_1MA 
.BL_DEPENDENT_SETTING_CYCLE1_ONLY BL_DEP_SETTING_PASS, G_BL_CLR_IN, G_BL_0, G_BL_CLR_IN, G_BL_1

.macro .SET_RENDER_MODE label, indeptSettings, deptSettings
    .set \label , (\indeptSettings | \deptSettings\()_CYCLE1)
    .set \label\()2 , (\indeptSettings | \deptSettings\()_CYCLE2)
.endm

/* TODO: Make these more readable */
.SET_RENDER_MODE G_RM_AA_ZB_OPA_SURF, (AA_EN | Z_CMP | Z_UPD | IM_RD | CVG_DST_CLAMP | ZMODE_OPA | ALPHA_CVG_SEL), BL_DEP_SETTING_1
.SET_RENDER_MODE G_RM_RA_ZB_OPA_SURF, (AA_EN | Z_CMP | Z_UPD | CVG_DST_CLAMP | ZMODE_OPA | ALPHA_CVG_SEL), BL_DEP_SETTING_1
.SET_RENDER_MODE G_RM_AA_ZB_XLU_SURF, (AA_EN | Z_CMP | IM_RD | CVG_DST_WRAP | CLR_ON_CVG | FORCE_BL | ZMODE_XLU), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_AA_ZB_OPA_DECAL, (AA_EN | Z_CMP | IM_RD | CVG_DST_WRAP | ALPHA_CVG_SEL | ZMODE_DEC), BL_DEP_SETTING_1
.SET_RENDER_MODE G_RM_RA_ZB_OPA_DECAL, (AA_EN | Z_CMP | CVG_DST_WRAP | ALPHA_CVG_SEL | ZMODE_DEC), BL_DEP_SETTING_1
.SET_RENDER_MODE G_RM_AA_ZB_XLU_DECAL, (AA_EN | Z_CMP | IM_RD | CVG_DST_WRAP | CLR_ON_CVG | FORCE_BL | ZMODE_DEC), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_AA_ZB_OPA_INTER, (AA_EN | Z_CMP | Z_UPD | IM_RD | CVG_DST_CLAMP | ALPHA_CVG_SEL | ZMODE_INTER), BL_DEP_SETTING_1
.SET_RENDER_MODE G_RM_RA_ZB_OPA_INTER, (AA_EN | Z_CMP | Z_UPD | CVG_DST_CLAMP | ALPHA_CVG_SEL | ZMODE_INTER), BL_DEP_SETTING_1
.SET_RENDER_MODE G_RM_AA_ZB_XLU_INTER, (AA_EN | Z_CMP | IM_RD | CVG_DST_WRAP | CLR_ON_CVG | FORCE_BL | ZMODE_INTER), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_AA_ZB_XLU_LINE, (AA_EN | Z_CMP | IM_RD | CVG_DST_CLAMP | CVG_X_ALPHA | ALPHA_CVG_SEL | FORCE_BL | ZMODE_XLU), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_AA_ZB_DEC_LINE, (AA_EN | Z_CMP | IM_RD | CVG_DST_SAVE | CVG_X_ALPHA | ALPHA_CVG_SEL | FORCE_BL | ZMODE_DEC), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_AA_ZB_TEX_EDGE, (AA_EN | Z_CMP | Z_UPD | IM_RD | CVG_DST_CLAMP | CVG_X_ALPHA | ALPHA_CVG_SEL | ZMODE_OPA | TEX_EDGE), BL_DEP_SETTING_1
.SET_RENDER_MODE G_RM_AA_ZB_TEX_INTER, (AA_EN | Z_CMP | Z_UPD | IM_RD | CVG_DST_CLAMP | CVG_X_ALPHA | ALPHA_CVG_SEL | ZMODE_INTER | TEX_EDGE), BL_DEP_SETTING_1
.SET_RENDER_MODE G_RM_AA_ZB_SUB_SURF, (AA_EN | Z_CMP | Z_UPD | IM_RD | CVG_DST_FULL | ZMODE_OPA | ALPHA_CVG_SEL), BL_DEP_SETTING_1
.SET_RENDER_MODE G_RM_AA_ZB_PCL_SURF, (AA_EN | Z_CMP | Z_UPD | IM_RD | CVG_DST_CLAMP | ZMODE_OPA | G_AC_DITHER), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_AA_ZB_OPA_TERR, (AA_EN | Z_CMP | Z_UPD | IM_RD | CVG_DST_CLAMP | ZMODE_OPA | ALPHA_CVG_SEL), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_AA_ZB_TEX_TERR, (AA_EN | Z_CMP | Z_UPD | IM_RD | CVG_DST_CLAMP | CVG_X_ALPHA | ALPHA_CVG_SEL | ZMODE_OPA | TEX_EDGE), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_AA_ZB_SUB_TERR, (AA_EN | Z_CMP | Z_UPD | IM_RD | CVG_DST_FULL | ZMODE_OPA | ALPHA_CVG_SEL), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_AA_OPA_SURF, (AA_EN | IM_RD | CVG_DST_CLAMP | ZMODE_OPA | ALPHA_CVG_SEL), BL_DEP_SETTING_1
.SET_RENDER_MODE G_RM_RA_OPA_SURF, (AA_EN | CVG_DST_CLAMP | ZMODE_OPA | ALPHA_CVG_SEL), BL_DEP_SETTING_1
.SET_RENDER_MODE G_RM_AA_XLU_SURF, (AA_EN | IM_RD | CVG_DST_WRAP | CLR_ON_CVG | FORCE_BL | ZMODE_OPA), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_AA_XLU_LINE, (AA_EN | IM_RD | CVG_DST_CLAMP | CVG_X_ALPHA | ALPHA_CVG_SEL | FORCE_BL | ZMODE_OPA), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_AA_DEC_LINE, (AA_EN | IM_RD | CVG_DST_FULL | CVG_X_ALPHA | ALPHA_CVG_SEL | FORCE_BL | ZMODE_OPA), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_AA_TEX_EDGE, (AA_EN | IM_RD | CVG_DST_CLAMP | CVG_X_ALPHA | ALPHA_CVG_SEL | ZMODE_OPA | TEX_EDGE), BL_DEP_SETTING_1
.SET_RENDER_MODE G_RM_AA_SUB_SURF, (AA_EN | IM_RD | CVG_DST_FULL | ZMODE_OPA | ALPHA_CVG_SEL), BL_DEP_SETTING_1
.SET_RENDER_MODE G_RM_AA_PCL_SURF, (AA_EN | IM_RD | CVG_DST_CLAMP | ZMODE_OPA | G_AC_DITHER), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_AA_OPA_TERR, (AA_EN | IM_RD | CVG_DST_CLAMP | ZMODE_OPA | ALPHA_CVG_SEL), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_AA_TEX_TERR, (AA_EN | IM_RD | CVG_DST_CLAMP | CVG_X_ALPHA | ALPHA_CVG_SEL | ZMODE_OPA | TEX_EDGE), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_AA_SUB_TERR, (AA_EN | IM_RD | CVG_DST_FULL | ZMODE_OPA | ALPHA_CVG_SEL), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_ZB_OPA_SURF, (Z_CMP | Z_UPD | CVG_DST_FULL | ALPHA_CVG_SEL | ZMODE_OPA), BL_DEP_SETTING_1
.SET_RENDER_MODE G_RM_ZB_XLU_SURF, (Z_CMP | IM_RD | CVG_DST_FULL | FORCE_BL | ZMODE_XLU), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_ZB_OPA_DECAL, (Z_CMP | CVG_DST_FULL | ALPHA_CVG_SEL | ZMODE_DEC), BL_DEP_SETTING_1
.SET_RENDER_MODE G_RM_ZB_XLU_DECAL, (Z_CMP | IM_RD | CVG_DST_FULL | FORCE_BL | ZMODE_DEC), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_ZB_CLD_SURF, (Z_CMP | IM_RD | CVG_DST_SAVE | FORCE_BL | ZMODE_XLU), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_ZB_OVL_SURF, (Z_CMP | IM_RD | CVG_DST_SAVE | FORCE_BL | ZMODE_DEC), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_ZB_PCL_SURF, (Z_CMP | Z_UPD | CVG_DST_FULL | ZMODE_OPA | G_AC_DITHER), BL_DEP_SETTING_3
.SET_RENDER_MODE G_RM_OPA_SURF, (CVG_DST_CLAMP | FORCE_BL | ZMODE_OPA), BL_DEP_SETTING_3
.SET_RENDER_MODE G_RM_XLU_SURF, (IM_RD | CVG_DST_FULL | FORCE_BL | ZMODE_OPA), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_TEX_EDGE, (CVG_DST_CLAMP | CVG_X_ALPHA | ALPHA_CVG_SEL | FORCE_BL | ZMODE_OPA | TEX_EDGE | AA_EN), BL_DEP_SETTING_3
.SET_RENDER_MODE G_RM_CLD_SURF, (IM_RD | CVG_DST_SAVE | FORCE_BL | ZMODE_OPA), BL_DEP_SETTING_2
.SET_RENDER_MODE G_RM_PCL_SURF, (CVG_DST_FULL | FORCE_BL | ZMODE_OPA | G_AC_DITHER), BL_DEP_SETTING_3
.SET_RENDER_MODE G_RM_ADD, (IM_RD | CVG_DST_SAVE | FORCE_BL | ZMODE_OPA), BL_DEP_SETTING_4
.SET_RENDER_MODE G_RM_NOOP, (0), BL_DEP_SETTING_ZERO
.SET_RENDER_MODE G_RM_VISCVG, (IM_RD | FORCE_BL), BL_DEP_SETTING_5
.SET_RENDER_MODE G_RM_OPA_CI, (CVG_DST_CLAMP | ZMODE_OPA), BL_DEP_SETTING_3

/* Custom version of G_RM_AA_ZB_XLU_SURF with Z_UPD */
.SET_RENDER_MODE G_RM_CUSTOM_AA_ZB_XLU_SURF, (AA_EN | Z_CMP | Z_UPD | IM_RD | CVG_DST_WRAP | CLR_ON_CVG | FORCE_BL | ZMODE_XLU), BL_DEP_SETTING_2

/* Special mode types only for mode 1 */
.set G_RM_FOG_SHADE_A, BL_DEP_SETTING_FOG_SHADE_A
.set G_RM_FOG_PRIM_A,  BL_DEP_SETTING_FOG_PRIM_A
.set G_RM_PASS,        BL_DEP_SETTING_PASS

/*******************************************************************/

/* gSPSetOtherMode (H) */
.set G_MDSFT_ALPHADITHER,  4
.set G_MDSFT_RGBDITHER,    6
.set G_MDSFT_COMBKEY,      8
.set G_MDSFT_TEXTCONV,     9
.set G_MDSFT_TEXTFILT,    12
.set G_MDSFT_TEXTLUT,     14
.set G_MDSFT_TEXTLOD,     16
.set G_MDSFT_TEXTDETAIL,  17
.set G_MDSFT_TEXTPERSP,   19
.set G_MDSFT_CYCLETYPE,   20
.set G_MDSFT_PIPELINE,    23

.set G_CYC_1CYCLE, (0 << G_MDSFT_CYCLETYPE)
.set G_CYC_2CYCLE, (1 << G_MDSFT_CYCLETYPE)
.set G_CYC_COPY,   (2 << G_MDSFT_CYCLETYPE)
.set G_CYC_FILL,   (3 << G_MDSFT_CYCLETYPE)

.set G_TP_NONE,  (0 << G_MDSFT_TEXTPERSP)
.set G_TP_PERSP, (1 << G_MDSFT_TEXTPERSP)

.set G_TD_CLAMP,   (0 << G_MDSFT_TEXTDETAIL)
.set G_TD_SHARPEN, (1 << G_MDSFT_TEXTDETAIL)
.set G_TD_DETAIL,  (2 << G_MDSFT_TEXTDETAIL)

.set G_TL_TILE, (0 << G_MDSFT_TEXTLOD)
.set G_TL_LOD,  (1 << G_MDSFT_TEXTLOD)

.set G_TT_NONE,   (0 << G_MDSFT_TEXTLUT)
.set G_TT_RGBA16, (2 << G_MDSFT_TEXTLUT)
.set G_TT_IA16,   (3 << G_MDSFT_TEXTLUT)

.set G_TF_POINT,   (0 << G_MDSFT_TEXTFILT)
.set G_TF_AVERAGE, (3 << G_MDSFT_TEXTFILT)
.set G_TF_BILERP,  (2 << G_MDSFT_TEXTFILT)

.set G_TC_CONV,     (0 << G_MDSFT_TEXTCONV)
.set G_TC_FILTCONV, (5 << G_MDSFT_TEXTCONV)
.set G_TC_FILT,     (6 << G_MDSFT_TEXTCONV)

.set G_CK_NONE, (0 << G_MDSFT_COMBKEY)
.set G_CK_KEY,  (1 << G_MDSFT_COMBKEY)

.set G_CD_MAGICSQ, (0 << G_MDSFT_RGBDITHER)
.set G_CD_BAYER,   (1 << G_MDSFT_RGBDITHER)
.set G_CD_NOISE,   (2 << G_MDSFT_RGBDITHER)

/* gDPSetTile */
.set G_TX_LOADTILE,   0x7
.set G_TX_RENDERTILE, 0x0

/* axis clamp and mirror flags */
.set G_TX_NOMIRROR,   0x0
.set G_TX_WRAP,       0x0
.set G_TX_MIRROR,     0x1
.set G_TX_CLAMP,      0x2

/* mask flags */
.set G_TX_NOMASK,     0x0

/* shift flags */
.set G_TX_NOLOD,      0x0

/* gDPSetCombine */
.set G_CCMUX_COMBINED,         0
.set G_CCMUX_TEXEL0,           1
.set G_CCMUX_TEXEL1,           2
.set G_CCMUX_PRIMITIVE,        3
.set G_CCMUX_SHADE,            4
.set G_CCMUX_ENVIRONMENT,      5
.set G_CCMUX_CENTER,           6
.set G_CCMUX_SCALE,            6
.set G_CCMUX_COMBINED_ALPHA,   7
.set G_CCMUX_TEXEL0_ALPHA,     8
.set G_CCMUX_TEXEL1_ALPHA,     9
.set G_CCMUX_PRIMITIVE_ALPHA, 10
.set G_CCMUX_SHADE_ALPHA,     11
.set G_CCMUX_ENV_ALPHA,       12
.set G_CCMUX_LOD_FRACTION,    13
.set G_CCMUX_PRIM_LOD_FRAC,   14
.set G_CCMUX_NOISE,            7
.set G_CCMUX_K4,               7
.set G_CCMUX_K5,              15
.set G_CCMUX_1,                6
.set G_CCMUX_0,               31

/* alpha combiner */
.set G_ACMUX_COMBINED,      0
.set G_ACMUX_TEXEL0,        1
.set G_ACMUX_TEXEL1,        2
.set G_ACMUX_PRIMITIVE,     3
.set G_ACMUX_SHADE,         4
.set G_ACMUX_ENVIRONMENT,   5
.set G_ACMUX_LOD_FRACTION,  0
.set G_ACMUX_PRIM_LOD_FRAC, 6
.set G_ACMUX_1,             6
.set G_ACMUX_0,             7

/* gDPSetTextureImage */
/* fmt */
.set G_IM_FMT_RGBA, 0x00
.set G_IM_FMT_YUV,  0x01
.set G_IM_FMT_CI,   0x02
.set G_IM_FMT_IA,   0x03
.set G_IM_FMT_I,    0x04

/* size */
.set G_IM_SIZ_4b,   0x00
.set G_IM_SIZ_8b,   0x01
.set G_IM_SIZ_16b,  0x02
.set G_IM_SIZ_32b,  0x03

.set G_TX_DXT_FRAC, 11
.set G_TEXTURE_IMAGE_FRAC, 2

/* gDPLoadBlock*/
.set G_TX_DXT_FRAC, 11
.set G_TEXTURE_IMAGE_FRAC, 2

/* gSPNumLights / gSPFogFactor */

/* Index in DMEM table */
.set G_MW_NUMLIGHT, 0x02
.set G_MW_FOG, 0x08
.set G_MW_PERSPNORM, 0x0E

/* Offsets in DMEM table */
.set G_MWO_NUMLIGHT, 0x00
.set G_MWO_FOG, 0x00

/* Parameter for gsSPNumLights; not really needed but is good for formality. */
.set NUMLIGHTS_0, 1
.set NUMLIGHTS_1, 1
.set NUMLIGHTS_2, 2
.set NUMLIGHTS_3, 3
.set NUMLIGHTS_4, 4
.set NUMLIGHTS_5, 5
.set NUMLIGHTS_6, 6
.set NUMLIGHTS_7, 7

/* GBI macros */

/* gsMoveWd */
.macro gsMoveWd index, offset, data
   .ifdef F3DEX_GBI_2
       .word G_MOVEWORD << 24 | ((\index & 0xFF) << 16) | (\offset & 0xFFFF)
   .else
       .word G_MOVEWORD << 24 | ((\offset & 0xFFFF) << 8) | (\index & 0xFF)
   .endif
   .word \data
.endm

.set G_MWO_NUMLIGHT, 0x00
/*
 * gSPNumLights
 * Parameter:
 * n = NUMLIGHTS_* (ranges from 0 to 7)
 */
.macro gsSPNumLights n
   .ifdef F3DEX_GBI_2
      gsMoveWd G_MW_NUMLIGHT, G_MWO_NUMLIGHT, (\n * 24)
   .else
      gsMoveWd G_MW_NUMLIGHT, G_MWO_NUMLIGHT, ((\n + 1) * 32 + 0x80000000)
   .endif
.endm

/* gSPMatrix */
.macro gsSPMatrix matrix, params
   .ifdef F3DEX_GBI_2
   gsDma3p G_MTX, 0x38, 0, (\params ^ G_MTX_PUSH), \matrix
   .else /* Fast3D and Fast3DEX */
   gsDma1p G_MTX, \matrix, 64, \params
   .endif
.endm

/* gSPLight */
.macro gsSPLight light, num
   .ifdef F3DEX_GBI_2
   gsDma3p G_MOVEMEM, 8, ((G_MVO_L0+((\num-1)*24))/8), 10, \light
   .else /* Fast3D and Fast3DEX */
   gsDma1p G_MOVEMEM, \light, 16, ((\num)-1)*2+G_MV_L0
   .endif
.endm

/* gSPVertex */
.macro gsSPVertex verts, num, index
   .ifdef F3DEX_GBI_2
   .word (G_VTX << 24) | ((\num & 0xFF) << 12) | (((\index+\num) & 0x7F) << 1)
   .word \verts
   .else /* Fast3D and Fast3DEX */
   .ifdef F3DEX_GBI
      gsDma1p G_VTX, \verts, (\num)<<10|(16*(\num)-1), (2*\index)
   .else /* Fast3D */
      gsDma1p G_VTX, \verts, 16*\num, ((\num)-1)<<4|(\index)
   .endif
   .endif
.endm

/*
 * gSPGeometryMode
 * In Fast3DEX2 it is better to use this, as the RSP geometry mode
 * is able to be set and cleared in a single command.
 */
.macro gsSPGeometryMode cc, ff, order
   .ifdef F3DEX_GBI_2
      .word (G_GEOMETRYMODE << 24) | ((~(\cc)) & 0x00FFFFFF)
      .word \ff
   .else
      .if \order == 0
         gsSPSetGeometryMode \ff
         gsSPClearGeometryMode \cc
      .else
         gsSPClearGeometryMode \cc
         gsSPSetGeometryMode \ff
      .endif
   .endif
.endm

/* gSPSetGeometryMode */
.macro gsSPSetGeometryMode, flags
   .ifdef F3DEX_GBI_2
   .word (G_GEOMETRYMODE << 24) | 0x00FFFFFF
   .word \flags
   .else /* Fast3D and Fast3DEX */
   .word G_SETGEOMETRYMODE << 24
   .word \flags
   .endif
.endm

/* gSPClearGeometryMode */
.macro gsSPClearGeometryMode, flags
   .ifdef F3DEX_GBI_2
   .word (G_GEOMETRYMODE << 24) | ((~(\flags)) & 0x00FFFFFF)
   .word 0
   .else /* Fast3D and Fast3DEX */
   .word G_CLEARGEOMETRYMODE << 24
   .word \flags
   .endif
.endm

/* gSPPerspNormalize */
.macro gsSPPerspNormalize, perspNorm
   .ifndef F3D_OLD
      gsMoveWd G_MW_PERSPNORM, 0, \perspNorm
   .else
      gsImmp1 G_RDPHALF_1, \perspNorm
   .endif
.endm

/* gSPEndDisplayList */
.macro gsSPEndDisplayList
   f3d_noparam G_ENDDL
.endm

/* gSPSetOtherMode */
.macro gsSPSetOtherMode cmd, sft, len, data
   .ifdef F3DEX_GBI_2
      .word ((\cmd & 0xFF) << 24) | ((32 - (\sft & 0xFF) - (\len & 0xFF)) << 8) | ((\len-1) & 0xFF)
      .word \data
   .else /* Fast3D and Fast3DEX2 */
      .word ((\cmd & 0xFF) << 24) | ((\sft & 0xFF) << 8) | (\len & 0xFF)
      .word \data
   .endif
.endm

.macro gsSPTexture scaleS, scaleT, level, tile, enable
   .ifdef F3DEX_GBI_2
   .word (G_TEXTURE << 24) | ((\level & 0x7) << 11) | ((\tile & 0x7) << 8) | (\enable*2)
   .word ((\scaleS & 0xFFFF) << 16) | (\scaleT & 0xFFFF)
   .else /* Fast3D and Fast3DEX */
   .word (G_TEXTURE << 24) | ((\level & 0x7) << 11) | ((\tile & 0x7) << 8) | \enable
   .word ((\scaleS & 0xFFFF) << 16) | (\scaleT & 0xFFFF)
   .endif
.endm

/* gSPSetRenderMode */
.macro gsDPSetRenderMode cycle1Mode, cycle2Mode
    gsSPSetOtherMode G_SETOTHERMODE_L, G_MDSFT_RENDERMODE, 29, \cycle1Mode | \cycle2Mode
.endm

/* gDPSetTexturePersp */
.macro gsDPSetTexturePersp type
    gsSPSetOtherMode G_SETOTHERMODE_H, G_MDSFT_TEXTPERSP, 1, \type
.endm

/* gDPSetCycleType */
.macro gsDPSetCycleType type
    gsSPSetOtherMode G_SETOTHERMODE_H, G_MDSFT_CYCLETYPE, 2, \type
.endm

/* gDPSetTextureDetail */
.macro gsDPSetTextureDetail type
    gsSPSetOtherMode G_SETOTHERMODE_H, G_MDSFT_TEXTDETAIL, 2, \type
.endm

/* gDPSetTextureLOD*/
.macro gsDPSetTextureLOD type
   gsSPSetOtherMode G_SETOTHERMODE_H, G_MDSFT_TEXTLOD, 1, \type
.endm

/* gDPSetTextureTLUT */
.macro gsDPSetTextureLUT type
   gsSPSetOtherMode G_SETOTHERMODE_H, G_MDSFT_TEXTLUT, 2, \type
.endm

/* gDPSetTextureFilter */
.macro gsDPSetTextureFilter type
   gsSPSetOtherMode G_SETOTHERMODE_H, G_MDSFT_TEXTFILT, 2, \type
.endm

/* gDPSetTextureConvert */
.macro gsDPSetTextureConvert type
   gsSPSetOtherMode G_SETOTHERMODE_H, G_MDSFT_TEXTCONV, 3, \type
.endm

/* gDPSetCombineKey */
.macro gsDPSetCombineKey type
   gsSPSetOtherMode G_SETOTHERMODE_H, G_MDSFT_COMBKEY, 1, \type
.endm

/* gDPSetColorDither */
.macro gsDPSetColorDither mode
   gsSPSetOtherMode G_SETOTHERMODE_H, G_MDSFT_RGBDITHER, 2, \mode
.endm

/* gsDPSetAlphaCompare */
.macro gsDPSetAlphaCompare type
   gsSPSetOtherMode G_SETOTHERMODE_L, G_MDSFT_ALPHACOMPARE, 2, \type
.endm

/* gDPSetDepthSource */
.macro gsDPSetDepthSource src
   gsSPSetOtherMode G_SETOTHERMODE_L, G_MDSFT_ZSRCSEL, 1, \src
.endm

/* gSPDisplayList */
.macro gsSPDisplayList dl
   gsDma1p G_DL, \dl, 0, G_DL_PUSH
.endm

/* gSPBranchDisplayList */
.macro gsSPBranchList dl
   gsDma1p G_DL, \dl, 0, G_DL_NOPUSH
.endm

/*
 * gSP1Triangle
 * Note: flag has no effect on this implementation of gSP1Triangle.
 */
.macro gsSP1Triangle v0, v1, v2, flag
   .ifndef F3DEX_GBI_2
      .word G_TRI1 << 24
      .ifdef F3DEX_GBI /* Fast3DEX */
         .word (\v0*2 << 16) | (\v1*2 << 8) | \v2*2
      .else /* Fast3D */
         .word (\v0*10 << 16) | (\v1*10 << 8) | \v2*10
   .endif
   .else /* Fast3DEX2 */
      .byte G_TRI1, \v0*2, \v1*2, \v2*2
      .word 0
   .endif
.endm

/*
 * gSP2Triangles
 * Note: flag has no effect on this implementation of gSP2Triangles.
 */
.macro gsSP2Triangles v0, v1, v2, flag0, v3, v4, v5, flag1
   .ifdef F3DEX_GBI_SHARED /* Fast3DEX and Fast3DEX2 have the same G_TRI2 syntax. */
      .word (G_TRI2 << 24) | (\v0*2 << 16) | (\v1*2 << 8) | \v2*2
      .word (0x00 << 24) | (\v3*2 << 16) | (\v4*2 << 8) | \v5*2
   .else /* Backwards compatibility with Fast3D. */
      gsSP1Triangle \v0, \v1, \v2, \flag0
      gsSP1Triangle \v3, \v4, \v5, \flag1
   .endif
.endm

/* gDPNoOp */
.macro gsDPNoOp
   f3d_noparam G_NOOP
.endm

/* gSPTextureRectangle */
.macro gsSPTextureRectangle xl, yl, xh, yh, tile, s, t, dsdx, dtdy
    .word (G_TEXRECT << 24) | (\xh << 12) | \yh
    .word (\tile << 24) | (\xl << 12) | \yl
    .ifdef F3D_OLD
        .word (G_RDPHALF_2 << 24)
    .else
        .word (G_RDPHALF_1 << 24)
    .endif
    .word (\s << 16) | \t
    .ifdef F3D_OLD
        .word (G_RDPHALF_CONT << 24)
    .else
        .word (G_RDPHALF_2 << 24)
    .endif
    .word (\dsdx << 16) | \dtdy
.endm

/* gDPLoadSync */
.macro gsDPLoadSync
   f3d_noparam G_RDPLOADSYNC
.endm

/* gDPPipeSync*/
.macro gsDPPipeSync
   f3d_noparam G_RDPPIPESYNC
.endm

/* gDPFullSync*/
.macro gsDPFullSync
   f3d_noparam G_RDPFULLSYNC
.endm

/* gDPLoadTLUTCmd */
.macro gsDPLoadTLUTCmd tile, count
   .word G_LOADTLUT << 24
   .word ((\tile & 0x7) << 24) | ((\count - 1) & 0x3FF) << 14
.endm

/* gDPTileSync */
.macro gsDPTileSync
   f3d_noparam G_RDPTILESYNC
.endm

/* gDPSetTileSize */
.macro gsDPSetTileSize tile, uls, ult, lrs, lrt
   .word (G_SETTILESIZE << 24) | ((\uls & 0x0FFF) << 12) | (\ult & 0x0FFF)
   .word ((\tile & 0x7) << 24) | ((\lrs & 0x0FFF) << 12) | (\lrt & 0x0FFF)
.endm

/* gsDPLoadBlock */
.macro gsDPLoadBlock tile, uls, ult, lrs, dxt
   .word (G_LOADBLOCK << 24) | ((\uls & 0x0FFF) << 12) | (\ult & 0x0FFF)
   .word ((\tile & 0x7) << 24) | ((\lrs & 0x0FFF) << 12) | (\dxt & 0x0FFF)
.endm

/* gDPSetTile */
.macro gsDPSetTile fmt, siz, line, tmem, tile, palette, cmt, maskt, shiftt, cms, masks, shifts
   .word (G_SETTILE << 24) | ((\fmt & 0x7) << 21) | ((\siz & 0x3) << 19) | ((\line & 0x1FF) << 9) | (\tmem & 0x1FF)
   .word ((\tile & 0x7) << 24) | ((\palette & 0xF) << 20) | ((\cmt & 0x3) << 18) | ((\maskt & 0xF) << 14) | ((\shiftt & 0xF) << 10) | ((\cms & 0x3) << 8) | ((\masks & 0xF) << 4) | (\shifts & 0xF)
.endm

/* gDPFillRectangle */
.macro gsDPFillRectangle ulx, uly, lrx, lry
   .word (G_FILLRECT << 24) | ((\lrx & 0x3FF) << 14) | ((\lry & 0x3FF) << 2)
   .word                      ((\ulx & 0x3FF) << 14) | ((\uly & 0x3FF) << 2)
.endm

/* gDPSetFillColor */
.macro gsDPSetFillColor fillValue
   .word G_SETFILLCOLOR << 24
   .word \fillValue
.endm

/* gDPSetFogColor */
.macro gsDPSetFogColor r, g, b, a
   sDPRGBColor G_SETFOGCOLOR, \r, \g, \b, \a
.endm

/* gDPSetBlendColor */
.macro gsDPSetBlendColor r, g, b, a
   sDPRGBColor G_SETBLENDCOLOR, \r, \g, \b, \a
.endm

/* gDPSetPrimColor */
.macro gsDPSetPrimColor m, l, r, g, b, a
   .word (G_SETPRIMCOLOR << 24) | ((\m & 0xFF) << 8) | (\l & 0xFF)
   .word (\r << 24) | (\g << 16) | (\b << 8) | \a
.endm

/* gDPSetEnvColor */
.macro gsDPSetEnvColor r, g, b, a
   sDPRGBColor G_SETENVCOLOR, \r, \g, \b, \a
.endm

/* gDPSetCombine */
.macro gsDPSetCombine muxs0, muxs1
   .word (G_SETCOMBINE << 24) | (\muxs0 & 0x00FFFFFF)
   .word \muxs1
.endm

/* gDPSetCombineMode */
.macro gsDPSetCombineModeLERP a0, b0, c0, d0, Aa0, Ab0, Ac0, Ad0, a1, b1, c1, d1, Aa1, Ab1, Ac1, Ad1
   .word (G_SETCOMBINE << 24) | ((\a0 & 0xF) << 20) | ((\c0 & 0x1F) << 15) | ((\Aa0 & 0x7) << 12) | ((\Ac0 & 0x7) << 9) | ((\a1 & 0xF) << 5) | (\c1 & 0x1F)
   .word ((\b0 & 0xF) << 28) | ((\b1 & 0xF) << 24) | ((\Aa1 & 0x7) << 21) | ((\Ac1 & 0x7) << 18) | ((\d0 & 0x7) << 15) | ((\Ab0 & 0x7) << 12) | ((\Ad0 & 0x7) << 9) | ((\d1 & 0x7) << 6) | ((\Ab1 & 0x7) << 3) | (\Ad1 & 0x7)
.endm

/* gDPSetCombineMode1Cycle */
.macro gsDPSetCombineModeLERP1Cycle a0, b0, c0, d0, Aa0, Ab0, Ac0, Ad0
   gsDPSetCombineModeLERP \a0, \b0, \c0, \d0, \Aa0, \Ab0, \Ac0, \Ad0, \a0, \b0, \c0, \d0, \Aa0, \Ab0, \Ac0, \Ad0
.endm

/* gDPSetTextureImage */
.macro gsDPSetTextureImage fmt, size, width, segAddr
   .word (G_SETTIMG << 24) | ((\fmt & 0x7) << 21) | ((\size & 0x3) << 19) | ((\width-1) & 0x0FFF)
   .word \segAddr
.endm

/* gDPLoadTextureBlock */
/* Calculate gDPLoadBlock for 8, 16, and 32 bit textures */
.macro _calc_gsDPLoadBlockNot4b width, height, shift, incr, byteSize
    .if (((\width * \byteSize) / 8) > 1) /* result of TXL2WORDS is greater than 1 */
        gsDPLoadBlock G_TX_LOADTILE, 0, 0, (((\width * \height) + \incr) >> \shift) - 1, (((1 << G_TX_DXT_FRAC) + ((\width * \byteSize) / 8) - 1) / ((\width * \byteSize) / 8))
    .else /* result of TXL2WORDS is 1 */
        gsDPLoadBlock G_TX_LOADTILE, 0, 0, (((\width * \height) + \incr) >> \shift) - 1, (1 << G_TX_DXT_FRAC)
    .endif
.endm

/* Calculate gDPLoadBlock for 4-bit textures */
.macro _calc_gsDPLoadBlock4b width, height
    .if ((\width / 16) > 1) /* result of TXL2WORDS_4b is greater than 1 */
        gsDPLoadBlock G_TX_LOADTILE, 0, 0, (((\width * \height) + 3) >> 2) - 1, (((1 << G_TX_DXT_FRAC) + (\width / 16) - 1) / (\width / 16))
    .else /* result of TXL2WORDS_4b is 1 */
        gsDPLoadBlock G_TX_LOADTILE, 0, 0, (((\width * \height) + 3) >> 2) - 1, (1 << G_TX_DXT_FRAC)
    .endif
.endm

/* Calculate gDPLoadBlock using texture bit size, width, and height */
.macro _calc_gsDPLoadBlock siz, width, height
    .if (\siz == G_IM_SIZ_4b)
        _calc_gsDPLoadBlock4b \width, \height
    .elseif (\siz == G_IM_SIZ_8b)
        _calc_gsDPLoadBlockNot4b \width, \height, 1, 1, 1
    .elseif (\siz == G_IM_SIZ_16b)
        _calc_gsDPLoadBlockNot4b \width, \height, 0, 0, 2
    .elseif (\siz == G_IM_SIZ_32b)
        _calc_gsDPLoadBlockNot4b \width, \height, 0, 0, 4
    .endif
.endm

/*
 * gDPLoadTextureBlock is a macro that allows you to easily load a texture in the f3d family of ucodes
 * Parameters:
 * timg = label to the texture data
 * fmt  = image format (G_IM_FMT_RGBA, G_IM_FMT_CI, G_IM_FMT_IA, G_IM_FMT_I, or G_IM_FMT_YUV)
 * siz  = bits per pixel (G_IM_SIZ_4b, G_IM_SIZ_8b, G_IM_SIZ_16b, or G_IM_SIZ_32b)
 * width = width of the texture in pixels
 * height = height of the texture in pixels
 * pal = palette id to use if using G_IM_FMT_CI, otherwise it should be 0.
 * cms = Clamp & Mirror flags for the S axis
 * cmt = Clamp & Mirror flags for the T axis
 * masks = Sets how much of the S axis is shown before clamping. This is usually just log2(width).
 * maskt = Sets how much of the T axis is shown before clamping. This is usually just log2(height).
 * shifts = Sets the amount to shift S axis values after perspective division. This is usually G_TX_NOLOD.
 * shiftt = Sets the amount to shift T axis values after perspective division. This is usually G_TX_NOLOD.
 */
.macro gsDPLoadTextureBlock timg, fmt, siz, width, height, pal, cms, cmt, masks, maskt, shifts, shiftt
    .if (\siz == G_IM_SIZ_32b)
        gsDPSetTextureImage \fmt, \siz, 1, \timg
        gsDPSetTile \fmt, \siz, 0, 0, G_TX_LOADTILE, 0, \cmt, \maskt, \shiftt, \cms, \masks, \shifts 
    .else
        gsDPSetTextureImage \fmt, G_IM_SIZ_16b, 1, \timg
        gsDPSetTile \fmt, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, \cmt, \maskt, \shiftt, \cms, \masks, \shifts 
    .endif

    gsDPLoadSync
    _calc_gsDPLoadBlock \siz, \width, \height
    gsDPPipeSync

    .if (\siz == G_IM_SIZ_4b)
        gsDPSetTile \fmt, \siz, (7 >> 3), 0, G_TX_RENDERTILE, \pal, \cmt, \maskt, \shiftt, \cms, \masks, \shifts 
    .elseif (\siz == G_IM_SIZ_8b)
        gsDPSetTile \fmt, \siz, ((\width + 7) >> 3), 0, G_TX_RENDERTILE, \pal, \cmt, \maskt, \shiftt, \cms, \masks, \shifts 
    .else
        gsDPSetTile \fmt, \siz, (((\width * 2) + 7) >> 3), 0, G_TX_RENDERTILE, \pal, \cmt, \maskt, \shiftt, \cms, \masks, \shifts 
    .endif

    gsDPSetTileSize G_TX_RENDERTILE, 0, 0, ((\width - 1) << G_TEXTURE_IMAGE_FRAC), ((\height - 1) << G_TEXTURE_IMAGE_FRAC)
.endm

/*
 * gDPLoadTLUT_pal16, loads 16 colors into the TLUT
 * Parameters:
 *  pal = palette number to use.
 *  timg_pal = label to palette data
 */
.macro gsDPLoadTLUT_pal16 pal, timg_pal
    gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, \timg_pal
    gsDPTileSync
    gsDPSetTile 0, 0, 0, (256+(((\pal)&0xf)*16)), G_TX_LOADTILE, 0, 0, 0, 0, 0, 0, 0
    gsDPLoadSync
    gsDPLoadTLUTCmd G_TX_LOADTILE, 16
    gsDPPipeSync
.endm

/*
 * gDPLoadTLUT_pal256, loads 256 colors into the TLUT
 * Parameters:
 *  timg_pal = label to palette data
 */
.macro gsDPLoadTLUT_pal256 timg_pal
    gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, \timg_pal
    gsDPTileSync
    gsDPSetTile 0, 0, 0, 256, G_TX_LOADTILE, 0, 0, 0, 0, 0, 0, 0
    gsDPLoadSync
    gsDPLoadTLUTCmd G_TX_LOADTILE, 256
    gsDPPipeSync
.endm

/*
 * gDPLoadTextureBlock_4b is a macro that allows you to easily load a 4-bit texture in the Fast3D family of ucodes.
 * Parameters:
 * timg = label to the texture data
 * fmt  = image format (G_IM_FMT_RGBA, G_IM_FMT_CI, G_IM_FMT_IA, G_IM_FMT_I, or G_IM_FMT_YUV)
 * width = width of the texture in pixels
 * height = height of the texture in pixels
 * pal = palette id to use if using G_IM_FMT_CI, otherwise it should be 0.
 * cms = Clamp & Mirror flags for the S axis
 * cmt = Clamp & Mirror flags for the T axis
 * masks = Sets how much of the S axis is shown before clamping. This is usually just log2(width).
 * maskt = Sets how much of the T axis is shown before clamping. This is usually just log2(height).
 * shifts = Sets the amount to shift S axis values after perspective division. This is usually G_TX_NOLOD.
 * shiftt = Sets the amount to shift T axis values after perspective division. This is usually G_TX_NOLOD.
 */

.macro gsDPLoadTextureBlock_4b timg, fmt, width, height, pal, cms, cmt, masks, maskt, shifts, shiftt
    gsDPSetTextureImage \fmt, G_IM_SIZ_16b, 1, \timg
    gsDPSetTile \fmt, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, \cmt, \maskt, \shiftt, \cms, \masks, \shifts
    gsDPLoadSync
    _calc_gsDPLoadBlock4b \width, \height
    gsDPPipeSync
    gsDPSetTile \fmt, G_IM_SIZ_4b, ((((\width) >> 1) + 7) >> 3), 0, G_TX_RENDERTILE, \pal, \cmt, \maskt, \shiftt, \cms, \masks, \shifts
    gsDPSetTileSize G_TX_RENDERTILE, 0, 0, ((\width) - 1) << G_TEXTURE_IMAGE_FRAC, ((\height) - 1) << G_TEXTURE_IMAGE_FRAC
.endm

/*
 * gSPFogFactor
 * Parameters:
 * fm = z multiplier
 * fo = z offset
 *
 * FOG FORMULA: alpha(fog) = (eyespace z) * fm + fo (CLAMPED 0 to 255)
 * note: (eyespace z) ranges [-1, 1]
 */
.macro gsSPFogFactor fm, fo
    gsMoveWd G_MW_FOG, G_MWO_FOG, ((\fm & 0xFFFF) << 16) | (\fo & 0xFFFF)
.endm

/*
 * gSPFogPosition
 * Parameters:
 * min = Place where fog starts (0 at the near plane, and 1000 at the far plane)
 * max = Place where fog saturates (0 at the near plane, and 1000 at the far plane)
 *
 * This macro will throw an error if min or max is outside the range [0, 1000]
 *
 * Note: The min can be larger than max, as that just makes objects fade when they
 * get closer to the camera.
 */
.macro gsSPFogPosition min, max
    .if (\min >= 0 && \min <= 1000 && \max >= 0 && \max <= 1000)
        gsMoveWd G_MW_FOG, G_MWO_FOG, (((128000 / (\max - \min)) & 0xFFFF) << 16) | ((((500 - \min) * 256) / (\max - \min)) & 0xFFFF)
    .elseif \min < 0 || \min > 1000
        .error "[gsSPFogPosition]: min should be in the range [0, 1000]"
    .elseif \max < 0 || \max > 1000
        .error "[gsSPFogPosition]: max should be in the range [0, 1000]"
    .endif
.endm
