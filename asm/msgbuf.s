# msgbuf.c
.include "macros.inc"

.section .text, "ax"

.balign 4

TRKSetBufferUsed:
/* 0D01AC 800D574C 90830004 */  stw     r4, 4(r3)
/* 0D01B0 800D5750 4E800020 */  blr     

glabel TRKInitializeMessageBuffers
/* 0D01B4 800D5754 7C0802A6 */  mflr    r0
/* 0D01B8 800D5758 3C608014 */  lis     r3, gTRKMsgBufs@ha
/* 0D01BC 800D575C 90010004 */  stw     r0, 4(r1)
/* 0D01C0 800D5760 38032880 */  addi    r0, r3, gTRKMsgBufs@l
/* 0D01C4 800D5764 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0D01C8 800D5768 93E1000C */  stw     r31, 0xc(r1)
/* 0D01CC 800D576C 93C10008 */  stw     r30, 8(r1)
/* 0D01D0 800D5770 3BC00000 */  li      r30, 0
/* 0D01D4 800D5774 1C9E0890 */  mulli   r4, r30, 0x890
/* 0D01D8 800D5778 7FE02214 */  add     r31, r0, r4
lbl_800D577C:
/* 0D01DC 800D577C 7FE3FB78 */  mr      r3, r31
/* 0D01E0 800D5780 48002161 */  bl      TRKInitializeMutex
/* 0D01E4 800D5784 7FE3FB78 */  mr      r3, r31
/* 0D01E8 800D5788 48002161 */  bl      TRKAcquireMutex
/* 0D01EC 800D578C 387F0000 */  addi    r3, r31, 0
/* 0D01F0 800D5790 38800000 */  li      r4, 0
/* 0D01F4 800D5794 4BFFFFB9 */  bl      TRKSetBufferUsed
/* 0D01F8 800D5798 7FE3FB78 */  mr      r3, r31
/* 0D01FC 800D579C 48002155 */  bl      TRKReleaseMutex
/* 0D0200 800D57A0 3BDE0001 */  addi    r30, r30, 1
/* 0D0204 800D57A4 3BFF0890 */  addi    r31, r31, 0x890
/* 0D0208 800D57A8 2C1E0003 */  cmpwi   r30, 3
/* 0D020C 800D57AC 4180FFD0 */  blt     lbl_800D577C
/* 0D0210 800D57B0 83E1000C */  lwz     r31, 0xc(r1)
/* 0D0214 800D57B4 38600000 */  li      r3, 0
/* 0D0218 800D57B8 83C10008 */  lwz     r30, 8(r1)
/* 0D021C 800D57BC 38210010 */  addi    r1, r1, 0x10
/* 0D0220 800D57C0 80010004 */  lwz     r0, 4(r1)
/* 0D0224 800D57C4 7C0803A6 */  mtlr    r0
/* 0D0228 800D57C8 4E800020 */  blr     

glabel TRKGetFreeBuffer
/* 0D022C 800D57CC 7C0802A6 */  mflr    r0
/* 0D0230 800D57D0 90010004 */  stw     r0, 4(r1)
/* 0D0234 800D57D4 38000000 */  li      r0, 0
/* 0D0238 800D57D8 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0D023C 800D57DC BF61000C */  stmw    r27, 0xc(r1)
/* 0D0240 800D57E0 3B840000 */  addi    r28, r4, 0
/* 0D0244 800D57E4 3B630000 */  addi    r27, r3, 0
/* 0D0248 800D57E8 3BE00300 */  li      r31, 0x300
/* 0D024C 800D57EC 3BC00000 */  li      r30, 0
/* 0D0250 800D57F0 90040000 */  stw     r0, 0(r4)
/* 0D0254 800D57F4 48000054 */  b       lbl_800D5848
lbl_800D57F8:
/* 0D0258 800D57F8 7FC3F378 */  mr      r3, r30
/* 0D025C 800D57FC 4800006D */  bl      TRKGetBuffer
/* 0D0260 800D5800 7C7D1B78 */  mr      r29, r3
/* 0D0264 800D5804 480020E5 */  bl      TRKAcquireMutex
/* 0D0268 800D5808 801D0004 */  lwz     r0, 4(r29)
/* 0D026C 800D580C 2C000000 */  cmpwi   r0, 0
/* 0D0270 800D5810 4082002C */  bne     lbl_800D583C
/* 0D0274 800D5814 387D0000 */  addi    r3, r29, 0
/* 0D0278 800D5818 38800001 */  li      r4, 1
/* 0D027C 800D581C 480000E1 */  bl      TRKResetBuffer
/* 0D0280 800D5820 387D0000 */  addi    r3, r29, 0
/* 0D0284 800D5824 38800001 */  li      r4, 1
/* 0D0288 800D5828 4BFFFF25 */  bl      TRKSetBufferUsed
/* 0D028C 800D582C 93BC0000 */  stw     r29, 0(r28)
/* 0D0290 800D5830 3BE00000 */  li      r31, 0
/* 0D0294 800D5834 93DB0000 */  stw     r30, 0(r27)
/* 0D0298 800D5838 3BC00003 */  li      r30, 3
lbl_800D583C:
/* 0D029C 800D583C 7FA3EB78 */  mr      r3, r29
/* 0D02A0 800D5840 480020B1 */  bl      TRKReleaseMutex
/* 0D02A4 800D5844 3BDE0001 */  addi    r30, r30, 1
lbl_800D5848:
/* 0D02A8 800D5848 2C1E0003 */  cmpwi   r30, 3
/* 0D02AC 800D584C 4180FFAC */  blt     lbl_800D57F8
/* 0D02B0 800D5850 7FE3FB78 */  mr      r3, r31
/* 0D02B4 800D5854 BB61000C */  lmw     r27, 0xc(r1)
/* 0D02B8 800D5858 38210020 */  addi    r1, r1, 0x20
/* 0D02BC 800D585C 80010004 */  lwz     r0, 4(r1)
/* 0D02C0 800D5860 7C0803A6 */  mtlr    r0
/* 0D02C4 800D5864 4E800020 */  blr     

