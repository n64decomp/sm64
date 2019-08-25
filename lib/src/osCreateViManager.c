#include "libultra_internal.h"

OSViMode osViModeTable[] = {
    /*osViModeNtscLpn1*/
    { /*type*/ 0,
      /*comRegs*/
      { /*ctrl*/ 12814,
        /*width*/ 320,
        /*burst*/ 65348153,
        /*vSync*/ 525,
        /*hSync*/ 3093,
        /*leap*/ 202705941,
        /*hStart*/ 7078636,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 640,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 },
        { /*origin*/ 640,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModeNtscLpf1*/
    { /*type*/ 1,
      /*comRegs*/
      { /*ctrl*/ 12878,
        /*width*/ 320,
        /*burst*/ 65348153,
        /*vSync*/ 524,
        /*hSync*/ 3093,
        /*leap*/ 202705941,
        /*hStart*/ 7078636,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 640,
          /*yScale*/ 16778240,
          /*vStart*/ 2294269,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 },
        { /*origin*/ 640,
          /*yScale*/ 50332672,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModeNtscLan1*/
    { /*type*/ 2,
      /*comRegs*/
      { /*ctrl*/ 12574,
        /*width*/ 320,
        /*burst*/ 65348153,
        /*vSync*/ 525,
        /*hSync*/ 3093,
        /*leap*/ 202705941,
        /*hStart*/ 7078636,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 640,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 },
        { /*origin*/ 640,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModeNtscLaf1*/
    { /*type*/ 3,
      /*comRegs*/
      { /*ctrl*/ 12382,
        /*width*/ 320,
        /*burst*/ 65348153,
        /*vSync*/ 524,
        /*hSync*/ 3093,
        /*leap*/ 202705941,
        /*hStart*/ 7078636,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 640,
          /*yScale*/ 16778240,
          /*vStart*/ 2294269,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 },
        { /*origin*/ 640,
          /*yScale*/ 50332672,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModeNtscLpn2*/
    { /*type*/ 4,
      /*comRegs*/
      { /*ctrl*/ 13071,
        /*width*/ 320,
        /*burst*/ 65348153,
        /*vSync*/ 525,
        /*hSync*/ 3093,
        /*leap*/ 202705941,
        /*hStart*/ 7078636,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 },
        { /*origin*/ 1280,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModeNtscLpf2*/
    { /*type*/ 5,
      /*comRegs*/
      { /*ctrl*/ 12879,
        /*width*/ 320,
        /*burst*/ 65348153,
        /*vSync*/ 524,
        /*hSync*/ 3093,
        /*leap*/ 202705941,
        /*hStart*/ 7078636,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 16778240,
          /*vStart*/ 2294269,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 },
        { /*origin*/ 1280,
          /*yScale*/ 50332672,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModeNtscLan2*/
    { /*type*/ 6,
      /*comRegs*/
      { /*ctrl*/ 12319,
        /*width*/ 320,
        /*burst*/ 65348153,
        /*vSync*/ 525,
        /*hSync*/ 3093,
        /*leap*/ 202705941,
        /*hStart*/ 7078636,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 },
        { /*origin*/ 1280,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModeNtscLaf2*/
    { /*type*/ 7,
      /*comRegs*/
      { /*ctrl*/ 12383,
        /*width*/ 320,
        /*burst*/ 65348153,
        /*vSync*/ 524,
        /*hSync*/ 3093,
        /*leap*/ 202705941,
        /*hStart*/ 7078636,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 16778240,
          /*vStart*/ 2294269,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 },
        { /*origin*/ 1280,
          /*yScale*/ 50332672,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModeNtscHpn1*/
    { /*type*/ 8,
      /*comRegs*/
      { /*ctrl*/ 12878,
        /*width*/ 1280,
        /*burst*/ 65348153,
        /*vSync*/ 524,
        /*hSync*/ 3093,
        /*leap*/ 202705941,
        /*hStart*/ 7078636,
        /*xScale*/ 1024,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 1024,
          /*vStart*/ 2294269,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 },
        { /*origin*/ 2560,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModeNtscHpf1*/
    { /*type*/ 9,
      /*comRegs*/
      { /*ctrl*/ 12878,
        /*width*/ 640,
        /*burst*/ 65348153,
        /*vSync*/ 524,
        /*hSync*/ 3093,
        /*leap*/ 202705941,
        /*hStart*/ 7078636,
        /*xScale*/ 1024,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 33556480,
          /*vStart*/ 2294269,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 },
        { /*origin*/ 2560,
          /*yScale*/ 33556480,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModeNtscHan1*/
    { /*type*/ 10,
      /*comRegs*/
      { /*ctrl*/ 12382,
        /*width*/ 1280,
        /*burst*/ 65348153,
        /*vSync*/ 524,
        /*hSync*/ 3093,
        /*leap*/ 202705941,
        /*hStart*/ 7078636,
        /*xScale*/ 1024,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 1024,
          /*vStart*/ 2294269,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 },
        { /*origin*/ 2560,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModeNtscHaf1*/
    { /*type*/ 11,
      /*comRegs*/
      { /*ctrl*/ 12382,
        /*width*/ 640,
        /*burst*/ 65348153,
        /*vSync*/ 524,
        /*hSync*/ 3093,
        /*leap*/ 202705941,
        /*hStart*/ 7078636,
        /*xScale*/ 1024,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 33556480,
          /*vStart*/ 2294269,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 },
        { /*origin*/ 2560,
          /*yScale*/ 33556480,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModeNtscHpn2*/
    { /*type*/ 12,
      /*comRegs*/
      { /*ctrl*/ 13135,
        /*width*/ 1280,
        /*burst*/ 65348153,
        /*vSync*/ 524,
        /*hSync*/ 3093,
        /*leap*/ 202705941,
        /*hStart*/ 7078636,
        /*xScale*/ 1024,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 2560,
          /*yScale*/ 1024,
          /*vStart*/ 2294269,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 },
        { /*origin*/ 5120,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModeNtscHpf2*/
    { /*type*/ 13,
      /*comRegs*/
      { /*ctrl*/ 12879,
        /*width*/ 640,
        /*burst*/ 65348153,
        /*vSync*/ 524,
        /*hSync*/ 3093,
        /*leap*/ 202705941,
        /*hStart*/ 7078636,
        /*xScale*/ 1024,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 2560,
          /*yScale*/ 33556480,
          /*vStart*/ 2294269,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 },
        { /*origin*/ 5120,
          /*yScale*/ 33556480,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },

#ifdef VERSION_JP
    /*osViModePalLpn1*/
    { /*type*/ 14,
      /*comRegs*/
      { /*ctrl*/ 12814,
        /*width*/ 320,
        /*burst*/ 67380026,
        /*vSync*/ 625,
        /*hSync*/ 1379433,
        /*leap*/ 208604270,
        /*hStart*/ 8389376,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 640,
          /*yScale*/ 1024,
          /*vStart*/ 6226489,
          /*vBurst*/ 590443,
          /*vIntr*/ 2 },
        { /*origin*/ 640,
          /*yScale*/ 1024,
          /*vStart*/ 6226489,
          /*vBurst*/ 590443,
          /*vIntr*/ 2 } } },
    /*osViModePalLpf1*/
    { /*type*/ 15,
      /*comRegs*/
      { /*ctrl*/ 12878,
        /*width*/ 320,
        /*burst*/ 67380026,
        /*vSync*/ 624,
        /*hSync*/ 1379433,
        /*leap*/ 208604270,
        /*hStart*/ 8389376,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 640,
          /*yScale*/ 16778240,
          /*vStart*/ 6095415,
          /*vBurst*/ 590443,
          /*vIntr*/ 2 },
        { /*origin*/ 640,
          /*yScale*/ 50332672,
          /*vStart*/ 6226489,
          /*vBurst*/ 852585,
          /*vIntr*/ 2 } } },
    /*osViModePalLan1*/
    { /*type*/ 16,
      /*comRegs*/
      { /*ctrl*/ 12574,
        /*width*/ 320,
        /*burst*/ 67380026,
        /*vSync*/ 625,
        /*hSync*/ 1379433,
        /*leap*/ 208604270,
        /*hStart*/ 8389376,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 640,
          /*yScale*/ 1024,
          /*vStart*/ 6226489,
          /*vBurst*/ 590443,
          /*vIntr*/ 2 },
        { /*origin*/ 640,
          /*yScale*/ 1024,
          /*vStart*/ 6226489,
          /*vBurst*/ 590443,
          /*vIntr*/ 2 } } },
    /*osViModePalLaf1*/
    { /*type*/ 17,
      /*comRegs*/
      { /*ctrl*/ 12382,
        /*width*/ 320,
        /*burst*/ 67380026,
        /*vSync*/ 624,
        /*hSync*/ 1379433,
        /*leap*/ 208604270,
        /*hStart*/ 8389376,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 640,
          /*yScale*/ 16778240,
          /*vStart*/ 6095415,
          /*vBurst*/ 590443,
          /*vIntr*/ 2 },
        { /*origin*/ 640,
          /*yScale*/ 50332672,
          /*vStart*/ 6226489,
          /*vBurst*/ 852585,
          /*vIntr*/ 2 } } },
    /*osViModePalLpn2*/
    { /*type*/ 18,
      /*comRegs*/
      { /*ctrl*/ 13071,
        /*width*/ 320,
        /*burst*/ 67380026,
        /*vSync*/ 625,
        /*hSync*/ 1379433,
        /*leap*/ 208604270,
        /*hStart*/ 8389376,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 1024,
          /*vStart*/ 6226489,
          /*vBurst*/ 590443,
          /*vIntr*/ 2 },
        { /*origin*/ 1280,
          /*yScale*/ 1024,
          /*vStart*/ 6226489,
          /*vBurst*/ 590443,
          /*vIntr*/ 2 } } },
    /*osViModePalLpf2*/
    { /*type*/ 19,
      /*comRegs*/
      { /*ctrl*/ 12879,
        /*width*/ 320,
        /*burst*/ 67380026,
        /*vSync*/ 624,
        /*hSync*/ 1379433,
        /*leap*/ 208604270,
        /*hStart*/ 8389376,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 16778240,
          /*vStart*/ 6095415,
          /*vBurst*/ 590443,
          /*vIntr*/ 2 },
        { /*origin*/ 1280,
          /*yScale*/ 50332672,
          /*vStart*/ 6226489,
          /*vBurst*/ 852585,
          /*vIntr*/ 2 } } },
    /*osViModePalLan2*/
    { /*type*/ 20,
      /*comRegs*/
      { /*ctrl*/ 12319,
        /*width*/ 320,
        /*burst*/ 67380026,
        /*vSync*/ 625,
        /*hSync*/ 1379433,
        /*leap*/ 208604270,
        /*hStart*/ 8389376,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 1024,
          /*vStart*/ 6226489,
          /*vBurst*/ 590443,
          /*vIntr*/ 2 },
        { /*origin*/ 1280,
          /*yScale*/ 1024,
          /*vStart*/ 6226489,
          /*vBurst*/ 590443,
          /*vIntr*/ 2 } } },
    /*osViModePalLaf2*/
    { /*type*/ 21,
      /*comRegs*/
      { /*ctrl*/ 12383,
        /*width*/ 320,
        /*burst*/ 67380026,
        /*vSync*/ 624,
        /*hSync*/ 1379433,
        /*leap*/ 208604270,
        /*hStart*/ 8389376,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 16778240,
          /*vStart*/ 6095415,
          /*vBurst*/ 590443,
          /*vIntr*/ 2 },
        { /*origin*/ 1280,
          /*yScale*/ 50332672,
          /*vStart*/ 6226489,
          /*vBurst*/ 852585,
          /*vIntr*/ 2 } } },
    /*osViModePalHpn1*/
    { /*type*/ 22,
      /*comRegs*/
      { /*ctrl*/ 12878,
        /*width*/ 1280,
        /*burst*/ 67380026,
        /*vSync*/ 624,
        /*hSync*/ 1379433,
        /*leap*/ 208604270,
        /*hStart*/ 8389376,
        /*xScale*/ 1024,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 1024,
          /*vStart*/ 6095415,
          /*vBurst*/ 590443,
          /*vIntr*/ 2 },
        { /*origin*/ 2560,
          /*yScale*/ 1024,
          /*vStart*/ 6226489,
          /*vBurst*/ 852585,
          /*vIntr*/ 2 } } },
    /*osViModePalHpf1*/
    { /*type*/ 23,
      /*comRegs*/
      { /*ctrl*/ 12878,
        /*width*/ 640,
        /*burst*/ 67380026,
        /*vSync*/ 624,
        /*hSync*/ 1379433,
        /*leap*/ 208604270,
        /*hStart*/ 8389376,
        /*xScale*/ 1024,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 33556480,
          /*vStart*/ 6095415,
          /*vBurst*/ 590443,
          /*vIntr*/ 2 },
        { /*origin*/ 2560,
          /*yScale*/ 33556480,
          /*vStart*/ 6226489,
          /*vBurst*/ 852585,
          /*vIntr*/ 2 } } },
    /*osViModePalHan1*/
    { /*type*/ 24,
      /*comRegs*/
      { /*ctrl*/ 12382,
        /*width*/ 1280,
        /*burst*/ 67380026,
        /*vSync*/ 624,
        /*hSync*/ 1379433,
        /*leap*/ 208604270,
        /*hStart*/ 8389376,
        /*xScale*/ 1024,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 1024,
          /*vStart*/ 6095415,
          /*vBurst*/ 590443,
          /*vIntr*/ 2 },
        { /*origin*/ 2560,
          /*yScale*/ 1024,
          /*vStart*/ 6226489,
          /*vBurst*/ 852585,
          /*vIntr*/ 2 } } },
    /*osViModePalHaf1*/
    { /*type*/ 25,
      /*comRegs*/
      { /*ctrl*/ 12382,
        /*width*/ 640,
        /*burst*/ 67380026,
        /*vSync*/ 624,
        /*hSync*/ 1379433,
        /*leap*/ 208604270,
        /*hStart*/ 8389376,
        /*xScale*/ 1024,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 33556480,
          /*vStart*/ 6095415,
          /*vBurst*/ 590443,
          /*vIntr*/ 2 },
        { /*origin*/ 2560,
          /*yScale*/ 33556480,
          /*vStart*/ 6226489,
          /*vBurst*/ 852585,
          /*vIntr*/ 2 } } },
    /*osViModePalHpn2*/
    { /*type*/ 26,
      /*comRegs*/
      { /*ctrl*/ 13135,
        /*width*/ 1280,
        /*burst*/ 67380026,
        /*vSync*/ 624,
        /*hSync*/ 1379433,
        /*leap*/ 208604270,
        /*hStart*/ 8389376,
        /*xScale*/ 1024,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 2560,
          /*yScale*/ 1024,
          /*vStart*/ 6095415,
          /*vBurst*/ 590443,
          /*vIntr*/ 2 },
        { /*origin*/ 5120,
          /*yScale*/ 1024,
          /*vStart*/ 6226489,
          /*vBurst*/ 852585,
          /*vIntr*/ 2 } } },
    /*osViModePalHpf2*/
    { /*type*/ 27,
      /*comRegs*/
      { /*ctrl*/ 12879,
        /*width*/ 640,
        /*burst*/ 67380026,
        /*vSync*/ 624,
        /*hSync*/ 1379433,
        /*leap*/ 208604270,
        /*hStart*/ 8389376,
        /*xScale*/ 1024,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 2560,
          /*yScale*/ 33556480,
          /*vStart*/ 6095415,
          /*vBurst*/ 590443,
          /*vIntr*/ 2 },
        { /*origin*/ 5120,
          /*yScale*/ 33556480,
          /*vStart*/ 6226489,
          /*vBurst*/ 852585,
          /*vIntr*/ 2 } } },
#else
    /*osViModePalLpn1*/
    { /*type*/ 28,
      /*comRegs*/
      { /*ctrl*/ 12814,
        /*width*/ 320,
        /*burst*/ 73735737,
        /*vSync*/ 525,
        /*hSync*/ 265233,
        /*leap*/ 202968090,
        /*hStart*/ 7078636,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 640,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 },
        { /*origin*/ 640,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModePalLpf1*/
    { /*type*/ 29,
      /*comRegs*/
      { /*ctrl*/ 12878,
        /*width*/ 320,
        /*burst*/ 73735737,
        /*vSync*/ 524,
        /*hSync*/ 3088,
        /*leap*/ 203164700,
        /*hStart*/ 7078636,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 640,
          /*yScale*/ 16778240,
          /*vStart*/ 2294269,
          /*vBurst*/ 721410,
          /*vIntr*/ 2 },
        { /*origin*/ 640,
          /*yScale*/ 50332672,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModePalLan1*/
    { /*type*/ 30,
      /*comRegs*/
      { /*ctrl*/ 12574,
        /*width*/ 320,
        /*burst*/ 73735737,
        /*vSync*/ 525,
        /*hSync*/ 265233,
        /*leap*/ 202968090,
        /*hStart*/ 7078636,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 640,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 },
        { /*origin*/ 640,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModePalLaf1*/
    { /*type*/ 31,
      /*comRegs*/
      { /*ctrl*/ 12382,
        /*width*/ 320,
        /*burst*/ 73735737,
        /*vSync*/ 524,
        /*hSync*/ 3088,
        /*leap*/ 203164700,
        /*hStart*/ 7078636,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 640,
          /*yScale*/ 16778240,
          /*vStart*/ 2294269,
          /*vBurst*/ 721410,
          /*vIntr*/ 2 },
        { /*origin*/ 640,
          /*yScale*/ 50332672,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModePalLpn2*/
    { /*type*/ 32,
      /*comRegs*/
      { /*ctrl*/ 13071,
        /*width*/ 320,
        /*burst*/ 73735737,
        /*vSync*/ 525,
        /*hSync*/ 265233,
        /*leap*/ 202968090,
        /*hStart*/ 7078636,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 },
        { /*origin*/ 1280,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModePalLpf2*/
    { /*type*/ 33,
      /*comRegs*/
      { /*ctrl*/ 12879,
        /*width*/ 320,
        /*burst*/ 73735737,
        /*vSync*/ 524,
        /*hSync*/ 3088,
        /*leap*/ 203164700,
        /*hStart*/ 7078636,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 16778240,
          /*vStart*/ 2294269,
          /*vBurst*/ 721410,
          /*vIntr*/ 2 },
        { /*origin*/ 1280,
          /*yScale*/ 50332672,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModePalLan2*/
    { /*type*/ 34,
      /*comRegs*/
      { /*ctrl*/ 12319,
        /*width*/ 320,
        /*burst*/ 73735737,
        /*vSync*/ 525,
        /*hSync*/ 265233,
        /*leap*/ 202968090,
        /*hStart*/ 7078636,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 },
        { /*origin*/ 1280,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModePalLaf2*/
    { /*type*/ 35,
      /*comRegs*/
      { /*ctrl*/ 12383,
        /*width*/ 320,
        /*burst*/ 73735737,
        /*vSync*/ 524,
        /*hSync*/ 3088,
        /*leap*/ 203164700,
        /*hStart*/ 7078636,
        /*xScale*/ 512,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 16778240,
          /*vStart*/ 2294269,
          /*vBurst*/ 721410,
          /*vIntr*/ 2 },
        { /*origin*/ 1280,
          /*yScale*/ 50332672,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModePalHpn1*/
    { /*type*/ 36,
      /*comRegs*/
      { /*ctrl*/ 12878,
        /*width*/ 1280,
        /*burst*/ 73735737,
        /*vSync*/ 524,
        /*hSync*/ 3088,
        /*leap*/ 203164700,
        /*hStart*/ 7078636,
        /*xScale*/ 1024,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 1024,
          /*vStart*/ 2294269,
          /*vBurst*/ 721410,
          /*vIntr*/ 2 },
        { /*origin*/ 2560,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModePalHpf1*/
    { /*type*/ 37,
      /*comRegs*/
      { /*ctrl*/ 12878,
        /*width*/ 640,
        /*burst*/ 73735737,
        /*vSync*/ 524,
        /*hSync*/ 3088,
        /*leap*/ 203164700,
        /*hStart*/ 7078636,
        /*xScale*/ 1024,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 33556480,
          /*vStart*/ 2294269,
          /*vBurst*/ 721410,
          /*vIntr*/ 2 },
        { /*origin*/ 2560,
          /*yScale*/ 33556480,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModePalHan1*/
    { /*type*/ 38,
      /*comRegs*/
      { /*ctrl*/ 12382,
        /*width*/ 1280,
        /*burst*/ 73735737,
        /*vSync*/ 524,
        /*hSync*/ 3088,
        /*leap*/ 203164700,
        /*hStart*/ 7078636,
        /*xScale*/ 1024,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 1024,
          /*vStart*/ 2294269,
          /*vBurst*/ 721410,
          /*vIntr*/ 2 },
        { /*origin*/ 2560,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModePalHaf1*/
    { /*type*/ 39,
      /*comRegs*/
      { /*ctrl*/ 12382,
        /*width*/ 640,
        /*burst*/ 73735737,
        /*vSync*/ 524,
        /*hSync*/ 3088,
        /*leap*/ 203164700,
        /*hStart*/ 7078636,
        /*xScale*/ 1024,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 1280,
          /*yScale*/ 33556480,
          /*vStart*/ 2294269,
          /*vBurst*/ 721410,
          /*vIntr*/ 2 },
        { /*origin*/ 2560,
          /*yScale*/ 33556480,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModePalHpn2*/
    { /*type*/ 40,
      /*comRegs*/
      { /*ctrl*/ 13135,
        /*width*/ 1280,
        /*burst*/ 73735737,
        /*vSync*/ 524,
        /*hSync*/ 3088,
        /*leap*/ 203164700,
        /*hStart*/ 7078636,
        /*xScale*/ 1024,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 2560,
          /*yScale*/ 1024,
          /*vStart*/ 2294269,
          /*vBurst*/ 721410,
          /*vIntr*/ 2 },
        { /*origin*/ 5120,
          /*yScale*/ 1024,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } },
    /*osViModePalHpf2*/
    { /*type*/ 41,
      /*comRegs*/
      { /*ctrl*/ 12879,
        /*width*/ 640,
        /*burst*/ 73735737,
        /*vSync*/ 524,
        /*hSync*/ 3088,
        /*leap*/ 203164700,
        /*hStart*/ 7078636,
        /*xScale*/ 1024,
        /*vCurrent*/ 0 },
      /*fldRegs*/
      { { /*origin*/ 2560,
          /*yScale*/ 33556480,
          /*vStart*/ 2294269,
          /*vBurst*/ 721410,
          /*vIntr*/ 2 },
        { /*origin*/ 5120,
          /*yScale*/ 33556480,
          /*vStart*/ 2425343,
          /*vBurst*/ 918020,
          /*vIntr*/ 2 } } }
#endif
};

#define OS_VI_MANAGER_MESSAGE_BUFF_SIZE 5

OSMgrArgs viMgrMainArgs = { 0 };
OSThread viMgrThread;
u32 viMgrStack[0x400]; // stack bottom
OSMesgQueue __osViMesgQueue;
OSMesg viMgrMesgBuff[OS_VI_MANAGER_MESSAGE_BUFF_SIZE + 1];

typedef struct {
    u16 unk00;
    u8 unk02;
    u32 unk04;
    u8 pad[0xc];
    u16 unk14;
    u16 unk16;
} viMesgStruct;

viMesgStruct viEventViMesg;
viMesgStruct viEventCounterMesg;

extern void __osTimerServicesInit(void);
extern void __osTimerInterrupt(void);
extern OSTime _osCurrentTime;
extern u32 D_80365DA8;
extern u32 D_80365DAC;
void viMgrMain(void *);

void osCreateViManager(OSPri pri) {
    u32 int_disabled;
    OSPri newPri;
    OSPri currentPri;
    if (!viMgrMainArgs.initialized) {
        __osTimerServicesInit();
        osCreateMesgQueue(&__osViMesgQueue, &viMgrMesgBuff[0], OS_VI_MANAGER_MESSAGE_BUFF_SIZE);
        viEventViMesg.unk00 = 13;
        viEventViMesg.unk02 = 0;
        viEventViMesg.unk04 = 0;
        viEventCounterMesg.unk00 = 14;
        viEventCounterMesg.unk02 = 0;
        viEventCounterMesg.unk04 = 0;
        osSetEventMesg(OS_EVENT_VI, &__osViMesgQueue, &viEventViMesg);
        osSetEventMesg(OS_EVENT_COUNTER, &__osViMesgQueue, &viEventCounterMesg);
        newPri = -1;
        currentPri = osGetThreadPri(NULL);
        if (currentPri < pri) {
            newPri = currentPri;
            osSetThreadPri(NULL, pri);
        }
        int_disabled = __osDisableInt();
        viMgrMainArgs.initialized = TRUE;
        viMgrMainArgs.mgrThread = &viMgrThread;
        viMgrMainArgs.unk08 = &__osViMesgQueue;
        viMgrMainArgs.unk0c = &__osViMesgQueue;
        viMgrMainArgs.unk10 = NULL;
        viMgrMainArgs.dma_func = NULL;
        osCreateThread(&viMgrThread, 0, viMgrMain, (void *) &viMgrMainArgs, &viMgrStack[0x400], pri);
        __osViInit();
        osStartThread(&viMgrThread);
        __osRestoreInt(int_disabled);
        if (newPri != -1) {
            osSetThreadPri(NULL, newPri);
        }
    }
}

void viMgrMain(void *vargs) {
    OSViContext *context;
    OSMgrArgs *args;
    OSMesg mesg;
    u32 sp28; // always 0
    u32 sp24; // time related
    mesg = NULL;
    sp28 = FALSE;
    context = __osViGetCurrentContext();

    if ((viEventCounterMesg.unk14 = context->retraceCount) == 0) {
        viEventCounterMesg.unk14 = 1;
    }

    args = (OSMgrArgs *) vargs;

    while (1) {
        osRecvMesg(args->unk0c, &mesg, OS_MESG_BLOCK);
        switch (*(u16 *) mesg) {
            case 13:
                __osViSwapContext();
                if (!--viEventCounterMesg.unk14) {
                    context = __osViGetCurrentContext();
                    if (context->mq != NULL) {
                        osSendMesg(context->mq, context->msg, OS_MESG_NOBLOCK);
                    }
                    viEventCounterMesg.unk14 = context->retraceCount;
                }
                D_80365DAC++;
                if (sp28) {
                    sp24 = osGetCount();
                    _osCurrentTime = sp24;
                    sp28 = 0;
                }
                sp24 = D_80365DA8;
                D_80365DA8 = osGetCount();
                sp24 = D_80365DA8 - sp24;
                _osCurrentTime = _osCurrentTime + sp24;
                break;

            case 14:
                __osTimerInterrupt();
                break;
        }
    }
}
