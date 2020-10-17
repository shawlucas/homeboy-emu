# _frameGCNcc.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel SetTevStageTable
/* 09CE90 800A2430 7C0802A6 */  mflr    r0
/* 09CE94 800A2434 38E40000 */  addi    r7, r4, 0
/* 09CE98 800A2438 90010004 */  stw     r0, 4(r1)
/* 09CE9C 800A243C 9421FFE8 */  stwu    r1, -0x18(r1)
/* 09CEA0 800A2440 93E10014 */  stw     r31, 0x14(r1)
/* 09CEA4 800A2444 3BE30000 */  addi    r31, r3, 0
/* 09CEA8 800A2448 80AD8EE0 */  lwz     r5, gpSystem-_SDA_BASE_(r13)
/* 09CEAC 800A244C 80050020 */  lwz     r0, 0x20(r5)
/* 09CEB0 800A2450 2C000005 */  cmpwi   r0, 5
/* 09CEB4 800A2454 40820050 */  bne     lbl_800A24A4
/* 09CEB8 800A2458 807F0098 */  lwz     r3, 0x98(r31)
/* 09CEBC 800A245C 3C03E0FC */  addis   r0, r3, 0xe0fc
/* 09CEC0 800A2460 28000501 */  cmplwi  r0, 0x501
/* 09CEC4 800A2464 40820040 */  bne     lbl_800A24A4
/* 09CEC8 800A2468 807F00A0 */  lwz     r3, 0xa0(r31)
/* 09CECC 800A246C 3C03F8FD */  addis   r0, r3, 0xf8fd
/* 09CED0 800A2470 28000701 */  cmplwi  r0, 0x701
/* 09CED4 800A2474 40820030 */  bne     lbl_800A24A4
/* 09CED8 800A2478 807F009C */  lwz     r3, 0x9c(r31)
/* 09CEDC 800A247C 3C03FBFC */  addis   r0, r3, 0xfbfc
/* 09CEE0 800A2480 28000300 */  cmplwi  r0, 0x300
/* 09CEE4 800A2484 40820020 */  bne     lbl_800A24A4
/* 09CEE8 800A2488 807F00A4 */  lwz     r3, 0xa4(r31)
/* 09CEEC 800A248C 3C03F8FB */  addis   r0, r3, 0xf8fb
/* 09CEF0 800A2490 28000706 */  cmplwi  r0, 0x706
/* 09CEF4 800A2494 40820010 */  bne     lbl_800A24A4
/* 09CEF8 800A2498 3C601F04 */  lis     r3, 0x1f04
/* 09CEFC 800A249C 38030300 */  addi    r0, r3, 0x300
/* 09CF00 800A24A0 901F009C */  stw     r0, 0x9c(r31)
lbl_800A24A4:
/* 09CF04 800A24A4 2C070002 */  cmpwi   r7, 2
/* 09CF08 800A24A8 807F0098 */  lwz     r3, 0x98(r31)
/* 09CF0C 800A24AC 809F00A0 */  lwz     r4, 0xa0(r31)
/* 09CF10 800A24B0 40820010 */  bne     lbl_800A24C0
/* 09CF14 800A24B4 80BF009C */  lwz     r5, 0x9c(r31)
/* 09CF18 800A24B8 80DF00A4 */  lwz     r6, 0xa4(r31)
/* 09CF1C 800A24BC 4800000C */  b       lbl_800A24C8
lbl_800A24C0:
/* 09CF20 800A24C0 38C00000 */  li      r6, 0
/* 09CF24 800A24C4 38A00000 */  li      r5, 0
lbl_800A24C8:
/* 09CF28 800A24C8 48000871 */  bl      BuildCombineModeTev
/* 09CF2C 800A24CC 38830000 */  addi    r4, r3, 0
/* 09CF30 800A24D0 387F0000 */  addi    r3, r31, 0
/* 09CF34 800A24D4 48000561 */  bl      SetTableTevStages
/* 09CF38 800A24D8 8001001C */  lwz     r0, 0x1c(r1)
/* 09CF3C 800A24DC 38600001 */  li      r3, 1
/* 09CF40 800A24E0 83E10014 */  lwz     r31, 0x14(r1)
/* 09CF44 800A24E4 38210018 */  addi    r1, r1, 0x18
/* 09CF48 800A24E8 7C0803A6 */  mtlr    r0
/* 09CF4C 800A24EC 4E800020 */  blr     

