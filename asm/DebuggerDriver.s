# DebuggerDriver.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel DBClose
/* 0D911C 800DE6BC 4E800020 */  blr		

glabel DBOpen
/* 0D9120 800DE6C0 4E800020 */  blr		

glabel DBWrite
/* 0D9124 800DE6C4 7C0802A6 */  mflr	r0
/* 0D9128 800DE6C8 90010004 */  stw		r0, 4(r1)
/* 0D912C 800DE6CC 9421FF88 */  stwu	r1, -0x78(r1)
/* 0D9130 800DE6D0 BF010058 */  stmw	r24, 0x58(r1)
/* 0D9134 800DE6D4 3B430000 */  addi	r26, r3, 0
/* 0D9138 800DE6D8 3B640000 */  addi	r27, r4, 0
/* 0D913C 800DE6DC 4BFCC095 */  bl		OSDisableInterrupts
/* 0D9140 800DE6E0 3B830000 */  addi	r28, r3, 0
/* 0D9144 800DE6E4 3F20CC00 */  lis		r25, 0xcc00
/* 0D9148 800DE6E8 3FE04000 */  lis		r31, 0x4000
lbl_800DE6EC:
/* 0D914C 800DE6EC 80196828 */  lwz		r0, 0x6828(r25)
/* 0D9150 800DE6F0 3BD96800 */  addi	r30, r25, 0x6800
/* 0D9154 800DE6F4 38610050 */  addi	r3, r1, 0x50
/* 0D9158 800DE6F8 70000405 */  andi.	r0, r0, 0x405
/* 0D915C 800DE6FC 38800002 */  li		r4, 2
/* 0D9160 800DE700 38A00001 */  li		r5, 1
/* 0D9164 800DE704 600000C0 */  ori		r0, r0, 0xc0
/* 0D9168 800DE708 941E0028 */  stwu	r0, 0x28(r30)
/* 0D916C 800DE70C 93E10050 */  stw		r31, 0x50(r1)
/* 0D9170 800DE710 48000795 */  bl		DBGEXIImm
/* 0D9174 800DE714 7C600034 */  cntlzw	r0, r3
/* 0D9178 800DE718 5418D97E */  srwi	r24, r0, 5
lbl_800DE71C:
/* 0D917C 800DE71C 3BB96800 */  addi	r29, r25, 0x6800
/* 0D9180 800DE720 841D0034 */  lwzu	r0, 0x34(r29)
/* 0D9184 800DE724 540007FF */  clrlwi.	r0, r0, 0x1f
/* 0D9188 800DE728 4082FFF4 */  bne		lbl_800DE71C
/* 0D918C 800DE72C 38610054 */  addi	r3, r1, 0x54
/* 0D9190 800DE730 38800004 */  li		r4, 4
/* 0D9194 800DE734 38A00000 */  li		r5, 0
/* 0D9198 800DE738 4800076D */  bl		DBGEXIImm
lbl_800DE73C:
/* 0D919C 800DE73C 801D0000 */  lwz		r0, 0(r29)
/* 0D91A0 800DE740 540007FF */  clrlwi.	r0, r0, 0x1f
/* 0D91A4 800DE744 4082FFF8 */  bne		lbl_800DE73C
/* 0D91A8 800DE748 801E0000 */  lwz		r0, 0(r30)
/* 0D91AC 800DE74C 70000405 */  andi.	r0, r0, 0x405
/* 0D91B0 800DE750 901E0000 */  stw		r0, 0(r30)
/* 0D91B4 800DE754 80010054 */  lwz		r0, 0x54(r1)
/* 0D91B8 800DE758 540007BD */  rlwinm.	r0, r0, 0, 0x1e, 0x1e
/* 0D91BC 800DE75C 4082FF90 */  bne		lbl_800DE6EC
/* 0D91C0 800DE760 886D8E58 */  lbz		r3, SendCount-_SDA_BASE_(r13)
/* 0D91C4 800DE764 38030001 */  addi	r0, r3, 1
/* 0D91C8 800DE768 980D8E58 */  stb		r0, SendCount-_SDA_BASE_(r13)
/* 0D91CC 800DE76C 880D8E58 */  lbz		r0, SendCount-_SDA_BASE_(r13)
/* 0D91D0 800DE770 540007FF */  clrlwi.	r0, r0, 0x1f
/* 0D91D4 800DE774 4182000C */  beq		lbl_800DE780
/* 0D91D8 800DE778 38601000 */  li		r3, 0x1000
/* 0D91DC 800DE77C 48000008 */  b		lbl_800DE784
lbl_800DE780:
/* 0D91E0 800DE780 38600000 */  li		r3, 0
lbl_800DE784:
/* 0D91E4 800DE784 381B0003 */  addi	r0, r27, 3
/* 0D91E8 800DE788 64790001 */  oris	r25, r3, 1
/* 0D91EC 800DE78C 5418003A */  rlwinm	r24, r0, 0, 0, 0x1d
/* 0D91F0 800DE790 6339C000 */  ori		r25, r25, 0xc000
lbl_800DE794:
/* 0D91F4 800DE794 38790000 */  addi	r3, r25, 0
/* 0D91F8 800DE798 389A0000 */  addi	r4, r26, 0
/* 0D91FC 800DE79C 38B80000 */  addi	r5, r24, 0
/* 0D9200 800DE7A0 480004A1 */  bl		DBGWrite
/* 0D9204 800DE7A4 2C030000 */  cmpwi	r3, 0
/* 0D9208 800DE7A8 4182FFEC */  beq		lbl_800DE794
/* 0D920C 800DE7AC 3FE04000 */  lis		r31, 0x4000
lbl_800DE7B0:
/* 0D9210 800DE7B0 801E0000 */  lwz		r0, 0(r30)
/* 0D9214 800DE7B4 3861004C */  addi	r3, r1, 0x4c
/* 0D9218 800DE7B8 38800002 */  li		r4, 2
/* 0D921C 800DE7BC 70000405 */  andi.	r0, r0, 0x405
/* 0D9220 800DE7C0 38A00001 */  li		r5, 1
/* 0D9224 800DE7C4 600000C0 */  ori		r0, r0, 0xc0
/* 0D9228 800DE7C8 901E0000 */  stw		r0, 0(r30)
/* 0D922C 800DE7CC 93E1004C */  stw		r31, 0x4c(r1)
/* 0D9230 800DE7D0 480006D5 */  bl		DBGEXIImm
/* 0D9234 800DE7D4 7C600034 */  cntlzw	r0, r3
/* 0D9238 800DE7D8 541AD97E */  srwi	r26, r0, 5
lbl_800DE7DC:
/* 0D923C 800DE7DC 801D0000 */  lwz		r0, 0(r29)
/* 0D9240 800DE7E0 540007FF */  clrlwi.	r0, r0, 0x1f
/* 0D9244 800DE7E4 4082FFF8 */  bne		lbl_800DE7DC
/* 0D9248 800DE7E8 38610054 */  addi	r3, r1, 0x54
/* 0D924C 800DE7EC 38800004 */  li		r4, 4
/* 0D9250 800DE7F0 38A00000 */  li		r5, 0
/* 0D9254 800DE7F4 480006B1 */  bl		DBGEXIImm
lbl_800DE7F8:
/* 0D9258 800DE7F8 801D0000 */  lwz		r0, 0(r29)
/* 0D925C 800DE7FC 540007FF */  clrlwi.	r0, r0, 0x1f
/* 0D9260 800DE800 4082FFF8 */  bne		lbl_800DE7F8
/* 0D9264 800DE804 801E0000 */  lwz		r0, 0(r30)
/* 0D9268 800DE808 70000405 */  andi.	r0, r0, 0x405
/* 0D926C 800DE80C 901E0000 */  stw		r0, 0(r30)
/* 0D9270 800DE810 80010054 */  lwz		r0, 0x54(r1)
/* 0D9274 800DE814 540007BD */  rlwinm.	r0, r0, 0, 0x1e, 0x1e
/* 0D9278 800DE818 4082FF98 */  bne		lbl_800DE7B0
/* 0D927C 800DE81C 880D8E58 */  lbz		r0, SendCount-_SDA_BASE_(r13)
/* 0D9280 800DE820 5400801E */  slwi	r0, r0, 0x10
/* 0D9284 800DE824 64001F00 */  oris	r0, r0, 0x1f00
/* 0D9288 800DE828 7C00DB78 */  or		r0, r0, r27
/* 0D928C 800DE82C 540000FE */  clrlwi	r0, r0, 3
/* 0D9290 800DE830 6418C000 */  oris	r24, r0, 0xc000
lbl_800DE834:
/* 0D9294 800DE834 801E0000 */  lwz		r0, 0(r30)
/* 0D9298 800DE838 38610044 */  addi	r3, r1, 0x44
/* 0D929C 800DE83C 38800004 */  li		r4, 4
/* 0D92A0 800DE840 70000405 */  andi.	r0, r0, 0x405
/* 0D92A4 800DE844 38A00001 */  li		r5, 1
/* 0D92A8 800DE848 600000C0 */  ori		r0, r0, 0xc0
/* 0D92AC 800DE84C 901E0000 */  stw		r0, 0(r30)
/* 0D92B0 800DE850 93010044 */  stw		r24, 0x44(r1)
/* 0D92B4 800DE854 48000651 */  bl		DBGEXIImm
/* 0D92B8 800DE858 7C600034 */  cntlzw	r0, r3
/* 0D92BC 800DE85C 5403D97E */  srwi	r3, r0, 5
lbl_800DE860:
/* 0D92C0 800DE860 801D0000 */  lwz		r0, 0(r29)
/* 0D92C4 800DE864 540007FF */  clrlwi.	r0, r0, 0x1f
/* 0D92C8 800DE868 4082FFF8 */  bne		lbl_800DE860
/* 0D92CC 800DE86C 801E0000 */  lwz		r0, 0(r30)
/* 0D92D0 800DE870 70000405 */  andi.	r0, r0, 0x405
/* 0D92D4 800DE874 2C030000 */  cmpwi	r3, 0
/* 0D92D8 800DE878 901E0000 */  stw		r0, 0(r30)
/* 0D92DC 800DE87C 4082FFB8 */  bne		lbl_800DE834
/* 0D92E0 800DE880 3F604000 */  lis		r27, 0x4000
lbl_800DE884:
/* 0D92E4 800DE884 801E0000 */  lwz		r0, 0(r30)
/* 0D92E8 800DE888 3861003C */  addi	r3, r1, 0x3c
/* 0D92EC 800DE88C 38800002 */  li		r4, 2
/* 0D92F0 800DE890 70000405 */  andi.	r0, r0, 0x405
/* 0D92F4 800DE894 38A00001 */  li		r5, 1
/* 0D92F8 800DE898 600000C0 */  ori		r0, r0, 0xc0
/* 0D92FC 800DE89C 901E0000 */  stw		r0, 0(r30)
/* 0D9300 800DE8A0 9361003C */  stw		r27, 0x3c(r1)
/* 0D9304 800DE8A4 48000601 */  bl		DBGEXIImm
/* 0D9308 800DE8A8 7C600034 */  cntlzw	r0, r3
/* 0D930C 800DE8AC 541AD97E */  srwi	r26, r0, 5
lbl_800DE8B0:
/* 0D9310 800DE8B0 801D0000 */  lwz		r0, 0(r29)
/* 0D9314 800DE8B4 540007FF */  clrlwi.	r0, r0, 0x1f
/* 0D9318 800DE8B8 4082FFF8 */  bne		lbl_800DE8B0
/* 0D931C 800DE8BC 38610054 */  addi	r3, r1, 0x54
/* 0D9320 800DE8C0 38800004 */  li		r4, 4
/* 0D9324 800DE8C4 38A00000 */  li		r5, 0
/* 0D9328 800DE8C8 480005DD */  bl		DBGEXIImm
/* 0D932C 800DE8CC 7C600034 */  cntlzw	r0, r3
/* 0D9330 800DE8D0 5400D97E */  srwi	r0, r0, 5
/* 0D9334 800DE8D4 7F430378 */  or		r3, r26, r0
lbl_800DE8D8:
/* 0D9338 800DE8D8 801D0000 */  lwz		r0, 0(r29)
/* 0D933C 800DE8DC 540007FF */  clrlwi.	r0, r0, 0x1f
/* 0D9340 800DE8E0 4082FFF8 */  bne		lbl_800DE8D8
/* 0D9344 800DE8E4 801E0000 */  lwz		r0, 0(r30)
/* 0D9348 800DE8E8 70000405 */  andi.	r0, r0, 0x405
/* 0D934C 800DE8EC 2C030000 */  cmpwi	r3, 0
/* 0D9350 800DE8F0 901E0000 */  stw		r0, 0(r30)
/* 0D9354 800DE8F4 4082FF90 */  bne		lbl_800DE884
/* 0D9358 800DE8F8 80010054 */  lwz		r0, 0x54(r1)
/* 0D935C 800DE8FC 540007BD */  rlwinm.	r0, r0, 0, 0x1e, 0x1e
/* 0D9360 800DE900 4082FF84 */  bne		lbl_800DE884
/* 0D9364 800DE904 7F83E378 */  mr		r3, r28
/* 0D9368 800DE908 4BFCBE91 */  bl		OSRestoreInterrupts
/* 0D936C 800DE90C BB010058 */  lmw		r24, 0x58(r1)
/* 0D9370 800DE910 38600000 */  li		r3, 0
/* 0D9374 800DE914 8001007C */  lwz		r0, 0x7c(r1)
/* 0D9378 800DE918 38210078 */  addi	r1, r1, 0x78
/* 0D937C 800DE91C 7C0803A6 */  mtlr	r0
/* 0D9380 800DE920 4E800020 */  blr		

