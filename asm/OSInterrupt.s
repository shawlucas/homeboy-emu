# OSInterrupt.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel OSDisableInterrupts
/* 0A51D0 800AA770 7C6000A6 */  mfmsr	r3
/* 0A51D4 800AA774 5464045E */  rlwinm	r4, r3, 0, 0x11, 0xf
/* 0A51D8 800AA778 7C800124 */  mtmsr	r4
glabel __RAS_OSDisableInterrupts_end
/* 0A51DC 800AA77C 54638FFE */  rlwinm	r3, r3, 0x11, 0x1f, 0x1f
/* 0A51E0 800AA780 4E800020 */  blr		

glabel OSEnableInterrupts
/* 0A51E4 800AA784 7C6000A6 */  mfmsr	r3
/* 0A51E8 800AA788 60648000 */  ori		r4, r3, 0x8000
/* 0A51EC 800AA78C 7C800124 */  mtmsr	r4
/* 0A51F0 800AA790 54638FFE */  rlwinm	r3, r3, 0x11, 0x1f, 0x1f
/* 0A51F4 800AA794 4E800020 */  blr		

glabel OSRestoreInterrupts
/* 0A51F8 800AA798 2C030000 */  cmpwi	r3, 0
/* 0A51FC 800AA79C 7C8000A6 */  mfmsr	r4
/* 0A5200 800AA7A0 4182000C */  beq		lbl_800AA7AC
/* 0A5204 800AA7A4 60858000 */  ori		r5, r4, 0x8000
/* 0A5208 800AA7A8 48000008 */  b		lbl_800AA7B0
lbl_800AA7AC:
/* 0A520C 800AA7AC 5485045E */  rlwinm	r5, r4, 0, 0x11, 0xf
lbl_800AA7B0:
/* 0A5210 800AA7B0 7CA00124 */  mtmsr	r5
/* 0A5214 800AA7B4 54838FFE */  rlwinm	r3, r4, 0x11, 0x1f, 0x1f
/* 0A5218 800AA7B8 4E800020 */  blr		

glabel __OSSetInterruptHandler
/* 0A521C 800AA7BC 7C600734 */  extsh	r0, r3
/* 0A5220 800AA7C0 806D9118 */  lwz		r3, InterruptHandlerTable-_SDA_BASE_(r13)
/* 0A5224 800AA7C4 5400103A */  slwi	r0, r0, 2
/* 0A5228 800AA7C8 7CA30214 */  add		r5, r3, r0
/* 0A522C 800AA7CC 80650000 */  lwz		r3, 0(r5)
/* 0A5230 800AA7D0 90850000 */  stw		r4, 0(r5)
/* 0A5234 800AA7D4 4E800020 */  blr		

glabel __OSGetInterruptHandler
/* 0A5238 800AA7D8 7C600734 */  extsh	r0, r3
/* 0A523C 800AA7DC 806D9118 */  lwz		r3, InterruptHandlerTable-_SDA_BASE_(r13)
/* 0A5240 800AA7E0 5400103A */  slwi	r0, r0, 2
/* 0A5244 800AA7E4 7C63002E */  lwzx	r3, r3, r0
/* 0A5248 800AA7E8 4E800020 */  blr		

glabel __OSInterruptInit
/* 0A524C 800AA7EC 7C0802A6 */  mflr	r0
/* 0A5250 800AA7F0 90010004 */  stw		r0, 4(r1)
/* 0A5254 800AA7F4 9421FFF0 */  stwu	r1, -0x10(r1)
/* 0A5258 800AA7F8 93E1000C */  stw		r31, 0xc(r1)
/* 0A525C 800AA7FC 3FE08000 */  lis		r31, 0x8000
/* 0A5260 800AA800 381F3040 */  addi	r0, r31, 0x3040
/* 0A5264 800AA804 900D9118 */  stw		r0, InterruptHandlerTable-_SDA_BASE_(r13)
/* 0A5268 800AA808 38800000 */  li		r4, 0
/* 0A526C 800AA80C 38A00080 */  li		r5, 0x80
/* 0A5270 800AA810 806D9118 */  lwz		r3, InterruptHandlerTable-_SDA_BASE_(r13)
/* 0A5274 800AA814 4BF5ABBD */  bl		memset
/* 0A5278 800AA818 38000000 */  li		r0, 0
/* 0A527C 800AA81C 901F00C4 */  stw		r0, 0xc4(r31)
/* 0A5280 800AA820 3C60CC00 */  lis		r3, 0xcc00
/* 0A5284 800AA824 38833000 */  addi	r4, r3, 0x3000
/* 0A5288 800AA828 901F00C8 */  stw		r0, 0xc8(r31)
/* 0A528C 800AA82C 380000F0 */  li		r0, 0xf0
/* 0A5290 800AA830 3860FFE0 */  li		r3, -32
/* 0A5294 800AA834 90040004 */  stw		r0, 4(r4)
/* 0A5298 800AA838 48000301 */  bl		__OSMaskInterrupts
/* 0A529C 800AA83C 3C60800B */  lis		r3, ExternalInterruptHandler@ha
/* 0A52A0 800AA840 3883AF8C */  addi	r4, r3, ExternalInterruptHandler@l
/* 0A52A4 800AA844 38600004 */  li		r3, 4
/* 0A52A8 800AA848 4BFFD731 */  bl		__OSSetExceptionHandler
/* 0A52AC 800AA84C 80010014 */  lwz		r0, 0x14(r1)
/* 0A52B0 800AA850 83E1000C */  lwz		r31, 0xc(r1)
/* 0A52B4 800AA854 38210010 */  addi	r1, r1, 0x10
/* 0A52B8 800AA858 7C0803A6 */  mtlr	r0
/* 0A52BC 800AA85C 4E800020 */  blr		

