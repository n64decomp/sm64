# Assembly Macros

.set NULL, 0
.set FALSE, 0
.set TRUE, 1

.set K0BASE, 0x80000000
.set K1BASE, 0xA0000000
.set K2BASE, 0xC0000000
.set SCREEN_WIDTH, 320
.set SCREEN_HEIGHT, 240
.set PTR_WIDTH, 4

.macro glabel label
    .global \label
    .balign 4
    \label:
.endm

.macro .word32 x
    .word \x
.endm

# F3D vertex
.macro vertex x, y, z, u, v, r=0xFF, g=0xFF, b=0xFF, a=0xFF
    .hword \x, \y, \z, 0, \u, \v
    .byte \r, \g, \b, \a
.endm

# Beginning of trajectory
.macro trajectory_init
    .set TRAJ_ID, 0
.endm

# Entry in trajectory
.macro trajectory_pos x, y, z
    .hword TRAJ_ID, \x, \y, \z
    .set TRAJ_ID, TRAJ_ID + 1
.endm

# Skips an ID (used for CCM)
.macro trajectory_skip
    .set TRAJ_ID, TRAJ_ID + 1
.endm

# End of trajectory
.macro trajectory_end
    .hword -1
.endm

.macro macro_object preset, yaw, x, y, z, bparam=0
    .hword ((\yaw * 0x10 / 45) << 9) | (\preset + 0x1F), \x, \y, \z, \bparam
.endm

# General special object macro
.macro special_object preset, posX, posY, posZ, rotY=-1, param=-1
.if (\param != -1) && (\rotY != -1) # 11 byte
.hword \preset, \posX, \posY, \posZ, \rotY, \param
.endif
.if (\param == -1) && (\rotY != -1) # 10 byte
.hword \preset, \posX, \posY, \posZ, \rotY
.endif
.if (\param == -1) && (\rotY == -1) # 8 byte
.hword \preset, \posX, \posY, \posZ
.endif
.endm

# Actor include
.macro actor name
.include "actors/\name\()/model.s"
.include "actors/\name\()/collision.s"
binid
.endm

# Actor include (no binid), needed for mario bin (TODO: Better solution?)
.macro rawactor name
.include "actors/\name\()/model.s"
.include "actors/\name\()/collision.s"
.endm

# Actor geo include
.macro actorgeo name
.include "actors/\name\()/geo.s"
.endm

.macro initbinid
.set BINID, 0
.endm

.macro binid
.dword BINID
.set BINID, BINID + 1
.endm

.macro leveldata name
.section .seg07, "a"
.align 4
.incbin "mio0/\name\()/leveldata.mio0"
.align 4
.endm

.macro levelscript name
.section .level, "a"
.include "levels/\name\()/script.s"
.endm

.macro levelgeo name
.align 4
.include "levels/\name\()/geo.s"
.align 4
.endm

.macro dialog_entry w1, w2, w3, w4
    .word32 \w1
    .byte (\w2 >> 24), 0x00
    .hword (\w2 & 0xFFFF), (\w3 >> 16), 0x0000
    .word \w4
.endm
