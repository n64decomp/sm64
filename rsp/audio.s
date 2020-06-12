.rsp

.include "rsp/rsp_defs.inc"

// This file assumes DATA_FILE and CODE_FILE are set on the command line

.if version() < 110
    .error "armips 0.11 or newer is required"
.endif

.macro jumpTableEntry, addr
  .dh addr & 0xFFFF
.endmacro

// Audio flags
A_INIT     equ 0x01
A_CONTINUE equ 0x00
A_LOOP     equ 0x02
A_OUT      equ 0x02
A_LEFT     equ 0x02
A_RIGHT    equ 0x00
A_VOL      equ 0x04
A_RATE     equ 0x00
A_AUX      equ 0x08
A_NOAUX    equ 0x00
A_MAIN     equ 0x00
A_MIX      equ 0x10

.create DATA_FILE, 0x0000

.dh 0x0000, 0x0001, 0x0002, 0xffff, 0x0020, 0x0800, 0x7fff, 0x4000 // 0x00000000

// 0x10 - 0x1F: command dispatch table
dispatchTable:
  jumpTableEntry cmd_SPNOOP
  jumpTableEntry cmd_ADPCM
  jumpTableEntry cmd_CLEARBUFF
  jumpTableEntry cmd_ENVMIXER
  jumpTableEntry cmd_LOADBUFF
  jumpTableEntry cmd_RESAMPLE
  jumpTableEntry cmd_SAVEBUFF
  jumpTableEntry cmd_SEGMENT
  jumpTableEntry cmd_SETBUFF
  jumpTableEntry cmd_SETVOL
  jumpTableEntry cmd_DMEMMOVE
  jumpTableEntry cmd_LOADADPCM
  jumpTableEntry cmd_MIXER
  jumpTableEntry cmd_INTERLEAVE
  jumpTableEntry cmd_POLEF
  jumpTableEntry cmd_SETLOOP

.dh 0xf000, 0x0f00, 0x00f0, 0x000f, 0x0001, 0x0010, 0x0100, 0x1000 // 0x00000030
data0040:
.dh 0x0002, 0x0004, 0x0006, 0x0008, 0x000a, 0x000c, 0x000e, 0x0010 // 0x00000040
.dh 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001 // 0x00000050
.dh 0x0000, 0x0001, 0x0002, 0x0004, 0x0008, 0x0010, 0x0100, 0x0200 // 0x00000060
.dh 0x0001, 0x0000, 0x0000, 0x0000, 0x0001, 0x0000, 0x0000, 0x0000 // 0x00000070
.dh 0x0000, 0x0001, 0x0000, 0x0000, 0x0000, 0x0001, 0x0000, 0x0000 // 0x00000080
.dh 0x0000, 0x0000, 0x0001, 0x0000, 0x0000, 0x0000, 0x0001, 0x0000 // 0x00000090
.dh 0x0000, 0x0000, 0x0000, 0x0001, 0x0000, 0x0000, 0x0000, 0x0001 // 0x000000a0
.dh 0x2000, 0x4000, 0x6000, 0x8000, 0xa000, 0xc000, 0xe000, 0xffff // 0x000000b0
.dh 0x0c39, 0x66ad, 0x0d46, 0xffdf, 0x0b39, 0x6696, 0x0e5f, 0xffd8 // 0x000000c0
.dh 0x0a44, 0x6669, 0x0f83, 0xffd0, 0x095a, 0x6626, 0x10b4, 0xffc8 // 0x000000d0
.dh 0x087d, 0x65cd, 0x11f0, 0xffbf, 0x07ab, 0x655e, 0x1338, 0xffb6 // 0x000000e0
.dh 0x06e4, 0x64d9, 0x148c, 0xffac, 0x0628, 0x643f, 0x15eb, 0xffa1 // 0x000000f0
.dh 0x0577, 0x638f, 0x1756, 0xff96, 0x04d1, 0x62cb, 0x18cb, 0xff8a // 0x00000100
.dh 0x0435, 0x61f3, 0x1a4c, 0xff7e, 0x03a4, 0x6106, 0x1bd7, 0xff71 // 0x00000110
.dh 0x031c, 0x6007, 0x1d6c, 0xff64, 0x029f, 0x5ef5, 0x1f0b, 0xff56 // 0x00000120
.dh 0x022a, 0x5dd0, 0x20b3, 0xff48, 0x01be, 0x5c9a, 0x2264, 0xff3a // 0x00000130
.dh 0x015b, 0x5b53, 0x241e, 0xff2c, 0x0101, 0x59fc, 0x25e0, 0xff1e // 0x00000140
.dh 0x00ae, 0x5896, 0x27a9, 0xff10, 0x0063, 0x5720, 0x297a, 0xff02 // 0x00000150
.dh 0x001f, 0x559d, 0x2b50, 0xfef4, 0xffe2, 0x540d, 0x2d2c, 0xfee8 // 0x00000160
.dh 0xffac, 0x5270, 0x2f0d, 0xfedb, 0xff7c, 0x50c7, 0x30f3, 0xfed0 // 0x00000170
.dh 0xff53, 0x4f14, 0x32dc, 0xfec6, 0xff2e, 0x4d57, 0x34c8, 0xfebd // 0x00000180
.dh 0xff0f, 0x4b91, 0x36b6, 0xfeb6, 0xfef5, 0x49c2, 0x38a5, 0xfeb0 // 0x00000190
.dh 0xfedf, 0x47ed, 0x3a95, 0xfeac, 0xfece, 0x4611, 0x3c85, 0xfeab // 0x000001a0
.dh 0xfec0, 0x4430, 0x3e74, 0xfeac, 0xfeb6, 0x424a, 0x4060, 0xfeaf // 0x000001b0
.dh 0xfeaf, 0x4060, 0x424a, 0xfeb6, 0xfeac, 0x3e74, 0x4430, 0xfec0 // 0x000001c0
.dh 0xfeab, 0x3c85, 0x4611, 0xfece, 0xfeac, 0x3a95, 0x47ed, 0xfedf // 0x000001d0
.dh 0xfeb0, 0x38a5, 0x49c2, 0xfef5, 0xfeb6, 0x36b6, 0x4b91, 0xff0f // 0x000001e0
.dh 0xfebd, 0x34c8, 0x4d57, 0xff2e, 0xfec6, 0x32dc, 0x4f14, 0xff53 // 0x000001f0
.dh 0xfed0, 0x30f3, 0x50c7, 0xff7c, 0xfedb, 0x2f0d, 0x5270, 0xffac // 0x00000200
.dh 0xfee8, 0x2d2c, 0x540d, 0xffe2, 0xfef4, 0x2b50, 0x559d, 0x001f // 0x00000210
.dh 0xff02, 0x297a, 0x5720, 0x0063, 0xff10, 0x27a9, 0x5896, 0x00ae // 0x00000220
.dh 0xff1e, 0x25e0, 0x59fc, 0x0101, 0xff2c, 0x241e, 0x5b53, 0x015b // 0x00000230
.dh 0xff3a, 0x2264, 0x5c9a, 0x01be, 0xff48, 0x20b3, 0x5dd0, 0x022a // 0x00000240
.dh 0xff56, 0x1f0b, 0x5ef5, 0x029f, 0xff64, 0x1d6c, 0x6007, 0x031c // 0x00000250
.dh 0xff71, 0x1bd7, 0x6106, 0x03a4, 0xff7e, 0x1a4c, 0x61f3, 0x0435 // 0x00000260
.dh 0xff8a, 0x18cb, 0x62cb, 0x04d1, 0xff96, 0x1756, 0x638f, 0x0577 // 0x00000270
.dh 0xffa1, 0x15eb, 0x643f, 0x0628, 0xffac, 0x148c, 0x64d9, 0x06e4 // 0x00000280
.dh 0xffb6, 0x1338, 0x655e, 0x07ab, 0xffbf, 0x11f0, 0x65cd, 0x087d // 0x00000290
.dh 0xffc8, 0x10b4, 0x6626, 0x095a, 0xffd0, 0x0f83, 0x6669, 0x0a44 // 0x000002a0
.dh 0xffd8, 0x0e5f, 0x6696, 0x0b39, 0xffdf, 0x0d46, 0x66ad, 0x0c39 // 0x000002b0

