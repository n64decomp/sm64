#ifndef _ULTRA64_GBI_H_
#define _ULTRA64_GBI_H_

/* Types */

/* Vertex (set up for use with colors) */
typedef struct
{
    short          ob[3];  /* x, y, z */
    unsigned short flag;
    short          tc[2];  /* texture coord */
    unsigned char  cn[4];  /* color & alpha */
} Vtx_t;

/* Vertex (set up for use with normals) */
typedef struct
{
    short          ob[3];  /* x, y, z */
    unsigned short flag;
    short          tc[2];  /* texture coord */
    signed char    n[3];   /* normal */
    unsigned char  a;      /* alpha  */
} Vtx_tn;

typedef union
{
    Vtx_t         v;  /* Use this one for colors  */
    Vtx_tn        n;  /* Use this one for normals */
    long long int force_structure_alignment;
} Vtx;


typedef struct
{
    short vscale[4];  /* scale, 2 bits fraction */
    short vtrans[4];  /* translate, 2 bits fraction */
} Vp_t;

typedef union
{
    Vp_t          vp;
    long long int force_structure_alignment;
} Vp;

typedef long int Mtx_t[4][4];
typedef union
{
    Mtx_t m;
    long long int force_structure_alignment;
} Mtx;

typedef struct
{
    unsigned int w0;
    unsigned int w1;
} Gwords;

/* TODO: fill in the rest of the members */
typedef union
{
    Gwords words;
    long long int force_structure_alignment;
} Gfx;

#define GPACK_RGBA5551(r, g, b, a) \
    ((((r) << 8) & 0xF800) |       \
    (((g) << 3) & 0x07C0) |        \
    (((b) >> 2) & 0x003E) |        \
    ((a) & 0x0001))
#define GPACK_ZDZ(z, dz) ((z) << 2 | (dz))

#define G_SPNOOP            0x00
#define G_MTX               0x01
#define G_MOVEMEM           0x03
#define G_VTX               0x04
#define G_DL                0x06
#define G_LOAD_UCODE        0xAF
#define G_BRANCH_Z          0xB0
#ifdef F3DEX_GBI
#define G_TRI2              0xB1
#endif
#ifndef F3DEX_GBI
#define G_RDPHALF_CONT      0xB2
#else
#define G_MODIFYVTX         0xB2
#endif
#define G_RDPHALF_2         0xB3
#define G_RDPHALF_1         0xB4
#define G_QUAD              0xB5
#define G_CLEARGEOMETRYMODE 0xB6
#define G_SETGEOMETRYMODE   0xB7
#define G_ENDDL             0xB8
#define G_TEXTURE           0xBB
#define G_MOVEWORD          0xBC
#define G_POPMTX            0xBD
#define G_CULLDL            0xBE
#define G_TRI1              0xBF
#define G_NOOP              0xC0
#define G_TEXRECT           0xE4
#define G_TEXRECTFLIP       0xE5
#define G_RDPLOADSYNC       0xE6
#define G_RDPPIPESYNC       0xE7
#define G_RDPTILESYNC       0xE8
#define G_RDPFULLSYNC       0xE9
#define G_SETKEYGB          0xEA
#define G_SETKEYR           0xEB
#define G_SETCONVERT        0xEC
#define G_SETSCISSOR        0xED
#define G_SETPRIMDEPTH      0xEE
#define G_RDPSETOTHERMODE   0xEF
#define G_LOADTLUT          0xF0
#define G_SETTILESIZE       0xF2
#define G_LOADBLOCK         0xF3
#define G_LOADTILE          0xF4
#define G_SETTILE           0xF5
#define G_FILLRECT          0xF6
#define G_SETFILLCOLOR      0xF7
#define G_SETFOGCOLOR       0xF8
#define G_SETBLENDCOLOR     0xF9
#define G_SETPRIMCOLOR      0xFA
#define G_SETENVCOLOR       0xFB
#define G_SETCOMBINE        0xFC
#define G_SETTIMG           0xFD
#define G_SETZIMG           0xFE
#define G_SETCIMG           0xFF

#define G_DL_PUSH   0x00
#define G_DL_NOPUSH 0x01

/* SETOTHERMODE_L SHIFTS */

#define G_MDSFT_ALPHACOMPARE  0
#define G_MDSFT_ZSRCSEL       2
#define G_MDSFT_RENDERMODE    3
#define G_MDSFT_BLENDER      16

/* SETOTHERMODE_H SHIFTS */

#define G_MDSFT_ALPHADITHER     4
#define G_MDSFT_RGBDITHER       6
#define G_MDSFT_COMBKEY         8
#define G_MDSFT_TEXTCONV        9
#define G_MDSFT_TEXTFILT        12
#define G_MDSFT_TEXTLUT         14
#define G_MDSFT_TEXTLOD         16
#define G_MDSFT_TEXTDETAIL      17
#define G_MDSFT_TEXTPERSP       19
#define G_MDSFT_CYCLETYPE       20
#define G_MDSFT_PIPELINE        23

#define G_ZBUFFER            0x00000001
#define G_TEXTURE_ENABLE     0x00000002
#define G_SHADE              0x00000004
#define G_SHADING_SMOOTH     0x00000200
#define G_CULL_FRONT         0x00001000
#define G_CULL_BACK          0x00002000
#define G_CULL_BOTH          0x00003000
#define G_FOG                0x00010000
#define G_LIGHTING           0x00020000
#define G_TEXTURE_GEN        0x00040000
#define G_TEXTURE_GEN_LINEAR 0x00080000
#define G_LOD                0x00100000
#define G_CLIPPING           0x00800000

#define G_IM_FMT_RGBA   0
#define G_IM_FMT_YUV    1
#define G_IM_FMT_CI     2
#define G_IM_FMT_IA     3
#define G_IM_FMT_I      4

#define G_IM_SIZ_4b  0
#define G_IM_SIZ_8b  1
#define G_IM_SIZ_16b 2
#define G_IM_SIZ_32b 3
#define G_IM_SIZ_DD  5

#define G_AC_NONE      (0 << 0)
#define G_AC_THRESHOLD (1 << 0)
#define G_AC_DITHER    (3 << 0)

#define G_ZS_PIXEL (0 << 2)
#define G_ZS_PRIM  (1 << 2)

#define G_CD_MAGICSQ (0 << 6)
#define G_CD_BAYER   (1 << 6)
#define G_CD_NOISE   (2 << 6)

#define G_CK_NONE (0 << 8)
#define G_CK_KEY  (1 << 8)

#define G_TC_CONV     (0 << 9)
#define G_TC_FILTCONV (5 << 9)
#define G_TC_FILT     (6 << 9)

#define G_TF_POINT   (0 << 12)
#define G_TF_BILERP  (2 << 12)
#define G_TF_AVERAGE (3 << 12)

#define G_TT_NONE   (0 << 14)
#define G_TT_RGBA16 (2 << 14)
#define G_TT_IA16   (3 << 14)

#define G_TL_TILE (0 << 16)
#define G_TL_LOD  (1 << 16)

#define G_TD_CLAMP   (0 << 17)
#define G_TD_SHARPEN (1 << 17)
#define G_TD_DETAIL  (2 << 17)

#define G_TP_NONE   (0 << 19)
#define G_TP_PERSP  (1 << 19)

#define G_CYC_1CYCLE (0 << 20)
#define G_CYC_2CYCLE (1 << 20)
#define G_CYC_COPY   (2 << 20)
#define G_CYC_FILL   (3 << 20)

#define G_PM_NPRIMITIVE (0 << 23)
#define G_PM_1PRIMITIVE (1 << 23)

#define G_SC_NON_INTERLACE  0
#define G_SC_ODD_INTERLACE  3
#define G_SC_EVEN_INTERLACE 2

#define G_TX_LOADTILE   7
#define G_TX_RENDERTILE 0

#define G_TX_NOMIRROR 0
#define G_TX_WRAP 0
#define G_TX_MIRROR 1
#define G_TX_CLAMP 2
#define G_TX_NOMASK 0
#define G_TX_NOLOD 0

#define G_TX_LDBLK_MAX_TXL 2047

#define G_MV_VIEWPORT 0x80
#define G_MV_LOOKATY  0x82
#define G_MV_LOOKATX  0x84
#define G_MV_L0       0x86
#define G_MV_L1       0x88
#define G_MV_L2       0x8A
#define G_MV_L3       0x8C
#define G_MV_L4       0x8E
#define G_MV_L5       0x90
#define G_MV_L6       0x92
#define G_MV_L7       0x94
#define G_MV_TXTATT   0x96
#define G_MV_MATRIX_1 0x9E
#define G_MV_MATRIX_2 0x98
#define G_MV_MATRIX_3 0x9A
#define G_MV_MATRIX_4 0x9C

#define G_SETOTHERMODE_L 0xB9
#define G_SETOTHERMODE_H 0xBA

/* G_SETOTHERMODE_L render modes */