glabel SetTevStages
/* 09CF50 800A24F0 7C0802A6 */  mflr    r0
/* 09CF54 800A24F4 90010004 */  stw     r0, 4(r1)
/* 09CF58 800A24F8 9421FF60 */  stwu    r1, -0xa0(r1)
/* 09CF5C 800A24FC BE210064 */  stmw    r17, 0x64(r1)
/* 09CF60 800A2500 7C912379 */  or.     r17, r4, r4
/* 09CF64 800A2504 3C808010 */  lis     r4, gCombinedColor@ha
/* 09CF68 800A2508 3B84D988 */  addi    r28, r4, gCombinedColor@l
/* 09CF6C 800A250C 3A400000 */  li      r18, 0
/* 09CF70 800A2510 40820010 */  bne     lbl_800A2520
/* 09CF74 800A2514 80C30098 */  lwz     r6, 0x98(r3)
/* 09CF78 800A2518 812300A0 */  lwz     r9, 0xa0(r3)
/* 09CF7C 800A251C 4800000C */  b       lbl_800A2528
lbl_800A2520:
/* 09CF80 800A2520 80C3009C */  lwz     r6, 0x9c(r3)
/* 09CF84 800A2524 812300A4 */  lwz     r9, 0xa4(r3)
lbl_800A2528:
/* 09CF88 800A2528 98C1005C */  stb     r6, 0x5c(r1)
/* 09CF8C 800A252C 54C3C63E */  rlwinm  r3, r6, 0x18, 0x18, 0x1f
/* 09CF90 800A2530 5520C63E */  rlwinm  r0, r9, 0x18, 0x18, 0x1f
/* 09CF94 800A2534 99210058 */  stb     r9, 0x58(r1)
/* 09CF98 800A2538 1D110005 */  mulli   r8, r17, 5
/* 09CF9C 800A253C 9861005D */  stb     r3, 0x5d(r1)
/* 09CFA0 800A2540 54C4863E */  rlwinm  r4, r6, 0x10, 0x18, 0x1f
/* 09CFA4 800A2544 98010059 */  stb     r0, 0x59(r1)
/* 09CFA8 800A2548 5523863E */  rlwinm  r3, r9, 0x10, 0x18, 0x1f
/* 09CFAC 800A254C 54C7463E */  srwi    r7, r6, 0x18
/* 09CFB0 800A2550 9881005E */  stb     r4, 0x5e(r1)
/* 09CFB4 800A2554 5505103A */  slwi    r5, r8, 2
/* 09CFB8 800A2558 38080001 */  addi    r0, r8, 1
/* 09CFBC 800A255C 5404103A */  slwi    r4, r0, 2
/* 09CFC0 800A2560 9861005A */  stb     r3, 0x5a(r1)
/* 09CFC4 800A2564 5526463E */  srwi    r6, r9, 0x18
/* 09CFC8 800A2568 38080002 */  addi    r0, r8, 2
/* 09CFCC 800A256C 98E1005F */  stb     r7, 0x5f(r1)
/* 09CFD0 800A2570 5403103A */  slwi    r3, r0, 2
/* 09CFD4 800A2574 38080003 */  addi    r0, r8, 3
/* 09CFD8 800A2578 98C1005B */  stb     r6, 0x5b(r1)
/* 09CFDC 800A257C 7CBC2A14 */  add     r5, r28, r5
/* 09CFE0 800A2580 80A50060 */  lwz     r5, 0x60(r5)
/* 09CFE4 800A2584 5400103A */  slwi    r0, r0, 2
/* 09CFE8 800A2588 7CDC0214 */  add     r6, r28, r0
/* 09CFEC 800A258C 38080004 */  addi    r0, r8, 4
/* 09CFF0 800A2590 90A10024 */  stw     r5, 0x24(r1)
/* 09CFF4 800A2594 7C9C2214 */  add     r4, r28, r4
/* 09CFF8 800A2598 80840060 */  lwz     r4, 0x60(r4)
/* 09CFFC 800A259C 5400103A */  slwi    r0, r0, 2
/* 09D000 800A25A0 7C7C1A14 */  add     r3, r28, r3
/* 09D004 800A25A4 90810028 */  stw     r4, 0x28(r1)
/* 09D008 800A25A8 7CBC0214 */  add     r5, r28, r0
/* 09D00C 800A25AC 3C80800F */  lis     r4, ganNameTexCoord@ha
/* 09D010 800A25B0 80030060 */  lwz     r0, 0x60(r3)
/* 09D014 800A25B4 3C60800F */  lis     r3, ganNamePixel@ha
/* 09D018 800A25B8 3B41005C */  addi    r26, r1, 0x5c
/* 09D01C 800A25BC 9001002C */  stw     r0, 0x2c(r1)
/* 09D020 800A25C0 3B210058 */  addi    r25, r1, 0x58
/* 09D024 800A25C4 3B010048 */  addi    r24, r1, 0x48
/* 09D028 800A25C8 80060060 */  lwz     r0, 0x60(r6)
/* 09D02C 800A25CC 3AE10038 */  addi    r23, r1, 0x38
/* 09D030 800A25D0 3BE10024 */  addi    r31, r1, 0x24
/* 09D034 800A25D4 90010030 */  stw     r0, 0x30(r1)
/* 09D038 800A25D8 3BA469C8 */  addi    r29, r4, ganNameTexCoord@l
/* 09D03C 800A25DC 3BC36988 */  addi    r30, r3, ganNamePixel@l
/* 09D040 800A25E0 80050060 */  lwz     r0, 0x60(r5)
/* 09D044 800A25E4 3A600000 */  li      r19, 0
/* 09D048 800A25E8 3B6D8C40 */  addi    r27, r13, sOrder-_SDA_BASE_
/* 09D04C 800A25EC 90010034 */  stw     r0, 0x34(r1)
lbl_800A25F0:
/* 09D050 800A25F0 8ADB0000 */  lbz     r22, 0(r27)
/* 09D054 800A25F4 887A0000 */  lbz     r3, 0(r26)
/* 09D058 800A25F8 56C02036 */  slwi    r0, r22, 4
/* 09D05C 800A25FC 7EBC0214 */  add     r21, r28, r0
/* 09D060 800A2600 7E9C0214 */  add     r20, r28, r0
/* 09D064 800A2604 28030001 */  cmplwi  r3, 1
/* 09D068 800A2608 3AB50104 */  addi    r21, r21, 0x104
/* 09D06C 800A260C 3A940154 */  addi    r20, r20, 0x154
/* 09D070 800A2610 41820010 */  beq     lbl_800A2620
/* 09D074 800A2614 88190000 */  lbz     r0, 0(r25)
/* 09D078 800A2618 28000001 */  cmplwi  r0, 1
/* 09D07C 800A261C 4082002C */  bne     lbl_800A2648
lbl_800A2620:
/* 09D080 800A2620 56C0103A */  slwi    r0, r22, 2
/* 09D084 800A2624 809D0000 */  lwz     r4, 0(r29)
/* 09D088 800A2628 7C7F002E */  lwzx    r3, r31, r0
/* 09D08C 800A262C 38C00004 */  li      r6, 4
/* 09D090 800A2630 80BE0000 */  lwz     r5, 0(r30)
/* 09D094 800A2634 480171F1 */  bl      GXSetTevOrder
/* 09D098 800A2638 38000001 */  li      r0, 1
/* 09D09C 800A263C 7C009830 */  slw     r0, r0, r19
/* 09D0A0 800A2640 7E520378 */  or      r18, r18, r0
/* 09D0A4 800A2644 48000058 */  b       lbl_800A269C
lbl_800A2648:
/* 09D0A8 800A2648 28030002 */  cmplwi  r3, 2
/* 09D0AC 800A264C 4182000C */  beq     lbl_800A2658
/* 09D0B0 800A2650 28000002 */  cmplwi  r0, 2
/* 09D0B4 800A2654 40820030 */  bne     lbl_800A2684
lbl_800A2658:
/* 09D0B8 800A2658 56C0103A */  slwi    r0, r22, 2
/* 09D0BC 800A265C 809D0004 */  lwz     r4, 4(r29)
/* 09D0C0 800A2660 7C7F002E */  lwzx    r3, r31, r0
/* 09D0C4 800A2664 38C00004 */  li      r6, 4
/* 09D0C8 800A2668 80BE0004 */  lwz     r5, 4(r30)
/* 09D0CC 800A266C 480171B9 */  bl      GXSetTevOrder
/* 09D0D0 800A2670 38130004 */  addi    r0, r19, 4
/* 09D0D4 800A2674 38600001 */  li      r3, 1
/* 09D0D8 800A2678 7C600030 */  slw     r0, r3, r0
/* 09D0DC 800A267C 7E520378 */  or      r18, r18, r0
/* 09D0E0 800A2680 4800001C */  b       lbl_800A269C
lbl_800A2684:
/* 09D0E4 800A2684 56C0103A */  slwi    r0, r22, 2
/* 09D0E8 800A2688 7C7F002E */  lwzx    r3, r31, r0
/* 09D0EC 800A268C 388000FF */  li      r4, 0xff
/* 09D0F0 800A2690 38A000FF */  li      r5, 0xff
/* 09D0F4 800A2694 38C00004 */  li      r6, 4
/* 09D0F8 800A2698 4801718D */  bl      GXSetTevOrder
lbl_800A269C:
/* 09D0FC 800A269C 2C110000 */  cmpwi   r17, 0
/* 09D100 800A26A0 40820020 */  bne     lbl_800A26C0
/* 09D104 800A26A4 88190000 */  lbz     r0, 0(r25)
/* 09D108 800A26A8 28000000 */  cmplwi  r0, 0
/* 09D10C 800A26AC 4182000C */  beq     lbl_800A26B8
/* 09D110 800A26B0 28000006 */  cmplwi  r0, 6
/* 09D114 800A26B4 4082000C */  bne     lbl_800A26C0
lbl_800A26B8:
/* 09D118 800A26B8 38000007 */  li      r0, 7
/* 09D11C 800A26BC 98190000 */  stb     r0, 0(r25)
lbl_800A26C0:
/* 09D120 800A26C0 881A0000 */  lbz     r0, 0(r26)
/* 09D124 800A26C4 2800001F */  cmplwi  r0, 0x1f
/* 09D128 800A26C8 40820010 */  bne     lbl_800A26D8
/* 09D12C 800A26CC 3800000F */  li      r0, 0xf
/* 09D130 800A26D0 981A0000 */  stb     r0, 0(r26)
/* 09D134 800A26D4 48000030 */  b       lbl_800A2704
lbl_800A26D8:
/* 09D138 800A26D8 2800000C */  cmplwi  r0, 0xc
/* 09D13C 800A26DC 40820018 */  bne     lbl_800A26F4
/* 09D140 800A26E0 56C0103A */  slwi    r0, r22, 2
/* 09D144 800A26E4 7C7F002E */  lwzx    r3, r31, r0
/* 09D148 800A26E8 3880001D */  li      r4, 0x1d
/* 09D14C 800A26EC 48016EE9 */  bl      GXSetTevKColorSel
/* 09D150 800A26F0 48000014 */  b       lbl_800A2704
lbl_800A26F4:
/* 09D154 800A26F4 56C0103A */  slwi    r0, r22, 2
/* 09D158 800A26F8 7C7F002E */  lwzx    r3, r31, r0
/* 09D15C 800A26FC 3880000D */  li      r4, 0xd
/* 09D160 800A2700 48016ED5 */  bl      GXSetTevKColorSel
lbl_800A2704:
/* 09D164 800A2704 88190000 */  lbz     r0, 0(r25)
/* 09D168 800A2708 28000005 */  cmplwi  r0, 5
/* 09D16C 800A270C 40820018 */  bne     lbl_800A2724
/* 09D170 800A2710 56C0103A */  slwi    r0, r22, 2
/* 09D174 800A2714 7C7F002E */  lwzx    r3, r31, r0
/* 09D178 800A2718 3880001D */  li      r4, 0x1d
/* 09D17C 800A271C 48016F15 */  bl      GXSetTevKAlphaSel
/* 09D180 800A2720 48000014 */  b       lbl_800A2734
lbl_800A2724:
/* 09D184 800A2724 56C0103A */  slwi    r0, r22, 2
/* 09D188 800A2728 7C7F002E */  lwzx    r3, r31, r0
/* 09D18C 800A272C 38800000 */  li      r4, 0
/* 09D190 800A2730 48016F01 */  bl      GXSetTevKAlphaSel
lbl_800A2734:
/* 09D194 800A2734 881A0000 */  lbz     r0, 0(r26)
/* 09D198 800A2738 388D8C48 */  addi    r4, r13, sReplace-_SDA_BASE_
/* 09D19C 800A273C 3A730001 */  addi    r19, r19, 1
/* 09D1A0 800A2740 5400103A */  slwi    r0, r0, 2
/* 09D1A4 800A2744 7C1C002E */  lwzx    r0, r28, r0
/* 09D1A8 800A2748 7C84B214 */  add     r4, r4, r22
/* 09D1AC 800A274C 2C130004 */  cmpwi   r19, 4
/* 09D1B0 800A2750 90180000 */  stw     r0, 0(r24)
/* 09D1B4 800A2754 3B7B0001 */  addi    r27, r27, 1
/* 09D1B8 800A2758 3B5A0001 */  addi    r26, r26, 1
/* 09D1BC 800A275C 88190000 */  lbz     r0, 0(r25)
/* 09D1C0 800A2760 3B390001 */  addi    r25, r25, 1
/* 09D1C4 800A2764 5400103A */  slwi    r0, r0, 2
/* 09D1C8 800A2768 7C7C0214 */  add     r3, r28, r0
/* 09D1CC 800A276C 80030040 */  lwz     r0, 0x40(r3)
/* 09D1D0 800A2770 90170000 */  stw     r0, 0(r23)
/* 09D1D4 800A2774 88040000 */  lbz     r0, 0(r4)
/* 09D1D8 800A2778 80780000 */  lwz     r3, 0(r24)
/* 09D1DC 800A277C 3B180004 */  addi    r24, r24, 4
/* 09D1E0 800A2780 5400103A */  slwi    r0, r0, 2
/* 09D1E4 800A2784 7C75012E */  stwx    r3, r21, r0
/* 09D1E8 800A2788 88040000 */  lbz     r0, 0(r4)
/* 09D1EC 800A278C 80770000 */  lwz     r3, 0(r23)
/* 09D1F0 800A2790 3AF70004 */  addi    r23, r23, 4
/* 09D1F4 800A2794 5400103A */  slwi    r0, r0, 2
/* 09D1F8 800A2798 7C74012E */  stwx    r3, r20, r0
/* 09D1FC 800A279C 4180FE54 */  blt     lbl_800A25F0
/* 09D200 800A27A0 386D8C40 */  addi    r3, r13, sOrder-_SDA_BASE_
/* 09D204 800A27A4 7C0398AE */  lbzx    r0, r3, r19
/* 09D208 800A27A8 3A210024 */  addi    r17, r1, 0x24
/* 09D20C 800A27AC 388000FF */  li      r4, 0xff
/* 09D210 800A27B0 5400103A */  slwi    r0, r0, 2
/* 09D214 800A27B4 7C71002E */  lwzx    r3, r17, r0
/* 09D218 800A27B8 38A000FF */  li      r5, 0xff
/* 09D21C 800A27BC 38C00004 */  li      r6, 4
/* 09D220 800A27C0 48017065 */  bl      GXSetTevOrder
/* 09D224 800A27C4 3AA00000 */  li      r21, 0
/* 09D228 800A27C8 56A0103A */  slwi    r0, r21, 2
/* 09D22C 800A27CC 3A5C00A0 */  addi    r18, r28, 0xa0
/* 09D230 800A27D0 3A7C0104 */  addi    r19, r28, 0x104
/* 09D234 800A27D4 3A9C0154 */  addi    r20, r28, 0x154
/* 09D238 800A27D8 7E310214 */  add     r17, r17, r0
lbl_800A27DC:
/* 09D23C 800A27DC 80710000 */  lwz     r3, 0(r17)
/* 09D240 800A27E0 80920000 */  lwz     r4, 0(r18)
/* 09D244 800A27E4 80B20004 */  lwz     r5, 4(r18)
/* 09D248 800A27E8 80D20008 */  lwz     r6, 8(r18)
/* 09D24C 800A27EC 88F2000C */  lbz     r7, 0xc(r18)
/* 09D250 800A27F0 81120010 */  lwz     r8, 0x10(r18)
/* 09D254 800A27F4 48016BA5 */  bl      GXSetTevColorOp
/* 09D258 800A27F8 80710000 */  lwz     r3, 0(r17)
/* 09D25C 800A27FC 80920000 */  lwz     r4, 0(r18)
/* 09D260 800A2800 80B20004 */  lwz     r5, 4(r18)
/* 09D264 800A2804 80D20008 */  lwz     r6, 8(r18)
/* 09D268 800A2808 88F2000C */  lbz     r7, 0xc(r18)
/* 09D26C 800A280C 81120010 */  lwz     r8, 0x10(r18)
/* 09D270 800A2810 48016BF1 */  bl      GXSetTevAlphaOp
/* 09D274 800A2814 80710000 */  lwz     r3, 0(r17)
/* 09D278 800A2818 80930000 */  lwz     r4, 0(r19)
/* 09D27C 800A281C 80B30004 */  lwz     r5, 4(r19)
/* 09D280 800A2820 80D30008 */  lwz     r6, 8(r19)
/* 09D284 800A2824 80F3000C */  lwz     r7, 0xc(r19)
/* 09D288 800A2828 48016AE9 */  bl      GXSetTevColorIn
/* 09D28C 800A282C 80710000 */  lwz     r3, 0(r17)
/* 09D290 800A2830 80940000 */  lwz     r4, 0(r20)
/* 09D294 800A2834 80B40004 */  lwz     r5, 4(r20)
/* 09D298 800A2838 80D40008 */  lwz     r6, 8(r20)
/* 09D29C 800A283C 80F4000C */  lwz     r7, 0xc(r20)
/* 09D2A0 800A2840 48016B15 */  bl      GXSetTevAlphaIn
/* 09D2A4 800A2844 3AB50001 */  addi    r21, r21, 1
/* 09D2A8 800A2848 2C150005 */  cmpwi   r21, 5
/* 09D2AC 800A284C 3A520014 */  addi    r18, r18, 0x14
/* 09D2B0 800A2850 3A730010 */  addi    r19, r19, 0x10
/* 09D2B4 800A2854 3A940010 */  addi    r20, r20, 0x10
/* 09D2B8 800A2858 3A310004 */  addi    r17, r17, 4
/* 09D2BC 800A285C 4180FF80 */  blt     lbl_800A27DC
/* 09D2C0 800A2860 BA210064 */  lmw     r17, 0x64(r1)
/* 09D2C4 800A2864 800100A4 */  lwz     r0, 0xa4(r1)
/* 09D2C8 800A2868 382100A0 */  addi    r1, r1, 0xa0
/* 09D2CC 800A286C 7C0803A6 */  mtlr    r0
/* 09D2D0 800A2870 4E800020 */  blr     

