# drawing layers
.set LAYER_FORCE,                 0
.set LAYER_OPAQUE,                1
.set LAYER_OPAQUE_DECAL,          2
.set LAYER_OPAQUE_INTER,          3
.set LAYER_ALPHA,                 4
.set LAYER_TRANSPARENT,           5
.set LAYER_TRANSPARENT_DECAL,     6
.set LAYER_TRANSPARENT_INTER,     7

# sky background params
.set BACKGROUND_OCEAN_SKY,        0
.set BACKGROUND_FLAMING_SKY,      1
.set BACKGROUND_UNDERWATER_CITY,  2
.set BACKGROUND_BELOW_CLOUDS,     3
.set BACKGROUND_SNOW_MOUNTAINS,   4
.set BACKGROUND_DESERT,           5
.set BACKGROUND_HAUNTED,          6
.set BACKGROUND_GREEN_SKY,        7
.set BACKGROUND_ABOVE_CLOUDS,     8
.set BACKGROUND_PURPLE_SKY,       9

# geo layout macros

# 0x00: Branch and store return address
#   0x04: scriptTarget, segment address of geo layout
.macro geo_branch_and_link scriptTarget
    .byte 0x00, 0x00, 0x00, 0x00
    .word \scriptTarget
.endm

# 0x01: Terminate geo layout
#   0x01-0x03: unused
.macro geo_end
    .byte 0x01, 0x00, 0x00, 0x00
.endm

# 0x02: Branch
#   0x01: if 1, store next geo layout address on stack
#   0x02-0x03: unused
#   0x04: scriptTarget, segment address of geo layout
.macro geo_branch type, scriptTarget
    .byte 0x02, \type, 0x00, 0x00
    .word \scriptTarget
.endm

# 0x03: Return from branch
#   0x01-0x03: unused
.macro geo_return
    .byte 0x03, 0x00, 0x00, 0x00
.endm

# 0x04: Open node
#   0x01-0x03: unused
.macro geo_open_node
    .byte 0x04, 0x00, 0x00, 0x00
.endm

# 0x05: Close node
#   0x01-0x03: unused
.macro geo_close_node
    .byte 0x05, 0x00, 0x00, 0x00
.endm

# 0x06: Register the current node at the given index in the gGeoViews array
#   0x01: unused
#   0x02: s16 index
.macro geo_assign_as_view param
    .byte 0x06, 0x00
    .hword \param
.endm

# 0x07: Update current scene graph node flags
#   0x01: u8 operation (0 = reset, 1 = set, 2 = clear)
#   0x02: s16 bits
.macro geo_update_node_flags operation, flagBits
    .byte 0x07, \operation
    .hword \flagBits
.endm

# 0x08: Create screen area scene graph node
#   0x01: unused
#   0x02: s16 num entries (+2) to allocate
#   0x04: s16 x
#   0x06: s16 y
#   0x08: s16 width
#   0x0A: s16 height
.macro geo_node_screen_area numEntries, x, y, width, height
    .byte 0x08, 0x00
    .hword \numEntries
    .hword \x, \y, \width, \height
.endm

# 0x09: Create orthographic projection scene graph node
#   0x02: s16 scale as percentage
.macro geo_node_ortho param
    .byte 0x09, 0x00
    .hword \param
.endm

# 0x0A: Create camera frustum scene graph node
#   0x01: u8  if nonzero, enable function field
#   0x02: s16 field of view
#   0x04: s16 near
#   0x06: s16 far
#   0x08: [GraphNodeFunc function]
.macro geo_camera_frustum fov, near, far, function=0
    .byte 0x0A
    .if (\function != 0)
       .byte 0x01
    .else
       .byte 0x00
    .endif
    .hword \fov, \near, \far
    .if (\function != 0)
       .word \function
    .endif
.endm

# 0x0B: Create a root scene graph node
#   0x01-0x03: unused
.macro geo_node_start
    .byte 0x0B, 0x00, 0x00, 0x00
.endm

# 0x0C: Create zbuffer-toggling scene graph node
#   0x01: u8 enableZBuffer (1 = on, 0 = off)
#   0x02-0x03: unused
.macro geo_zbuffer enable
    .byte 0x0C, \enable, 0x00, 0x00
.endm

# 0x0D: Create render range scene graph node
#   0x01-0x03: unused
#   0x04: s16 minDistance
#   0x06: s16 maxDistance
.macro geo_render_range minDistance, maxDistance
    .byte 0x0D, 0x00, 0x00, 0x00
    .hword \minDistance, \maxDistance
.endm

# 0x0E: Create switch-case scene graph node
#   0x01: unused
#   0x02: s16 numCases
#   0x04: GraphNodeFunc caseSelectorFunc
.macro geo_switch_case count, function
    .byte 0x0E, 0x00
    .hword \count
    .word \function
.endm