#define	AA_EN		    0x8
#define	Z_CMP		    0x10
#define	Z_UPD		    0x20
#define	IM_RD		    0x40
#define	CLR_ON_CVG	    0x80
#define	CVG_DST_CLAMP	0
#define	CVG_DST_WRAP	0x100
#define	CVG_DST_FULL	0x200
#define	CVG_DST_SAVE	0x300
#define	ZMODE_OPA       0
#define	ZMODE_INTER     0x400
#define	ZMODE_XLU       0x800
#define	ZMODE_DEC       0xc00
#define	CVG_X_ALPHA     0x1000
#define	ALPHA_CVG_SEL   0x2000
#define	FORCE_BL        0x4000
#define	TEX_EDGE        0x0000

#define	G_BL_CLR_IN     0
#define	G_BL_CLR_MEM    1
#define	G_BL_CLR_BL     2
#define	G_BL_CLR_FOG    3
#define	G_BL_1MA        0
#define	G_BL_A_MEM      1
#define	G_BL_A_IN       0
#define	G_BL_A_FOG      1
#define	G_BL_A_SHADE	2
#define	G_BL_1          2
#define	G_BL_0          3

#define	GBL_c1(m1a, m1b, m2a, m2b)	\
	(m1a) << 30 | (m1b) << 26 | (m2a) << 22 | (m2b) << 18
#define	GBL_c2(m1a, m1b, m2a, m2b)	\
	(m1a) << 28 | (m1b) << 24 | (m2a) << 20 | (m2b) << 16

#define	RM_AA_ZB_OPA_SURF(clk)					\
	AA_EN | Z_CMP | Z_UPD | IM_RD | CVG_DST_CLAMP |		\
	ZMODE_OPA | ALPHA_CVG_SEL |				\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_A_MEM)

#define	RM_RA_ZB_OPA_SURF(clk)					\
	AA_EN | Z_CMP | Z_UPD | CVG_DST_CLAMP |			\
	ZMODE_OPA | ALPHA_CVG_SEL |				\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_A_MEM)

#define	RM_AA_ZB_XLU_SURF(clk)					\
	AA_EN | Z_CMP | IM_RD | CVG_DST_WRAP | CLR_ON_CVG |	\
	FORCE_BL | ZMODE_XLU |					\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)

#define	RM_AA_ZB_OPA_DECAL(clk)					\
	AA_EN | Z_CMP | IM_RD | CVG_DST_WRAP | ALPHA_CVG_SEL |	\
	ZMODE_DEC |						\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_A_MEM)

#define	RM_RA_ZB_OPA_DECAL(clk)					\
	AA_EN | Z_CMP | CVG_DST_WRAP | ALPHA_CVG_SEL |		\
	ZMODE_DEC |						\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_A_MEM)

#define	RM_AA_ZB_XLU_DECAL(clk)					\
	AA_EN | Z_CMP | IM_RD | CVG_DST_WRAP | CLR_ON_CVG |	\
	FORCE_BL | ZMODE_DEC |					\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)

#define	RM_AA_ZB_OPA_INTER(clk)					\
	AA_EN | Z_CMP | Z_UPD | IM_RD | CVG_DST_CLAMP |		\
	ALPHA_CVG_SEL |	ZMODE_INTER |				\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_A_MEM)

#define	RM_RA_ZB_OPA_INTER(clk)					\
	AA_EN | Z_CMP | Z_UPD | CVG_DST_CLAMP |			\
	ALPHA_CVG_SEL |	ZMODE_INTER |				\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_A_MEM)

#define	RM_AA_ZB_XLU_INTER(clk)					\
	AA_EN | Z_CMP | IM_RD | CVG_DST_WRAP | CLR_ON_CVG |	\
	FORCE_BL | ZMODE_INTER |				\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)

#define	RM_AA_ZB_XLU_LINE(clk)					\
	AA_EN | Z_CMP | IM_RD | CVG_DST_CLAMP | CVG_X_ALPHA |	\
	ALPHA_CVG_SEL | FORCE_BL | ZMODE_XLU |			\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)

#define	RM_AA_ZB_DEC_LINE(clk)					\
	AA_EN | Z_CMP | IM_RD | CVG_DST_SAVE | CVG_X_ALPHA |	\
	ALPHA_CVG_SEL | FORCE_BL | ZMODE_DEC |			\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)

#define	RM_AA_ZB_TEX_EDGE(clk)					\
	AA_EN | Z_CMP | Z_UPD | IM_RD | CVG_DST_CLAMP |		\
	CVG_X_ALPHA | ALPHA_CVG_SEL | ZMODE_OPA | TEX_EDGE |	\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_A_MEM)

#define	RM_AA_ZB_TEX_INTER(clk)					\
	AA_EN | Z_CMP | Z_UPD | IM_RD | CVG_DST_CLAMP |		\
	CVG_X_ALPHA | ALPHA_CVG_SEL | ZMODE_INTER | TEX_EDGE |	\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_A_MEM)

#define	RM_AA_ZB_SUB_SURF(clk)					\
	AA_EN | Z_CMP | Z_UPD | IM_RD | CVG_DST_FULL |		\
	ZMODE_OPA | ALPHA_CVG_SEL |				\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_A_MEM)

#define	RM_AA_ZB_PCL_SURF(clk)					\
	AA_EN | Z_CMP | Z_UPD | IM_RD | CVG_DST_CLAMP |		\
	ZMODE_OPA | G_AC_DITHER | 				\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)

#define	RM_AA_ZB_OPA_TERR(clk)					\
	AA_EN | Z_CMP | Z_UPD | IM_RD | CVG_DST_CLAMP |		\
	ZMODE_OPA | ALPHA_CVG_SEL |				\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)

#define	RM_AA_ZB_TEX_TERR(clk)					\
	AA_EN | Z_CMP | Z_UPD | IM_RD | CVG_DST_CLAMP |		\
	CVG_X_ALPHA | ALPHA_CVG_SEL | ZMODE_OPA | TEX_EDGE |	\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)

#define	RM_AA_ZB_SUB_TERR(clk)					\
	AA_EN | Z_CMP | Z_UPD | IM_RD | CVG_DST_FULL |		\
	ZMODE_OPA | ALPHA_CVG_SEL |				\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)


#define	RM_AA_OPA_SURF(clk)					\
	AA_EN | IM_RD | CVG_DST_CLAMP |				\
	ZMODE_OPA | ALPHA_CVG_SEL |				\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_A_MEM)

#define	RM_RA_OPA_SURF(clk)					\
	AA_EN | CVG_DST_CLAMP |				\
	ZMODE_OPA | ALPHA_CVG_SEL |				\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_A_MEM)

#define	RM_AA_XLU_SURF(clk)					\
	AA_EN | IM_RD | CVG_DST_WRAP | CLR_ON_CVG | FORCE_BL |	\
	ZMODE_OPA |						\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)

#define	RM_AA_XLU_LINE(clk)					\
	AA_EN | IM_RD | CVG_DST_CLAMP | CVG_X_ALPHA |		\
	ALPHA_CVG_SEL | FORCE_BL | ZMODE_OPA |			\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)

#define	RM_AA_DEC_LINE(clk)					\
	AA_EN | IM_RD | CVG_DST_FULL | CVG_X_ALPHA |		\
	ALPHA_CVG_SEL | FORCE_BL | ZMODE_OPA |			\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)

#define	RM_AA_TEX_EDGE(clk)					\
	AA_EN | IM_RD | CVG_DST_CLAMP |				\
	CVG_X_ALPHA | ALPHA_CVG_SEL | ZMODE_OPA | TEX_EDGE |	\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_A_MEM)

#define	RM_AA_SUB_SURF(clk)					\
	AA_EN | IM_RD | CVG_DST_FULL |				\
	ZMODE_OPA | ALPHA_CVG_SEL |				\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_A_MEM)

#define	RM_AA_PCL_SURF(clk)					\
	AA_EN | IM_RD | CVG_DST_CLAMP |				\
	ZMODE_OPA | G_AC_DITHER | 				\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)

#define	RM_AA_OPA_TERR(clk)					\
	AA_EN | IM_RD | CVG_DST_CLAMP |				\
	ZMODE_OPA | ALPHA_CVG_SEL |				\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)

#define	RM_AA_TEX_TERR(clk)					\
	AA_EN | IM_RD | CVG_DST_CLAMP |				\
	CVG_X_ALPHA | ALPHA_CVG_SEL | ZMODE_OPA | TEX_EDGE |	\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)

#define	RM_AA_SUB_TERR(clk)					\
	AA_EN | IM_RD | CVG_DST_FULL |				\
	ZMODE_OPA | ALPHA_CVG_SEL |				\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)


#define	RM_ZB_OPA_SURF(clk)					\
	Z_CMP | Z_UPD | CVG_DST_FULL | ALPHA_CVG_SEL |		\
	ZMODE_OPA |						\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_A_MEM)
	
#define	RM_ZB_XLU_SURF(clk)					\
	Z_CMP | IM_RD | CVG_DST_FULL | FORCE_BL | ZMODE_XLU |	\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)
	
#define	RM_ZB_OPA_DECAL(clk)					\
	Z_CMP | CVG_DST_FULL | ALPHA_CVG_SEL | ZMODE_DEC |	\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_A_MEM)
	
