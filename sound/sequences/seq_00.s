.include "seq_macros.inc"
.section .rodata
.align 0
sequence_start:

seq_setmutebhv 0x60
seq_setmutescale 0
seq_setvol 127
seq_settempo 120
seq_initchannels 0x3ff
seq_startchannel 0, .channel0
seq_startchannel 1, .channel1
seq_startchannel 2, .channel2
seq_startchannel 3, .channel38
seq_startchannel 4, .channel4
seq_startchannel 5, .channel59
seq_startchannel 6, .channel6
seq_startchannel 7, .channel7
seq_startchannel 8, .channel38
seq_startchannel 9, .channel59
.seq_loop:
seq_delay 20000
seq_jump .seq_loop

.channel0:
chan_largenoteson
chan_setinstr 0
chan_setpanmix 127
chan_setnotepriority 14
chan_setval 0
chan_iowriteval 5
chan_stereoheadseteffects 1
chan_setdyntable .channel0_table
chan_jump .main_loop_023589

.channel2:
chan_largenoteson
chan_setinstr 0
chan_setpanmix 127
chan_setnotepriority 14
chan_setval 0
chan_iowriteval 5
chan_stereoheadseteffects 1
chan_setdyntable .channel2_table
chan_jump .main_loop_023589

.channel38:
chan_largenoteson
chan_setinstr 0
chan_setpanmix 127
chan_setnotepriority 14
chan_setval 0
chan_iowriteval 5
chan_stereoheadseteffects 1
chan_setdyntable .channel38_table
chan_jump .main_loop_023589

.channel59:
chan_largenoteson
chan_setinstr 0
chan_setpanmix 127
chan_setnotepriority 14
chan_setval 0
chan_iowriteval 5
chan_stereoheadseteffects 1
chan_setdyntable .channel59_table
chan_jump .main_loop_023589

.main_loop_023589:
chan_delay1
chan_ioreadval 0
chan_bltz .main_loop_023589
.start_playing_023589:
chan_freelayer 0
chan_freelayer 1
chan_freelayer 2
chan_setval 0
chan_iowriteval 5
chan_ioreadval 4
chan_dyncall

# keep looping until layer 0 finishes or we are told to stop or to play something else
.poll_023589:
chan_delay1
chan_ioreadval 0
chan_bltz .skip_023589 # if we have a signal:
  chan_beqz .force_stop_023589 # told to stop
  chan_jump .start_playing_023589 # told to play something else
.skip_023589:
chan_testlayerfinished 0
chan_beqz .poll_023589 # if layer 0 hasn't finished, keep polling
chan_jump .main_loop_023589 # otherwise go back to the main loop
.force_stop_023589:
chan_freelayer 0
chan_freelayer 1
chan_freelayer 2
chan_jump .main_loop_023589

.channel1:
chan_largenoteson
chan_setinstr 0
chan_setpanmix 127
chan_setnotepriority 14
chan_setval 0
chan_iowriteval 5
chan_setmutebhv 0x20
chan_stereoheadseteffects 1
chan_setdyntable .channel1_table
chan_jump .main_loop_146

.channel4:
chan_largenoteson
chan_setinstr 0
chan_setpanmix 127
chan_setnotepriority 14
chan_setval 0
chan_iowriteval 5
chan_setmutebhv 0x20
chan_stereoheadseteffects 1
chan_setdyntable .channel4_table
chan_jump .main_loop_146

.channel6:
chan_largenoteson
chan_setinstr 0
chan_setpanmix 127
chan_setnotepriority 14
chan_setval 0
chan_iowriteval 5
chan_setmutebhv 0x20
chan_stereoheadseteffects 1
chan_setdyntable .channel6_table
chan_jump .main_loop_146

.main_loop_146:
chan_delay1
chan_ioreadval 0
chan_bltz .main_loop_146
.start_playing_146:
chan_freelayer 0
chan_freelayer 1
chan_freelayer 2
chan_setvolscale 127
chan_setval 0
chan_iowriteval 5
chan_ioreadval 4
chan_dyncall

# keep looping until we are told to stop or to play something else
.poll_146:
chan_delay1
chan_ioreadval 0
chan_bltz .poll_146
chan_beqz .force_stop_146
chan_jump .start_playing_146
.force_stop_146:
chan_freelayer 0
chan_freelayer 1
chan_freelayer 2
chan_jump .main_loop_146

.channel7:
chan_largenoteson
chan_setinstr 0
chan_setnotepriority 14
chan_setval 0
chan_iowriteval 5
chan_stereoheadseteffects 1
chan_setdyntable .channel7_table

.main_loop_7:
chan_delay1
chan_ioreadval 0
chan_bltz .main_loop_7
.start_playing_7:
chan_freelayer 0
chan_freelayer 1
chan_freelayer 2
chan_setval 0
chan_iowriteval 5
chan_setreverb 0
chan_setpan 64
chan_setpanmix 127
chan_ioreadval 4
chan_dyncall

# keep looping until layer 0 finishes or we are told to stop or to play something else
.poll_7:
chan_delay1
chan_ioreadval 0
chan_bltz .skip_7 # if we have a signal:
  chan_beqz .force_stop_7 # told to stop
  chan_unreservenotes
  chan_jump .start_playing_7 # told to play something else
.skip_7:
chan_testlayerfinished 0
chan_beqz .poll_7 # if layer 0 hasn't finished, keep polling
chan_unreservenotes
chan_jump .main_loop_7 # otherwise go back to the main loop
.force_stop_7:
chan_freelayer 0
chan_freelayer 1
chan_freelayer 2
chan_unreservenotes
chan_jump .main_loop_7

# Delay for a number of ticks (1-255) in an interruptible manner.
.delay:
chan_writeseq_nextinstr 0, 1
chan_loop 20
chan_delay1
chan_ioreadval 0
chan_iowriteval 1
chan_bgez .delay_interrupt
chan_loopend
chan_end

.delay_interrupt:
chan_setpanmix 127
chan_setvolscale 127
chan_setvibratoextent 0
chan_ioreadval 1 # IO slots 0-3 are reset to -1 when read; restore the value
chan_iowriteval 0
chan_break # break out of the loop
chan_break # force the caller to return immediately
chan_end

# Set reverb in way that takes area echo level and volume into account. This
# is done by writing to IO slot 5 and letting get_sound_reverb in external.c
# do the necessary math.
.set_reverb:
chan_writeseq_nextinstr 0, 1
chan_setreverb 10
chan_iowriteval 5
chan_end

.channel0_table:
sound_ref .chan_22C
sound_ref .chan_23B
sound_ref .chan_24A
sound_ref .chan_259
sound_ref .chan_268
sound_ref .chan_277
sound_ref .chan_286
sound_ref .chan_295
sound_ref .chan_2A6
sound_ref .chan_2B5
sound_ref .chan_2C4
sound_ref .chan_2D3
sound_ref .chan_2E2
sound_ref .chan_2F1
sound_ref .chan_300
sound_ref .chan_30F
sound_ref .chan_320
sound_ref .chan_32C
sound_ref .chan_338
sound_ref .chan_344
sound_ref .chan_350
sound_ref .chan_35C
sound_ref .chan_368
sound_ref .chan_374
sound_ref .chan_380
sound_ref .chan_38F
sound_ref .chan_39E
sound_ref .chan_3AD
sound_ref .chan_3BC
sound_ref .chan_3CB
sound_ref .chan_3DA
sound_ref .chan_3E9
sound_ref .chan_3FA
sound_ref .chan_406
sound_ref .chan_412
sound_ref .chan_41E
sound_ref .chan_42A
sound_ref .chan_436
sound_ref .chan_442
sound_ref .chan_44E
sound_ref .chan_45A
sound_ref .chan_469
sound_ref .chan_478
sound_ref .chan_488
sound_ref .chan_497
sound_ref .chan_4A9
sound_ref .chan_4C5
sound_ref .chan_4D5
sound_ref .chan_4E5
sound_ref .chan_4F1
sound_ref .chan_4FD
sound_ref .chan_512
sound_ref .chan_522
sound_ref .chan_52E
sound_ref .chan_540
sound_ref .chan_54C
sound_ref .chan_54C
sound_ref .chan_54C
sound_ref .chan_55E
sound_ref .chan_571
sound_ref .chan_582
sound_ref .chan_591
sound_ref .chan_5A3
sound_ref .chan_5B5
sound_ref .chan_5C1
sound_ref .chan_5D3
sound_ref .chan_5E9
sound_ref .chan_5F8
sound_ref .chan_604
sound_ref .chan_651
sound_ref .chan_664
sound_ref .chan_6A9
sound_ref .chan_6C9
sound_ref .chan_6C9
sound_ref .chan_6C9
sound_ref .chan_6C9
sound_ref .chan_6C9
sound_ref .chan_6DC
sound_ref .chan_6EB
sound_ref .chan_6EB
sound_ref .chan_6FA
sound_ref .chan_70C
sound_ref .chan_71E
sound_ref .chan_731
sound_ref .chan_743
sound_ref .chan_756
sound_ref .chan_766
sound_ref .chan_782
sound_ref .chan_7A5
sound_ref .chan_7C5
sound_ref .chan_7ED
sound_ref .chan_801
sound_ref .chan_810
.ifdef VERSION_JP
  sound_ref .chan_22C
  sound_ref .chan_22C
  sound_ref .chan_22C
.else
  sound_ref .chan_828
  sound_ref .chan_84B
  sound_ref .chan_863
.endif
sound_ref .chan_876
sound_ref .chan_886
sound_ref .chan_896
sound_ref .chan_8A6
sound_ref .chan_8B6
sound_ref .chan_8C6
sound_ref .chan_8D6
sound_ref .chan_8E6
sound_ref .chan_22C
sound_ref .chan_22C
sound_ref .chan_22C
sound_ref .chan_22C
sound_ref .chan_22C
sound_ref .chan_22C
sound_ref .chan_22C
sound_ref .chan_22C

.chan_22C:
chan_setbank 1
chan_setinstr 0
chan_setlayer 0, .layer_234
chan_end

.layer_234:
layer_note1 41, 0xc, 117
layer_note1 46, 0x18, 117
layer_end

.chan_23B:
chan_setbank 1
chan_setinstr 1
chan_setlayer 0, .layer_243
chan_end

.layer_243:
layer_note1 41, 0xc, 120
layer_note1 50, 0x18, 120
layer_end

.chan_24A:
chan_setbank 2
chan_setinstr 1
chan_setlayer 0, .layer_252
chan_end

.layer_252:
layer_note1 41, 0x6, 80
layer_note1 50, 0x18, 80
layer_end

.chan_259:
chan_setbank 1
chan_setinstr 3
chan_setlayer 0, .layer_261
chan_end

.layer_261:
layer_note1 41, 0xc, 127
layer_note1 50, 0x18, 127
layer_end

.chan_268:
chan_setbank 1
chan_setinstr 4
chan_setlayer 0, .layer_270
chan_end

.layer_270:
layer_note1 41, 0xc, 90
layer_note1 50, 0x18, 90
layer_end

.chan_277:
chan_setbank 1
chan_setinstr 5
chan_setlayer 0, .layer_27F
chan_end

.layer_27F:
layer_note1 41, 0xc, 80
layer_note1 50, 0x18, 80
layer_end

.chan_286:
chan_setbank 1
chan_setinstr 6
chan_setlayer 0, .layer_28E
chan_end

.layer_28E:
layer_note1 29, 0xc, 127
layer_note1 38, 0x18, 127
layer_end

.chan_295:
chan_setbank 1
chan_setinstr 8
chan_setlayer 0, .layer_29D
chan_end

.layer_29D:
layer_note0 34, 0xc, 100, 127
layer_note0 43, 0x24, 100, 127
layer_end

.chan_2A6:
chan_setbank 1
chan_setinstr 0
chan_setlayer 0, .layer_2AE
chan_end

.layer_2AE:
layer_note1 46, 0xc, 117
layer_note1 41, 0x18, 117
layer_end

.chan_2B5:
chan_setbank 1
chan_setinstr 1
chan_setlayer 0, .layer_2BD
chan_end

.layer_2BD:
layer_note1 50, 0xc, 120
layer_note1 41, 0x18, 120
layer_end

.chan_2C4:
chan_setbank 2
chan_setinstr 1
chan_setlayer 0, .layer_2CC
chan_end

.layer_2CC:
layer_note1 50, 0xc, 80
layer_note1 41, 0x18, 80
layer_end

.chan_2D3:
chan_setbank 1
chan_setinstr 3
chan_setlayer 0, .layer_2DB
chan_end

.layer_2DB:
layer_note1 50, 0xc, 127
layer_note1 41, 0x18, 127
layer_end

.chan_2E2:
chan_setbank 1
chan_setinstr 4
chan_setlayer 0, .layer_2EA
chan_end

.layer_2EA:
layer_note1 50, 0xc, 90
layer_note1 41, 0x18, 90
layer_end

.chan_2F1:
chan_setbank 1
chan_setinstr 5
chan_setlayer 0, .layer_2F9
chan_end

.layer_2F9:
layer_note1 50, 0xc, 80
layer_note1 41, 0x18, 80
layer_end

.chan_300:
chan_setbank 1
chan_setinstr 6
chan_setlayer 0, .layer_308
chan_end

.layer_308:
layer_note1 38, 0xc, 127
layer_note1 29, 0x18, 127
layer_end

.chan_30F:
chan_setbank 1
chan_setinstr 8
chan_setlayer 0, .layer_317
chan_end

.layer_317:
layer_note0 43, 0xc, 100, 127
layer_note0 34, 0x24, 100, 127
layer_end

.chan_320:
chan_setbank 1
chan_setinstr 0
chan_setlayer 0, .layer_328
chan_end

.layer_328:
layer_note1 39, 0x18, 85
layer_end

.chan_32C:
chan_setbank 1
chan_setinstr 1
chan_setlayer 0, .layer_334
chan_end

.layer_334:
layer_note1 39, 0x18, 100
layer_end

.chan_338:
chan_setbank 2
chan_setinstr 1
chan_setlayer 0, .layer_340
chan_end

.layer_340:
layer_note1 43, 0x18, 63
layer_end

.chan_344:
chan_setbank 1
chan_setinstr 3
chan_setlayer 0, .layer_34C
chan_end

.layer_34C:
layer_note1 39, 0x18, 77
layer_end

.chan_350:
chan_setbank 1
chan_setinstr 4
chan_setlayer 0, .layer_358
chan_end

.layer_358:
layer_note1 39, 0x18, 70
layer_end

.chan_35C:
chan_setbank 1
chan_setinstr 5
chan_setlayer 0, .layer_364
chan_end

.layer_364:
layer_note1 39, 0x18, 68
layer_end

.chan_368:
chan_setbank 1
chan_setinstr 6
chan_setlayer 0, .layer_370
chan_end

.layer_370:
layer_note1 39, 0x18, 100
layer_end

.chan_374:
chan_setbank 1
chan_setinstr 8
chan_setlayer 0, .layer_37C
chan_end

.layer_37C:
layer_note1 39, 0x18, 70
layer_end

.chan_380:
chan_setbank 1
chan_setinstr 0
chan_setlayer 0, .layer_388
chan_end

.layer_388:
layer_note1 17, 0xc, 117
layer_note1 19, 0x18, 117
layer_end

.chan_38F:
chan_setbank 1
chan_setinstr 1
chan_setlayer 0, .layer_397
chan_end

.layer_397:
layer_note1 29, 0xc, 120
layer_note1 31, 0x18, 120
layer_end

.chan_39E:
chan_setbank 2
chan_setinstr 1
chan_setlayer 0, .layer_3A6
chan_end

.layer_3A6:
layer_note1 34, 0xc, 80
layer_note1 39, 0x18, 80
layer_end

.chan_3AD:
chan_setbank 1
chan_setinstr 3
chan_setlayer 0, .layer_3B5
chan_end

.layer_3B5:
layer_note1 29, 0xc, 115
layer_note1 31, 0xc, 115
layer_end

.chan_3BC:
chan_setbank 1
chan_setinstr 4
chan_setlayer 0, .layer_3C4
chan_end

.layer_3C4:
layer_note1 29, 0xc, 90
layer_note1 31, 0x18, 90
layer_end

.chan_3CB:
chan_setbank 1
chan_setinstr 5
chan_setlayer 0, .layer_3D3
chan_end

.layer_3D3:
layer_note1 34, 0xc, 80
layer_note1 36, 0x18, 80
layer_end

.chan_3DA:
chan_setbank 1
chan_setinstr 6
chan_setlayer 0, .layer_3E2
chan_end

.layer_3E2:
layer_note1 29, 0xc, 127
layer_note1 31, 0x18, 127
layer_end

.chan_3E9:
chan_setbank 1
chan_setinstr 8
chan_setlayer 0, .layer_3F1
chan_end

.layer_3F1:
layer_note0 31, 0xc, 100, 127
layer_note0 32, 0x24, 100, 127
layer_end

.chan_3FA:
chan_setbank 1
chan_setinstr 0
chan_setlayer 0, .layer_402
chan_end

.layer_402:
layer_note1 37, 0x18, 63
layer_end

.chan_406:
chan_setbank 1
chan_setinstr 1
chan_setlayer 0, .layer_40E
chan_end

.layer_40E:
layer_note1 37, 0x18, 57
layer_end

.chan_412:
chan_setbank 2
chan_setinstr 1
chan_setlayer 0, .layer_41A
chan_end

.layer_41A:
layer_note1 39, 0x18, 39
layer_end

.chan_41E:
chan_setbank 1
chan_setinstr 3
chan_setlayer 0, .layer_426
chan_end

.layer_426:
layer_note1 37, 0x18, 49
layer_end

.chan_42A:
chan_setbank 1
chan_setinstr 4
chan_setlayer 0, .layer_432
chan_end

.layer_432:
layer_note1 37, 0x18, 39
layer_end

.chan_436:
chan_setbank 1
chan_setinstr 5
chan_setlayer 0, .layer_43E
chan_end

.layer_43E:
layer_note1 37, 0x18, 39
layer_end

.chan_442:
chan_setbank 1
chan_setinstr 6
chan_setlayer 0, .layer_44A
chan_end

.layer_44A:
layer_note1 37, 0x18, 70
layer_end

.chan_44E:
chan_setbank 1
chan_setinstr 8
chan_setlayer 0, .layer_456
chan_end

.layer_456:
layer_note1 35, 0x18, 49
layer_end

.chan_45A:
chan_setbank 1
chan_setinstr 7
chan_setlayer 0, .layer_462
chan_end

.layer_462:
layer_note1 29, 0xc, 100
layer_note1 38, 0x12, 100
layer_end

.chan_469:
chan_setbank 1
chan_setinstr 7
chan_setlayer 0, .layer_471
chan_end

.layer_471:
layer_note1 38, 0xc, 100
layer_note1 29, 0x18, 100
layer_end

.chan_478:
chan_setbank 1
chan_setinstr 7
chan_setlayer 0, .layer_480
chan_end

.layer_480:
layer_portamento 0x85, 27, 255
layer_note1 31, 0x10, 100
layer_end

.chan_488:
chan_setbank 1
chan_setinstr 7
chan_setlayer 0, .layer_490
chan_end

.layer_490:
layer_note1 20, 0xc, 100
layer_note1 24, 0x18, 100
layer_end

.chan_497:
chan_setbank 3
chan_setinstr 6
chan_setenvelope .envelope_3304
chan_setlayer 0, .layer_4A2
chan_end

.layer_4A2:
layer_note1 62, 0x6, 90
layer_note1 58, 0x7, 90
layer_end

.chan_4A9:
chan_setbank 0
chan_setinstr 2
chan_setlayer 0, .layer_4BD
chan_setval 1
chan_call .delay
chan_setbank 3
chan_setinstr 1
chan_setenvelope .envelope_32D4
chan_end

.layer_4BD:
layer_note1 62, 0x4, 127
layer_note0 56, 0x3, 127, 80
layer_end

.chan_4C5:
chan_setbank 1
chan_setinstr 8
chan_setlayer 0, .layer_4CD
chan_end

.layer_4CD:
layer_portamento 0x1, 29, 0x12
layer_note1 24, 0x12, 115
layer_end

.chan_4D5:
chan_setbank 1
chan_setinstr 7
chan_setlayer 0, .layer_4DD
chan_end

.layer_4DD:
layer_portamento 0x85, 25, 255
layer_note1 29, 0x10, 70
layer_end

.chan_4E5:
chan_setbank 2
chan_setinstr 0
chan_setlayer 0, .layer_4ED
chan_end

.layer_4ED:
layer_note1 39, 0x7f, 100
layer_end

.chan_4F1:
chan_setbank 2
chan_setinstr 1
chan_setlayer 0, .layer_4F9
chan_end

.layer_4F9:
layer_note1 36, 0x64, 90
layer_end

.chan_4FD:
chan_setbank 2
chan_setlayer 0, .layer_503
chan_end

.layer_503:
layer_setinstr 2
layer_note1 36, 0xa, 80
layer_setinstr 0
layer_portamento 0x81, 36, 255
layer_note1 50, 0x32, 80
layer_end

.chan_512:
chan_setbank 2
chan_setinstr 2
chan_setlayer 0, .layer_51A
chan_end

.layer_51A:
layer_portamento 0x81, 35, 255
layer_note1 30, 0x3c, 110
layer_end

.chan_522:
chan_setbank 2
chan_setinstr 2
chan_setlayer 0, .layer_52A
chan_end

.layer_52A:
layer_note1 39, 0x7f, 115
layer_end

.chan_52E:
chan_setbank 0
chan_setinstr 0
chan_setlayer 0, .layer_538
chan_end

.layer_536:
layer_transpose 1

.layer_538:
layer_portamento 0x81, 46, 255
layer_note1 31, 0xf, 100
layer_end

.chan_540:
chan_setbank 0
chan_setinstr 0
chan_setlayer 0, .layer_548
chan_end

.layer_548:
layer_note1 39, 0x12, 100
layer_end

.chan_54C:
chan_setbank 0
chan_setinstr 0
chan_setdecayrelease 30
chan_setlayer 0, .layer_556
chan_end

.layer_556:
layer_portamento 0x81, 34, 255
layer_note1 41, 0xc, 127
layer_end

.chan_55E:
chan_setbank 0
chan_setinstr 1
chan_setlayer 0, .layer_566
chan_end

.layer_566:
layer_note1 37, 0xa, 105
layer_portamento 0x81, 42, 255
layer_note1 37, 0x1e, 105
layer_end

.chan_571:
chan_setbank 0
chan_setinstr 1
chan_setlayer 0, .layer_579
chan_end

.layer_579:
layer_portamento 0x81, 44, 255
layer_note1 40, 0xb4, 100
layer_end

.chan_582:
chan_setbank 0
chan_setinstr 2
chan_setlayer 0, .layer_58A
chan_end

.layer_58A:
layer_note1 39, 0x4, 127
layer_note1 41, 0x12, 127
layer_end

.chan_591:
chan_setbank 1
chan_setinstr 1
chan_setenvelope .envelope_32C4
chan_setlayer 0, .layer_59C
chan_end

.layer_59C:
layer_note1 38, 0x6, 127
layer_note1 41, 0x6, 127
layer_end

.chan_5A3:
chan_setbank 1
chan_setinstr 1
chan_setenvelope .envelope_32C4
chan_setlayer 0, .layer_5AE
chan_end

.layer_5AE:
layer_note1 41, 0x6, 127
layer_note1 38, 0x6, 127
layer_end

.chan_5B5:
chan_setbank 0
chan_setinstr 2
chan_setlayer 0, .layer_5BD
chan_end

.layer_5BD:
layer_note1 32, 0xa, 127
layer_end

.chan_5C1:
chan_setbank 0
chan_setinstr 1
chan_setenvelope .envelope_32C4
chan_setlayer 0, .layer_5CC
chan_end

.layer_5CC:
layer_note1 39, 0x8, 90
layer_note1 41, 0x8, 90
layer_end

.chan_5D3:
chan_setbank 3
chan_setinstr 1
chan_setenvelope .envelope_32E4
chan_setlayer 0, .layer_5DE
chan_end

.layer_5DE:
layer_portamento 0x85, 53, 255
layer_note1 55, 0xc, 127
layer_note1 53, 0x18, 127
layer_end

.chan_5E9:
chan_setbank 1
chan_setinstr 7
chan_setlayer 0, .layer_5F1
chan_end

.layer_5F1:
layer_note1 39, 0x7, 100
layer_note1 20, 0x18, 115
layer_end