# 0x0F: Create a camera scene graph node.
#   0x01: unused
#   0x02: s16 camera type
#   0x04: s16 fromX
#   0x06: s16 fromY
#   0x08: s16 fromZ
#   0x0A: s16 toX
#   0x0C: s16 toY
#   0x0E: s16 toZ
#   0x10: GraphNodeFunc function
.macro geo_camera type, x1, y1, z1, x2, y2, z2, function
    .byte 0x0F, 0x00
    .hword \type, \x1, \y1, \z1, \x2, \y2, \z2
    .word \function
.endm

# 0x10: Create translation & rotation scene graph node with optional display list
# Four different versions of 0x10
#   cmd+0x01: u8 params
#     0b1000_0000: if set, enable displayList field and drawingLayer
#     0b0111_0000: fieldLayout (determines how rest of data is formatted
#     0b0000_1111: drawingLayer
#
#   fieldLayout = 0: Translate & Rotate
#     0x04: s16 xTranslation
#     0x06: s16 xTranslation
#     0x08: s16 xTranslation
#     0x0A: s16 xRotation
#     0x0C: s16 xRotation
#     0x0E: s16 xRotation
#     0x10: [u32 displayList: if MSbit of params set, display list segmented address]
.macro geo_translate_rotate layer, tx, ty, tz, rx, ry, rz, displayList=0
    .byte 0x10
    .if (\displayList != 0)
        .byte 0x00 | \layer | 0x80
    .else
        .byte 0x00 | \layer
    .endif
    .hword 0x0000
    .hword \tx, \ty, \tz
    .hword \rx, \ry, \rz
    .if (\displayList != 0)
        .word \displayList
    .endif
.endm

#   fieldLayout = 1: Translate
#     0x02: s16 xTranslation
#     0x04: s16 yTranslation
#     0x06: s16 zTranslation
#     0x08: [u32 displayList: if MSbit of params set, display list segmented address]
.macro geo_translate layer, tx, ty, tz, displayList=0
    .byte 0x10
    .if (\displayList != 0)
        .byte 0x10 | \layer | 0x80
    .else
        .byte 0x10 | \layer
    .endif
    .hword \tx, \ty, \tz
    .if (\displayList != 0)
        .word \displayList
    .endif
.endm

#   fieldLayout = 2: Rotate
#     0x02: s16 xRotation
#     0x04: s16 yRotation
#     0x06: s16 zRotation
#     0x08: [u32 displayList: if MSbit of params set, display list segmented address]
.macro geo_rotate layer, rx, ry, rz, displayList=0
    .byte 0x10
    .if (\displayList != 0)
        .byte 0x20 | \layer | 0x80
    .else
        .byte 0x20 | \layer
    .endif
    .hword \rx, \ry, \rz
    .if (\displayList != 0)
        .word \displayList
    .endif
.endm

#   fieldLayout = 3: Rotate Y
#     0x02: s16 yRotation
#     0x04: [u32 displayList: if MSbit of params set, display list segmented address]
.macro geo_rotate_y layer, ry, displayList=0
    .byte 0x10
    .if (\displayList != 0)
        .byte 0x30 | \layer | 0x80
    .else
        .byte 0x30 | \layer
    .endif
    .hword \ry
    .if (\displayList != 0)
        .word \displayList
    .endif
.endm

# 0x11: Create translation scene graph node with optional display list
#   0x01: u8 params
#     0b1000_0000: if set, enable displayList field and drawingLayer
#     0b0000_1111: drawingLayer
#   0x02: s16 translationX
#   0x04: s16 translationY
#   0x06: s16 translationZ
#   0x08: [u32 displayList: if MSbit of params set, display list segmented address]
.macro geo_translate_node layer, ux, uy, uz, displayList=0
    .byte 0x11
    .if (\displayList != 0)
        .byte 0x80 | \layer
    .else
        .byte 0x00
    .endif
    .hword \ux, \uy, \uz
    .if (\displayList != 0)
        .word \displayList
    .endif
.endm

# 0x12: Create rotation scene graph node with optional display list
#   0x01: u8 params
#      0b1000_0000: if set, enable displayList field and drawingLayer
#      0b0000_1111: drawingLayer
#   0x02: s16 rotationX
#   0x04: s16 rotationY
#   0x06: s16 rotationZ
#   0x08: [u32 displayList: if MSbit of params set, display list segmented address]
.macro geo_rotation_node layer, ux, uy, uz, displayList=0
    .byte 0x12
    .if (\displayList != 0)
        .byte 0x80 | \layer
    .else
        .byte 0x00
    .endif
    .hword \ux, \uy, \uz
    .if (\displayList != 0)
        .word \displayList
    .endif
.endm

# 0x13: Create a scene graph node that is rotated by the object's animation.
#   0x01: u8 drawingLayer
#   0x02: s16 xTranslation
#   0x04: s16 yTranslation
#   0x06: s16 zTranslation
#   0x08: u32 displayList: dislay list segmented address
.macro geo_animated_part layer, x, y, z, displayList=0
    .byte 0x13, \layer
    .hword \x, \y, \z
    .word \displayList