.definelabel segmentTable, 0x320

.definelabel audioStruct, 0x360
audio_in_buf        equ 0x00 // 0x360
audio_out_buf       equ 0x02 // 0x362
audio_count         equ 0x04 // 0x364
audio_vol_left      equ 0x06 // 0x366
audio_vol_right     equ 0x08 // 0x366
audio_aux_buf0      equ 0x0a // 0x36a
audio_aux_buf1      equ 0x0c // 0x36c
audio_aux_buf2      equ 0x0e // 0x36e
audio_loop_value    equ 0x10 // 0x370 (shared)
audio_target_left   equ 0x10 // 0x370 (shared)
audio_rate_hi_left  equ 0x12 // 0x372 (shared)
audio_rate_lo_left  equ 0x14 // 0x374
audio_target_right  equ 0x16 // 0x376
audio_rate_hi_right equ 0x18 // 0x378
audio_rate_lo_right equ 0x1a // 0x37a
audio_dry_gain      equ 0x1c // 0x37c
audio_wet_gain      equ 0x1e // 0x37e

.definelabel nextTaskEntry, 0x380 // next task entries (0x140 bytes)
.definelabel adpcmTable,    0x4c0 // (16*8 16-bit entries)
.definelabel dmemBase,      0x5c0 // all samples stored that is transferred to DMEM
.definelabel tmpData,       0xF90 // temporary area

.close // DATA_FILE


.create CODE_FILE, 0x04001080

    addi  $24, $zero, audioStruct
    addi  $23, $zero, tmpData
    lw    $28, 0x30($1)        // task_data
    lw    $27, 0x34($1)        // task_data_size
    mfc0  $5, DPC_STATUS
    andi  $4, $5, DPC_STATUS_XBUS_DMA
    beqz  $4, @@audio_040010b4
     andi  $4, $5, DPC_STATUS_DMA_BUSY
    beqz  $4, @@audio_040010b4
     nop
@@dpc_dma_busy:
    mfc0  $4, DPC_STATUS
    andi  $4, $4, DPC_STATUS_DMA_BUSY
    bgtz  $4, @@dpc_dma_busy
@@audio_040010b4:
     nop
    jal   audio_04001150
     nop
    addi  $2, $zero, 0x000f
    addi  $1, $zero, segmentTable
@@audio_040010c8:
    sw    $zero, 0x00($1)
    bgtz  $2, @@audio_040010c8
     addi  $2, $2, -1

dma_busy:
    mfc0  $2, SP_DMA_BUSY
    bnez  $2, dma_busy
     addi  $29, $zero, nextTaskEntry
    mtc0  $zero, SP_SEMAPHORE  // release semaphore
audio_040010e4:
    lw    $26, 0x00($29)       // first word of command
    lw    $25, 0x04($29)       // second word of command
    srl   $1, $26, 23          // cmd byte << 1
    andi  $1, $1, 0x00fe
    addi  $28, $28, 8
    addi  $27, $27, -8
    addi  $29, $29, 8
    addi  $30, $30, -8
    add   $2, $zero, $1
    lh    $2, (dispatchTable)($2)
    jr    $2
     nop
    break

cmd_SPNOOP:
    bgtz  $30, audio_040010e4
     nop
    blez  $27, @@audio_04001138
     nop
    jal   audio_04001150
     nop
    j     dma_busy
     nop
@@audio_04001138:
    ori   $1, $zero, 0x4000
    mtc0  $1, SP_STATUS
    break
    nop
@@forever:
    b     @@forever
     nop

audio_04001150:
    addi  $5, $ra, 0x0000
    add   $2, $zero, $28
    addi  $3, $27, 0x0000
    addi  $4, $3, -0x0140
    blez  $4, @@audio_0400116c
     addi  $1, $zero, nextTaskEntry
    addi  $3, $zero, 0x0140
@@audio_0400116c:
    addi  $30, $3, 0x0000
    jal   dma_read_start
     addi  $3, $3, -1
    addi  $29, $zero, nextTaskEntry
    jr    $5
     nop

dma_read_start:
    mfc0  $4, SP_SEMAPHORE
    bnez  $4, dma_read_start
     nop
@@dma_not_full:
    mfc0  $4, SP_DMA_FULL
    bnez  $4, @@dma_not_full
     nop
    mtc0  $1, SP_MEM_ADDR
    mtc0  $2, SP_DRAM_ADDR
    mtc0  $3, SP_RD_LEN
    jr    $ra
     nop

