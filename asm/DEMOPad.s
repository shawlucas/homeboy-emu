# DEMOPad.c
.include "macros.inc"

.section .text, "ax"

.balign 4

DEMOPadCopy:
/* 0BDAE0 800C3080 8803000A */  lbz		r0, 0xa(r3)
/* 0BDAE4 800C3084 7C000774 */  extsb	r0, r0
/* 0BDAE8 800C3088 2C00FFFD */  cmpwi	r0, -3
/* 0BDAEC 800C308C 41820164 */  beq		lbl_800C31F0
/* 0BDAF0 800C3090 88A30002 */  lbz		r5, 2(r3)
/* 0BDAF4 800C3094 38E00000 */  li		r7, 0
/* 0BDAF8 800C3098 7CA00774 */  extsb	r0, r5
/* 0BDAFC 800C309C 2C00FFD0 */  cmpwi	r0, -48
/* 0BDB00 800C30A0 40800008 */  bge		lbl_800C30A8
/* 0BDB04 800C30A4 60E74000 */  ori		r7, r7, 0x4000
lbl_800C30A8:
/* 0BDB08 800C30A8 7CA00774 */  extsb	r0, r5
/* 0BDB0C 800C30AC 2C000030 */  cmpwi	r0, 0x30
/* 0BDB10 800C30B0 40810008 */  ble		lbl_800C30B8
/* 0BDB14 800C30B4 60E78000 */  ori		r7, r7, 0x8000
lbl_800C30B8:
/* 0BDB18 800C30B8 88A30003 */  lbz		r5, 3(r3)
/* 0BDB1C 800C30BC 7CA00774 */  extsb	r0, r5
/* 0BDB20 800C30C0 2C00FFD0 */  cmpwi	r0, -48
/* 0BDB24 800C30C4 40800008 */  bge		lbl_800C30CC
/* 0BDB28 800C30C8 60E72000 */  ori		r7, r7, 0x2000
lbl_800C30CC:
/* 0BDB2C 800C30CC 7CA00774 */  extsb	r0, r5
/* 0BDB30 800C30D0 2C000030 */  cmpwi	r0, 0x30
/* 0BDB34 800C30D4 40810008 */  ble		lbl_800C30DC
/* 0BDB38 800C30D8 60E71000 */  ori		r7, r7, 0x1000
lbl_800C30DC:
/* 0BDB3C 800C30DC 88A30004 */  lbz		r5, 4(r3)
/* 0BDB40 800C30E0 7CA00774 */  extsb	r0, r5
/* 0BDB44 800C30E4 2C00FFD0 */  cmpwi	r0, -48
/* 0BDB48 800C30E8 40800008 */  bge		lbl_800C30F0
/* 0BDB4C 800C30EC 60E70400 */  ori		r7, r7, 0x400
lbl_800C30F0:
/* 0BDB50 800C30F0 7CA00774 */  extsb	r0, r5
/* 0BDB54 800C30F4 2C000030 */  cmpwi	r0, 0x30
/* 0BDB58 800C30F8 40810008 */  ble		lbl_800C3100
/* 0BDB5C 800C30FC 60E70800 */  ori		r7, r7, 0x800
lbl_800C3100:
/* 0BDB60 800C3100 88A30005 */  lbz		r5, 5(r3)
/* 0BDB64 800C3104 7CA00774 */  extsb	r0, r5
/* 0BDB68 800C3108 2C00FFD0 */  cmpwi	r0, -48
/* 0BDB6C 800C310C 40800008 */  bge		lbl_800C3114
/* 0BDB70 800C3110 60E70200 */  ori		r7, r7, 0x200
lbl_800C3114:
/* 0BDB74 800C3114 7CA00774 */  extsb	r0, r5
/* 0BDB78 800C3118 2C000030 */  cmpwi	r0, 0x30
/* 0BDB7C 800C311C 40810008 */  ble		lbl_800C3124
/* 0BDB80 800C3120 60E70100 */  ori		r7, r7, 0x100
lbl_800C3124:
/* 0BDB84 800C3124 A0040010 */  lhz		r0, 0x10(r4)
/* 0BDB88 800C3128 54E5043E */  clrlwi	r5, r7, 0x10
/* 0BDB8C 800C312C 7C002A78 */  xor		r0, r0, r5
/* 0BDB90 800C3130 7CA00038 */  and		r0, r5, r0
/* 0BDB94 800C3134 B0040012 */  sth		r0, 0x12(r4)
/* 0BDB98 800C3138 A0C40010 */  lhz		r6, 0x10(r4)
/* 0BDB9C 800C313C 7CC02A78 */  xor		r0, r6, r5
/* 0BDBA0 800C3140 7CC00038 */  and		r0, r6, r0
/* 0BDBA4 800C3144 B0040014 */  sth		r0, 0x14(r4)
/* 0BDBA8 800C3148 B0E40010 */  sth		r7, 0x10(r4)
/* 0BDBAC 800C314C A0A30000 */  lhz		r5, 0(r3)
/* 0BDBB0 800C3150 A0040000 */  lhz		r0, 0(r4)
/* 0BDBB4 800C3154 7C002A78 */  xor		r0, r0, r5
/* 0BDBB8 800C3158 7CA00038 */  and		r0, r5, r0
/* 0BDBBC 800C315C B004000C */  sth		r0, 0xc(r4)
/* 0BDBC0 800C3160 A0A40000 */  lhz		r5, 0(r4)
/* 0BDBC4 800C3164 A0030000 */  lhz		r0, 0(r3)
/* 0BDBC8 800C3168 7CA00278 */  xor		r0, r5, r0
/* 0BDBCC 800C316C 7CA00038 */  and		r0, r5, r0
/* 0BDBD0 800C3170 B004000E */  sth		r0, 0xe(r4)
/* 0BDBD4 800C3174 88A40002 */  lbz		r5, 2(r4)
/* 0BDBD8 800C3178 88030002 */  lbz		r0, 2(r3)
/* 0BDBDC 800C317C 7CA50774 */  extsb	r5, r5
/* 0BDBE0 800C3180 7C000774 */  extsb	r0, r0
/* 0BDBE4 800C3184 7C050050 */  subf	r0, r5, r0
/* 0BDBE8 800C3188 B0040016 */  sth		r0, 0x16(r4)
/* 0BDBEC 800C318C 88A40003 */  lbz		r5, 3(r4)
/* 0BDBF0 800C3190 88030003 */  lbz		r0, 3(r3)
/* 0BDBF4 800C3194 7CA50774 */  extsb	r5, r5
/* 0BDBF8 800C3198 7C000774 */  extsb	r0, r0
/* 0BDBFC 800C319C 7C050050 */  subf	r0, r5, r0
/* 0BDC00 800C31A0 B0040018 */  sth		r0, 0x18(r4)
/* 0BDC04 800C31A4 88A40004 */  lbz		r5, 4(r4)
/* 0BDC08 800C31A8 88030004 */  lbz		r0, 4(r3)
/* 0BDC0C 800C31AC 7CA50774 */  extsb	r5, r5
/* 0BDC10 800C31B0 7C000774 */  extsb	r0, r0
/* 0BDC14 800C31B4 7C050050 */  subf	r0, r5, r0
/* 0BDC18 800C31B8 B004001A */  sth		r0, 0x1a(r4)
/* 0BDC1C 800C31BC 88A40005 */  lbz		r5, 5(r4)
/* 0BDC20 800C31C0 88030005 */  lbz		r0, 5(r3)
/* 0BDC24 800C31C4 7CA50774 */  extsb	r5, r5
/* 0BDC28 800C31C8 7C000774 */  extsb	r0, r0
/* 0BDC2C 800C31CC 7C050050 */  subf	r0, r5, r0
/* 0BDC30 800C31D0 B004001C */  sth		r0, 0x1c(r4)
/* 0BDC34 800C31D4 80A30000 */  lwz		r5, 0(r3)
/* 0BDC38 800C31D8 80030004 */  lwz		r0, 4(r3)
/* 0BDC3C 800C31DC 90A40000 */  stw		r5, 0(r4)
/* 0BDC40 800C31E0 90040004 */  stw		r0, 4(r4)
/* 0BDC44 800C31E4 80030008 */  lwz		r0, 8(r3)
/* 0BDC48 800C31E8 90040008 */  stw		r0, 8(r4)
/* 0BDC4C 800C31EC 4E800020 */  blr		
lbl_800C31F0:
/* 0BDC50 800C31F0 38000000 */  li		r0, 0
/* 0BDC54 800C31F4 B0040014 */  sth		r0, 0x14(r4)
/* 0BDC58 800C31F8 B0040012 */  sth		r0, 0x12(r4)
/* 0BDC5C 800C31FC B004000E */  sth		r0, 0xe(r4)
/* 0BDC60 800C3200 B004000C */  sth		r0, 0xc(r4)
/* 0BDC64 800C3204 B0040018 */  sth		r0, 0x18(r4)
/* 0BDC68 800C3208 B0040016 */  sth		r0, 0x16(r4)
/* 0BDC6C 800C320C B004001C */  sth		r0, 0x1c(r4)
/* 0BDC70 800C3210 B004001A */  sth		r0, 0x1a(r4)
/* 0BDC74 800C3214 4E800020 */  blr		

