# From gMovingTextureIdList
.set TEXTURE_WATER,            0
.set TEXTURE_MIST,             1
.set TEXTURE_JRB_WATER,        2
.set TEXTURE_UNK_WATER,        3
.set TEXTURE_LAVA,             4
.set TEX_QUICKSAND_SSL,        5
.set TEX_PYRAMID_SAND_SSL,     6
.set TEX_YELLOW_TRI_TTC,       7

# Moving Texture rotations
.set ROTATE_CLOCKWISE,         0
.set ROTATE_COUNTER_CLOCKWISE, 1

# Moving texture load quad tris start
.macro movTexInitLoad, amount
    .hword \amount
    .hword 0
.endm

# Short Triangle of moving texture with only 4 triangles with x and z 
.macro movTex4BoxTris, x, z
    .hword \x, \z
.endm

# Moving texture miniTri define texture from MovingTextureList
.macro movTexDefine, text
    .hword \text
.endm

# Moving texture start with speed
.macro movTexSpd, speed
    .hword \speed
.endm

# Rotation speed of moving texture
.macro movTexRotSpeed, rotspeed
    .hword \rotspeed
.endm

# Rotation scale of moving texture that goes back and forth
.macro movTexRotScale, rotscale
    .hword \rotscale
.endm

# Rotation of moving texture
.macro movTexRot, rot
    .hword \rot
.endm

# Alpha of moving texture
.macro movTexAlpha, alpha
    .hword \alpha
.endm

# Triangle of moving texture
.macro movTexTris, x, y, z, param1, param2
    .hword \x, \y, \z, \param1, \param2
.endm

# 2 Triangles of moving texture
.macro movTexRotTris, x, y, z, rotx, roty, rotz, param1, param2
    .hword \x, \y, \z, \rotx, \roty, \rotz, \param1, \param2
.endm

# Triangle of moving texture with light
.macro movTexLightTris, x, y, z, light, param1, param2
    .hword \x, \y, \z, 0, \light, 0, \param1, \param2
.endm

# Jump to a moving texture tri
.macro movTexJump, id, addr
    .hword \id, 0
    .word \addr
.endm

# Moving texture load quad tris stop
.macro movTexEndLoad
    .hword -1
    .hword 0
.endm

# End of moving texture jump addr
.macro movTexEndJump
    .word 0x0
.endm

# End of moving texture load
.macro movTexEnd
    .hword 0
.endm

# End of moving texture load if movTexRotTris was used, only used in SSL
.macro movTexRotEnd
    .hword 0, 0
.endm