dma_write_start:
    mfc0  $4, SP_SEMAPHORE
    bnez  $4, dma_write_start
     nop
@@dma_not_full:
    mfc0  $4, SP_DMA_FULL
    bnez  $4, @@dma_not_full
     nop
    mtc0  $1, SP_MEM_ADDR
    mtc0  $2, SP_DRAM_ADDR
    mtc0  $3, SP_WR_LEN
    jr    $ra
     nop

cmd_CLEARBUFF:
    andi  $3, $25, 0xffff
    beqz  $3, cmd_SPNOOP
     addi  $4, $zero, dmemBase
    andi  $2, $26, 0xffff
    add   $2, $2, $4
    vxor  $v1, $v1, $v1
    addi  $3, $3, -0x10
@@audio_040011f8:
    sdv   $v1[0], 0x0($2)
    sdv   $v1[0], 0x8($2)
    addi  $2, $2, 0x10
    bgtz  $3, @@audio_040011f8
     addi  $3, $3, -0x10
    j     cmd_SPNOOP
     nop

cmd_LOADBUFF:
    lhu   $3, (audio_count)($24)
    beqz  $3, cmd_SPNOOP
     sll   $2, $25, 8
    srl   $2, $2, 8
    srl   $4, $25, 24
    sll   $4, $4, 2
    lw    $5, (segmentTable)($4)
    add   $2, $2, $5
    lhu   $1, (audio_in_buf)($24)
    jal   dma_read_start
     addi  $3, $3, -1
@@dma_read_busy:
    mfc0  $1, SP_DMA_BUSY
    bnez  $1, @@dma_read_busy
     nop
    j     cmd_SPNOOP
     mtc0  $zero, SP_SEMAPHORE

cmd_SAVEBUFF:
    lhu   $3, (audio_count)($24)
    beqz  $3, cmd_SPNOOP
     sll   $2, $25, 8
    srl   $2, $2, 8
    srl   $4, $25, 24
    sll   $4, $4, 2
    lw    $5, (segmentTable)($4)
    add   $2, $2, $5
    lhu   $1, (audio_out_buf)($24)
    jal   dma_write_start
     addi  $3, $3, -1
@@dma_write_busy:
    mfc0  $1, SP_DMA_BUSY
    bnez  $1, @@dma_write_busy
     nop
    j     cmd_SPNOOP
     mtc0  $zero, SP_SEMAPHORE

cmd_LOADADPCM:
    sll   $2, $25, 8
    srl   $2, $2, 8
    srl   $4, $25, 24
    sll   $4, $4, 2
    lw    $5, (segmentTable)($4)
    add   $2, $2, $5
    addi  $1, $zero, adpcmTable
    andi  $3, $26, 0xffff
    jal   dma_read_start
     addi  $3, $3, -1
@@dma_read_busy:
    mfc0  $1, SP_DMA_BUSY
    bnez  $1, @@dma_read_busy
     nop
    j     cmd_SPNOOP
     mtc0  $zero, SP_SEMAPHORE

cmd_SEGMENT:
    sll   $3, $25, 8           // Least significant 24-bits offset
    srl   $3, $3, 8
    srl   $2, $25, 24          // Most significant 8-bits segment number
    sll   $2, $2, 2
    add   $4, $zero, $2
    j     cmd_SPNOOP
     sw    $3, (segmentTable)($4)

cmd_SETBUFF:
    addi  $1, $26, dmemBase
    srl   $2, $25, 16
    addi  $2, $2, dmemBase
    srl   $4, $26, 16
    andi  $4, $4, A_AUX
    bgtz  $4, @@audio_04001318
     addi  $3, $25, dmemBase
    sh    $1, (audio_in_buf)($24)
    sh    $2, (audio_out_buf)($24)
    j     cmd_SPNOOP
     sh    $25, (audio_count)($24)
@@audio_04001318:
    sh    $3, (audio_aux_buf2)($24)
    sh    $1, (audio_aux_buf0)($24)
    j     cmd_SPNOOP
     sh    $2, (audio_aux_buf1)($24)

cmd_SETVOL:
    srl   $2, $26, 16
    andi  $1, $2, A_AUX
    beqz  $1, @@audio_04001344
     andi  $1, $2, A_VOL
    sh    $26, (audio_dry_gain)($24)
    j     cmd_SPNOOP
     sh    $25, (audio_wet_gain)($24)
@@audio_04001344:
    beqz  $1, @@audio_04001364
     andi  $1, $2, A_LEFT
    beqz  $1, @@audio_0400135c
     nop
    j     cmd_SPNOOP
     sh    $26, (audio_vol_left)($24)
@@audio_0400135c:
    j     cmd_SPNOOP
     sh    $26, (audio_vol_right)($24)
@@audio_04001364:
    beqz  $1, @@audio_0400137c
     srl   $1, $25, 16
    sh    $26, (audio_target_left)($24)
    sh    $1, (audio_rate_hi_left)($24)
    j     cmd_SPNOOP
     sh    $25, (audio_rate_lo_left)($24)
@@audio_0400137c:
    sh    $26, (audio_target_right)($24)
    sh    $1, (audio_rate_hi_right)($24)
    j     cmd_SPNOOP
     sh    $25, (audio_rate_lo_right)($24)

cmd_INTERLEAVE:
    lhu   $1, (audio_count)($24)
    lhu   $4, (audio_out_buf)($24)
    beqz  $1, cmd_SPNOOP
     andi  $3, $25, 0xffff
    addi  $3, $3, dmemBase
    srl   $2, $25, 16
    addi  $2, $2, dmemBase
@@audio_040013a8:
    lqv   $v1[0], 0x00($2)
    lqv   $v2[0], 0x00($3)
    ssv   $v1[0], 0x00($4)
    ssv   $v2[0], 0x02($4)
    ssv   $v1[2], 0x04($4)
    ssv   $v2[2], 0x06($4)
    ssv   $v1[4], 0x08($4)
    ssv   $v2[4], 0x0a($4)
    ssv   $v1[6], 0x0c($4)
    ssv   $v2[6], 0x0e($4)
    ssv   $v1[8], 0x10($4)
    ssv   $v2[8], 0x12($4)
    ssv   $v1[10], 0x14($4)
    ssv   $v2[10], 0x16($4)
    ssv   $v1[12], 0x18($4)
    ssv   $v2[12], 0x1a($4)
    ssv   $v1[14], 0x1c($4)
    ssv   $v2[14], 0x1e($4)
    addi  $1, $1, -0x10
    addi  $2, $2, 0x10
    addi  $3, $3, 0x10
    bgtz  $1, @@audio_040013a8
     addi  $4, $4, 0x20
    j     cmd_SPNOOP
     nop

