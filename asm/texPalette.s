# texPalette.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel TEXGet
/* 0CFB48 800D50E8 80630008 */  lwz     r3, 8(r3)
/* 0CFB4C 800D50EC 54801838 */  slwi    r0, r4, 3
/* 0CFB50 800D50F0 7C630214 */  add     r3, r3, r0
/* 0CFB54 800D50F4 4E800020 */  blr     

glabel TEXGetGXTexObjFromPalette
/* 0CFB58 800D50F8 7C0802A6 */  mflr    r0
/* 0CFB5C 800D50FC 90010004 */  stw     r0, 4(r1)
/* 0CFB60 800D5100 54A01838 */  slwi    r0, r5, 3
/* 0CFB64 800D5104 9421FFD0 */  stwu    r1, -0x30(r1)
/* 0CFB68 800D5108 93E1002C */  stw     r31, 0x2c(r1)
/* 0CFB6C 800D510C 93C10028 */  stw     r30, 0x28(r1)
/* 0CFB70 800D5110 3BC40000 */  addi    r30, r4, 0
/* 0CFB74 800D5114 80630008 */  lwz     r3, 8(r3)
/* 0CFB78 800D5118 7FE30214 */  add     r31, r3, r0
/* 0CFB7C 800D511C 809F0000 */  lwz     r4, 0(r31)
/* 0CFB80 800D5120 88640021 */  lbz     r3, 0x21(r4)
/* 0CFB84 800D5124 88040022 */  lbz     r0, 0x22(r4)
/* 0CFB88 800D5128 7C030040 */  cmplw   r3, r0
/* 0CFB8C 800D512C 4082000C */  bne     lbl_800D5138
/* 0CFB90 800D5130 39400000 */  li      r10, 0
/* 0CFB94 800D5134 48000008 */  b       lbl_800D513C
lbl_800D5138:
/* 0CFB98 800D5138 39400001 */  li      r10, 1
lbl_800D513C:
/* 0CFB9C 800D513C 813F0000 */  lwz     r9, 0(r31)
/* 0CFBA0 800D5140 7FC3F378 */  mr      r3, r30
/* 0CFBA4 800D5144 80890008 */  lwz     r4, 8(r9)
/* 0CFBA8 800D5148 A0A90002 */  lhz     r5, 2(r9)
/* 0CFBAC 800D514C A0C90000 */  lhz     r6, 0(r9)
/* 0CFBB0 800D5150 80E90004 */  lwz     r7, 4(r9)
/* 0CFBB4 800D5154 8109000C */  lwz     r8, 0xc(r9)
/* 0CFBB8 800D5158 81290010 */  lwz     r9, 0x10(r9)
/* 0CFBBC 800D515C 4BFE30D5 */  bl      GXInitTexObj
/* 0CFBC0 800D5160 813F0000 */  lwz     r9, 0(r31)
/* 0CFBC4 800D5164 3CE04330 */  lis     r7, 0x4330
/* 0CFBC8 800D5168 C84285E8 */  lfd     f2, D_801465C8-_SDA2_BASE_(r2)
/* 0CFBCC 800D516C 7FC3F378 */  mr      r3, r30
/* 0CFBD0 800D5170 88890021 */  lbz     r4, 0x21(r9)
/* 0CFBD4 800D5174 88090022 */  lbz     r0, 0x22(r9)
/* 0CFBD8 800D5178 38C00000 */  li      r6, 0
/* 0CFBDC 800D517C 90810024 */  stw     r4, 0x24(r1)
/* 0CFBE0 800D5180 39000000 */  li      r8, 0
/* 0CFBE4 800D5184 80890014 */  lwz     r4, 0x14(r9)
/* 0CFBE8 800D5188 9001001C */  stw     r0, 0x1c(r1)
/* 0CFBEC 800D518C 80A90018 */  lwz     r5, 0x18(r9)
/* 0CFBF0 800D5190 90E10020 */  stw     r7, 0x20(r1)
/* 0CFBF4 800D5194 C069001C */  lfs     f3, 0x1c(r9)
/* 0CFBF8 800D5198 90E10018 */  stw     r7, 0x18(r1)
/* 0CFBFC 800D519C C8210020 */  lfd     f1, 0x20(r1)
/* 0CFC00 800D51A0 C8010018 */  lfd     f0, 0x18(r1)
/* 0CFC04 800D51A4 EC211028 */  fsubs   f1, f1, f2
/* 0CFC08 800D51A8 88E90020 */  lbz     r7, 0x20(r9)
/* 0CFC0C 800D51AC EC401028 */  fsubs   f2, f0, f2
/* 0CFC10 800D51B0 4BFE3315 */  bl      GXInitTexObjLOD
/* 0CFC14 800D51B4 80010034 */  lwz     r0, 0x34(r1)
/* 0CFC18 800D51B8 83E1002C */  lwz     r31, 0x2c(r1)
/* 0CFC1C 800D51BC 83C10028 */  lwz     r30, 0x28(r1)
/* 0CFC20 800D51C0 38210030 */  addi    r1, r1, 0x30
/* 0CFC24 800D51C4 7C0803A6 */  mtlr    r0
/* 0CFC28 800D51C8 4E800020 */  blr     


.section .sdata2, "wa"

.balign 8

/* 00100688 801465C8 0008 */
D_801465C8:
    .double 4503599627370496.0