glabel SetNumTexGensChans
/* 09D2D4 800A2874 7C0802A6 */  mflr    r0
/* 09D2D8 800A2878 2C040000 */  cmpwi   r4, 0
/* 09D2DC 800A287C 90010004 */  stw     r0, 4(r1)
/* 09D2E0 800A2880 7C8903A6 */  mtctr   r4
/* 09D2E4 800A2884 39200000 */  li      r9, 0
/* 09D2E8 800A2888 9421FFE8 */  stwu    r1, -0x18(r1)
/* 09D2EC 800A288C 39000000 */  li      r8, 0
/* 09D2F0 800A2890 40810184 */  ble     lbl_800A2A14
lbl_800A2894:
/* 09D2F4 800A2894 2C080000 */  cmpwi   r8, 0
/* 09D2F8 800A2898 40820010 */  bne     lbl_800A28A8
/* 09D2FC 800A289C 80A30098 */  lwz     r5, 0x98(r3)
/* 09D300 800A28A0 80E300A0 */  lwz     r7, 0xa0(r3)
/* 09D304 800A28A4 4800000C */  b       lbl_800A28B0
lbl_800A28A8:
/* 09D308 800A28A8 80A3009C */  lwz     r5, 0x9c(r3)
/* 09D30C 800A28AC 80E300A4 */  lwz     r7, 0xa4(r3)
lbl_800A28B0:
/* 09D310 800A28B0 98A10014 */  stb     r5, 0x14(r1)
/* 09D314 800A28B4 54A4C63E */  rlwinm  r4, r5, 0x18, 0x18, 0x1f
/* 09D318 800A28B8 54E0C63E */  rlwinm  r0, r7, 0x18, 0x18, 0x1f
/* 09D31C 800A28BC 98E10010 */  stb     r7, 0x10(r1)
/* 09D320 800A28C0 54A6863E */  rlwinm  r6, r5, 0x10, 0x18, 0x1f
/* 09D324 800A28C4 54A5463E */  srwi    r5, r5, 0x18
/* 09D328 800A28C8 98810015 */  stb     r4, 0x15(r1)
/* 09D32C 800A28CC 54E4863E */  rlwinm  r4, r7, 0x10, 0x18, 0x1f
/* 09D330 800A28D0 98010011 */  stb     r0, 0x11(r1)
/* 09D334 800A28D4 54E0463E */  srwi    r0, r7, 0x18
/* 09D338 800A28D8 38E10014 */  addi    r7, r1, 0x14
/* 09D33C 800A28DC 98C10016 */  stb     r6, 0x16(r1)
/* 09D340 800A28E0 38C10010 */  addi    r6, r1, 0x10
/* 09D344 800A28E4 98810012 */  stb     r4, 0x12(r1)
/* 09D348 800A28E8 98A10017 */  stb     r5, 0x17(r1)
/* 09D34C 800A28EC 98010013 */  stb     r0, 0x13(r1)
/* 09D350 800A28F0 88010014 */  lbz     r0, 0x14(r1)
/* 09D354 800A28F4 28000001 */  cmplwi  r0, 1
/* 09D358 800A28F8 41820010 */  beq     lbl_800A2908
/* 09D35C 800A28FC 88810010 */  lbz     r4, 0x10(r1)
/* 09D360 800A2900 28040001 */  cmplwi  r4, 1
/* 09D364 800A2904 40820014 */  bne     lbl_800A2918
lbl_800A2908:
/* 09D368 800A2908 2C090000 */  cmpwi   r9, 0
/* 09D36C 800A290C 41810028 */  bgt     lbl_800A2934
/* 09D370 800A2910 39200001 */  li      r9, 1
/* 09D374 800A2914 48000020 */  b       lbl_800A2934
lbl_800A2918:
/* 09D378 800A2918 28000002 */  cmplwi  r0, 2
/* 09D37C 800A291C 4182000C */  beq     lbl_800A2928
/* 09D380 800A2920 28040002 */  cmplwi  r4, 2
/* 09D384 800A2924 40820010 */  bne     lbl_800A2934
lbl_800A2928:
/* 09D388 800A2928 2C090001 */  cmpwi   r9, 1
/* 09D38C 800A292C 41810008 */  bgt     lbl_800A2934
/* 09D390 800A2930 39200002 */  li      r9, 2
lbl_800A2934:
/* 09D394 800A2934 8C070001 */  lbzu    r0, 1(r7)
/* 09D398 800A2938 38C60001 */  addi    r6, r6, 1
/* 09D39C 800A293C 28000001 */  cmplwi  r0, 1
/* 09D3A0 800A2940 41820010 */  beq     lbl_800A2950
/* 09D3A4 800A2944 88860000 */  lbz     r4, 0(r6)
/* 09D3A8 800A2948 28040001 */  cmplwi  r4, 1
/* 09D3AC 800A294C 40820014 */  bne     lbl_800A2960
lbl_800A2950:
/* 09D3B0 800A2950 2C090000 */  cmpwi   r9, 0
/* 09D3B4 800A2954 41810028 */  bgt     lbl_800A297C
/* 09D3B8 800A2958 39200001 */  li      r9, 1
/* 09D3BC 800A295C 48000020 */  b       lbl_800A297C
lbl_800A2960:
/* 09D3C0 800A2960 28000002 */  cmplwi  r0, 2
/* 09D3C4 800A2964 4182000C */  beq     lbl_800A2970
/* 09D3C8 800A2968 28040002 */  cmplwi  r4, 2
/* 09D3CC 800A296C 40820010 */  bne     lbl_800A297C
lbl_800A2970:
/* 09D3D0 800A2970 2C090001 */  cmpwi   r9, 1
/* 09D3D4 800A2974 41810008 */  bgt     lbl_800A297C
/* 09D3D8 800A2978 39200002 */  li      r9, 2
lbl_800A297C:
/* 09D3DC 800A297C 8C070001 */  lbzu    r0, 1(r7)
/* 09D3E0 800A2980 38C60001 */  addi    r6, r6, 1
/* 09D3E4 800A2984 28000001 */  cmplwi  r0, 1
/* 09D3E8 800A2988 41820010 */  beq     lbl_800A2998
/* 09D3EC 800A298C 88860000 */  lbz     r4, 0(r6)
/* 09D3F0 800A2990 28040001 */  cmplwi  r4, 1
/* 09D3F4 800A2994 40820014 */  bne     lbl_800A29A8
lbl_800A2998:
/* 09D3F8 800A2998 2C090000 */  cmpwi   r9, 0
/* 09D3FC 800A299C 41810028 */  bgt     lbl_800A29C4
/* 09D400 800A29A0 39200001 */  li      r9, 1
/* 09D404 800A29A4 48000020 */  b       lbl_800A29C4
lbl_800A29A8:
/* 09D408 800A29A8 28000002 */  cmplwi  r0, 2
/* 09D40C 800A29AC 4182000C */  beq     lbl_800A29B8
/* 09D410 800A29B0 28040002 */  cmplwi  r4, 2
/* 09D414 800A29B4 40820010 */  bne     lbl_800A29C4
lbl_800A29B8:
/* 09D418 800A29B8 2C090001 */  cmpwi   r9, 1
/* 09D41C 800A29BC 41810008 */  bgt     lbl_800A29C4
/* 09D420 800A29C0 39200002 */  li      r9, 2
lbl_800A29C4:
/* 09D424 800A29C4 88070001 */  lbz     r0, 1(r7)
/* 09D428 800A29C8 38C60001 */  addi    r6, r6, 1
/* 09D42C 800A29CC 28000001 */  cmplwi  r0, 1
/* 09D430 800A29D0 41820010 */  beq     lbl_800A29E0
/* 09D434 800A29D4 88860000 */  lbz     r4, 0(r6)
/* 09D438 800A29D8 28040001 */  cmplwi  r4, 1
/* 09D43C 800A29DC 40820014 */  bne     lbl_800A29F0
lbl_800A29E0:
/* 09D440 800A29E0 2C090000 */  cmpwi   r9, 0
/* 09D444 800A29E4 41810028 */  bgt     lbl_800A2A0C
/* 09D448 800A29E8 39200001 */  li      r9, 1
/* 09D44C 800A29EC 48000020 */  b       lbl_800A2A0C
lbl_800A29F0:
/* 09D450 800A29F0 28000002 */  cmplwi  r0, 2
/* 09D454 800A29F4 4182000C */  beq     lbl_800A2A00
/* 09D458 800A29F8 28040002 */  cmplwi  r4, 2
/* 09D45C 800A29FC 40820010 */  bne     lbl_800A2A0C
lbl_800A2A00:
/* 09D460 800A2A00 2C090001 */  cmpwi   r9, 1
/* 09D464 800A2A04 41810008 */  bgt     lbl_800A2A0C
/* 09D468 800A2A08 39200002 */  li      r9, 2
lbl_800A2A0C:
/* 09D46C 800A2A0C 39080001 */  addi    r8, r8, 1
/* 09D470 800A2A10 4200FE84 */  bdnz    lbl_800A2894
lbl_800A2A14:
/* 09D474 800A2A14 5523063E */  clrlwi  r3, r9, 0x18
/* 09D478 800A2A18 48013B11 */  bl      GXSetNumTexGens
/* 09D47C 800A2A1C 38600001 */  li      r3, 1
/* 09D480 800A2A20 48015655 */  bl      GXSetNumChans
/* 09D484 800A2A24 8001001C */  lwz     r0, 0x1c(r1)
/* 09D488 800A2A28 38210018 */  addi    r1, r1, 0x18
/* 09D48C 800A2A2C 7C0803A6 */  mtlr    r0
/* 09D490 800A2A30 4E800020 */  blr     