glabel TRKGetBuffer
/* 0D02C8 800D5868 2C030000 */  cmpwi   r3, 0
/* 0D02CC 800D586C 38000000 */  li      r0, 0
/* 0D02D0 800D5870 4180001C */  blt     lbl_800D588C
/* 0D02D4 800D5874 2C030003 */  cmpwi   r3, 3
/* 0D02D8 800D5878 40800014 */  bge     lbl_800D588C
/* 0D02DC 800D587C 1C830890 */  mulli   r4, r3, 0x890
/* 0D02E0 800D5880 3C608014 */  lis     r3, gTRKMsgBufs@ha
/* 0D02E4 800D5884 38032880 */  addi    r0, r3, gTRKMsgBufs@l
/* 0D02E8 800D5888 7C002214 */  add     r0, r0, r4
lbl_800D588C:
/* 0D02EC 800D588C 7C030378 */  mr      r3, r0
/* 0D02F0 800D5890 4E800020 */  blr     

glabel TRKReleaseBuffer
/* 0D02F4 800D5894 7C0802A6 */  mflr    r0
/* 0D02F8 800D5898 2C03FFFF */  cmpwi   r3, -1
/* 0D02FC 800D589C 90010004 */  stw     r0, 4(r1)
/* 0D0300 800D58A0 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0D0304 800D58A4 93E1000C */  stw     r31, 0xc(r1)
/* 0D0308 800D58A8 41820040 */  beq     lbl_800D58E8
/* 0D030C 800D58AC 2C030000 */  cmpwi   r3, 0
/* 0D0310 800D58B0 41800038 */  blt     lbl_800D58E8
/* 0D0314 800D58B4 2C030003 */  cmpwi   r3, 3
/* 0D0318 800D58B8 40800030 */  bge     lbl_800D58E8
/* 0D031C 800D58BC 1C830890 */  mulli   r4, r3, 0x890
/* 0D0320 800D58C0 3C608014 */  lis     r3, gTRKMsgBufs@ha
/* 0D0324 800D58C4 38032880 */  addi    r0, r3, gTRKMsgBufs@l
/* 0D0328 800D58C8 7FE02214 */  add     r31, r0, r4
/* 0D032C 800D58CC 387F0000 */  addi    r3, r31, 0
/* 0D0330 800D58D0 48002019 */  bl      TRKAcquireMutex
/* 0D0334 800D58D4 387F0000 */  addi    r3, r31, 0
/* 0D0338 800D58D8 38800000 */  li      r4, 0
/* 0D033C 800D58DC 4BFFFE71 */  bl      TRKSetBufferUsed
/* 0D0340 800D58E0 7FE3FB78 */  mr      r3, r31
/* 0D0344 800D58E4 4800200D */  bl      TRKReleaseMutex
lbl_800D58E8:
/* 0D0348 800D58E8 83E1000C */  lwz     r31, 0xc(r1)
/* 0D034C 800D58EC 38210010 */  addi    r1, r1, 0x10
/* 0D0350 800D58F0 80010004 */  lwz     r0, 4(r1)
/* 0D0354 800D58F4 7C0803A6 */  mtlr    r0
/* 0D0358 800D58F8 4E800020 */  blr     

glabel TRKResetBuffer
/* 0D035C 800D58FC 7C0802A6 */  mflr    r0
/* 0D0360 800D5900 38A00000 */  li      r5, 0
/* 0D0364 800D5904 90010004 */  stw     r0, 4(r1)
/* 0D0368 800D5908 5480063F */  clrlwi. r0, r4, 0x18
/* 0D036C 800D590C 9421FFF8 */  stwu    r1, -8(r1)
/* 0D0370 800D5910 90A30008 */  stw     r5, 8(r3)
/* 0D0374 800D5914 90A3000C */  stw     r5, 0xc(r3)
/* 0D0378 800D5918 40820014 */  bne     lbl_800D592C
/* 0D037C 800D591C 38630010 */  addi    r3, r3, 0x10
/* 0D0380 800D5920 38800000 */  li      r4, 0
/* 0D0384 800D5924 38A00880 */  li      r5, 0x880
/* 0D0388 800D5928 4BF2DB31 */  bl      TRK_memcpy
lbl_800D592C:
/* 0D038C 800D592C 38210008 */  addi    r1, r1, 8
/* 0D0390 800D5930 80010004 */  lwz     r0, 4(r1)
/* 0D0394 800D5934 7C0803A6 */  mtlr    r0
/* 0D0398 800D5938 4E800020 */  blr     

glabel TRKSetBufferPosition
/* 0D039C 800D593C 28040880 */  cmplwi  r4, 0x880
/* 0D03A0 800D5940 38A00000 */  li      r5, 0
/* 0D03A4 800D5944 4081000C */  ble     lbl_800D5950
/* 0D03A8 800D5948 38A00301 */  li      r5, 0x301
/* 0D03AC 800D594C 48000018 */  b       lbl_800D5964
lbl_800D5950:
/* 0D03B0 800D5950 9083000C */  stw     r4, 0xc(r3)
/* 0D03B4 800D5954 80030008 */  lwz     r0, 8(r3)
/* 0D03B8 800D5958 7C040040 */  cmplw   r4, r0
/* 0D03BC 800D595C 40810008 */  ble     lbl_800D5964
/* 0D03C0 800D5960 90830008 */  stw     r4, 8(r3)
lbl_800D5964:
/* 0D03C4 800D5964 7CA32B78 */  mr      r3, r5
/* 0D03C8 800D5968 4E800020 */  blr     

