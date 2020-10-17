# log10f.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel log10f
/* 0D8A9C 800DE03C 9421FFD0 */  stwu    r1, -0x30(r1)
/* 0D8AA0 800DE040 3C60800E */  lis     r3, _log10_poly@ha
/* 0D8AA4 800DE044 38A3F860 */  addi    r5, r3, _log10_poly@l
/* 0D8AA8 800DE048 D0210008 */  stfs    f1, 8(r1)
/* 0D8AAC 800DE04C 80C10008 */  lwz     r6, 8(r1)
/* 0D8AB0 800DE050 54C40011 */  rlwinm. r4, r6, 0, 0, 8
/* 0D8AB4 800DE054 418201A8 */  beq     lbl_800DE1FC
/* 0D8AB8 800DE058 40800028 */  bge     lbl_800DE080
/* 0D8ABC 800DE05C 3C00FF80 */  lis     r0, 0xff80
/* 0D8AC0 800DE060 7C040000 */  cmpw    r4, r0
/* 0D8AC4 800DE064 41820168 */  beq     lbl_800DE1CC
/* 0D8AC8 800DE068 40800024 */  bge     lbl_800DE08C
/* 0D8ACC 800DE06C 3C608000 */  lis     r3, 0x8000
/* 0D8AD0 800DE070 38030001 */  addi    r0, r3, 1
/* 0D8AD4 800DE074 7C040000 */  cmpw    r4, r0
/* 0D8AD8 800DE078 40800014 */  bge     lbl_800DE08C
/* 0D8ADC 800DE07C 48000180 */  b       lbl_800DE1FC
lbl_800DE080:
/* 0D8AE0 800DE080 3C007F80 */  lis     r0, 0x7f80
/* 0D8AE4 800DE084 7C040000 */  cmpw    r4, r0
/* 0D8AE8 800DE088 41820144 */  beq     lbl_800DE1CC
lbl_800DE08C:
/* 0D8AEC 800DE08C 54C00001 */  rlwinm. r0, r6, 0, 0, 0
/* 0D8AF0 800DE090 C1028780 */  lfs     f8, D_80146760-_SDA2_BASE_(r2)
/* 0D8AF4 800DE094 41820010 */  beq     lbl_800DE0A4
/* 0D8AF8 800DE098 3C608010 */  lis     r3, __float_nan@ha
/* 0D8AFC 800DE09C C0232158 */  lfs     f1, __float_nan@l(r3)
/* 0D8B00 800DE0A0 48000168 */  b       lbl_800DE208
lbl_800DE0A4:
/* 0D8B04 800DE0A4 80610008 */  lwz     r3, 8(r1)
/* 0D8B08 800DE0A8 5460027F */  clrlwi. r0, r3, 9
/* 0D8B0C 800DE0AC 54634DFE */  srwi    r3, r3, 0x17
/* 0D8B10 800DE0B0 38C3FF82 */  addi    r6, r3, -126
/* 0D8B14 800DE0B4 90010008 */  stw     r0, 8(r1)
/* 0D8B18 800DE0B8 41820014 */  beq     lbl_800DE0CC
/* 0D8B1C 800DE0BC 80010008 */  lwz     r0, 8(r1)
/* 0D8B20 800DE0C0 64003F00 */  oris    r0, r0, 0x3f00
/* 0D8B24 800DE0C4 90010008 */  stw     r0, 8(r1)
/* 0D8B28 800DE0C8 48000030 */  b       lbl_800DE0F8
lbl_800DE0CC:
/* 0D8B2C 800DE0CC 38C6FFFF */  addi    r6, r6, -1
/* 0D8B30 800DE0D0 C8228798 */  lfd     f1, D_80146778-_SDA2_BASE_(r2)
/* 0D8B34 800DE0D4 6CC08000 */  xoris   r0, r6, 0x8000
/* 0D8B38 800DE0D8 C0428784 */  lfs     f2, D_80146764-_SDA2_BASE_(r2)
/* 0D8B3C 800DE0DC 9001002C */  stw     r0, 0x2c(r1)
/* 0D8B40 800DE0E0 3C004330 */  lis     r0, 0x4330
/* 0D8B44 800DE0E4 90010028 */  stw     r0, 0x28(r1)
/* 0D8B48 800DE0E8 C8010028 */  lfd     f0, 0x28(r1)
/* 0D8B4C 800DE0EC EC000828 */  fsubs   f0, f0, f1
/* 0D8B50 800DE0F0 EC220032 */  fmuls   f1, f2, f0
/* 0D8B54 800DE0F4 48000114 */  b       lbl_800DE208
lbl_800DE0F8:
/* 0D8B58 800DE0F8 3C603F35 */  lis     r3, 0x3f35
/* 0D8B5C 800DE0FC 80810008 */  lwz     r4, 8(r1)
/* 0D8B60 800DE100 380304F3 */  addi    r0, r3, 0x4f3
/* 0D8B64 800DE104 7C040000 */  cmpw    r4, r0
/* 0D8B68 800DE108 40800018 */  bge     lbl_800DE120
/* 0D8B6C 800DE10C C0228788 */  lfs     f1, D_80146768-_SDA2_BASE_(r2)
/* 0D8B70 800DE110 C0010008 */  lfs     f0, 8(r1)
/* 0D8B74 800DE114 EC01003A */  fmadds  f0, f1, f0, f0
/* 0D8B78 800DE118 D0010008 */  stfs    f0, 8(r1)
/* 0D8B7C 800DE11C 48000008 */  b       lbl_800DE124
lbl_800DE120:
/* 0D8B80 800DE120 C102878C */  lfs     f8, D_8014676C-_SDA2_BASE_(r2)
lbl_800DE124:
/* 0D8B84 800DE124 C0428790 */  lfs     f2, D_80146770-_SDA2_BASE_(r2)
/* 0D8B88 800DE128 6CC08000 */  xoris   r0, r6, 0x8000
/* 0D8B8C 800DE12C C0010008 */  lfs     f0, 8(r1)
/* 0D8B90 800DE130 3C604330 */  lis     r3, 0x4330
/* 0D8B94 800DE134 9001001C */  stw     r0, 0x1c(r1)
/* 0D8B98 800DE138 EC02002A */  fadds   f0, f2, f0
/* 0D8B9C 800DE13C C0228794 */  lfs     f1, D_80146774-_SDA2_BASE_(r2)
/* 0D8BA0 800DE140 90610018 */  stw     r3, 0x18(r1)
/* 0D8BA4 800DE144 C8828798 */  lfd     f4, D_80146778-_SDA2_BASE_(r2)
/* 0D8BA8 800DE148 EC210024 */  fdivs   f1, f1, f0
/* 0D8BAC 800DE14C C8010018 */  lfd     f0, 0x18(r1)
/* 0D8BB0 800DE150 C0628784 */  lfs     f3, D_80146764-_SDA2_BASE_(r2)
/* 0D8BB4 800DE154 EC220828 */  fsubs   f1, f2, f1
/* 0D8BB8 800DE158 EC402028 */  fsubs   f2, f0, f4
/* 0D8BBC 800DE15C D0210008 */  stfs    f1, 8(r1)
/* 0D8BC0 800DE160 C0E10008 */  lfs     f7, 8(r1)
/* 0D8BC4 800DE164 C0C5000C */  lfs     f6, 0xc(r5)
/* 0D8BC8 800DE168 ED2701F2 */  fmuls   f9, f7, f7
/* 0D8BCC 800DE16C C0A50008 */  lfs     f5, 8(r5)
/* 0D8BD0 800DE170 C0250004 */  lfs     f1, 4(r5)
/* 0D8BD4 800DE174 C0050000 */  lfs     f0, 0(r5)
/* 0D8BD8 800DE178 ECA62A7A */  fmadds  f5, f6, f9, f5
/* 0D8BDC 800DE17C EC29097A */  fmadds  f1, f9, f5, f1
/* 0D8BE0 800DE180 EC09007A */  fmadds  f0, f9, f1, f0
/* 0D8BE4 800DE184 ECA70032 */  fmuls   f5, f7, f0
/* 0D8BE8 800DE188 FC00281E */  fctiwz  f0, f5
/* 0D8BEC 800DE18C D8010028 */  stfd    f0, 0x28(r1)
/* 0D8BF0 800DE190 8001002C */  lwz     r0, 0x2c(r1)
/* 0D8BF4 800DE194 6C008000 */  xoris   r0, r0, 0x8000
/* 0D8BF8 800DE198 90010024 */  stw     r0, 0x24(r1)
/* 0D8BFC 800DE19C 90610020 */  stw     r3, 0x20(r1)
/* 0D8C00 800DE1A0 90010014 */  stw     r0, 0x14(r1)
/* 0D8C04 800DE1A4 C8010020 */  lfd     f0, 0x20(r1)
/* 0D8C08 800DE1A8 90610010 */  stw     r3, 0x10(r1)
/* 0D8C0C 800DE1AC EC202028 */  fsubs   f1, f0, f4
/* 0D8C10 800DE1B0 C8010010 */  lfd     f0, 0x10(r1)
/* 0D8C14 800DE1B4 ECA50828 */  fsubs   f5, f5, f1
/* 0D8C18 800DE1B8 EC202028 */  fsubs   f1, f0, f4
/* 0D8C1C 800DE1BC EC054028 */  fsubs   f0, f5, f8
/* 0D8C20 800DE1C0 EC2308BA */  fmadds  f1, f3, f2, f1
/* 0D8C24 800DE1C4 EC21002A */  fadds   f1, f1, f0
/* 0D8C28 800DE1C8 48000040 */  b       lbl_800DE208
lbl_800DE1CC:
/* 0D8C2C 800DE1CC 54C0027F */  clrlwi. r0, r6, 9
/* 0D8C30 800DE1D0 4182000C */  beq     lbl_800DE1DC
/* 0D8C34 800DE1D4 C0210008 */  lfs     f1, 8(r1)
/* 0D8C38 800DE1D8 48000030 */  b       lbl_800DE208
lbl_800DE1DC:
/* 0D8C3C 800DE1DC 54C00001 */  rlwinm. r0, r6, 0, 0, 0
/* 0D8C40 800DE1E0 41820010 */  beq     lbl_800DE1F0
/* 0D8C44 800DE1E4 3C608010 */  lis     r3, __float_nan@ha
/* 0D8C48 800DE1E8 C0232158 */  lfs     f1, __float_nan@l(r3)
/* 0D8C4C 800DE1EC 4800001C */  b       lbl_800DE208
lbl_800DE1F0:
/* 0D8C50 800DE1F0 3C608010 */  lis     r3, __float_huge@ha
/* 0D8C54 800DE1F4 C023215C */  lfs     f1, __float_huge@l(r3)
/* 0D8C58 800DE1F8 48000010 */  b       lbl_800DE208
lbl_800DE1FC:
/* 0D8C5C 800DE1FC 3C608010 */  lis     r3, __float_huge@ha
/* 0D8C60 800DE200 C003215C */  lfs     f0, __float_huge@l(r3)
/* 0D8C64 800DE204 FC200050 */  fneg    f1, f0
lbl_800DE208:
/* 0D8C68 800DE208 38210030 */  addi    r1, r1, 0x30
/* 0D8C6C 800DE20C 4E800020 */  blr     


.section .rodata, "a"

.balign 8

/* 000DC8E0 800DF860 0010 */
_log10_poly:
    .long 0x3F5E5BD9, 0x3E943D64, 0x3E31BC23, 0x3E05DC87


.section .sdata2, "wa"

.balign 8

/* 00100820 80146760 0004 */
D_80146760:
    .float 0.15051500499248505

.balign 4

/* 00100824 80146764 0004 */
D_80146764:
    .float 0.3010300099849701

.balign 4

/* 00100828 80146768 0004 */
D_80146768:
    .float 0.4142135679721832

.balign 4

/* 0010082C 8014676C 0004 */
D_8014676C:
    .float 0.0

.balign 4

/* 00100830 80146770 0004 */
D_80146770:
    .float 1.0

.balign 4

/* 00100834 80146774 0004 */
D_80146774:
    .float 2.0

.balign 8

/* 00100838 80146778 0008 */
D_80146778:
    .double 4503601774854144.0