cmd_DMEMMOVE:
    andi  $1, $25, 0xffff
    beqz  $1, cmd_SPNOOP
     andi  $2, $26, 0xffff
    addi  $2, $2, dmemBase
    srl   $3, $25, 16
    addi  $3, $3, dmemBase
@@audio_04001424:
    ldv   $v1[0], 0x0($2)
    ldv   $v2[0], 0x8($2)
    addi  $1, $1, -0x10
    addi  $2, $2, 0x10
    sdv   $v1[0], 0x0($3)
    sdv   $v2[0], 0x8($3)
    bgtz  $1, @@audio_04001424
     addi  $3, $3, 0x10
    j     cmd_SPNOOP
     nop

cmd_SETLOOP:
    sll   $1, $25, 8
    srl   $1, $1, 8
    srl   $3, $25, 24
    sll   $3, $3, 2
    lw    $2, (segmentTable)($3)
    add   $1, $1, $2
    sw    $1, (audio_loop_value)($24)
    j     cmd_SPNOOP
     nop

cmd_ADPCM:
    lqv   $v31[0], 0x00($zero)
    vxor  $v27, $v27, $v27
    lhu   $21, (audio_in_buf)($24)
    vxor  $v25, $v25, $v25
    vxor  $v24, $v24, $v24
    addi  $20, $21, 1
    lhu   $19, (audio_out_buf)($24)
    vxor  $v13, $v13, $v13
    vxor  $v14, $v14, $v14
    lhu   $18, (audio_count)($24)
    vxor  $v15, $v15, $v15
    lui   $1, 0x00ff
    vxor  $v16, $v16, $v16
    ori   $1, $1, 0xffff
    vxor  $v17, $v17, $v17
    and   $17, $25, $1
    vxor  $v18, $v18, $v18
    srl   $2, $25, 24
    vxor  $v19, $v19, $v19
    sll   $2, $2, 2
    lw    $3, (segmentTable)($2)
    add   $17, $17, $3          // last frame addr
    sqv   $v27[0], 0x00($19)
    sqv   $v27[0], 0x10($19)
    srl   $1, $26, 16
    andi  $1, $1, A_INIT
    bgtz  $1, @@audio_0400150c
     srl   $1, $26, 16
    andi  $1, $1, A_LOOP
    beq   $zero, $1, @@audio_040014f0
     addi  $2, $17, 0x00
    lw    $2, (audio_loop_value)($24)
@@audio_040014f0:
    addi  $1, $19, 0x0000
    jal   dma_read_start
     addi  $3, $zero, 0x1f
@@dma_read_busy:
    mfc0  $5, SP_DMA_BUSY
    bnez  $5, @@dma_read_busy
     nop
    mtc0  $zero, SP_SEMAPHORE
@@audio_0400150c:
    addi  $16, $zero, 0x0030
    addi  $15, $zero, adpcmTable
    ldv   $v25[0], 0x00($16)
    ldv   $v24[8], 0x00($16)
    ldv   $v23[0], 0x08($16)
    ldv   $v23[8], 0x08($16)
    lqv   $v27[0], 0x10($19)    // last 8 frames
    addi  $19, $19, 0x20
    beqz  $18, @@audio_040016e8
     ldv   $v1[0], 0x00($20)
    lbu   $1, 0x00($21)
    andi  $11, $1, 0x000f
    sll   $11, $11, 5
    vand  $v3, $v25, $v1[0]
    add   $13, $11, $15
    vand  $v4, $v24, $v1[1]
    srl   $14, $1, 4
    vand  $v5, $v25, $v1[2]
    addi  $2, $zero, 12
    vand  $v6, $v24, $v1[3]
    sub   $14, $2, $14
    addi  $2, $14, -1
    addi  $3, $zero, 1
    sll   $3, $3, 15
    srlv  $4, $3, $2
    mtc2  $4, $v22[0]
    lqv   $v21[0], 0x00($13)
    lqv   $v20[0], 0x10($13)
    addi  $13, $13, -2
    lrv   $v19[0], 0x20($13)
    addi  $13, $13, -2
    lrv   $v18[0], 0x20($13)
    addi  $13, $13, -2
    lrv   $v17[0], 0x20($13)
    addi  $13, $13, -2
    lrv   $v16[0], 0x20($13)
    addi  $13, $13, -2
    lrv   $v15[0], 0x20($13)
    addi  $13, $13, -2
    lrv   $v14[0], 0x20($13)
    addi  $13, $13, -2
    lrv   $v13[0], 0x20($13)
@@audio_040015b4:
    addi  $20, $20, 9
    vmudn $v30, $v3, $v23
    addi  $21, $21, 9
    vmadn $v30, $v4, $v23
    ldv   $v1[0], 0x00($20)
    vmudn $v29, $v5, $v23
    lbu   $1, 0x00($21)
    vmadn $v29, $v6, $v23
    blez  $14, @@audio_040015e4
     andi  $11, $1, 0x000f
    vmudm $v30, $v30, $v22[0]
    vmudm $v29, $v29, $v22[0]