glabel TRKAppendBuffer
/* 0D03CC 800D596C 7C0802A6 */  mflr    r0
/* 0D03D0 800D5970 90010004 */  stw     r0, 4(r1)
/* 0D03D4 800D5974 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0D03D8 800D5978 93E10014 */  stw     r31, 0x14(r1)
/* 0D03DC 800D597C 3BE00000 */  li      r31, 0
/* 0D03E0 800D5980 93C10010 */  stw     r30, 0x10(r1)
/* 0D03E4 800D5984 7CBE2B79 */  or.     r30, r5, r5
/* 0D03E8 800D5988 93A1000C */  stw     r29, 0xc(r1)
/* 0D03EC 800D598C 3BA30000 */  addi    r29, r3, 0
/* 0D03F0 800D5990 4082000C */  bne     lbl_800D599C
/* 0D03F4 800D5994 38600000 */  li      r3, 0
/* 0D03F8 800D5998 4800005C */  b       lbl_800D59F4
lbl_800D599C:
/* 0D03FC 800D599C 807D000C */  lwz     r3, 0xc(r29)
/* 0D0400 800D59A0 20030880 */  subfic  r0, r3, 0x880
/* 0D0404 800D59A4 7C00F040 */  cmplw   r0, r30
/* 0D0408 800D59A8 4080000C */  bge     lbl_800D59B4
/* 0D040C 800D59AC 3BE00301 */  li      r31, 0x301
/* 0D0410 800D59B0 7C1E0378 */  mr      r30, r0
lbl_800D59B4:
/* 0D0414 800D59B4 281E0001 */  cmplwi  r30, 1
/* 0D0418 800D59B8 40820014 */  bne     lbl_800D59CC
/* 0D041C 800D59BC 88040000 */  lbz     r0, 0(r4)
/* 0D0420 800D59C0 7C7D1A14 */  add     r3, r29, r3
/* 0D0424 800D59C4 98030010 */  stb     r0, 0x10(r3)
/* 0D0428 800D59C8 48000014 */  b       lbl_800D59DC
lbl_800D59CC:
/* 0D042C 800D59CC 38630010 */  addi    r3, r3, 0x10
/* 0D0430 800D59D0 38BE0000 */  addi    r5, r30, 0
/* 0D0434 800D59D4 7C7D1A14 */  add     r3, r29, r3
/* 0D0438 800D59D8 4BF2DA81 */  bl      TRK_memcpy
lbl_800D59DC:
/* 0D043C 800D59DC 801D000C */  lwz     r0, 0xc(r29)
/* 0D0440 800D59E0 387F0000 */  addi    r3, r31, 0
/* 0D0444 800D59E4 7C00F214 */  add     r0, r0, r30
/* 0D0448 800D59E8 901D000C */  stw     r0, 0xc(r29)
/* 0D044C 800D59EC 801D000C */  lwz     r0, 0xc(r29)
/* 0D0450 800D59F0 901D0008 */  stw     r0, 8(r29)
lbl_800D59F4:
/* 0D0454 800D59F4 83E10014 */  lwz     r31, 0x14(r1)
/* 0D0458 800D59F8 83C10010 */  lwz     r30, 0x10(r1)
/* 0D045C 800D59FC 83A1000C */  lwz     r29, 0xc(r1)
/* 0D0460 800D5A00 38210018 */  addi    r1, r1, 0x18
/* 0D0464 800D5A04 80010004 */  lwz     r0, 4(r1)
/* 0D0468 800D5A08 7C0803A6 */  mtlr    r0
/* 0D046C 800D5A0C 4E800020 */  blr     

glabel TRKReadBuffer
/* 0D0470 800D5A10 7C0802A6 */  mflr    r0
/* 0D0474 800D5A14 90010004 */  stw     r0, 4(r1)
/* 0D0478 800D5A18 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0D047C 800D5A1C 93E10014 */  stw     r31, 0x14(r1)
/* 0D0480 800D5A20 3BE00000 */  li      r31, 0
/* 0D0484 800D5A24 93C10010 */  stw     r30, 0x10(r1)
/* 0D0488 800D5A28 7CBE2B79 */  or.     r30, r5, r5
/* 0D048C 800D5A2C 93A1000C */  stw     r29, 0xc(r1)
/* 0D0490 800D5A30 3BA30000 */  addi    r29, r3, 0
/* 0D0494 800D5A34 38640000 */  addi    r3, r4, 0
/* 0D0498 800D5A38 4082000C */  bne     lbl_800D5A44
/* 0D049C 800D5A3C 38600000 */  li      r3, 0
/* 0D04A0 800D5A40 48000040 */  b       lbl_800D5A80
lbl_800D5A44:
/* 0D04A4 800D5A44 809D000C */  lwz     r4, 0xc(r29)
/* 0D04A8 800D5A48 801D0008 */  lwz     r0, 8(r29)
/* 0D04AC 800D5A4C 7C040050 */  subf    r0, r4, r0
/* 0D04B0 800D5A50 7C1E0040 */  cmplw   r30, r0
/* 0D04B4 800D5A54 4081000C */  ble     lbl_800D5A60
/* 0D04B8 800D5A58 3BE00302 */  li      r31, 0x302
/* 0D04BC 800D5A5C 7C1E0378 */  mr      r30, r0
lbl_800D5A60:
/* 0D04C0 800D5A60 38840010 */  addi    r4, r4, 0x10
/* 0D04C4 800D5A64 38BE0000 */  addi    r5, r30, 0
/* 0D04C8 800D5A68 7C9D2214 */  add     r4, r29, r4
/* 0D04CC 800D5A6C 4BF2D9ED */  bl      TRK_memcpy
/* 0D04D0 800D5A70 801D000C */  lwz     r0, 0xc(r29)
/* 0D04D4 800D5A74 387F0000 */  addi    r3, r31, 0
/* 0D04D8 800D5A78 7C00F214 */  add     r0, r0, r30
/* 0D04DC 800D5A7C 901D000C */  stw     r0, 0xc(r29)
lbl_800D5A80:
/* 0D04E0 800D5A80 83E10014 */  lwz     r31, 0x14(r1)
/* 0D04E4 800D5A84 83C10010 */  lwz     r30, 0x10(r1)
/* 0D04E8 800D5A88 83A1000C */  lwz     r29, 0xc(r1)
/* 0D04EC 800D5A8C 38210018 */  addi    r1, r1, 0x18
/* 0D04F0 800D5A90 80010004 */  lwz     r0, 4(r1)
/* 0D04F4 800D5A94 7C0803A6 */  mtlr    r0
/* 0D04F8 800D5A98 4E800020 */  blr     