#define	RM_ZB_XLU_DECAL(clk)					\
	Z_CMP | IM_RD | CVG_DST_FULL | FORCE_BL | ZMODE_DEC |	\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)
	
#define	RM_ZB_CLD_SURF(clk)					\
	Z_CMP | IM_RD | CVG_DST_SAVE | FORCE_BL | ZMODE_XLU |	\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)
	
#define	RM_ZB_OVL_SURF(clk)					\
	Z_CMP | IM_RD | CVG_DST_SAVE | FORCE_BL | ZMODE_DEC |	\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)
	
#define	RM_ZB_PCL_SURF(clk)					\
	Z_CMP | Z_UPD | CVG_DST_FULL | ZMODE_OPA |		\
	G_AC_DITHER | 						\
	GBL_c##clk(G_BL_CLR_IN, G_BL_0, G_BL_CLR_IN, G_BL_1)


#define	RM_OPA_SURF(clk)					\
	CVG_DST_CLAMP | FORCE_BL | ZMODE_OPA |			\
	GBL_c##clk(G_BL_CLR_IN, G_BL_0, G_BL_CLR_IN, G_BL_1)

#define	RM_XLU_SURF(clk)					\
	IM_RD | CVG_DST_FULL | FORCE_BL | ZMODE_OPA |		\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)

#define	RM_TEX_EDGE(clk)					\
	CVG_DST_CLAMP | CVG_X_ALPHA | ALPHA_CVG_SEL | FORCE_BL |\
	ZMODE_OPA | TEX_EDGE | AA_EN |					\
	GBL_c##clk(G_BL_CLR_IN, G_BL_0, G_BL_CLR_IN, G_BL_1)

#define	RM_CLD_SURF(clk)					\
	IM_RD | CVG_DST_SAVE | FORCE_BL | ZMODE_OPA |		\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)

#define	RM_PCL_SURF(clk)					\
	CVG_DST_FULL | FORCE_BL | ZMODE_OPA | 			\
	G_AC_DITHER | 						\
	GBL_c##clk(G_BL_CLR_IN, G_BL_0, G_BL_CLR_IN, G_BL_1)

#define	RM_ADD(clk)					\
	IM_RD | CVG_DST_SAVE | FORCE_BL | ZMODE_OPA |	\
	GBL_c##clk(G_BL_CLR_IN, G_BL_A_FOG, G_BL_CLR_MEM, G_BL_1)

#define	RM_NOOP(clk)	\
	GBL_c##clk(0, 0, 0, 0)

#define RM_VISCVG(clk) \
	IM_RD | FORCE_BL |     \
	GBL_c##clk(G_BL_CLR_IN, G_BL_0, G_BL_CLR_BL, G_BL_A_MEM)

/* for rendering to an 8-bit framebuffer */
#define RM_OPA_CI(clk)                    \
	CVG_DST_CLAMP | ZMODE_OPA |          \
	GBL_c##clk(G_BL_CLR_IN, G_BL_0, G_BL_CLR_IN, G_BL_1)



#define	G_RM_AA_ZB_OPA_SURF	RM_AA_ZB_OPA_SURF(1)
#define	G_RM_AA_ZB_OPA_SURF2	RM_AA_ZB_OPA_SURF(2)
#define	G_RM_AA_ZB_XLU_SURF	RM_AA_ZB_XLU_SURF(1)
#define	G_RM_AA_ZB_XLU_SURF2	RM_AA_ZB_XLU_SURF(2)
#define	G_RM_AA_ZB_OPA_DECAL	RM_AA_ZB_OPA_DECAL(1)
#define	G_RM_AA_ZB_OPA_DECAL2	RM_AA_ZB_OPA_DECAL(2)
#define	G_RM_AA_ZB_XLU_DECAL	RM_AA_ZB_XLU_DECAL(1)
#define	G_RM_AA_ZB_XLU_DECAL2	RM_AA_ZB_XLU_DECAL(2)
#define	G_RM_AA_ZB_OPA_INTER	RM_AA_ZB_OPA_INTER(1)
#define	G_RM_AA_ZB_OPA_INTER2	RM_AA_ZB_OPA_INTER(2)
#define	G_RM_AA_ZB_XLU_INTER	RM_AA_ZB_XLU_INTER(1)
#define	G_RM_AA_ZB_XLU_INTER2	RM_AA_ZB_XLU_INTER(2)
#define	G_RM_AA_ZB_XLU_LINE	RM_AA_ZB_XLU_LINE(1)
#define	G_RM_AA_ZB_XLU_LINE2	RM_AA_ZB_XLU_LINE(2)
#define	G_RM_AA_ZB_DEC_LINE	RM_AA_ZB_DEC_LINE(1)
#define	G_RM_AA_ZB_DEC_LINE2	RM_AA_ZB_DEC_LINE(2)
#define	G_RM_AA_ZB_TEX_EDGE	RM_AA_ZB_TEX_EDGE(1)
#define	G_RM_AA_ZB_TEX_EDGE2	RM_AA_ZB_TEX_EDGE(2)
#define	G_RM_AA_ZB_TEX_INTER	RM_AA_ZB_TEX_INTER(1)
#define	G_RM_AA_ZB_TEX_INTER2	RM_AA_ZB_TEX_INTER(2)
#define	G_RM_AA_ZB_SUB_SURF	RM_AA_ZB_SUB_SURF(1)
#define	G_RM_AA_ZB_SUB_SURF2	RM_AA_ZB_SUB_SURF(2)
#define	G_RM_AA_ZB_PCL_SURF	RM_AA_ZB_PCL_SURF(1)
#define	G_RM_AA_ZB_PCL_SURF2	RM_AA_ZB_PCL_SURF(2)
#define	G_RM_AA_ZB_OPA_TERR	RM_AA_ZB_OPA_TERR(1)
#define	G_RM_AA_ZB_OPA_TERR2	RM_AA_ZB_OPA_TERR(2)
#define	G_RM_AA_ZB_TEX_TERR	RM_AA_ZB_TEX_TERR(1)
#define	G_RM_AA_ZB_TEX_TERR2	RM_AA_ZB_TEX_TERR(2)
#define	G_RM_AA_ZB_SUB_TERR	RM_AA_ZB_SUB_TERR(1)
#define	G_RM_AA_ZB_SUB_TERR2	RM_AA_ZB_SUB_TERR(2)

#define	G_RM_RA_ZB_OPA_SURF	RM_RA_ZB_OPA_SURF(1)
#define	G_RM_RA_ZB_OPA_SURF2	RM_RA_ZB_OPA_SURF(2)
#define	G_RM_RA_ZB_OPA_DECAL	RM_RA_ZB_OPA_DECAL(1)
#define	G_RM_RA_ZB_OPA_DECAL2	RM_RA_ZB_OPA_DECAL(2)
#define	G_RM_RA_ZB_OPA_INTER	RM_RA_ZB_OPA_INTER(1)
#define	G_RM_RA_ZB_OPA_INTER2	RM_RA_ZB_OPA_INTER(2)

#define	G_RM_AA_OPA_SURF	RM_AA_OPA_SURF(1)
#define	G_RM_AA_OPA_SURF2	RM_AA_OPA_SURF(2)
#define	G_RM_AA_XLU_SURF	RM_AA_XLU_SURF(1)
#define	G_RM_AA_XLU_SURF2	RM_AA_XLU_SURF(2)
#define	G_RM_AA_XLU_LINE	RM_AA_XLU_LINE(1)
#define	G_RM_AA_XLU_LINE2	RM_AA_XLU_LINE(2)
#define	G_RM_AA_DEC_LINE	RM_AA_DEC_LINE(1)
#define	G_RM_AA_DEC_LINE2	RM_AA_DEC_LINE(2)
#define	G_RM_AA_TEX_EDGE	RM_AA_TEX_EDGE(1)
#define	G_RM_AA_TEX_EDGE2	RM_AA_TEX_EDGE(2)
#define	G_RM_AA_SUB_SURF	RM_AA_SUB_SURF(1)
#define	G_RM_AA_SUB_SURF2	RM_AA_SUB_SURF(2)
#define	G_RM_AA_PCL_SURF	RM_AA_PCL_SURF(1)
#define	G_RM_AA_PCL_SURF2	RM_AA_PCL_SURF(2)
#define	G_RM_AA_OPA_TERR	RM_AA_OPA_TERR(1)
#define	G_RM_AA_OPA_TERR2	RM_AA_OPA_TERR(2)
#define	G_RM_AA_TEX_TERR	RM_AA_TEX_TERR(1)
#define	G_RM_AA_TEX_TERR2	RM_AA_TEX_TERR(2)
#define	G_RM_AA_SUB_TERR	RM_AA_SUB_TERR(1)
#define	G_RM_AA_SUB_TERR2	RM_AA_SUB_TERR(2)

#define	G_RM_RA_OPA_SURF	RM_RA_OPA_SURF(1)
#define	G_RM_RA_OPA_SURF2	RM_RA_OPA_SURF(2)