.chan_5F8:
chan_setbank 0
chan_setinstr 4
chan_setlayer 0, .layer_600
chan_end

.layer_600:
layer_note1 37, 0x48, 127
layer_end

.chan_604:
chan_setbank 7
chan_setinstr 3
chan_setlayer 0, .layer_618
chan_setval 1
chan_call .delay
chan_setbank 6
chan_setinstr 10
chan_setenvelope .envelope_3314
chan_end

.layer_618:
layer_portamento 0x81, 27, 255
layer_note1 46, 0xb, 127
.layer_61F:
layer_somethingon
layer_portamento 0x85, 32, 255
layer_note1 44, 0x5, 100
layer_call .layer_fn_64A
layer_transpose 1
layer_call .layer_fn_64A
layer_transpose 3
layer_call .layer_fn_64A
layer_transpose 4
layer_call .layer_fn_64A
layer_transpose 6
layer_call .layer_fn_64A
layer_transpose 7
layer_call .layer_fn_64A
layer_transpose 9
layer_call .layer_fn_64A
layer_transpose 10

.layer_fn_64A:
layer_note1 20, 0x5, 115
layer_note1 32, 0x5, 115
layer_end

.chan_651:
chan_setbank 7
chan_setinstr 3
chan_setlayer 0, .layer_659
chan_end

.layer_659:
layer_portamento 0x82, 19, 255
layer_note1 34, 0x5, 110
layer_note1 39, 0x2, 110
layer_end

.chan_664:
chan_setbank 3
chan_setinstr 3
chan_setval 50
chan_call .set_reverb
chan_setenvelope .envelope_3324
chan_setlayer 0, .layer_68F
chan_delay 1
chan_setlayer 1, .layer_6A1
chan_setbank 9
chan_setinstr 1
chan_setenvelope .envelope_32D4
chan_setdecayrelease 20
chan_delay 1
chan_setlayer 2, .layer_699
chan_setbank 4
chan_setinstr 14
chan_setdecayrelease 12
chan_setvibratoextent 10
chan_end

.layer_68F:
layer_transpose 36
layer_portamento 0x81, 62, 255
layer_note1 38, 0x7f, 127
layer_end

.layer_699:
layer_portamento 0x81, 39, 255
layer_note1 15, 0x7f, 127
layer_end

.layer_6A1:
layer_portamento 0x81, 62, 255
layer_note1 38, 0x7f, 100
layer_end

.chan_6A9:
chan_setbank 2
chan_setinstr 2
chan_setval 20
chan_call .set_reverb
chan_setlayer 0, .layer_6C1
chan_setlayer 1, .layer_6B9
chan_end

.layer_6B9:
layer_portamento 0x81, 23, 255
layer_note1 59, 0x30, 120
layer_end

.layer_6C1:
layer_portamento 0x81, 35, 255
layer_note1 42, 0x3c, 110
layer_end

.chan_6C9:
chan_setbank 1
chan_setinstr 0
chan_setlayer 0, .layer_6D1
chan_end

.layer_6D1:
layer_note1 17, 0x6, 127
layer_portamento 0x81, 31, 255
layer_note1 7, 0xc, 127
layer_end

.chan_6DC:
chan_setbank 1
chan_setinstr 5
chan_setlayer 0, .layer_6E4
chan_end

.layer_6E4:
layer_note1 23, 0x6, 127
layer_note1 25, 0xc, 127
layer_end

.chan_6EB:
chan_setbank 1
chan_setinstr 8
chan_setlayer 0, .layer_6F3
chan_end

.layer_6F3:
layer_note1 17, 0x6, 127
layer_note1 19, 0xc, 127
layer_end

.chan_6FA:
chan_setbank 1
chan_setinstr 7
chan_setenvelope .envelope_3314
chan_setlayer 0, .layer_705
chan_end

.layer_705:
layer_note1 20, 0xf, 90
layer_note1 29, 0x17, 90
layer_end

.chan_70C:
chan_setbank 1
chan_setinstr 7
chan_setenvelope .envelope_3314
chan_setlayer 0, .layer_717
chan_end

.layer_717:
layer_note1 29, 0xf, 90
layer_note1 20, 0x1f, 90
layer_end

.chan_71E:
chan_setbank 1
chan_setinstr 7
chan_setenvelope .envelope_3314
chan_setlayer 0, .layer_729
chan_end

.layer_729:
layer_portamento 0x85, 18, 255
layer_note1 22, 0x15, 90
layer_end

.chan_731:
chan_setbank 1
chan_setinstr 7
chan_setenvelope .envelope_3314
chan_setlayer 0, .layer_73C
chan_end

.layer_73C:
layer_note1 11, 0xf, 90
layer_note1 15, 0x1f, 90
layer_end

.chan_743:
chan_setbank 1
chan_setinstr 7
chan_setenvelope .envelope_3314
chan_setlayer 0, .layer_74E
chan_end

.layer_74E:
layer_portamento 0x85, 18, 255
layer_note1 22, 0x10, 90
layer_end

.chan_756:
chan_setbank 6
chan_setinstr 10
chan_setenvelope .envelope_3314
chan_setlayer 0, .layer_761
chan_end

.layer_761:
layer_transpose 8
layer_jump .layer_61F

.chan_766:
chan_setbank 5
chan_setinstr 6
chan_setenvelope .envelope_33AC
chan_setlayer 0, .layer_774
chan_setlayer 1, .layer_776
chan_end

.layer_774:
layer_transpose 12

.layer_776:
layer_somethingon
layer_portamento 0x85, 27, 255
layer_note1 51, 0x14, 127
layer_note1 36, 0x5a, 127
layer_end

.chan_782:
chan_setbank 9
chan_setinstr 3
chan_setvibratoextent 60
chan_setvibratorate 60
chan_setenvelope .envelope_32E4
chan_setlayer 0, .layer_79D
chan_setlayer 1, .layer_79B
chan_setval 36
chan_call .delay
chan_setvibratoextent 0
chan_end

.layer_79B:
layer_transpose 1

.layer_79D:
layer_portamento 0x81, 20, 100
layer_note1 27, 0x30, 127
layer_end

.chan_7A5:
chan_setbank 1
chan_setinstr 7
chan_setenvelope .envelope_3344
chan_setlayer 0, .layer_7B9
chan_setval 4
chan_call .delay
chan_setbank 9
chan_setinstr 3
chan_end

.layer_7B9:
layer_note1 43, 0x3, 115
layer_note1 48, 0x5, 115
layer_transpose 12
layer_note1 55, 0x6, 80
layer_end

.chan_7C5:
chan_setbank 7
chan_setinstr 3
chan_setlayer 0, .layer_7D9
chan_setval 1
chan_call .delay
chan_setbank 6
chan_setinstr 10
chan_setenvelope .envelope_3314
chan_end

.layer_7D9:
layer_portamento 0x81, 27, 255
layer_note1 41, 0xb, 127
layer_somethingon
layer_transpose 252
layer_portamento 0x85, 32, 255
layer_note1 44, 0x5, 100
layer_jump .layer_fn_64A

.chan_7ED:
chan_setbank 0
chan_setinstr 3
chan_setdecayrelease 30
chan_setlayer 0, .layer_7F7
chan_end

.layer_7F7:
layer_setinstr 0
layer_portamento 0x81, 32, 255
layer_note1 39, 0x24, 127
layer_end

.chan_801:
chan_jump .chan_2DD0

.chan_fn_804:
chan_setbank 0
chan_setinstr 5
chan_setlayer 0, .layer_80C
chan_end

.layer_80C:
layer_note1 41, 0x3c, 127
layer_end

.chan_810:
chan_setbank 1
chan_setinstr 1
chan_setenvelope .envelope_32C4
chan_setlayer 0, .layer_81B
chan_end

.layer_81B:
layer_note1 38, 0x8, 127
layer_note1 41, 0x9, 127
layer_note1 39, 0xa, 127
layer_note1 42, 0x8, 127
layer_end

.ifndef VERSION_JP
  .chan_828:
  chan_setbank 7
  chan_setinstr 3
  chan_setlayer 0, .layer_83C
  chan_setval 1
  chan_call .delay
  chan_setbank 6
  chan_setinstr 10
  chan_setenvelope .envelope_3314
  chan_end

  .layer_83C:
  layer_portamento 0x81, 27, 255
  layer_note1 46, 0x7, 127
  layer_portamento 0x85, 3, 255
  layer_note1 39, 0xf, 100
  layer_end

  .chan_84B:
  chan_setbank 5
  chan_setinstr 6
  chan_setenvelope .envelope_33AC
  chan_setlayer 0, .layer_859
  chan_setlayer 1, .layer_85B
  chan_end

  .layer_859:
  layer_transpose 12

  .layer_85B:
  layer_portamento 0x85, 26, 240
  layer_note1 51, 0x53, 127
  layer_end

  .chan_863:
  chan_setbank 5
  chan_setinstr 6
  chan_setenvelope .envelope_33AC
  chan_setlayer 0, .layer_871
  chan_setlayer 1, .layer_776
  chan_end

  .layer_871:
  layer_transpose 8
  layer_jump .layer_776
.endif

.chan_876:
chan_call .chan_fn_804
chan_setval 1
chan_call .delay
chan_setbank 1
chan_setinstr 0
chan_setlayer 1, .layer_388
chan_end

.chan_886:
chan_call .chan_fn_804
chan_setval 1
chan_call .delay
chan_setbank 1
chan_setinstr 1
chan_setlayer 1, .layer_397
chan_end

.chan_896:
chan_call .chan_fn_804
chan_setval 1
chan_call .delay
chan_setbank 2
chan_setinstr 1
chan_setlayer 1, .layer_3A6
chan_end

.chan_8A6:
chan_call .chan_fn_804
chan_setval 1
chan_call .delay
chan_setbank 1
chan_setinstr 3
chan_setlayer 1, .layer_3B5
chan_end

.chan_8B6:
chan_call .chan_fn_804
chan_setval 1
chan_call .delay
chan_setbank 1
chan_setinstr 4
chan_setlayer 1, .layer_3C4
chan_end

.chan_8C6:
chan_call .chan_fn_804
chan_setval 1
chan_call .delay
chan_setbank 1
chan_setinstr 5
chan_setlayer 1, .layer_3D3
chan_end

.chan_8D6:
chan_call .chan_fn_804
chan_setval 1
chan_call .delay
chan_setbank 1
chan_setinstr 6
chan_setlayer 1, .layer_3E2
chan_end

.chan_8E6:
chan_call .chan_fn_804
chan_setval 1
chan_call .delay
chan_setbank 1
chan_setinstr 8
chan_setlayer 1, .layer_3F1
chan_end

.channel1_table:
sound_ref .chan_966
sound_ref .chan_977
sound_ref .chan_994
sound_ref .chan_9BB
sound_ref .chan_9CC
sound_ref .chan_9E9
sound_ref .chan_9FA
sound_ref .chan_A0B
sound_ref .chan_966
sound_ref .chan_977
sound_ref .chan_994
sound_ref .chan_9BB
sound_ref .chan_9CC
sound_ref .chan_9E9
sound_ref .chan_9FA
sound_ref .chan_A0B
sound_ref .chan_A28
sound_ref .chan_A39
sound_ref .chan_A4D
sound_ref .chan_11D0
sound_ref .chan_A62
sound_ref .chan_11D0
sound_ref .chan_A77
sound_ref .chan_A8C
sound_ref .chan_AA3
sound_ref .chan_AC0
sound_ref .chan_AC3
sound_ref .chan_9BB
sound_ref .chan_9CC
sound_ref .chan_9E9
sound_ref .chan_9FA
sound_ref .chan_A0B
sound_ref .chan_AEA
sound_ref .chan_AF7
sound_ref .chan_B0D
sound_ref .chan_B2B
sound_ref .chan_B38
sound_ref .chan_B4E
sound_ref .chan_B5B
sound_ref .chan_B68
sound_ref .chan_B7E
sound_ref .chan_AF7
sound_ref .chan_B0D
sound_ref .chan_B2B
sound_ref .chan_B38
sound_ref .chan_B4E
sound_ref .chan_B5B
sound_ref .chan_B68
sound_ref .chan_AEA
sound_ref .chan_AF7
sound_ref .chan_B0D
sound_ref .chan_B2B
sound_ref .chan_B38
sound_ref .chan_B4E
sound_ref .chan_B5B
sound_ref .chan_B68

.chan_966:
chan_setbank 3
chan_setinstr 0
chan_setlayer 0, .layer_96E
chan_end

.layer_96E:
layer_somethingon
.layer_96F:
layer_note1 39, 0x12c, 80
layer_jump .layer_96F
layer_end

.chan_977:
chan_setbank 1
chan_setinstr 1
chan_setlayer 0, .layer_988
chan_setval 1
chan_call .delay
chan_setbank 3
chan_setinstr 1
chan_end

.layer_988:
layer_note1 41, 0x8, 105
layer_somethingon
.layer_98C:
layer_note1 39, 0x12c, 70
layer_jump .layer_98C
layer_end

.chan_994:
chan_setbank 2
chan_setinstr 1
chan_setlayer 0, .layer_9A8
chan_setlayer 1, .layer_9B3
chan_setval 1
chan_call .delay
chan_setbank 3
chan_setinstr 2
chan_end

.layer_9A8:
layer_delay 1
layer_somethingon
.layer_9AB:
layer_note1 39, 0x12c, 88
layer_jump .layer_9AB
layer_end

.layer_9B3:
layer_portamento 0x81, 39, 255
layer_note1 48, 0x32, 80
layer_end

.chan_9BB:
chan_setbank 3
chan_setinstr 3
chan_setlayer 0, .layer_9C3
chan_end

.layer_9C3:
layer_somethingon
.layer_9C4:
layer_note1 39, 0x12c, 68
layer_jump .layer_9C4
layer_end

.chan_9CC:
chan_setbank 1
chan_setinstr 4
chan_setlayer 0, .layer_9DD
chan_setval 1
chan_call .delay
chan_setbank 3
chan_setinstr 4
chan_end

.layer_9DD:
layer_note1 42, 0xc, 75
layer_somethingon
.layer_9E1:
layer_note1 39, 0x12c, 76
layer_jump .layer_9E1
layer_end

.chan_9E9:
chan_setbank 3
chan_setinstr 5
chan_setlayer 0, .layer_9F1
chan_end

.layer_9F1:
layer_somethingon
.layer_9F2:
layer_note1 39, 0x12c, 80
layer_jump .layer_9F2
layer_end

.chan_9FA:
chan_setbank 3
chan_setinstr 6
chan_setlayer 0, .layer_A02
chan_end

.layer_A02:
layer_somethingon
.layer_A03:
layer_note1 39, 0x12c, 100
layer_jump .layer_A03
layer_end

.chan_A0B:
chan_setbank 1
chan_setinstr 8
chan_setlayer 0, .layer_A1C
chan_setval 1
chan_call .delay
chan_setbank 3
chan_setinstr 7
chan_end

.layer_A1C:
layer_note1 42, 0xc, 100
layer_somethingon
.layer_A20:
layer_note1 39, 0x12c, 81
layer_jump .layer_A20
layer_end

.chan_A28:
chan_setbank 3
chan_setinstr 8
chan_setlayer 0, .layer_A30
chan_end

.layer_A30:
layer_somethingon
.layer_A31:
layer_note1 39, 0x12c, 120
layer_jump .layer_A31
layer_end

.chan_A39:
chan_setbank 3
chan_setinstr 1
chan_setenvelope .envelope_32D4
chan_setlayer 0, .layer_A44
chan_end

.layer_A44:
layer_somethingon
.layer_A45:
layer_note1 43, 0x12c, 80
layer_jump .layer_A45
layer_end

.chan_A4D:
chan_setbank 0
chan_setinstr 1
chan_setlayer 0, .layer_A55
chan_end

.layer_A55:
layer_portamento 0x81, 44, 255
.layer_A59:
layer_somethingon
layer_note1 40, 0xb4, 100
layer_jump .layer_A59
layer_end

.chan_A62:
chan_setbank 3
chan_setinstr 7
chan_setlayer 0, .layer_A6A
chan_end

.layer_A6A:
layer_somethingon
layer_portamento 0x85, 37, 255
.layer_A6F:
layer_note1 34, 0xc8, 127
layer_jump .layer_A6F
layer_end

.chan_A77:
chan_setbank 3
chan_setinstr 9
chan_setlayer 0, .layer_A84
chan_setlayer 1, .layer_A82
chan_end

.layer_A82:
layer_transpose 24

.layer_A84:
layer_note1_long 43, 0x6, 127
layer_jump .layer_A84
layer_end

.chan_A8C:
chan_setbank 5
chan_setinstr 6
chan_setlayer 0, .layer_A9B
chan_setlayer 1, .layer_A97
chan_end

.layer_A97:
layer_setinstr 13
layer_transpose 244

.layer_A9B:
layer_somethingon
.layer_A9C:
layer_note1 43, 0x12c, 105
layer_jump .layer_A9C

.chan_AA3:
chan_setbank 9
chan_setinstr 3
chan_setval 40
chan_call .set_reverb
chan_setenvelope .envelope_3344
chan_setlayer 0, .layer_AB3
chan_end

.layer_AB3:
layer_transpose 12
.layer_AB5:
layer_note0 60, 0xc, 100, 127
layer_note0 60, 0x30, 100, 127
layer_jump .layer_AB5

.chan_AC0:
chan_jump .chan_29C2

.chan_AC3:
chan_setbank 9
chan_setinstr 3
chan_setenvelope .envelope_3368
chan_setlayer 0, .layer_AD8
chan_setlayer 1, .layer_AD6
chan_setlayer 2, .layer_AD4
chan_end

.layer_AD4:
layer_delay 0x4

.layer_AD6:
layer_delay 0x4

.layer_AD8:
layer_transpose 24
.layer_ADA:
layer_portamento 0x85, 32, 40
layer_note1 39, 0x9, 100
layer_note1 44, 0x6, 50
layer_note1 51, 0x3, 20
layer_jump .layer_ADA

.chan_AEA:
chan_setbank 3
chan_setinstr 0
chan_setlayer 0, .layer_AF2
chan_end

.layer_AF2:
layer_transpose 4
layer_jump .layer_96E

.chan_AF7:
chan_setbank 1
chan_setinstr 1
chan_setlayer 0, .layer_B08
chan_setval 1
chan_call .delay
chan_setbank 3
chan_setinstr 1
chan_end

.layer_B08:
layer_transpose 4
layer_jump .layer_988

.chan_B0D:
chan_setbank 2
chan_setinstr 1
chan_setlayer 0, .layer_B21
chan_setlayer 1, .layer_B26
chan_setval 1
chan_call .delay
chan_setbank 3
chan_setinstr 2
chan_end

.layer_B21:
layer_transpose 4
layer_jump .layer_9A8

.layer_B26:
layer_transpose 4
layer_jump .layer_9B3

.chan_B2B:
chan_setbank 3
chan_setinstr 3
chan_setlayer 0, .layer_B33
chan_end

.layer_B33:
layer_transpose 4
layer_jump .layer_9C3

.chan_B38:
chan_setbank 1
chan_setinstr 4
chan_setlayer 0, .layer_B49
chan_setval 1
chan_call .delay
chan_setbank 3
chan_setinstr 4
chan_end

.layer_B49:
layer_transpose 4
layer_jump .layer_9DD

.chan_B4E:
chan_setbank 3
chan_setinstr 5
chan_setlayer 0, .layer_B56
chan_end

.layer_B56:
layer_transpose 4
layer_jump .layer_9F1

.chan_B5B:
chan_setbank 3
chan_setinstr 6
chan_setlayer 0, .layer_B63
chan_end

.layer_B63:
layer_transpose 4
layer_jump .layer_A02

.chan_B68:
chan_setbank 1
chan_setinstr 8
chan_setlayer 0, .layer_B79
chan_setval 1
chan_call .delay
chan_setbank 3
chan_setinstr 7
chan_end

.layer_B79:
layer_transpose 4
layer_jump .layer_A1C

.chan_B7E:
chan_setlayer 0, .layer_B9F
chan_setlayer 1, .layer_BA8
.chan_B84:
chan_setbank 3
chan_setinstr 2
chan_setval 1
chan_call .delay
chan_setdecayrelease 30
chan_setbank 2
chan_setinstr 1
chan_setenvelope .envelope_3334
chan_setval 1
chan_call .delay
chan_jump .chan_B84
chan_end

.layer_B9F:
layer_somethingon
.layer_BA0:
layer_note1 42, 0x12c, 88
layer_jump .layer_BA0
layer_end

.layer_BA8:
layer_delay 1
.layer_BAA:
layer_portamento 0x81, 41, 255
layer_note1 56, 0xa, 127
layer_jump .layer_BAA

.channel2_table:
sound_ref .chan_C52
sound_ref .chan_C44
sound_ref .chan_C34
sound_ref .chan_C64
sound_ref .chan_C74
sound_ref .chan_C8A
sound_ref .chan_C9C
sound_ref .chan_CAA
sound_ref .chan_CB8
sound_ref .chan_CC6
sound_ref .chan_CD4
sound_ref .chan_CE2
sound_ref .chan_CF0
sound_ref .chan_D01
sound_ref .chan_D0F
sound_ref .chan_D1D
sound_ref .chan_D2B
sound_ref .chan_D3A
sound_ref .chan_D86
sound_ref .chan_D48
sound_ref .chan_D56
sound_ref .chan_D65
sound_ref .chan_D74
sound_ref .chan_DD4
sound_ref .chan_D86
sound_ref .chan_D94
sound_ref .chan_DA4
sound_ref .chan_DB4
sound_ref .chan_DC2
sound_ref .chan_DD4
sound_ref .chan_DEA
sound_ref .chan_E03
sound_ref .chan_E21
sound_ref .chan_E32
sound_ref .chan_E3E
sound_ref .chan_E41
sound_ref .chan_E4E
sound_ref .chan_C8A
sound_ref .chan_C9C
sound_ref .chan_CAA
.ifdef VERSION_JP
  sound_ref .chan_C34
  sound_ref .chan_C34
  sound_ref .chan_C34
  sound_ref .chan_C34
  sound_ref .chan_C34
  sound_ref .chan_C34
  sound_ref .chan_C34
  sound_ref .chan_C34
  sound_ref .chan_C34
  sound_ref .chan_C34
  sound_ref .chan_C34
  sound_ref .chan_C34
  sound_ref .chan_C34
  sound_ref .chan_C34
  sound_ref .chan_C34
  sound_ref .chan_C34
.else
  sound_ref .chan_E67
  sound_ref .chan_C34
  sound_ref .chan_C34
  sound_ref .chan_C74
  sound_ref .chan_C74
  sound_ref .chan_C74
  sound_ref .chan_E74
  sound_ref .chan_E80
  sound_ref .chan_E8C
  sound_ref .chan_E98
  sound_ref .chan_EA4
  sound_ref .chan_EB0
  sound_ref .chan_EBD
  sound_ref .chan_EC9
  sound_ref .chan_EEC
  sound_ref .chan_F00
  sound_ref .chan_F0D
  sound_ref .chan_F1C
  sound_ref .chan_F2C
  sound_ref .chan_F3C
  sound_ref .chan_F4B
  sound_ref .chan_F5B
  sound_ref .chan_F6B
  sound_ref .chan_F7A
.endif

.chan_C34:
chan_setbank 8
chan_setinstr 0
chan_setlayer 0, .layer_C3C
chan_end

.layer_C3C:
.ifdef VERSION_EU
  layer_transpose 2
.endif
layer_portamento 0x82, 41, 127
layer_note1 37, 0x14, 127
layer_end

.chan_C44:
chan_setbank 8
chan_setinstr 1
chan_setlayer 0, .layer_C4C
chan_end

.layer_C4C:
layer_transpose 254
.layer_C4E:
layer_note1 38, 0x18, 127
layer_end

.chan_C52:
chan_setbank 10
chan_setinstr 9
chan_setlayer 0, .layer_C5A
chan_end

.layer_C5A:
layer_transpose 254
.layer_C5C:
layer_portamento 0x82, 39, 200
layer_note1 38, 0x24, 120
layer_end

.chan_C64:
chan_setbank 10
chan_setinstr 1
chan_setlayer 0, .layer_C6C
chan_end

.layer_C6C:
.ifdef VERSION_EU
  layer_transpose 1
.endif
layer_portamento 0x82, 44, 200
layer_note1 39, 0x30, 127
layer_end

.chan_C74:
chan_setbank 8
chan_setinstr 4
chan_setlayer 0, .layer_C7C
chan_end