glabel DBRead
/* 0D9384 800DE924 7C0802A6 */  mflr	r0
/* 0D9388 800DE928 90010004 */  stw		r0, 4(r1)
/* 0D938C 800DE92C 9421FFE0 */  stwu	r1, -0x20(r1)
/* 0D9390 800DE930 93E1001C */  stw		r31, 0x1c(r1)
/* 0D9394 800DE934 93C10018 */  stw		r30, 0x18(r1)
/* 0D9398 800DE938 3BC40000 */  addi	r30, r4, 0
/* 0D939C 800DE93C 93A10014 */  stw		r29, 0x14(r1)
/* 0D93A0 800DE940 3BA30000 */  addi	r29, r3, 0
/* 0D93A4 800DE944 4BFCBE2D */  bl		OSDisableInterrupts
/* 0D93A8 800DE948 800D95F0 */  lwz		r0, SendMailData-_SDA_BASE_(r13)
/* 0D93AC 800DE94C 3BE30000 */  addi	r31, r3, 0
/* 0D93B0 800DE950 540003DF */  rlwinm.	r0, r0, 0, 0xf, 0xf
/* 0D93B4 800DE954 4182000C */  beq		lbl_800DE960
/* 0D93B8 800DE958 38601000 */  li		r3, 0x1000
/* 0D93BC 800DE95C 48000008 */  b		lbl_800DE964
lbl_800DE960:
/* 0D93C0 800DE960 38600000 */  li		r3, 0
lbl_800DE964:
/* 0D93C4 800DE964 3C630002 */  addis	r3, r3, 2
/* 0D93C8 800DE968 381E0003 */  addi	r0, r30, 3
/* 0D93CC 800DE96C 389D0000 */  addi	r4, r29, 0
/* 0D93D0 800DE970 5405003A */  rlwinm	r5, r0, 0, 0, 0x1d
/* 0D93D4 800DE974 3863E000 */  addi	r3, r3, -8192
/* 0D93D8 800DE978 480003A5 */  bl		DBGRead
/* 0D93DC 800DE97C 38000000 */  li		r0, 0
/* 0D93E0 800DE980 900D95F4 */  stw		r0, RecvDataLeng-_SDA_BASE_(r13)
/* 0D93E4 800DE984 7FE3FB78 */  mr		r3, r31
/* 0D93E8 800DE988 980D95FC */  stb		r0, EXIInputFlag-_SDA_BASE_(r13)
/* 0D93EC 800DE98C 4BFCBE0D */  bl		OSRestoreInterrupts
/* 0D93F0 800DE990 80010024 */  lwz		r0, 0x24(r1)
/* 0D93F4 800DE994 38600000 */  li		r3, 0
/* 0D93F8 800DE998 83E1001C */  lwz		r31, 0x1c(r1)
/* 0D93FC 800DE99C 83C10018 */  lwz		r30, 0x18(r1)
/* 0D9400 800DE9A0 83A10014 */  lwz		r29, 0x14(r1)
/* 0D9404 800DE9A4 38210020 */  addi	r1, r1, 0x20
/* 0D9408 800DE9A8 7C0803A6 */  mtlr	r0
/* 0D940C 800DE9AC 4E800020 */  blr		