SetTableTevStages:
/* 09D494 800A2A34 7C0802A6 */  mflr    r0
/* 09D498 800A2A38 90010004 */  stw     r0, 4(r1)
/* 09D49C 800A2A3C 9421FF88 */  stwu    r1, -0x78(r1)
/* 09D4A0 800A2A40 BE810048 */  stmw    r20, 0x48(r1)
/* 09D4A4 800A2A44 7C7E1B78 */  mr      r30, r3
/* 09D4A8 800A2A48 3BE40000 */  addi    r31, r4, 0
/* 09D4AC 800A2A4C 80630090 */  lwz     r3, 0x90(r3)
/* 09D4B0 800A2A50 546017BE */  srwi    r0, r3, 0x1e
/* 09D4B4 800A2A54 28000003 */  cmplwi  r0, 3
/* 09D4B8 800A2A58 4082002C */  bne     lbl_800A2A84
/* 09D4BC 800A2A5C 546037BE */  rlwinm  r0, r3, 6, 0x1e, 0x1f
/* 09D4C0 800A2A60 28000001 */  cmplwi  r0, 1
/* 09D4C4 800A2A64 40820020 */  bne     lbl_800A2A84
/* 09D4C8 800A2A68 801F0014 */  lwz     r0, 0x14(r31)
/* 09D4CC 800A2A6C 5400077B */  rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 09D4D0 800A2A70 40820014 */  bne     lbl_800A2A84
/* 09D4D4 800A2A74 887F0011 */  lbz     r3, 0x11(r31)
/* 09D4D8 800A2A78 38630001 */  addi    r3, r3, 1
/* 09D4DC 800A2A7C 48016F45 */  bl      GXSetNumTevStages
/* 09D4E0 800A2A80 4800000C */  b       lbl_800A2A8C
lbl_800A2A84:
/* 09D4E4 800A2A84 887F0011 */  lbz     r3, 0x11(r31)
/* 09D4E8 800A2A88 48016F39 */  bl      GXSetNumTevStages
lbl_800A2A8C:
/* 09D4EC 800A2A8C 887F0012 */  lbz     r3, 0x12(r31)
/* 09D4F0 800A2A90 48013A99 */  bl      GXSetNumTexGens
/* 09D4F4 800A2A94 881F0012 */  lbz     r0, 0x12(r31)
/* 09D4F8 800A2A98 28000000 */  cmplwi  r0, 0
/* 09D4FC 800A2A9C 4182000C */  beq     lbl_800A2AA8
/* 09D500 800A2AA0 881F0013 */  lbz     r0, 0x13(r31)
/* 09D504 800A2AA4 48000008 */  b       lbl_800A2AAC
lbl_800A2AA8:
/* 09D508 800A2AA8 38000001 */  li      r0, 1
lbl_800A2AAC:
/* 09D50C 800A2AAC 5403063E */  clrlwi  r3, r0, 0x18
/* 09D510 800A2AB0 480155C5 */  bl      GXSetNumChans
/* 09D514 800A2AB4 801F0014 */  lwz     r0, 0x14(r31)
/* 09D518 800A2AB8 540007BD */  rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 09D51C 800A2ABC 4182001C */  beq     lbl_800A2AD8
/* 09D520 800A2AC0 3C7E0004 */  addis   r3, r30, 4
/* 09D524 800A2AC4 8003D120 */  lwz     r0, -0x2ee0(r3)
/* 09D528 800A2AC8 3881001C */  addi    r4, r1, 0x1c
/* 09D52C 800A2ACC 38600002 */  li      r3, 2
/* 09D530 800A2AD0 9001001C */  stw     r0, 0x1c(r1)
/* 09D534 800A2AD4 48016995 */  bl      GXSetTevColor
lbl_800A2AD8:
/* 09D538 800A2AD8 801F0014 */  lwz     r0, 0x14(r31)
/* 09D53C 800A2ADC 540007FF */  clrlwi. r0, r0, 0x1f
/* 09D540 800A2AE0 4182001C */  beq     lbl_800A2AFC
/* 09D544 800A2AE4 3C7E0004 */  addis   r3, r30, 4
/* 09D548 800A2AE8 8003D124 */  lwz     r0, -0x2edc(r3)
/* 09D54C 800A2AEC 38810018 */  addi    r4, r1, 0x18
/* 09D550 800A2AF0 38600003 */  li      r3, 3
/* 09D554 800A2AF4 90010018 */  stw     r0, 0x18(r1)
/* 09D558 800A2AF8 48016971 */  bl      GXSetTevColor
lbl_800A2AFC:
/* 09D55C 800A2AFC 801F0014 */  lwz     r0, 0x14(r31)
/* 09D560 800A2B00 5400077B */  rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 09D564 800A2B04 41820034 */  beq     lbl_800A2B38
/* 09D568 800A2B08 3C7E0004 */  addis   r3, r30, 4
/* 09D56C 800A2B0C 8803D111 */  lbz     r0, -0x2eef(r3)
/* 09D570 800A2B10 38810014 */  addi    r4, r1, 0x14
/* 09D574 800A2B14 38600001 */  li      r3, 1
/* 09D578 800A2B18 98010032 */  stb     r0, 0x32(r1)
/* 09D57C 800A2B1C 98010031 */  stb     r0, 0x31(r1)
/* 09D580 800A2B20 98010030 */  stb     r0, 0x30(r1)
/* 09D584 800A2B24 98010033 */  stb     r0, 0x33(r1)
/* 09D588 800A2B28 80010030 */  lwz     r0, 0x30(r1)
/* 09D58C 800A2B2C 90010014 */  stw     r0, 0x14(r1)
/* 09D590 800A2B30 48016939 */  bl      GXSetTevColor
/* 09D594 800A2B34 48000038 */  b       lbl_800A2B6C
lbl_800A2B38:
/* 09D598 800A2B38 807E0090 */  lwz     r3, 0x90(r30)
/* 09D59C 800A2B3C 546017BE */  srwi    r0, r3, 0x1e
/* 09D5A0 800A2B40 28000003 */  cmplwi  r0, 3
/* 09D5A4 800A2B44 40820028 */  bne     lbl_800A2B6C
/* 09D5A8 800A2B48 546037BE */  rlwinm  r0, r3, 6, 0x1e, 0x1f
/* 09D5AC 800A2B4C 28000001 */  cmplwi  r0, 1
/* 09D5B0 800A2B50 4082001C */  bne     lbl_800A2B6C
/* 09D5B4 800A2B54 3C7E0004 */  addis   r3, r30, 4
/* 09D5B8 800A2B58 8003D114 */  lwz     r0, -0x2eec(r3)
/* 09D5BC 800A2B5C 38810010 */  addi    r4, r1, 0x10
/* 09D5C0 800A2B60 38600001 */  li      r3, 1
/* 09D5C4 800A2B64 90010010 */  stw     r0, 0x10(r1)
/* 09D5C8 800A2B68 48016901 */  bl      GXSetTevColor
lbl_800A2B6C:
/* 09D5CC 800A2B6C 38000000 */  li      r0, 0
/* 09D5D0 800A2B70 3C608010 */  lis     r3, ganNameTevStage@ha
/* 09D5D4 800A2B74 3B7F0000 */  addi    r27, r31, 0
/* 09D5D8 800A2B78 3B5F0000 */  addi    r26, r31, 0
/* 09D5DC 800A2B7C 3B3F0000 */  addi    r25, r31, 0
/* 09D5E0 800A2B80 3B83D9E8 */  addi    r28, r3, ganNameTevStage@l
/* 09D5E4 800A2B84 541D103A */  slwi    r29, r0, 2
/* 09D5E8 800A2B88 3AE00000 */  li      r23, 0
/* 09D5EC 800A2B8C 480000C0 */  b       lbl_800A2C4C
lbl_800A2B90:
/* 09D5F0 800A2B90 38DB0018 */  addi    r6, r27, 0x18
/* 09D5F4 800A2B94 7F1CEA14 */  add     r24, r28, r29
/* 09D5F8 800A2B98 809B0018 */  lwz     r4, 0x18(r27)
/* 09D5FC 800A2B9C 80780000 */  lwz     r3, 0(r24)
/* 09D600 800A2BA0 3ADA0084 */  addi    r22, r26, 0x84
/* 09D604 800A2BA4 80BB001C */  lwz     r5, 0x1c(r27)
/* 09D608 800A2BA8 3AB901EC */  addi    r21, r25, 0x1ec
/* 09D60C 800A2BAC 80C60008 */  lwz     r6, 8(r6)
/* 09D610 800A2BB0 3A99027C */  addi    r20, r25, 0x27c
/* 09D614 800A2BB4 48016C71 */  bl      GXSetTevOrder
/* 09D618 800A2BB8 80780000 */  lwz     r3, 0(r24)
/* 09D61C 800A2BBC 80960000 */  lwz     r4, 0(r22)
/* 09D620 800A2BC0 80B60004 */  lwz     r5, 4(r22)
/* 09D624 800A2BC4 80D60008 */  lwz     r6, 8(r22)
/* 09D628 800A2BC8 88F6000C */  lbz     r7, 0xc(r22)
/* 09D62C 800A2BCC 81160010 */  lwz     r8, 0x10(r22)
/* 09D630 800A2BD0 480167C9 */  bl      GXSetTevColorOp
/* 09D634 800A2BD4 80780000 */  lwz     r3, 0(r24)
/* 09D638 800A2BD8 80960014 */  lwz     r4, 0x14(r22)
/* 09D63C 800A2BDC 80B60018 */  lwz     r5, 0x18(r22)
/* 09D640 800A2BE0 80D6001C */  lwz     r6, 0x1c(r22)
/* 09D644 800A2BE4 88F60020 */  lbz     r7, 0x20(r22)
/* 09D648 800A2BE8 81160024 */  lwz     r8, 0x24(r22)
/* 09D64C 800A2BEC 48016815 */  bl      GXSetTevAlphaOp
/* 09D650 800A2BF0 80780000 */  lwz     r3, 0(r24)
/* 09D654 800A2BF4 80950000 */  lwz     r4, 0(r21)
/* 09D658 800A2BF8 80B50004 */  lwz     r5, 4(r21)
/* 09D65C 800A2BFC 80D50008 */  lwz     r6, 8(r21)
/* 09D660 800A2C00 80F5000C */  lwz     r7, 0xc(r21)
/* 09D664 800A2C04 4801670D */  bl      GXSetTevColorIn
/* 09D668 800A2C08 80780000 */  lwz     r3, 0(r24)
/* 09D66C 800A2C0C 80940000 */  lwz     r4, 0(r20)
/* 09D670 800A2C10 80B40004 */  lwz     r5, 4(r20)
/* 09D674 800A2C14 80D40008 */  lwz     r6, 8(r20)
/* 09D678 800A2C18 80F4000C */  lwz     r7, 0xc(r20)
/* 09D67C 800A2C1C 48016739 */  bl      GXSetTevAlphaIn
/* 09D680 800A2C20 80780000 */  lwz     r3, 0(r24)
/* 09D684 800A2C24 38800000 */  li      r4, 0
/* 09D688 800A2C28 480169AD */  bl      GXSetTevKColorSel
/* 09D68C 800A2C2C 80780000 */  lwz     r3, 0(r24)
/* 09D690 800A2C30 38800000 */  li      r4, 0
/* 09D694 800A2C34 480169FD */  bl      GXSetTevKAlphaSel
/* 09D698 800A2C38 3B7B000C */  addi    r27, r27, 0xc
/* 09D69C 800A2C3C 3B5A0028 */  addi    r26, r26, 0x28
/* 09D6A0 800A2C40 3B390010 */  addi    r25, r25, 0x10
/* 09D6A4 800A2C44 3BBD0004 */  addi    r29, r29, 4
/* 09D6A8 800A2C48 3AF70001 */  addi    r23, r23, 1
lbl_800A2C4C:
/* 09D6AC 800A2C4C 881F0011 */  lbz     r0, 0x11(r31)
/* 09D6B0 800A2C50 7C170000 */  cmpw    r23, r0
/* 09D6B4 800A2C54 4180FF3C */  blt     lbl_800A2B90
/* 09D6B8 800A2C58 807E0090 */  lwz     r3, 0x90(r30)
/* 09D6BC 800A2C5C 546017BE */  srwi    r0, r3, 0x1e
/* 09D6C0 800A2C60 28000003 */  cmplwi  r0, 3
/* 09D6C4 800A2C64 408200C0 */  bne     lbl_800A2D24
/* 09D6C8 800A2C68 546037BE */  rlwinm  r0, r3, 6, 0x1e, 0x1f
/* 09D6CC 800A2C6C 28000001 */  cmplwi  r0, 1
/* 09D6D0 800A2C70 408200B4 */  bne     lbl_800A2D24
/* 09D6D4 800A2C74 801F0014 */  lwz     r0, 0x14(r31)
/* 09D6D8 800A2C78 5400077B */  rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 09D6DC 800A2C7C 408200A8 */  bne     lbl_800A2D24
/* 09D6E0 800A2C80 3C608010 */  lis     r3, ganNameTevStage@ha
/* 09D6E4 800A2C84 56E4103A */  slwi    r4, r23, 2
/* 09D6E8 800A2C88 3803D9E8 */  addi    r0, r3, ganNameTevStage@l
/* 09D6EC 800A2C8C 7F002214 */  add     r24, r0, r4
/* 09D6F0 800A2C90 80780000 */  lwz     r3, 0(r24)
/* 09D6F4 800A2C94 388000FF */  li      r4, 0xff
/* 09D6F8 800A2C98 38A000FF */  li      r5, 0xff
/* 09D6FC 800A2C9C 38C000FF */  li      r6, 0xff
/* 09D700 800A2CA0 48016B85 */  bl      GXSetTevOrder
/* 09D704 800A2CA4 80780000 */  lwz     r3, 0(r24)
/* 09D708 800A2CA8 38800000 */  li      r4, 0
/* 09D70C 800A2CAC 38A00000 */  li      r5, 0
/* 09D710 800A2CB0 38C00000 */  li      r6, 0
/* 09D714 800A2CB4 38E00001 */  li      r7, 1
/* 09D718 800A2CB8 39000000 */  li      r8, 0
/* 09D71C 800A2CBC 480166DD */  bl      GXSetTevColorOp
/* 09D720 800A2CC0 80780000 */  lwz     r3, 0(r24)
/* 09D724 800A2CC4 38800000 */  li      r4, 0
/* 09D728 800A2CC8 38A00000 */  li      r5, 0
/* 09D72C 800A2CCC 38C00000 */  li      r6, 0
/* 09D730 800A2CD0 38E00001 */  li      r7, 1
/* 09D734 800A2CD4 39000000 */  li      r8, 0
/* 09D738 800A2CD8 48016729 */  bl      GXSetTevAlphaOp
/* 09D73C 800A2CDC 80780000 */  lwz     r3, 0(r24)
/* 09D740 800A2CE0 38800000 */  li      r4, 0
/* 09D744 800A2CE4 38A00002 */  li      r5, 2
/* 09D748 800A2CE8 38C00003 */  li      r6, 3
/* 09D74C 800A2CEC 38E0000F */  li      r7, 0xf
/* 09D750 800A2CF0 48016621 */  bl      GXSetTevColorIn
/* 09D754 800A2CF4 80780000 */  lwz     r3, 0(r24)
/* 09D758 800A2CF8 38800007 */  li      r4, 7
/* 09D75C 800A2CFC 38A00007 */  li      r5, 7
/* 09D760 800A2D00 38C00007 */  li      r6, 7
/* 09D764 800A2D04 38E00000 */  li      r7, 0
/* 09D768 800A2D08 4801664D */  bl      GXSetTevAlphaIn
/* 09D76C 800A2D0C 80780000 */  lwz     r3, 0(r24)
/* 09D770 800A2D10 3880000E */  li      r4, 0xe
/* 09D774 800A2D14 480168C1 */  bl      GXSetTevKColorSel
/* 09D778 800A2D18 80780000 */  lwz     r3, 0(r24)
/* 09D77C 800A2D1C 3880001E */  li      r4, 0x1e
/* 09D780 800A2D20 48016911 */  bl      GXSetTevKAlphaSel
lbl_800A2D24:
/* 09D784 800A2D24 BA810048 */  lmw     r20, 0x48(r1)
/* 09D788 800A2D28 8001007C */  lwz     r0, 0x7c(r1)
/* 09D78C 800A2D2C 38210078 */  addi    r1, r1, 0x78
/* 09D790 800A2D30 7C0803A6 */  mtlr    r0
/* 09D794 800A2D34 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000FAA08 800FD988 0040 */
glabel gCombinedColor
    .long 0x00000000, 0x00000008, 0x00000008, 0x00000006, 0x0000000A, 0x0000000E, 0x0000000C, 0x00000001
    .long 0x00000009, 0x00000009, 0x00000007, 0x0000000B, 0x0000000E, 0x0000000F, 0x0000000F, 0x0000000F