.layer_C7C:
layer_transpose 254
layer_somethingon
layer_portamento 0x85, 39, 255
layer_note1 42, 0x1e, 110
layer_note1 39, 0x41, 110
layer_end

.chan_C8A:
chan_setbank 8
chan_setinstr 5
chan_setlayer 0, .layer_C92
chan_end

.layer_C92:
layer_transpose 254
layer_portamento 0x81, 41, 255
layer_note1 38, 0x2b, 115
layer_end

.chan_C9C:
chan_setbank 8
chan_setinstr 6
chan_setlayer 0, .layer_CA4
chan_end

.layer_CA4:
layer_transpose 254
layer_note1 44, 0x1e, 110
layer_end

.chan_CAA:
chan_setbank 8
chan_setinstr 7
chan_setlayer 0, .layer_CB2
chan_end

.layer_CB2:
layer_transpose 253
layer_note1 39, 0x1c, 127
layer_end

.chan_CB8:
chan_setbank 8
chan_setinstr 8
chan_setlayer 0, .layer_CC0
chan_end

.layer_CC0:
layer_transpose 254
layer_note1 40, 0x30, 110
layer_end

.chan_CC6:
chan_setbank 8
chan_setinstr 9
chan_setlayer 0, .layer_CCE
chan_end

.layer_CCE:
layer_transpose 254
layer_note1 40, 0x44, 105
layer_end

.chan_CD4:
chan_setbank 8
chan_setinstr 10
chan_setlayer 0, .layer_CDC
chan_end

.layer_CDC:
layer_transpose 254
layer_note1 41, 0x30, 120
layer_end

.chan_CE2:
chan_setbank 8
chan_setinstr 11
chan_setlayer 0, .layer_CEA
chan_end

.layer_CEA:
layer_transpose 254
layer_note1 38, 0x30, 127
layer_end

.chan_CF0:
chan_setbank 8
chan_setinstr 12
chan_setlayer 0, .layer_CF8
chan_end

.layer_CF8:
layer_portamento 0x81, 38, 200
layer_note1 41, 0x85, 127
layer_end

.chan_D01:
chan_setbank 8
chan_setinstr 13
chan_setlayer 0, .layer_D09
chan_end

.layer_D09:
layer_transpose 254
layer_note1 39, 0x7f, 105
layer_end

.chan_D0F:
chan_setbank 8
chan_setinstr 14
chan_setlayer 0, .layer_D17
chan_end

.layer_D17:
layer_transpose 254
layer_note1 39, 0x60, 64
layer_end

.chan_D1D:
chan_setbank 8
chan_setinstr 15
chan_setlayer 0, .layer_D25
chan_end

.layer_D25:
layer_transpose 254
layer_note1 39, 0x5c, 52
layer_end

.chan_D2B:
chan_setbank 10
chan_setinstr 0
chan_setlayer 0, .layer_D33
chan_end

.layer_D33:
layer_transpose 254
layer_note1 39, 0xaa, 127
layer_end

.chan_D3A:
chan_setbank 8
chan_setinstr 3
chan_setlayer 0, .layer_D42
chan_end

.layer_D42:
layer_transpose 255
layer_note1 39, 0x4d, 120
layer_end

.chan_D48:
chan_setbank 10
chan_setinstr 6
chan_setlayer 0, .layer_D50
chan_end

.layer_D50:
layer_transpose 254
layer_note1 43, 0x1e, 105
layer_end

.chan_D56:
chan_setbank 10
chan_setinstr 5
chan_setlayer 0, .layer_D5E
chan_end

.layer_D5E:
layer_transpose 254
layer_note1 39, 0xc8, 127
layer_end

.chan_D65:
chan_setbank 10
chan_setinstr 4
chan_setlayer 0, .layer_D6D
chan_end

.layer_D6D:
layer_transpose 254
layer_note1 39, 0x8c, 110
layer_end

.chan_D74:
chan_setbank 10
chan_setinstr 2
chan_setlayer 0, .layer_D7C
chan_end

.layer_D7C:
layer_transpose 254
layer_portamento 0x82, 35, 255
layer_note1 38, 0x30, 127
layer_end

.chan_D86:
chan_setbank 10
chan_setinstr 2
chan_setlayer 0, .layer_D8E
chan_end

.layer_D8E:
layer_transpose 254
layer_note1 39, 0x3c, 100
layer_end

.chan_D94:
chan_setbank 10
chan_setinstr 2
chan_setlayer 0, .layer_D9C
chan_end

.layer_D9C:
layer_transpose 254
layer_delay 0x4
layer_note1 38, 0x3c, 100
layer_end

.chan_DA4:
chan_setbank 10
chan_setinstr 2
chan_setlayer 0, .layer_DAC
chan_end

.layer_DAC:
layer_transpose 254
layer_delay 0x8
layer_note1 40, 0x3c, 100
layer_end

.chan_DB4:
chan_setbank 10
chan_setinstr 7
chan_setlayer 0, .layer_DBC
chan_end

.layer_DBC:
layer_transpose 254
layer_note1 39, 0x10, 115
layer_end

.chan_DC2:
chan_setbank 10
chan_setinstr 7
chan_setlayer 0, .layer_DCA
chan_end

.layer_DCA:
layer_transpose 254
layer_portamento 0x81, 38, 255
layer_note1 41, 0x18, 115
layer_end

.chan_DD4:
chan_setbank 10
chan_setinstr 7
chan_setlayer 0, .layer_DDC
chan_end

.layer_DDC:
layer_transpose 254
layer_somethingon
layer_portamento 0x85, 38, 255
layer_note1 41, 0xc, 115
layer_note1 35, 0x12, 115
layer_end

.chan_DEA:
chan_setbank 10
chan_setinstr 9
chan_setlayer 0, .layer_DFE
chan_setval 1
chan_call .delay
chan_setbank 0
chan_setinstr 0
chan_setlayer 1, .layer_538
chan_end

.layer_DFE:
layer_transpose 254
layer_jump .layer_C5C

.chan_E03:
chan_setbank 10
chan_setinstr 10
chan_setlayer 0, .layer_E17
chan_setval 1
chan_call .delay
chan_setbank 0
chan_setinstr 0
chan_setlayer 1, .layer_548
chan_end

.layer_E17:
layer_transpose 254
layer_portamento 0x81, 42, 255
layer_note1 38, 0x30, 115
layer_end

.chan_E21:
chan_setbank 10
chan_setinstr 11
chan_setlayer 0, .layer_E29
chan_end

.layer_E29:
layer_portamento 0x81, 38, 255
layer_note1 36, 0x8c, 115
layer_end

.chan_E32:
chan_setbank 10
chan_setinstr 12
chan_setlayer 0, .layer_E3A
chan_end

.layer_E3A:
layer_note1 39, 0x60, 115
layer_end

.chan_E3E:
chan_jump .chan_CAA

.chan_E41:
chan_setbank 10
chan_setinstr 13
chan_setlayer 0, .layer_E49
chan_end

.layer_E49:
layer_note1 38, 0x91, 127
layer_end

.chan_E4E:
chan_setbank 8
chan_setinstr 1
chan_setlayer 0, .layer_E62
chan_setval 1
chan_call .delay
chan_setbank 0
chan_setinstr 0
chan_setlayer 1, .layer_536
chan_end

.layer_E62:
layer_transpose 255
layer_jump .layer_C4E

.ifndef VERSION_JP
  .chan_E67:
  chan_setbank 10
  chan_setinstr 15
  chan_setlayer 0, .layer_E6F
  chan_end

  .layer_E6F:
  layer_note1 39, 0x2bc, 127
  layer_end

  .chan_E74:
  chan_setbank 8
  chan_setinstr 24
  chan_setlayer 0, .layer_E7C
  chan_end

  .layer_E7C:
  layer_note1 39, 0x5a, 127
  layer_end

  .chan_E80:
  chan_setbank 8
  chan_setinstr 25
  chan_setlayer 0, .layer_E88
  chan_end

  .layer_E88:
  layer_note1 39, 0x5a, 97
  layer_end

  .chan_E8C:
  chan_setbank 8
  chan_setinstr 16
  chan_setlayer 0, .layer_E94
  chan_end

  .layer_E94:
  layer_note1 41, 0x46, 127
  layer_end

  .chan_E98:
  chan_setbank 8
  chan_setinstr 17
  chan_setlayer 0, .layer_EA0
  chan_end

  .layer_EA0:
  layer_note1 39, 0x55, 110
  layer_end

  .chan_EA4:
  chan_setbank 8
  chan_setinstr 18
  chan_setlayer 0, .layer_EAC
  chan_end

  .layer_EAC:
  layer_note1 39, 0x46, 127
  layer_end

  .chan_EB0:
  chan_setbank 8
  chan_setinstr 19
  chan_setlayer 0, .layer_EB8
  chan_end

  .layer_EB8:
  layer_note1 39, 0x12c, 127
  layer_end

  .chan_EBD:
  chan_setbank 8
  chan_setinstr 20
  chan_setlayer 0, .layer_EC5
  chan_end

  .layer_EC5:
  layer_note1 39, 0x30, 127
  layer_end

  .chan_EC9:
  chan_setbank 8
  chan_setlayer 0, .layer_ECF
  chan_end

  .layer_ECF:
  layer_delay 0x4e
  .layer_ED1:
  layer_loop 50
  layer_call .layer_fn_EE1
  layer_loopend
  layer_setinstr 21
  layer_note1 39, 0x44c, 127
  layer_jump .layer_ED1
  layer_end

  .layer_fn_EE1:
  layer_setinstr 21
  layer_note1 37, 0x53, 127
  layer_setinstr 15
  layer_note1 37, 0x4e, 64
  layer_end

  .chan_EEC:
  chan_setbank 8
  chan_setinstr 22
  chan_setlayer 0, .layer_EF7
  chan_setlayer 1, .layer_EF7
  chan_end

  .layer_EF7:
  layer_portamento 0x82, 42, 200
  layer_note1 39, 0xc8, 110
  layer_end

  .chan_F00:
  chan_setbank 8
  chan_setinstr 23
  chan_setlayer 0, .layer_F08
  chan_end

  .layer_F08:
  layer_note1 39, 0x96, 110
  layer_end

  .chan_F0D:
  chan_setbank 10
  chan_setinstr 16
  chan_setlayer 0, .layer_F18
  chan_setlayer 1, .layer_F18
  chan_end

  .layer_F18:
  layer_note1 39, 0x46, 127
  layer_end

  .chan_F1C:
  chan_setbank 10
  chan_setinstr 17
  chan_setlayer 0, .layer_F27
  chan_setlayer 1, .layer_F27
  chan_end

  .layer_F27:
  layer_note1 39, 0x15e, 127
  layer_end

  .chan_F2C:
  chan_setbank 10
  chan_setinstr 18
  chan_setlayer 0, .layer_F37
  chan_setlayer 1, .layer_F37
  chan_end

  .layer_F37:
  layer_note1 39, 0xb4, 127
  layer_end

  .chan_F3C:
  chan_setbank 10
  chan_setinstr 19
  chan_setlayer 0, .layer_F47
  chan_setlayer 1, .layer_F47
  chan_end

  .layer_F47:
  layer_note1 39, 0x64, 127
  layer_end

  .chan_F4B:
  chan_setbank 10
  chan_setinstr 20
  chan_setlayer 0, .layer_F56
  chan_setlayer 1, .layer_F56
  chan_end

  .layer_F56:
  layer_note1 39, 0xdc, 127
  layer_end

  .chan_F5B:
  chan_setbank 10
  chan_setinstr 21
  chan_setlayer 0, .layer_F66
  chan_setlayer 1, .layer_F66
  chan_end

  .layer_F66:
  layer_note1 39, 0x190, 127
  layer_end

  .chan_F6B:
  chan_setbank 10
  chan_setinstr 22
  chan_setlayer 0, .layer_F76
  chan_setlayer 1, .layer_F76
  chan_end

  .layer_F76:
  layer_note1 39, 0x50, 127
  layer_end

  .chan_F7A:
  chan_setbank 10
  chan_setinstr 23
  chan_setval 20
  chan_call .set_reverb
  chan_setlayer 0, .layer_F8A
  chan_setlayer 1, .layer_F8A
  chan_end

  .layer_F8A:
  layer_note1 39, 0x50, 127
  layer_end
.endif

.ifdef VERSION_EU
  .chan_unused_F9A_eu:
  chan_setbank 8
  chan_setinstr 0
  chan_setlayer 0, .layer_FA2_eu
  chan_end
  
  .layer_FA2_eu:
  layer_delay 0x5
  layer_end
.endif

.channel38_table:
sound_ref .chan_108E
sound_ref .chan_10A7
sound_ref .chan_10A7
sound_ref .chan_10B3
sound_ref .chan_10CA
sound_ref .chan_10DB
sound_ref .chan_10EA
sound_ref .chan_1110
sound_ref .chan_111C
sound_ref .chan_1130
sound_ref .chan_1F4E
sound_ref .chan_114D
sound_ref .chan_1159
sound_ref .chan_116D
sound_ref .chan_117D
sound_ref .chan_1189
sound_ref .chan_11D0
sound_ref .chan_11D0
sound_ref .chan_11F3
sound_ref .chan_11F3
sound_ref .chan_11F3
sound_ref .chan_11F3
sound_ref .chan_125A
sound_ref .chan_126F
sound_ref .chan_127E
sound_ref .chan_127E
sound_ref .chan_128A
sound_ref .chan_128A
sound_ref .chan_128A
sound_ref .chan_128A
sound_ref .chan_128A
sound_ref .chan_128A
sound_ref .chan_1296
sound_ref .chan_1296
sound_ref .chan_12BF
sound_ref .chan_12BF
sound_ref .chan_12D4
sound_ref .chan_12EB
sound_ref .chan_1303
sound_ref .chan_1316
sound_ref .chan_1330
sound_ref .chan_1330
sound_ref .chan_1330
sound_ref .chan_1330
sound_ref .chan_133C
sound_ref .chan_1348
sound_ref .chan_1369
sound_ref .chan_1385
sound_ref .chan_13A5
sound_ref .chan_13BA
sound_ref .chan_13D4
sound_ref .chan_11D0
sound_ref .chan_13ED
sound_ref .chan_13FD
sound_ref .chan_140D
sound_ref .chan_1429
sound_ref .chan_144B
sound_ref .chan_1471
sound_ref .chan_149E
sound_ref .chan_14EA
sound_ref .chan_14FE
sound_ref .chan_1519
sound_ref .chan_152F
sound_ref .chan_154B
sound_ref .chan_1561
sound_ref .chan_1577
sound_ref .chan_1591
sound_ref .chan_15A2
sound_ref .chan_15B9
sound_ref .chan_15CD
sound_ref .chan_15DA
sound_ref .chan_15F2
sound_ref .chan_15FF
sound_ref .chan_1613
sound_ref .chan_163B
sound_ref .chan_164D
sound_ref .chan_168B
sound_ref .chan_16BB
sound_ref .chan_16D8
sound_ref .chan_16EB
sound_ref .chan_31A6
sound_ref .chan_31DE
sound_ref .chan_3214
sound_ref .chan_3248
sound_ref .chan_3292
sound_ref .chan_328D
sound_ref .chan_16FE
sound_ref .chan_1712
sound_ref .chan_1722
sound_ref .chan_1749
sound_ref .chan_1761
sound_ref .chan_1770
sound_ref .chan_1783
sound_ref .chan_1796
sound_ref .chan_17AB
sound_ref .chan_17B7
sound_ref .chan_17D1
sound_ref .chan_1821
sound_ref .chan_184F
sound_ref .chan_1862
sound_ref .chan_187B
sound_ref .chan_18A7
sound_ref .chan_18C0
sound_ref .chan_18D7
sound_ref .chan_18F3
sound_ref .chan_192A
sound_ref .chan_19CA
sound_ref .chan_19EA
sound_ref .chan_1A07
sound_ref .chan_1A17
sound_ref .chan_1A27
sound_ref .chan_1A2A
sound_ref .chan_1A2D
sound_ref .chan_1A39
sound_ref .chan_1A56
sound_ref .chan_1A6E
sound_ref .chan_1A87
.ifdef VERSION_JP
  sound_ref .chan_1AB4_jp
  sound_ref .chan_10A7
  sound_ref .chan_10A7
  sound_ref .chan_10A7
  sound_ref .chan_10CA
  sound_ref .chan_10DB
  sound_ref .chan_10EA
  sound_ref .chan_1110
  sound_ref .chan_111C
  sound_ref .chan_10A7
  sound_ref .chan_10A7
.else
  sound_ref .chan_1AB4
  sound_ref .chan_1AD0
  sound_ref .chan_10A7
  sound_ref .chan_18F3
  sound_ref .chan_192A
  sound_ref .chan_19CA
  sound_ref .chan_19EA
  sound_ref .chan_1A07
  sound_ref .chan_1A17
  sound_ref .chan_1A27
  sound_ref .chan_1A2A
.endif

.chan_108E:
chan_setbank 5
chan_setinstr 7
chan_setlayer 0, .layer_109F
chan_delay 1
chan_setbank 4
chan_setinstr 9
chan_setlayer 1, .layer_1537
chan_end

.layer_109F:
layer_portamento 0x1, 27, 0x28
layer_note1 37, 0x7f, 120
layer_end

.chan_10A7:
chan_setbank 4
chan_setinstr 0
chan_setlayer 0, .layer_10AF
chan_end

.layer_10AF:
layer_note1 39, 0x30, 85
layer_end

.chan_10B3:
chan_setbank 3
chan_setinstr 8
chan_setenvelope .envelope_3314
chan_setlayer 0, .layer_10BE
chan_end

.layer_10BE:
layer_somethingon
layer_portamento 0x85, 34, 255
layer_note1 43, 0x8, 127
layer_note1 27, 0x7f, 127
layer_end

.chan_10CA:
chan_setbank 4
chan_setinstr 1
chan_setlayer 0, .layer_10D2
chan_end

.layer_10D2:
layer_note1 39, 0x18, 100
layer_setinstr 2
layer_note1 39, 0x48, 60
layer_end

.chan_10DB:
chan_setbank 4
chan_setinstr 1
chan_setlayer 0, .layer_10E3
chan_end

.layer_10E3:
layer_note1 37, 0x6, 100
layer_note1 34, 0x18, 100
layer_end

.chan_10EA:
chan_setbank 4
chan_setinstr 4
chan_setlayer 0, .layer_10FE
chan_setlayer 1, .layer_1108
chan_setval 6
chan_call .delay
chan_setbank 4
chan_setinstr 3
chan_end

.layer_10FE:
layer_delay 0xf
layer_portamento 0x81, 39, 255
layer_note1 44, 0x38, 115
layer_end

.layer_1108:
layer_portamento 0x81, 44, 255
layer_note1 34, 0x2c, 85
layer_end

.chan_1110:
chan_setbank 4
chan_setinstr 4
chan_setlayer 0, .layer_1118
chan_end

.layer_1118:
layer_note1 39, 0x30, 115
layer_end

.chan_111C:
chan_setbank 4
chan_setinstr 6
chan_setlayer 0, .layer_1124
chan_end

.layer_1124:
layer_transpose 24
layer_note1 39, 0xa, 65
layer_note1 39, 0x9, 70
layer_note1 39, 0x8, 75
layer_end

.chan_1130:
chan_setbank 4
chan_setinstr 5
chan_setlayer 0, .layer_1138
chan_end

.layer_1138:
layer_note1 39, 0x91, 127
layer_end

.chan_113D:
chan_setbank 4
chan_setinstr 5
chan_setlayer 0, .layer_1145
chan_end

.layer_1145:
layer_portamento 0x81, 27, 255
layer_note1 32, 0x60, 127
layer_end

.chan_114D:
chan_setbank 4
chan_setinstr 6
chan_setlayer 0, .layer_1155
chan_end

.layer_1155:
layer_note1 39, 0x14, 70
layer_end

.chan_1159:
chan_setbank 4
chan_setinstr 15
chan_setlayer 0, .layer_1161
chan_end

.layer_1161:
layer_note1 32, 0x18, 127
layer_portamento 0x81, 41, 255
layer_note1 27, 0x96, 127
layer_end

.chan_116D:
chan_setbank 4
chan_setinstr 6
chan_setlayer 0, .layer_1175
chan_end

.layer_1175:
layer_portamento 0x81, 34, 255
layer_note1 37, 0x18, 80
layer_end

.chan_117D:
chan_setbank 4
chan_setinstr 8
chan_setlayer 0, .layer_1185
chan_end

.layer_1185:
layer_note1 39, 0x40, 120
layer_end

.chan_1189:
chan_setbank 5
chan_setinstr 7
chan_setlayer 0, .layer_109F
chan_setval 1
chan_call .delay
chan_setbank 4
chan_setinstr 9
chan_setlayer 1, .layer_119D
chan_end

.layer_119D:
layer_transpose 244

.layer_fn_119F:
layer_portamento 0x83, 27, 255
layer_note0 55, 0x4, 127, 64
layer_note0 51, 0x5, 127, 64
layer_note0 48, 0x4, 127, 64
layer_note0 44, 0x6, 127, 64
layer_note0 41, 0x9, 127, 64
layer_note0 39, 0x6, 127, 64
.layer_11BB:
layer_note0 37, 0x7, 127, 64
layer_note0 34, 0x5, 127, 64
layer_note0 31, 0x8, 127, 64
layer_note0 29, 0x9, 127, 64
layer_note0 24, 0x8, 127, 64
layer_end

.chan_11D0:
chan_setbank 9
chan_setinstr 3
chan_setenvelope .envelope_3358
chan_setvibratoextent 3
chan_setvibratorate 60
chan_setval 25
chan_call .set_reverb
chan_setlayer 0, .layer_11E4
chan_end

.layer_11E4:
layer_transpose 24

.layer_fn_11E6:
layer_note1 25, 0x2, 40
layer_note1 37, 0x7, 85
layer_note1 30, 0x5, 40
layer_note1 42, 0x37, 85
layer_end

.chan_11F3:
chan_setbank 9
chan_setinstr 3
chan_setenvelope .envelope_3358
chan_setvibratoextent 12
chan_setval 25
chan_call .set_reverb
chan_setlayer 0, .layer_1242
chan_setlayer 1, .layer_1254
chan_setval 1
chan_call .delay
chan_setbank 4
chan_setinstr 6
chan_setval 1
chan_call .delay
chan_setbank 9
chan_setinstr 3
chan_setenvelope .envelope_3358
chan_setval 9
chan_call .delay
chan_setbank 4
chan_setinstr 6
chan_setval 3
chan_call .delay
chan_setbank 9
chan_setinstr 3
chan_setenvelope .envelope_3358
chan_setval 6
chan_call .delay
chan_setbank 4
chan_setinstr 6
chan_setval 49
chan_call .delay
chan_setvibratoextent 0
chan_end

.layer_1242:
layer_delay 1
layer_setinstr 6
layer_transpose 22
layer_note1 39, 0xa, 55
layer_note1 39, 0x9, 60
layer_note1 39, 0x8, 65
layer_delay 0x29
layer_end

.layer_1254:
layer_transpose 23
layer_call .layer_fn_11E6
layer_end

.chan_125A:
chan_setbank 4
chan_setinstr 14
chan_setenvelope .envelope_33FC
chan_setlayer 0, .layer_1265
chan_end

.layer_1265:
layer_portamento 0x81, 34, 127
layer_note1 38, 0x30, 127
layer_delay 0x30
layer_end

.chan_126F:
chan_setbank 4
chan_setinstr 9
chan_setlayer 0, .layer_1277
chan_end

.layer_1277:
layer_note1 37, 0xa, 100
layer_note1 26, 0x12, 120
layer_end

.chan_127E:
chan_setbank 4
chan_setinstr 10
chan_setlayer 0, .layer_1286
chan_end

.layer_1286:
layer_note1 39, 0xf, 120
layer_end

.chan_128A:
chan_setbank 4
chan_setinstr 10
chan_setlayer 0, .layer_1292
chan_end

.layer_1292:
layer_note1 37, 0x12, 120
layer_end

.chan_1296:
chan_setbank 7
chan_setinstr 1
chan_setval 25
chan_call .set_reverb
chan_setlayer 0, .layer_12AF
chan_setlayer 1, .layer_12AF
chan_setval 6
chan_call .delay
chan_setbank 4
chan_setinstr 4
chan_end

.layer_12AF:
layer_note1 43, 0x5, 127
layer_note1 62, 0x9, 127
layer_setinstr 2
layer_portamento 0x81, 27, 255
layer_note1 25, 0x5a, 108
layer_end

