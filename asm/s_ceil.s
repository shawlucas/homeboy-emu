# s_ceil.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel ceil
/* 0D8560 800DDB00 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0D8564 800DDB04 D8210008 */  stfd    f1, 8(r1)
/* 0D8568 800DDB08 80010008 */  lwz     r0, 8(r1)
/* 0D856C 800DDB0C 80E1000C */  lwz     r7, 0xc(r1)
/* 0D8570 800DDB10 5403657E */  rlwinm  r3, r0, 0xc, 0x15, 0x1f
/* 0D8574 800DDB14 3883FC01 */  addi    r4, r3, -1023
/* 0D8578 800DDB18 2C040014 */  cmpwi   r4, 0x14
/* 0D857C 800DDB1C 7C060378 */  mr      r6, r0
/* 0D8580 800DDB20 408000A0 */  bge     lbl_800DDBC0
/* 0D8584 800DDB24 2C040000 */  cmpwi   r4, 0
/* 0D8588 800DDB28 40800044 */  bge     lbl_800DDB6C
/* 0D858C 800DDB2C C8428730 */  lfd     f2, D_80146710-_SDA2_BASE_(r2)
/* 0D8590 800DDB30 C8210008 */  lfd     f1, 8(r1)
/* 0D8594 800DDB34 C8028738 */  lfd     f0, D_80146718-_SDA2_BASE_(r2)
/* 0D8598 800DDB38 FC22082A */  fadd    f1, f2, f1
/* 0D859C 800DDB3C FC010040 */  fcmpo   cr0, f1, f0
/* 0D85A0 800DDB40 40810114 */  ble     lbl_800DDC54
/* 0D85A4 800DDB44 2C060000 */  cmpwi   r6, 0
/* 0D85A8 800DDB48 40800010 */  bge     lbl_800DDB58
/* 0D85AC 800DDB4C 3CC08000 */  lis     r6, 0x8000
/* 0D85B0 800DDB50 38E00000 */  li      r7, 0
/* 0D85B4 800DDB54 48000100 */  b       lbl_800DDC54
lbl_800DDB58:
/* 0D85B8 800DDB58 7CC03B79 */  or.     r0, r6, r7
/* 0D85BC 800DDB5C 418200F8 */  beq     lbl_800DDC54
/* 0D85C0 800DDB60 3CC03FF0 */  lis     r6, 0x3ff0
/* 0D85C4 800DDB64 38E00000 */  li      r7, 0
/* 0D85C8 800DDB68 480000EC */  b       lbl_800DDC54
lbl_800DDB6C:
/* 0D85CC 800DDB6C 3C600010 */  lis     r3, 0x10
/* 0D85D0 800DDB70 3803FFFF */  addi    r0, r3, -1
/* 0D85D4 800DDB74 7C052630 */  sraw    r5, r0, r4
/* 0D85D8 800DDB78 7CC02838 */  and     r0, r6, r5
/* 0D85DC 800DDB7C 7CE00379 */  or.     r0, r7, r0
/* 0D85E0 800DDB80 4082000C */  bne     lbl_800DDB8C
/* 0D85E4 800DDB84 C8210008 */  lfd     f1, 8(r1)
/* 0D85E8 800DDB88 480000D8 */  b       lbl_800DDC60
lbl_800DDB8C:
/* 0D85EC 800DDB8C C8428730 */  lfd     f2, D_80146710-_SDA2_BASE_(r2)
/* 0D85F0 800DDB90 C8210008 */  lfd     f1, 8(r1)
/* 0D85F4 800DDB94 C8028738 */  lfd     f0, D_80146718-_SDA2_BASE_(r2)
/* 0D85F8 800DDB98 FC22082A */  fadd    f1, f2, f1
/* 0D85FC 800DDB9C FC010040 */  fcmpo   cr0, f1, f0
/* 0D8600 800DDBA0 408100B4 */  ble     lbl_800DDC54
/* 0D8604 800DDBA4 2C060000 */  cmpwi   r6, 0
/* 0D8608 800DDBA8 4081000C */  ble     lbl_800DDBB4
/* 0D860C 800DDBAC 7C602630 */  sraw    r0, r3, r4
/* 0D8610 800DDBB0 7CC60214 */  add     r6, r6, r0
lbl_800DDBB4:
/* 0D8614 800DDBB4 7CC62878 */  andc    r6, r6, r5
/* 0D8618 800DDBB8 38E00000 */  li      r7, 0
/* 0D861C 800DDBBC 48000098 */  b       lbl_800DDC54
lbl_800DDBC0:
/* 0D8620 800DDBC0 2C040033 */  cmpwi   r4, 0x33
/* 0D8624 800DDBC4 40810020 */  ble     lbl_800DDBE4
/* 0D8628 800DDBC8 2C040400 */  cmpwi   r4, 0x400
/* 0D862C 800DDBCC 40820010 */  bne     lbl_800DDBDC
/* 0D8630 800DDBD0 C8010008 */  lfd     f0, 8(r1)
/* 0D8634 800DDBD4 FC20002A */  fadd    f1, f0, f0
/* 0D8638 800DDBD8 48000088 */  b       lbl_800DDC60
lbl_800DDBDC:
/* 0D863C 800DDBDC C8210008 */  lfd     f1, 8(r1)
/* 0D8640 800DDBE0 48000080 */  b       lbl_800DDC60
lbl_800DDBE4:
/* 0D8644 800DDBE4 3804FFEC */  addi    r0, r4, -20
/* 0D8648 800DDBE8 3860FFFF */  li      r3, -1
/* 0D864C 800DDBEC 7C650430 */  srw     r5, r3, r0
/* 0D8650 800DDBF0 7CE02839 */  and.    r0, r7, r5
/* 0D8654 800DDBF4 4082000C */  bne     lbl_800DDC00
/* 0D8658 800DDBF8 C8210008 */  lfd     f1, 8(r1)
/* 0D865C 800DDBFC 48000064 */  b       lbl_800DDC60
lbl_800DDC00:
/* 0D8660 800DDC00 C8428730 */  lfd     f2, D_80146710-_SDA2_BASE_(r2)
/* 0D8664 800DDC04 C8210008 */  lfd     f1, 8(r1)
/* 0D8668 800DDC08 C8028738 */  lfd     f0, D_80146718-_SDA2_BASE_(r2)
/* 0D866C 800DDC0C FC22082A */  fadd    f1, f2, f1
/* 0D8670 800DDC10 FC010040 */  fcmpo   cr0, f1, f0
/* 0D8674 800DDC14 40810040 */  ble     lbl_800DDC54
/* 0D8678 800DDC18 2C060000 */  cmpwi   r6, 0
/* 0D867C 800DDC1C 40810034 */  ble     lbl_800DDC50
/* 0D8680 800DDC20 2C040014 */  cmpwi   r4, 0x14
/* 0D8684 800DDC24 4082000C */  bne     lbl_800DDC30
/* 0D8688 800DDC28 38C60001 */  addi    r6, r6, 1
/* 0D868C 800DDC2C 48000024 */  b       lbl_800DDC50
lbl_800DDC30:
/* 0D8690 800DDC30 20040034 */  subfic  r0, r4, 0x34
/* 0D8694 800DDC34 38600001 */  li      r3, 1
/* 0D8698 800DDC38 7C600030 */  slw     r0, r3, r0
/* 0D869C 800DDC3C 7C070214 */  add     r0, r7, r0
/* 0D86A0 800DDC40 7C003840 */  cmplw   r0, r7
/* 0D86A4 800DDC44 40800008 */  bge     lbl_800DDC4C
/* 0D86A8 800DDC48 38C60001 */  addi    r6, r6, 1
lbl_800DDC4C:
/* 0D86AC 800DDC4C 7C070378 */  mr      r7, r0
lbl_800DDC50:
/* 0D86B0 800DDC50 7CE72878 */  andc    r7, r7, r5
lbl_800DDC54:
/* 0D86B4 800DDC54 90C10008 */  stw     r6, 8(r1)
/* 0D86B8 800DDC58 90E1000C */  stw     r7, 0xc(r1)
/* 0D86BC 800DDC5C C8210008 */  lfd     f1, 8(r1)
lbl_800DDC60:
/* 0D86C0 800DDC60 38210010 */  addi    r1, r1, 0x10
/* 0D86C4 800DDC64 4E800020 */  blr     


.section .sdata2, "wa"

.balign 8

/* 001007D0 80146710 0008 */
D_80146710:
    .double 1e+300

.balign 8

/* 001007D8 80146718 0008 */
D_80146718:
    .double 0.0