@@audio_040015e4:
    sll   $11, $11, 5
    vand  $v3, $v25, $v1[0]
    add   $13, $11, $15
    vand  $v4, $v24, $v1[1]
    vand  $v5, $v25, $v1[2]
    vand  $v6, $v24, $v1[3]
    srl   $14, $1, 4
    vmudh $v2, $v21, $v27[6]
    addi  $2, $zero, 12
    vmadh $v2, $v20, $v27[7]
    sub   $14, $2, $14
    vmadh $v2, $v19, $v30[0]
    addi  $2, $14, -1
    vmadh $v2, $v18, $v30[1]
    addi  $3, $zero, 1
    vmadh $v2, $v17, $v30[2]
    sll   $3, $3, 15
    vmadh $v2, $v16, $v30[3]
    srlv  $4, $3, $2
    vmadh $v28, $v15, $v30[4]
    mtc2  $4, $v22[0]
    vmadh $v2, $v14, $v30[5]
    vmadh $v2, $v13, $v30[6]
    vmadh $v2, $v30, $v31[5]
    vsar  $v26, $v7, $v28[1]
    vsar  $v28, $v7, $v28[0]
    vmudn $v2, $v26, $v31[4]
    vmadh $v28, $v28, $v31[4]
    vmudh $v2, $v19, $v29[0]
    addi  $12, $13, -2
    vmadh $v2, $v18, $v29[1]
    lrv   $v19[0], 0x20($12)
    vmadh $v2, $v17, $v29[2]
    addi  $12, $12, -2
    vmadh $v2, $v16, $v29[3]
    lrv   $v18[0], 0x20($12)
    vmadh $v2, $v15, $v29[4]
    addi  $12, $12, -2
    vmadh $v2, $v14, $v29[5]
    lrv   $v17[0], 0x20($12)
    vmadh $v2, $v13, $v29[6]
    addi  $12, $12, -2
    vmadh $v2, $v29, $v31[5]
    lrv   $v16[0], 0x20($12)
    vmadh $v2, $v21, $v28[6]
    addi  $12, $12, -2
    vmadh $v2, $v20, $v28[7]
    lrv   $v15[0], 0x20($12)
    vsar  $v26, $v7, $v27[1]
    addi  $12, $12, -2
    vsar  $v27, $v7, $v27[0]
    lrv   $v14[0], 0x20($12)
    addi  $12, $12, -2
    lrv   $v13[0], 0x20($12)
    lqv   $v21[0], 0x00($13)
    vmudn $v2, $v26, $v31[4]
    lqv   $v20[0], 0x10($13)
    vmadh $v27, $v27, $v31[4]
    addi  $18, $18, -0x20
    sdv   $v28[0], 0x00($19)
    sdv   $v28[8], 0x08($19)
    sdv   $v27[0], 0x10($19)
    sdv   $v27[8], 0x18($19)
    bgtz  $18, @@audio_040015b4
     addi  $19, $19, 0x20
@@audio_040016e8:
    addi  $1, $19, -0x20
    addi  $2, $17, 0x00
    jal   dma_write_start
     addi  $3, $zero, 0x1f
@@dma_write_busy:
    mfc0  $5, SP_DMA_BUSY
    bnez  $5, @@dma_write_busy
     nop
    j     cmd_SPNOOP
     mtc0  $zero, SP_SEMAPHORE

cmd_POLEF: // unused by SM64
    lqv   $v31[0], 0x0000($zero)
    vxor  $v28, $v28, $v28
    lhu   $21, (audio_in_buf)($24)
    vxor  $v17, $v17, $v17
    lhu   $20, (audio_out_buf)($24)
    vxor  $v18, $v18, $v18
    lhu   $19, (audio_count)($24)
    vxor  $v19, $v19, $v19
    beqz  $19, @@audio_04001874
     andi  $14, $26, 0xffff
    mtc2  $14, $v31[10]
    sll   $14, $14, 2
    mtc2  $14, $v16[0]
    lui   $1, 0x00ff
    vxor  $v20, $v20, $v20
    ori   $1, $1, 0xffff
    vxor  $v21, $v21, $v21
    and   $18, $25, $1
    vxor  $v22, $v22, $v22
    srl   $2, $25, 24
    vxor  $v23, $v23, $v23
    sll   $2, $2, 2
    lw    $3, (segmentTable)($2)
    add   $18, $18, $3
    slv   $v28[0], 0x00($23)
    srl   $1, $26, 16
    andi  $1, $1, 0x0001
    bgtz  $1, @@audio_040017a0
     nop
    addi  $1, $23, 0x0000
    addi  $2, $18, 0x0000
    jal   dma_read_start
     addi  $3, $zero, 7
@@dma_read_busy:
    mfc0  $5, SP_DMA_BUSY
    bnez  $5, @@dma_read_busy
     nop
    mtc0  $zero, SP_SEMAPHORE
@@audio_040017a0:
    addi  $13, $zero, adpcmTable
    addi  $1, $zero, 0x0004
    mtc2  $1, $v14[0]
    lqv   $v24[0], 0x0010($13)
    vmudm $v16, $v24, $v16[0]
    ldv   $v28[8], 0x00($23)
    sqv   $v16[0], 0x10($13)
    lqv   $v25[0], 0x00($13)
    addi  $13, $13, -2
    lrv   $v23[0], 0x20($13)
    addi  $13, $13, -2
    lrv   $v22[0], 0x20($13)
    addi  $13, $13, -2
    lrv   $v21[0], 0x20($13)
    addi  $13, $13, -2
    lrv   $v20[0], 0x20($13)
    addi  $13, $13, -2
    lrv   $v19[0], 0x20($13)
    addi  $13, $13, -2
    lrv   $v18[0], 0x20($13)
    addi  $13, $13, -2
    lrv   $v17[0], 0x20($13)
    ldv   $v30[0], 0x00($21)
    ldv   $v30[8], 0x08($21)
@@audio_04001800:
    vmudh $v16, $v25, $v28[6]
    addi  $21, $21, 0x10
    vmadh $v16, $v24, $v28[7]
    addi  $19, $19, -0x10
    vmadh $v16, $v23, $v30[0]
    vmadh $v16, $v22, $v30[1]
    vmadh $v16, $v21, $v30[2]
    vmadh $v16, $v20, $v30[3]
    vmadh $v28, $v19, $v30[4]
    vmadh $v16, $v18, $v30[5]
    vmadh $v16, $v17, $v30[6]
    vmadh $v16, $v30, $v31[5]
    ldv   $v30[0], 0x00($21)
    vsar  $v26, $v15, $v28[1]
    ldv   $v30[8], 0x08($21)
    vsar  $v28, $v15, $v28[0]
    vmudn $v16, $v26, $v14[0]
    vmadh $v28, $v28, $v14[0]
    sdv   $v28[0], 0x00($20)
    sdv   $v28[8], 0x08($20)
    bgtz  $19, @@audio_04001800
     addi  $20, $20, 0x10
    addi  $1, $20, -8
    addi  $2, $18, 0x00
    jal   dma_write_start
     addi  $3, $zero, 7