.balign 4

/* 000FAA48 800FD9C8 0020 */
glabel gCombinedAlpha
    .long 0x00000000, 0x00000004, 0x00000004, 0x00000003, 0x00000005, 0x00000006, 0x00000006, 0x00000007

.balign 4

/* 000FAA68 800FD9E8 0040 */
ganNameTevStage:
    .long 0x00000000, 0x00000001, 0x00000002, 0x00000003, 0x00000004, 0x00000005, 0x00000006, 0x00000007
    .long 0x00000008, 0x00000009, 0x0000000A, 0x0000000B, 0x0000000C, 0x0000000D, 0x0000000E, 0x0000000F

.balign 4

/* 000FAAA8 800FDA28 0064 */
sTevColorOp:
    .long 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000001, 0x00000000, 0x00000000, 0x00000000
    .long 0x00000000, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000001, 0x00000001
    .long 0x00000000, 0x00000000, 0x00000000, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    .long 0x00000000

.balign 4

/* 000FAB0C 800FDA8C 0050 */
sTevColorArg:
    .long 0x0000000F, 0x0000000F, 0x0000000F, 0x00000000, 0x0000000F, 0x0000000F, 0x0000000F, 0x00000000
    .long 0x0000000F, 0x00000002, 0x00000004, 0x0000000F, 0x0000000F, 0x00000000, 0x00000004, 0x00000002
    .long 0x0000000F, 0x00000002, 0x0000000C, 0x00000000