glabel DBQueryData
/* 0D9410 800DE9B0 7C0802A6 */  mflr	r0
/* 0D9414 800DE9B4 38600000 */  li		r3, 0
/* 0D9418 800DE9B8 90010004 */  stw		r0, 4(r1)
/* 0D941C 800DE9BC 9421FFE8 */  stwu	r1, -0x18(r1)
/* 0D9420 800DE9C0 93E10014 */  stw		r31, 0x14(r1)
/* 0D9424 800DE9C4 800D95F4 */  lwz		r0, RecvDataLeng-_SDA_BASE_(r13)
/* 0D9428 800DE9C8 986D95FC */  stb		r3, EXIInputFlag-_SDA_BASE_(r13)
/* 0D942C 800DE9CC 2C000000 */  cmpwi	r0, 0
/* 0D9430 800DE9D0 40820064 */  bne		lbl_800DEA34
/* 0D9434 800DE9D4 4BFCBD9D */  bl		OSDisableInterrupts
/* 0D9438 800DE9D8 3BE30000 */  addi	r31, r3, 0
/* 0D943C 800DE9DC 38610008 */  addi	r3, r1, 8
/* 0D9440 800DE9E0 480001B5 */  bl		DBGReadStatus
/* 0D9444 800DE9E4 80010008 */  lwz		r0, 8(r1)
/* 0D9448 800DE9E8 540007FF */  clrlwi.	r0, r0, 0x1f
/* 0D944C 800DE9EC 41820040 */  beq		lbl_800DEA2C
/* 0D9450 800DE9F0 38610008 */  addi	r3, r1, 8
/* 0D9454 800DE9F4 48000405 */  bl		DBGReadMailbox
/* 0D9458 800DE9F8 80010008 */  lwz		r0, 8(r1)
/* 0D945C 800DE9FC 540000FE */  clrlwi	r0, r0, 3
/* 0D9460 800DEA00 90010008 */  stw		r0, 8(r1)
/* 0D9464 800DEA04 80810008 */  lwz		r4, 8(r1)
/* 0D9468 800DEA08 548300CE */  rlwinm	r3, r4, 0, 3, 7
/* 0D946C 800DEA0C 3C03E100 */  addis	r0, r3, 0xe100
/* 0D9470 800DEA10 28000000 */  cmplwi	r0, 0
/* 0D9474 800DEA14 40820018 */  bne		lbl_800DEA2C
/* 0D9478 800DEA18 5483047E */  clrlwi	r3, r4, 0x11
/* 0D947C 800DEA1C 908D95F0 */  stw		r4, SendMailData-_SDA_BASE_(r13)
/* 0D9480 800DEA20 38000001 */  li		r0, 1
/* 0D9484 800DEA24 906D95F4 */  stw		r3, RecvDataLeng-_SDA_BASE_(r13)
/* 0D9488 800DEA28 980D95FC */  stb		r0, EXIInputFlag-_SDA_BASE_(r13)
lbl_800DEA2C:
/* 0D948C 800DEA2C 7FE3FB78 */  mr		r3, r31
/* 0D9490 800DEA30 4BFCBD69 */  bl		OSRestoreInterrupts
lbl_800DEA34:
/* 0D9494 800DEA34 806D95F4 */  lwz		r3, RecvDataLeng-_SDA_BASE_(r13)
/* 0D9498 800DEA38 8001001C */  lwz		r0, 0x1c(r1)
/* 0D949C 800DEA3C 83E10014 */  lwz		r31, 0x14(r1)
/* 0D94A0 800DEA40 38210018 */  addi	r1, r1, 0x18
/* 0D94A4 800DEA44 7C0803A6 */  mtlr	r0
/* 0D94A8 800DEA48 4E800020 */  blr		

glabel DBInitInterrupts
/* 0D94AC 800DEA4C 7C0802A6 */  mflr	r0
/* 0D94B0 800DEA50 3C600002 */  lis		r3, 2
/* 0D94B4 800DEA54 90010004 */  stw		r0, 4(r1)
/* 0D94B8 800DEA58 38638000 */  addi	r3, r3, -32768
/* 0D94BC 800DEA5C 9421FFF8 */  stwu	r1, -8(r1)
/* 0D94C0 800DEA60 4BFCC0D9 */  bl		__OSMaskInterrupts
/* 0D94C4 800DEA64 38600040 */  li		r3, 0x40
/* 0D94C8 800DEA68 4BFCC0D1 */  bl		__OSMaskInterrupts
/* 0D94CC 800DEA6C 3C60800E */  lis		r3, MWCallback@ha
/* 0D94D0 800DEA70 3803EB58 */  addi	r0, r3, MWCallback@l
/* 0D94D4 800DEA74 3C60800E */  lis		r3, DBGHandler@ha
/* 0D94D8 800DEA78 900D95EC */  stw		r0, DBGCallback-_SDA_BASE_(r13)
/* 0D94DC 800DEA7C 3883EB18 */  addi	r4, r3, DBGHandler@l
/* 0D94E0 800DEA80 38600019 */  li		r3, 0x19
/* 0D94E4 800DEA84 4BFCBD39 */  bl		__OSSetInterruptHandler
/* 0D94E8 800DEA88 38600040 */  li		r3, 0x40
/* 0D94EC 800DEA8C 4BFCC135 */  bl		__OSUnmaskInterrupts
/* 0D94F0 800DEA90 8001000C */  lwz		r0, 0xc(r1)
/* 0D94F4 800DEA94 38210008 */  addi	r1, r1, 8
/* 0D94F8 800DEA98 7C0803A6 */  mtlr	r0
/* 0D94FC 800DEA9C 4E800020 */  blr		