#define	G_RM_ZB_OPA_SURF	RM_ZB_OPA_SURF(1)
#define	G_RM_ZB_OPA_SURF2	RM_ZB_OPA_SURF(2)
#define	G_RM_ZB_XLU_SURF	RM_ZB_XLU_SURF(1)
#define	G_RM_ZB_XLU_SURF2	RM_ZB_XLU_SURF(2)
#define	G_RM_ZB_OPA_DECAL	RM_ZB_OPA_DECAL(1)
#define	G_RM_ZB_OPA_DECAL2	RM_ZB_OPA_DECAL(2)
#define	G_RM_ZB_XLU_DECAL	RM_ZB_XLU_DECAL(1)
#define	G_RM_ZB_XLU_DECAL2	RM_ZB_XLU_DECAL(2)
#define	G_RM_ZB_CLD_SURF	RM_ZB_CLD_SURF(1)
#define	G_RM_ZB_CLD_SURF2	RM_ZB_CLD_SURF(2)
#define	G_RM_ZB_OVL_SURF	RM_ZB_OVL_SURF(1)
#define	G_RM_ZB_OVL_SURF2	RM_ZB_OVL_SURF(2)
#define	G_RM_ZB_PCL_SURF	RM_ZB_PCL_SURF(1)
#define	G_RM_ZB_PCL_SURF2	RM_ZB_PCL_SURF(2)

#define	G_RM_OPA_SURF		RM_OPA_SURF(1)
#define	G_RM_OPA_SURF2		RM_OPA_SURF(2)
#define	G_RM_XLU_SURF		RM_XLU_SURF(1)
#define	G_RM_XLU_SURF2		RM_XLU_SURF(2)
#define	G_RM_CLD_SURF		RM_CLD_SURF(1)
#define	G_RM_CLD_SURF2		RM_CLD_SURF(2)
#define	G_RM_TEX_EDGE		RM_TEX_EDGE(1)
#define	G_RM_TEX_EDGE2		RM_TEX_EDGE(2)
#define	G_RM_PCL_SURF		RM_PCL_SURF(1)
#define	G_RM_PCL_SURF2		RM_PCL_SURF(2)
#define G_RM_ADD       		RM_ADD(1)
#define G_RM_ADD2      		RM_ADD(2)
#define G_RM_NOOP       	RM_NOOP(1)
#define G_RM_NOOP2      	RM_NOOP(2)
#define G_RM_VISCVG    		RM_VISCVG(1)
#define G_RM_VISCVG2    	RM_VISCVG(2)
#define G_RM_OPA_CI         RM_OPA_CI(1)
#define G_RM_OPA_CI2        RM_OPA_CI(2)


#define	G_RM_FOG_SHADE_A	GBL_c1(G_BL_CLR_FOG, G_BL_A_SHADE, G_BL_CLR_IN, G_BL_1MA)
#define	G_RM_FOG_PRIM_A		GBL_c1(G_BL_CLR_FOG, G_BL_A_FOG, G_BL_CLR_IN, G_BL_1MA)
#define	G_RM_PASS		GBL_c1(G_BL_CLR_IN, G_BL_0, G_BL_CLR_IN, G_BL_1)

#define G_MWO_NUMLIGHT 0x00
#define G_MW_NUMLIGHT 0x02
#define NUML(n)         (((n)+1)*32 + 0x80000000)
#define	G_MW_PERSPNORM		0x0e

#ifndef MAX
#define MAX(a, b)               ((a) > (b) ? (a) : (b))
#endif

#ifndef MIN
#define MIN(a, b)               ((a) < (b) ? (a) : (b))
#endif

/* DMA macro */

#define gDma1p(pkt, c, s, l, p)                                         \
{                                                                       \
        Gfx *_g = (Gfx *)(pkt);                                         \
        _g->words.w0 = (_SHIFTL((c), 24, 8) | _SHIFTL((p), 16, 8) |     \
        _SHIFTL((l), 0, 16));                                           \
        _g->words.w1 = (unsigned int)(s);                               \
}

#define gsDma1p(c, s, l, p)                                             \
{                                                                       \
        _g->words.w0 = (_SHIFTL((c), 24, 8) | _SHIFTL((p), 16, 8) |     \
        _SHIFTL((l), 0, 16));                                           \
        _g->words.w1 = (unsigned int)(s);                               \
}

/* Matrix */

#define gSPMatrix(pkt, m, p)                     \
{                                                \
    Gfx *_g = (Gfx *)(pkt);                      \
    _g->words.w0 = _SHIFTL(G_MTX,        24,  8) \
                 | _SHIFTL((p),         16,  8)  \
                 | _SHIFTL(sizeof(Mtx),  0, 16); \
    _g->words.w1 = (u32)(m);                     \
}

#define gsSPMatrix(m, p)                         \
{                                                \
    _g->words.w0 = _SHIFTL(G_MTX,        24,  8) \
                 | _SHIFTL((p),         16,  8)  \
                 | _SHIFTL(sizeof(Mtx),  0, 16); \
    _g->words.w1 = (u32)(m);                     \
}

/* Vertex */
/* Syntax change from Fast3D to Fast3DEX */

#ifndef F3DEX_GBI
#define gSPVertex(pkt, v, n, v0)                         \
{                                                        \
    Gfx *_g = (Gfx *)(pkt);                              \
    _g->words.w0 = _SHIFTL(G_VTX,                24,  8) \
                 | _SHIFTL(((n)-1) << 4 | (v0), 16,  8)  \
                 | _SHIFTL(sizeof(Vtx)*(n),      0, 16); \
    _g->words.w1 = (u32)(v);                             \
}

#define gsSPVertex(v, n, v0)                             \
{                                                        \
    _g->words.w0 = _SHIFTL(G_VTX,                24,  8) \
                 | _SHIFTL(((n)-1) << 4 | (v0), 16,  8)  \
                 | _SHIFTL(sizeof(Vtx)*(n),      0, 16); \
    _g->words.w1 = (u32)(v);                             \
}

#else /* Fast3DEX */
#define gSPVertex(pkt, v, n, v0)                                      \
{                                                                     \
    Gfx *_g = (Gfx *)(pkt);                                           \
    _g->words.w0 = _SHIFTL(G_VTX,                             24,  8) \
                 | _SHIFTL(((v0)*2),                          16,  8) \
                 | _SHIFTL((n << 10) | ((sizeof(Vtx)*(n))-1), 0, 16); \
    _g->words.w1 = (u32)(v);                                          \
}

#define gsSPVertex(v, n, v0)                                          \
{                                                                     \
    _g->words.w0 = _SHIFTL(G_VTX,                             24,  8) \
                 | _SHIFTL(((v0)*2),                          16,  8) \
                 | _SHIFTL((n << 10) | ((sizeof(Vtx)*(n))-1), 0, 16); \
    _g->words.w1 = (u32)(v);                                          \
}
#endif

/* LoadSync */

#define gDPLoadSync(pkt)                          \
{                                                 \
    Gfx *_g = (Gfx *) (pkt);                      \
    _g->words.w0 = _SHIFTL(G_RDPLOADSYNC, 24, 8); \
    _g->words.w1 = 0x00000000;                    \
}

#define gsDPLoadSync()                            \
{                                                 \
    _g->words.w0 = _SHIFTL(G_RDPLOADSYNC, 24, 8); \
    _g->words.w1 = 0x00000000;                    \
}

/* PipeSync */

#define gDPPipeSync(pkt)                          \
{                                                 \
    Gfx *_g = (Gfx *) (pkt);                      \
    _g->words.w0 = _SHIFTL(G_RDPPIPESYNC, 24, 8); \
    _g->words.w1 = 0x00000000;                    \
}

#define gsDPPipeSync()                            \
{                                                 \
    _g->words.w0 = _SHIFTL(G_RDPPIPESYNC, 24, 8); \
    _g->words.w1 = 0x00000000;                    \
}

/* TileSync */

#define gDPTileSync(pkt)                          \
{                                                 \
    Gfx *_g = (Gfx *) (pkt);                      \
    _g->words.w0 = _SHIFTL(G_RDPTILESYNC, 24, 8); \
    _g->words.w1 = 0x00000000;                    \
}

#define gsDPTileSync()                            \
{                                                 \
    _g->words.w0 = _SHIFTL(G_RDPTILESYNC, 24, 8); \
    _g->words.w1 = 0x00000000;                    \
}

/* FullSync */

#define gDPFullSync(pkt)                          \
{                                                 \
    Gfx *_g = (Gfx *) (pkt);                      \
    _g->words.w0 = _SHIFTL(G_RDPFULLSYNC, 24, 8); \
    _g->words.w1 = 0x00000000;                    \
}

#define gsDPFullSync()                             \
{                                                 \
    _g->words.w0 = _SHIFTL(G_RDPFULLSYNC, 24, 8); \
    _g->words.w1 = 0x00000000;                    \
}

/*  DisplayList */

#define gSPDisplayList(pkt, dl)          \
{                                        \
    Gfx *_g = (Gfx *) (pkt);             \
    _g->words.w0 = _SHIFTL(G_DL, 24, 8); \
    _g->words.w1 = (u32)(dl);            \
}