SetInterruptMask:
/* 0A52C0 800AA860 7C600034 */  cntlzw	r0, r3
/* 0A52C4 800AA864 2C00000C */  cmpwi	r0, 0xc
/* 0A52C8 800AA868 40800024 */  bge		lbl_800AA88C
/* 0A52CC 800AA86C 2C000008 */  cmpwi	r0, 8
/* 0A52D0 800AA870 418200FC */  beq		lbl_800AA96C
/* 0A52D4 800AA874 40800128 */  bge		lbl_800AA99C
/* 0A52D8 800AA878 2C000005 */  cmpwi	r0, 5
/* 0A52DC 800AA87C 4080009C */  bge		lbl_800AA918
/* 0A52E0 800AA880 2C000000 */  cmpwi	r0, 0
/* 0A52E4 800AA884 40800028 */  bge		lbl_800AA8AC
/* 0A52E8 800AA888 480002AC */  b		lbl_800AAB34
lbl_800AA88C:
/* 0A52EC 800AA88C 2C000011 */  cmpwi	r0, 0x11
/* 0A52F0 800AA890 40800010 */  bge		lbl_800AA8A0
/* 0A52F4 800AA894 2C00000F */  cmpwi	r0, 0xf
/* 0A52F8 800AA898 408001A8 */  bge		lbl_800AAA40
/* 0A52FC 800AA89C 48000150 */  b		lbl_800AA9EC
lbl_800AA8A0:
/* 0A5300 800AA8A0 2C00001B */  cmpwi	r0, 0x1b
/* 0A5304 800AA8A4 40800290 */  bge		lbl_800AAB34
/* 0A5308 800AA8A8 480001D8 */  b		lbl_800AAA80
lbl_800AA8AC:
/* 0A530C 800AA8AC 54800000 */  rlwinm	r0, r4, 0, 0, 0
/* 0A5310 800AA8B0 28000000 */  cmplwi	r0, 0
/* 0A5314 800AA8B4 38A00000 */  li		r5, 0
/* 0A5318 800AA8B8 40820008 */  bne		lbl_800AA8C0
/* 0A531C 800AA8BC 60A50001 */  ori		r5, r5, 1
lbl_800AA8C0:
/* 0A5320 800AA8C0 54800042 */  rlwinm	r0, r4, 0, 1, 1
/* 0A5324 800AA8C4 28000000 */  cmplwi	r0, 0
/* 0A5328 800AA8C8 40820008 */  bne		lbl_800AA8D0
/* 0A532C 800AA8CC 60A50002 */  ori		r5, r5, 2
lbl_800AA8D0:
/* 0A5330 800AA8D0 54800084 */  rlwinm	r0, r4, 0, 2, 2
/* 0A5334 800AA8D4 28000000 */  cmplwi	r0, 0
/* 0A5338 800AA8D8 40820008 */  bne		lbl_800AA8E0
/* 0A533C 800AA8DC 60A50004 */  ori		r5, r5, 4
lbl_800AA8E0:
/* 0A5340 800AA8E0 548000C6 */  rlwinm	r0, r4, 0, 3, 3
/* 0A5344 800AA8E4 28000000 */  cmplwi	r0, 0
/* 0A5348 800AA8E8 40820008 */  bne		lbl_800AA8F0
/* 0A534C 800AA8EC 60A50008 */  ori		r5, r5, 8
lbl_800AA8F0:
/* 0A5350 800AA8F0 54800108 */  rlwinm	r0, r4, 0, 4, 4
/* 0A5354 800AA8F4 28000000 */  cmplwi	r0, 0
/* 0A5358 800AA8F8 40820008 */  bne		lbl_800AA900
/* 0A535C 800AA8FC 60A50010 */  ori		r5, r5, 0x10
lbl_800AA900:
/* 0A5360 800AA900 3C80CC00 */  lis		r4, 0xcc00
/* 0A5364 800AA904 54A0043E */  clrlwi	r0, r5, 0x10
/* 0A5368 800AA908 38844000 */  addi	r4, r4, 0x4000
/* 0A536C 800AA90C B004001C */  sth		r0, 0x1c(r4)
/* 0A5370 800AA910 5463017E */  clrlwi	r3, r3, 5
/* 0A5374 800AA914 48000220 */  b		lbl_800AAB34
lbl_800AA918:
/* 0A5378 800AA918 3CA0CC00 */  lis		r5, 0xcc00
/* 0A537C 800AA91C 38A55000 */  addi	r5, r5, 0x5000
/* 0A5380 800AA920 38A5000A */  addi	r5, r5, 0xa
/* 0A5384 800AA924 5480014A */  rlwinm	r0, r4, 0, 5, 5
/* 0A5388 800AA928 A0C50000 */  lhz		r6, 0(r5)
/* 0A538C 800AA92C 28000000 */  cmplwi	r0, 0
/* 0A5390 800AA930 54C6076C */  rlwinm	r6, r6, 0, 0x1d, 0x16
/* 0A5394 800AA934 40820008 */  bne		lbl_800AA93C
/* 0A5398 800AA938 60C60010 */  ori		r6, r6, 0x10
lbl_800AA93C:
/* 0A539C 800AA93C 5480018C */  rlwinm	r0, r4, 0, 6, 6
/* 0A53A0 800AA940 28000000 */  cmplwi	r0, 0
/* 0A53A4 800AA944 40820008 */  bne		lbl_800AA94C
/* 0A53A8 800AA948 60C60040 */  ori		r6, r6, 0x40
lbl_800AA94C:
/* 0A53AC 800AA94C 548001CE */  rlwinm	r0, r4, 0, 7, 7
/* 0A53B0 800AA950 28000000 */  cmplwi	r0, 0
/* 0A53B4 800AA954 40820008 */  bne		lbl_800AA95C
/* 0A53B8 800AA958 60C60100 */  ori		r6, r6, 0x100
lbl_800AA95C:
/* 0A53BC 800AA95C 54C0043E */  clrlwi	r0, r6, 0x10
/* 0A53C0 800AA960 B0050000 */  sth		r0, 0(r5)
/* 0A53C4 800AA964 54630208 */  rlwinm	r3, r3, 0, 8, 4
/* 0A53C8 800AA968 480001CC */  b		lbl_800AAB34
lbl_800AA96C:
/* 0A53CC 800AA96C 54800210 */  rlwinm	r0, r4, 0, 8, 8
/* 0A53D0 800AA970 3C80CC00 */  lis		r4, 0xcc00
/* 0A53D4 800AA974 28000000 */  cmplwi	r0, 0
/* 0A53D8 800AA978 80A46C00 */  lwz		r5, 0x6c00(r4)
/* 0A53DC 800AA97C 3800FFD3 */  li		r0, -45
/* 0A53E0 800AA980 7CA50038 */  and		r5, r5, r0
/* 0A53E4 800AA984 40820008 */  bne		lbl_800AA98C
/* 0A53E8 800AA988 60A50004 */  ori		r5, r5, 4
lbl_800AA98C:
/* 0A53EC 800AA98C 3C80CC00 */  lis		r4, 0xcc00
/* 0A53F0 800AA990 90A46C00 */  stw		r5, 0x6c00(r4)
/* 0A53F4 800AA994 5463024E */  rlwinm	r3, r3, 0, 9, 7
/* 0A53F8 800AA998 4800019C */  b		lbl_800AAB34
lbl_800AA99C:
/* 0A53FC 800AA99C 54800252 */  rlwinm	r0, r4, 0, 9, 9
/* 0A5400 800AA9A0 3CA0CC00 */  lis		r5, 0xcc00
/* 0A5404 800AA9A4 28000000 */  cmplwi	r0, 0
/* 0A5408 800AA9A8 80A56800 */  lwz		r5, 0x6800(r5)
/* 0A540C 800AA9AC 3800D3F0 */  li		r0, -11280
/* 0A5410 800AA9B0 7CA50038 */  and		r5, r5, r0
/* 0A5414 800AA9B4 40820008 */  bne		lbl_800AA9BC
/* 0A5418 800AA9B8 60A50001 */  ori		r5, r5, 1
lbl_800AA9BC:
/* 0A541C 800AA9BC 54800294 */  rlwinm	r0, r4, 0, 0xa, 0xa
/* 0A5420 800AA9C0 28000000 */  cmplwi	r0, 0
/* 0A5424 800AA9C4 40820008 */  bne		lbl_800AA9CC
/* 0A5428 800AA9C8 60A50004 */  ori		r5, r5, 4
lbl_800AA9CC:
/* 0A542C 800AA9CC 548002D6 */  rlwinm	r0, r4, 0, 0xb, 0xb
/* 0A5430 800AA9D0 28000000 */  cmplwi	r0, 0
/* 0A5434 800AA9D4 40820008 */  bne		lbl_800AA9DC
/* 0A5438 800AA9D8 60A50400 */  ori		r5, r5, 0x400
lbl_800AA9DC:
/* 0A543C 800AA9DC 3C80CC00 */  lis		r4, 0xcc00
/* 0A5440 800AA9E0 90A46800 */  stw		r5, 0x6800(r4)
/* 0A5444 800AA9E4 54630310 */  rlwinm	r3, r3, 0, 0xc, 8
/* 0A5448 800AA9E8 4800014C */  b		lbl_800AAB34
lbl_800AA9EC:
/* 0A544C 800AA9EC 3CA0CC00 */  lis		r5, 0xcc00
/* 0A5450 800AA9F0 38C56800 */  addi	r6, r5, 0x6800
/* 0A5454 800AA9F4 38C60014 */  addi	r6, r6, 0x14
/* 0A5458 800AA9F8 54800318 */  rlwinm	r0, r4, 0, 0xc, 0xc
/* 0A545C 800AA9FC 80E60000 */  lwz		r7, 0(r6)
/* 0A5460 800AAA00 38A0F3F0 */  li		r5, -3088
/* 0A5464 800AAA04 28000000 */  cmplwi	r0, 0
/* 0A5468 800AAA08 7CE72838 */  and		r7, r7, r5
/* 0A546C 800AAA0C 40820008 */  bne		lbl_800AAA14
/* 0A5470 800AAA10 60E70001 */  ori		r7, r7, 1
lbl_800AAA14:
/* 0A5474 800AAA14 5480035A */  rlwinm	r0, r4, 0, 0xd, 0xd
/* 0A5478 800AAA18 28000000 */  cmplwi	r0, 0
/* 0A547C 800AAA1C 40820008 */  bne		lbl_800AAA24
/* 0A5480 800AAA20 60E70004 */  ori		r7, r7, 4
lbl_800AAA24:
/* 0A5484 800AAA24 5480039C */  rlwinm	r0, r4, 0, 0xe, 0xe
/* 0A5488 800AAA28 28000000 */  cmplwi	r0, 0
/* 0A548C 800AAA2C 40820008 */  bne		lbl_800AAA34
/* 0A5490 800AAA30 60E70400 */  ori		r7, r7, 0x400
lbl_800AAA34:
/* 0A5494 800AAA34 90E60000 */  stw		r7, 0(r6)
/* 0A5498 800AAA38 546303D6 */  rlwinm	r3, r3, 0, 0xf, 0xb
/* 0A549C 800AAA3C 480000F8 */  b		lbl_800AAB34
lbl_800AAA40:
/* 0A54A0 800AAA40 3CA0CC00 */  lis		r5, 0xcc00
/* 0A54A4 800AAA44 38A56800 */  addi	r5, r5, 0x6800
/* 0A54A8 800AAA48 38A50028 */  addi	r5, r5, 0x28
/* 0A54AC 800AAA4C 548003DE */  rlwinm	r0, r4, 0, 0xf, 0xf
/* 0A54B0 800AAA50 80C50000 */  lwz		r6, 0(r5)
/* 0A54B4 800AAA54 28000000 */  cmplwi	r0, 0
/* 0A54B8 800AAA58 54C60036 */  rlwinm	r6, r6, 0, 0, 0x1b
/* 0A54BC 800AAA5C 40820008 */  bne		lbl_800AAA64
/* 0A54C0 800AAA60 60C60001 */  ori		r6, r6, 1
lbl_800AAA64:
/* 0A54C4 800AAA64 54800420 */  rlwinm	r0, r4, 0, 0x10, 0x10
/* 0A54C8 800AAA68 28000000 */  cmplwi	r0, 0
/* 0A54CC 800AAA6C 40820008 */  bne		lbl_800AAA74
/* 0A54D0 800AAA70 60C60004 */  ori		r6, r6, 4
lbl_800AAA74:
/* 0A54D4 800AAA74 90C50000 */  stw		r6, 0(r5)
/* 0A54D8 800AAA78 5463045C */  rlwinm	r3, r3, 0, 0x11, 0xe
/* 0A54DC 800AAA7C 480000B8 */  b		lbl_800AAB34
lbl_800AAA80:
/* 0A54E0 800AAA80 54800462 */  rlwinm	r0, r4, 0, 0x11, 0x11
/* 0A54E4 800AAA84 28000000 */  cmplwi	r0, 0
/* 0A54E8 800AAA88 38A000F0 */  li		r5, 0xf0
/* 0A54EC 800AAA8C 40820008 */  bne		lbl_800AAA94
/* 0A54F0 800AAA90 60A50800 */  ori		r5, r5, 0x800
lbl_800AAA94:
/* 0A54F4 800AAA94 54800528 */  rlwinm	r0, r4, 0, 0x14, 0x14
/* 0A54F8 800AAA98 28000000 */  cmplwi	r0, 0
/* 0A54FC 800AAA9C 40820008 */  bne		lbl_800AAAA4
/* 0A5500 800AAAA0 60A50008 */  ori		r5, r5, 8
lbl_800AAAA4:
/* 0A5504 800AAAA4 5480056A */  rlwinm	r0, r4, 0, 0x15, 0x15
/* 0A5508 800AAAA8 28000000 */  cmplwi	r0, 0
/* 0A550C 800AAAAC 40820008 */  bne		lbl_800AAAB4
/* 0A5510 800AAAB0 60A50004 */  ori		r5, r5, 4
lbl_800AAAB4:
/* 0A5514 800AAAB4 548005AC */  rlwinm	r0, r4, 0, 0x16, 0x16
/* 0A5518 800AAAB8 28000000 */  cmplwi	r0, 0
/* 0A551C 800AAABC 40820008 */  bne		lbl_800AAAC4
/* 0A5520 800AAAC0 60A50002 */  ori		r5, r5, 2
lbl_800AAAC4:
/* 0A5524 800AAAC4 548005EE */  rlwinm	r0, r4, 0, 0x17, 0x17
/* 0A5528 800AAAC8 28000000 */  cmplwi	r0, 0
/* 0A552C 800AAACC 40820008 */  bne		lbl_800AAAD4
/* 0A5530 800AAAD0 60A50001 */  ori		r5, r5, 1
lbl_800AAAD4:
/* 0A5534 800AAAD4 54800630 */  rlwinm	r0, r4, 0, 0x18, 0x18
/* 0A5538 800AAAD8 28000000 */  cmplwi	r0, 0
/* 0A553C 800AAADC 40820008 */  bne		lbl_800AAAE4
/* 0A5540 800AAAE0 60A50100 */  ori		r5, r5, 0x100
lbl_800AAAE4:
/* 0A5544 800AAAE4 54800672 */  rlwinm	r0, r4, 0, 0x19, 0x19
/* 0A5548 800AAAE8 28000000 */  cmplwi	r0, 0
/* 0A554C 800AAAEC 40820008 */  bne		lbl_800AAAF4
/* 0A5550 800AAAF0 60A51000 */  ori		r5, r5, 0x1000
lbl_800AAAF4:
/* 0A5554 800AAAF4 548004A4 */  rlwinm	r0, r4, 0, 0x12, 0x12
/* 0A5558 800AAAF8 28000000 */  cmplwi	r0, 0
/* 0A555C 800AAAFC 40820008 */  bne		lbl_800AAB04
/* 0A5560 800AAB00 60A50200 */  ori		r5, r5, 0x200
lbl_800AAB04:
/* 0A5564 800AAB04 548004E6 */  rlwinm	r0, r4, 0, 0x13, 0x13
/* 0A5568 800AAB08 28000000 */  cmplwi	r0, 0
/* 0A556C 800AAB0C 40820008 */  bne		lbl_800AAB14
/* 0A5570 800AAB10 60A50400 */  ori		r5, r5, 0x400
lbl_800AAB14:
/* 0A5574 800AAB14 548006B4 */  rlwinm	r0, r4, 0, 0x1a, 0x1a
/* 0A5578 800AAB18 28000000 */  cmplwi	r0, 0
/* 0A557C 800AAB1C 40820008 */  bne		lbl_800AAB24
/* 0A5580 800AAB20 60A52000 */  ori		r5, r5, 0x2000
lbl_800AAB24:
/* 0A5584 800AAB24 3C80CC00 */  lis		r4, 0xcc00
/* 0A5588 800AAB28 38843000 */  addi	r4, r4, 0x3000
/* 0A558C 800AAB2C 90A40004 */  stw		r5, 4(r4)
/* 0A5590 800AAB30 546306E0 */  rlwinm	r3, r3, 0, 0x1b, 0x10
lbl_800AAB34:
/* 0A5594 800AAB34 4E800020 */  blr		