.endm

# 0x14: Create billboarding node with optional display list
#   0x01: u8 params
#      0b1000_0000: if set, enable displayList field and drawingLayer
#      0b0000_1111: drawingLayer
#   0x02: s16 xTranslation
#   0x04: s16 yTranslation
#   0x06: s16 zTranslation
#   0x08: [u32 displayList: if MSbit of params is set, display list segmented address]
.macro geo_billboard layer=0, tx=0, ty=0, tz=0, displayList=0
    .byte 0x14
    .if (\displayList != 0)
        .byte 0x80 | \layer
    .else
        .byte 0x00
    .endif
    .hword \tx, \ty, \tz
    .if (\displayList != 0)
        .word \displayList
    .endif
.endm

# 0x15: Create plain display list scene graph node
#   0x01: u8 drawingLayer
#   0x02=0x03: unused
#   0x04: u32 displayList: display list segmented address
.macro geo_display_list layer, displayList
    .byte 0x15, \layer, 0x00, 0x00
    .word \displayList
.endm

# 0x16: Create shadow scene graph node
#   0x01: unused
#   0x02: s16 shadowType (cast to u8)
#   0x04: s16 shadowSolidity (cast to u8)
#   0x06: s16 shadowScale
.set SHADOW_CIRCLE_9_VERTS,      0x00
.set SHADOW_CIRCLE_4_VERTS,      0x01
.set SHADOW_CIRCLE_4_VERTS_FLAT_UNUSED,      0x02  # unused shadow type
.set SHADOW_SQUARE_PERMANENT, 0x0A  # square shadow that never disappears
.set SHADOW_SQUARE_SCALABLE,  0x0B  # square shadow, shrinks with distance
.set SHADOW_SQUARE_TOGGLABLE, 0x0C  # square shadow, disappears with distance
.set SHADOW_CIRCLE_PLAYER,    0x63  # player (Mario) shadow
.set SHADOW_RECTANGLE_HARDCODED_OFFSET, 0x32 # offset of hard-coded shadows
.macro geo_shadow type, solidity, scale
    .byte 0x16, 0x00
    .hword \type, \solidity, \scale
.endm

# 0x17: TODO Create render object scene graph node
#   0x01-0x03: unused
.macro geo_render_obj
    .byte 0x17, 0x00, 0x00, 0x00
.endm

# 0x18: Create dynamically generated displaylist scene graph node
#   0x01: unused
#   0x02: s16 parameter
#   0x04: GraphNodeFunc function
.macro geo_asm param, function
    .byte 0x18, 0x00
    .hword \param
    .word \function
.endm

# 0x19: Create background scene graph node
#   0x02: s16 background: background ID, or RGBA5551 color if backgroundFunc is null
#   0x04: GraphNodeFunc backgroundFunc
.macro geo_background param, function=0
    .byte 0x19, 0x00
    .hword \param
    .word \function
.endm

# 0x1A: No operation
.macro geo_nop_1A
    .byte 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
.endm

# 0x1B: Copy the shared children from an object parent node from a specific view
# to a newly created object parent.
#   0x02: s16 index of array
.macro geo_copy_view param
    .byte 0x1B, 0x00
    .hword \param
.endm

# 0x1C: Create a held object scene graph node
#  cmd+0x01: u8 unused
#  cmd+0x02: s16 offsetX
#  cmd+0x04: s16 offsetY
#  cmd+0x06: s16 offsetZ
#  cmd+0x08: GraphNodeFunc nodeFunc
.macro geo_held_object param, ux, uy, uz, nodeFunc
    .byte 0x1C, \param
    .hword \ux, \uy, \uz
    .word \nodeFunc
.endm

# 0x1D: Create scale scene graph node with optional display list
#   0x01: u8 params
#     0b1000_0000: if set, enable displayList field and drawingLayer
#     0b0000_1111: drawingLayer
#   0x02-0x03: unused
#   0x04: u32 scale (0x10000 = 1.0)
#   0x08: [u32 displayList: if MSbit of params is set, display list segment address]
.macro geo_scale layer, scale, displayList=0
    .byte 0x1D
    .if (\displayList != 0)
        .byte 0x80 | \layer
    .else
        .byte 0x00
    .endif
    .byte 0x00, 0x00
    .word \scale
    .if (\displayList != 0)
        .word \displayList
    .endif
.endm

# 0x1E: No operation
.macro geo_nop_1E
    .byte 0x1E, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
.endm

# 0x1F: No operation
.macro geo_nop_1F
    .byte 0x1F, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
.endm

# 0x20: Create a scene graph node that specifies for an object the radius that
# is used for frustum culling.
#   0x01: unused
#   0x02: s16 cullingRadius
.macro geo_culling_radius cullingRadius
    .byte 0x20, 0x00
    .hword \cullingRadius
.endm