#define gsSPDisplayList(dl)              \
{                                        \
    _g->words.w0 = _SHIFTL(G_DL, 24, 8); \
    _g->words.w1 = (u32)(dl);            \
}

/* BranchList */

#define gSPBranchList(pkt,dl)   \
    gDma1p(pkt, G_DL, dl, 0, G_DL_NOPUSH)

#define gsSPBranchList(pkt,dl)  \
    gsDma1p(G_DL, dl, 0, G_DL_NOPUSH)

/* EndDisplayList */

#define gSPEndDisplayList(pkt)              \
{                                           \
    Gfx *_g = (Gfx *) (pkt);                \
    _g->words.w0 = _SHIFTL(G_ENDDL, 24, 8); \
    _g->words.w1 = 0x00000000;              \
}

#define gsSPEndDisplayList()                \
{                                           \
    _g->words.w0 = _SHIFTL(G_ENDDL, 24, 8); \
    _g->words.w1 = 0x00000000;              \
}

/* SetOtherMode */

#define gSPSetOtherMode(pkt, cmd, shift, length, data)     \
{                                                          \
        Gfx *_g = (Gfx *) (pkt);                           \
        _g->words.w0 = _SHIFTL((cmd),        24, 8)        \
                     | _SHIFTL((shift),       8, 8)        \
                     | _SHIFTL(((length)-1),  0, 8);       \
        _g->words.w1 = (data);                             \
}

#define gsSPSetOtherMode(cmd, shift, length, data)         \
{                                                          \
        _g->words.w0 = _SHIFTL((cmd),        24, 8)        \
                     | _SHIFTL((shift),       8, 8)        \
                     | _SHIFTL(((length)-1),  0, 8);       \
        _g->words.w1 = (data);                             \
}

/* SetCycleType */

#define gDPSetCycleType(pkt, type)      \
    gSPSetOtherMode(pkt, G_SETOTHERMODE_H, G_MDSFT_CYCLETYPE, 3, type)

#define gsDPSetCycleType(pkt, type)     \
    gsSPSetOtherMode(G_SETOTHERMODE_H, G_MDSFT_CYCLETYPE, 3, type)

/* PipeLineMode */

#define gDPPipelineMode(pkt, mode)      \
    gSPSetOtherMode(pkt, G_SETOTHERMODE_H, 0x17, 2, mode)

#define gsDPPipelineMode(mode)          \
    gsSPSetOtherMode(G_SETOTHERMODE_H, 0x17, 2, mode)

/* SetScissor */

#define gDPSetScissor(pkt, mode, ulx, uly, lrx, lry)                  \
{                                                                     \
    Gfx *_g = (Gfx *)(pkt);                                           \
    _g->words.w0 = _SHIFTL(G_SETSCISSOR,                     24,  8)  \
                 | _SHIFTL((int)((float)(ulx)*4.0f), 12, 12)          \
                 | _SHIFTL((int)((float)(uly)*4.0f),  0, 12);         \
    _g->words.w1 = _SHIFTL((mode),                   24,  8)          \
                 | _SHIFTL((int)((float)(lrx)*4.0f), 12, 12)          \
                 | _SHIFTL((int)((float)(lry)*4.0f),  0, 12);         \
}

#define gsDPSetScissor(mode, ulx, uly, lrx, lry)                      \
{                                                                     \
    _g->words.w0 = _SHIFTL(G_SETSCISSOR,                     24,  8)  \
                 | _SHIFTL((int)((float)(ulx)*4.0f), 12, 12)          \
                 | _SHIFTL((int)((float)(uly)*4.0f),  0, 12);         \
    _g->words.w1 = _SHIFTL((mode),                   24,  8)          \
                 | _SHIFTL((int)((float)(lrx)*4.0f), 12, 12)          \
                 | _SHIFTL((int)((float)(lry)*4.0f),  0, 12);         \
}

/* SetCombine */

#define gDPSetCombine(pkt, muxs0, muxs1)            \
{                                                   \
    Gfx *_g = (Gfx *)(pkt);                         \
    _g->words.w0 = _SHIFTL(G_SETCOMBINE,   24,  8)  \
                 | _SHIFTL((muxs0), 0, 24);         \
    _g->words.w1 = (muxs1);                         \
}

#define gsDPSetCombine(muxs0, muxs1)                \
{                                                   \
    _g->words.w0 = _SHIFTL(G_SETCOMBINE,   24,  8)  \
                 | _SHIFTL((muxs0), 0, 24);         \
    _g->words.w1 = (muxs1);                         \
}

/* SetTextureLOD */

#define gDPSetTextureLOD(pkt, type)     \
    gSPSetOtherMode(pkt, G_SETOTHERMODE_H, G_MDSFT_TEXTLOD, 2, type)

#define gsDPSetTextureLOD(type)         \
    gsSPSetOtherMode(G_SETOTHERMODE_H, G_MDSFT_TEXTLOD, 2, type)

/* SetTextureLUT */

#define gDPSetTextureLUT(pkt, type)     \
    gSPSetOtherMode(pkt, G_SETOTHERMODE_H, G_MDSFT_TEXTLUT, 3, type)

#define gsDPSetTextureLUT(type)         \
    gsSPSetOtherMode(G_SETOTHERMODE_H, G_MDSFT_TEXTLUT, 3, type)

/* SetTextureDetail */

#define gDPSetTextureDetail(pkt, type)  \
    gSPSetOtherMode(pkt, G_SETOTHERMODE_H, G_MDSFT_TEXTDETAIL, 3, type)

#define gsDPSetTextureDetail(type)      \
    gsSPSetOtherMode(G_SETOTHERMODE_H, G_MDSFT_TEXTDETAIL, 3, type)

/* SetTexturePersp */

#define gDPSetTexturePersp(pkt, type)   \
    gSPSetOtherMode(pkt, G_SETOTHERMODE_H, G_MDSFT_TEXTPERSP, 2, type)

#define gsDPSetTexturePersp(type)       \
    gsSPSetOtherMode(G_SETOTHERMODE_H, G_MDSFT_TEXTPERSP, 2, type)

/* SetTextureFilter */

#define gDPSetTextureFilter(pkt, type)  \
    gSPSetOtherMode(pkt, G_SETOTHERMODE_H, G_MDSFT_TEXTFILT, 3, type)

#define gsDPSetTextureFilter(type)      \
    gsSPSetOtherMode(G_SETOTHERMODE_H, G_MDSFT_TEXTFILT, 3, type)

/* SetTextureConvert */

#define gDPSetTextureConvert(pkt, type) \
    gSPSetOtherMode(pkt, G_SETOTHERMODE_H, G_MDSFT_TEXTCONV, 4, type)

#define gsDPSetTextureConvert(type)     \
    gsSPSetOtherMode(G_SETOTHERMODE_H, G_MDSFT_TEXTCONV, 4, type)

/* SetCombineKey */

#define gDPSetCombineKey(pkt, type)     \
        gSPSetOtherMode(pkt, G_SETOTHERMODE_H, G_MDSFT_COMBKEY, 2, type)

#define gsDPSetCombineKey(type)         \
        gsSPSetOtherMode(G_SETOTHERMODE_H, G_MDSFT_COMBKEY, 2, type)

/* SetColorDither */

#define gDPSetColorDither(pkt, mode)    \
    gSPSetOtherMode(pkt, G_SETOTHERMODE_H, G_MDSFT_RGBDITHER, 3, mode)

#define gsDPSetColorDither(mode)        \
    gsSPSetOtherMode(G_SETOTHERMODE_H, G_MDSFT_RGBDITHER, 3, mode)

/* FillColor */

#define gDPSetFillColor(pkt, color)                \
{                                                  \
    Gfx *_g = (Gfx *) (pkt);                       \
    _g->words.w0 = _SHIFTL(G_SETFILLCOLOR, 24, 8); \
    _g->words.w1 = color;                          \
}

#define gsDPSetFillColor(color)                    \
{                                                  \
    _g->words.w0 = _SHIFTL(G_SETFILLCOLOR, 24, 8); \
    _g->words.w1 = color;                          \
}

/* FillRectangle */

#define gDPFillRectangle(pkt, ulx, uly, lrx, lry) \
{                                                 \
    Gfx *_g = (Gfx *)(pkt);                       \
    _g->words.w0 = _SHIFTL(G_FILLRECT,  24,  8)   \
                 | _SHIFTL((lrx), 14, 10)         \
                 | _SHIFTL((lry),  2, 10);        \
    _g->words.w1 = _SHIFTL(0,     24,  8)         \
                 | _SHIFTL((ulx), 14, 10)         \
                 | _SHIFTL((uly),  2, 10);        \
}

#define gsDPFillRectangle(ulx, uly, lrx, lry)     \
{                                                 \
    _g->words.w0 = _SHIFTL(G_FILLRECT,  24,  8)   \
                 | _SHIFTL((lrx), 14, 10)         \
                 | _SHIFTL((lry),  2, 10);        \
    _g->words.w1 = _SHIFTL(0,     24,  8)         \
                 | _SHIFTL((ulx), 14, 10)         \
                 | _SHIFTL((uly),  2, 10);        \
}

