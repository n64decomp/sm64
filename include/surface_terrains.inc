# Surface Types
.set SURFACE_DEFAULT,         0x0000  # Environment default
.set SURFACE_BURNING,         0x0001  # Lava / Frostbite (in SL), but is used mostly for Lava
.set SURFACE_0004,            0x0004  # Unused, has no function and has parameters
.set SURFACE_HANGABLE,        0x0005  # Ceiling that Mario can climb on
.set SURFACE_SLOW,            0x0009  # Slow down Mario, unused
.set SURFACE_DEATH_PLANE,     0x000A  # Death floor
.set SURFACE_CLOSE_CAMERA,    0x000B  # Close camera
.set SURFACE_WATER,           0x000D  # Water, has no action, used on some waterboxes below
.set SURFACE_WATER_FLOWING,   0x000E  # Water (flowing), has parameters
.set SURFACE_INTANGIBLE,      0x0012  # Intangible (Separates BBH mansion from merry-go-round, for room usage)
.set SURFACE_VERY_SLIPPERY,   0x0013  # Very slippery, mostly used for slides
.set SURFACE_SLIPPERY,        0x0014  # Slippery
.set SURFACE_NO_SLIPPERY,     0x0015  # Non-slippery, climbable
.set SURFACE_TTM_VINES,       0x0016  # TTM vines, has no action defined
.set SURFACE_MGR_MUSIC,       0x001A  # Plays the Merry go round music, see handle_merry_go_round_music in bbh_merry_go_round.inc.c for more details
.set SURFACE_INST_WARP_1B,    0x001B  # Instant warp to another area, used to warp between areas in WDW and the endless stairs to warp back
.set SURFACE_INST_WARP_1C,    0x001C  # Instant warp to another area, used to warp between areas in WDW
.set SURFACE_INST_WARP_1D,    0x001D  # Instant warp to another area, used to warp between areas in DDD, SSL and TTM
.set SURFACE_INST_WARP_1E,    0x001E  # Instant warp to another area, used to warp between areas in DDD, SSL and TTM
.set SURFACE_QUICKSAND_21,    0x0021  # Shallow Quicksand (depth of 10 units)
.set SURFACE_QUICKSAND_22,    0x0022  # Quicksand (lethal, slow, depth of 160 units)
.set SURFACE_QUICKSAND_23,    0x0023  # Quicksand (lethal, instant)
.set SURFACE_QUICKSAND_24,    0x0024  # Moving quicksand (flowing, depth of 160 units)
.set SURFACE_QUICKSAND_25,    0x0025  # Moving quicksand (flowing, depth of 25 units)
.set SURFACE_QUICKSAND_26,    0x0026  # Moving quicksand (60 units)
.set SURFACE_QUICKSAND_27,    0x0027  # Moving quicksand (flowing, depth of 60 units)
.set SURFACE_WALL_MISC,       0x0028  # Used for some walls, Cannon to adjust the camera, and some objects like Warp Pipe
.set SURFACE_NOISE_DEFAULT,   0x0029  # Default floor with noise
.set SURFACE_NOISE_SLIPPERY,  0x002A  # Slippery floor with noise
.set SURFACE_H_WIND,          0x002C  # Horizontal wind, has parameters
.set SURFACE_QUICKSAND_2D,    0x002D  # Quicksand (lethal, flowing)
.set SURFACE_ICE,             0x002E  # Slippery Ice, in snow levels and THI's water floor
.set SURFACE_LOOK_UP_WARP,    0x002F  # Look up and warp (Wing cap entrance)
.set SURFACE_HARD_FLOOR,      0x0030  # Hard floor (Always has fall damage)
.set SURFACE_WARP,            0x0032  # Surface warp
.set SURFACE_TIMER_START,     0x0033  # Timer start (Peach's secret slide)
.set SURFACE_TIMER_STOP,      0x0034  # Timer stop (Peach's secret slide)
.set SURFACE_HARD_SLIP,       0x0035  # Hard and slippery (Always has fall damage)
.set SURFACE_HARD_VERY_SLIP,  0x0036  # Hard and very slippery (Always has fall damage)
.set SURFACE_HARD_NO_SLIP,    0x0037  # Hard and Non-slippery (Always has fall damage)
.set SURFACE_V_WIND,          0x0038  # Death at bottom with vertical wind
.set SURFACE_WIDE_CAMERA,     0x0065  # Wide camera for BOB and WF bosses
.set SURFACE_FREE_ROAM_CAM,   0x0066  # Free roam camera for THI and TTC
.set SURFACE_THI3_WALLKICK,   0x0068  # Surface where there's a wall kick section in THI 3rd area, has no action defined
.set SURFACE_CAM_PLATFORM,    0x0069  # Surface that enables far camera for platforms, used in THI
.set SURFACE_CAM_MIDDLE,      0x006E  # Surface camera that returns to the middle, used on the 4 pillars of SSL
.set SURFACE_CAM_ROT_RIGHT,   0x006F  # Surface camera that rotates to the right (BITDW & THI)
.set SURFACE_CAM_ROT_LEFT,    0x0070  # Surface camera that rotates to the left (BOB & TTM)
.set SURFACE_CAM_BOUNDARY,    0x0072  # Intangible Area, only used to restrict camera movement
.set SURFACE_NOISE_SLIP_73,   0x0073  # Very slippery floor with noise, unused
.set SURFACE_NOISE_SLIP_74,   0x0074  # Very slippery floor with noise, unused
.set SURFACE_NOISE_SLIP_75,   0x0075  # Very slippery floor with noise, used in CCM
.set SURFACE_CAM_NO_COL,      0x0076  # Surface with no cam collision flag
.set SURFACE_CAM_NO_COL_77,   0x0077  # Surface with no cam collision flag, unused
.set SURFACE_VERY_SLIP_78,    0x0078  # Surface with no cam collision flag, very slippery with noise (THI)
.set SURFACE_SLIPPERY_79,     0x0079  # Surface with no cam collision flag, slippery with noise (CCM, PSS and TTM slides)
.set SURFACE_SWITCH,          0x007A  # Surface with no cam collision flag, non-slippery with noise, used by switches and Dorrie
.set SURFACE_VAN_CAP_WALL,    0x007B  # Vanish cap walls, pass through them with Vanish Cap
.set SURFACE_PAINT_WOOBLE_A6, 0x00A6  # Painting wobble (BOB, TTM Slide - Left)
.set SURFACE_PAINT_WOOBLE_A7, 0x00A7  # Painting wobble (BOB, TTM Slide - Middle)
.set SURFACE_PAINT_WOOBLE_A8, 0x00A8  # Painting wobble (BOB, TTM Slide - Right)
.set SURFACE_PAINT_WOOBLE_A9, 0x00A9  # Painting wobble (CCM Left)
.set SURFACE_PAINT_WOOBLE_AA, 0x00AA  # Painting wobble (CCM Middle)
.set SURFACE_PAINT_WOOBLE_AB, 0x00AB  # Painting wobble (CCM Right)
.set SURFACE_PAINT_WOOBLE_AC, 0x00AC  # Painting wobble (WF Left)
.set SURFACE_PAINT_WOOBLE_AD, 0x00AD  # Painting wobble (WF Middle)
.set SURFACE_PAINT_WOOBLE_AE, 0x00AE  # Painting wobble (WF Right)
.set SURFACE_PAINT_WOOBLE_AF, 0x00AF  # Painting wobble (JRB Left)
.set SURFACE_PAINT_WOOBLE_B0, 0x00B0  # Painting wobble (JRB Middle)
.set SURFACE_PAINT_WOOBLE_B1, 0x00B1  # Painting wobble (JRB Right)
.set SURFACE_PAINT_WOOBLE_B2, 0x00B2  # Painting wobble (LLL Left)
.set SURFACE_PAINT_WOOBLE_B3, 0x00B3  # Painting wobble (LLL Middle)
.set SURFACE_PAINT_WOOBLE_B4, 0x00B4  # Painting wobble (LLL Right)
.set SURFACE_PAINT_WOOBLE_B5, 0x00B5  # Painting wobble (SSL Left)
.set SURFACE_PAINT_WOOBLE_B6, 0x00B6  # Painting wobble (SSL Middle)
.set SURFACE_PAINT_WOOBLE_B7, 0x00B7  # Painting wobble (SSL Right)
.set SURFACE_PAINT_WOOBLE_B8, 0x00B8  # Painting wobble (Unused - Left)
.set SURFACE_PAINT_WOOBLE_B9, 0x00B9  # Painting wobble (Unused - Middle)
.set SURFACE_PAINT_WOOBLE_BA, 0x00BA  # Painting wobble (Unused - Right)
.set SURFACE_PAINT_WOOBLE_BB, 0x00BB  # Painting wobble (DDD - Left), makes the painting wobble if touched
.set SURFACE_PAINT_WOOBLE_BC, 0x00BC  # Painting wobble (Unused, DDD - Middle)
.set SURFACE_PAINT_WOOBLE_BD, 0x00BD  # Painting wobble (Unused, DDD - Right)
.set SURFACE_PAINT_WOOBLE_BE, 0x00BE  # Painting wobble (WDW Left)
.set SURFACE_PAINT_WOOBLE_BF, 0x00BF  # Painting wobble (WDW Middle)
.set SURFACE_PAINT_WOOBLE_C0, 0x00C0  # Painting wobble (WDW Right)
.set SURFACE_PAINT_WOOBLE_C1, 0x00C1  # Painting wobble (THI Tiny - Left)
.set SURFACE_PAINT_WOOBLE_C2, 0x00C2  # Painting wobble (THI Tiny - Middle)
.set SURFACE_PAINT_WOOBLE_C3, 0x00C3  # Painting wobble (THI Tiny - Right)
.set SURFACE_PAINT_WOOBLE_C4, 0x00C4  # Painting wobble (TTM Left)
.set SURFACE_PAINT_WOOBLE_C5, 0x00C5  # Painting wobble (TTM Middle)
.set SURFACE_PAINT_WOOBLE_C6, 0x00C6  # Painting wobble (TTM Right)
.set SURFACE_PAINT_WOOBLE_C7, 0x00C7  # Painting wobble (Unused, TTC - Left)
.set SURFACE_PAINT_WOOBLE_C8, 0x00C8  # Painting wobble (Unused, TTC - Middle)
.set SURFACE_PAINT_WOOBLE_C9, 0x00C9  # Painting wobble (Unused, TTC - Right)
.set SURFACE_PAINT_WOOBLE_CA, 0x00CA  # Painting wobble (Unused, SL - Left)
.set SURFACE_PAINT_WOOBLE_CB, 0x00CB  # Painting wobble (Unused, SL - Middle)
.set SURFACE_PAINT_WOOBLE_CC, 0x00CC  # Painting wobble (Unused, SL - Right)
.set SURFACE_PAINT_WOOBLE_CD, 0x00CD  # Painting wobble (THI Huge - Left)
.set SURFACE_PAINT_WOOBLE_CE, 0x00CE  # Painting wobble (THI Huge - Middle)
.set SURFACE_PAINT_WOOBLE_CF, 0x00CF  # Painting wobble (THI Huge - Right)
.set SURFACE_PAINT_WOOBLE_D0, 0x00D0  # Painting wobble (HMC & COTMC - Left), makes the painting wobble if touched
.set SURFACE_PAINT_WOOBLE_D1, 0x00D1  # Painting wobble (Unused, HMC & COTMC - Middle)
.set SURFACE_PAINT_WOOBLE_D2, 0x00D2  # Painting wobble (Unused, HMC & COTMC - Right)
.set SURFACE_PAINT_WARP_D3,   0x00D3  # Painting warp (BOB, TTM Slide - Left)
.set SURFACE_PAINT_WARP_D4,   0x00D4  # Painting warp (BOB, TTM Slide - Middle)
.set SURFACE_PAINT_WARP_D5,   0x00D5  # Painting warp (BOB, TTM Slide - Right)
.set SURFACE_PAINT_WARP_D6,   0x00D6  # Painting warp (CCM Left)
.set SURFACE_PAINT_WARP_D7,   0x00D7  # Painting warp (CCM Middle)
.set SURFACE_PAINT_WARP_D8,   0x00D8  # Painting warp (CCM Right)
.set SURFACE_PAINT_WARP_D9,   0x00D9  # Painting warp (WF Left)
.set SURFACE_PAINT_WARP_DA,   0x00DA  # Painting warp (WF Middle)
.set SURFACE_PAINT_WARP_DB,   0x00DB  # Painting warp (WF Right)
.set SURFACE_PAINT_WARP_DC,   0x00DC  # Painting warp (JRB Left)
.set SURFACE_PAINT_WARP_DD,   0x00DD  # Painting warp (JRB Middle)
.set SURFACE_PAINT_WARP_DE,   0x00DE  # Painting warp (JRB Right)
.set SURFACE_PAINT_WARP_DF,   0x00DF  # Painting warp (LLL Left)
.set SURFACE_PAINT_WARP_E0,   0x00E0  # Painting warp (LLL Middle)
.set SURFACE_PAINT_WARP_E1,   0x00E1  # Painting warp (LLL Right)
.set SURFACE_PAINT_WARP_E2,   0x00E2  # Painting warp (SSL Left)
.set SURFACE_PAINT_WARP_E3,   0x00E3  # Painting warp (SSL Medium)
.set SURFACE_PAINT_WARP_E4,   0x00E4  # Painting warp (SSL Right)
.set SURFACE_PAINT_WARP_E5,   0x00E5  # Painting warp (Unused - Left)
.set SURFACE_PAINT_WARP_E6,   0x00E6  # Painting warp (Unused - Medium)
.set SURFACE_PAINT_WARP_E7,   0x00E7  # Painting warp (Unused - Right)
.set SURFACE_PAINT_WARP_E8,   0x00E8  # Painting warp (DDD - Left)
.set SURFACE_PAINT_WARP_E9,   0x00E9  # Painting warp (DDD - Middle)
.set SURFACE_PAINT_WARP_EA,   0x00EA  # Painting warp (DDD - Right)
.set SURFACE_PAINT_WARP_EB,   0x00EB  # Painting warp (WDW Left)
.set SURFACE_PAINT_WARP_EC,   0x00EC  # Painting warp (WDW Middle)
.set SURFACE_PAINT_WARP_ED,   0x00ED  # Painting warp (WDW Right)
.set SURFACE_PAINT_WARP_EE,   0x00EE  # Painting warp (THI Tiny - Left)
.set SURFACE_PAINT_WARP_EF,   0x00EF  # Painting warp (THI Tiny - Middle)
.set SURFACE_PAINT_WARP_F0,   0x00F0  # Painting warp (THI Tiny - Right)
.set SURFACE_PAINT_WARP_F1,   0x00F1  # Painting warp (TTM Left)
.set SURFACE_PAINT_WARP_F2,   0x00F2  # Painting warp (TTM Middle)
.set SURFACE_PAINT_WARP_F3,   0x00F3  # Painting warp (TTM Right)
.set SURFACE_PAINT_WARP_F4,   0x00F4  # Painting warp (TTC Left)
.set SURFACE_PAINT_WARP_F5,   0x00F5  # Painting warp (TTC Middle)
.set SURFACE_PAINT_WARP_F6,   0x00F6  # Painting warp (TTC Right)
.set SURFACE_PAINT_WARP_F7,   0x00F7  # Painting warp (SL Left)
.set SURFACE_PAINT_WARP_F8,   0x00F8  # Painting warp (SL Middle)
.set SURFACE_PAINT_WARP_F9,   0x00F9  # Painting warp (SL Right)
.set SURFACE_PAINT_WARP_FA,   0x00FA  # Painting warp (THI Tiny - Left)
.set SURFACE_PAINT_WARP_FB,   0x00FB  # Painting warp (THI Tiny - Middle)
.set SURFACE_PAINT_WARP_FC,   0x00FC  # Painting warp (THI Tiny - Right)
.set SURFACE_WOBBLING_WARP,   0x00FD  # Pool warp (HMC & DDD)
.set SURFACE_TRAPDOOR,        0x00FF  # Bowser Left trapdoor, has no action defined