glabel TRKAppendBuffer1_ui16
/* 0D04FC 800D5A9C 7C0802A6 */  mflr    r0
/* 0D0500 800D5AA0 3CA08014 */  lis     r5, gTRKBigEndian@ha
/* 0D0504 800D5AA4 90010004 */  stw     r0, 4(r1)
/* 0D0508 800D5AA8 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0D050C 800D5AAC B0810008 */  sth     r4, 8(r1)
/* 0D0510 800D5AB0 80052878 */  lwz     r0, gTRKBigEndian@l(r5)
/* 0D0514 800D5AB4 2C000000 */  cmpwi   r0, 0
/* 0D0518 800D5AB8 4182000C */  beq     lbl_800D5AC4
/* 0D051C 800D5ABC 38810008 */  addi    r4, r1, 8
/* 0D0520 800D5AC0 48000018 */  b       lbl_800D5AD8
lbl_800D5AC4:
/* 0D0524 800D5AC4 88010009 */  lbz     r0, 9(r1)
/* 0D0528 800D5AC8 3881000C */  addi    r4, r1, 0xc
/* 0D052C 800D5ACC 9801000C */  stb     r0, 0xc(r1)
/* 0D0530 800D5AD0 88010008 */  lbz     r0, 8(r1)
/* 0D0534 800D5AD4 9801000D */  stb     r0, 0xd(r1)
lbl_800D5AD8:
/* 0D0538 800D5AD8 38A00002 */  li      r5, 2
/* 0D053C 800D5ADC 4BFFFE91 */  bl      TRKAppendBuffer
/* 0D0540 800D5AE0 38210010 */  addi    r1, r1, 0x10
/* 0D0544 800D5AE4 80010004 */  lwz     r0, 4(r1)
/* 0D0548 800D5AE8 7C0803A6 */  mtlr    r0
/* 0D054C 800D5AEC 4E800020 */  blr     

glabel TRKAppendBuffer1_ui32
/* 0D0550 800D5AF0 7C0802A6 */  mflr    r0
/* 0D0554 800D5AF4 3CA08014 */  lis     r5, gTRKBigEndian@ha
/* 0D0558 800D5AF8 90010004 */  stw     r0, 4(r1)
/* 0D055C 800D5AFC 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0D0560 800D5B00 90810008 */  stw     r4, 8(r1)
/* 0D0564 800D5B04 80052878 */  lwz     r0, gTRKBigEndian@l(r5)
/* 0D0568 800D5B08 2C000000 */  cmpwi   r0, 0
/* 0D056C 800D5B0C 4182000C */  beq     lbl_800D5B18
/* 0D0570 800D5B10 38810008 */  addi    r4, r1, 8
/* 0D0574 800D5B14 48000028 */  b       lbl_800D5B3C
lbl_800D5B18:
/* 0D0578 800D5B18 8801000B */  lbz     r0, 0xb(r1)
/* 0D057C 800D5B1C 3881000C */  addi    r4, r1, 0xc
/* 0D0580 800D5B20 9801000C */  stb     r0, 0xc(r1)
/* 0D0584 800D5B24 8801000A */  lbz     r0, 0xa(r1)
/* 0D0588 800D5B28 9801000D */  stb     r0, 0xd(r1)
/* 0D058C 800D5B2C 88010009 */  lbz     r0, 9(r1)
/* 0D0590 800D5B30 9801000E */  stb     r0, 0xe(r1)
/* 0D0594 800D5B34 88010008 */  lbz     r0, 8(r1)
/* 0D0598 800D5B38 9801000F */  stb     r0, 0xf(r1)
lbl_800D5B3C:
/* 0D059C 800D5B3C 38A00004 */  li      r5, 4
/* 0D05A0 800D5B40 4BFFFE2D */  bl      TRKAppendBuffer
/* 0D05A4 800D5B44 38210010 */  addi    r1, r1, 0x10
/* 0D05A8 800D5B48 80010004 */  lwz     r0, 4(r1)
/* 0D05AC 800D5B4C 7C0803A6 */  mtlr    r0
/* 0D05B0 800D5B50 4E800020 */  blr     