.chan_12BF:
chan_setbank 4
chan_setinstr 11
chan_setlayer 0, .layer_12C7
chan_end

.layer_12C7:
layer_note1 24, 0xa, 110
.layer_12CA:
layer_setinstr 5
layer_portamento 0x82, 27, 255
layer_note1 32, 0x73, 127
layer_end

.chan_12D4:
chan_setbank 4
chan_setinstr 1
chan_setenvelope .envelope_33CC
chan_setlayer 0, .layer_12DF
chan_end

.layer_12DF:
layer_somethingon
layer_note1 39, 0x4, 127
layer_portamento 0x82, 36, 255
layer_note1 27, 0x9, 115
layer_end

.chan_12EB:
chan_setbank 4
chan_setinstr 2
chan_setenvelope .envelope_3454
chan_setlayer 0, .layer_12F9
chan_setlayer 1, .layer_12FB
chan_end

.layer_12F9:
layer_transpose 3

.layer_12FB:
layer_portamento 0x2, 17, 0x28
layer_note1 5, 0x60, 127
layer_end

.chan_1303:
chan_setbank 4
chan_setinstr 11
chan_setlayer 0, .layer_130B
chan_end

.layer_130B:
layer_note1 19, 0x6, 110
layer_note1 31, 0x6, 110
layer_transpose 8
layer_jump .layer_12CA

.chan_1316:
chan_setbank 4
chan_setinstr 5
chan_setlayer 0, .layer_131E
chan_end

.layer_131E:
layer_setinstr 11
layer_note1 31, 0x6, 127
layer_note1 19, 0x6, 127
layer_setinstr 5
layer_portamento 0x82, 20, 255
layer_note1 32, 0x5a, 127
layer_end

.chan_1330:
chan_setbank 4
chan_setinstr 13
chan_setlayer 0, .layer_1338
chan_end

.layer_1338:
layer_note1 39, 0x73, 95
layer_end

.chan_133C:
chan_setbank 4
chan_setinstr 14
chan_setlayer 0, .layer_1344
chan_end

.layer_1344:
layer_note1 39, 0x7f, 115
layer_end

.chan_1348:
chan_setbank 4
chan_setinstr 15
chan_setlayer 0, .layer_1350
chan_end

.layer_1350:
layer_note0 36, 0xd, 115, 20
layer_note0 34, 0xe, 115, 20
layer_note0 32, 0xd, 115, 20
layer_note0 31, 0xa, 115, 20
layer_note0 30, 0x7, 115, 20
layer_note0 29, 0x60, 115, 20
layer_end

.chan_1369:
chan_setbank 4
chan_setinstr 15
chan_setenvelope .envelope_33EC
chan_setlayer 0, .layer_137B
chan_setlayer 1, .layer_1377
chan_end

.layer_1377:
layer_note1 15, 0x7f, 127
layer_end

.layer_137B:
layer_note1 55, 0x6, 115
layer_note1 43, 0xc, 115
layer_note1 34, 0x7f, 127
layer_end

.chan_1385:
chan_setbank 4
chan_setinstr 15
chan_setlayer 0, .layer_1395
chan_setlayer 1, .layer_13A0
chan_setlayer 2, .layer_1393
chan_end

.layer_1393:
layer_transpose 6

.layer_1395:
layer_note1 44, 0x7, 127
layer_note1 39, 0x8, 127
layer_note1 36, 0x96, 127
layer_end

.layer_13A0:
layer_note1 22, 0x96, 127
layer_end

.chan_13A5:
chan_setbank 9
chan_setinstr 3
chan_setval 20
chan_call .set_reverb
chan_setlayer 0, .layer_13B2
chan_end

.layer_13B2:
layer_portamento 0x81, 36, 255
layer_note1 48, 0x6, 80
layer_end

.chan_13BA:
chan_setbank 4
chan_setinstr 15
chan_setenvelope .envelope_33EC
chan_setlayer 0, .layer_13C8
chan_setlayer 1, .layer_13D0
chan_end

.layer_13C8:
layer_portamento 0x81, 56, 255
layer_note1 20, 0x78, 80
layer_end

.layer_13D0:
layer_note1 15, 0x78, 127
layer_end

.chan_13D4:
chan_setbank 4
chan_setinstr 6
chan_setlayer 0, .layer_13DC
chan_end

.layer_13DC:
layer_portamento 0x81, 37, 255
layer_note1 39, 0x8, 127
layer_setinstr 5
layer_portamento 0x81, 20, 255
layer_note1 25, 0x60, 127
layer_end

.chan_13ED:
chan_setbank 4
chan_setinstr 2
chan_setlayer 0, .layer_13F5
chan_end

.layer_13F5:
layer_portamento 0x81, 12, 255
layer_note1 13, 0x6e, 127
layer_end

.chan_13FD:
chan_setbank 4
chan_setinstr 2
chan_setlayer 0, .layer_1405
chan_end

.layer_1405:
layer_portamento 0x81, 15, 255
layer_note1 11, 0x6e, 127
layer_end

.chan_140D:
chan_setbank 9
chan_setinstr 3
chan_setval 40
chan_call .set_reverb
chan_setlayer 0, .layer_141A
chan_end

.layer_141A:
layer_transpose 24
layer_note1 39, 0x4, 90
layer_note1 51, 0xc, 90
layer_note1 39, 0x4, 50
layer_note1 51, 0xc, 50
layer_end

.chan_1429:
chan_setbank 9
chan_setinstr 3
chan_setval 40
chan_call .set_reverb
chan_setlayer 0, .layer_1436
chan_end

.layer_1436:
layer_transpose 12
layer_note1 39, 0x3, 90
layer_note1 51, 0x3, 90
layer_note1 27, 0xa, 115
layer_note1 39, 0x3, 50
layer_note1 51, 0x3, 50
layer_note1 27, 0xa, 75
layer_end

.chan_144B:
chan_setbank 4
chan_setinstr 9
chan_setval 50
chan_call .set_reverb
chan_setlayer 0, .layer_1463
chan_setval 13
chan_call .delay
chan_setdecayrelease 30
chan_setbank 4
chan_setinstr 2
chan_end

.layer_1463:
layer_note1 33, 0xc, 100
layer_note1 25, 0x28, 120
layer_portamento 0x81, 22, 255
layer_note1 15, 0x48, 80
layer_end

.chan_1471:
chan_setbank 1
chan_setinstr 1
chan_setval 15
chan_call .set_reverb
chan_setlayer 0, .layer_148A
chan_setval 1
chan_call .delay
chan_setbank 1
chan_setinstr 7
chan_setenvelope .envelope_3368
chan_end

.layer_148A:
layer_note1 29, 0xc, 120
layer_transpose 12
layer_portamento 0x81, 51, 255
layer_note1 53, 0x6, 118
layer_portamento 0x81, 52, 255
layer_note1 54, 0x9, 118
layer_end

.chan_149E:
chan_setbank 7
.ifdef VERSION_JP
  chan_setinstr 8
.else
  chan_setinstr 14
.endif
chan_setval 15
chan_call .set_reverb
chan_setlayer 0, .layer_14C6
chan_setlayer 1, .layer_14E3
.ifndef VERSION_JP
  chan_setlayer 2, .layer_14E3
.endif
chan_setval 1
chan_call .delay
chan_setenvelope .envelope_3368
chan_setbank 1
chan_setinstr 7
chan_setval 13
chan_call .delay
chan_setbank 7
.ifdef VERSION_JP
  chan_setinstr 8
.else
  chan_setinstr 14
.endif
chan_end

.layer_14C6:
layer_delay 1
layer_transpose 12
layer_portamento 0x81, 54, 255
layer_note0 55, 0x6, 118, 127
layer_portamento 0x81, 55, 255
layer_note0 56, 0x5, 118, 127
layer_portamento 0x81, 57, 255
layer_note0 58, 0xc, 118, 127
layer_end

.layer_14E3:
layer_loop 2
.ifdef VERSION_JP
  layer_portamento 0x81, 36, 255
  layer_note1 24, 0x18, 127
.else
  layer_note1 34, 0x19, 100
.endif
layer_loopend
layer_end

.chan_14EA:
chan_setbank 4
chan_setinstr 9
chan_setlayer 0, .layer_14F2
chan_end

.layer_14F2:
layer_note0 31, 0x12, 80, 80
layer_portamento 0x82, 53, 255
layer_note1 44, 0x7, 88
layer_end

.chan_14FE:
chan_setbank 3
chan_setinstr 5
chan_setenvelope .envelope_32D4
chan_setval 10
chan_call .set_reverb
chan_setlayer 0, .layer_150E
chan_end

.layer_150E:
layer_note1 41, 0x4, 100
layer_note0 34, 0x14, 100, 100
layer_note1 29, 0x6, 115
layer_end

.chan_1519:
chan_setval 10
chan_call .set_reverb
chan_setlayer 0, .layer_152B
chan_setlayer 1, .layer_1529
chan_setbank 4
chan_setinstr 1
chan_end

.layer_1529:
layer_transpose 1

.layer_152B:
layer_note1 15, 0x2c, 127
layer_end

.chan_152F:
chan_setbank 4
chan_setinstr 9
chan_setlayer 0, .layer_1539
chan_end

.layer_1537:
layer_transpose 253

.layer_1539:
layer_note1 39, 0x6, 120
layer_portamento 0x81, 15, 255
layer_note1 8, 0xc, 120
layer_portamento 0x81, 27, 255
layer_note1 3, 0x18, 120
layer_end

.chan_154B:
chan_setbank 4
chan_setinstr 3
chan_setval 30
chan_call .set_reverb
chan_setlayer 0, .layer_1558
chan_end

.layer_1558:
layer_portamento 0x81, 19, 40
layer_note1 22, 0xb4, 115
layer_end

.chan_1561:
chan_setbank 5
chan_setinstr 5
chan_setenvelope .envelope_3344
chan_setval 20
chan_call .set_reverb
chan_setlayer 0, .layer_1571
chan_end

.layer_1571:
layer_note1 14, 0x34, 110
layer_delay 0x14
layer_end

.chan_1577:
chan_setbank 5
chan_setinstr 7
chan_setlayer 0, .layer_1582
chan_setlayer 1, .layer_1582
chan_end

.layer_1582:
layer_somethingon
layer_portamento 0x85, 39, 255
layer_note1 36, 0x14, 110
layer_note1 38, 0x10, 110
layer_note1 27, 0x64, 110
layer_end

.chan_1591:
chan_setbank 4
chan_setinstr 9
chan_setlayer 0, .layer_1599
chan_end

.layer_1599:
layer_note0 36, 0xa, 80, 80
layer_note0 24, 0xa, 80, 80
layer_end

.chan_15A2:
chan_setbank 6
chan_setinstr 15
chan_setlayer 0, .layer_15AA
chan_end

.layer_15AA:
layer_somethingon
layer_portamento 0x85, 35, 255
layer_note1 34, 0x60, 127
layer_note1 32, 0x60, 127
layer_note1 32, 0x30, 127
layer_end

.chan_15B9:
chan_setbank 6
chan_setinstr 1
chan_setval 55
chan_call .set_reverb
chan_setlayer 0, .layer_15C6
chan_end

.layer_15C6:
layer_note1 32, 0xc, 127
layer_note1 27, 0x30, 127
layer_end

.chan_15CD:
chan_setbank 6
chan_setinstr 15
chan_setlayer 0, .layer_15D5
chan_end

.layer_15D5:
layer_note1 31, 0xc0, 127
layer_end

.chan_15DA:
chan_setbank 7
chan_setinstr 1
chan_setlayer 0, .layer_15EB
chan_setval 1
chan_call .delay
chan_setbank 5
chan_setinstr 5
chan_end

.layer_15EB:
layer_note1 24, 0xc, 127
layer_note1 22, 0x48, 127
layer_end

.chan_15F2:
chan_setbank 6
chan_setinstr 10
chan_setlayer 0, .layer_15FA
chan_end

.layer_15FA:
layer_note1 44, 0xfa, 127
layer_end

.chan_15FF:
chan_setbank 6
chan_setinstr 1
chan_setval 25
chan_call .set_reverb
chan_setlayer 0, .layer_160C
chan_end

.layer_160C:
layer_note1 29, 0xc, 120
layer_note1 24, 0x24, 120
layer_end

.chan_1613:
chan_setbank 3
chan_setinstr 5
chan_setenvelope .envelope_3358
chan_setlayer 0, .layer_162D
chan_setlayer 1, .layer_1637
chan_setval 1
chan_call .delay
chan_setbank 4
chan_setinstr 15
chan_setenvelope .envelope_3358
chan_end

.layer_162D:
layer_delay 1
layer_note1 36, 0xc, 127
layer_note1 32, 0x96, 127
layer_end

.layer_1637:
layer_note1 24, 0x60, 127
layer_end

.chan_163B:
chan_setbank 6
chan_setinstr 15
chan_setenvelope .envelope_3304
chan_setlayer 0, .layer_1646
chan_end

.layer_1646:
layer_note1 31, 0xa, 127
layer_note1 43, 0x10, 127
layer_end

.chan_164D:
chan_setbank 4
chan_setinstr 15
chan_setval 30
chan_call .set_reverb
chan_setlayer 0, .layer_1660
chan_setlayer 1, .layer_1669
chan_setlayer 2, .layer_1665
chan_end

.layer_1660:
layer_note1 20, 0x226, 0
layer_end

.layer_1665:
layer_delay 0x4
layer_transpose 244

.layer_1669:
layer_note1 27, 0x4f, 93
layer_note1 28, 0x41, 99
layer_note1 29, 0x36, 101
layer_note1 30, 0x31, 109
layer_note1 36, 0xe, 113
layer_note1 38, 0x3b, 123
layer_note1 32, 0x27, 105
layer_note1 35, 0x60, 92
layer_note1 32, 0xe, 100
layer_note1 36, 0xb, 105
layer_note1 39, 0x31, 116
layer_end

.chan_168B:
chan_setbank 4
chan_setinstr 15
chan_setval 30
chan_call .set_reverb
chan_setenvelope .envelope_338C
chan_setlayer 0, .layer_16A1
chan_setlayer 1, .layer_16AA
chan_setlayer 2, .layer_16A6
chan_end

.layer_16A1:
layer_note1 24, 0x12c, 127
layer_end

.layer_16A6:
layer_delay 0x4
layer_transpose 244

.layer_16AA:
layer_note1 46, 0xe, 116
layer_note1 44, 0xb, 121
layer_note1 48, 0x12, 101
layer_note1 41, 0xf, 109
layer_note1 43, 0xfa, 113
layer_end

.chan_16BB:
chan_setbank 5
chan_setinstr 0
chan_setval 127
chan_call .set_reverb
chan_setlayer 0, .layer_16CE
chan_setlayer 1, .layer_16CE
chan_setlayer 2, .layer_16D2
chan_end

.layer_16CE:
layer_note1 49, 0x3a, 127
layer_end

.layer_16D2:
layer_delay 0xa
layer_note1 48, 0x30, 85
layer_end

.chan_16D8:
chan_setbank 6
chan_setinstr 10
chan_setenvelope .envelope_32D4
chan_setlayer 0, .layer_16E3
chan_end

.layer_16E3:
layer_portamento 0x81, 51, 96
layer_note1 58, 0x40, 100
layer_end

.chan_16EB:
chan_setbank 6
chan_setinstr 10
chan_setenvelope .envelope_32D4
chan_setlayer 0, .layer_16F6
chan_end

.layer_16F6:
layer_portamento 0x82, 51, 96
layer_note1 58, 0x40, 100
layer_end

.chan_16FE:
chan_setbank 6
chan_setinstr 1
chan_setval 55
chan_call .set_reverb
chan_setlayer 0, .layer_170B
chan_end

.layer_170B:
layer_note1 27, 0x7, 127
layer_note1 15, 0x12, 127
layer_end

.chan_1712:
chan_setbank 4
chan_setinstr 14
chan_setlayer 0, .layer_171A
chan_end

.layer_171A:
layer_portamento 0x81, 43, 127
layer_note1 31, 0x7f, 115
layer_end

.chan_1722:
chan_setbank 9
chan_setinstr 3
chan_setenvelope .envelope_3358
chan_setlayer 0, .layer_1734
chan_setdecayrelease 50
chan_setlayer 1, .layer_1732
chan_end

.layer_1732:
layer_delay 0x4

.layer_1734:
layer_transpose 24
layer_note1 31, 0xc, 100
layer_note1 34, 0xc, 100
layer_note1 43, 0xc, 100
layer_note1 39, 0xc, 100
layer_note1 41, 0xc, 100
layer_note1 46, 0x18, 100
layer_end

.chan_1749:
chan_setbank 4
chan_setinstr 9
chan_setlayer 0, .layer_1751
chan_end

.layer_1751:
layer_call .layer_fn_1756
layer_transpose 252

.layer_fn_1756:
layer_note1 27, 0x5, 105
layer_portamento 0x81, 15, 255
layer_note1 8, 0xa, 100
layer_end

.chan_1761:
chan_setbank 4
chan_setinstr 9
chan_setlayer 0, .layer_1769
chan_end

.layer_1769:
layer_note1 8, 0x5, 127
layer_note1 18, 0x12, 127
layer_end

.chan_1770:
chan_setbank 4
chan_setinstr 9
chan_setenvelope .envelope_33BC
chan_setlayer 0, .layer_177B
chan_end

.layer_177B:
layer_portamento 0x82, 5, 255
layer_note1 8, 0xa, 127
layer_end

.chan_1783:
chan_setbank 0
chan_setinstr 0
chan_setlayer 0, .layer_178B
chan_end

.layer_178B:
layer_note1 44, 0x6, 100
layer_portamento 0x81, 44, 255
layer_note1 32, 0x12, 100
layer_end

.chan_1796:
chan_setbank 9
chan_setinstr 3
chan_setenvelope .envelope_3428
chan_setlayer 0, .layer_17A1
chan_end

.layer_17A1:
layer_transpose 12
layer_portamento 0x85, 62, 255
layer_note1 38, 0x78, 93
layer_end

.chan_17AB:
chan_setbank 1
chan_setinstr 1
chan_setlayer 0, .layer_17B3
chan_end

.layer_17B3:
layer_note1 29, 0xc, 127
layer_end

.chan_17B7:
chan_setbank 4
chan_setinstr 1
chan_setlayer 0, .layer_17C4
chan_setlayer 1, .layer_17C2
chan_end

.layer_17C2:
layer_delay 1

.layer_17C4:
layer_note1 34, 0x6, 127
layer_note1 33, 0x7, 127
layer_note1 33, 0x6, 127
layer_note1 34, 0x6, 127
layer_end

.chan_17D1:
chan_setbank 6
chan_setenvelope .envelope_32D4
chan_setlayer 0, .layer_17E8
chan_setval 1
chan_call .delay
chan_setenvelope .envelope_32D4
chan_setlayer 1, .layer_17F3
chan_setlayer 2, .layer_17EF
chan_end

.layer_17E8:
layer_setinstr 10
layer_transpose 24
layer_jump .layer_17F5

.layer_17EF:
layer_delay 0x2
layer_transpose 12

.layer_17F3:
layer_setinstr 0
.layer_17F5:
layer_portamento 0x83, 3, 255
layer_note1 15, 0x30, 100
layer_note1 17, 0x2c, 100
layer_note1 19, 0x28, 100
layer_note1 20, 0x24, 100
layer_note1 22, 0x20, 100
layer_note1 24, 0x1c, 100
layer_note1 26, 0x18, 100
layer_note1 27, 0x14, 100
layer_note1 29, 0x11, 100
layer_note1 31, 0xe, 100
layer_note1 32, 0xc, 100
.layer_181A:
layer_note1 34, 0xa, 100
layer_jump .layer_181A
layer_end

.chan_1821:
chan_setbank 4
chan_setinstr 14
chan_setlayer 0, .layer_171A
chan_setval 1
chan_call .delay
chan_setbank 4
chan_setinstr 15
chan_setenvelope .envelope_33EC
chan_setlayer 1, .layer_137B
chan_setval 100
chan_call .delay
chan_setbank 4
chan_setinstr 14
chan_setlayer 0, .layer_1844
chan_end

.layer_1844:
layer_transpose 250
layer_portamento 0x81, 43, 127
layer_note1 31, 0xfa, 115
layer_end

.chan_184F:
chan_setbank 4
chan_setinstr 15
chan_setlayer 0, .layer_185C
chan_setlayer 1, .layer_185A
chan_end

.layer_185A:
layer_transpose 2

.layer_185C:
layer_note1 39, 0xc, 127
layer_jump .layer_1350

.chan_1862:
chan_setbank 4
chan_setinstr 14
chan_setlayer 0, .layer_186A
chan_end

.layer_186A:
layer_portamento 0x83, 39, 128
layer_note1 42, 0x2d, 115
layer_note1 42, 0x2d, 115
layer_note1 42, 0x2d, 115
layer_note1 44, 0x7f, 115
layer_end

.chan_187B:
chan_setbank 9
chan_setinstr 3
chan_setval 30
chan_call .set_reverb
chan_setlayer 0, .layer_1888
chan_end

.layer_1888:
layer_transpose 12
layer_portamento 0x83, 3, 255
layer_note1 27, 0xa, 85
layer_note1 32, 0xa, 85
layer_note1 39, 0xa, 85
layer_note1 44, 0xa, 85
layer_note1 51, 0xa, 85
layer_note1 56, 0xa, 85
layer_note1 51, 0xa, 45
layer_note1 56, 0xa, 35
layer_end

.chan_18A7:
chan_setbank 5
chan_setinstr 7
chan_setlayer 0, .layer_18B8
chan_delay 1
chan_setbank 4
chan_setinstr 9
chan_setlayer 1, .layer_1537
chan_end

.layer_18B8:
layer_portamento 0x1, 27, 0x28
layer_note1 32, 0x32, 120
layer_end

.chan_18C0:
chan_setbank 6
chan_setinstr 11
chan_setlayer 0, .layer_2DBF
chan_setval 9
chan_call .delay
chan_setbank 9
chan_setinstr 3
chan_setenvelope .envelope_3454
chan_setlayer 0, .layer_2D26
chan_end

.chan_18D7:
chan_setbank 4
chan_setinstr 9
chan_setlayer 0, .layer_1539
chan_setval 12
chan_call .delay
chan_setbank 6
chan_setinstr 1
chan_setlayer 0, .layer_18EB
chan_end

.layer_18EB:
layer_portamento 0x82, 15, 255
layer_note1 31, 0x14, 127
layer_end

.chan_18F3:
.ifdef VERSION_JP
  chan_setbank 9
  chan_setinstr 3
  chan_setlayer 0, .layer_1909
  chan_setlayer 1, .layer_1902
  chan_setlayer 2, .layer_1907
.else
  .ifdef VERSION_EU
    chan_setbank 9
    chan_setinstr 3
  .else
    chan_setinstr 128
  .endif
  chan_setenvelope .envelope_3378
  chan_setlayer 0, .layer_1907
  chan_setlayer 1, .layer_1902
  chan_setlayer 2, .layer_1909
.endif
chan_end

.layer_1902:
layer_transpose 7
layer_jump .layer_190B

.layer_1907:
layer_delay 0x6

.layer_1909:
layer_transpose 12
.layer_190B:
layer_note0 46, 0xc, 90, 20
layer_note0 45, 0xc, 90, 20
layer_note0 46, 0xc, 90, 20
layer_note0 58, 0x10, 100, 80
layer_note0 58, 0x10, 60, 80
layer_note0 58, 0x10, 40, 80
layer_note0 58, 0x10, 25, 80
layer_delay 0xa
layer_end

.chan_192A:
chan_setbank 5
chan_setinstr 13
chan_setenvelope .envelope_33DC
chan_setval 20
chan_call .set_reverb
chan_setval 127
chan_iowriteval 7
chan_setlayer 0, .layer_195F
chan_setlayer 1, .layer_1986
chan_setlayer 2, .layer_1982
.chan_1942:
chan_setval 4
chan_call .delay
chan_ioreadval 7
chan_subtract 1
chan_beqz .chan_1957
chan_iowriteval 7
chan_writeseq_nextinstr 0, 1
chan_setvolscale 127
chan_jump .chan_1942
.chan_1957:
chan_setval 127
chan_call .delay
chan_jump .chan_1957