@@dma_write_busy:
    mfc0  $5, SP_DMA_BUSY
    bnez  $5, @@dma_write_busy
     nop
@@audio_04001874:
    j     cmd_SPNOOP
     mtc0  $zero, SP_SEMAPHORE

cmd_RESAMPLE:
    lh    $8, (audio_in_buf)($24)
    lh    $19, (audio_out_buf)($24)
    lh    $18, (audio_count)($24)
    lui   $4, 0x00ff
    ori   $4, $4, 0xffff
    and   $2, $25, $4
    srl   $5, $25, 24
    sll   $5, $5, 2
    lw    $6, (segmentTable)($5)
    add   $2, $2, $6          // physical address of state_addr
    addi  $1, $23, 0x0000
    sw    $2, 0x40($23)       // overwrite TASK_UCODE ptr
    addi  $3, $zero, 0x1f
    srl   $7, $26, 16
    andi  $10, $7, A_INIT
    bgtz  $10, @@audio_040018dc
     nop
    jal   dma_read_start
     nop
@@dma_read_busy:
    mfc0  $1, SP_DMA_BUSY
    bnez  $1, @@dma_read_busy
     nop
    j     @@audio_040018e8
     mtc0  $zero, SP_SEMAPHORE
@@audio_040018dc:
    sh    $zero, 0x08($23)
    vxor  $v16, $v16, $v16
    sdv   $v16[0], 0x00($23)
@@audio_040018e8:
    andi  $10, $7, 0x02      // A_LOOP? A_OUT?
    beqz  $10, @@audio_04001908
     nop
    lh    $11, 0x0a($23)
    lqv   $v3[0], 0x10($23)
    sdv   $v3[0], -0x10($8)
    sdv   $v3[8], -0x08($8)
    sub   $8, $8, $11
@@audio_04001908:
    addi  $8, $8, -8
    lsv   $v23[14], 0x08($23)   // saved pitch_accumulator
    ldv   $v16[0], 0x00($23)    // saved next 4 unprocessed samples
    sdv   $v16[0], 0x00($8)     // store them before the input samples
    mtc2  $8, $v18[4]
    addi  $10, $zero, 0xc0
    mtc2  $10, $v18[6]
    mtc2  $26, $v18[8]          // pitch
    addi  $10, $zero, 0x40
    mtc2  $10, $v18[10]
    addi  $9, $zero, data0040
    lqv   $v31[0], 0x10($9)     // 0x50
    lqv   $v25[0], 0x00($9)     // 0x40
    vsub  $v25, $v25, $v31
    lqv   $v30[0], 0x20($9)     // 0x60
    lqv   $v29[0], 0x30($9)     // 0x70
    lqv   $v28[0], 0x40($9)     // 0x80
    lqv   $v27[0], 0x50($9)     // 0x90
    lqv   $v26[0], 0x60($9)     // 0xA0
    vsub  $v25, $v25, $v31
    lqv   $v24[0], 0x70($9)     // 0xB0
    addi  $21, $23, 0x20
    addi  $20, $23, 0x30
    vxor  $v22, $v22, $v22
    vmudm $v23, $v31, $v23[7]   // load pitch_accumulator into every vector element
    vmadm $v22, $v25, $v18[4]   // (accumulate with pitch times index) >> 16
    vmadn $v23, $v31, $v30[0]   // result & 0xffff
    vmudn $v21, $v31, $v18[2]   // load the in address into every vector element
    vmadn $v21, $v22, $v30[2]   // accumulate with 2 * $v22
    vmudl $v17, $v23, $v18[5]   // 64 * $v23 >> 16
    vmudn $v17, $v17, $v30[4]   // * 8
    vmadn $v17, $v31, $v18[3]   // += 0x00c0 (resample lookup table address)
    lqv   $v25[0], 0x00($9)
    sqv   $v21[0], 0x00($21)
    sqv   $v17[0], 0x00($20)
    ssv   $v23[7], 0x08($23)
    lh    $17, 0x00($21)
    lh    $9, 0x00($20)
    lh    $13, 0x08($21)
    lh    $5, 0x08($20)
    lh    $16, 0x02($21)
    lh    $8, 0x02($20)
    lh    $12, 0x0a($21)
    lh    $4, 0x0a($20)
    lh    $15, 0x04($21)
    lh    $7, 0x04($20)
    lh    $11, 0x0c($21)
    lh    $3, 0x0c($20)
    lh    $14, 0x06($21)
    lh    $6, 0x06($20)
    lh    $10, 0x0e($21)
    lh    $2, 0x0e($20)
@@audio_040019d8:
    ldv   $v16[0], 0x00($17)
    vmudm $v23, $v31, $v23[7]
    ldv   $v15[0], 0x00($9)
    vmadh $v23, $v31, $v22[7]
    ldv   $v16[8], 0x00($13)
    vmadm $v22, $v25, $v18[4]
    ldv   $v15[8], 0x00($5)
    vmadn $v23, $v31, $v30[0]
    ldv   $v14[0], 0x00($16)
    vmudn $v21, $v31, $v18[2]
    ldv   $v13[0], 0x00($8)
    vmadn $v21, $v22, $v30[2]
    ldv   $v14[8], 0x00($12)
    vmudl $v17, $v23, $v18[5]
    ldv   $v13[8], 0x00($4)
    ldv   $v12[0], 0x00($15)
    ldv   $v11[0], 0x00($7)
    ldv   $v12[8], 0x00($11)
    vmudn $v17, $v17, $v30[4]
    ldv   $v11[8], 0x00($3)
    ldv   $v10[0], 0x00($14)
    ldv   $v9[0], 0x00($6)
    vmadn $v17, $v31, $v18[3]
    ldv   $v10[8], 0x00($10)
    vmulf $v8, $v16, $v15
    ldv   $v9[8], 0x00($2)
    vmulf $v7, $v14, $v13
    sqv   $v21[0], 0x00($21)
    vmulf $v6, $v12, $v11
    sqv   $v17[0], 0x00($20)
    lh    $17, 0x00($21)
    vmulf $v5, $v10, $v9
    lh    $9, 0x00($20)
    vadd  $v8, $v8, $v8[1q]
    lh    $13, 0x08($21)
    vadd  $v7, $v7, $v7[1q]
    lh    $5, 0x08($20)
    vadd  $v6, $v6, $v6[1q]
    lh    $16, 0x02($21)
    vadd  $v5, $v5, $v5[1q]
    lh    $8, 0x02($20)
    vadd  $v8, $v8, $v8[2h]
    lh    $12, 0x0a($21)
    vadd  $v7, $v7, $v7[2h]
    lh    $4, 0x0a($20)
    vadd  $v6, $v6, $v6[2h]
    lh    $15, 0x04($21)
    vadd  $v5, $v5, $v5[2h]
    lh    $7, 0x04($20)
    vmudn $v4, $v29, $v8[0h]
    lh    $11, 0x0c($21)
    vmadn $v4, $v28, $v7[0h]
    lh    $3, 0x0c($20)
    vmadn $v4, $v27, $v6[0h]
    lh    $14, 0x06($21)
    vmadn $v4, $v26, $v5[0h]
    lh    $6, 0x06($20)
    lh    $10, 0x0e($21)
    addi  $18, $18, -0x10
    sqv   $v4[0], 0x00($19)
    blez  $18, @@audio_04001ad8
     lh    $2, 0x0e($20)
    j     @@audio_040019d8
     addi  $19, $19, 0x0010