glabel TRKAppendBuffer1_ui64
/* 0D05B4 800D5B54 7C0802A6 */  mflr    r0
/* 0D05B8 800D5B58 3C808014 */  lis     r4, gTRKBigEndian@ha
/* 0D05BC 800D5B5C 90010004 */  stw     r0, 4(r1)
/* 0D05C0 800D5B60 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0D05C4 800D5B64 90A10008 */  stw     r5, 8(r1)
/* 0D05C8 800D5B68 90C1000C */  stw     r6, 0xc(r1)
/* 0D05CC 800D5B6C 80042878 */  lwz     r0, gTRKBigEndian@l(r4)
/* 0D05D0 800D5B70 2C000000 */  cmpwi   r0, 0
/* 0D05D4 800D5B74 4182000C */  beq     lbl_800D5B80
/* 0D05D8 800D5B78 38810008 */  addi    r4, r1, 8
/* 0D05DC 800D5B7C 48000048 */  b       lbl_800D5BC4
lbl_800D5B80:
/* 0D05E0 800D5B80 8801000F */  lbz     r0, 0xf(r1)
/* 0D05E4 800D5B84 38810010 */  addi    r4, r1, 0x10
/* 0D05E8 800D5B88 98010010 */  stb     r0, 0x10(r1)
/* 0D05EC 800D5B8C 8801000E */  lbz     r0, 0xe(r1)
/* 0D05F0 800D5B90 98010011 */  stb     r0, 0x11(r1)
/* 0D05F4 800D5B94 8801000D */  lbz     r0, 0xd(r1)
/* 0D05F8 800D5B98 98010012 */  stb     r0, 0x12(r1)
/* 0D05FC 800D5B9C 8801000C */  lbz     r0, 0xc(r1)
/* 0D0600 800D5BA0 98010013 */  stb     r0, 0x13(r1)
/* 0D0604 800D5BA4 8801000B */  lbz     r0, 0xb(r1)
/* 0D0608 800D5BA8 98010014 */  stb     r0, 0x14(r1)
/* 0D060C 800D5BAC 8801000A */  lbz     r0, 0xa(r1)
/* 0D0610 800D5BB0 98010015 */  stb     r0, 0x15(r1)
/* 0D0614 800D5BB4 88010009 */  lbz     r0, 9(r1)
/* 0D0618 800D5BB8 98010016 */  stb     r0, 0x16(r1)
/* 0D061C 800D5BBC 88010008 */  lbz     r0, 8(r1)
/* 0D0620 800D5BC0 98010017 */  stb     r0, 0x17(r1)
lbl_800D5BC4:
/* 0D0624 800D5BC4 38A00008 */  li      r5, 8
/* 0D0628 800D5BC8 4BFFFDA5 */  bl      TRKAppendBuffer
/* 0D062C 800D5BCC 38210018 */  addi    r1, r1, 0x18
/* 0D0630 800D5BD0 80010004 */  lwz     r0, 4(r1)
/* 0D0634 800D5BD4 7C0803A6 */  mtlr    r0
/* 0D0638 800D5BD8 4E800020 */  blr     

glabel TRKAppendBuffer_ui8
/* 0D063C 800D5BDC 39200000 */  li      r9, 0
/* 0D0640 800D5BE0 38000000 */  li      r0, 0
/* 0D0644 800D5BE4 48000048 */  b       lbl_800D5C2C
lbl_800D5BE8:
/* 0D0648 800D5BE8 80E3000C */  lwz     r7, 0xc(r3)
/* 0D064C 800D5BEC 89040000 */  lbz     r8, 0(r4)
/* 0D0650 800D5BF0 28070880 */  cmplwi  r7, 0x880
/* 0D0654 800D5BF4 4180000C */  blt     lbl_800D5C00
/* 0D0658 800D5BF8 38E00301 */  li      r7, 0x301
/* 0D065C 800D5BFC 48000024 */  b       lbl_800D5C20
lbl_800D5C00:
/* 0D0660 800D5C00 38C70001 */  addi    r6, r7, 1
/* 0D0664 800D5C04 38070010 */  addi    r0, r7, 0x10
/* 0D0668 800D5C08 90C3000C */  stw     r6, 0xc(r3)
/* 0D066C 800D5C0C 38E00000 */  li      r7, 0
/* 0D0670 800D5C10 7D0301AE */  stbx    r8, r3, r0
/* 0D0674 800D5C14 80C30008 */  lwz     r6, 8(r3)
/* 0D0678 800D5C18 38060001 */  addi    r0, r6, 1
/* 0D067C 800D5C1C 90030008 */  stw     r0, 8(r3)
lbl_800D5C20:
/* 0D0680 800D5C20 38070000 */  addi    r0, r7, 0
/* 0D0684 800D5C24 39290001 */  addi    r9, r9, 1
/* 0D0688 800D5C28 38840001 */  addi    r4, r4, 1
lbl_800D5C2C:
/* 0D068C 800D5C2C 2C000000 */  cmpwi   r0, 0
/* 0D0690 800D5C30 4082000C */  bne     lbl_800D5C3C
/* 0D0694 800D5C34 7C092800 */  cmpw    r9, r5
/* 0D0698 800D5C38 4180FFB0 */  blt     lbl_800D5BE8
lbl_800D5C3C:
/* 0D069C 800D5C3C 7C030378 */  mr      r3, r0
/* 0D06A0 800D5C40 4E800020 */  blr     

glabel TRKAppendBuffer_ui32
/* 0D06A4 800D5C44 7C0802A6 */  mflr    r0
/* 0D06A8 800D5C48 90010004 */  stw     r0, 4(r1)
/* 0D06AC 800D5C4C 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0D06B0 800D5C50 93E10014 */  stw     r31, 0x14(r1)
/* 0D06B4 800D5C54 93C10010 */  stw     r30, 0x10(r1)
/* 0D06B8 800D5C58 3BC00000 */  li      r30, 0
/* 0D06BC 800D5C5C 57C0103A */  slwi    r0, r30, 2
/* 0D06C0 800D5C60 93A1000C */  stw     r29, 0xc(r1)
/* 0D06C4 800D5C64 7FE40214 */  add     r31, r4, r0
/* 0D06C8 800D5C68 3BA50000 */  addi    r29, r5, 0
/* 0D06CC 800D5C6C 93810008 */  stw     r28, 8(r1)
/* 0D06D0 800D5C70 3B830000 */  addi    r28, r3, 0
/* 0D06D4 800D5C74 38600000 */  li      r3, 0
/* 0D06D8 800D5C78 48000018 */  b       lbl_800D5C90
lbl_800D5C7C:
/* 0D06DC 800D5C7C 7F83E378 */  mr      r3, r28
/* 0D06E0 800D5C80 809F0000 */  lwz     r4, 0(r31)
/* 0D06E4 800D5C84 4BFFFE6D */  bl      TRKAppendBuffer1_ui32
/* 0D06E8 800D5C88 3BDE0001 */  addi    r30, r30, 1
/* 0D06EC 800D5C8C 3BFF0004 */  addi    r31, r31, 4
lbl_800D5C90:
/* 0D06F0 800D5C90 2C030000 */  cmpwi   r3, 0
/* 0D06F4 800D5C94 4082000C */  bne     lbl_800D5CA0
/* 0D06F8 800D5C98 7C1EE800 */  cmpw    r30, r29
/* 0D06FC 800D5C9C 4180FFE0 */  blt     lbl_800D5C7C
lbl_800D5CA0:
/* 0D0700 800D5CA0 83E10014 */  lwz     r31, 0x14(r1)
/* 0D0704 800D5CA4 83C10010 */  lwz     r30, 0x10(r1)
/* 0D0708 800D5CA8 83A1000C */  lwz     r29, 0xc(r1)
/* 0D070C 800D5CAC 83810008 */  lwz     r28, 8(r1)
/* 0D0710 800D5CB0 38210018 */  addi    r1, r1, 0x18
/* 0D0714 800D5CB4 80010004 */  lwz     r0, 4(r1)
/* 0D0718 800D5CB8 7C0803A6 */  mtlr    r0
/* 0D071C 800D5CBC 4E800020 */  blr     