glabel DBInitComm
/* 0D9500 800DEAA0 7C0802A6 */  mflr	r0
/* 0D9504 800DEAA4 90010004 */  stw		r0, 4(r1)
/* 0D9508 800DEAA8 9421FFE0 */  stwu	r1, -0x20(r1)
/* 0D950C 800DEAAC 93E1001C */  stw		r31, 0x1c(r1)
/* 0D9510 800DEAB0 93C10018 */  stw		r30, 0x18(r1)
/* 0D9514 800DEAB4 3BC40000 */  addi	r30, r4, 0
/* 0D9518 800DEAB8 93A10014 */  stw		r29, 0x14(r1)
/* 0D951C 800DEABC 3BA30000 */  addi	r29, r3, 0
/* 0D9520 800DEAC0 4BFCBCB1 */  bl		OSDisableInterrupts
/* 0D9524 800DEAC4 380D95FC */  addi	r0, r13, EXIInputFlag-_SDA_BASE_
/* 0D9528 800DEAC8 900D95F8 */  stw		r0, pEXIInputFlag-_SDA_BASE_(r13)
/* 0D952C 800DEACC 3C800002 */  lis		r4, 2
/* 0D9530 800DEAD0 3BE30000 */  addi	r31, r3, 0
/* 0D9534 800DEAD4 800D95F8 */  lwz		r0, pEXIInputFlag-_SDA_BASE_(r13)
/* 0D9538 800DEAD8 38648000 */  addi	r3, r4, -32768
/* 0D953C 800DEADC 901D0000 */  stw		r0, 0(r29)
/* 0D9540 800DEAE0 93CD95E8 */  stw		r30, MTRCallback-_SDA_BASE_(r13)
/* 0D9544 800DEAE4 4BFCC055 */  bl		__OSMaskInterrupts
/* 0D9548 800DEAE8 3C60CC00 */  lis		r3, 0xcc00
/* 0D954C 800DEAEC 38000000 */  li		r0, 0
/* 0D9550 800DEAF0 90036828 */  stw		r0, 0x6828(r3)
/* 0D9554 800DEAF4 7FE3FB78 */  mr		r3, r31
/* 0D9558 800DEAF8 4BFCBCA1 */  bl		OSRestoreInterrupts
/* 0D955C 800DEAFC 80010024 */  lwz		r0, 0x24(r1)
/* 0D9560 800DEB00 83E1001C */  lwz		r31, 0x1c(r1)
/* 0D9564 800DEB04 83C10018 */  lwz		r30, 0x18(r1)
/* 0D9568 800DEB08 83A10014 */  lwz		r29, 0x14(r1)
/* 0D956C 800DEB0C 38210020 */  addi	r1, r1, 0x20
/* 0D9570 800DEB10 7C0803A6 */  mtlr	r0
/* 0D9574 800DEB14 4E800020 */  blr		

DBGHandler:
/* 0D9578 800DEB18 7C0802A6 */  mflr	r0
/* 0D957C 800DEB1C 3CA0CC00 */  lis		r5, 0xcc00
/* 0D9580 800DEB20 90010004 */  stw		r0, 4(r1)
/* 0D9584 800DEB24 38001000 */  li		r0, 0x1000
/* 0D9588 800DEB28 9421FFF8 */  stwu	r1, -8(r1)
/* 0D958C 800DEB2C 818D95EC */  lwz		r12, DBGCallback-_SDA_BASE_(r13)
/* 0D9590 800DEB30 90053000 */  stw		r0, 0x3000(r5)
/* 0D9594 800DEB34 280C0000 */  cmplwi	r12, 0
/* 0D9598 800DEB38 41820010 */  beq		lbl_800DEB48
/* 0D959C 800DEB3C 7D8803A6 */  mtlr	r12
/* 0D95A0 800DEB40 7C630734 */  extsh	r3, r3
/* 0D95A4 800DEB44 4E800021 */  blrl	
lbl_800DEB48:
/* 0D95A8 800DEB48 8001000C */  lwz		r0, 0xc(r1)
/* 0D95AC 800DEB4C 38210008 */  addi	r1, r1, 8
/* 0D95B0 800DEB50 7C0803A6 */  mtlr	r0
/* 0D95B4 800DEB54 4E800020 */  blr		

MWCallback:
/* 0D95B8 800DEB58 7C0802A6 */  mflr	r0
/* 0D95BC 800DEB5C 90010004 */  stw		r0, 4(r1)
/* 0D95C0 800DEB60 38000001 */  li		r0, 1
/* 0D95C4 800DEB64 9421FFF8 */  stwu	r1, -8(r1)
/* 0D95C8 800DEB68 818D95E8 */  lwz		r12, MTRCallback-_SDA_BASE_(r13)
/* 0D95CC 800DEB6C 980D95FC */  stb		r0, EXIInputFlag-_SDA_BASE_(r13)
/* 0D95D0 800DEB70 280C0000 */  cmplwi	r12, 0
/* 0D95D4 800DEB74 41820010 */  beq		lbl_800DEB84
/* 0D95D8 800DEB78 7D8803A6 */  mtlr	r12
/* 0D95DC 800DEB7C 38600000 */  li		r3, 0
/* 0D95E0 800DEB80 4E800021 */  blrl	
lbl_800DEB84:
/* 0D95E4 800DEB84 8001000C */  lwz		r0, 0xc(r1)
/* 0D95E8 800DEB88 38210008 */  addi	r1, r1, 8
/* 0D95EC 800DEB8C 7C0803A6 */  mtlr	r0
/* 0D95F0 800DEB90 4E800020 */  blr		

DBGReadStatus:
/* 0D95F4 800DEB94 7C0802A6 */  mflr	r0
/* 0D95F8 800DEB98 38800002 */  li		r4, 2
/* 0D95FC 800DEB9C 90010004 */  stw		r0, 4(r1)
/* 0D9600 800DEBA0 3C004000 */  lis		r0, 0x4000
/* 0D9604 800DEBA4 9421FFC8 */  stwu	r1, -0x38(r1)
/* 0D9608 800DEBA8 BF610024 */  stmw	r27, 0x24(r1)
/* 0D960C 800DEBAC 3FC0CC00 */  lis		r30, 0xcc00
/* 0D9610 800DEBB0 3B630000 */  addi	r27, r3, 0
/* 0D9614 800DEBB4 3BBE6800 */  addi	r29, r30, 0x6800
/* 0D9618 800DEBB8 38610018 */  addi	r3, r1, 0x18
/* 0D961C 800DEBBC 80BE6828 */  lwz		r5, 0x6828(r30)
/* 0D9620 800DEBC0 70A50405 */  andi.	r5, r5, 0x405
/* 0D9624 800DEBC4 60A500C0 */  ori		r5, r5, 0xc0
/* 0D9628 800DEBC8 94BD0028 */  stwu	r5, 0x28(r29)
/* 0D962C 800DEBCC 38A00001 */  li		r5, 1
/* 0D9630 800DEBD0 90010018 */  stw		r0, 0x18(r1)
/* 0D9634 800DEBD4 480002D1 */  bl		DBGEXIImm
/* 0D9638 800DEBD8 7C600034 */  cntlzw	r0, r3
/* 0D963C 800DEBDC 541FD97E */  srwi	r31, r0, 5
lbl_800DEBE0:
/* 0D9640 800DEBE0 3B9E6800 */  addi	r28, r30, 0x6800
/* 0D9644 800DEBE4 841C0034 */  lwzu	r0, 0x34(r28)
/* 0D9648 800DEBE8 540007FF */  clrlwi.	r0, r0, 0x1f
/* 0D964C 800DEBEC 4082FFF4 */  bne		lbl_800DEBE0
/* 0D9650 800DEBF0 387B0000 */  addi	r3, r27, 0
/* 0D9654 800DEBF4 38800004 */  li		r4, 4
/* 0D9658 800DEBF8 38A00000 */  li		r5, 0
/* 0D965C 800DEBFC 480002A9 */  bl		DBGEXIImm
/* 0D9660 800DEC00 7C600034 */  cntlzw	r0, r3
/* 0D9664 800DEC04 5400D97E */  srwi	r0, r0, 5
/* 0D9668 800DEC08 7FE30378 */  or		r3, r31, r0
lbl_800DEC0C:
/* 0D966C 800DEC0C 801C0000 */  lwz		r0, 0(r28)
/* 0D9670 800DEC10 540007FF */  clrlwi.	r0, r0, 0x1f
/* 0D9674 800DEC14 4082FFF8 */  bne		lbl_800DEC0C
/* 0D9678 800DEC18 809D0000 */  lwz		r4, 0(r29)
/* 0D967C 800DEC1C 7C600034 */  cntlzw	r0, r3
/* 0D9680 800DEC20 5403D97E */  srwi	r3, r0, 5
/* 0D9684 800DEC24 70800405 */  andi.	r0, r4, 0x405
/* 0D9688 800DEC28 901D0000 */  stw		r0, 0(r29)
/* 0D968C 800DEC2C BB610024 */  lmw		r27, 0x24(r1)
/* 0D9690 800DEC30 8001003C */  lwz		r0, 0x3c(r1)
/* 0D9694 800DEC34 38210038 */  addi	r1, r1, 0x38
/* 0D9698 800DEC38 7C0803A6 */  mtlr	r0
/* 0D969C 800DEC3C 4E800020 */  blr		