/* SetAlphaCompare */

#define gDPSetAlphaCompare(pkt, type)   \
    gSPSetOtherMode(pkt, G_SETOTHERMODE_L, G_MDSFT_ALPHACOMPARE, 3, type)

#define gsDPSetAlphaCompare(type)       \
    gsSPSetOtherMode(G_SETOTHERMODE_L, G_MDSFT_ALPHACOMPARE, 3, type)

/* SetDepthSource */

#define gDPSetDepthSource(pkt, src)     \
    gSPSetOtherMode(pkt, G_SETOTHERMODE_L, G_MDSFT_ZSRCSEL, 2, src)

#define gsDPSetDepthSource(src)         \
    gsSPSetOtherMode(G_SETOTHERMODE_L, G_MDSFT_ZSRCSEL, 2, src)

/* SetRenderMode */

#define gDPSetRenderMode(pkt, c0, c1)   \
    gSPSetOtherMode(pkt, G_SETOTHERMODE_L, G_MDSFT_RENDERMODE, 30, (c0) | (c1))

#define gsDPSetRenderMode(c0, c1)       \
    gsSPSetOtherMode(G_SETOTHERMODE_L, G_MDSFT_RENDERMODE, 30, (c0) | (c1))

/* ClearGeometryMode */

#define gSPClearGeometryMode(pkt, mode)                 \
{                                                       \
    Gfx *_g = (Gfx *) (pkt);                            \
    _g->words.w0 = _SHIFTL(G_CLEARGEOMETRYMODE, 24, 8); \
    _g->words.w1 = mode;                                \
}

#define gsSPClearGeometryMode(pkt, mode)                \
{                                                       \
    _g->words.w0 = _SHIFTL(G_CLEARGEOMETRYMODE, 24, 8); \
    _g->words.w1 = mode;                                \
}

/* SetGeometryMode */

#define gSPSetGeometryMode(pkt, word)                   \
{                                                       \
    Gfx *_g = (Gfx *) (pkt);                            \
    _g->words.w0 = _SHIFTL(G_SETGEOMETRYMODE, 24, 8);   \
    _g->words.w1 = word;                                \
}

#define gsSPSetGeometryMode(word)                       \
{                                                       \
    _g->words.w0 = _SHIFTL(G_SETGEOMETRYMODE, 24, 8);   \
    _g->words.w1 = word;                                \
}

/* NumLights */

#define gSPNumLights(pkt, n)    \
    gMoveWd(pkt, G_MW_NUMLIGHT, G_MWO_NUMLIGHT, NUML(n))

#define gsSPNumLights(n)        \
    gsMoveWd(G_MW_NUMLIGHT, G_MWO_NUMLIGHT, NUML(n))

/* Texture */

#define gSPTexture(pkt, sc, tc, level, tile, on) \
{                                                \
    Gfx *_g = (Gfx *)(pkt);                      \
    _g->words.w0 = _SHIFTL(G_TEXTURE,    24, 8)  \
                 | _SHIFTL(0,       16, 8)       \
                 | _SHIFTL((level), 11, 3)       \
                 | _SHIFTL((tile),   8, 3)       \
                 | _SHIFTL((on),     0, 8);      \
    _g->words.w1 = _SHIFTL((sc), 16, 16)         \
                 | _SHIFTL((tc),  0, 16);        \
}

#define gsSPTexture(sc, tc, level, tile, on)     \
{                                                \
    _g->words.w0 = _SHIFTL(G_TEXTURE,    24, 8)  \
                 | _SHIFTL(0,       16, 8)       \
                 | _SHIFTL((level), 11, 3)       \
                 | _SHIFTL((tile),   8, 3)       \
                 | _SHIFTL((on),     0, 8);      \
    _g->words.w1 = _SHIFTL((sc), 16, 16)         \
                 | _SHIFTL((tc),  0, 16);        \
}

/* SetColorImage */

#define gDPSetColorImage(pkt, fmt, size, width, image) \
{                                                      \
    Gfx *_g = (Gfx *)(pkt);                            \
    _g->words.w0 = _SHIFTL(G_SETCIMG,   24, 8)         \
                 | _SHIFTL((fmt),  21, 3)              \
                 | _SHIFTL((size), 19, 2)              \
                 | _SHIFTL((width)-1, 0, 12);          \
    _g->words.w1 = (image);                            \
}

#define gsDPSetColorImage(fmt, size, width, image)     \
{                                                      \
    _g->words.w0 = _SHIFTL(G_SETCIMG,   24, 8)         \
                 | _SHIFTL((fmt),  21, 3)              \
                 | _SHIFTL((size), 19, 2)              \
                 | _SHIFTL((width)-1, 0, 12);          \
    _g->words.w1 = (image);                            \
}

/* SetTileSize */

#define gDPSetTileSize(pkt, tile, uls, ult, lrs, lrt)          \
{                                                              \
    Gfx *_g = (Gfx *)(pkt);                                    \
    _g->words.w0 = _SHIFTL(G_SETTILESIZE, 24, 8)               \
                 | _SHIFTL(uls, 12, 12)                        \
                 | _SHIFTL(ult, 0, 12);                        \
    _g->words.w1 = _SHIFTL(tile, 24, 3)                        \
                 | _SHIFTL(lrs, 12, 12)                        \
                | _SHIFTL(lrt, 0, 12);                         \
}

#define gsDPSetTileSize(tile, uls, ult, lrs, lrt)              \
{                                                              \
    _g->words.w0 = _SHIFTL(G_SETTILESIZE, 24, 8)               \
                 | _SHIFTL(uls, 12, 12)                        \
                 | _SHIFTL(ult, 0, 12);                        \
    _g->words.w1 = _SHIFTL(tile, 24, 3)                        \
                 | _SHIFTL(lrs, 12, 12)                        \
                | _SHIFTL(lrt, 0, 12);                         \
}

/* LoadBlock */

#define gDPLoadBlock(pkt, tile, uls, ult, lrs, dxt)                         \
{                                                                           \
    Gfx *_g = (Gfx *)(pkt);                                                 \
    _g->words.w0 = _SHIFTL(G_LOADBLOCK,   24,  8)                           \
                 | _SHIFTL((uls),  12, 12)                                  \
                 | _SHIFTL((ult),   0, 12);                                 \
    _g->words.w1 = _SHIFTL((tile),                          24,  3)         \
                 | _SHIFTL((MIN((lrs),G_TX_LDBLK_MAX_TXL)), 12, 12)         \
                 | _SHIFTL((dxt),                            0, 12);        \
}

#define gsDPLoadBlock(tile, uls, ult, lrs, dxt)                             \
{                                                                           \
    _g->words.w0 = _SHIFTL(G_LOADBLOCK,   24,  8)                           \
                 | _SHIFTL((uls),  12, 12)                                  \
                 | _SHIFTL((ult),   0, 12);                                 \
    _g->words.w1 = _SHIFTL((tile),                          24,  3)         \
                 | _SHIFTL((MIN((lrs),G_TX_LDBLK_MAX_TXL)), 12, 12)         \
                 | _SHIFTL((dxt),                            0, 12);        \
}

/* SetTile */

#define gDPSetTile(pkt, fmt, siz, line, tmem, tile,  \
    palette, cmt, maskt, shiftt, cms, masks, shifts) \
{                                                    \
    Gfx *_g = (Gfx *)(pkt);                          \
    _g->words.w0 = _SHIFTL(G_SETTILE,  24, 8)        \
                 | _SHIFTL((fmt), 21, 3)             \
                 | _SHIFTL((siz), 19, 2)             \
                 | _SHIFTL((line), 9, 9)             \
                 | _SHIFTL((tmem), 0, 9);            \
    _g->words.w1 = _SHIFTL((tile),    24, 3)         \
                 | _SHIFTL((palette), 20, 4)         \
                 | _SHIFTL((cmt),     18, 2)         \
                 | _SHIFTL((maskt),   14, 4)         \
                 | _SHIFTL((shiftt),  10, 4)         \
                 | _SHIFTL((cms),      8, 2)         \
                 | _SHIFTL((masks),    4, 4)         \
                 | _SHIFTL((shifts),   0, 4);        \
}

#define gsDPSetTile(fmt, siz, line, tmem, tile,      \
    palette, cmt, maskt, shiftt, cms, masks, shifts) \
{                                                    \
    _g->words.w0 = _SHIFTL(G_SETTILE,  24, 8)        \
                 | _SHIFTL((fmt), 21, 3)             \
                 | _SHIFTL((siz), 19, 2)             \
                 | _SHIFTL((line), 9, 9)             \
                 | _SHIFTL((tmem), 0, 9);            \
    _g->words.w1 = _SHIFTL((tile),    24, 3)         \
                 | _SHIFTL((palette), 20, 4)         \
                 | _SHIFTL((cmt),     18, 2)         \
                 | _SHIFTL((maskt),   14, 4)         \
                 | _SHIFTL((shiftt),  10, 4)         \
                 | _SHIFTL((cms),      8, 2)         \
                 | _SHIFTL((masks),    4, 4)         \
                 | _SHIFTL((shifts),   0, 4);        \
}