.balign 4

/* 000FAB5C 800FDADC 0050 */
sTevAlphaArg:
    .long 0x00000007, 0x00000007, 0x00000007, 0x00000000, 0x00000007, 0x00000007, 0x00000007, 0x00000000
    .long 0x00000007, 0x00000001, 0x00000002, 0x00000007, 0x00000007, 0x00000000, 0x00000002, 0x00000001
    .long 0x00000007, 0x00000001, 0x00000006, 0x00000000

.balign 4

/* 000FABAC 800FDB2C 0009 */
D_800FDB2C:
    .asciz "COMBINED"

.balign 4

/* 000FABB8 800FDB38 000A */
D_800FDB38:
    .asciz "PRIMITIVE"

.balign 4

/* 000FABC4 800FDB44 000C */
D_800FDB44:
    .asciz "ENVIRONMENT"

.balign 4

/* 000FABD0 800FDB50 000F */
D_800FDB50:
    .asciz "COMBINED_ALPHA"

.balign 4

/* 000FABE0 800FDB60 000D */
D_800FDB60:
    .asciz "TEXEL0_ALPHA"

.balign 4

/* 000FABF0 800FDB70 000D */
D_800FDB70:
    .asciz "TEXEL1_ALPHA"

.balign 4

/* 000FAC00 800FDB80 000B */
D_800FDB80:
    .asciz "PRIM_ALPHA"