glabel TRKReadBuffer1_ui8
/* 0D0720 800D5CC0 7C0802A6 */  mflr    r0
/* 0D0724 800D5CC4 38A00001 */  li      r5, 1
/* 0D0728 800D5CC8 90010004 */  stw     r0, 4(r1)
/* 0D072C 800D5CCC 9421FFF8 */  stwu    r1, -8(r1)
/* 0D0730 800D5CD0 4BFFFD41 */  bl      TRKReadBuffer
/* 0D0734 800D5CD4 38210008 */  addi    r1, r1, 8
/* 0D0738 800D5CD8 80010004 */  lwz     r0, 4(r1)
/* 0D073C 800D5CDC 7C0803A6 */  mtlr    r0
/* 0D0740 800D5CE0 4E800020 */  blr     

glabel TRKReadBuffer1_ui16
/* 0D0744 800D5CE4 7C0802A6 */  mflr    r0
/* 0D0748 800D5CE8 3CA08014 */  lis     r5, gTRKBigEndian@ha
/* 0D074C 800D5CEC 90010004 */  stw     r0, 4(r1)
/* 0D0750 800D5CF0 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0D0754 800D5CF4 93E10014 */  stw     r31, 0x14(r1)
/* 0D0758 800D5CF8 93C10010 */  stw     r30, 0x10(r1)
/* 0D075C 800D5CFC 3BC40000 */  addi    r30, r4, 0
/* 0D0760 800D5D00 80052878 */  lwz     r0, gTRKBigEndian@l(r5)
/* 0D0764 800D5D04 2C000000 */  cmpwi   r0, 0
/* 0D0768 800D5D08 4182000C */  beq     lbl_800D5D14
/* 0D076C 800D5D0C 7FDFF378 */  mr      r31, r30
/* 0D0770 800D5D10 48000008 */  b       lbl_800D5D18
lbl_800D5D14:
/* 0D0774 800D5D14 3BE10008 */  addi    r31, r1, 8
lbl_800D5D18:
/* 0D0778 800D5D18 389F0000 */  addi    r4, r31, 0
/* 0D077C 800D5D1C 38A00002 */  li      r5, 2
/* 0D0780 800D5D20 4BFFFCF1 */  bl      TRKReadBuffer
/* 0D0784 800D5D24 3C808014 */  lis     r4, gTRKBigEndian@ha
/* 0D0788 800D5D28 80042878 */  lwz     r0, gTRKBigEndian@l(r4)
/* 0D078C 800D5D2C 2C000000 */  cmpwi   r0, 0
/* 0D0790 800D5D30 4082001C */  bne     lbl_800D5D4C
/* 0D0794 800D5D34 2C030000 */  cmpwi   r3, 0
/* 0D0798 800D5D38 40820014 */  bne     lbl_800D5D4C
/* 0D079C 800D5D3C 881F0001 */  lbz     r0, 1(r31)
/* 0D07A0 800D5D40 981E0000 */  stb     r0, 0(r30)
/* 0D07A4 800D5D44 881F0000 */  lbz     r0, 0(r31)
/* 0D07A8 800D5D48 981E0001 */  stb     r0, 1(r30)
lbl_800D5D4C:
/* 0D07AC 800D5D4C 83E10014 */  lwz     r31, 0x14(r1)
/* 0D07B0 800D5D50 83C10010 */  lwz     r30, 0x10(r1)
/* 0D07B4 800D5D54 38210018 */  addi    r1, r1, 0x18
/* 0D07B8 800D5D58 80010004 */  lwz     r0, 4(r1)
/* 0D07BC 800D5D5C 7C0803A6 */  mtlr    r0
/* 0D07C0 800D5D60 4E800020 */  blr     