.layer_195F:
layer_setinstr 9
layer_note1 40, 0x6, 122
layer_note1 41, 0x4, 112
layer_note1 43, 0x5, 109
layer_note1 44, 0x6, 124
layer_note1 44, 0x4, 116
layer_note1 45, 0x7, 114
layer_delay 0x19
.layer_1975:
layer_note1 43, 0x7f, 122
layer_note1 43, 0xa, 127
layer_note1 43, 0x64, 114
layer_jump .layer_1975
layer_end

.layer_1982:
layer_transpose 4
layer_delay 0x2

.layer_1986:
layer_portamento 0x83, 39, 255
layer_loop 2
layer_note1 55, 0x6, 120
layer_note1 60, 0x9, 112
layer_delay 0x4
layer_loopend
layer_note1 56, 0x5, 125
layer_note1 62, 0xa, 109
layer_delay 0x5
layer_note1 56, 0x6, 123
layer_note1 62, 0x7, 119
layer_delay 0x8
.layer_19A5:
layer_loop 10
layer_note1 57, 0x5, 120
layer_note1 62, 0x8, 120
layer_delay 0x5
layer_loopend
layer_loop 10
layer_note1 59, 0x7, 115
layer_note1 60, 0x7, 113
layer_delay 0x2
layer_loopend
layer_loop 10
layer_note1 55, 0x8, 115
layer_note1 58, 0x6, 113
layer_delay 0x5
layer_loopend
layer_jump .layer_19A5
layer_end

.chan_19CA:
chan_setbank 9
chan_setinstr 3
chan_setval 40
chan_call .set_reverb
chan_setenvelope .envelope_3344
chan_setlayer 0, .layer_19DA
chan_end

.layer_19DA:
layer_loop 2
layer_note1 62, 0x6, 110
layer_note1 62, 0x2, 45
layer_note1 58, 0x6, 110
layer_note1 58, 0x2, 45
layer_loopend
layer_end

.chan_19EA:
chan_setbank 7
chan_setinstr 1
chan_setlayer 0, .layer_1A00
chan_setlayer 1, .layer_19FE
chan_setval 1
chan_call .delay
chan_setbank 5
chan_setinstr 5
chan_end

.layer_19FE:
layer_transpose 250

.layer_1A00:
layer_note1 15, 0xc, 127
layer_note1 17, 0x3a, 127
layer_end

.chan_1A07:
chan_setbank 5
chan_setinstr 14
chan_setlayer 0, .layer_1A0F
chan_end

.layer_1A0F:
layer_portamento 0x82, 40, 127
layer_note1 38, 0x28, 100
layer_end

.chan_1A17:
chan_setbank 5
chan_setinstr 14
chan_setlayer 0, .layer_1A1F
chan_end

.layer_1A1F:
layer_portamento 0x82, 43, 127
layer_note1 39, 0x36, 100
layer_end

.chan_1A27:
chan_jump .chan_2391

.chan_1A2A:
chan_jump .chan_22FF

.chan_1A2D:
chan_setbank 0
chan_setinstr 3
chan_setlayer 0, .layer_1A35
chan_end

.layer_1A35:
layer_note1 39, 0x32, 127
layer_end

.chan_1A39:
chan_setbank 6
chan_setinstr 2
chan_setlayer 0, .layer_1A44
chan_setlayer 1, .layer_1A44
chan_end

.layer_1A44:
layer_transpose 7
layer_call .layer_fn_1A4B
layer_transpose 254

.layer_fn_1A4B:
layer_portamento 0x83, 31, 255
layer_note1 51, 0x6, 127
layer_note1 56, 0xc, 127
layer_end

.chan_1A56:
chan_setbank 9
chan_setinstr 6
chan_setval 10
chan_call .set_reverb
chan_setlayer 0, .layer_1A66
chan_setlayer 1, .layer_1A66
chan_end

.layer_1A66:
layer_portamento 0x82, 39, 255
layer_note1 31, 0x60, 100
layer_end

.chan_1A6E:
chan_setbank 4
chan_setinstr 14
chan_setlayer 0, .layer_1A79
chan_setlayer 1, .layer_1A7D
chan_end

.layer_1A79:
layer_transpose 3
layer_delay 0x5

.layer_1A7D:
layer_somethingon
layer_portamento 0x85, 31, 255
layer_note1 34, 0x12c, 127
layer_end

.chan_1A87:
chan_setbank 4
chan_setinstr 14
chan_setenvelope .envelope_3358
chan_setlayer 0, .layer_1AA0
chan_setval 1
chan_call .delay
chan_setenvelope .envelope_3358
chan_setlayer 1, .layer_1AAA
chan_setlayer 2, .layer_1AA8
chan_end

.layer_1AA0:
layer_portamento 0x81, 32, 64
layer_note1 38, 0x46, 127
layer_end

.layer_1AA8:
layer_delay 0x4

.layer_1AAA:
layer_delay 0x4
layer_portamento 0x81, 36, 40
layer_note1 41, 0xc, 127
layer_end

.ifdef VERSION_JP
  .chan_1AB4_jp:
  chan_setbank 9
  chan_setinstr 0
  chan_setenvelope .envelope_3438
  chan_setvibratorate 25
  chan_setvibratoextent 110
  chan_setlayer 0, .layer_1943_jp
  chan_setval 40
  chan_call .delay
  chan_end

  .layer_1943_jp:
  layer_portamento 0x1, 32, 0x7f
  layer_note1 60, 0x28, 100
  layer_end
.else
  .chan_1AB4:
  chan_setbank 4
  chan_setinstr 2
  chan_setlayer 0, .layer_1AC1
  chan_setlayer 1, .layer_1ABF
  chan_end

  .layer_1ABF:
  layer_transpose 12

  .layer_1AC1:
  layer_portamento 0x81, 7, 255
  layer_note1 15, 0x3c, 127
  layer_portamento 0x81, 20, 200
  layer_note1 7, 0x5a, 127
  layer_end

  .chan_1AD0:
  chan_setbank 9
  chan_setinstr 3
  chan_setvibratoextent 70
  chan_setvibratorate 70
  chan_setenvelope .envelope_32E4
  chan_setlayer 0, .layer_1AEB
  chan_setlayer 1, .layer_1AE9
  chan_setval 35
  chan_call .delay
  chan_setvibratoextent 0
  chan_end

  .layer_1AE9:
  layer_transpose 1

  .layer_1AEB:
  layer_portamento 0x81, 19, 255
  layer_note1 31, 0x32, 115
  layer_end
.endif

.channel4_table:
sound_ref .chan_1B43
sound_ref .chan_1B43
sound_ref .chan_1B5D
sound_ref .chan_1B6D
sound_ref .chan_1B6D
sound_ref .chan_1B7D
sound_ref .chan_1BCD
sound_ref .chan_1BE5
sound_ref .chan_1BFF
sound_ref .chan_1C0F
sound_ref .chan_1C46
sound_ref .chan_1C5F
sound_ref .chan_1C72
sound_ref .chan_1CBB
sound_ref .chan_1CCD
sound_ref .chan_1CEA
sound_ref .chan_1D04
sound_ref .chan_2A17
sound_ref .chan_1D42
sound_ref .chan_1D5A
sound_ref .chan_1D6F
sound_ref .chan_1D81
sound_ref .chan_1DB8
sound_ref .chan_1DFF
sound_ref .chan_1E1A
sound_ref .chan_1E35
sound_ref .chan_1B5D
sound_ref .chan_1B6D
sound_ref .chan_1B43
sound_ref .chan_1B43
sound_ref .chan_1B43
sound_ref .chan_1B43
sound_ref .chan_10A7
sound_ref .chan_1770
sound_ref .chan_1B5D
sound_ref .chan_1B6D
sound_ref .chan_1B43
sound_ref .chan_1B43
sound_ref .chan_1B43
sound_ref .chan_1B43

.chan_1B43:
chan_setbank 5
chan_setinstr 1
chan_setval 25
chan_call .set_reverb
.ifdef VERSION_JP
  chan_setenvelope .envelope_32E4
.else
  chan_setenvelope .envelope_32C4
.endif
chan_setlayer 0, .layer_1B53
chan_end

.layer_1B53:
layer_somethingon
.ifdef VERSION_JP
  layer_delay 0x6
.else
  layer_delay 0x4
.endif
.layer_1B56:
layer_note1 41, 0x12c, 95
layer_jump .layer_1B56

.chan_1B5D:
chan_setbank 5
chan_setinstr 2
chan_setlayer 0, .layer_1B65
chan_end

.layer_1B65:
layer_somethingon
.layer_1B66:
layer_note1 39, 0x12c, 90
layer_jump .layer_1B66

.chan_1B6D:
chan_setbank 5
chan_setinstr 3
chan_setlayer 0, .layer_1B75
chan_end

.layer_1B75:
layer_somethingon
.layer_1B76:
layer_note1 44, 0x12c, 105
layer_jump .layer_1B76

.chan_1B7D:
chan_setbank 5
chan_setinstr 6
chan_setdecayrelease 13
chan_setlayer 0, .layer_1B8A
chan_setlayer 1, .layer_1B8C
chan_end

.layer_1B8A:
layer_transpose 244

.layer_1B8C:
layer_somethingon
layer_portamento 0x85, 39, 255
.layer_1B91:
layer_note1 44, 0x18, 110
layer_note1 38, 0x3c, 110
layer_note1 47, 0xa, 110
layer_note1 49, 0x32, 110
layer_note1 40, 0x4b, 110
layer_note1 37, 0x14, 110
layer_note1 46, 0xc, 110
layer_note1 48, 0x1f, 110
layer_note1 55, 0x18, 110
layer_note1 46, 0x40, 110
layer_note1 36, 0xc, 110
layer_note1 39, 0xa, 110
layer_note1 36, 0xe, 110
layer_note1 39, 0xc, 110
layer_note1 32, 0x54, 110
layer_note1 39, 0xa, 110
layer_note1 36, 0x2b, 110
layer_note1 41, 0x60, 110
layer_note1 39, 0x22, 110
layer_jump .layer_1B91

.chan_1BCD:
chan_setbank 3
chan_setinstr 2
chan_setlayer 0, .layer_1BD5
chan_end

.layer_1BD5:
layer_somethingon
layer_portamento 0x85, 36, 255
.layer_1BDA:
layer_note1 34, 0x12c, 95
layer_note1 36, 0x12c, 95
layer_jump .layer_1BDA

.chan_1BE5:
chan_setbank 6
chan_setinstr 15
chan_setlayer 0, .layer_1BED
chan_end

.layer_1BED:
layer_somethingon
layer_note1 43, 0xc, 127
layer_portamento 0x81, 44, 255
layer_note1 43, 0x50, 127
.layer_1BF8:
layer_note1 43, 0x12c, 127
layer_jump .layer_1BF8

.chan_1BFF:
chan_setbank 5
chan_setinstr 2
chan_setlayer 0, .layer_1C07
chan_end

.layer_1C07:
layer_somethingon
.layer_1C08:
layer_note1 27, 0x12c, 100
layer_jump .layer_1C08

.chan_1C0F:
chan_setbank 4
chan_setinstr 5
chan_setenvelope .envelope_32E4
chan_setdecayrelease 25
chan_setlayer 0, .layer_1C1C
chan_end

.layer_1C1C:
layer_transpose 6
layer_portamento 0x85, 39, 255
.layer_1C22:
layer_note1 39, 0x18, 127
layer_note1 31, 0x36, 127
layer_note1 43, 0xc, 127
layer_note1 36, 0x32, 127
layer_note1 27, 0x50, 127
layer_note1 36, 0x37, 127
layer_note1 34, 0x40, 127
layer_note1 32, 0x3d, 127
layer_note1 29, 0x4a, 127
layer_note1 32, 0x31, 127
layer_note1 38, 0x1f, 127
layer_jump .layer_1C22

.chan_1C46:
chan_setbank 6
chan_setinstr 15
chan_setlayer 0, .layer_1C4E
chan_end

.layer_1C4E:
layer_somethingon
layer_portamento 0x85, 39, 255
layer_note1 42, 0x3c, 127
.layer_1C56:
layer_note1 41, 0x3c, 127
layer_note1 42, 0x3c, 127
layer_jump .layer_1C56

.chan_1C5F:
chan_setbank 4
chan_setinstr 2
chan_setdecayrelease 30
chan_setlayer 0, .layer_1C69
chan_end

.layer_1C69:
layer_portamento 0x81, 15, 255
.ifdef VERSION_JP
  layer_note1 11, 0x1f4, 100
.else
  layer_note1 11, 0x1f4, 127
.endif
layer_end

.chan_1C72:
chan_setbank 5
chan_setinstr 5
chan_setenvelope .envelope_3368
chan_setval 45
chan_call .set_reverb
chan_setlayer 0, .layer_1C82
chan_end

.layer_1C82:
layer_call .layer_fn_1CA3
layer_delay 0xb
layer_call .layer_fn_1CA3
layer_delay 0x9
layer_call .layer_fn_1CA3
layer_delay 0x8
layer_call .layer_fn_1CA3
layer_delay 0x6
layer_call .layer_fn_1CA3
layer_delay 0x5
.layer_1C9B:
layer_call .layer_fn_1CA3
layer_delay 0x3
layer_jump .layer_1C9B

.layer_fn_1CA3:
layer_transpose 0
layer_setinstr 4
layer_note1 22, 0x6, 127
layer_transpose 36
layer_setinstr 5
layer_somethingon
layer_portamento 0x85, 51, 255
layer_note1 41, 0x5, 77
layer_delay 0x4
layer_disableportamento
layer_somethingoff
layer_end

.chan_1CBB:
chan_setbank 4
chan_setinstr 2
chan_setlayer 0, .layer_1CC3
chan_end

.layer_1CC3:
layer_portamento 0x81, 19, 10
layer_note1 8, 0x9, 127
layer_jump .layer_1CC3

.chan_1CCD:
chan_setbank 3
chan_setinstr 7
chan_setdecayrelease 5
chan_setlayer 0, .layer_1CE2
chan_setlayer 1, .layer_1CDA
chan_end

.layer_1CDA:
layer_somethingon
.layer_1CDB:
layer_note1 47, 0x1f4, 90
layer_jump .layer_1CDB

.layer_1CE2:
layer_somethingon
.layer_1CE3:
layer_note1 46, 0x1f4, 90
layer_jump .layer_1CE3

.chan_1CEA:
chan_setbank 4
chan_setinstr 2
chan_setdecayrelease 30
chan_setlayer 0, .layer_1CF9
chan_setlayer 1, .layer_1CF7
chan_end

.layer_1CF7:
layer_transpose 6

.layer_1CF9:
layer_portamento 0x85, 7, 255
layer_note1_long 13, 0x46, 120
layer_jump .layer_1CF9

.chan_1D04:
chan_setbank 5
chan_setinstr 6
chan_setdecayrelease 13
chan_setlayer 0, .layer_1D11
chan_setlayer 1, .layer_1D13
chan_end

.layer_1D11:
layer_transpose 250

.layer_1D13:
layer_somethingon
layer_portamento 0x85, 34, 255
.layer_1D18:
layer_note1 51, 0x18, 110
layer_note1 43, 0x63, 110
layer_note1 47, 0xa, 110
layer_note1 49, 0x32, 110
layer_note1 41, 0x4b, 110
layer_note1 46, 0xc, 110
layer_note1 48, 0x1f, 110
layer_note1 55, 0x7f, 110
layer_note1 46, 0x63, 110
layer_note1 43, 0xa, 110
layer_note1 39, 0xc, 110
layer_note1 41, 0x60, 110
layer_note1 39, 0x22, 110
layer_jump .layer_1D18

.chan_1D42:
chan_setbank 4
chan_setinstr 2
chan_setbank 6
chan_setenvelope .envelope_3314
chan_setdecayrelease 200
chan_setlayer 0, .layer_1D51
chan_end

.layer_1D51:
layer_transpose 3
.layer_1D53:
layer_note0 62, 0x2, 127, 127
layer_jump .layer_1D53

.chan_1D5A:
chan_setbank 3
chan_setinstr 1
chan_setenvelope .envelope_32E4
chan_setdecayrelease 15
chan_setlayer 0, .layer_1D67
chan_end

.layer_1D67:
layer_somethingon
.layer_1D68:
layer_note1 44, 0x12c, 95
layer_jump .layer_1D68

.chan_1D6F:
chan_setbank 4
chan_setinstr 14
chan_setlayer 0, .layer_1D77
chan_end

.layer_1D77:
layer_portamento 0x81, 38, 127
layer_note1 39, 0x9, 127
layer_jump .layer_1D77

.chan_1D81:
chan_setval 50
chan_call .set_reverb
chan_setbank 4
chan_setinstr 15
chan_setlayer 0, .layer_1DA5
chan_setval 1
chan_call .delay
chan_setbank 6
chan_setinstr 15
chan_setlayer 1, .layer_1DAD
chan_setval 1
chan_call .delay
chan_setbank 4
chan_setinstr 15
chan_setdecayrelease 10
chan_end

.layer_1DA5:
layer_note1 21, 0xc, 127
layer_note1 18, 0x226, 127
layer_end

.layer_1DAD:
layer_transpose 24
layer_portamento 0x82, 19, 255
layer_note1 20, 0x1f4, 127
layer_end

.chan_1DB8:
chan_setbank 3
chan_setinstr 2
chan_setenvelope .envelope_32E4
chan_setlayer 0, .layer_1DD4
chan_setval 1
chan_call .delay
chan_setbank 4
chan_setinstr 5
chan_setdecayrelease 20
chan_setlayer 1, .layer_1DE4
chan_setlayer 2, .layer_1DE2
chan_end

.layer_1DD4:
layer_transpose 244
layer_somethingon
layer_portamento 0x82, 39, 255
.layer_1DDB:
layer_note1 46, 0x2710, 80
layer_jump .layer_1DDB

.layer_1DE2:
layer_transpose 6

.layer_1DE4:
layer_portamento 0x83, 20, 255
layer_note1 15, 0x5a, 127
layer_note1 32, 0x2d, 127
layer_note1 29, 0x46, 127
layer_note1 24, 0x78, 127
layer_note1 32, 0x44, 127
layer_note1 24, 0x74, 127
layer_transpose 7
layer_jump .layer_1DE4

.chan_1DFF:
chan_setbank 6
chan_setinstr 1
chan_setlayer 0, .layer_1E0C
chan_setlayer 1, .layer_1E12
chan_setdecayrelease 127
chan_end

.layer_1E0C:
layer_note1 24, 0xc, 85
layer_jump .layer_1E0C

.layer_1E12:
layer_setinstr 15
.layer_1E14:
layer_note1 39, 0x10, 115
layer_jump .layer_1E14

.chan_1E1A:
chan_setbank 3
chan_setinstr 6
chan_setenvelope .envelope_32E4
chan_setlayer 0, .layer_1E28
chan_setlayer 1, .layer_1E28
chan_end

.layer_1E28:
layer_portamento 0x81, 38, 80
layer_somethingon
.layer_1E2D:
layer_note1 35, 0x12c, 100
layer_jump .layer_1E2D
layer_end

.chan_1E35:
chan_setbank 5
chan_setinstr 15
chan_setenvelope .envelope_32E4
chan_setdecayrelease 8
chan_setlayer 0, .layer_1E42
chan_end

.layer_1E42:
layer_somethingon
layer_portamento 0x82, 20, 255
.layer_1E47:
layer_note1 43, 0x1b58, 63
layer_jump .layer_1E47

.channel59_table:
sound_ref .chan_113D
sound_ref .chan_1F61
sound_ref .chan_1F7D
sound_ref .chan_1F8D
sound_ref .chan_1FAC
sound_ref .chan_1FC4
sound_ref .chan_1FE0
sound_ref .chan_1FF2
sound_ref .chan_1FFE
sound_ref .chan_200A
sound_ref .chan_201A
sound_ref .chan_2026
sound_ref .chan_2035
sound_ref .chan_2059
sound_ref .chan_2066
sound_ref .chan_2073
sound_ref .chan_207F
sound_ref .chan_209A
sound_ref .chan_20A6
sound_ref .chan_20B2
sound_ref .chan_20BE
sound_ref .chan_20CA
sound_ref .chan_20DC
sound_ref .chan_20FB
sound_ref .chan_2107
sound_ref .chan_212E
sound_ref .chan_213A
sound_ref .chan_2146
sound_ref .chan_2158
sound_ref .chan_2177
sound_ref .chan_218E
sound_ref .chan_21A1
sound_ref .chan_21B8
sound_ref .chan_21D6
sound_ref .chan_21E4
sound_ref .chan_21FF
sound_ref .chan_2211
sound_ref .chan_2224
sound_ref .chan_2235
sound_ref .chan_2248
sound_ref .chan_2260
sound_ref .chan_2277
sound_ref .chan_2293
sound_ref .chan_22A5
sound_ref .chan_22B7
sound_ref .chan_22D2
sound_ref .chan_22E6
sound_ref .chan_22FF
sound_ref .chan_2321
sound_ref .chan_233D
sound_ref .chan_2361
sound_ref .chan_237E
sound_ref .chan_2391
sound_ref .chan_23A2
sound_ref .chan_23B0
sound_ref .chan_23C0
sound_ref .chan_23DF
sound_ref .chan_23F8
sound_ref .chan_2408
sound_ref .chan_241F
sound_ref .chan_242F
sound_ref .chan_2441
sound_ref .chan_2459
sound_ref .chan_246E
sound_ref .chan_2482
sound_ref .chan_2492
sound_ref .chan_24BA
sound_ref .chan_24D4
sound_ref .chan_24E2
sound_ref .chan_24F2
sound_ref .chan_2508
sound_ref .chan_2518
sound_ref .chan_2531
sound_ref .chan_2542
sound_ref .chan_2552
sound_ref .chan_2570
sound_ref .chan_2580
sound_ref .chan_25A7
sound_ref .chan_25BB
sound_ref .chan_25DB
sound_ref .chan_31A6
sound_ref .chan_31DE
sound_ref .chan_3214
sound_ref .chan_3248
sound_ref .chan_25FE
sound_ref .chan_2611
sound_ref .chan_2624
sound_ref .chan_265D
sound_ref .chan_2671
sound_ref .chan_26A9
sound_ref .chan_26BC
sound_ref .chan_26CF
sound_ref .chan_26DF
sound_ref .chan_26FA
sound_ref .chan_2771
sound_ref .chan_270A
sound_ref .chan_2726
sound_ref .chan_2736
sound_ref .chan_2751
sound_ref .chan_2761
sound_ref .chan_2781
sound_ref .chan_2788
sound_ref .chan_279C
sound_ref .chan_27BB
sound_ref .chan_27DC
sound_ref .chan_27E9
sound_ref .chan_27FC
sound_ref .chan_2810
sound_ref .chan_2827
sound_ref .chan_2846
sound_ref .chan_2865
sound_ref .chan_2890
sound_ref .chan_28C7
sound_ref .chan_28E3
sound_ref .chan_28FE
sound_ref .chan_2922
sound_ref .chan_2942
sound_ref .chan_1FC4
sound_ref .chan_1FE0
sound_ref .chan_1FF2
sound_ref .chan_2482
sound_ref .chan_2492
sound_ref .chan_1F7D
sound_ref .chan_1F8D
sound_ref .chan_1FAC
sound_ref .chan_1FC4
sound_ref .chan_1FE0
sound_ref .chan_1FF2

.chan_1F4E:
chan_setbank 6
chan_setinstr 5
chan_setlayer 0, .layer_1F56
chan_end

.layer_1F56:
layer_note1 27, 0x8, 90
layer_portamento 0x81, 43, 255
layer_note1 27, 0x21, 90
layer_end

.chan_1F61:
chan_setbank 7
chan_setinstr 3
chan_setlayer 0, .layer_1F72
chan_setval 1
chan_call .delay
chan_setbank 6
chan_setinstr 0
chan_end

.layer_1F72:
layer_note1 43, 0xf, 90
layer_portamento 0x82, 27, 255
layer_note1 36, 0xb, 90
layer_end

.chan_1F7D:
chan_setbank 6
chan_setinstr 7
chan_setlayer 0, .layer_1F85
chan_end

.layer_1F85:
layer_portamento 0x81, 43, 255
layer_note1 48, 0x30, 110
layer_end

.chan_1F8D:
chan_setbank 6
chan_setinstr 1
chan_setval 60
chan_call .set_reverb
chan_setlayer 0, .layer_1F9D
chan_setlayer 1, .layer_1FA6
chan_end

.layer_1F9D:
layer_note1 36, 0x8, 120
layer_note1 35, 0x28, 120
layer_delay 0x30
layer_end

.layer_1FA6:
layer_delay 0x18
layer_note1 0, 0x1e, 95
layer_end