/* SetDepthImage */

#define gDPSetDepthImage(pkt, image)          \
{                                             \
    Gfx *_g = (Gfx *)(pkt);                   \
    _g->words.w0 = _SHIFTL(G_SETZIMG, 24, 8); \
    _g->words.w1 = (image);                   \
}

#define gsDPSetDepthImage(image)              \
{                                             \
    _g->words.w0 = _SHIFTL(G_SETZIMG, 24, 8); \
    _g->words.w1 = (image);                   \
}

/* SetPrimColor */

#define	gDPSetPrimColor(pkt, m, l, r, g, b, a)     \
{                                                  \
    Gfx *_g = (Gfx *)(pkt);                        \
    _g->words.w0 = _SHIFTL(G_SETPRIMCOLOR, 24, 8)  \
                 | _SHIFTL(m,  8, 8)               \
                 | _SHIFTL(l,  0, 8);              \
    _g->words.w1 = _SHIFTL(r, 24, 8)               \
                 | _SHIFTL(g, 16, 8)               \
                 | _SHIFTL(b,  8, 8)               \
                 | _SHIFTL(a,  0, 8);              \
}

#define	gsDPSetPrimColor(m, l, r, g, b, a)         \
{                                                  \
    _g->words.w0 = _SHIFTL(G_SETPRIMCOLOR, 24, 8)  \
                 | _SHIFTL(m,  8, 8)               \
                 | _SHIFTL(l,  0, 8);              \
    _g->words.w1 = _SHIFTL(r, 24, 8)               \
                 | _SHIFTL(g, 16, 8)               \
                 | _SHIFTL(b,  8, 8)               \
                 | _SHIFTL(a,  0, 8);              \
}

/* SetEnvColor */

#define gDPSetEnvColor(pkt, r, g, b, a)           \
{                                                 \
    Gfx *_g = (Gfx *)(pkt);                       \
    _g->words.w0 = _SHIFTL(G_SETENVCOLOR, 24, 8); \
    _g->words.w1 = _SHIFTL((r), 24, 8)            \
                 | _SHIFTL((g), 16, 8)            \
                 | _SHIFTL((b),  8, 8)            \
                 | _SHIFTL((a),  0, 8);           \
}

#define gsDPSetEnvColor(r, g, b, a)               \
{                                                 \
    _g->words.w0 = _SHIFTL(G_SETENVCOLOR, 24, 8); \
    _g->words.w1 = _SHIFTL((r), 24, 8)            \
                 | _SHIFTL((g), 16, 8)            \
                 | _SHIFTL((b),  8, 8)            \
                 | _SHIFTL((a),  0, 8);           \
}

/* SetTextureImage */

#define gDPSetTextureImage(pkt, fmt, size, width, img) \
{                                                      \
    Gfx *_g = (Gfx *)(pkt);                            \
    _g->words.w0 = _SHIFTL(G_SETTIMG,      24,  8)     \
                 | _SHIFTL((fmt),     21,  3)          \
                 | _SHIFTL((size),    19,  2)          \
                 | _SHIFTL((width)-1,  0, 12);         \
    _g->words.w1 = (u32)(img);                         \
}

#define gsDPSetTextureImage(fmt, size, width, img)     \
{                                                      \
    _g->words.w0 = _SHIFTL(G_SETTIMG,      24,  8)     \
                 | _SHIFTL((fmt),     21,  3)          \
                 | _SHIFTL((size),    19,  2)          \
                 | _SHIFTL((width)-1,  0, 12);         \
    _g->words.w1 = (u32)(img);                         \
}

/* MoveWd */

#define gMoveWd(pkt, index, offset, data)           \
{                                                   \
    Gfx *_g = (Gfx *)(pkt);                         \
    _g->words.w0 = _SHIFTL(G_MOVEWORD,     24,  8)  \
                 | _SHIFTL((offset),  8, 16)        \
                 | _SHIFTL((index),   0,  8);       \
    _g->words.w1 = (u32)(data);                     \
}

#define gsMoveWd(index, offset, data)               \
{                                                   \
    _g->words.w0 = _SHIFTL(G_MOVEWORD,     24,  8)  \
                 | _SHIFTL((offset),  8, 16)        \
                 | _SHIFTL((index),   0,  8);       \
    _g->words.w1 = (u32)(data);                     \
}

/* Matrix Operations */

#define G_MTX_MODELVIEW  0x00
#define G_MTX_PROJECTION 0x01
#define G_MTX_MUL        0x00
#define G_MTX_LOAD       0x02
#define G_MTX_NOPUSH     0x00
#define G_MTX_PUSH       0x04

/* PopMatrix */

#define gSPPopMatrix(pkt, n)   \
{                              \
    Gfx *_g = (Gfx *) (pkt);   \
    _g->words.w0 = 0xBD000000; \
    _g->words.w1 = (n);        \
}

#define gsSPPopMatrix(pkt, n)  \
{                              \
    _g->words.w0 = 0xBD000000; \
    _g->words.w1 = (n);        \
}

/* Viewport */

#define gSPViewport(pkt, v)                             \
{                                                       \
    Gfx *_g = (Gfx *)(pkt);                             \
    _g->words.w0 = _SHIFTL(G_MOVEMEM,          24,  8)  \
                 | _SHIFTL(G_MV_VIEWPORT, 16,  8)       \
                 | _SHIFTL(sizeof(Vp),     0, 16);      \
    _g->words.w1 = (u32)(v);                            \
}

#define gsSPViewport(v)                                 \
{                                                       \
    _g->words.w0 = _SHIFTL(G_MOVEMEM,          24,  8)  \
                 | _SHIFTL(G_MV_VIEWPORT, 16,  8)       \
                 | _SHIFTL(sizeof(Vp),     0, 16);      \
    _g->words.w1 = (u32)(v);                            \
}

/* 1Triangle */
/* Fast3DEX changes how the triangle incices are stored for G_TRI1 (0xBF) */

#ifndef F3DEX_GBI
#define gSP1Triangle(pkt, v0, v1, v2, flag) \
{                                           \
    Gfx *_g = (Gfx *)(pkt);                 \
    _g->words.w0 = _SHIFTL(G_TRI1, 24, 8);  \
    _g->words.w1 = _SHIFTL((flag),  24, 8)  \
                 | _SHIFTL((v0)*10, 16, 8)  \
                 | _SHIFTL((v1)*10,  8, 8)  \
                 | _SHIFTL((v2)*10,  0, 8); \
}

#define gsSP1Triangle(v0, v1, v2, flag)     \
{                                           \
    _g->words.w0 = _SHIFTL(G_TRI1, 24, 8);  \
    _g->words.w1 = _SHIFTL((flag),  24, 8)  \
                 | _SHIFTL((v0)*10, 16, 8)  \
                 | _SHIFTL((v1)*10,  8, 8)  \
                 | _SHIFTL((v2)*10,  0, 8); \
}

#else
#define gSP1Triangle(pkt, v0, v1, v2, flag) \
{                                           \
    Gfx *_g = (Gfx *)(pkt);                 \
    _g->words.w0 = _SHIFTL(G_TRI1, 24, 8);  \
    _g->words.w1 = _SHIFTL((flag),  24, 8)  \
                 | _SHIFTL((v0)*2, 16, 8)   \
                 | _SHIFTL((v1)*2,  8, 8)   \
                 | _SHIFTL((v2)*2,  0, 8);  \
}

#define gsSP1Triangle(v0, v1, v2, flag)     \
{                                           \
    _g->words.w0 = _SHIFTL(G_TRI1, 24, 8);  \
    _g->words.w1 = _SHIFTL((flag),  24, 8)  \
                 | _SHIFTL((v0)*2, 16, 8)   \
                 | _SHIFTL((v1)*2,  8, 8)   \
                 | _SHIFTL((v2)*2,  0, 8);  \
}
#endif


/* TextureRectangle */
/* Last two commands (G_RDPHALF_CONT (which was replaced with G_MODIFYVTX) and G_RDPHALF_2) changed for this macro in Fast3DEX and onwards. */

#ifndef F3DEX_GBI
#define gSPTextureRectangle(pkt, xl, yl, xh, yh, tile, s, t, dsdx, dtdy) \
{                                                                        \
    Gfx *_g = (Gfx *)(pkt);                                              \
    _g->words.w0 = _SHIFTL(G_TEXRECT,   24,  8)                          \
                 | _SHIFTL((xh),   12, 12)                               \
                 | _SHIFTL((yh),    0, 12);                              \
    _g->words.w1 = _SHIFTL((tile), 24,  3)                               \
                 | _SHIFTL((xl),   12, 12)                               \
                 | _SHIFTL((yl),    0, 12);                              \
}                                                                        \
{                                                                        \
    Gfx *_g = (Gfx *)(pkt);                                              \
    _g->words.w0 = _SHIFTL(G_RDPHALF_2, 24,  8);                         \
    _g->words.w1 = _SHIFTL((s),  16, 16)                                 \
                 | _SHIFTL((t),   0, 16);                                \
}                                                                        \
{                                                                        \
    Gfx *_g = (Gfx *)(pkt);                                              \
    _g->words.w0 = _SHIFTL(G_RDPHALF_CONT,   24,  8);                    \
    _g->words.w1 = _SHIFTL((dsdx), 16, 16)                               \
                 | _SHIFTL((dtdy),  0, 16);                              \
}