glabel TRKReadBuffer1_ui32
/* 0D07C4 800D5D64 7C0802A6 */  mflr    r0
/* 0D07C8 800D5D68 3CA08014 */  lis     r5, gTRKBigEndian@ha
/* 0D07CC 800D5D6C 90010004 */  stw     r0, 4(r1)
/* 0D07D0 800D5D70 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0D07D4 800D5D74 93E10014 */  stw     r31, 0x14(r1)
/* 0D07D8 800D5D78 93C10010 */  stw     r30, 0x10(r1)
/* 0D07DC 800D5D7C 3BC40000 */  addi    r30, r4, 0
/* 0D07E0 800D5D80 80052878 */  lwz     r0, gTRKBigEndian@l(r5)
/* 0D07E4 800D5D84 2C000000 */  cmpwi   r0, 0
/* 0D07E8 800D5D88 4182000C */  beq     lbl_800D5D94
/* 0D07EC 800D5D8C 7FDFF378 */  mr      r31, r30
/* 0D07F0 800D5D90 48000008 */  b       lbl_800D5D98
lbl_800D5D94:
/* 0D07F4 800D5D94 3BE10008 */  addi    r31, r1, 8
lbl_800D5D98:
/* 0D07F8 800D5D98 389F0000 */  addi    r4, r31, 0
/* 0D07FC 800D5D9C 38A00004 */  li      r5, 4
/* 0D0800 800D5DA0 4BFFFC71 */  bl      TRKReadBuffer
/* 0D0804 800D5DA4 3C808014 */  lis     r4, gTRKBigEndian@ha
/* 0D0808 800D5DA8 80042878 */  lwz     r0, gTRKBigEndian@l(r4)
/* 0D080C 800D5DAC 2C000000 */  cmpwi   r0, 0
/* 0D0810 800D5DB0 4082002C */  bne     lbl_800D5DDC
/* 0D0814 800D5DB4 2C030000 */  cmpwi   r3, 0
/* 0D0818 800D5DB8 40820024 */  bne     lbl_800D5DDC
/* 0D081C 800D5DBC 881F0003 */  lbz     r0, 3(r31)
/* 0D0820 800D5DC0 981E0000 */  stb     r0, 0(r30)
/* 0D0824 800D5DC4 881F0002 */  lbz     r0, 2(r31)
/* 0D0828 800D5DC8 981E0001 */  stb     r0, 1(r30)
/* 0D082C 800D5DCC 881F0001 */  lbz     r0, 1(r31)
/* 0D0830 800D5DD0 981E0002 */  stb     r0, 2(r30)
/* 0D0834 800D5DD4 881F0000 */  lbz     r0, 0(r31)
/* 0D0838 800D5DD8 981E0003 */  stb     r0, 3(r30)
lbl_800D5DDC:
/* 0D083C 800D5DDC 83E10014 */  lwz     r31, 0x14(r1)
/* 0D0840 800D5DE0 83C10010 */  lwz     r30, 0x10(r1)
/* 0D0844 800D5DE4 38210018 */  addi    r1, r1, 0x18
/* 0D0848 800D5DE8 80010004 */  lwz     r0, 4(r1)
/* 0D084C 800D5DEC 7C0803A6 */  mtlr    r0
/* 0D0850 800D5DF0 4E800020 */  blr     

glabel TRKReadBuffer1_ui64
/* 0D0854 800D5DF4 7C0802A6 */  mflr    r0
/* 0D0858 800D5DF8 3CA08014 */  lis     r5, gTRKBigEndian@ha
/* 0D085C 800D5DFC 90010004 */  stw     r0, 4(r1)
/* 0D0860 800D5E00 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0D0864 800D5E04 93E10014 */  stw     r31, 0x14(r1)
/* 0D0868 800D5E08 93C10010 */  stw     r30, 0x10(r1)
/* 0D086C 800D5E0C 3BC40000 */  addi    r30, r4, 0
/* 0D0870 800D5E10 80052878 */  lwz     r0, gTRKBigEndian@l(r5)
/* 0D0874 800D5E14 2C000000 */  cmpwi   r0, 0
/* 0D0878 800D5E18 4182000C */  beq     lbl_800D5E24
/* 0D087C 800D5E1C 7FDFF378 */  mr      r31, r30
/* 0D0880 800D5E20 48000008 */  b       lbl_800D5E28
lbl_800D5E24:
/* 0D0884 800D5E24 3BE10008 */  addi    r31, r1, 8
lbl_800D5E28:
/* 0D0888 800D5E28 389F0000 */  addi    r4, r31, 0
/* 0D088C 800D5E2C 38A00008 */  li      r5, 8
/* 0D0890 800D5E30 4BFFFBE1 */  bl      TRKReadBuffer
/* 0D0894 800D5E34 3C808014 */  lis     r4, gTRKBigEndian@ha
/* 0D0898 800D5E38 80042878 */  lwz     r0, gTRKBigEndian@l(r4)
/* 0D089C 800D5E3C 2C000000 */  cmpwi   r0, 0
/* 0D08A0 800D5E40 4082004C */  bne     lbl_800D5E8C
/* 0D08A4 800D5E44 2C030000 */  cmpwi   r3, 0
/* 0D08A8 800D5E48 40820044 */  bne     lbl_800D5E8C
/* 0D08AC 800D5E4C 881F0007 */  lbz     r0, 7(r31)
/* 0D08B0 800D5E50 981E0000 */  stb     r0, 0(r30)
/* 0D08B4 800D5E54 881F0006 */  lbz     r0, 6(r31)
/* 0D08B8 800D5E58 981E0001 */  stb     r0, 1(r30)
/* 0D08BC 800D5E5C 881F0005 */  lbz     r0, 5(r31)
/* 0D08C0 800D5E60 981E0002 */  stb     r0, 2(r30)
/* 0D08C4 800D5E64 881F0004 */  lbz     r0, 4(r31)
/* 0D08C8 800D5E68 981E0003 */  stb     r0, 3(r30)
/* 0D08CC 800D5E6C 881F0003 */  lbz     r0, 3(r31)
/* 0D08D0 800D5E70 981E0004 */  stb     r0, 4(r30)
/* 0D08D4 800D5E74 881F0002 */  lbz     r0, 2(r31)
/* 0D08D8 800D5E78 981E0005 */  stb     r0, 5(r30)
/* 0D08DC 800D5E7C 881F0001 */  lbz     r0, 1(r31)
/* 0D08E0 800D5E80 981E0006 */  stb     r0, 6(r30)
/* 0D08E4 800D5E84 881F0000 */  lbz     r0, 0(r31)
/* 0D08E8 800D5E88 981E0007 */  stb     r0, 7(r30)
lbl_800D5E8C:
/* 0D08EC 800D5E8C 83E10014 */  lwz     r31, 0x14(r1)
/* 0D08F0 800D5E90 83C10010 */  lwz     r30, 0x10(r1)
/* 0D08F4 800D5E94 38210018 */  addi    r1, r1, 0x18
/* 0D08F8 800D5E98 80010004 */  lwz     r0, 4(r1)
/* 0D08FC 800D5E9C 7C0803A6 */  mtlr    r0
/* 0D0900 800D5EA0 4E800020 */  blr     