glabel __OSMaskInterrupts
/* 0A5598 800AAB38 7C0802A6 */  mflr	r0
/* 0A559C 800AAB3C 90010004 */  stw		r0, 4(r1)
/* 0A55A0 800AAB40 9421FFE0 */  stwu	r1, -0x20(r1)
/* 0A55A4 800AAB44 93E1001C */  stw		r31, 0x1c(r1)
/* 0A55A8 800AAB48 93C10018 */  stw		r30, 0x18(r1)
/* 0A55AC 800AAB4C 93A10014 */  stw		r29, 0x14(r1)
/* 0A55B0 800AAB50 7C7F1B78 */  mr		r31, r3
/* 0A55B4 800AAB54 4BFFFC1D */  bl		OSDisableInterrupts
/* 0A55B8 800AAB58 3C808000 */  lis		r4, 0x8000
/* 0A55BC 800AAB5C 83A400C4 */  lwz		r29, 0xc4(r4)
/* 0A55C0 800AAB60 7C7E1B78 */  mr		r30, r3
/* 0A55C4 800AAB64 80A400C8 */  lwz		r5, 0xc8(r4)
/* 0A55C8 800AAB68 7FA02B78 */  or		r0, r29, r5
/* 0A55CC 800AAB6C 7FE30078 */  andc	r3, r31, r0
/* 0A55D0 800AAB70 7FFFEB78 */  or		r31, r31, r29
/* 0A55D4 800AAB74 93E400C4 */  stw		r31, 0xc4(r4)
/* 0A55D8 800AAB78 7FFF2B78 */  or		r31, r31, r5
/* 0A55DC 800AAB7C 48000004 */  b		lbl_800AAB80
lbl_800AAB80:
/* 0A55E0 800AAB80 48000004 */  b		lbl_800AAB84
lbl_800AAB84:
/* 0A55E4 800AAB84 4800000C */  b		lbl_800AAB90
lbl_800AAB88:
/* 0A55E8 800AAB88 7FE4FB78 */  mr		r4, r31
/* 0A55EC 800AAB8C 4BFFFCD5 */  bl		SetInterruptMask
lbl_800AAB90:
/* 0A55F0 800AAB90 28030000 */  cmplwi	r3, 0
/* 0A55F4 800AAB94 4082FFF4 */  bne		lbl_800AAB88
/* 0A55F8 800AAB98 7FC3F378 */  mr		r3, r30
/* 0A55FC 800AAB9C 4BFFFBFD */  bl		OSRestoreInterrupts
/* 0A5600 800AABA0 7FA3EB78 */  mr		r3, r29
/* 0A5604 800AABA4 80010024 */  lwz		r0, 0x24(r1)
/* 0A5608 800AABA8 83E1001C */  lwz		r31, 0x1c(r1)
/* 0A560C 800AABAC 83C10018 */  lwz		r30, 0x18(r1)
/* 0A5610 800AABB0 83A10014 */  lwz		r29, 0x14(r1)
/* 0A5614 800AABB4 38210020 */  addi	r1, r1, 0x20
/* 0A5618 800AABB8 7C0803A6 */  mtlr	r0
/* 0A561C 800AABBC 4E800020 */  blr		

