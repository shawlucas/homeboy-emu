# support.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel TRKSuppAccessFile
/* 0D1EC4 800D7464 7C0802A6 */  mflr    r0
/* 0D1EC8 800D7468 90010004 */  stw     r0, 4(r1)
/* 0D1ECC 800D746C 9421FFB8 */  stwu    r1, -0x48(r1)
/* 0D1ED0 800D7470 BEA1001C */  stmw    r21, 0x1c(r1)
/* 0D1ED4 800D7474 7C9B2379 */  or.     r27, r4, r4
/* 0D1ED8 800D7478 3B230000 */  addi    r25, r3, 0
/* 0D1EDC 800D747C 3AE50000 */  addi    r23, r5, 0
/* 0D1EE0 800D7480 3B460000 */  addi    r26, r6, 0
/* 0D1EE4 800D7484 3AC70000 */  addi    r22, r7, 0
/* 0D1EE8 800D7488 3BC80000 */  addi    r30, r8, 0
/* 0D1EEC 800D748C 41820010 */  beq     lbl_800D749C
/* 0D1EF0 800D7490 80170000 */  lwz     r0, 0(r23)
/* 0D1EF4 800D7494 28000000 */  cmplwi  r0, 0
/* 0D1EF8 800D7498 4082000C */  bne     lbl_800D74A4
lbl_800D749C:
/* 0D1EFC 800D749C 38600002 */  li      r3, 2
/* 0D1F00 800D74A0 48000288 */  b       lbl_800D7728
lbl_800D74A4:
/* 0D1F04 800D74A4 38000000 */  li      r0, 0
/* 0D1F08 800D74A8 981A0000 */  stb     r0, 0(r26)
/* 0D1F0C 800D74AC 3B000000 */  li      r24, 0
/* 0D1F10 800D74B0 3B800000 */  li      r28, 0
/* 0D1F14 800D74B4 3AA00000 */  li      r21, 0
/* 0D1F18 800D74B8 48000240 */  b       lbl_800D76F8
lbl_800D74BC:
/* 0D1F1C 800D74BC 7C1C1850 */  subf    r0, r28, r3
/* 0D1F20 800D74C0 28000800 */  cmplwi  r0, 0x800
/* 0D1F24 800D74C4 4081000C */  ble     lbl_800D74D0
/* 0D1F28 800D74C8 3BE00800 */  li      r31, 0x800
/* 0D1F2C 800D74CC 48000008 */  b       lbl_800D74D4
lbl_800D74D0:
/* 0D1F30 800D74D0 7C1F0378 */  mr      r31, r0
lbl_800D74D4:
/* 0D1F34 800D74D4 3861000C */  addi    r3, r1, 0xc
/* 0D1F38 800D74D8 38810010 */  addi    r4, r1, 0x10
/* 0D1F3C 800D74DC 4BFFE2F1 */  bl      TRKGetFreeBuffer
/* 0D1F40 800D74E0 7C751B79 */  or.     r21, r3, r3
/* 0D1F44 800D74E4 40820058 */  bne     lbl_800D753C
/* 0D1F48 800D74E8 80E10010 */  lwz     r7, 0x10(r1)
/* 0D1F4C 800D74EC 8007000C */  lwz     r0, 0xc(r7)
/* 0D1F50 800D74F0 28000880 */  cmplwi  r0, 0x880
/* 0D1F54 800D74F4 4180000C */  blt     lbl_800D7500
/* 0D1F58 800D74F8 38A00301 */  li      r5, 0x301
/* 0D1F5C 800D74FC 4800003C */  b       lbl_800D7538
lbl_800D7500:
/* 0D1F60 800D7500 2C1E0000 */  cmpwi   r30, 0
/* 0D1F64 800D7504 4182000C */  beq     lbl_800D7510
/* 0D1F68 800D7508 38C000D1 */  li      r6, 0xd1
/* 0D1F6C 800D750C 48000008 */  b       lbl_800D7514
lbl_800D7510:
/* 0D1F70 800D7510 38C000D0 */  li      r6, 0xd0
lbl_800D7514:
/* 0D1F74 800D7514 8087000C */  lwz     r4, 0xc(r7)
/* 0D1F78 800D7518 38A00000 */  li      r5, 0
/* 0D1F7C 800D751C 38640001 */  addi    r3, r4, 1
/* 0D1F80 800D7520 38040010 */  addi    r0, r4, 0x10
/* 0D1F84 800D7524 9067000C */  stw     r3, 0xc(r7)
/* 0D1F88 800D7528 7CC701AE */  stbx    r6, r7, r0
/* 0D1F8C 800D752C 80670008 */  lwz     r3, 8(r7)
/* 0D1F90 800D7530 38030001 */  addi    r0, r3, 1
/* 0D1F94 800D7534 90070008 */  stw     r0, 8(r7)
lbl_800D7538:
/* 0D1F98 800D7538 7CB52B78 */  mr      r21, r5
lbl_800D753C:
/* 0D1F9C 800D753C 2C150000 */  cmpwi   r21, 0
/* 0D1FA0 800D7540 40820014 */  bne     lbl_800D7554
/* 0D1FA4 800D7544 80610010 */  lwz     r3, 0x10(r1)
/* 0D1FA8 800D7548 7F24CB78 */  mr      r4, r25
/* 0D1FAC 800D754C 4BFFE5A5 */  bl      TRKAppendBuffer1_ui32
/* 0D1FB0 800D7550 7C751B78 */  mr      r21, r3
lbl_800D7554:
/* 0D1FB4 800D7554 2C150000 */  cmpwi   r21, 0
/* 0D1FB8 800D7558 40820014 */  bne     lbl_800D756C
/* 0D1FBC 800D755C 80610010 */  lwz     r3, 0x10(r1)
/* 0D1FC0 800D7560 57E4043E */  clrlwi  r4, r31, 0x10
/* 0D1FC4 800D7564 4BFFE539 */  bl      TRKAppendBuffer1_ui16
/* 0D1FC8 800D7568 7C751B78 */  mr      r21, r3
lbl_800D756C:
/* 0D1FCC 800D756C 2C1E0000 */  cmpwi   r30, 0
/* 0D1FD0 800D7570 40820020 */  bne     lbl_800D7590
/* 0D1FD4 800D7574 2C150000 */  cmpwi   r21, 0
/* 0D1FD8 800D7578 40820018 */  bne     lbl_800D7590
/* 0D1FDC 800D757C 80610010 */  lwz     r3, 0x10(r1)
/* 0D1FE0 800D7580 38BF0000 */  addi    r5, r31, 0
/* 0D1FE4 800D7584 7C9BE214 */  add     r4, r27, r28
/* 0D1FE8 800D7588 4BFFE655 */  bl      TRKAppendBuffer_ui8
/* 0D1FEC 800D758C 7C751B78 */  mr      r21, r3
lbl_800D7590:
/* 0D1FF0 800D7590 2C150000 */  cmpwi   r21, 0
/* 0D1FF4 800D7594 40820158 */  bne     lbl_800D76EC
/* 0D1FF8 800D7598 2C160000 */  cmpwi   r22, 0
/* 0D1FFC 800D759C 41820144 */  beq     lbl_800D76E0
/* 0D2000 800D75A0 38000000 */  li      r0, 0
/* 0D2004 800D75A4 2C1E0000 */  cmpwi   r30, 0
/* 0D2008 800D75A8 B001000A */  sth     r0, 0xa(r1)
/* 0D200C 800D75AC 98010008 */  stb     r0, 8(r1)
/* 0D2010 800D75B0 41820010 */  beq     lbl_800D75C0
/* 0D2014 800D75B4 28190000 */  cmplwi  r25, 0
/* 0D2018 800D75B8 40820008 */  bne     lbl_800D75C0
/* 0D201C 800D75BC 38000001 */  li      r0, 1
lbl_800D75C0:
/* 0D2020 800D75C0 2C1E0000 */  cmpwi   r30, 0
/* 0D2024 800D75C4 4182000C */  beq     lbl_800D75D0
/* 0D2028 800D75C8 38A00005 */  li      r5, 5
/* 0D202C 800D75CC 48000008 */  b       lbl_800D75D4
lbl_800D75D0:
/* 0D2030 800D75D0 38A00005 */  li      r5, 5
lbl_800D75D4:
/* 0D2034 800D75D4 7C000034 */  cntlzw  r0, r0
/* 0D2038 800D75D8 80610010 */  lwz     r3, 0x10(r1)
/* 0D203C 800D75DC 5407D97E */  srwi    r7, r0, 5
/* 0D2040 800D75E0 38810014 */  addi    r4, r1, 0x14
/* 0D2044 800D75E4 38C00003 */  li      r6, 3
/* 0D2048 800D75E8 48000155 */  bl      TRKRequestSend
/* 0D204C 800D75EC 7C751B79 */  or.     r21, r3, r3
/* 0D2050 800D75F0 40820018 */  bne     lbl_800D7608
/* 0D2054 800D75F4 80610014 */  lwz     r3, 0x14(r1)
/* 0D2058 800D75F8 4BFFE271 */  bl      TRKGetBuffer
/* 0D205C 800D75FC 3BA30000 */  addi    r29, r3, 0
/* 0D2060 800D7600 38800002 */  li      r4, 2
/* 0D2064 800D7604 4BFFE339 */  bl      TRKSetBufferPosition
lbl_800D7608:
/* 0D2068 800D7608 2C150000 */  cmpwi   r21, 0
/* 0D206C 800D760C 40820014 */  bne     lbl_800D7620
/* 0D2070 800D7610 387D0000 */  addi    r3, r29, 0
/* 0D2074 800D7614 38810008 */  addi    r4, r1, 8
/* 0D2078 800D7618 4BFFE6A9 */  bl      TRKReadBuffer1_ui8
/* 0D207C 800D761C 7C751B78 */  mr      r21, r3
lbl_800D7620:
/* 0D2080 800D7620 2C150000 */  cmpwi   r21, 0
/* 0D2084 800D7624 40820014 */  bne     lbl_800D7638
/* 0D2088 800D7628 387D0000 */  addi    r3, r29, 0
/* 0D208C 800D762C 3881000A */  addi    r4, r1, 0xa
/* 0D2090 800D7630 4BFFE6B5 */  bl      TRKReadBuffer1_ui16
/* 0D2094 800D7634 7C751B78 */  mr      r21, r3
lbl_800D7638:
/* 0D2098 800D7638 2C1E0000 */  cmpwi   r30, 0
/* 0D209C 800D763C 41820058 */  beq     lbl_800D7694
/* 0D20A0 800D7640 2C150000 */  cmpwi   r21, 0
/* 0D20A4 800D7644 40820050 */  bne     lbl_800D7694
/* 0D20A8 800D7648 A061000A */  lhz     r3, 0xa(r1)
/* 0D20AC 800D764C 809D0008 */  lwz     r4, 8(r29)
/* 0D20B0 800D7650 38030005 */  addi    r0, r3, 5
/* 0D20B4 800D7654 7C040040 */  cmplw   r4, r0
/* 0D20B8 800D7658 41820020 */  beq     lbl_800D7678
/* 0D20BC 800D765C 88010008 */  lbz     r0, 8(r1)
/* 0D20C0 800D7660 3864FFFB */  addi    r3, r4, -5
/* 0D20C4 800D7664 B061000A */  sth     r3, 0xa(r1)
/* 0D20C8 800D7668 28000000 */  cmplwi  r0, 0
/* 0D20CC 800D766C 4082000C */  bne     lbl_800D7678
/* 0D20D0 800D7670 38000001 */  li      r0, 1
/* 0D20D4 800D7674 98010008 */  stb     r0, 8(r1)
lbl_800D7678:
/* 0D20D8 800D7678 A0A1000A */  lhz     r5, 0xa(r1)
/* 0D20DC 800D767C 7C05F840 */  cmplw   r5, r31
/* 0D20E0 800D7680 41810014 */  bgt     lbl_800D7694
/* 0D20E4 800D7684 387D0000 */  addi    r3, r29, 0
/* 0D20E8 800D7688 7C9BE214 */  add     r4, r27, r28
/* 0D20EC 800D768C 4BFFE819 */  bl      TRKReadBuffer_ui8
/* 0D20F0 800D7690 7C751B78 */  mr      r21, r3
lbl_800D7694:
/* 0D20F4 800D7694 A061000A */  lhz     r3, 0xa(r1)
/* 0D20F8 800D7698 7C03F840 */  cmplw   r3, r31
/* 0D20FC 800D769C 41820030 */  beq     lbl_800D76CC
/* 0D2100 800D76A0 2C1E0000 */  cmpwi   r30, 0
/* 0D2104 800D76A4 4182000C */  beq     lbl_800D76B0
/* 0D2108 800D76A8 7C03F840 */  cmplw   r3, r31
/* 0D210C 800D76AC 41800018 */  blt     lbl_800D76C4
lbl_800D76B0:
/* 0D2110 800D76B0 88010008 */  lbz     r0, 8(r1)
/* 0D2114 800D76B4 28000000 */  cmplwi  r0, 0
/* 0D2118 800D76B8 4082000C */  bne     lbl_800D76C4
/* 0D211C 800D76BC 38000001 */  li      r0, 1
/* 0D2120 800D76C0 98010008 */  stb     r0, 8(r1)
lbl_800D76C4:
/* 0D2124 800D76C4 3BE30000 */  addi    r31, r3, 0
/* 0D2128 800D76C8 3B000001 */  li      r24, 1
lbl_800D76CC:
/* 0D212C 800D76CC 88010008 */  lbz     r0, 8(r1)
/* 0D2130 800D76D0 981A0000 */  stb     r0, 0(r26)
/* 0D2134 800D76D4 80610014 */  lwz     r3, 0x14(r1)
/* 0D2138 800D76D8 4BFFE1BD */  bl      TRKReleaseBuffer
/* 0D213C 800D76DC 48000010 */  b       lbl_800D76EC
lbl_800D76E0:
/* 0D2140 800D76E0 80610010 */  lwz     r3, 0x10(r1)
/* 0D2144 800D76E4 4BFFE041 */  bl      TRKMessageSend
/* 0D2148 800D76E8 7C751B78 */  mr      r21, r3
lbl_800D76EC:
/* 0D214C 800D76EC 8061000C */  lwz     r3, 0xc(r1)
/* 0D2150 800D76F0 4BFFE1A5 */  bl      TRKReleaseBuffer
/* 0D2154 800D76F4 7F9CFA14 */  add     r28, r28, r31
lbl_800D76F8:
/* 0D2158 800D76F8 2C180000 */  cmpwi   r24, 0
/* 0D215C 800D76FC 40820024 */  bne     lbl_800D7720
/* 0D2160 800D7700 80770000 */  lwz     r3, 0(r23)
/* 0D2164 800D7704 7C1C1840 */  cmplw   r28, r3
/* 0D2168 800D7708 40800018 */  bge     lbl_800D7720
/* 0D216C 800D770C 2C150000 */  cmpwi   r21, 0
/* 0D2170 800D7710 40820010 */  bne     lbl_800D7720
/* 0D2174 800D7714 881A0000 */  lbz     r0, 0(r26)
/* 0D2178 800D7718 28000000 */  cmplwi  r0, 0
/* 0D217C 800D771C 4182FDA0 */  beq     lbl_800D74BC
lbl_800D7720:
/* 0D2180 800D7720 93970000 */  stw     r28, 0(r23)
/* 0D2184 800D7724 7EA3AB78 */  mr      r3, r21
lbl_800D7728:
/* 0D2188 800D7728 BAA1001C */  lmw     r21, 0x1c(r1)
/* 0D218C 800D772C 38210048 */  addi    r1, r1, 0x48
/* 0D2190 800D7730 80010004 */  lwz     r0, 4(r1)
/* 0D2194 800D7734 7C0803A6 */  mtlr    r0
/* 0D2198 800D7738 4E800020 */  blr     