.chan_1FAC:
chan_setbank 6
chan_setinstr 2
chan_setval 10
chan_call .set_reverb
chan_setlayer 0, .layer_1FC0
chan_setlayer 1, .layer_1FBC
chan_end

.layer_1FBC:
layer_delay 0x3
layer_transpose 5

.layer_1FC0:
layer_note1 39, 0x7f, 127
layer_end

.chan_1FC4:
chan_setbank 6
chan_setinstr 2
chan_setval 10
chan_call .set_reverb
chan_setlayer 0, .layer_1FD8
chan_setlayer 1, .layer_1FD4
chan_end

.layer_1FD4:
layer_delay 0x3
layer_transpose 5

.layer_1FD8:
layer_portamento 0x81, 45, 255
layer_note1 33, 0x30, 127
layer_end

.chan_1FE0:
chan_setbank 6
chan_setinstr 4
chan_setval 10
chan_call .set_reverb
chan_setlayer 0, .layer_1FED
chan_end

.layer_1FED:
layer_note1 32, 0x104, 127
layer_end

.chan_1FF2:
chan_setbank 6
chan_setinstr 5
chan_setlayer 0, .layer_1FFA
chan_end

.layer_1FFA:
layer_note1 32, 0x28, 127
layer_end

.chan_1FFE:
chan_setbank 6
chan_setinstr 6
chan_setlayer 0, .layer_2006
chan_end

.layer_2006:
layer_note1 36, 0x5a, 127
layer_end

.chan_200A:
chan_setbank 6
chan_setinstr 7
chan_setlayer 0, .layer_2012
chan_end

.layer_2012:
layer_portamento 0x81, 39, 255
layer_note1 36, 0x26, 100
layer_end

.chan_201A:
chan_setbank 6
chan_setinstr 8
chan_setlayer 0, .layer_2022
chan_end

.layer_2022:
layer_note1 39, 0x18, 127
layer_end

.chan_2026:
chan_setbank 6
chan_setinstr 9
chan_setlayer 0, .layer_202E
chan_end

.layer_202E:
layer_note1 50, 0xa, 127
layer_note1 55, 0xa, 127
layer_end

.chan_2035:
chan_setbank 7
chan_setinstr 12
chan_setval 55
chan_call .set_reverb
chan_setlayer 0, .layer_2055
chan_setval 1
chan_call .delay
chan_setbank 6
chan_setinstr 1
chan_setlayer 1, .layer_204E
chan_end

.layer_204E:
layer_note1 37, 0xc, 127
layer_note1 31, 0x1e, 127
layer_end

.layer_2055:
layer_note1 31, 0x2a, 127
layer_end

.chan_2059:
chan_setbank 6
chan_setinstr 10
chan_setlayer 0, .layer_2061
chan_end

.layer_2061:
layer_note1 39, 0xd2, 127
layer_end

.chan_2066:
chan_setbank 6
chan_setinstr 11
chan_setlayer 0, .layer_206E
chan_end

.layer_206E:
layer_note1 39, 0xd2, 127
layer_end

.chan_2073:
chan_setbank 6
chan_setinstr 12
chan_setlayer 0, .layer_207B
chan_end

.layer_207B:
layer_note1 39, 0x24, 127
layer_end

.chan_207F:
chan_setbank 6
chan_setinstr 11
chan_setlayer 0, .layer_2087
chan_end

.layer_2087:
layer_portamento 0x81, 33, 255
layer_note1 57, 0x4, 127
layer_transpose 252
layer_portamento 0x81, 57, 255
layer_note1 33, 0x6, 127
layer_delay 0x14
layer_end

.chan_209A:
chan_setbank 6
chan_setinstr 14
chan_setlayer 0, .layer_20A2
chan_end

.layer_20A2:
layer_note1 39, 0x48, 110
layer_end

.chan_20A6:
chan_setbank 4
chan_setinstr 5
chan_setlayer 0, .layer_20AE
chan_end

.layer_20AE:
layer_note1 59, 0x24, 105
layer_end

.chan_20B2:
chan_setbank 6
chan_setinstr 15
chan_setlayer 0, .layer_20BA
chan_end

.layer_20BA:
layer_note1 39, 0x4c, 127
layer_end

.chan_20BE:
chan_setbank 7
chan_setinstr 0
chan_setlayer 0, .layer_20C6
chan_end

.layer_20C6:
layer_note1 39, 0x18, 105
layer_end

.chan_20CA:
chan_setbank 6
chan_setinstr 1
chan_setlayer 0, .layer_20D2
chan_end

.layer_20D2:
layer_portamento 0x81, 44, 255
.ifdef VERSION_JP
  layer_note1 36, 0x18, 90
.else
  layer_note1 36, 0x18, 115
.endif
layer_delay 0x32
layer_end

.chan_20DC:
chan_setbank 7
chan_setinstr 12
chan_setlayer 0, .layer_20F0
chan_setval 1
chan_call .delay
chan_setbank 6
chan_setinstr 1
chan_setlayer 1, .layer_20F4
chan_end

.layer_20F0:
layer_note1 31, 0x26, 127
layer_end

.layer_20F4:
.ifdef VERSION_JP
  layer_note1 38, 0x8, 120
  layer_note1 33, 0x1e, 120
.else
  layer_note1 38, 0x8, 127
  layer_note1 33, 0x1e, 127
.endif
layer_end

.chan_20FB:
chan_setbank 7
chan_setinstr 1
chan_setlayer 0, .layer_2103
chan_end

.layer_2103:
layer_note1 39, 0x24, 120
layer_end

.chan_2107:
chan_setbank 4
chan_setinstr 15
chan_setenvelope .envelope_33EC
chan_setlayer 0, .layer_211C
chan_setlayer 1, .layer_2126
chan_setlayer 2, .layer_2124
chan_setval 1
chan_setdecayrelease 10
chan_end

.layer_211C:
layer_portamento 0x81, 51, 255
layer_note1 20, 0x2e, 115
layer_end

.layer_2124:
layer_transpose 3

.layer_2126:
layer_setinstr 5
layer_delay 0xa
layer_note1 48, 0x23, 127
layer_end

.chan_212E:
chan_setbank 7
chan_setinstr 2
chan_setlayer 0, .layer_2136
chan_end

.layer_2136:
layer_note1 39, 0xc, 105
layer_end

.chan_213A:
chan_setbank 7
chan_setinstr 3
chan_setlayer 0, .layer_2142
chan_end

.layer_2142:
layer_note1 39, 0x68, 127
layer_end

.chan_2146:
chan_setbank 7
chan_setinstr 3
chan_setlayer 0, .layer_214E
chan_end

.layer_214E:
layer_portamento 0x82, 38, 127
layer_note1 51, 0x4, 80
layer_delay 0x1e
layer_end

.chan_2158:
chan_setbank 7
chan_setinstr 12
chan_setlayer 0, .layer_2160
chan_end

.layer_2160:
layer_portamento 0x83, 33, 255
layer_note0 40, 0xf, 127, 127
layer_note1 26, 0x20, 127
layer_end

.layer_unused_216C:
layer_portamento 0x83, 27, 255
layer_note1 22, 0x9, 127
layer_note1 24, 0x1c, 127
layer_end

.chan_2177:
chan_setbank 7
chan_setinstr 3
chan_setlayer 0, .layer_217F
chan_end

.layer_217F:
layer_portamento 0x81, 27, 255
layer_note1 48, 0x9, 100
layer_portamento 0x81, 27, 255
layer_note1 48, 0x5, 100
layer_end

.chan_218E:
chan_setbank 6
chan_setinstr 5
chan_setlayer 0, .layer_2196
chan_end

.layer_2196:
layer_note1 36, 0x8, 90
layer_portamento 0x81, 43, 255
layer_note1 27, 0x14, 90
layer_end

.chan_21A1:
chan_setbank 6
chan_setinstr 7
chan_setlayer 0, .layer_21A9
chan_end

.layer_21A9:
layer_portamento 0x81, 39, 255
layer_note1 44, 0xc, 110
layer_portamento 0x81, 46, 255
layer_note1 58, 0x30, 110
layer_end

.chan_21B8:
chan_setbank 6
chan_setinstr 12
chan_setlayer 0, .layer_21C9
chan_setval 1
chan_call .delay
chan_setbank 0
chan_setinstr 4
chan_end

.layer_21C9:
layer_portamento 0x82, 24, 255
layer_note1 12, 0x4, 100
layer_note1 51, 0x8, 80
layer_delay 0x1e
layer_end

.chan_21D6:
chan_setbank 7
chan_setinstr 7
chan_setdecayrelease 15
chan_setlayer 0, .layer_21E0
chan_end

.layer_21E0:
layer_note1 39, 0x30, 127
layer_end

.chan_21E4:
chan_setbank 9
chan_setinstr 3
chan_setenvelope .envelope_3428
chan_setval 10
chan_call .set_reverb
chan_setlayer 0, .layer_21F4
chan_end

.layer_21F4:
layer_portamento 0x85, 48, 255
layer_note1 60, 0x7, 115
layer_note1 39, 0x23, 115
layer_end

.chan_21FF:
chan_setbank 4
chan_setinstr 13
chan_setlayer 0, .layer_2207
chan_end

.layer_2207:
layer_portamento 0x81, 27, 255
layer_note1 3, 0x14, 115
layer_delay 0x1e
layer_end

.chan_2211:
chan_setbank 7
chan_setinstr 0
chan_setlayer 0, .layer_2219
chan_end

.layer_2219:
layer_note1 43, 0x6, 105
layer_portamento 0x81, 32, 255
layer_note1 44, 0x18, 105
layer_end

.chan_2224:
chan_setbank 7
chan_setinstr 3
chan_setval 15
chan_call .set_reverb
chan_setlayer 0, .layer_2231
chan_end

.layer_2231:
layer_note1 48, 0x55, 127
layer_end

.chan_2235:
chan_setbank 7
chan_setinstr 8
chan_setlayer 0, .layer_223D
chan_end

.layer_223D:
layer_note1 44, 0xc, 100
layer_portamento 0x81, 44, 255
layer_note1 32, 0x18, 105
layer_end

.chan_2248:
chan_setbank 9
chan_setinstr 1
chan_setenvelope .envelope_32D4
chan_setlayer 0, .layer_2253
chan_end

.layer_2253:
layer_portamento 0x83, 46, 255
layer_note1 27, 0x5, 127
layer_note1 32, 0x3, 127
layer_delay 0x22
layer_end

.chan_2260:
chan_setbank 9
chan_setinstr 3
chan_setenvelope .envelope_3428
chan_setlayer 0, .layer_226B
chan_end

.layer_226B:
layer_somethingon
layer_portamento 0x85, 62, 255
layer_note1 50, 0x24, 93
layer_note1 26, 0x3c, 93
layer_end

.chan_2277:
chan_setbank 4
chan_setinstr 5
chan_setlayer 0, .layer_2288
chan_setval 1
chan_call .delay
chan_setbank 2
chan_setinstr 0
chan_end

.layer_2288:
layer_note1 62, 0x4, 105
layer_portamento 0x81, 43, 200
layer_note1 36, 0x4e, 127
layer_end

.chan_2293:
chan_setbank 3
chan_setinstr 5
chan_setenvelope .envelope_32D4
chan_setlayer 0, .layer_229E
chan_end

.layer_229E:
layer_note1 41, 0x6, 100
layer_note1 24, 0x1c, 100
layer_end

.chan_22A5:
chan_setbank 3
chan_setinstr 5
chan_setenvelope .envelope_32D4
chan_setlayer 0, .layer_22B0
chan_end

.layer_22B0:
layer_note1 36, 0x5, 100
layer_note1 44, 0x18, 100
layer_end

.chan_22B7:
chan_setbank 0
chan_setinstr 4
chan_setenvelope .envelope_32D4
chan_setval 25
chan_call .set_reverb
chan_setlayer 0, .layer_22C7
chan_end

.layer_22C7:
layer_somethingon
layer_portamento 0x81, 39, 255
layer_note1 62, 0x1b, 107
layer_delay 0x12
layer_end

.chan_22D2:
chan_setbank 7
chan_setinstr 10
chan_setlayer 0, .layer_22DA
chan_end

.layer_22DA:
layer_somethingon
layer_portamento 0x85, 41, 255
layer_note1 45, 0x28, 127
layer_note1 41, 0xf, 127
layer_end

.chan_22E6:
chan_setbank 7
chan_setinstr 11
chan_setenvelope .envelope_32D4
chan_setlayer 0, .layer_22F3
chan_end

.layer_unused_22F1:
layer_transpose 244

.layer_22F3:
layer_somethingon
layer_portamento 0x85, 39, 255
layer_note1 32, 0xc, 127
layer_note1 39, 0x60, 127
layer_end

.chan_22FF:
chan_setbank 9
chan_setinstr 3
chan_setval 20
chan_call .set_reverb
chan_setenvelope .envelope_33EC
chan_setlayer 0, .layer_230F
chan_end

.layer_230F:
layer_transpose 232
layer_somethingon
layer_portamento 0x85, 25, 255
layer_note1 3, 0xf, 85
layer_transpose 0
layer_note1 51, 0x1c, 85
layer_delay 0x19
layer_end

.chan_2321:
chan_setbank 9
chan_setinstr 3
chan_setenvelope .envelope_3428
chan_setlayer 0, .layer_232C
chan_end

.layer_232C:
layer_transpose 253
layer_somethingon
layer_portamento 0x85, 24, 255
layer_note1 17, 0xa, 100
layer_note1 32, 0xa, 100
layer_note1 27, 0x6, 100
layer_end

.chan_233D:
chan_setbank 6
chan_setinstr 5
chan_setenvelope .envelope_32D4
chan_setlayer 0, .layer_2348
chan_end

.layer_2348:
layer_transpose 10
layer_call .layer_fn_2353
layer_call .layer_fn_2353
layer_delay 0x14
layer_end

.layer_fn_2353:
layer_portamento 0x85, 52, 255
layer_note1 48, 0x4, 115
layer_note1 52, 0x2, 115
layer_delay 0x2
layer_disableportamento
layer_end

.chan_2361:
chan_setbank 2
chan_setlayer 0, .layer_236A
chan_setlayer 1, .layer_2374
chan_end

.layer_236A:
layer_setinstr 0
layer_portamento 0x82, 44, 255
layer_note1 43, 0x54, 100
layer_end

.layer_2374:
layer_setinstr 1
layer_portamento 0x82, 32, 255
layer_note1 31, 0x54, 100
layer_end

.chan_237E:
chan_setbank 3
chan_setinstr 0
chan_setenvelope .envelope_3324
chan_setlayer 0, .layer_2389
chan_end

.layer_2389:
layer_portamento 0x81, 62, 255
layer_note1 38, 0x7f, 117
layer_end

.chan_2391:
chan_setbank 7
chan_setinstr 3
chan_setlayer 0, .layer_2399
chan_end

.layer_2399:
layer_note1 27, 0x6, 100
layer_note1 29, 0x3, 70
layer_delay 0x1e
layer_end

.chan_23A2:
chan_setbank 7
chan_setinstr 3
chan_setlayer 0, .layer_23AA
chan_end

.layer_23AA:
layer_note1 20, 0x4, 100
layer_delay 0x1e
layer_end

.chan_23B0:
chan_setbank 7
chan_setinstr 3
chan_setlayer 0, .layer_23B8
chan_end

.layer_23B8:
layer_portamento 0x82, 29, 255
layer_note1 46, 0xc, 80
layer_end

.chan_23C0:
chan_setbank 6
chan_setinstr 4
chan_setenvelope .envelope_32F4
chan_setlayer 0, .layer_23CD
chan_end

.layer_unused_23CB:
layer_transpose 12

.layer_23CD:
layer_somethingon
layer_portamento 0x85, 36, 255
layer_note1 48, 0x8, 100
layer_note1 45, 0x4, 100
layer_note1 48, 0xa, 100
layer_note1 41, 0x48, 100
layer_end

.chan_23DF:
chan_setbank 6
chan_setinstr 9
chan_setval 25
chan_call .set_reverb
chan_setlayer 0, .layer_23EF
chan_setlayer 1, .layer_23EF
chan_end

.layer_23EF:
layer_portamento 0x81, 20, 255
layer_note1 26, 0x12c, 127
layer_end

.chan_23F8:
chan_setbank 7
chan_setinstr 7
chan_setlayer 0, .layer_2400
chan_end

.layer_2400:
layer_portamento 0x81, 32, 221
layer_note1 34, 0xa, 115
layer_end

.chan_2408:
chan_setbank 7
chan_setinstr 7
chan_setlayer 0, .layer_2410
chan_end

.layer_2410:
layer_portamento 0x81, 34, 221
layer_note1 38, 0xc, 127
layer_portamento 0x82, 34, 221
layer_note1 39, 0x12, 127
layer_end

.chan_241F:
chan_setbank 1
chan_setinstr 1
chan_setlayer 0, .layer_2427
chan_end

.layer_2427:
layer_portamento 0x81, 58, 255
layer_note1 52, 0x6, 105
layer_end

.chan_242F:
chan_setbank 0
chan_setinstr 1
chan_setenvelope .envelope_32D4
chan_setlayer 0, .layer_243A
chan_end

.layer_243A:
layer_note1 43, 0x6, 90
layer_note1 44, 0x6, 90
layer_end

.chan_2441:
chan_setbank 7
chan_setinstr 8
chan_setlayer 0, .layer_2449
chan_end

.layer_2449:
layer_transpose 248
layer_call .layer_fn_244E

.layer_fn_244E:
layer_portamento 0x85, 44, 255
layer_note1 51, 0x9, 100
layer_note1 39, 0xc, 100
layer_end

.chan_2459:
chan_setbank 7
chan_setinstr 8
chan_setlayer 0, .layer_2461
chan_end

.layer_2461:
layer_transpose 10
layer_portamento 0x83, 32, 255
layer_note1 39, 0x6, 105
layer_note1 27, 0x12, 105
layer_end

.chan_246E:
chan_setbank 7
chan_setinstr 9
chan_setlayer 0, .layer_2476
chan_end

.layer_2476:
layer_somethingon
layer_portamento 0x83, 39, 255
layer_note1 41, 0x6, 127
layer_note1 37, 0x24, 127
layer_end

.chan_2482:
chan_setbank 7
chan_setinstr 9
chan_setlayer 0, .layer_248A
chan_end

.layer_248A:
layer_portamento 0x81, 48, 255
layer_note1 40, 0x24, 127
layer_end

.chan_2492:
chan_setbank 7
chan_setinstr 9
chan_setval 20
chan_call .set_reverb
chan_setlayer 0, .layer_249F
chan_end

.layer_249F:
layer_transpose 251
layer_call .layer_fn_24AF
layer_delay 0xb
layer_transpose 248
layer_call .layer_fn_24AF
layer_delay 0xa
layer_transpose 246

.layer_fn_24AF:
layer_portamento 0x85, 29, 255
layer_note1 24, 0x2, 127
layer_note1 41, 0x10, 127
layer_end

.chan_24BA:
chan_setbank 7
chan_setinstr 9
chan_setval 20
chan_call .set_reverb
chan_setlayer 0, .layer_24C7
chan_end

.layer_24C7:
layer_transpose 244
layer_portamento 0x85, 25, 255
layer_note1 39, 0x4, 127
layer_note1 29, 0x30, 127
layer_end

.chan_24D4:
chan_setbank 7
chan_setinstr 2
chan_setlayer 0, .layer_24DC
chan_end

.layer_24DC:
layer_note1 44, 0x4, 127
layer_delay 0x14
layer_end

.chan_24E2:
chan_setbank 9
chan_setinstr 3
chan_setlayer 0, .layer_24EA
chan_end

.layer_24EA:
layer_portamento 0x81, 24, 255
layer_note1 53, 0x12, 80
layer_end

.chan_24F2:
chan_setbank 7
chan_setinstr 10
chan_setenvelope .envelope_3344
chan_setlayer 0, .layer_24FD
chan_end

.layer_24FD:
layer_note1 50, 0x8, 105
layer_portamento 0x82, 46, 255
layer_note1 50, 0x30, 105
layer_end

.chan_2508:
chan_setbank 6
chan_setinstr 1
chan_setlayer 0, .layer_2510
chan_end

.layer_2510:
layer_portamento 0x81, 27, 255
layer_note1 43, 0x1e, 127
layer_end

.chan_2518:
chan_setbank 5
chan_setinstr 7
chan_setlayer 0, .layer_252C
chan_setval 1
chan_call .delay
chan_setbank 7
chan_setinstr 12
chan_setlayer 1, .layer_26D7
chan_end

.layer_252C:
layer_note1 34, 0xaf, 127
layer_end

.chan_2531:
chan_setbank 6
chan_setinstr 9
chan_setval 25
chan_call .set_reverb
chan_setlayer 0, .layer_253E
chan_end

.layer_253E:
layer_note1 55, 0x32, 127
layer_end

.chan_2542:
chan_setbank 7
chan_setinstr 7
chan_setlayer 0, .layer_254A
chan_end

.layer_254A:
layer_portamento 0x82, 51, 127
layer_note1 48, 0x6, 127
layer_end

.chan_2552:
chan_setbank 6
chan_setinstr 2
chan_setval 25
chan_call .set_reverb
chan_setlayer 0, .layer_2564
chan_setlayer 1, .layer_2562
chan_end

.layer_2562:
layer_delay 0x4

.layer_2564:
layer_somethingon
layer_portamento 0x85, 31, 255
layer_note1 34, 0x18, 127
layer_note1 17, 0x48, 127
layer_end

.chan_2570:
chan_setbank 4
chan_setinstr 15
chan_setlayer 0, .layer_257D
chan_setlayer 1, .layer_257B
chan_end

.layer_257B:
layer_transpose 4

.layer_257D:
layer_jump .layer_11BB

.chan_2580:
chan_setbank 9
chan_setinstr 3
chan_setval 24
chan_call .set_reverb
chan_setenvelope .envelope_3428
chan_setvibratoextent 80
chan_setvibratorate 60
chan_setlayer 0, .layer_259B
chan_setval 30
chan_call .delay
chan_setvibratoextent 0
chan_end

.layer_259B:
layer_somethingon
layer_portamento 0x85, 15, 255
layer_note1 3, 0x7, 100
layer_note1 36, 0x18, 100
layer_end

.chan_25A7:
chan_setbank 6
chan_setinstr 0
chan_setenvelope .envelope_32D4
chan_setlayer 0, .layer_25B2
chan_end

.layer_25B2:
layer_somethingon
layer_portamento 0x81, 44, 255
layer_note1 51, 0x8, 118
layer_end

.chan_25BB:
chan_setbank 6
chan_setinstr 7
chan_setlayer 0, .layer_25CC
chan_setval 1
chan_call .delay
chan_setbank 7
chan_setinstr 2
chan_end

.layer_25CC:
layer_portamento 0x81, 3, 255
layer_note1 39, 0x5, 127
layer_portamento 0x81, 27, 255
layer_note1 49, 0x6, 127
layer_end

.chan_25DB:
chan_setbank 6
chan_setinstr 7
chan_setlayer 0, .layer_25EC
chan_setval 1
chan_call .delay
chan_setbank 2
chan_setinstr 1
chan_end

.layer_25EC:
layer_portamento 0x81, 3, 255
layer_note1 39, 0x5, 127
layer_portamento 0x83, 36, 255
layer_note1 48, 0x6, 92
layer_note1 55, 0x30, 92
layer_end

.chan_25FE:
chan_setbank 3
chan_setinstr 0
chan_setenvelope .envelope_3324
chan_setlayer 0, .layer_2609
chan_end

.layer_2609:
layer_portamento 0x82, 62, 255
layer_note1 38, 0x60, 117
layer_end

.chan_2611:
chan_setbank 7
chan_setinstr 5
chan_setenvelope .envelope_32F4
chan_setlayer 0, .layer_261C
chan_end

.layer_261C:
layer_portamento 0x85, 41, 255
layer_note1 36, 0x18, 127
layer_end

.chan_2624:
chan_call .chan_207F
chan_setval 1
chan_call .delay
chan_setbank 7
chan_setinstr 13
chan_setlayer 1, .layer_2655
chan_setlayer 2, .layer_2659
chan_setval 11
chan_call .delay
chan_call .chan_1770
chan_setval 20
chan_call .delay
chan_setbank 1
chan_setinstr 4
chan_setlayer 0, .layer_264B
chan_end

.layer_264B:
layer_note1 37, 0x8, 96
layer_note1 41, 0x6, 96
layer_note1 32, 0x18, 96
layer_end