glabel __OSUnmaskInterrupts
/* 0A5620 800AABC0 7C0802A6 */  mflr	r0
/* 0A5624 800AABC4 90010004 */  stw		r0, 4(r1)
/* 0A5628 800AABC8 9421FFE0 */  stwu	r1, -0x20(r1)
/* 0A562C 800AABCC 93E1001C */  stw		r31, 0x1c(r1)
/* 0A5630 800AABD0 93C10018 */  stw		r30, 0x18(r1)
/* 0A5634 800AABD4 93A10014 */  stw		r29, 0x14(r1)
/* 0A5638 800AABD8 7C7F1B78 */  mr		r31, r3
/* 0A563C 800AABDC 4BFFFB95 */  bl		OSDisableInterrupts
/* 0A5640 800AABE0 3C808000 */  lis		r4, 0x8000
/* 0A5644 800AABE4 83A400C4 */  lwz		r29, 0xc4(r4)
/* 0A5648 800AABE8 7C7E1B78 */  mr		r30, r3
/* 0A564C 800AABEC 80A400C8 */  lwz		r5, 0xc8(r4)
/* 0A5650 800AABF0 7FA02B78 */  or		r0, r29, r5
/* 0A5654 800AABF4 7FE30038 */  and		r3, r31, r0
/* 0A5658 800AABF8 7FBFF878 */  andc	r31, r29, r31
/* 0A565C 800AABFC 93E400C4 */  stw		r31, 0xc4(r4)
/* 0A5660 800AAC00 7FFF2B78 */  or		r31, r31, r5
/* 0A5664 800AAC04 48000004 */  b		lbl_800AAC08
lbl_800AAC08:
/* 0A5668 800AAC08 48000004 */  b		lbl_800AAC0C
lbl_800AAC0C:
/* 0A566C 800AAC0C 4800000C */  b		lbl_800AAC18
lbl_800AAC10:
/* 0A5670 800AAC10 7FE4FB78 */  mr		r4, r31
/* 0A5674 800AAC14 4BFFFC4D */  bl		SetInterruptMask
lbl_800AAC18:
/* 0A5678 800AAC18 28030000 */  cmplwi	r3, 0
/* 0A567C 800AAC1C 4082FFF4 */  bne		lbl_800AAC10
/* 0A5680 800AAC20 7FC3F378 */  mr		r3, r30
/* 0A5684 800AAC24 4BFFFB75 */  bl		OSRestoreInterrupts
/* 0A5688 800AAC28 7FA3EB78 */  mr		r3, r29
/* 0A568C 800AAC2C 80010024 */  lwz		r0, 0x24(r1)
/* 0A5690 800AAC30 83E1001C */  lwz		r31, 0x1c(r1)
/* 0A5694 800AAC34 83C10018 */  lwz		r30, 0x18(r1)
/* 0A5698 800AAC38 83A10014 */  lwz		r29, 0x14(r1)
/* 0A569C 800AAC3C 38210020 */  addi	r1, r1, 0x20
/* 0A56A0 800AAC40 7C0803A6 */  mtlr	r0
/* 0A56A4 800AAC44 4E800020 */  blr		