glabel TRKRequestSend
/* 0D219C 800D773C 7C0802A6 */  mflr    r0
/* 0D21A0 800D7740 90010004 */  stw     r0, 4(r1)
/* 0D21A4 800D7744 3800FFFF */  li      r0, -1
/* 0D21A8 800D7748 9421FFC8 */  stwu    r1, -0x38(r1)
/* 0D21AC 800D774C BEC10010 */  stmw    r22, 0x10(r1)
/* 0D21B0 800D7750 3AE40000 */  addi    r23, r4, 0
/* 0D21B4 800D7754 3C8004C5 */  lis     r4, 0x4c5
/* 0D21B8 800D7758 3B660001 */  addi    r27, r6, 1
/* 0D21BC 800D775C 3AC30000 */  addi    r22, r3, 0
/* 0D21C0 800D7760 3BE4B3EC */  addi    r31, r4, -19476
/* 0D21C4 800D7764 3B050000 */  addi    r24, r5, 0
/* 0D21C8 800D7768 3B270000 */  addi    r25, r7, 0
/* 0D21CC 800D776C 3BC00000 */  li      r30, 0
/* 0D21D0 800D7770 3B400001 */  li      r26, 1
/* 0D21D4 800D7774 90170000 */  stw     r0, 0(r23)
/* 0D21D8 800D7778 48000124 */  b       lbl_800D789C
lbl_800D777C:
/* 0D21DC 800D777C 7EC3B378 */  mr      r3, r22
/* 0D21E0 800D7780 4BFFDFA5 */  bl      TRKMessageSend
/* 0D21E4 800D7784 7C7E1B79 */  or.     r30, r3, r3
/* 0D21E8 800D7788 40820110 */  bne     lbl_800D7898
/* 0D21EC 800D778C 2C190000 */  cmpwi   r25, 0
/* 0D21F0 800D7790 41820008 */  beq     lbl_800D7798
/* 0D21F4 800D7794 3B800000 */  li      r28, 0
lbl_800D7798:
/* 0D21F8 800D7798 4BFFE7FD */  bl      TRKTestForPacket
/* 0D21FC 800D779C 90770000 */  stw     r3, 0(r23)
/* 0D2200 800D77A0 80770000 */  lwz     r3, 0(r23)
/* 0D2204 800D77A4 2C03FFFF */  cmpwi   r3, -1
/* 0D2208 800D77A8 40820018 */  bne     lbl_800D77C0
/* 0D220C 800D77AC 2C190000 */  cmpwi   r25, 0
/* 0D2210 800D77B0 4182FFE8 */  beq     lbl_800D7798
/* 0D2214 800D77B4 3B9C0001 */  addi    r28, r28, 1
/* 0D2218 800D77B8 7C1CF840 */  cmplw   r28, r31
/* 0D221C 800D77BC 4180FFDC */  blt     lbl_800D7798
lbl_800D77C0:
/* 0D2220 800D77C0 2C03FFFF */  cmpwi   r3, -1
/* 0D2224 800D77C4 4182004C */  beq     lbl_800D7810
/* 0D2228 800D77C8 3B400000 */  li      r26, 0
/* 0D222C 800D77CC 4BFFE09D */  bl      TRKGetBuffer
/* 0D2230 800D77D0 3BA30000 */  addi    r29, r3, 0
/* 0D2234 800D77D4 38800000 */  li      r4, 0
/* 0D2238 800D77D8 4BFFE165 */  bl      TRKSetBufferPosition
/* 0D223C 800D77DC 387D0000 */  addi    r3, r29, 0
/* 0D2240 800D77E0 38810008 */  addi    r4, r1, 8
/* 0D2244 800D77E4 4BFFE4DD */  bl      TRKReadBuffer1_ui8
/* 0D2248 800D77E8 7C7E1B79 */  or.     r30, r3, r3
/* 0D224C 800D77EC 40820024 */  bne     lbl_800D7810
/* 0D2250 800D77F0 88010008 */  lbz     r0, 8(r1)
/* 0D2254 800D77F4 28000080 */  cmplwi  r0, 0x80
/* 0D2258 800D77F8 40800018 */  bge     lbl_800D7810
/* 0D225C 800D77FC 80770000 */  lwz     r3, 0(r23)
/* 0D2260 800D7800 4BFFE8E1 */  bl      TRKProcessInput
/* 0D2264 800D7804 3800FFFF */  li      r0, -1
/* 0D2268 800D7808 90170000 */  stw     r0, 0(r23)
/* 0D226C 800D780C 4BFFFF8C */  b       lbl_800D7798
lbl_800D7810:
/* 0D2270 800D7810 80170000 */  lwz     r0, 0(r23)
/* 0D2274 800D7814 2C00FFFF */  cmpwi   r0, -1
/* 0D2278 800D7818 41820080 */  beq     lbl_800D7898
/* 0D227C 800D781C 801D0008 */  lwz     r0, 8(r29)
/* 0D2280 800D7820 7C00C040 */  cmplw   r0, r24
/* 0D2284 800D7824 40800008 */  bge     lbl_800D782C
/* 0D2288 800D7828 3B400001 */  li      r26, 1
lbl_800D782C:
/* 0D228C 800D782C 2C1E0000 */  cmpwi   r30, 0
/* 0D2290 800D7830 4082001C */  bne     lbl_800D784C
/* 0D2294 800D7834 2C1A0000 */  cmpwi   r26, 0
/* 0D2298 800D7838 40820014 */  bne     lbl_800D784C
/* 0D229C 800D783C 387D0000 */  addi    r3, r29, 0
/* 0D22A0 800D7840 38810009 */  addi    r4, r1, 9
/* 0D22A4 800D7844 4BFFE47D */  bl      TRKReadBuffer1_ui8
/* 0D22A8 800D7848 7C7E1B78 */  mr      r30, r3
lbl_800D784C:
/* 0D22AC 800D784C 2C1E0000 */  cmpwi   r30, 0
/* 0D22B0 800D7850 40820028 */  bne     lbl_800D7878
/* 0D22B4 800D7854 2C1A0000 */  cmpwi   r26, 0
/* 0D22B8 800D7858 40820020 */  bne     lbl_800D7878
/* 0D22BC 800D785C 88010008 */  lbz     r0, 8(r1)
/* 0D22C0 800D7860 28000080 */  cmplwi  r0, 0x80
/* 0D22C4 800D7864 40820010 */  bne     lbl_800D7874
/* 0D22C8 800D7868 88010009 */  lbz     r0, 9(r1)
/* 0D22CC 800D786C 28000000 */  cmplwi  r0, 0
/* 0D22D0 800D7870 41820008 */  beq     lbl_800D7878
lbl_800D7874:
/* 0D22D4 800D7874 3B400001 */  li      r26, 1
lbl_800D7878:
/* 0D22D8 800D7878 2C1E0000 */  cmpwi   r30, 0
/* 0D22DC 800D787C 4082000C */  bne     lbl_800D7888
/* 0D22E0 800D7880 2C1A0000 */  cmpwi   r26, 0
/* 0D22E4 800D7884 41820014 */  beq     lbl_800D7898
lbl_800D7888:
/* 0D22E8 800D7888 80770000 */  lwz     r3, 0(r23)
/* 0D22EC 800D788C 4BFFE009 */  bl      TRKReleaseBuffer
/* 0D22F0 800D7890 3800FFFF */  li      r0, -1
/* 0D22F4 800D7894 90170000 */  stw     r0, 0(r23)
lbl_800D7898:
/* 0D22F8 800D7898 3B7BFFFF */  addi    r27, r27, -1
lbl_800D789C:
/* 0D22FC 800D789C 2C1B0000 */  cmpwi   r27, 0
/* 0D2300 800D78A0 41820018 */  beq     lbl_800D78B8
/* 0D2304 800D78A4 80170000 */  lwz     r0, 0(r23)
/* 0D2308 800D78A8 2C00FFFF */  cmpwi   r0, -1
/* 0D230C 800D78AC 4082000C */  bne     lbl_800D78B8
/* 0D2310 800D78B0 2C1E0000 */  cmpwi   r30, 0
/* 0D2314 800D78B4 4182FEC8 */  beq     lbl_800D777C
lbl_800D78B8:
/* 0D2318 800D78B8 80170000 */  lwz     r0, 0(r23)
/* 0D231C 800D78BC 2C00FFFF */  cmpwi   r0, -1
/* 0D2320 800D78C0 40820008 */  bne     lbl_800D78C8
/* 0D2324 800D78C4 3BC00800 */  li      r30, 0x800
lbl_800D78C8:
/* 0D2328 800D78C8 7FC3F378 */  mr      r3, r30
/* 0D232C 800D78CC BAC10010 */  lmw     r22, 0x10(r1)
/* 0D2330 800D78D0 38210038 */  addi    r1, r1, 0x38
/* 0D2334 800D78D4 80010004 */  lwz     r0, 4(r1)
/* 0D2338 800D78D8 7C0803A6 */  mtlr    r0
/* 0D233C 800D78DC 4E800020 */  blr     