# These collision commands are unique "surface" types like those defined higher

# Collision Data Routine Initiate
.macro colInit
    .hword 0x0040
.endm

# Collision Vertices Read Initiate
.macro colVertexInit vtxNum
    .hword \vtxNum
.endm

# Collision Vertex
.macro colVertex x, y, z
    .hword \x, \y, \z
.endm

# Collision Tris Initiate
.macro colTriInit surfType, triNum
    .hword \surfType
    .hword \triNum
.endm

# Collision Tri
.macro colTri v1, v2, v3
    .hword \v1, \v2, \v3
.endm

# Collision Tri With Special Params
.macro colTriSpecial v1, v2, v3, param
    .hword \v1, \v2, \v3, \param
.endm

# Collision Tris Stop Loading
.macro colTriStop
    .hword 0x0041
.endm

# End Collision Data
.macro colEnd
    .hword 0x0042
.endm

# Special Object Initiate
.macro colSpecialInit num
    .hword 0x0043
    .hword \num
.endm

# Water Boxes Initiate
.macro colWaterBoxInit num
    .hword 0x0044
    .hword \num
.endm

# Water Box
.macro colWaterBox id, x1, z1, x2, z2, y
    .hword \id
    .hword \x1, \z1
    .hword \x2, \z2
    .hword \y
.endm

# Terrain types defined by the level script command terrain_type (cmd_31)
.set TERRAIN_GRASS,  0x0000
.set TERRAIN_STONE,  0x0001
.set TERRAIN_SNOW,   0x0002
.set TERRAIN_SAND,   0x0003
.set TERRAIN_SPOOKY, 0x0004
.set TERRAIN_WATER,  0x0005
.set TERRAIN_SLIDE,  0x0006
.set TERRAIN_MASK,   0x0007