.balign 4

/* 000FAC0C 800FDB8C 000C */
D_800FDB8C:
    .asciz "SHADE_ALPHA"

.balign 4

/* 000FAC18 800FDB98 000A */
D_800FDB98:
    .asciz "ENV_ALPHA"

.balign 4

/* 000FAC24 800FDBA4 0009 */
D_800FDBA4:
    .asciz "LOD_FRAC"

.balign 4

/* 000FAC30 800FDBB0 000E */
D_800FDBB0:
    .asciz "PRIM_LOD_FRAC"

.balign 4

/* 000FAC40 800FDBC0 0040 */
sColorNames:
    .long gCombinedColor + 0x1A4, D_80145630, D_80145638, gCombinedColor + 0x1B0, D_80145640, gCombinedColor + 0x1BC, D_80145648, gCombinedColor + 0x1C8
    .long gCombinedColor + 0x1D8, gCombinedColor + 0x1E8, gCombinedColor + 0x1F8, gCombinedColor + 0x204, gCombinedColor + 0x210, gCombinedColor + 0x21C, gCombinedColor + 0x228, D_8014564C

.balign 4

/* 000FAC80 800FDC00 0040 */
sAlphaNames:
    .long gCombinedColor + 0x21C, D_80145630, D_80145638, gCombinedColor + 0x1B0, D_80145640, gCombinedColor + 0x1BC, D_80145648, D_8014564C
    .long gCombinedColor + 0x1A4, D_80145630, D_80145638, gCombinedColor + 0x1B0, D_80145640, gCombinedColor + 0x1BC, D_80145648, D_8014564C