glabel TRKReadBuffer_ui8
/* 0D0904 800D5EA4 7C0802A6 */  mflr    r0
/* 0D0908 800D5EA8 90010004 */  stw     r0, 4(r1)
/* 0D090C 800D5EAC 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0D0910 800D5EB0 93E10014 */  stw     r31, 0x14(r1)
/* 0D0914 800D5EB4 3BE00000 */  li      r31, 0
/* 0D0918 800D5EB8 93C10010 */  stw     r30, 0x10(r1)
/* 0D091C 800D5EBC 3BC50000 */  addi    r30, r5, 0
/* 0D0920 800D5EC0 93A1000C */  stw     r29, 0xc(r1)
/* 0D0924 800D5EC4 3BA40000 */  addi    r29, r4, 0
/* 0D0928 800D5EC8 93810008 */  stw     r28, 8(r1)
/* 0D092C 800D5ECC 3B830000 */  addi    r28, r3, 0
/* 0D0930 800D5ED0 38600000 */  li      r3, 0
/* 0D0934 800D5ED4 48000014 */  b       lbl_800D5EE8
lbl_800D5ED8:
/* 0D0938 800D5ED8 387C0000 */  addi    r3, r28, 0
/* 0D093C 800D5EDC 7C9DFA14 */  add     r4, r29, r31
/* 0D0940 800D5EE0 4BFFFDE1 */  bl      TRKReadBuffer1_ui8
/* 0D0944 800D5EE4 3BFF0001 */  addi    r31, r31, 1
lbl_800D5EE8:
/* 0D0948 800D5EE8 2C030000 */  cmpwi   r3, 0
/* 0D094C 800D5EEC 4082000C */  bne     lbl_800D5EF8
/* 0D0950 800D5EF0 7C1FF000 */  cmpw    r31, r30
/* 0D0954 800D5EF4 4180FFE4 */  blt     lbl_800D5ED8
lbl_800D5EF8:
/* 0D0958 800D5EF8 83E10014 */  lwz     r31, 0x14(r1)
/* 0D095C 800D5EFC 83C10010 */  lwz     r30, 0x10(r1)
/* 0D0960 800D5F00 83A1000C */  lwz     r29, 0xc(r1)
/* 0D0964 800D5F04 83810008 */  lwz     r28, 8(r1)
/* 0D0968 800D5F08 38210018 */  addi    r1, r1, 0x18
/* 0D096C 800D5F0C 80010004 */  lwz     r0, 4(r1)
/* 0D0970 800D5F10 7C0803A6 */  mtlr    r0
/* 0D0974 800D5F14 4E800020 */  blr     

glabel TRKReadBuffer_ui32
/* 0D0978 800D5F18 7C0802A6 */  mflr    r0
/* 0D097C 800D5F1C 90010004 */  stw     r0, 4(r1)
/* 0D0980 800D5F20 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0D0984 800D5F24 93E10014 */  stw     r31, 0x14(r1)
/* 0D0988 800D5F28 93C10010 */  stw     r30, 0x10(r1)
/* 0D098C 800D5F2C 3BC00000 */  li      r30, 0
/* 0D0990 800D5F30 57C0103A */  slwi    r0, r30, 2
/* 0D0994 800D5F34 93A1000C */  stw     r29, 0xc(r1)
/* 0D0998 800D5F38 7FE40214 */  add     r31, r4, r0
/* 0D099C 800D5F3C 3BA50000 */  addi    r29, r5, 0
/* 0D09A0 800D5F40 93810008 */  stw     r28, 8(r1)
/* 0D09A4 800D5F44 3B830000 */  addi    r28, r3, 0
/* 0D09A8 800D5F48 38600000 */  li      r3, 0
/* 0D09AC 800D5F4C 48000018 */  b       lbl_800D5F64
lbl_800D5F50:
/* 0D09B0 800D5F50 387C0000 */  addi    r3, r28, 0
/* 0D09B4 800D5F54 389F0000 */  addi    r4, r31, 0
/* 0D09B8 800D5F58 4BFFFE0D */  bl      TRKReadBuffer1_ui32
/* 0D09BC 800D5F5C 3BDE0001 */  addi    r30, r30, 1
/* 0D09C0 800D5F60 3BFF0004 */  addi    r31, r31, 4
lbl_800D5F64:
/* 0D09C4 800D5F64 2C030000 */  cmpwi   r3, 0
/* 0D09C8 800D5F68 4082000C */  bne     lbl_800D5F74
/* 0D09CC 800D5F6C 7C1EE800 */  cmpw    r30, r29
/* 0D09D0 800D5F70 4180FFE0 */  blt     lbl_800D5F50
lbl_800D5F74:
/* 0D09D4 800D5F74 83E10014 */  lwz     r31, 0x14(r1)
/* 0D09D8 800D5F78 83C10010 */  lwz     r30, 0x10(r1)
/* 0D09DC 800D5F7C 83A1000C */  lwz     r29, 0xc(r1)
/* 0D09E0 800D5F80 83810008 */  lwz     r28, 8(r1)
/* 0D09E4 800D5F84 38210018 */  addi    r1, r1, 0x18
/* 0D09E8 800D5F88 80010004 */  lwz     r0, 4(r1)
/* 0D09EC 800D5F8C 7C0803A6 */  mtlr    r0
/* 0D09F0 800D5F90 4E800020 */  blr     


.section .bss, "wa"

.balign 8

/* 0013F900 80142880 19B0 */
glabel gTRKMsgBufs
    .skip 6576