glabel DEMOPadRead
/* 0BDC78 800C3218 7C0802A6 */  mflr	r0
/* 0BDC7C 800C321C 3C608014 */  lis		r3, Pad@ha
/* 0BDC80 800C3220 90010004 */  stw		r0, 4(r1)
/* 0BDC84 800C3224 9421FFE0 */  stwu	r1, -0x20(r1)
/* 0BDC88 800C3228 BF61000C */  stmw	r27, 0xc(r1)
/* 0BDC8C 800C322C 3BE32428 */  addi	r31, r3, Pad@l
/* 0BDC90 800C3230 387F0000 */  addi	r3, r31, 0
/* 0BDC94 800C3234 3B600000 */  li		r27, 0
/* 0BDC98 800C3238 4BFF93A1 */  bl		PADRead
/* 0BDC9C 800C323C 7FE3FB78 */  mr		r3, r31
/* 0BDCA0 800C3240 4BFF8699 */  bl		PADClamp
/* 0BDCA4 800C3244 3B800000 */  li		r28, 0
/* 0BDCA8 800C3248 1C1C001E */  mulli	r0, r28, 0x1e
/* 0BDCAC 800C324C 38800000 */  li		r4, 0
/* 0BDCB0 800C3250 3C608010 */  lis		r3, PadChanMask@ha
/* 0BDCB4 800C3254 908D93A8 */  stw		r4, DemoNumValidPads-_SDA_BASE_(r13)
/* 0BDCB8 800C3258 7FBF0214 */  add		r29, r31, r0
/* 0BDCBC 800C325C 3BC31700 */  addi	r30, r3, PadChanMask@l
/* 0BDCC0 800C3260 3BBD0030 */  addi	r29, r29, 0x30
lbl_800C3264:
/* 0BDCC4 800C3264 887F000A */  lbz		r3, 0xa(r31)
/* 0BDCC8 800C3268 7C600775 */  extsb.	r0, r3
/* 0BDCCC 800C326C 41820010 */  beq		lbl_800C327C
/* 0BDCD0 800C3270 7C600774 */  extsb	r0, r3
/* 0BDCD4 800C3274 2C00FFFD */  cmpwi	r0, -3
/* 0BDCD8 800C3278 40820014 */  bne		lbl_800C328C
lbl_800C327C:
/* 0BDCDC 800C327C 806D93A8 */  lwz		r3, DemoNumValidPads-_SDA_BASE_(r13)
/* 0BDCE0 800C3280 38030001 */  addi	r0, r3, 1
/* 0BDCE4 800C3284 900D93A8 */  stw		r0, DemoNumValidPads-_SDA_BASE_(r13)
/* 0BDCE8 800C3288 48000014 */  b		lbl_800C329C
lbl_800C328C:
/* 0BDCEC 800C328C 2C00FFFF */  cmpwi	r0, -1
/* 0BDCF0 800C3290 4082000C */  bne		lbl_800C329C
/* 0BDCF4 800C3294 801E0000 */  lwz		r0, 0(r30)
/* 0BDCF8 800C3298 7F7B0378 */  or		r27, r27, r0
lbl_800C329C:
/* 0BDCFC 800C329C 387F0000 */  addi	r3, r31, 0
/* 0BDD00 800C32A0 389D0000 */  addi	r4, r29, 0
/* 0BDD04 800C32A4 4BFFFDDD */  bl		DEMOPadCopy
/* 0BDD08 800C32A8 3B9C0001 */  addi	r28, r28, 1
/* 0BDD0C 800C32AC 2C1C0004 */  cmpwi	r28, 4
/* 0BDD10 800C32B0 3BFF000C */  addi	r31, r31, 0xc
/* 0BDD14 800C32B4 3BDE0004 */  addi	r30, r30, 4
/* 0BDD18 800C32B8 3BBD001E */  addi	r29, r29, 0x1e
/* 0BDD1C 800C32BC 4180FFA8 */  blt		lbl_800C3264
/* 0BDD20 800C32C0 281B0000 */  cmplwi	r27, 0
/* 0BDD24 800C32C4 4182000C */  beq		lbl_800C32D0
/* 0BDD28 800C32C8 7F63DB78 */  mr		r3, r27
/* 0BDD2C 800C32CC 4BFF8F99 */  bl		PADReset
lbl_800C32D0:
/* 0BDD30 800C32D0 BB61000C */  lmw		r27, 0xc(r1)
/* 0BDD34 800C32D4 80010024 */  lwz		r0, 0x24(r1)
/* 0BDD38 800C32D8 38210020 */  addi	r1, r1, 0x20
/* 0BDD3C 800C32DC 7C0803A6 */  mtlr	r0
/* 0BDD40 800C32E0 4E800020 */  blr		