DBGWrite:
/* 0D96A0 800DEC40 7C0802A6 */  mflr	r0
/* 0D96A4 800DEC44 90010004 */  stw		r0, 4(r1)
/* 0D96A8 800DEC48 546041EA */  rlwinm	r0, r3, 8, 7, 0x15
/* 0D96AC 800DEC4C 6400A000 */  oris	r0, r0, 0xa000
/* 0D96B0 800DEC50 9421FFC0 */  stwu	r1, -0x40(r1)
/* 0D96B4 800DEC54 BF410028 */  stmw	r26, 0x28(r1)
/* 0D96B8 800DEC58 3FA0CC00 */  lis		r29, 0xcc00
/* 0D96BC 800DEC5C 3BC50000 */  addi	r30, r5, 0
/* 0D96C0 800DEC60 3B440000 */  addi	r26, r4, 0
/* 0D96C4 800DEC64 3BFD6800 */  addi	r31, r29, 0x6800
/* 0D96C8 800DEC68 38610024 */  addi	r3, r1, 0x24
/* 0D96CC 800DEC6C 38800004 */  li		r4, 4
/* 0D96D0 800DEC70 38A00001 */  li		r5, 1
/* 0D96D4 800DEC74 80DD6828 */  lwz		r6, 0x6828(r29)
/* 0D96D8 800DEC78 70C60405 */  andi.	r6, r6, 0x405
/* 0D96DC 800DEC7C 60C600C0 */  ori		r6, r6, 0xc0
/* 0D96E0 800DEC80 94DF0028 */  stwu	r6, 0x28(r31)
/* 0D96E4 800DEC84 90010024 */  stw		r0, 0x24(r1)
/* 0D96E8 800DEC88 4800021D */  bl		DBGEXIImm
/* 0D96EC 800DEC8C 7C600034 */  cntlzw	r0, r3
/* 0D96F0 800DEC90 5400D97E */  srwi	r0, r0, 5
/* 0D96F4 800DEC94 7C1B0378 */  mr		r27, r0
lbl_800DEC98:
/* 0D96F8 800DEC98 3B9D6800 */  addi	r28, r29, 0x6800
/* 0D96FC 800DEC9C 841C0034 */  lwzu	r0, 0x34(r28)
/* 0D9700 800DECA0 540007FF */  clrlwi.	r0, r0, 0x1f
/* 0D9704 800DECA4 4082FFF4 */  bne		lbl_800DEC98
/* 0D9708 800DECA8 48000044 */  b		lbl_800DECEC
lbl_800DECAC:
/* 0D970C 800DECAC 801A0000 */  lwz		r0, 0(r26)
/* 0D9710 800DECB0 38610020 */  addi	r3, r1, 0x20
/* 0D9714 800DECB4 38800004 */  li		r4, 4
/* 0D9718 800DECB8 90010020 */  stw		r0, 0x20(r1)
/* 0D971C 800DECBC 38A00001 */  li		r5, 1
/* 0D9720 800DECC0 3B5A0004 */  addi	r26, r26, 4
/* 0D9724 800DECC4 480001E1 */  bl		DBGEXIImm
/* 0D9728 800DECC8 7C600034 */  cntlzw	r0, r3
/* 0D972C 800DECCC 5400D97E */  srwi	r0, r0, 5
/* 0D9730 800DECD0 7F7B0378 */  or		r27, r27, r0
lbl_800DECD4:
/* 0D9734 800DECD4 801C0000 */  lwz		r0, 0(r28)
/* 0D9738 800DECD8 540007FF */  clrlwi.	r0, r0, 0x1f
/* 0D973C 800DECDC 4082FFF8 */  bne		lbl_800DECD4
/* 0D9740 800DECE0 37DEFFFC */  addic.	r30, r30, -4
/* 0D9744 800DECE4 40800008 */  bge		lbl_800DECEC
/* 0D9748 800DECE8 3BC00000 */  li		r30, 0
lbl_800DECEC:
/* 0D974C 800DECEC 2C1E0000 */  cmpwi	r30, 0
/* 0D9750 800DECF0 4082FFBC */  bne		lbl_800DECAC
/* 0D9754 800DECF4 809F0000 */  lwz		r4, 0(r31)
/* 0D9758 800DECF8 7F600034 */  cntlzw	r0, r27
/* 0D975C 800DECFC 5403D97E */  srwi	r3, r0, 5
/* 0D9760 800DED00 70800405 */  andi.	r0, r4, 0x405
/* 0D9764 800DED04 901F0000 */  stw		r0, 0(r31)
/* 0D9768 800DED08 BB410028 */  lmw		r26, 0x28(r1)
/* 0D976C 800DED0C 80010044 */  lwz		r0, 0x44(r1)
/* 0D9770 800DED10 38210040 */  addi	r1, r1, 0x40
/* 0D9774 800DED14 7C0803A6 */  mtlr	r0
/* 0D9778 800DED18 4E800020 */  blr		

