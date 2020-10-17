# s_frexp.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel frexp
/* 0D8860 800DDE00 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0D8864 800DDE04 3C007FF0 */  lis     r0, 0x7ff0
/* 0D8868 800DDE08 38800000 */  li      r4, 0
/* 0D886C 800DDE0C D8210008 */  stfd    f1, 8(r1)
/* 0D8870 800DDE10 80A10008 */  lwz     r5, 8(r1)
/* 0D8874 800DDE14 8101000C */  lwz     r8, 0xc(r1)
/* 0D8878 800DDE18 54A6007E */  clrlwi  r6, r5, 1
/* 0D887C 800DDE1C 7C060000 */  cmpw    r6, r0
/* 0D8880 800DDE20 90830000 */  stw     r4, 0(r3)
/* 0D8884 800DDE24 38E50000 */  addi    r7, r5, 0
/* 0D8888 800DDE28 38860000 */  addi    r4, r6, 0
/* 0D888C 800DDE2C 4080000C */  bge     lbl_800DDE38
/* 0D8890 800DDE30 7C804379 */  or.     r0, r4, r8
/* 0D8894 800DDE34 4082000C */  bne     lbl_800DDE40
lbl_800DDE38:
/* 0D8898 800DDE38 C8210008 */  lfd     f1, 8(r1)
/* 0D889C 800DDE3C 48000058 */  b       lbl_800DDE94
lbl_800DDE40:
/* 0D88A0 800DDE40 3C000010 */  lis     r0, 0x10
/* 0D88A4 800DDE44 7C040000 */  cmpw    r4, r0
/* 0D88A8 800DDE48 40800028 */  bge     lbl_800DDE70
/* 0D88AC 800DDE4C C8210008 */  lfd     f1, 8(r1)
/* 0D88B0 800DDE50 3800FFCA */  li      r0, -54
/* 0D88B4 800DDE54 C8028750 */  lfd     f0, D_80146730-_SDA2_BASE_(r2)
/* 0D88B8 800DDE58 FC010032 */  fmul    f0, f1, f0
/* 0D88BC 800DDE5C D8010008 */  stfd    f0, 8(r1)
/* 0D88C0 800DDE60 80810008 */  lwz     r4, 8(r1)
/* 0D88C4 800DDE64 90030000 */  stw     r0, 0(r3)
/* 0D88C8 800DDE68 38E40000 */  addi    r7, r4, 0
/* 0D88CC 800DDE6C 5484007E */  clrlwi  r4, r4, 1
lbl_800DDE70:
/* 0D88D0 800DDE70 80A30000 */  lwz     r5, 0(r3)
/* 0D88D4 800DDE74 7C84A670 */  srawi   r4, r4, 0x14
/* 0D88D8 800DDE78 54E00300 */  rlwinm  r0, r7, 0, 0xc, 0
/* 0D88DC 800DDE7C 7C842A14 */  add     r4, r4, r5
/* 0D88E0 800DDE80 3884FC02 */  addi    r4, r4, -1022
/* 0D88E4 800DDE84 90830000 */  stw     r4, 0(r3)
/* 0D88E8 800DDE88 64003FE0 */  oris    r0, r0, 0x3fe0
/* 0D88EC 800DDE8C 90010008 */  stw     r0, 8(r1)
/* 0D88F0 800DDE90 C8210008 */  lfd     f1, 8(r1)
lbl_800DDE94:
/* 0D88F4 800DDE94 38210018 */  addi    r1, r1, 0x18
/* 0D88F8 800DDE98 4E800020 */  blr     


.section .sdata2, "wa"

.balign 8

/* 001007F0 80146730 0008 */
D_80146730:
    .double 1.8014398509481984e+16