@@audio_04001ad8:
    ssv   $v23[0], 0x08($23)
    ldv   $v16[0], 0x00($17)
    sdv   $v16[0], 0x00($23)
    lh    $6, (audio_in_buf)($24)
    addi  $17, $17, 8
    sub   $5, $17, $6
    andi  $4, $5, 0x000f
    sub   $17, $17, $4
    beqz  $4, @@audio_04001b04
     addi  $7, $zero, 0x10
    sub   $4, $7, $4
@@audio_04001b04:
    sh    $4, 0x0a($23)
    ldv   $v3[0], 0x00($17)
    ldv   $v3[8], 0x08($17)
    sqv   $v3[0], 0x10($23)
    lw    $2, 0x40($23)
    addi  $1, $23, 0x00
    jal   dma_write_start
     addi  $3, $zero, 0x1f
@@dma_write_busy:
    mfc0  $5, SP_DMA_BUSY
    bnez  $5, @@dma_write_busy
     nop
    j     cmd_SPNOOP
     mtc0  $zero, SP_SEMAPHORE

cmd_ENVMIXER:
    lui   $4, 0x00ff
    ori   $4, $4, 0xffff
    and   $2, $25, $4
    srl   $5, $25, 24
    sll   $5, $5, 2
    lw    $6, (segmentTable)($5)
    add   $2, $2, $6
    addi  $1, $23, 0x00
    addi  $3, $zero, 0x4f
    vxor  $v0, $v0, $v0
    addi  $11, $zero, 0x40
    lqv   $v31[0], 0x10($11)    // all 0001
    lqv   $v10[0], 0x00($zero)  // element 6 is 0x7fff
    srl   $12, $26, 16
    andi  $10, $12, A_INIT
    beqz  $10, @@audio_04001b84
     lqv   $v24[0], 0x10($24)
    j     @@audio_04001bb0
     nop
@@audio_04001b84:
    jal   dma_read_start
     nop
@@dma_read_busy:
    mfc0  $5, SP_DMA_BUSY
    bnez  $5, @@dma_read_busy
     nop
    mtc0  $zero, SP_SEMAPHORE
    lqv   $v20[0], 0x00($23)
    lqv   $v21[0], 0x10($23)
    lqv   $v18[0], 0x20($23)
    lqv   $v19[0], 0x30($23)
    lqv   $v24[0], 0x40($23)
@@audio_04001bb0:
    lh    $13, (audio_in_buf)($24)
    lh    $19, (audio_out_buf)($24)
    lh    $18, (audio_aux_buf0)($24)
    lh    $17, (audio_aux_buf1)($24)
    lh    $16, (audio_aux_buf2)($24)
    lh    $14, (audio_count)($24)
    addi  $15, $zero, 0x10
    mfc2  $21, $v24[2]
    mfc2  $20, $v24[8]
    andi  $9, $12, 0x0008
    bgtz  $9, @@audio_04001bec
     nop
    addi  $17, $23, 0x50
    add   $16, $zero, $17
    addi  $15, $zero, 0
@@audio_04001bec:
    beqz  $10, @@audio_04001cf0
     lqv   $v30[0], 0x70($11)
    lqv   $v17[0], 0x00($13)
    lqv   $v29[0], 0x00($19)
    lqv   $v27[0], 0x00($17)
    vxor  $v21, $v21, $v21
    lsv   $v20[14], 0x06($24)
    vmudm $v23, $v20, $v24[2]
    vmadh $v22, $v20, $v24[1]
    vmadn $v23, $v31, $v0[0]
    vsubc $v23, $v23, $v21
    vsub  $v22, $v22, $v20
    vmudl $v23, $v30, $v23[7]
    vmadn $v23, $v30, $v22[7]
    vmadm $v22, $v31, $v0[0]
    vmadm $v21, $v31, $v21[7]
    vmadh $v20, $v31, $v20[7]
    bgtz  $21, @@audio_04001c44
     vmadn $v21, $v31, $v0[0]
    vge   $v20, $v20, $v24[0]
    j     @@audio_04001c48
     nop
@@audio_04001c44:
    vcl   $v20, $v20, $v24[0]
@@audio_04001c48:
    vmulf $v16, $v20, $v24[6]
    vmulf $v15, $v20, $v24[7]
    vmulf $v29, $v29, $v10[6]
    vmacf $v29, $v17, $v16
    vmulf $v27, $v27, $v10[6]
    vmacf $v27, $v17, $v15
    sqv   $v29[0], 0x00($19)
    sqv   $v27[0], 0x00($17)
    lqv   $v28[0], 0x00($18)
    lqv   $v26[0], 0x00($16)
    vxor  $v19, $v19, $v19
    lsv   $v18[14], 0x08($24)
    vmudm $v23, $v18, $v24[5]
    vmadh $v22, $v18, $v24[4]
    vmadn $v23, $v31, $v0[0]
    vsubc $v23, $v23, $v19
    vsub  $v22, $v22, $v18
    vmudl $v23, $v30, $v23[7]
    vmadn $v23, $v30, $v22[7]
    vmadm $v22, $v31, $v0[0]
    vmadm $v19, $v31, $v19[7]
    vmadh $v18, $v31, $v18[7]
    bgtz  $20, @@audio_04001cb4
     vmadn $v19, $v31, $v0[0]
    vge   $v18, $v18, $v24[3]
    j     @@audio_04001cb8
     nop