DBGRead:
/* 0D977C 800DED1C 7C0802A6 */  mflr	r0
/* 0D9780 800DED20 90010004 */  stw		r0, 4(r1)
/* 0D9784 800DED24 546041EA */  rlwinm	r0, r3, 8, 7, 0x15
/* 0D9788 800DED28 64002000 */  oris	r0, r0, 0x2000
/* 0D978C 800DED2C 9421FFC0 */  stwu	r1, -0x40(r1)
/* 0D9790 800DED30 BF410028 */  stmw	r26, 0x28(r1)
/* 0D9794 800DED34 3FA0CC00 */  lis		r29, 0xcc00
/* 0D9798 800DED38 3BC50000 */  addi	r30, r5, 0
/* 0D979C 800DED3C 3B440000 */  addi	r26, r4, 0
/* 0D97A0 800DED40 3BFD6800 */  addi	r31, r29, 0x6800
/* 0D97A4 800DED44 38610024 */  addi	r3, r1, 0x24
/* 0D97A8 800DED48 38800004 */  li		r4, 4
/* 0D97AC 800DED4C 38A00001 */  li		r5, 1
/* 0D97B0 800DED50 80DD6828 */  lwz		r6, 0x6828(r29)
/* 0D97B4 800DED54 70C60405 */  andi.	r6, r6, 0x405
/* 0D97B8 800DED58 60C600C0 */  ori		r6, r6, 0xc0
/* 0D97BC 800DED5C 94DF0028 */  stwu	r6, 0x28(r31)
/* 0D97C0 800DED60 90010024 */  stw		r0, 0x24(r1)
/* 0D97C4 800DED64 48000141 */  bl		DBGEXIImm
/* 0D97C8 800DED68 7C600034 */  cntlzw	r0, r3
/* 0D97CC 800DED6C 5400D97E */  srwi	r0, r0, 5
/* 0D97D0 800DED70 7C1B0378 */  mr		r27, r0
lbl_800DED74:
/* 0D97D4 800DED74 3B9D6800 */  addi	r28, r29, 0x6800
/* 0D97D8 800DED78 841C0034 */  lwzu	r0, 0x34(r28)
/* 0D97DC 800DED7C 540007FF */  clrlwi.	r0, r0, 0x1f
/* 0D97E0 800DED80 4082FFF4 */  bne		lbl_800DED74
/* 0D97E4 800DED84 48000044 */  b		lbl_800DEDC8
lbl_800DED88:
/* 0D97E8 800DED88 38610020 */  addi	r3, r1, 0x20
/* 0D97EC 800DED8C 38800004 */  li		r4, 4
/* 0D97F0 800DED90 38A00000 */  li		r5, 0
/* 0D97F4 800DED94 48000111 */  bl		DBGEXIImm
/* 0D97F8 800DED98 7C600034 */  cntlzw	r0, r3
/* 0D97FC 800DED9C 5400D97E */  srwi	r0, r0, 5
/* 0D9800 800DEDA0 7F7B0378 */  or		r27, r27, r0
lbl_800DEDA4:
/* 0D9804 800DEDA4 801C0000 */  lwz		r0, 0(r28)
/* 0D9808 800DEDA8 540007FF */  clrlwi.	r0, r0, 0x1f
/* 0D980C 800DEDAC 4082FFF8 */  bne		lbl_800DEDA4
/* 0D9810 800DEDB0 80010020 */  lwz		r0, 0x20(r1)
/* 0D9814 800DEDB4 37DEFFFC */  addic.	r30, r30, -4
/* 0D9818 800DEDB8 901A0000 */  stw		r0, 0(r26)
/* 0D981C 800DEDBC 3B5A0004 */  addi	r26, r26, 4
/* 0D9820 800DEDC0 40800008 */  bge		lbl_800DEDC8
/* 0D9824 800DEDC4 3BC00000 */  li		r30, 0
lbl_800DEDC8:
/* 0D9828 800DEDC8 2C1E0000 */  cmpwi	r30, 0
/* 0D982C 800DEDCC 4082FFBC */  bne		lbl_800DED88
/* 0D9830 800DEDD0 809F0000 */  lwz		r4, 0(r31)
/* 0D9834 800DEDD4 7F600034 */  cntlzw	r0, r27
/* 0D9838 800DEDD8 5403D97E */  srwi	r3, r0, 5
/* 0D983C 800DEDDC 70800405 */  andi.	r0, r4, 0x405
/* 0D9840 800DEDE0 901F0000 */  stw		r0, 0(r31)
/* 0D9844 800DEDE4 BB410028 */  lmw		r26, 0x28(r1)
/* 0D9848 800DEDE8 80010044 */  lwz		r0, 0x44(r1)
/* 0D984C 800DEDEC 38210040 */  addi	r1, r1, 0x40
/* 0D9850 800DEDF0 7C0803A6 */  mtlr	r0
/* 0D9854 800DEDF4 4E800020 */  blr		

DBGReadMailbox:
/* 0D9858 800DEDF8 7C0802A6 */  mflr	r0
/* 0D985C 800DEDFC 38800002 */  li		r4, 2
/* 0D9860 800DEE00 90010004 */  stw		r0, 4(r1)
/* 0D9864 800DEE04 3C006000 */  lis		r0, 0x6000
/* 0D9868 800DEE08 9421FFC8 */  stwu	r1, -0x38(r1)
/* 0D986C 800DEE0C BF610024 */  stmw	r27, 0x24(r1)
/* 0D9870 800DEE10 3FC0CC00 */  lis		r30, 0xcc00
/* 0D9874 800DEE14 3B630000 */  addi	r27, r3, 0
/* 0D9878 800DEE18 3BBE6800 */  addi	r29, r30, 0x6800
/* 0D987C 800DEE1C 38610018 */  addi	r3, r1, 0x18
/* 0D9880 800DEE20 80BE6828 */  lwz		r5, 0x6828(r30)
/* 0D9884 800DEE24 70A50405 */  andi.	r5, r5, 0x405
/* 0D9888 800DEE28 60A500C0 */  ori		r5, r5, 0xc0
/* 0D988C 800DEE2C 94BD0028 */  stwu	r5, 0x28(r29)
/* 0D9890 800DEE30 38A00001 */  li		r5, 1
/* 0D9894 800DEE34 90010018 */  stw		r0, 0x18(r1)
/* 0D9898 800DEE38 4800006D */  bl		DBGEXIImm
/* 0D989C 800DEE3C 7C600034 */  cntlzw	r0, r3
/* 0D98A0 800DEE40 541FD97E */  srwi	r31, r0, 5
lbl_800DEE44:
/* 0D98A4 800DEE44 3B9E6800 */  addi	r28, r30, 0x6800
/* 0D98A8 800DEE48 841C0034 */  lwzu	r0, 0x34(r28)
/* 0D98AC 800DEE4C 540007FF */  clrlwi.	r0, r0, 0x1f
/* 0D98B0 800DEE50 4082FFF4 */  bne		lbl_800DEE44
/* 0D98B4 800DEE54 387B0000 */  addi	r3, r27, 0
/* 0D98B8 800DEE58 38800004 */  li		r4, 4
/* 0D98BC 800DEE5C 38A00000 */  li		r5, 0
/* 0D98C0 800DEE60 48000045 */  bl		DBGEXIImm
/* 0D98C4 800DEE64 7C600034 */  cntlzw	r0, r3
/* 0D98C8 800DEE68 5400D97E */  srwi	r0, r0, 5
/* 0D98CC 800DEE6C 7FE30378 */  or		r3, r31, r0
lbl_800DEE70:
/* 0D98D0 800DEE70 801C0000 */  lwz		r0, 0(r28)
/* 0D98D4 800DEE74 540007FF */  clrlwi.	r0, r0, 0x1f
/* 0D98D8 800DEE78 4082FFF8 */  bne		lbl_800DEE70
/* 0D98DC 800DEE7C 809D0000 */  lwz		r4, 0(r29)
/* 0D98E0 800DEE80 7C600034 */  cntlzw	r0, r3
/* 0D98E4 800DEE84 5403D97E */  srwi	r3, r0, 5
/* 0D98E8 800DEE88 70800405 */  andi.	r0, r4, 0x405
/* 0D98EC 800DEE8C 901D0000 */  stw		r0, 0(r29)
/* 0D98F0 800DEE90 BB610024 */  lmw		r27, 0x24(r1)
/* 0D98F4 800DEE94 8001003C */  lwz		r0, 0x3c(r1)
/* 0D98F8 800DEE98 38210038 */  addi	r1, r1, 0x38
/* 0D98FC 800DEE9C 7C0803A6 */  mtlr	r0
/* 0D9900 800DEEA0 4E800020 */  blr		