glabel DEMOPadInit
/* 0BDD44 800C32E4 7C0802A6 */  mflr	r0
/* 0BDD48 800C32E8 90010004 */  stw		r0, 4(r1)
/* 0BDD4C 800C32EC 9421FFF8 */  stwu	r1, -8(r1)
/* 0BDD50 800C32F0 4BFF9199 */  bl		PADInit
/* 0BDD54 800C32F4 38000002 */  li		r0, 2
/* 0BDD58 800C32F8 3C608014 */  lis		r3, DemoPad@ha
/* 0BDD5C 800C32FC 7C0903A6 */  mtctr	r0
/* 0BDD60 800C3300 38632458 */  addi	r3, r3, DemoPad@l
lbl_800C3304:
/* 0BDD64 800C3304 38000000 */  li		r0, 0
/* 0BDD68 800C3308 B0030000 */  sth		r0, 0(r3)
/* 0BDD6C 800C330C 98030002 */  stb		r0, 2(r3)
/* 0BDD70 800C3310 98030003 */  stb		r0, 3(r3)
/* 0BDD74 800C3314 98030004 */  stb		r0, 4(r3)
/* 0BDD78 800C3318 98030005 */  stb		r0, 5(r3)
/* 0BDD7C 800C331C 98030006 */  stb		r0, 6(r3)
/* 0BDD80 800C3320 98030007 */  stb		r0, 7(r3)
/* 0BDD84 800C3324 98030008 */  stb		r0, 8(r3)
/* 0BDD88 800C3328 98030009 */  stb		r0, 9(r3)
/* 0BDD8C 800C332C 9803000A */  stb		r0, 0xa(r3)
/* 0BDD90 800C3330 B003000C */  sth		r0, 0xc(r3)
/* 0BDD94 800C3334 B003000E */  sth		r0, 0xe(r3)
/* 0BDD98 800C3338 B0030010 */  sth		r0, 0x10(r3)
/* 0BDD9C 800C333C B0030012 */  sth		r0, 0x12(r3)
/* 0BDDA0 800C3340 B0030014 */  sth		r0, 0x14(r3)
/* 0BDDA4 800C3344 B0030016 */  sth		r0, 0x16(r3)
/* 0BDDA8 800C3348 B0030018 */  sth		r0, 0x18(r3)
/* 0BDDAC 800C334C B003001A */  sth		r0, 0x1a(r3)
/* 0BDDB0 800C3350 B003001C */  sth		r0, 0x1c(r3)
/* 0BDDB4 800C3354 B003001E */  sth		r0, 0x1e(r3)
/* 0BDDB8 800C3358 98030020 */  stb		r0, 0x20(r3)
/* 0BDDBC 800C335C 98030021 */  stb		r0, 0x21(r3)
/* 0BDDC0 800C3360 98030022 */  stb		r0, 0x22(r3)
/* 0BDDC4 800C3364 98030023 */  stb		r0, 0x23(r3)
/* 0BDDC8 800C3368 98030024 */  stb		r0, 0x24(r3)
/* 0BDDCC 800C336C 98030025 */  stb		r0, 0x25(r3)
/* 0BDDD0 800C3370 98030026 */  stb		r0, 0x26(r3)
/* 0BDDD4 800C3374 98030027 */  stb		r0, 0x27(r3)
/* 0BDDD8 800C3378 98030028 */  stb		r0, 0x28(r3)
/* 0BDDDC 800C337C B003002A */  sth		r0, 0x2a(r3)
/* 0BDDE0 800C3380 B003002C */  sth		r0, 0x2c(r3)
/* 0BDDE4 800C3384 B003002E */  sth		r0, 0x2e(r3)
/* 0BDDE8 800C3388 B0030030 */  sth		r0, 0x30(r3)
/* 0BDDEC 800C338C B0030032 */  sth		r0, 0x32(r3)
/* 0BDDF0 800C3390 B0030034 */  sth		r0, 0x34(r3)
/* 0BDDF4 800C3394 B0030036 */  sth		r0, 0x36(r3)
/* 0BDDF8 800C3398 B0030038 */  sth		r0, 0x38(r3)
/* 0BDDFC 800C339C B003003A */  sth		r0, 0x3a(r3)
/* 0BDE00 800C33A0 3863003C */  addi	r3, r3, 0x3c
/* 0BDE04 800C33A4 4200FF60 */  bdnz	lbl_800C3304
/* 0BDE08 800C33A8 8001000C */  lwz		r0, 0xc(r1)
/* 0BDE0C 800C33AC 38210008 */  addi	r1, r1, 8
/* 0BDE10 800C33B0 7C0803A6 */  mtlr	r0
/* 0BDE14 800C33B4 4E800020 */  blr		


.section .data, "wa"

.balign 8

/* 000FE780 80101700 0010 */
PadChanMask:
    .long 0x80000000, 0x40000000, 0x20000000, 0x10000000


.section .bss, "wa"

.balign 4

/* 0013F4A8 80142428 0030 */
Pad:
    .skip 48

.balign 4

/* 0013F4D8 80142458 0078 */
glabel DemoPad
    .skip 120


.section .sbss, "wa"

.balign 8

/* 001005E8 80145D88 0004 */
glabel DemoNumValidPads
    .skip 4