.layer_2655:
layer_note1 46, 0x32, 127
layer_end

.layer_2659:
layer_note1 39, 0x32, 127
layer_end

.chan_265D:
chan_setbank 7
chan_setinstr 12
chan_setlayer 0, .layer_2665
chan_end

.layer_2665:
layer_portamento 0x83, 27, 255
layer_note0 34, 0x12, 127, 127
layer_note1 20, 0x28, 127
layer_end

.chan_2671:
chan_setbank 8
chan_setinstr 12
chan_setvibratoextent 80
chan_setvibratorate 5
chan_setlayer 0, .layer_2684
chan_setval 88
chan_call .delay
chan_setvibratoextent 0
chan_end

.layer_2684:
layer_portamento 0x83, 44, 200
layer_note0 49, 0xc, 127, 127
layer_note0 40, 0x12, 127, 155
layer_note0 39, 0xb, 127, 127
layer_portamento 0x83, 41, 200
layer_note0 51, 0xa, 127, 127
layer_note0 48, 0x12, 127, 80
layer_note0 46, 0xa, 127, 127
layer_note0 48, 0xb, 127, 127
layer_end

.chan_26A9:
chan_setbank 9
chan_setinstr 3
chan_setlayer 0, .layer_26B1
chan_end

.layer_26B1:
layer_portamento 0x85, 31, 255
layer_note1 8, 0x6, 100
layer_note1 32, 0xc, 100
layer_end

.chan_26BC:
chan_setbank 7
chan_setinstr 12
chan_setlayer 0, .layer_26C7
chan_setlayer 1, .layer_26C7
chan_end

.layer_26C7:
layer_portamento 0x81, 32, 255
layer_note1 22, 0x24, 110
layer_end

.chan_26CF:
chan_setbank 7
chan_setinstr 12
chan_setlayer 0, .layer_26D7
chan_end

.layer_26D7:
layer_portamento 0x81, 26, 255
layer_note1 19, 0x60, 127
layer_end

.chan_26DF:
chan_setbank 6
chan_setinstr 7
chan_setlayer 0, .layer_26E7
chan_end

.layer_26E7:
layer_transpose 3
layer_note0 31, 0x8, 127, 70
layer_note0 30, 0x9, 127, 70
layer_note0 29, 0x8, 127, 70
layer_note0 28, 0x9, 127, 70
layer_end

.chan_26FA:
chan_setbank 6
chan_setinstr 11
chan_setlayer 0, .layer_2702
chan_end

.layer_2702:
layer_portamento 0x81, 12, 255
layer_note1 51, 0x24, 127
layer_end

.chan_270A:
chan_setbank 6
chan_setinstr 9
chan_setval 25
chan_call .set_reverb
chan_setlayer 0, .layer_271A
chan_setlayer 1, .layer_271A
chan_end

.layer_271A:
layer_delay 0xdc

.layer_271D:
layer_portamento 0x81, 20, 255
layer_note1 26, 0xc8, 110
layer_end

.chan_2726:
chan_call .chan_22B7
chan_setval 1
chan_call .delay
chan_setbank 7
chan_setinstr 8
chan_setlayer 1, .layer_223D
chan_end

.chan_2736:
chan_call .chan_22B7
chan_setval 1
chan_call .delay
chan_setbank 7
chan_setinstr 8
chan_setlayer 1, .layer_2746
chan_end

.layer_2746:
layer_note1 39, 0xe, 100
layer_portamento 0x81, 39, 255
layer_note1 27, 0x1c, 105
layer_end

.chan_2751:
chan_call .chan_22B7
chan_setval 1
chan_call .delay
chan_setbank 7
chan_setinstr 7
chan_setlayer 1, .layer_254A
chan_end

.chan_2761:
chan_call .chan_22B7
chan_setval 1
chan_call .delay
chan_setbank 7
chan_setinstr 8
chan_setlayer 1, .layer_2461
chan_end

.chan_2771:
chan_call .chan_22B7
chan_setval 1
chan_call .delay
chan_setbank 7
chan_setinstr 0
chan_setlayer 1, .layer_2219
chan_end

.chan_2781:
chan_call .chan_22E6
chan_setlayer 1, .layer_22F3
chan_end

.chan_2788:
chan_call .chan_1613
chan_setval 12
chan_call .delay
chan_setbank 6
chan_setinstr 1
chan_setlayer 2, .layer_2798
chan_end

.layer_2798:
layer_note1 24, 0x46, 127
layer_end

.chan_279C:
chan_setbank 9
chan_setinstr 3
chan_setvibratoextent 80
chan_setvibratorate 60
chan_setenvelope .envelope_32E4
chan_setlayer 0, .layer_27B7
chan_setlayer 1, .layer_27B5
chan_setval 56
chan_call .delay
chan_setvibratoextent 0
chan_end

.layer_27B5:
layer_transpose 1

.layer_27B7:
layer_note1 15, 0x48, 127
layer_end

.chan_27BB:
chan_setbank 4
chan_setinstr 15
chan_setval 40
chan_call .set_reverb
chan_setenvelope .envelope_33BC
chan_setlayer 0, .layer_27CB
chan_end

.layer_27CB:
layer_portamento 0x84, 3, 255
layer_note1 39, 0x7, 127
layer_note1 44, 0x8, 127
layer_note1 51, 0x7, 127
layer_note1 56, 0x8, 127
layer_end

.chan_27DC:
chan_setbank 6
chan_setinstr 1
chan_setval 55
chan_call .set_reverb
chan_setlayer 0, .layer_204E
chan_end

.chan_27E9:
chan_setbank 7
chan_setinstr 12
chan_setlayer 0, .layer_27F1
chan_end

.layer_27F1:
layer_note1 29, 0x7, 127
layer_note0 31, 0x18, 127, 127
layer_note1 27, 0x26, 127
layer_end

.chan_27FC:
chan_setbank 6
chan_setinstr 0
chan_setlayer 0, .layer_2804
chan_end

.layer_2804:
layer_somethingon
layer_portamento 0x85, 32, 255
layer_note1 46, 0x9, 80
layer_note1 36, 0xa, 90
layer_end

.chan_2810:
chan_setbank 6
chan_setinstr 11
chan_setenvelope .envelope_3304
chan_setlayer 0, .layer_281B
chan_end

.layer_281B:
layer_somethingon
layer_portamento 0x85, 19, 255
layer_note1 31, 0xe, 127
layer_note1 62, 0x8, 127
layer_end

.chan_2827:
chan_setbank 2
chan_setinstr 1
chan_setenvelope .envelope_32C4
chan_setlayer 0, .layer_283E
chan_setval 1
chan_call .delay
chan_setbank 6
chan_setinstr 0
chan_setlayer 1, .layer_2804
chan_end

.layer_283E:
layer_portamento 0x81, 47, 255
layer_note1 50, 0x18, 115
layer_end

.chan_2846:
chan_setbank 4
chan_setinstr 9
chan_setenvelope .envelope_32C4
chan_setlayer 0, .layer_2854
chan_setlayer 1, .layer_2856
chan_end

.layer_2854:
layer_setinstr 15

.layer_2856:
layer_transpose 6
layer_call .layer_fn_119F
layer_transpose 247
layer_call .layer_fn_119F
layer_transpose 236
layer_jump .layer_fn_119F

.chan_2865:
chan_call .chan_2518
chan_setlayer 1, .layer_288B
chan_setval 2
chan_call .delay
chan_setbank 8
chan_setinstr 10
chan_setlayer 2, .layer_2878
chan_end

.layer_2878:
layer_portamento 0x83, 43, 255
layer_note1 46, 0x9, 115
layer_somethingon
layer_portamento 0x85, 48, 255
layer_note1 50, 0x8, 127
layer_note1 44, 0x1e, 127
layer_end

.layer_288B:
layer_transpose 2
layer_jump .layer_252C

.chan_2890:
chan_setbank 7
chan_setinstr 10
chan_setenvelope .envelope_3344
chan_setlayer 0, .layer_289B
chan_end

.layer_289B:
layer_transpose 3
layer_portamento 0x81, 46, 255
layer_note1 55, 0xa, 105
layer_call .layer_fn_28BF
layer_delay 0xf
layer_portamento 0x81, 44, 255
layer_note0 53, 0xf, 105, 127
layer_portamento 0x81, 43, 255
layer_note1 51, 0xc, 105
layer_portamento 0x81, 46, 255
layer_note1 43, 0xe, 105

.layer_fn_28BF:
layer_portamento 0x81, 43, 255
layer_note1 51, 0xc, 105
layer_end

.chan_28C7:
chan_setbank 7
chan_setinstr 10
chan_setenvelope .envelope_3344
chan_setlayer 0, .layer_28D2
chan_end

.layer_28D2:
layer_transpose 6
layer_portamento 0x83, 53, 255
layer_note1 48, 0x8, 105
layer_note0 60, 0x9, 105, 100
layer_note1 39, 0xb, 105
layer_end

.chan_28E3:
chan_setbank 6
chan_setinstr 7
chan_setlayer 0, .layer_28EB
chan_end

.layer_28EB:
layer_transpose 254
layer_note0 31, 0xa, 127, 70
layer_note0 30, 0xb, 127, 70
layer_note0 29, 0xa, 127, 70
layer_note0 28, 0xc, 127, 70
layer_end

.chan_28FE:
chan_call .chan_22B7
chan_setval 1
chan_call .delay
chan_setbank 7
chan_setinstr 10
chan_setenvelope .envelope_3344
chan_setlayer 1, .layer_2911
chan_end

.layer_2911:
layer_transpose 12
layer_portamento 0x83, 53, 255
layer_note1 48, 0x8, 105
layer_note0 60, 0x9, 105, 100
layer_note1 39, 0x14, 105
layer_end

.chan_2922:
chan_call .chan_207F
chan_setval 10
chan_call .delay
chan_setbank 9
chan_setinstr 0
chan_setenvelope .envelope_340C
chan_setlayer 0, .layer_2935
chan_end

.layer_2935:
layer_transpose 6
layer_portamento 0x85, 12, 255
layer_note1 0, 0x12, 127
layer_note1 10, 0x14, 127
layer_end

.chan_2942:
chan_setbank 7
chan_setinstr 0
chan_setlayer 0, .layer_2951
chan_setlayer 1, .layer_294D
chan_end

.layer_294D:
layer_transpose 5
layer_delay 0x3

.layer_2951:
layer_note1 43, 0x6, 105
layer_portamento 0x81, 32, 255
layer_note1 44, 0x8, 105
layer_portamento 0x81, 29, 255
layer_note1 41, 0xa, 105
layer_portamento 0x81, 26, 255
layer_note1 38, 0xd, 105
layer_portamento 0x81, 22, 255
layer_note1 34, 0x10, 105
layer_end

.channel6_table:
sound_ref .chan_29B1
sound_ref .chan_29C2
sound_ref .chan_29D3
sound_ref .chan_29EF
sound_ref .chan_2A03
sound_ref .chan_2A17
sound_ref .chan_2A2B
sound_ref .chan_2A3D
sound_ref .chan_2A50
sound_ref .chan_2A81
sound_ref .chan_2B04
sound_ref .chan_1E35
sound_ref .chan_29B1
sound_ref .chan_29B1
sound_ref .chan_29B1
sound_ref .chan_29B1
sound_ref .chan_3248
sound_ref .chan_29C2
sound_ref .chan_29B1
sound_ref .chan_29B1
sound_ref .chan_29B1
sound_ref .chan_29B1
sound_ref .chan_29B1
sound_ref .chan_29B1
sound_ref .chan_29B1
sound_ref .chan_29C2
sound_ref .chan_29B1
sound_ref .chan_29B1
sound_ref .chan_29B1
sound_ref .chan_29B1
sound_ref .chan_29B1
sound_ref .chan_29B1

.chan_29B1:
chan_setbank 7
chan_setinstr 5
chan_setlayer 0, .layer_29B9
chan_end

.layer_29B9:
layer_somethingon
.layer_29BA:
layer_note1 39, 0x12c, 127
layer_jump .layer_29BA
layer_end

.chan_29C2:
chan_setbank 7
chan_setinstr 6
chan_setlayer 0, .layer_29CA
chan_end

.layer_29CA:
layer_somethingon
.layer_29CB:
layer_note1 39, 0x12c, 90
layer_jump .layer_29CB
layer_end

.chan_29D3:
chan_setbank 9
chan_setinstr 3
chan_setenvelope .envelope_32E4
chan_setlayer 0, .layer_29DE
chan_end

.layer_29DE:
layer_transpose 12
layer_somethingon
layer_portamento 0x85, 27, 255
.layer_29E5:
layer_note1 51, 0x16, 50
layer_note1 27, 0x16, 50
layer_jump .layer_29E5
layer_end

.chan_29EF:
chan_setbank 3
chan_setinstr 9
chan_setenvelope .envelope_32E4
chan_setlayer 0, .layer_29FA
chan_end

.layer_29FA:
layer_somethingon
.layer_29FB:
layer_note1 46, 0xc8, 92
layer_jump .layer_29FB
layer_end

.chan_2A03:
chan_setbank 7
chan_setinstr 5
chan_setenvelope .envelope_32E4
chan_setlayer 0, .layer_2A0E
chan_end

.layer_2A0E:
layer_somethingon
.layer_2A0F:
layer_note1 44, 0x12c, 127
layer_jump .layer_2A0F
layer_end

.chan_2A17:
chan_setbank 3
chan_setinstr 6
chan_setenvelope .envelope_32E4
chan_setlayer 0, .layer_2A22
chan_end

.layer_2A22:
layer_somethingon
.layer_2A23:
layer_note1 35, 0x12c, 127
layer_jump .layer_2A23
layer_end

.chan_2A2B:
chan_setbank 5
chan_setinstr 5
chan_setlayer 0, .layer_2A33
chan_end

.layer_2A33:
layer_note1 56, 0x4, 62
layer_note1 32, 0x3, 62
layer_jump .layer_2A33
layer_end

.chan_2A3D:
chan_setbank 9
chan_setinstr 3
chan_setlayer 0, .layer_2A45
chan_end

.layer_2A45:
layer_portamento 0x81, 24, 255
layer_note1 56, 0x10, 55
layer_jump .layer_2A45
layer_end

.chan_2A50:
chan_setbank 3
chan_setinstr 5
chan_setlayer 0, .layer_2A61
chan_setval 1
chan_call .delay
chan_setbank 3
chan_setinstr 8
chan_end

.layer_2A61:
layer_note1 48, 0x6, 100
layer_somethingon
.layer_2A65:
layer_note1 44, 0x12c, 127
layer_jump .layer_2A65
layer_end

.chan_unused_2A6D:
chan_setbank 3
chan_setinstr 6
chan_setenvelope .envelope_32E4
chan_setlayer 0, .layer_2A78
chan_end

.layer_2A78:
layer_somethingon
layer_note1 35, 0x12c, 100
layer_jump .layer_2A23
layer_end

.chan_2A81:
chan_setlayer 0, .layer_2AA7
chan_setlayer 1, .layer_2AB7
chan_setpanmix 0
.chan_2A89:
chan_setbank 5
chan_setinstr 6
chan_setdecayrelease 3
chan_setval 1
chan_call .delay
chan_setbank 6
chan_setinstr 9
chan_setdecayrelease 3
chan_setval 199
chan_call .delay
chan_setval 100
chan_call .delay
chan_jump .chan_2A89

.layer_2AA7:
layer_somethingon
layer_portamento 0x85, 38, 255
.layer_2AAC:
layer_note1 41, 0x12c, 127
layer_note1 38, 0x12c, 127
layer_jump .layer_2AAC

.layer_2AB7:
layer_delay 1
layer_setpan 30
layer_note1 56, 0xc, 10
layer_delay 0x6c
layer_setpan 90
layer_note1 55, 0x1e, 35
layer_delay 0x3b
layer_setpan 55
layer_note1 56, 0x2e, 68
layer_delay 0x2d
layer_note1 58, 0x25, 34
layer_delay 0x2b
layer_setpan 91
layer_note1 53, 0x6, 55
layer_note1 55, 0x18, 70
layer_delay 0x2b
layer_setpan 21
layer_note1 56, 0x28, 52
layer_delay 0x1b
layer_note1 57, 0x18, 65
layer_delay 0x38
layer_setpan 75
layer_note1 53, 0x22, 67
layer_delay 0x4c
layer_setpan 105
layer_note1 53, 0x3, 54
layer_note1 55, 0x17, 61
layer_delay 0x43
layer_setpan 64
layer_note1 52, 0x28, 45
layer_delay 0x38
layer_jump .layer_2AB7

.chan_2B04:
chan_setbank 5
chan_setinstr 5
chan_setenvelope .envelope_32C4
chan_setlayer 0, .layer_2B0F
chan_end

.layer_2B0F:
layer_portamento 0x81, 56, 255
layer_note1 44, 0x3, 85
layer_note1 20, 0x2, 85
layer_jump .layer_2B0F
layer_end

.channel7_table:
sound_ref .chan_2B9D
sound_ref .chan_2BC5
sound_ref .chan_2BF3
sound_ref .chan_2BF3
sound_ref .chan_2C31
sound_ref .chan_2C42
sound_ref .chan_2C73
sound_ref .chan_2C56
sound_ref .chan_2C90
sound_ref .chan_2CAC
sound_ref .chan_2CE5
sound_ref .chan_2CFE
sound_ref .chan_2D18
sound_ref .chan_2D40
sound_ref .chan_2D7C
sound_ref .chan_2D8B
sound_ref .chan_2DA8
sound_ref .chan_2DB4
sound_ref .chan_2DD0
sound_ref .chan_2DF2
sound_ref .chan_2E05
sound_ref .chan_2E4E
sound_ref .chan_2E83
sound_ref .chan_2ED8
sound_ref .chan_2F55
sound_ref .chan_10A7
sound_ref .chan_2F65
sound_ref .chan_2F71
sound_ref .chan_2F8C
sound_ref .chan_2FA6
sound_ref .chan_133C
sound_ref .chan_309F
sound_ref .chan_30B6
sound_ref .chan_30CB
sound_ref .chan_30E0
.ifdef VERSION_JP
  sound_ref .chan_2DF2
  sound_ref .chan_2E05
  sound_ref .chan_2E4E
  sound_ref .chan_2E83
  sound_ref .chan_2ED8
  sound_ref .chan_2F55
  sound_ref .chan_10A7
  sound_ref .chan_2F65
  sound_ref .chan_2F71
  sound_ref .chan_2F8C
  sound_ref .chan_2FA6
  sound_ref .chan_133C
  sound_ref .chan_2B9D
.else
  sound_ref .chan_30F5
  sound_ref .chan_3109
  sound_ref .chan_2E4E
  sound_ref .chan_2E83
  sound_ref .chan_2ED8
  sound_ref .chan_3122
  sound_ref .chan_3122
  sound_ref .chan_3122
  sound_ref .chan_3122
  sound_ref .chan_3122
  sound_ref .chan_3122
  sound_ref .chan_3122
  sound_ref .chan_3122
  sound_ref .chan_318B
  sound_ref .chan_318B
  sound_ref .chan_318B
  sound_ref .chan_318B
  sound_ref .chan_318B
  sound_ref .chan_318B
  sound_ref .chan_318B
  sound_ref .chan_318B
  sound_ref .chan_2C90
  sound_ref .chan_2CAC
  sound_ref .chan_2CE5
  sound_ref .chan_2CFE
  sound_ref .chan_2D18
  sound_ref .chan_2D40
  sound_ref .chan_2D7C
  sound_ref .chan_2D8B
.endif

.chan_2B9D:
chan_setbank 9
chan_setinstr 1
chan_setmutebhv 0x0
chan_setnotepriority 14
chan_setpanmix 0
chan_setenvelope .envelope_340C
chan_setlayer 0, .layer_2BB0
chan_setlayer 1, .layer_2BBD
chan_end

.layer_2BB0:
layer_portamento 0x1, 35, 0xa
layer_note1 41, 0xa, 80
layer_setpan 0
layer_note1 41, 0xa, 80
layer_end

.layer_2BBD:
layer_setpan 127
layer_delay 0xc
layer_note1 41, 0xa, 80
layer_end

.chan_2BC5:
chan_setbank 9
chan_setinstr 1
chan_setmutebhv 0x0
chan_setnotepriority 14
chan_setpanmix 0
chan_setlayer 0, .layer_2BD5
chan_setlayer 1, .layer_2BEC
chan_end

.layer_2BD5:
layer_setpan 34
.layer_2BD7:
layer_note0 45, 0xc, 80, 63
layer_note0 41, 0xc, 80, 63
layer_note0 48, 0xc, 80, 63
layer_note0 41, 0xc, 38, 63
layer_note0 48, 0xc, 38, 63
layer_end

.layer_2BEC:
layer_setpan 94
layer_delay 0x2
layer_jump .layer_2BD7

.chan_2BF3:
chan_setbank 9
chan_setinstr 1
chan_setmutebhv 0x0
chan_setnotepriority 14
chan_setpanmix 0
chan_setlayer 0, .layer_2C03
chan_setlayer 1, .layer_2C10
chan_end

.layer_2C03:
layer_note1 43, 0x9, 95
layer_note1 39, 0x9, 90
layer_note1 43, 0x9, 95
layer_note1 39, 0x9, 90
layer_end

.layer_2C10:
layer_delay 0x8
layer_setpan 40
layer_note1 43, 0x9, 35
layer_setpan 88
layer_note1 39, 0x9, 35
layer_setpan 36
layer_note1 43, 0x9, 30
layer_setpan 92
layer_note1 39, 0x9, 30
layer_setpan 28
layer_note1 43, 0x9, 25
layer_setpan 100
layer_note1 39, 0x9, 25
layer_end

.chan_2C31:
chan_setbank 9
chan_setnotepriority 14
chan_setinstr 2
chan_setlayer 0, .layer_2C3A
chan_end

.layer_2C3A:
layer_portamento 0x1, 32, 0x7f
layer_note1 56, 0x1e, 102
layer_end

.chan_2C42:
chan_setnotepriority 14
chan_setbank 9
chan_setinstr 0
chan_setenvelope .envelope_3438
chan_setlayer 0, .layer_2C4E
chan_end

.layer_2C4E:
layer_portamento 0x1, 32, 0x7f
layer_note1 53, 0x1e, 78
layer_end

.chan_2C56:
chan_setmutebhv 0x0
chan_setnotepriority 14
chan_setbank 9
chan_setinstr 3
chan_setenvelope .envelope_341C
chan_setlayer 0, .layer_2C64
chan_end

.layer_2C64:
layer_portamento 0x1, 32, 0x8
layer_note1 27, 0x8, 127
layer_portamento 0x81, 39, 255
layer_note1 20, 0x28, 127
layer_end

.chan_2C73:
chan_setmutebhv 0x0
chan_setnotepriority 14
chan_setbank 9
chan_setinstr 3
chan_setenvelope .envelope_3428
chan_setlayer 0, .layer_2C81
chan_end

.layer_2C81:
layer_portamento 0x1, 27, 0x8
layer_note1 32, 0x8, 93
layer_portamento 0x81, 20, 255
layer_note1 39, 0x28, 93
layer_end

.chan_2C90:
chan_setbank 9
chan_setnotepriority 14
chan_setinstr 1
chan_setenvelope .envelope_3444
chan_setvibratorate 1
chan_setvibratoextent 100
chan_setlayer 0, .layer_2CA0
chan_end

.layer_2CA0:
layer_somethingon
layer_portamento 0x85, 27, 255
layer_note1 15, 0x6, 127
layer_note1 34, 0xc, 127
layer_end

.chan_2CAC:
chan_setbank 9
chan_setnotepriority 14
chan_setinstr 1
chan_setenvelope .envelope_3454
chan_setvibratorate 25
chan_setvibratoextent 80
chan_setlayer 0, .layer_2CDA
chan_setlayer 1, .layer_2CD6
chan_setval 5
chan_call .delay
chan_setvibratorate 35
chan_setvibratoextent 115
chan_setval 55
chan_call .delay
chan_setvibratoextent 80
chan_setval 67
chan_call .delay
chan_setvibratoextent 0
chan_end

.layer_2CD6:
layer_transpose 12
layer_delay 0x3

.layer_2CDA:
layer_portamento 0x85, 24, 255
layer_note1 28, 0x5, 110
layer_note1 28, 0x78, 110
layer_end

.chan_2CE5:
chan_setbank 9
chan_setnotepriority 14
chan_setinstr 3
chan_setlayer 0, .layer_2CF3
chan_setlayer 1, .layer_2CF1
chan_end