DBGEXIImm:
/* 0D9904 800DEEA4 9421FFB8 */  stwu	r1, -0x48(r1)
/* 0D9908 800DEEA8 28050000 */  cmplwi	r5, 0
/* 0D990C 800DEEAC BEC10020 */  stmw	r22, 0x20(r1)
/* 0D9910 800DEEB0 41820138 */  beq		lbl_800DEFE8
/* 0D9914 800DEEB4 3BA00000 */  li		r29, 0
/* 0D9918 800DEEB8 7C1D2000 */  cmpw	r29, r4
/* 0D991C 800DEEBC 3BC00000 */  li		r30, 0
/* 0D9920 800DEEC0 40800120 */  bge		lbl_800DEFE0
/* 0D9924 800DEEC4 2C040008 */  cmpwi	r4, 8
/* 0D9928 800DEEC8 38C4FFF8 */  addi	r6, r4, -8
/* 0D992C 800DEECC 4081025C */  ble		lbl_800DF128
/* 0D9930 800DEED0 38060007 */  addi	r0, r6, 7
/* 0D9934 800DEED4 5400E8FE */  srwi	r0, r0, 3
/* 0D9938 800DEED8 2C060000 */  cmpwi	r6, 0
/* 0D993C 800DEEDC 7C0903A6 */  mtctr	r0
/* 0D9940 800DEEE0 3BE30000 */  addi	r31, r3, 0
/* 0D9944 800DEEE4 40810244 */  ble		lbl_800DF128
lbl_800DEEE8:
/* 0D9948 800DEEE8 20DD0003 */  subfic	r6, r29, 3
/* 0D994C 800DEEEC 899F0000 */  lbz		r12, 0(r31)
/* 0D9950 800DEEF0 381D0001 */  addi	r0, r29, 1
/* 0D9954 800DEEF4 897F0001 */  lbz		r11, 1(r31)
/* 0D9958 800DEEF8 54CA1838 */  slwi	r10, r6, 3
/* 0D995C 800DEEFC 893F0002 */  lbz		r9, 2(r31)
/* 0D9960 800DEF00 21000003 */  subfic	r8, r0, 3
/* 0D9964 800DEF04 88FF0003 */  lbz		r7, 3(r31)
/* 0D9968 800DEF08 38DD0002 */  addi	r6, r29, 2
/* 0D996C 800DEF0C 881F0004 */  lbz		r0, 4(r31)
/* 0D9970 800DEF10 7D8C5030 */  slw		r12, r12, r10
/* 0D9974 800DEF14 8AFF0005 */  lbz		r23, 5(r31)
/* 0D9978 800DEF18 550A1838 */  slwi	r10, r8, 3
/* 0D997C 800DEF1C 8B3F0006 */  lbz		r25, 6(r31)
/* 0D9980 800DEF20 20C60003 */  subfic	r6, r6, 3
/* 0D9984 800DEF24 8B7F0007 */  lbz		r27, 7(r31)
/* 0D9988 800DEF28 54C81838 */  slwi	r8, r6, 3
/* 0D998C 800DEF2C 7CDD00D0 */  neg		r6, r29
/* 0D9990 800DEF30 3ADD0004 */  addi	r22, r29, 4
/* 0D9994 800DEF34 54C61838 */  slwi	r6, r6, 3
/* 0D9998 800DEF38 22D60003 */  subfic	r22, r22, 3
/* 0D999C 800DEF3C 3B1D0005 */  addi	r24, r29, 5
/* 0D99A0 800DEF40 56D61838 */  slwi	r22, r22, 3
/* 0D99A4 800DEF44 23180003 */  subfic	r24, r24, 3
/* 0D99A8 800DEF48 3B5D0006 */  addi	r26, r29, 6
/* 0D99AC 800DEF4C 57181838 */  slwi	r24, r24, 3
/* 0D99B0 800DEF50 235A0003 */  subfic	r26, r26, 3
/* 0D99B4 800DEF54 3B9D0007 */  addi	r28, r29, 7
/* 0D99B8 800DEF58 575A1838 */  slwi	r26, r26, 3
/* 0D99BC 800DEF5C 239C0003 */  subfic	r28, r28, 3
/* 0D99C0 800DEF60 579C1838 */  slwi	r28, r28, 3
/* 0D99C4 800DEF64 7FDE6378 */  or		r30, r30, r12
/* 0D99C8 800DEF68 7D6A5030 */  slw		r10, r11, r10
/* 0D99CC 800DEF6C 7FDE5378 */  or		r30, r30, r10
/* 0D99D0 800DEF70 7D284030 */  slw		r8, r9, r8
/* 0D99D4 800DEF74 7FDE4378 */  or		r30, r30, r8
/* 0D99D8 800DEF78 7CE63030 */  slw		r6, r7, r6
/* 0D99DC 800DEF7C 7FDE3378 */  or		r30, r30, r6
/* 0D99E0 800DEF80 7C00B030 */  slw		r0, r0, r22
/* 0D99E4 800DEF84 7FDE0378 */  or		r30, r30, r0
/* 0D99E8 800DEF88 7EE0C030 */  slw		r0, r23, r24
/* 0D99EC 800DEF8C 7FDE0378 */  or		r30, r30, r0
/* 0D99F0 800DEF90 7F20D030 */  slw		r0, r25, r26
/* 0D99F4 800DEF94 7FDE0378 */  or		r30, r30, r0
/* 0D99F8 800DEF98 7F60E030 */  slw		r0, r27, r28
/* 0D99FC 800DEF9C 7FDE0378 */  or		r30, r30, r0
/* 0D9A00 800DEFA0 3BFF0008 */  addi	r31, r31, 8
/* 0D9A04 800DEFA4 3BBD0008 */  addi	r29, r29, 8
/* 0D9A08 800DEFA8 4200FF40 */  bdnz	lbl_800DEEE8
/* 0D9A0C 800DEFAC 4800017C */  b		lbl_800DF128
lbl_800DEFB0:
/* 0D9A10 800DEFB0 7C1D2050 */  subf	r0, r29, r4
/* 0D9A14 800DEFB4 7C1D2000 */  cmpw	r29, r4
/* 0D9A18 800DEFB8 7C0903A6 */  mtctr	r0
/* 0D9A1C 800DEFBC 40800024 */  bge		lbl_800DEFE0
lbl_800DEFC0:
/* 0D9A20 800DEFC0 201D0003 */  subfic	r0, r29, 3
/* 0D9A24 800DEFC4 88C70000 */  lbz		r6, 0(r7)
/* 0D9A28 800DEFC8 54001838 */  slwi	r0, r0, 3
/* 0D9A2C 800DEFCC 7CC00030 */  slw		r0, r6, r0
/* 0D9A30 800DEFD0 7FDE0378 */  or		r30, r30, r0
/* 0D9A34 800DEFD4 38E70001 */  addi	r7, r7, 1
/* 0D9A38 800DEFD8 3BBD0001 */  addi	r29, r29, 1
/* 0D9A3C 800DEFDC 4200FFE4 */  bdnz	lbl_800DEFC0
lbl_800DEFE0:
/* 0D9A40 800DEFE0 3CC0CC00 */  lis		r6, 0xcc00
/* 0D9A44 800DEFE4 93C66838 */  stw		r30, 0x6838(r6)
lbl_800DEFE8:
/* 0D9A48 800DEFE8 3804FFFF */  addi	r0, r4, -1
/* 0D9A4C 800DEFEC 3CC0CC00 */  lis		r6, 0xcc00
/* 0D9A50 800DEFF0 54A7103A */  slwi	r7, r5, 2
/* 0D9A54 800DEFF4 39066800 */  addi	r8, r6, 0x6800
/* 0D9A58 800DEFF8 60E60001 */  ori		r6, r7, 1
/* 0D9A5C 800DEFFC 54002036 */  slwi	r0, r0, 4
/* 0D9A60 800DF000 7CC00378 */  or		r0, r6, r0
/* 0D9A64 800DF004 94080034 */  stwu	r0, 0x34(r8)
lbl_800DF008:
/* 0D9A68 800DF008 80080000 */  lwz		r0, 0(r8)
/* 0D9A6C 800DF00C 540007FF */  clrlwi.	r0, r0, 0x1f
/* 0D9A70 800DF010 4082FFF8 */  bne		lbl_800DF008
/* 0D9A74 800DF014 28050000 */  cmplwi	r5, 0
/* 0D9A78 800DF018 40820108 */  bne		lbl_800DF120
/* 0D9A7C 800DF01C 38A00000 */  li		r5, 0
/* 0D9A80 800DF020 3CC0CC00 */  lis		r6, 0xcc00
/* 0D9A84 800DF024 7C052000 */  cmpw	r5, r4
/* 0D9A88 800DF028 80066838 */  lwz		r0, 0x6838(r6)
/* 0D9A8C 800DF02C 408000F4 */  bge		lbl_800DF120
/* 0D9A90 800DF030 2C040008 */  cmpwi	r4, 8
/* 0D9A94 800DF034 38E4FFF8 */  addi	r7, r4, -8
/* 0D9A98 800DF038 408100BC */  ble		lbl_800DF0F4
/* 0D9A9C 800DF03C 38C70007 */  addi	r6, r7, 7
/* 0D9AA0 800DF040 54C6E8FE */  srwi	r6, r6, 3
/* 0D9AA4 800DF044 2C070000 */  cmpwi	r7, 0
/* 0D9AA8 800DF048 7CC903A6 */  mtctr	r6
/* 0D9AAC 800DF04C 408100A8 */  ble		lbl_800DF0F4
lbl_800DF050:
/* 0D9AB0 800DF050 20C50003 */  subfic	r6, r5, 3
/* 0D9AB4 800DF054 54C71838 */  slwi	r7, r6, 3
/* 0D9AB8 800DF058 38C50001 */  addi	r6, r5, 1
/* 0D9ABC 800DF05C 7C083C30 */  srw		r8, r0, r7
/* 0D9AC0 800DF060 20C60003 */  subfic	r6, r6, 3
/* 0D9AC4 800DF064 99030000 */  stb		r8, 0(r3)
/* 0D9AC8 800DF068 54C71838 */  slwi	r7, r6, 3
/* 0D9ACC 800DF06C 38C50002 */  addi	r6, r5, 2
/* 0D9AD0 800DF070 7C0C3C30 */  srw		r12, r0, r7
/* 0D9AD4 800DF074 20C60003 */  subfic	r6, r6, 3
/* 0D9AD8 800DF078 99830001 */  stb		r12, 1(r3)
/* 0D9ADC 800DF07C 54C61838 */  slwi	r6, r6, 3
/* 0D9AE0 800DF080 7C0B3430 */  srw		r11, r0, r6
/* 0D9AE4 800DF084 7CC500D0 */  neg		r6, r5
/* 0D9AE8 800DF088 99630002 */  stb		r11, 2(r3)
/* 0D9AEC 800DF08C 54C71838 */  slwi	r7, r6, 3
/* 0D9AF0 800DF090 38C50004 */  addi	r6, r5, 4
/* 0D9AF4 800DF094 7C0A3C30 */  srw		r10, r0, r7
/* 0D9AF8 800DF098 20C60003 */  subfic	r6, r6, 3
/* 0D9AFC 800DF09C 99430003 */  stb		r10, 3(r3)
/* 0D9B00 800DF0A0 54C71838 */  slwi	r7, r6, 3
/* 0D9B04 800DF0A4 38C50005 */  addi	r6, r5, 5
/* 0D9B08 800DF0A8 7C093C30 */  srw		r9, r0, r7
/* 0D9B0C 800DF0AC 20C60003 */  subfic	r6, r6, 3
/* 0D9B10 800DF0B0 99230004 */  stb		r9, 4(r3)
/* 0D9B14 800DF0B4 54C71838 */  slwi	r7, r6, 3
/* 0D9B18 800DF0B8 7C083C30 */  srw		r8, r0, r7
/* 0D9B1C 800DF0BC 38C50006 */  addi	r6, r5, 6
/* 0D9B20 800DF0C0 99030005 */  stb		r8, 5(r3)
/* 0D9B24 800DF0C4 20E60003 */  subfic	r7, r6, 3
/* 0D9B28 800DF0C8 38C50007 */  addi	r6, r5, 7
/* 0D9B2C 800DF0CC 54E71838 */  slwi	r7, r7, 3
/* 0D9B30 800DF0D0 7C073C30 */  srw		r7, r0, r7
/* 0D9B34 800DF0D4 20C60003 */  subfic	r6, r6, 3
/* 0D9B38 800DF0D8 98E30006 */  stb		r7, 6(r3)
/* 0D9B3C 800DF0DC 54C61838 */  slwi	r6, r6, 3
/* 0D9B40 800DF0E0 7C063430 */  srw		r6, r0, r6
/* 0D9B44 800DF0E4 98C30007 */  stb		r6, 7(r3)
/* 0D9B48 800DF0E8 38630008 */  addi	r3, r3, 8
/* 0D9B4C 800DF0EC 38A50008 */  addi	r5, r5, 8
/* 0D9B50 800DF0F0 4200FF60 */  bdnz	lbl_800DF050
lbl_800DF0F4:
/* 0D9B54 800DF0F4 7CC52050 */  subf	r6, r5, r4
/* 0D9B58 800DF0F8 7C052000 */  cmpw	r5, r4
/* 0D9B5C 800DF0FC 7CC903A6 */  mtctr	r6
/* 0D9B60 800DF100 40800020 */  bge		lbl_800DF120
lbl_800DF104:
/* 0D9B64 800DF104 20850003 */  subfic	r4, r5, 3
/* 0D9B68 800DF108 54841838 */  slwi	r4, r4, 3
/* 0D9B6C 800DF10C 7C042430 */  srw		r4, r0, r4
/* 0D9B70 800DF110 98830000 */  stb		r4, 0(r3)
/* 0D9B74 800DF114 38630001 */  addi	r3, r3, 1
/* 0D9B78 800DF118 38A50001 */  addi	r5, r5, 1
/* 0D9B7C 800DF11C 4200FFE8 */  bdnz	lbl_800DF104
lbl_800DF120:
/* 0D9B80 800DF120 38600001 */  li		r3, 1
/* 0D9B84 800DF124 4800000C */  b		lbl_800DF130
lbl_800DF128:
/* 0D9B88 800DF128 7CE3EA14 */  add		r7, r3, r29
/* 0D9B8C 800DF12C 4BFFFE84 */  b		lbl_800DEFB0
lbl_800DF130:
/* 0D9B90 800DF130 BAC10020 */  lmw		r22, 0x20(r1)
/* 0D9B94 800DF134 38210048 */  addi	r1, r1, 0x48
/* 0D9B98 800DF138 4E800020 */  blr		


.section .sdata, "wa"

.balign 8

/* 00100098 80145838 0001 */
SendCount:
    .byte 0x80


.section .sbss, "wa"

.balign 8

/* 00100828 80145FC8 0004 */
MTRCallback:
    .skip 4

.balign 4

/* 0010082C 80145FCC 0004 */
DBGCallback:
    .skip 4

.balign 4

/* 00100830 80145FD0 0004 */
SendMailData:
    .skip 4

.balign 4

/* 00100834 80145FD4 0004 */
RecvDataLeng:
    .skip 4

.balign 4

/* 00100838 80145FD8 0004 */
pEXIInputFlag:
    .skip 4

.balign 4

/* 0010083C 80145FDC 0001 */
EXIInputFlag:
    .skip 1