.balign 4

/* 000FACC0 800FDC40 0040 */
strings$289:
    .long D_80145650, D_80145658, D_80145660, D_80145668, D_80145670, D_80145678, D_80145680, D_80145688
    .long D_80145650, D_80145658, D_80145660, D_80145668, D_80145690, D_80145698, D_801456A0, D_801456A8

.balign 4

/* 000FAD00 800FDC80 000C */
D_800FDC80:
    .asciz "0x%08x = ( "


.section .sdata, "wa"

.balign 8

/* 000FFE80 80145620 0005 */
sOrder:
    .byte 0x00, 0x03, 0x01, 0x04, 0x02

.balign 4

/* 000FFE88 80145628 0005 */
sReplace:
    .byte 0x03, 0x03, 0x00, 0x01, 0x03

.balign 4

/* 000FFE90 80145630 0007 */
D_80145630:
    .asciz "TEXEL0"

.balign 4

/* 000FFE98 80145638 0007 */
D_80145638:
    .asciz "TEXEL1"

.balign 4

/* 000FFEA0 80145640 0006 */
D_80145640:
    .asciz "SHADE"

.balign 4

/* 000FFEA8 80145648 0002 */
D_80145648:
    .asciz "1"

.balign 4

/* 000FFEAC 8014564C 0002 */
D_8014564C:
    .asciz "0"

.balign 4

/* 000FFEB0 80145650 0007 */
D_80145650:
    .asciz "PIXEL "

.balign 4

/* 000FFEB8 80145658 0007 */
D_80145658:
    .asciz "MEMORY"

.balign 4

/* 000FFEC0 80145660 0007 */
D_80145660:
    .asciz "BL_REG"

.balign 4

/* 000FFEC8 80145668 0007 */
D_80145668:
    .asciz "FOGREG"

.balign 4

/* 000FFED0 80145670 0007 */
D_80145670:
    .asciz "CC_A  "

.balign 4

/* 000FFED8 80145678 0007 */
D_80145678:
    .asciz "FOG_A "

.balign 4

/* 000FFEE0 80145680 0007 */
D_80145680:
    .asciz "STEP_A"

.balign 4

/* 000FFEE8 80145688 0007 */
D_80145688:
    .asciz "ZERO  "

.balign 4

/* 000FFEF0 80145690 0006 */
D_80145690:
    .asciz "A_INV"

.balign 4

/* 000FFEF8 80145698 0006 */
D_80145698:
    .asciz "MEM_A"

.balign 4

/* 000FFF00 801456A0 0006 */
D_801456A0:
    .asciz "ONE  "

.balign 4

/* 000FFF08 801456A8 0006 */
D_801456A8:
    .asciz "ZERO "