glabel __OSDispatchInterrupt
/* 0A56A8 800AAC48 7C0802A6 */  mflr	r0
/* 0A56AC 800AAC4C 90010004 */  stw		r0, 4(r1)
/* 0A56B0 800AAC50 9421FFD8 */  stwu	r1, -0x28(r1)
/* 0A56B4 800AAC54 93E10024 */  stw		r31, 0x24(r1)
/* 0A56B8 800AAC58 93C10020 */  stw		r30, 0x20(r1)
/* 0A56BC 800AAC5C 93A1001C */  stw		r29, 0x1c(r1)
/* 0A56C0 800AAC60 7C9E2378 */  mr		r30, r4
/* 0A56C4 800AAC64 3C60CC00 */  lis		r3, 0xcc00
/* 0A56C8 800AAC68 83E33000 */  lwz		r31, 0x3000(r3)
/* 0A56CC 800AAC6C 57FF041C */  rlwinm	r31, r31, 0, 0x10, 0xe
/* 0A56D0 800AAC70 281F0000 */  cmplwi	r31, 0
/* 0A56D4 800AAC74 41820018 */  beq		lbl_800AAC8C
/* 0A56D8 800AAC78 38633000 */  addi	r3, r3, 0x3000
/* 0A56DC 800AAC7C 80030004 */  lwz		r0, 4(r3)
/* 0A56E0 800AAC80 7FE00038 */  and		r0, r31, r0
/* 0A56E4 800AAC84 28000000 */  cmplwi	r0, 0
/* 0A56E8 800AAC88 4082000C */  bne		lbl_800AAC94
lbl_800AAC8C:
/* 0A56EC 800AAC8C 7FC3F378 */  mr		r3, r30
/* 0A56F0 800AAC90 4BFFEEA9 */  bl		OSLoadContext
lbl_800AAC94:
/* 0A56F4 800AAC94 57E00630 */  rlwinm	r0, r31, 0, 0x18, 0x18
/* 0A56F8 800AAC98 28000000 */  cmplwi	r0, 0
/* 0A56FC 800AAC9C 38000000 */  li		r0, 0
/* 0A5700 800AACA0 41820060 */  beq		lbl_800AAD00
/* 0A5704 800AACA4 3C60CC00 */  lis		r3, 0xcc00
/* 0A5708 800AACA8 38634000 */  addi	r3, r3, 0x4000
/* 0A570C 800AACAC A083001E */  lhz		r4, 0x1e(r3)
/* 0A5710 800AACB0 548307FE */  clrlwi	r3, r4, 0x1f
/* 0A5714 800AACB4 28030000 */  cmplwi	r3, 0
/* 0A5718 800AACB8 41820008 */  beq		lbl_800AACC0
/* 0A571C 800AACBC 64008000 */  oris	r0, r0, 0x8000
lbl_800AACC0:
/* 0A5720 800AACC0 548307BC */  rlwinm	r3, r4, 0, 0x1e, 0x1e
/* 0A5724 800AACC4 28030000 */  cmplwi	r3, 0
/* 0A5728 800AACC8 41820008 */  beq		lbl_800AACD0
/* 0A572C 800AACCC 64004000 */  oris	r0, r0, 0x4000
lbl_800AACD0:
/* 0A5730 800AACD0 5483077A */  rlwinm	r3, r4, 0, 0x1d, 0x1d
/* 0A5734 800AACD4 28030000 */  cmplwi	r3, 0
/* 0A5738 800AACD8 41820008 */  beq		lbl_800AACE0
/* 0A573C 800AACDC 64002000 */  oris	r0, r0, 0x2000
lbl_800AACE0:
/* 0A5740 800AACE0 54830738 */  rlwinm	r3, r4, 0, 0x1c, 0x1c
/* 0A5744 800AACE4 28030000 */  cmplwi	r3, 0
/* 0A5748 800AACE8 41820008 */  beq		lbl_800AACF0
/* 0A574C 800AACEC 64001000 */  oris	r0, r0, 0x1000
lbl_800AACF0:
/* 0A5750 800AACF0 548306F6 */  rlwinm	r3, r4, 0, 0x1b, 0x1b
/* 0A5754 800AACF4 28030000 */  cmplwi	r3, 0
/* 0A5758 800AACF8 41820008 */  beq		lbl_800AAD00
/* 0A575C 800AACFC 64000800 */  oris	r0, r0, 0x800
lbl_800AAD00:
/* 0A5760 800AAD00 57E30672 */  rlwinm	r3, r31, 0, 0x19, 0x19
/* 0A5764 800AAD04 28030000 */  cmplwi	r3, 0
/* 0A5768 800AAD08 41820040 */  beq		lbl_800AAD48
/* 0A576C 800AAD0C 3C60CC00 */  lis		r3, 0xcc00
/* 0A5770 800AAD10 38635000 */  addi	r3, r3, 0x5000
/* 0A5774 800AAD14 A083000A */  lhz		r4, 0xa(r3)
/* 0A5778 800AAD18 54830738 */  rlwinm	r3, r4, 0, 0x1c, 0x1c
/* 0A577C 800AAD1C 28030000 */  cmplwi	r3, 0
/* 0A5780 800AAD20 41820008 */  beq		lbl_800AAD28
/* 0A5784 800AAD24 64000400 */  oris	r0, r0, 0x400
lbl_800AAD28:
/* 0A5788 800AAD28 548306B4 */  rlwinm	r3, r4, 0, 0x1a, 0x1a
/* 0A578C 800AAD2C 28030000 */  cmplwi	r3, 0
/* 0A5790 800AAD30 41820008 */  beq		lbl_800AAD38
/* 0A5794 800AAD34 64000200 */  oris	r0, r0, 0x200
lbl_800AAD38:
/* 0A5798 800AAD38 54830630 */  rlwinm	r3, r4, 0, 0x18, 0x18
/* 0A579C 800AAD3C 28030000 */  cmplwi	r3, 0
/* 0A57A0 800AAD40 41820008 */  beq		lbl_800AAD48
/* 0A57A4 800AAD44 64000100 */  oris	r0, r0, 0x100
lbl_800AAD48:
/* 0A57A8 800AAD48 57E306B4 */  rlwinm	r3, r31, 0, 0x1a, 0x1a
/* 0A57AC 800AAD4C 28030000 */  cmplwi	r3, 0
/* 0A57B0 800AAD50 4182001C */  beq		lbl_800AAD6C
/* 0A57B4 800AAD54 3C60CC00 */  lis		r3, 0xcc00
/* 0A57B8 800AAD58 80636C00 */  lwz		r3, 0x6c00(r3)
/* 0A57BC 800AAD5C 54630738 */  rlwinm	r3, r3, 0, 0x1c, 0x1c
/* 0A57C0 800AAD60 28030000 */  cmplwi	r3, 0
/* 0A57C4 800AAD64 41820008 */  beq		lbl_800AAD6C
/* 0A57C8 800AAD68 64000080 */  oris	r0, r0, 0x80
lbl_800AAD6C:
/* 0A57CC 800AAD6C 57E306F6 */  rlwinm	r3, r31, 0, 0x1b, 0x1b
/* 0A57D0 800AAD70 28030000 */  cmplwi	r3, 0
/* 0A57D4 800AAD74 418200A4 */  beq		lbl_800AAE18
/* 0A57D8 800AAD78 3C60CC00 */  lis		r3, 0xcc00
/* 0A57DC 800AAD7C 80836800 */  lwz		r4, 0x6800(r3)
/* 0A57E0 800AAD80 548307BC */  rlwinm	r3, r4, 0, 0x1e, 0x1e
/* 0A57E4 800AAD84 28030000 */  cmplwi	r3, 0
/* 0A57E8 800AAD88 41820008 */  beq		lbl_800AAD90
/* 0A57EC 800AAD8C 64000040 */  oris	r0, r0, 0x40
lbl_800AAD90:
/* 0A57F0 800AAD90 54830738 */  rlwinm	r3, r4, 0, 0x1c, 0x1c
/* 0A57F4 800AAD94 28030000 */  cmplwi	r3, 0
/* 0A57F8 800AAD98 41820008 */  beq		lbl_800AADA0
/* 0A57FC 800AAD9C 64000020 */  oris	r0, r0, 0x20
lbl_800AADA0:
/* 0A5800 800AADA0 54830528 */  rlwinm	r3, r4, 0, 0x14, 0x14
/* 0A5804 800AADA4 28030000 */  cmplwi	r3, 0
/* 0A5808 800AADA8 41820008 */  beq		lbl_800AADB0
/* 0A580C 800AADAC 64000010 */  oris	r0, r0, 0x10
lbl_800AADB0:
/* 0A5810 800AADB0 3C60CC00 */  lis		r3, 0xcc00
/* 0A5814 800AADB4 38636800 */  addi	r3, r3, 0x6800
/* 0A5818 800AADB8 80830014 */  lwz		r4, 0x14(r3)
/* 0A581C 800AADBC 548307BC */  rlwinm	r3, r4, 0, 0x1e, 0x1e
/* 0A5820 800AADC0 28030000 */  cmplwi	r3, 0
/* 0A5824 800AADC4 41820008 */  beq		lbl_800AADCC
/* 0A5828 800AADC8 64000008 */  oris	r0, r0, 8
lbl_800AADCC:
/* 0A582C 800AADCC 54830738 */  rlwinm	r3, r4, 0, 0x1c, 0x1c
/* 0A5830 800AADD0 28030000 */  cmplwi	r3, 0
/* 0A5834 800AADD4 41820008 */  beq		lbl_800AADDC
/* 0A5838 800AADD8 64000004 */  oris	r0, r0, 4
lbl_800AADDC:
/* 0A583C 800AADDC 54830528 */  rlwinm	r3, r4, 0, 0x14, 0x14
/* 0A5840 800AADE0 28030000 */  cmplwi	r3, 0
/* 0A5844 800AADE4 41820008 */  beq		lbl_800AADEC
/* 0A5848 800AADE8 64000002 */  oris	r0, r0, 2
lbl_800AADEC:
/* 0A584C 800AADEC 3C60CC00 */  lis		r3, 0xcc00
/* 0A5850 800AADF0 38636800 */  addi	r3, r3, 0x6800
/* 0A5854 800AADF4 80830028 */  lwz		r4, 0x28(r3)
/* 0A5858 800AADF8 548307BC */  rlwinm	r3, r4, 0, 0x1e, 0x1e
/* 0A585C 800AADFC 28030000 */  cmplwi	r3, 0
/* 0A5860 800AAE00 41820008 */  beq		lbl_800AAE08
/* 0A5864 800AAE04 64000001 */  oris	r0, r0, 1
lbl_800AAE08:
/* 0A5868 800AAE08 54830738 */  rlwinm	r3, r4, 0, 0x1c, 0x1c
/* 0A586C 800AAE0C 28030000 */  cmplwi	r3, 0
/* 0A5870 800AAE10 41820008 */  beq		lbl_800AAE18
/* 0A5874 800AAE14 60008000 */  ori		r0, r0, 0x8000
lbl_800AAE18:
/* 0A5878 800AAE18 57E304A4 */  rlwinm	r3, r31, 0, 0x12, 0x12
/* 0A587C 800AAE1C 28030000 */  cmplwi	r3, 0
/* 0A5880 800AAE20 41820008 */  beq		lbl_800AAE28
/* 0A5884 800AAE24 60000020 */  ori		r0, r0, 0x20
lbl_800AAE28:
/* 0A5888 800AAE28 57E304E6 */  rlwinm	r3, r31, 0, 0x13, 0x13
/* 0A588C 800AAE2C 28030000 */  cmplwi	r3, 0
/* 0A5890 800AAE30 41820008 */  beq		lbl_800AAE38
/* 0A5894 800AAE34 60000040 */  ori		r0, r0, 0x40
lbl_800AAE38:
/* 0A5898 800AAE38 57E3056A */  rlwinm	r3, r31, 0, 0x15, 0x15
/* 0A589C 800AAE3C 28030000 */  cmplwi	r3, 0
/* 0A58A0 800AAE40 41820008 */  beq		lbl_800AAE48
/* 0A58A4 800AAE44 60001000 */  ori		r0, r0, 0x1000
lbl_800AAE48:
/* 0A58A8 800AAE48 57E305AC */  rlwinm	r3, r31, 0, 0x16, 0x16
/* 0A58AC 800AAE4C 28030000 */  cmplwi	r3, 0
/* 0A58B0 800AAE50 41820008 */  beq		lbl_800AAE58
/* 0A58B4 800AAE54 60002000 */  ori		r0, r0, 0x2000
lbl_800AAE58:
/* 0A58B8 800AAE58 57E305EE */  rlwinm	r3, r31, 0, 0x17, 0x17
/* 0A58BC 800AAE5C 28030000 */  cmplwi	r3, 0
/* 0A58C0 800AAE60 41820008 */  beq		lbl_800AAE68
/* 0A58C4 800AAE64 60000080 */  ori		r0, r0, 0x80
lbl_800AAE68:
/* 0A58C8 800AAE68 57E30738 */  rlwinm	r3, r31, 0, 0x1c, 0x1c
/* 0A58CC 800AAE6C 28030000 */  cmplwi	r3, 0
/* 0A58D0 800AAE70 41820008 */  beq		lbl_800AAE78
/* 0A58D4 800AAE74 60000800 */  ori		r0, r0, 0x800
lbl_800AAE78:
/* 0A58D8 800AAE78 57E3077A */  rlwinm	r3, r31, 0, 0x1d, 0x1d
/* 0A58DC 800AAE7C 28030000 */  cmplwi	r3, 0
/* 0A58E0 800AAE80 41820008 */  beq		lbl_800AAE88
/* 0A58E4 800AAE84 60000400 */  ori		r0, r0, 0x400
lbl_800AAE88:
/* 0A58E8 800AAE88 57E307BC */  rlwinm	r3, r31, 0, 0x1e, 0x1e
/* 0A58EC 800AAE8C 28030000 */  cmplwi	r3, 0
/* 0A58F0 800AAE90 41820008 */  beq		lbl_800AAE98
/* 0A58F4 800AAE94 60000200 */  ori		r0, r0, 0x200
lbl_800AAE98:
/* 0A58F8 800AAE98 57E30528 */  rlwinm	r3, r31, 0, 0x14, 0x14
/* 0A58FC 800AAE9C 28030000 */  cmplwi	r3, 0
/* 0A5900 800AAEA0 41820008 */  beq		lbl_800AAEA8
/* 0A5904 800AAEA4 60004000 */  ori		r0, r0, 0x4000
lbl_800AAEA8:
/* 0A5908 800AAEA8 57E307FE */  clrlwi	r3, r31, 0x1f
/* 0A590C 800AAEAC 28030000 */  cmplwi	r3, 0
/* 0A5910 800AAEB0 41820008 */  beq		lbl_800AAEB8
/* 0A5914 800AAEB4 60000100 */  ori		r0, r0, 0x100
lbl_800AAEB8:
/* 0A5918 800AAEB8 3C608000 */  lis		r3, 0x8000
/* 0A591C 800AAEBC 808300C4 */  lwz		r4, 0xc4(r3)
/* 0A5920 800AAEC0 806300C8 */  lwz		r3, 0xc8(r3)
/* 0A5924 800AAEC4 7C831B78 */  or		r3, r4, r3
/* 0A5928 800AAEC8 7C041878 */  andc	r4, r0, r3
/* 0A592C 800AAECC 28040000 */  cmplwi	r4, 0
/* 0A5930 800AAED0 41820098 */  beq		lbl_800AAF68
/* 0A5934 800AAED4 3C608010 */  lis		r3, InterruptPrioTable@ha
/* 0A5938 800AAED8 3803F3C0 */  addi	r0, r3, InterruptPrioTable@l
/* 0A593C 800AAEDC 7C030378 */  mr		r3, r0
/* 0A5940 800AAEE0 48000004 */  b		lbl_800AAEE4
lbl_800AAEE4:
/* 0A5944 800AAEE4 48000004 */  b		lbl_800AAEE8
lbl_800AAEE8:
/* 0A5948 800AAEE8 80030000 */  lwz		r0, 0(r3)
/* 0A594C 800AAEEC 7C800038 */  and		r0, r4, r0
/* 0A5950 800AAEF0 28000000 */  cmplwi	r0, 0
/* 0A5954 800AAEF4 41820010 */  beq		lbl_800AAF04
/* 0A5958 800AAEF8 7C000034 */  cntlzw	r0, r0
/* 0A595C 800AAEFC 7C1D0734 */  extsh	r29, r0
/* 0A5960 800AAF00 4800000C */  b		lbl_800AAF0C
lbl_800AAF04:
/* 0A5964 800AAF04 38630004 */  addi	r3, r3, 4
/* 0A5968 800AAF08 4BFFFFE0 */  b		lbl_800AAEE8
lbl_800AAF0C:
/* 0A596C 800AAF0C 806D9118 */  lwz		r3, InterruptHandlerTable-_SDA_BASE_(r13)
/* 0A5970 800AAF10 57A0103A */  slwi	r0, r29, 2
/* 0A5974 800AAF14 7FE3002E */  lwzx	r31, r3, r0
/* 0A5978 800AAF18 281F0000 */  cmplwi	r31, 0
/* 0A597C 800AAF1C 4182004C */  beq		lbl_800AAF68
/* 0A5980 800AAF20 2C1D0004 */  cmpwi	r29, 4
/* 0A5984 800AAF24 4081001C */  ble		lbl_800AAF40
/* 0A5988 800AAF28 B3AD9120 */  sth		r29, __OSLastInterrupt-_SDA_BASE_(r13)
/* 0A598C 800AAF2C 48002DF1 */  bl		OSGetTime
/* 0A5990 800AAF30 908D912C */  stw		r4, (__OSLastInterruptTime + 4)-_SDA_BASE_(r13)
/* 0A5994 800AAF34 906D9128 */  stw		r3, __OSLastInterruptTime-_SDA_BASE_(r13)
/* 0A5998 800AAF38 801E0198 */  lwz		r0, 0x198(r30)
/* 0A599C 800AAF3C 900D911C */  stw		r0, __OSLastInterruptSrr0-_SDA_BASE_(r13)
lbl_800AAF40:
/* 0A59A0 800AAF40 48001D85 */  bl		OSDisableScheduler
/* 0A59A4 800AAF44 7FA3EB78 */  mr		r3, r29
/* 0A59A8 800AAF48 7FC4F378 */  mr		r4, r30
/* 0A59AC 800AAF4C 7FECFB78 */  mr		r12, r31
/* 0A59B0 800AAF50 7D8803A6 */  mtlr	r12
/* 0A59B4 800AAF54 4E800021 */  blrl	
/* 0A59B8 800AAF58 48001DAD */  bl		OSEnableScheduler
/* 0A59BC 800AAF5C 48002275 */  bl		__OSReschedule
/* 0A59C0 800AAF60 7FC3F378 */  mr		r3, r30
/* 0A59C4 800AAF64 4BFFEBD5 */  bl		OSLoadContext
lbl_800AAF68:
/* 0A59C8 800AAF68 7FC3F378 */  mr		r3, r30
/* 0A59CC 800AAF6C 4BFFEBCD */  bl		OSLoadContext
/* 0A59D0 800AAF70 8001002C */  lwz		r0, 0x2c(r1)
/* 0A59D4 800AAF74 83E10024 */  lwz		r31, 0x24(r1)
/* 0A59D8 800AAF78 83C10020 */  lwz		r30, 0x20(r1)
/* 0A59DC 800AAF7C 83A1001C */  lwz		r29, 0x1c(r1)
/* 0A59E0 800AAF80 38210028 */  addi	r1, r1, 0x28
/* 0A59E4 800AAF84 7C0803A6 */  mtlr	r0
/* 0A59E8 800AAF88 4E800020 */  blr		