#define gsSPTextureRectangle(xl, yl, xh, yh, tile, s, t, dsdx, dtdy)     \
{                                                                        \
    _g->words.w0 = _SHIFTL(G_TEXRECT,   24,  8)                          \
                 | _SHIFTL((xh),   12, 12)                               \
                 | _SHIFTL((yh),    0, 12);                              \
    _g->words.w1 = _SHIFTL((tile), 24,  3)                               \
                 | _SHIFTL((xl),   12, 12)                               \
                 | _SHIFTL((yl),    0, 12);                              \
}                                                                        \
{                                                                        \
    _g->words.w0 = _SHIFTL(G_RDPHALF_2, 24,  8);                         \
    _g->words.w1 = _SHIFTL((s),  16, 16)                                 \
                 | _SHIFTL((t),   0, 16);                                \
}                                                                        \
{                                                                        \
    _g->words.w0 = _SHIFTL(G_RDPHALF_CONT,   24,  8);                    \
    _g->words.w1 = _SHIFTL((dsdx), 16, 16)                               \
                 | _SHIFTL((dtdy),  0, 16);                              \
}

#else
#define gSPTextureRectangle(pkt, xl, yl, xh, yh, tile, s, t, dsdx, dtdy) \
{                                                                        \
    Gfx *_g = (Gfx *)(pkt);                                              \
    _g->words.w0 = _SHIFTL(G_TEXRECT,   24,  8)                          \
                 | _SHIFTL((xh),   12, 12)                               \
                 | _SHIFTL((yh),    0, 12);                              \
    _g->words.w1 = _SHIFTL((tile), 24,  3)                               \
                 | _SHIFTL((xl),   12, 12)                               \
                 | _SHIFTL((yl),    0, 12);                              \
}                                                                        \
{                                                                        \
    Gfx *_g = (Gfx *)(pkt);                                              \
    _g->words.w0 = _SHIFTL(G_RDPHALF_1, 24,  8);                         \
    _g->words.w1 = _SHIFTL((s),  16, 16)                                 \
                 | _SHIFTL((t),   0, 16);                                \
}                                                                        \
{                                                                        \
    Gfx *_g = (Gfx *)(pkt);                                              \
    _g->words.w0 = _SHIFTL(G_RDPHALF_2,   24,  8);                       \
    _g->words.w1 = _SHIFTL((dsdx), 16, 16)                               \
                 | _SHIFTL((dtdy),  0, 16);                              \
}

#define gsSPTextureRectangle(xl, yl, xh, yh, tile, s, t, dsdx, dtdy)      \
{                                                                        \
    _g->words.w0 = _SHIFTL(G_TEXRECT,   24,  8)                          \
                 | _SHIFTL((xh),   12, 12)                               \
                 | _SHIFTL((yh),    0, 12);                              \
    _g->words.w1 = _SHIFTL((tile), 24,  3)                               \
                 | _SHIFTL((xl),   12, 12)                               \
                 | _SHIFTL((yl),    0, 12);                              \
}                                                                        \
{                                                                        \
    _g->words.w0 = _SHIFTL(G_RDPHALF_1, 24,  8);                         \
    _g->words.w1 = _SHIFTL((s),  16, 16)                                 \
                 | _SHIFTL((t),   0, 16);                                \
}                                                                        \
{                                                                        \
    _g->words.w0 = _SHIFTL(G_RDPHALF_2,   24,  8);                       \
    _g->words.w1 = _SHIFTL((dsdx), 16, 16)                               \
                 | _SHIFTL((dtdy),  0, 16);                              \
}
#endif

/* Lights and Light Operations */

typedef struct {
    unsigned char col[3];
    char          pad1;
    unsigned char colc[3];
    char          pad2;
    signed char   dir[3];
    char          pad3;
} Light_t;

typedef struct {
    unsigned char col[3];
    char          pad1;
    unsigned char colc[3];
    char          pad2;
} Ambient_t;

typedef union {
    Ambient_t l;
    long long int force_structure_alignment[1];
} Ambient;

typedef union {
    Light_t l;
    long long int force_structure_alignment[2];
} Light;

typedef struct {
    Ambient a;
    Light   l[4];
} Lights4;

typedef struct {
    Light l[2];
} LookAt;

typedef struct {
    int x1, y1, x2, y2;
} Hilite_t;

typedef union {
    Hilite_t h;
    long int force_alignmnet[4];
} Hilite;

/* for gSPNumLights */
#define NUMLIGHTS_0 1
#define NUMLIGHTS_1 1
#define NUMLIGHTS_2 2
#define NUMLIGHTS_3 3
#define NUMLIGHTS_4 4
#define NUMLIGHTS_5 5
#define NUMLIGHTS_6 6
#define NUMLIGHTS_7 7

/* for gSPLight */
#define LIGHT_1 1
#define LIGHT_2 2
#define LIGHT_3 3
#define LIGHT_4 4
#define LIGHT_5 5	
#define LIGHT_6 6
#define LIGHT_7 7
#define LIGHT_8 8

/* Lights */

#define gSPLight(pkt, l, n)                           \
{                                                     \
    Gfx *_g = (Gfx *)(pkt);                           \
    _g->words.w0 = _SHIFTL(G_MOVEMEM,         24, 8)  \
                 | _SHIFTL(((n)-1)*2+G_MV_L0, 16, 8)  \
                 | _SHIFTL(sizeof(Light),     0, 16); \
    _g->words.w1 = (u32)(l);                          \
}

#define gsSPLight(l, n)                               \
{                                                     \
    _g->words.w0 = _SHIFTL(G_MOVEMEM,         24, 8)  \
                 | _SHIFTL(((n)-1)*2+G_MV_L0, 16, 8)  \
                 | _SHIFTL(sizeof(Light),     0, 16); \
    _g->words.w1 = (u32)(l);                          \
}

/* LookAtX */

#define gSPLookAtX(pkt, la)                       \
{                                                 \
    Gfx *_g = (Gfx *)(pkt);                       \
    _g->words.w0 = _SHIFTL(G_MOVEMEM,    24,  8)  \
                 | _SHIFTL(G_MV_LOOKATX, 16,  8)  \
                 | _SHIFTL(sizeof(Light), 0, 16); \
    _g->words.w1 = (u32)(la);                     \
}

#define gsSPLookAtX(la)                           \
{                                                 \
    _g->words.w0 = _SHIFTL(G_MOVEMEM,    24,  8)  \
                 | _SHIFTL(G_MV_LOOKATX, 16,  8)  \
                 | _SHIFTL(sizeof(Light), 0, 16); \
    _g->words.w1 = (u32)(la);                     \
}

/* LookAtY */

#define gSPLookAtY(pkt, la)                       \
{                                                 \
    Gfx *_g = (Gfx *)(pkt);                       \
    _g->words.w0 = _SHIFTL(G_MOVEMEM,    24,  8)  \
                 | _SHIFTL(G_MV_LOOKATY, 16,  8)  \
                 | _SHIFTL(sizeof(Light), 0, 16); \
    _g->words.w1 = (u32)(la);                     \
}

#define gsSPLookAtY(la)                           \
{                                                 \
    _g->words.w0 = _SHIFTL(G_MOVEMEM,    24,  8)  \
                 | _SHIFTL(G_MV_LOOKATY, 16,  8)  \
                 | _SHIFTL(sizeof(Light), 0, 16); \
    _g->words.w1 = (u32)(la);                     \
}

/* LookAt */

#define gSPLookAt(pkt, la)             \
{                                      \
    gSPLookAtX((pkt), (la))            \
    gSPLookAtY((pkt), (char *)(la)+16) \
}

#define gsSPLookAt(la)           \
{                                \
    gsSPLookAtX((la))            \
    gsSPLookAtY((char *)(la)+16) \
}

/* PerspNormalize */

#ifndef F3DEX_GBI
#define gSPPerspNormalize(pkt, s)               \
{                                               \
    Gfx *g = pkt;                               \
    g->words.w0 = _SHIFTL(G_RDPHALF_1, 24, 8);  \
    g->words.w1 = s;                            \
}

#define gsSPPerspNormalize(s)                   \
{                                               \
    g->words.w0 = _SHIFTL(G_RDPHALF_1, 24, 8);  \
    g->words.w1 = s;                            \
}

#else
#define gSPPerspNormalize(pkt, s)       \
	gMoveWd(pkt, G_MW_PERSPNORM, 0, (s))

#define gsSPPerspNormalize(s)            \
	gsMoveWd(G_MW_PERSPNORM, 0, (s))
#endif

#endif