.layer_2CF1:
layer_delay 0x2

.layer_2CF3:
layer_portamento 0x85, 47, 255
layer_note1 35, 0x8, 90
layer_note1 47, 0x10, 90
layer_end

.chan_2CFE:
chan_setbank 9
chan_setnotepriority 14
chan_setinstr 3
chan_setlayer 0, .layer_2D0C
chan_setlayer 1, .layer_2D0A
chan_end

.layer_2D0A:
layer_delay 0x2

.layer_2D0C:
layer_portamento 0x85, 35, 255
layer_note1 47, 0x8, 90
layer_note1 35, 0x10, 90
layer_disableportamento
layer_end

.chan_2D18:
chan_setbank 9
chan_setnotepriority 14
chan_setpanmix 0
chan_setinstr 3
chan_setenvelope .envelope_3454
chan_setlayer 0, .layer_2D26
chan_end

.layer_2D26:
layer_note1 45, 0x6, 100
layer_note1 57, 0x6, 100
layer_note1 57, 0xc, 100
layer_setpan 10
layer_note1 57, 0x6, 57
layer_note1 57, 0xc, 57
layer_setpan 117
layer_note1 57, 0x6, 38
layer_note1 57, 0xc, 38
layer_end

.chan_2D40:
chan_setbank 9
chan_setnotepriority 14
chan_setpanmix 0
chan_setinstr 3
chan_setenvelope .envelope_3454
chan_setval 25
chan_call .set_reverb
chan_setlayer 0, .layer_2D53
chan_end

.layer_2D53:
layer_setpan 30
layer_note1 44, 0x5, 105
layer_setpan 50
layer_note1 47, 0x5, 105
layer_setpan 77
layer_note1 52, 0x5, 105
layer_setpan 97
layer_note1 56, 0xa, 105
layer_setpan 30
layer_note1 52, 0x5, 45
layer_setpan 97
layer_note1 56, 0xa, 45
layer_setpan 30
layer_note1 52, 0x5, 32
layer_setpan 97
layer_note1 56, 0xa, 32
layer_end

.chan_2D7C:
chan_setmutebhv 0x0
chan_setnotepriority 14
chan_setbank 9
chan_setinstr 4
chan_setlayer 0, .layer_2D87
chan_end

.layer_2D87:
layer_note1 39, 0x18, 105
layer_end

.chan_2D8B:
chan_setmutebhv 0x0
chan_setnotepriority 14
chan_setbank 9
chan_setinstr 3
chan_setenvelope .envelope_3428
chan_setlayer 0, .layer_2D99
chan_end

.layer_2D99:
layer_portamento 0x81, 23, 255
layer_note1 35, 0x9, 96
layer_portamento 0x81, 36, 255
layer_note1 43, 0x44, 100
layer_end

.chan_2DA8:
chan_setnotepriority 14
chan_setbank 9
chan_setinstr 3
chan_setlayer 0, .layer_2DB1
chan_end

.layer_2DB1:
layer_delay 1
layer_end

.chan_2DB4:
chan_setmutebhv 0x0
chan_setnotepriority 14
chan_setbank 6
chan_setinstr 11
chan_setlayer 0, .layer_2DBF
chan_end

.layer_2DBF:
layer_portamento 0x81, 32, 255
layer_note0 39, 0x5, 115, 255
layer_portamento 0x81, 44, 255
layer_note0 51, 0x3, 115, 255
layer_end

.chan_2DD0:
chan_setmutebhv 0x0
chan_setbank 9
chan_setinstr 1
chan_setval 60
chan_call .set_reverb
chan_setlayer 0, .layer_2DDF
chan_end

.layer_2DDF:
layer_note1 46, 0x3, 90
layer_note1 46, 0x3, 30
layer_note1 58, 0x3, 90
layer_note1 58, 0x3, 30
layer_note1 46, 0x3, 90
layer_note1 46, 0x3, 30
layer_end

.chan_2DF2:
chan_setbank 9
chan_setinstr 0
chan_setenvelope .envelope_32C4
chan_setlayer 0, .layer_2DFD
chan_end

.layer_2DFD:
layer_portamento 0x81, 15, 255
layer_note1 51, 0x5, 73
layer_end

.chan_2E05:
chan_setbank 9
chan_setinstr 3
chan_setenvelope .envelope_3358
chan_setvibratoextent 3
chan_setvibratorate 60
chan_setval 25
chan_call .set_reverb
chan_setlayer 0, .layer_2E28
chan_setlayer 1, .layer_2E3D
chan_setlayer 2, .layer_2E34
chan_setval 70
chan_call .delay
chan_setbank 10
chan_setinstr 8
chan_end

.layer_2E28:
layer_call .layer_11E4
layer_delay 0x12
layer_transpose 0
layer_note1 39, 0xc8, 120
layer_end

.layer_2E34:
layer_delay 0x6e
layer_transpose 0
layer_note1 39, 0xc8, 31
layer_end

.layer_2E3D:
layer_transpose 24
layer_delay 0x1e
layer_note1 25, 0x2, 18
layer_note1 37, 0x7, 36
layer_note1 30, 0x5, 18
layer_note1 42, 0x37, 36
layer_end

.chan_2E4E:
chan_setbank 9
chan_setnotepriority 14
chan_setpanmix 0
chan_setinstr 3
chan_setenvelope .envelope_3454
chan_setval 25
chan_call .set_reverb
chan_setpanmix 0
chan_stereoheadseteffects 1
chan_setlayer 0, .layer_2E65
chan_end

.layer_2E65:
layer_note1 46, 0x5, 105
layer_note1 53, 0x5, 105
layer_note1 58, 0x5, 105
layer_setpan 30
layer_note1 53, 0x5, 50
layer_setpan 98
layer_note1 58, 0x5, 50
layer_setpan 20
layer_note1 53, 0x5, 20
layer_setpan 108
layer_note1 58, 0x5, 20
layer_end

.chan_2E83:
chan_reservenotes 4
chan_setbank 9
chan_setinstr 2
chan_setpanmix 0
chan_stereoheadseteffects 1
chan_setval 30
chan_call .set_reverb
chan_setenvelope .envelope_33BC
chan_setdecayrelease 220
chan_setlayer 0, .layer_2EA3
chan_setlayer 1, .layer_2E9E
chan_end

.layer_2E9E:
layer_transpose 244
layer_jump .layer_2EA5

.layer_2EA3:
layer_transpose 232
.layer_2EA5:
layer_call .layer_fn_2EAB
layer_call .layer_fn_2EAB

.layer_fn_2EAB:
layer_portamento 0x85, 60, 192
layer_setpan 117
layer_note1 60, 0x3, 126
layer_setpan 105
layer_note1 58, 0x3, 126
layer_setpan 93
layer_note1 55, 0x3, 126
layer_setpan 81
layer_note1 51, 0x3, 126
layer_setpan 46
layer_note1 50, 0x3, 126
layer_setpan 34
layer_note1 46, 0x3, 126
layer_setpan 22
layer_note1 44, 0x3, 126
layer_setpan 10
layer_note1 41, 0x3, 126
layer_end

.chan_2ED8:
chan_reservenotes 4
chan_setbank 9
chan_setinstr 2
chan_setval 30
chan_call .set_reverb
chan_setenvelope .envelope_3464
chan_setdecayrelease 220
chan_setlayer 0, .layer_2EF4
chan_setlayer 1, .layer_2EEF
chan_end

.layer_2EEF:
layer_transpose 24
layer_jump .layer_2EF6

.layer_2EF4:
layer_transpose 12
.layer_2EF6:
layer_portamento 0x85, 15, 128
layer_note1 15, 0x3, 126
layer_note1 19, 0x3, 126
layer_note1 22, 0x3, 126
layer_note1 27, 0x3, 126
layer_note1 22, 0x3, 126
layer_note1 27, 0x3, 126
layer_note1 31, 0x3, 126
layer_note1 34, 0x3, 126
layer_note1 39, 0x3, 126
layer_note1 34, 0x3, 126
layer_note1 23, 0x3, 126
layer_note1 27, 0x3, 126
layer_note1 30, 0x3, 126
layer_note1 35, 0x3, 126
layer_note1 30, 0x3, 126
layer_note1 35, 0x3, 126
layer_note1 39, 0x3, 126
layer_note1 42, 0x3, 126
layer_note1 47, 0x3, 126
layer_note1 42, 0x3, 126
layer_note1 25, 0x3, 126
layer_note1 29, 0x3, 126
layer_note1 32, 0x3, 126
layer_note1 37, 0x3, 126
layer_note1 32, 0x3, 126
layer_note1 37, 0x3, 126
layer_note1 41, 0x3, 126
layer_note1 44, 0x3, 126
layer_note1 49, 0x3, 126
layer_note1 44, 0x3, 126
layer_end

.chan_2F55:
chan_setbank 6
chan_setinstr 9
chan_setval 25
chan_call .set_reverb
chan_setlayer 0, .layer_271D
chan_setlayer 1, .layer_271D
chan_end

.chan_2F65:
chan_setbank 9
chan_setinstr 5
chan_setlayer 0, .layer_2F6D
chan_end

.layer_2F6D:
layer_note1 39, 0x30, 127
layer_end

.chan_2F71:
chan_setbank 9
chan_setinstr 3
chan_setenvelope .envelope_32D4
chan_setlayer 0, .layer_2F7C
chan_end

.layer_2F7C:
layer_transpose 244
layer_portamento 0x83, 3, 255
layer_note1 15, 0xa, 127
layer_somethingon
layer_transpose 0
layer_note1 46, 0x64, 127
layer_end

.chan_2F8C:
chan_setbank 9
chan_setinstr 3
chan_setlayer 0, .layer_2F97
chan_setenvelope .envelope_32D4
chan_end

.layer_2F97:
layer_portamento 0x81, 3, 255
layer_note1 15, 0xc, 127
layer_portamento 0x81, 39, 255
layer_note1 3, 0x64, 127
layer_end

.chan_2FA6:
chan_setbank 9
chan_setnotepriority 14
chan_setpanmix 0
chan_setinstr 3
chan_setenvelope .envelope_340C
chan_setreverb 30
chan_setlayer 0, .layer_3032
chan_setlayer 1, .layer_2FB9
chan_end

.layer_2FB9:
layer_transpose 232
layer_setpan 24
layer_call .layer_fn_300D
layer_transpose 244
layer_setpan 44
layer_call .layer_fn_300D
layer_transpose 0

.layer_2FC9:
layer_setpan 64
layer_call .layer_fn_300D
layer_transpose 12
layer_setpan 84
layer_call .layer_fn_300D
layer_transpose 24
layer_setpan 104
layer_call .layer_fn_300D
layer_setpan 24
layer_note1 56, 0x2, 100
layer_note1 56, 0x1, 50
layer_setpan 104
layer_note1 60, 0x14, 70
layer_note1 60, 0xa, 30
layer_setpan 24
layer_note1 56, 0x2, 50
layer_note1 56, 0x1, 20
layer_setpan 104
layer_note1 60, 0x14, 30
layer_note1 60, 0xa, 10
layer_setpan 24
layer_note1 56, 0x2, 30
layer_note1 56, 0x1, 10
layer_setpan 104
layer_note1 60, 0x14, 20
layer_note1 60, 0xa, 7
layer_end

.layer_fn_300D:
layer_note1 51, 0x2, 50
layer_note1 39, 0x1, 40
layer_note1 39, 0x2, 20
layer_note1 55, 0x2, 50
layer_note1 43, 0x1, 40
layer_note1 43, 0x2, 20
layer_note1 56, 0x2, 50
layer_note1 44, 0x1, 40
layer_note1 44, 0x2, 20
layer_note1 60, 0x2, 50
layer_note1 48, 0x1, 40
layer_note1 48, 0x2, 20
layer_end

.layer_3032:
layer_transpose 232
layer_call .layer_fn_3072
layer_transpose 244
layer_call .layer_fn_3072
layer_transpose 0
layer_call .layer_fn_3072

.layer_3041:
layer_transpose 12
layer_call .layer_fn_3072
layer_transpose 24
layer_call .layer_fn_3072
layer_setpan 64
layer_note1 44, 0x1, 100
layer_note1 56, 0x2, 50
layer_note1 48, 0xa, 70
layer_note1 60, 0x14, 30
layer_note1 44, 0x1, 50
layer_note1 56, 0x2, 20
layer_note1 48, 0xa, 30
layer_note1 60, 0x14, 10
layer_note1 44, 0x1, 30
layer_note1 56, 0x2, 10
layer_note1 48, 0xa, 20
layer_note1 60, 0x14, 7
layer_end

.layer_fn_3072:
layer_setpan 54
layer_note1 39, 0x3, 100
layer_note1 51, 0x1, 50
layer_note1 51, 0x1, 20
layer_setpan 74
layer_note1 43, 0x3, 100
layer_note1 55, 0x1, 50
layer_note1 55, 0x1, 20
layer_setpan 54
layer_note1 44, 0x3, 100
layer_note1 56, 0x1, 50
layer_note1 56, 0x1, 20
layer_setpan 74
layer_note1 48, 0x3, 100
layer_note1 60, 0x1, 50
layer_note1 60, 0x1, 20
layer_end

.chan_309F:
chan_setbank 10
chan_setinstr 14
chan_setlayer 0, .layer_30AA
chan_setlayer 1, .layer_30AF
chan_end

.layer_30AA:
layer_note1 39, 0xfa, 127
layer_end

.layer_30AF:
layer_delay 0x9
layer_note1 39, 0xf1, 45
layer_end

.chan_30B6:
chan_setbank 9
chan_setinstr 1
chan_setlayer 0, .layer_30BE
chan_end

.layer_30BE:
layer_note1 46, 0x3, 90
layer_note1 46, 0x3, 30
layer_note1 58, 0x3, 90
layer_note1 58, 0x3, 30
layer_end

.chan_30CB:
chan_setbank 9
chan_setinstr 1
chan_setlayer 0, .layer_30D3
chan_end

.layer_30D3:
layer_note1 58, 0x3, 90
layer_note1 58, 0x3, 30
layer_note1 46, 0x3, 90
layer_note1 46, 0x3, 30
layer_end

.chan_30E0:
chan_reservenotes 6
chan_setbank 9
chan_setnotepriority 14
chan_setpanmix 0
chan_setinstr 3
chan_setenvelope .envelope_340C
chan_setreverb 30
chan_setlayer 0, .layer_3041
chan_setlayer 1, .layer_2FC9
chan_end

.ifndef VERSION_JP
  .chan_30F5:
  chan_setbank 4
  chan_setinstr 14
  chan_setlayer 0, .layer_1344
  chan_setval 1
  chan_call .delay
  chan_setbank 10
  chan_setinstr 12
  chan_setlayer 1, .layer_E3A
  chan_end

  .chan_3109:
  chan_setbank 8
  chan_setinstr 26
  chan_setlayer 0, .layer_311D
  chan_setval 1
  chan_call .delay
  chan_setbank 4
  chan_setinstr 14
  chan_setlayer 1, .layer_1344
  chan_end

  .layer_311D:
  layer_note1 39, 0xb4, 127
  layer_end

  .chan_3122:
  chan_setinstr 128
  chan_setnotepriority 14
  chan_setpanmix 0
  chan_setenvelope .envelope_3378
  chan_ioreadval 4
  chan_subtract 0x28
  chan_readseq .major_scale
  chan_writeseq 0, .transpose_by_coin_index, 1
  chan_setlayer 0, .layer_3146
  chan_setlayer 1, .layer_3168
  chan_setlayer 2, .layer_3148
  chan_end

  .major_scale:
  .byte 0
  .byte 2
  .byte 4
  .byte 5
  .byte 7
  .byte 9
  .byte 11
  .byte 12

  .layer_3146:
  layer_delay 0x6

  .layer_3148:
  layer_call .transpose_by_coin_index
  layer_note0 46, 0xc, 75, 20
  layer_note0 45, 0xc, 75, 20
  layer_note0 46, 0xc, 75, 20
  layer_note0 58, 0x10, 80, 80
  layer_note0 58, 0x10, 45, 80
  layer_note0 58, 0x10, 20, 80
  layer_note0 58, 0x10, 15, 80
  layer_end

  .layer_3168:
  layer_call .transpose_by_coin_index
  layer_note0 41, 0xc, 75, 20
  layer_note0 40, 0xc, 75, 20
  layer_note0 41, 0xc, 75, 20
  layer_note0 53, 0x10, 80, 80
  layer_note0 53, 0x10, 45, 80
  layer_note0 53, 0x10, 20, 80
  layer_note0 53, 0x10, 15, 80
  layer_end

  .transpose_by_coin_index:
  layer_transpose 0
  layer_end

  .chan_318B:
  chan_setbank 4
  chan_setinstr 14
  chan_setnotepriority 14
  chan_setpanmix 0
  chan_ioreadval 4
  chan_subtract 0x30
  chan_readseq .major_scale
  chan_writeseq 0, .layer_31A0, 1
  chan_setlayer 0, .layer_31A0
  chan_end

  .layer_31A0:
  layer_transpose 0
  layer_note1 32, 0x7f, 115
  layer_end
.endif

.chan_31A6:
chan_setbank 5
chan_setinstr 9
chan_setval 40
chan_call .set_reverb
chan_setlayer 0, .layer_31B3
chan_end

.layer_31B3:
layer_delay 0x4b
layer_note0 39, 0xf5, 100, 127
layer_note0 39, 0xa, 85, 127
layer_note0 40, 0x123, 98, 127
layer_note0 39, 0x91, 75, 127
layer_note0 41, 0xbd, 84, 127
layer_note0 39, 0x4b, 73, 127
layer_note0 39, 0x96, 94, 127
layer_note0 36, 0x74, 78, 127
layer_jump .layer_31B3
layer_end

.chan_31DE:
chan_setbank 5
chan_setinstr 10
chan_setval 60
chan_call .set_reverb
chan_setlayer 0, .layer_31EB
chan_end

.layer_31EB:
layer_delay 0x14
layer_note1 39, 0x71, 70
layer_note1 37, 0xd3, 62
layer_note1 39, 0x48, 84
layer_note1 40, 0x71, 49
layer_note1 39, 0xa8, 65
layer_note1 41, 0x86, 59
layer_note1 41, 0x31, 54
layer_note1 38, 0x6f, 51
layer_note1 39, 0xc7, 79
layer_note1 35, 0xe9, 74
layer_jump .layer_31EB
layer_end

.chan_3214:
chan_setbank 5
chan_setinstr 12
chan_setval 30
chan_call .set_reverb
chan_setlayer 0, .layer_3221
chan_end

.layer_3221:
layer_delay 0x32
layer_note1 41, 0x31, 66
layer_delay 0x9f
layer_note1 39, 0x31, 51
layer_delay 0xf9
layer_note1 38, 0x1d, 60
layer_note1 41, 0x4c, 77
layer_delay_long 0x64
layer_note1 42, 0x31, 59
layer_delay 0x159
layer_note1 36, 0x4f, 61
layer_delay 0xc6
layer_jump .layer_3221
layer_end

.chan_3248:
chan_setbank 5
chan_setval 15
chan_call .set_reverb
chan_setlayer 0, .layer_3259
chan_setlayer 1, .layer_327F
chan_setlayer 2, .layer_3281
chan_end

.layer_3259:
layer_setinstr 8
layer_delay 0x18
layer_note1 41, 0x9, 26
layer_note1 37, 0xbc, 22
layer_note1 39, 0x71, 33
layer_note1 40, 0xd7, 33
layer_note1 39, 0x54, 39
layer_note1 39, 0x6f, 31
layer_note1 43, 0xa8, 26
layer_note1 40, 0xe1, 22
layer_note1 38, 0x74, 31
layer_jump .layer_3259

.layer_327F:
layer_transpose 12

.layer_3281:
layer_setinstr 13
layer_somethingon
layer_delay 0xf
.layer_3286:
layer_note1 39, 0x12c, 25
layer_jump .layer_3286

.chan_328D:
chan_setval 18
chan_jump .chan_3294

.chan_3292:
chan_setval 42
.chan_3294:
chan_writeseq 0, .layer_32BF, 1
chan_reservenotes 4
chan_setbank 4
chan_setinstr 2
chan_setenvelope .envelope_3314
chan_setdecayrelease 15
chan_setlayer 0, .layer_32B7
chan_setlayer 1, .layer_32B3
.chan_32A9:
chan_delay1
chan_ioreadval 0
chan_iowriteval 0
chan_subtract 255
chan_beqz .chan_32A9
chan_unreservenotes
chan_end

.layer_32B3:
layer_setinstr 9
layer_transpose 12

.layer_32B7:
layer_note0 50, 0x3, 127, 127
layer_note0 38, 0x3, 127, 127
.layer_32BF:
layer_delay 0x2a
layer_jump .layer_32B7

.ifndef VERSION_US
  # padding
  .byte 0
.endif

.envelope_32C4:
envelope_line 7 20000
envelope_line 6 32700
envelope_line 32700 32700
envelope_goto 2

.envelope_32D4:
envelope_line 9 15000
envelope_line 7 32700
envelope_line 32700 32700
envelope_goto 2

.envelope_32E4:
envelope_line 10 10000
envelope_line 100 32700
envelope_line 32700 32700
envelope_goto 2

.envelope_32F4:
envelope_line 35 32700
envelope_line 10 32700
envelope_line 300 0
envelope_goto 2

.envelope_3304:
envelope_line 15 20000
envelope_line 5 32700
envelope_line 32700 32700
envelope_goto 2

.envelope_3314:
envelope_line 8 32700
envelope_line 50 32700
envelope_line 300 0
envelope_goto 2

.envelope_3324:
envelope_line 100 25000
envelope_line 35 32700
envelope_line 300 5000
envelope_goto 2

.envelope_3334:
envelope_line 25 32700
envelope_line 4 22500
envelope_line 35 32700
envelope_goto 2

.envelope_3344:
envelope_line 1 32700
envelope_line 10 30000
envelope_line 50 30000
envelope_line 100 0
envelope_goto 3

.envelope_3358:
envelope_line 4 32700
envelope_line 100 15000
envelope_line 1000 0
envelope_goto 2

.envelope_3368:
envelope_line 10 32700
envelope_line 1 32700
envelope_line 10 0
envelope_goto 2

.ifndef VERSION_JP
  .envelope_3378:
  envelope_line 3 32700
  envelope_line 10 30000
  envelope_line 10 10000
  envelope_line 100 0
  envelope_goto 3
.endif

.envelope_338C:
envelope_line 1 32700
envelope_line 20 32700
envelope_line 600 6000
envelope_goto 2

.envelope_unused_339C:
envelope_line 1 32700
envelope_line 20 32700
envelope_line 100 18000
envelope_goto 2

.envelope_33AC:
envelope_line 1 32700
envelope_line 20 32700
envelope_line 300 6000
envelope_goto 2

.envelope_33BC:
envelope_line 7 18000
envelope_line 4 32760
envelope_line 30 0
envelope_goto 2

.envelope_33CC:
envelope_line 19 32700
envelope_line 5 32700
envelope_line 15 0
envelope_goto 2

.envelope_33DC:
envelope_line 25 32700
envelope_line 9 32700
envelope_line 9 0
envelope_goto 2

.envelope_33EC:
envelope_line 1 32700
envelope_line 100 32760
envelope_line 300 0
envelope_goto 2

.envelope_33FC:
envelope_line 22 32700
envelope_line 50 32760
envelope_line 70 0
envelope_goto 2

.envelope_340C:
envelope_line 5 32760
envelope_line 192 0
envelope_line 1000 1000
envelope_goto 2

.envelope_341C:
envelope_line 25 32760
envelope_line 60 10000
envelope_goto 2

.envelope_3428:
envelope_line 1 10000
envelope_line 1 10000
envelope_line 40 32760
envelope_goto 2

.envelope_3438:
envelope_line 23 32760
envelope_line 80 15000
envelope_goto 2

.envelope_3444:
envelope_line 22 32760
envelope_line 50 32760
envelope_line 100 25000
envelope_goto 2

.envelope_3454:
envelope_line 13 32760
envelope_line 50 32760
envelope_line 200 0
envelope_goto 2

.envelope_3464:
envelope_line 6 12000
envelope_line 4 32760
envelope_line 50 32760
envelope_line 200 0
envelope_goto 2

.envelope_unused_3478:
envelope_line 1 32700
envelope_line 1000 32700
envelope_line 10 16000
envelope_line 200 32760
envelope_goto 3