ExternalInterruptHandler:
/* 0A59EC 800AAF8C 90040000 */  stw		r0, 0(r4)
/* 0A59F0 800AAF90 90240004 */  stw		r1, 4(r4)
/* 0A59F4 800AAF94 90440008 */  stw		r2, 8(r4)
/* 0A59F8 800AAF98 BCC40018 */  stmw	r6, 0x18(r4)
/* 0A59FC 800AAF9C 7C11E2A6 */  mfspr	r0, 0x391
/* 0A5A00 800AAFA0 900401A8 */  stw		r0, 0x1a8(r4)
/* 0A5A04 800AAFA4 7C12E2A6 */  mfspr	r0, 0x392
/* 0A5A08 800AAFA8 900401AC */  stw		r0, 0x1ac(r4)
/* 0A5A0C 800AAFAC 7C13E2A6 */  mfspr	r0, 0x393
/* 0A5A10 800AAFB0 900401B0 */  stw		r0, 0x1b0(r4)
/* 0A5A14 800AAFB4 7C14E2A6 */  mfspr	r0, 0x394
/* 0A5A18 800AAFB8 900401B4 */  stw		r0, 0x1b4(r4)
/* 0A5A1C 800AAFBC 7C15E2A6 */  mfspr	r0, 0x395
/* 0A5A20 800AAFC0 900401B8 */  stw		r0, 0x1b8(r4)
/* 0A5A24 800AAFC4 7C16E2A6 */  mfspr	r0, 0x396
/* 0A5A28 800AAFC8 900401BC */  stw		r0, 0x1bc(r4)
/* 0A5A2C 800AAFCC 7C17E2A6 */  mfspr	r0, 0x397
/* 0A5A30 800AAFD0 900401C0 */  stw		r0, 0x1c0(r4)
/* 0A5A34 800AAFD4 9421FFF8 */  stwu	r1, -8(r1)
/* 0A5A38 800AAFD8 4BFFFC70 */  b		__OSDispatchInterrupt


.section .data, "wa"

.balign 8

/* 000FC440 800FF3C0 002C */
InterruptPrioTable:
    .long 0x00000100, 0x00000040, 0xF8000000, 0x00000200, 0x00000080, 0x00003000, 0x00000020, 0x03FF8C00
    .long 0x04000000, 0x00004000, 0xFFFFFFFF


.section .sbss, "wa"

.balign 8

/* 00100358 80145AF8 0004 */
InterruptHandlerTable:
    .skip 4

.balign 4

/* 0010035C 80145AFC 0004 */
glabel __OSLastInterruptSrr0
    .skip 4

.balign 4

/* 00100360 80145B00 0002 */
glabel __OSLastInterrupt
    .skip 2

.balign 8

/* 00100368 80145B08 0008 */
glabel __OSLastInterruptTime
    .skip 8