@@audio_04001cb4:
    vcl   $v18, $v18, $v24[3]
@@audio_04001cb8:
    vmulf $v16, $v18, $v24[6]
    vmulf $v15, $v18, $v24[7]
    vmulf $v28, $v28, $v10[6]
    vmacf $v28, $v17, $v16
    vmulf $v26, $v26, $v10[6]
    vmacf $v26, $v17, $v15
    sqv   $v28[0], 0x00($18)
    sqv   $v26[0], 0x00($16)
    addi  $14, $14, -0x10
    addi  $13, $13, 0x10
    addi  $19, $19, 0x10
    addi  $18, $18, 0x10
    add   $17, $17, $15
    add   $16, $16, $15
@@audio_04001cf0:
    vmudl $v23, $v21, $v24[2]
    vmadm $v23, $v20, $v24[2]
    vmadn $v23, $v21, $v24[1]
    vmadh $v20, $v20, $v24[1]
    vmadn $v21, $v31, $v0[0]
@@audio_04001d04:
    bgtz  $21, @@audio_04001d30
     lqv   $v17[0], 0x00($13)
    vge   $v20, $v20, $v24[0]
    vmudl $v23, $v19, $v24[5]
    vmadm $v23, $v18, $v24[5]
    vmadn $v23, $v19, $v24[4]
    lqv   $v29[0], 0x00($19)
    vmadh $v18, $v18, $v24[4]
    lqv   $v27[0], 0x00($17)
    j     @@audio_04001d50
     vmadn $v19, $v31, $v0[0]
@@audio_04001d30:
    vcl   $v20, $v20, $v24[0]
    vmudl $v23, $v19, $v24[5]
    vmadm $v23, $v18, $v24[5]
    vmadn $v23, $v19, $v24[4]
    lqv   $v29[0], 0x00($19)
    vmadh $v18, $v18, $v24[4]
    lqv   $v27[0], 0x00($17)
    vmadn $v19, $v31, $v0[0]
@@audio_04001d50:
    vmulf $v16, $v20, $v24[6]
    sqv   $v20[0], 0x00($23)
    vmulf $v15, $v20, $v24[7]
    sqv   $v21[0], 0x10($23)
    vmulf $v29, $v29, $v10[6]
    vmacf $v29, $v17, $v16
    lqv   $v28[0], 0x00($18)
    vmulf $v27, $v27, $v10[6]
    lqv   $v26[0], 0x00($16)
    vmacf $v27, $v17, $v15
    bgtz  $20, @@audio_04001da0
     sqv   $v29[0], 0x00($19)
    vge   $v18, $v18, $v24[3]
    vmudl $v23, $v21, $v24[2]
    sqv   $v27[0], 0x00($17)
    vmadm $v23, $v20, $v24[2]
    vmadn $v23, $v21, $v24[1]
    vmadh $v20, $v20, $v24[1]
    j     @@audio_04001dbc
     vmadn $v21, $v31, $v0[0]
@@audio_04001da0:
    vcl   $v18, $v18, $v24[3]
    vmudl $v23, $v21, $v24[2]
    sqv   $v27[0], 0x00($17)
    vmadm $v23, $v20, $v24[2]
    vmadn $v23, $v21, $v24[1]
    vmadh $v20, $v20, $v24[1]
    vmadn $v21, $v31, $v0[0]
@@audio_04001dbc:
    vmulf $v16, $v18, $v24[6]
    addi  $14, $14, -0x10
    vmulf $v15, $v18, $v24[7]
    addi  $19, $19, 0x10
    vmulf $v28, $v28, $v10[6]
    add   $17, $17, $15
    vmacf $v28, $v17, $v16
    addi  $13, $13, 0x10
    vmulf $v26, $v26, $v10[6]
    vmacf $v26, $v17, $v15
    sqv   $v28[0], 0x00($18)
    addi  $18, $18, 0x10
    blez  $14, @@audio_04001dfc
     sqv   $v26[0], 0x00($16)
    j     @@audio_04001d04
     add   $16, $16, $15
@@audio_04001dfc:
    sqv   $v18[0], 0x20($23)
    sqv   $v19[0], 0x30($23)
    sqv   $v24[0], 0x40($23)
    jal   dma_write_start
     addi  $3, $zero, 0x004f
@@dma_write_busy:
    mfc0  $5, SP_DMA_BUSY
    bnez  $5, @@dma_write_busy
     nop
    j     cmd_SPNOOP
     mtc0  $zero, SP_SEMAPHORE

cmd_MIXER:
    lqv   $v31[0], 0x00($zero)   // element 6 is 0x7fff
    lhu   $18, (audio_count)($24)
    beqz  $18, @@cmd_mixer_done  // skip operation when count is 0
     nop
    andi  $19, $25, 0xffff
    addi  $19, $19, dmemBase     // dmemout + DMEM_BASE
    srl   $20, $25, 16
    addi  $20, $20, dmemBase     // dmemin + DMEM_BASE
    andi  $17, $26, 0xffff
    mtc2  $17, $v30[0]
    lqv   $v27[0], 0x00($19)
    lqv   $v29[0], 0x00($20)
    lqv   $v26[0], 0x10($19)
    lqv   $v28[0], 0x10($20)
@@audio_04001e5c:
    vmulf $v27, $v27, $v31[6]
    addi  $18, $18, -0x20
    vmacf $v27, $v29, $v30[0]
    addi  $20, $20, 0x20
    sqv   $v27[0], 0x00($19)
    vmulf $v26, $v26, $v31[6]
    lqv   $v29[0], 0x00($20)
    vmacf $v26, $v28, $v30[0]
    lqv   $v28[0], 0x10($20)
    sqv   $v26[0], 0x10($19)
    addi  $19, $19, 0x20
    lqv   $v27[0], 0x00($19)
    bgtz  $18, @@audio_04001e5c
     lqv   $v26[0], 0x10($19)
@@cmd_mixer_done:
    j     cmd_SPNOOP
     nop
    nop

.close // CODE_FILE
