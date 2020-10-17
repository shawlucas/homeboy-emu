# mtx44.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel C_MTXPerspective
/* 0AE4EC 800B3A8C 7C0802A6 */  mflr    r0
/* 0AE4F0 800B3A90 90010004 */  stw     r0, 4(r1)
/* 0AE4F4 800B3A94 9421FFC0 */  stwu    r1, -0x40(r1)
/* 0AE4F8 800B3A98 DBE10038 */  stfd    f31, 0x38(r1)
/* 0AE4FC 800B3A9C FFE02090 */  fmr     f31, f4
/* 0AE500 800B3AA0 DBC10030 */  stfd    f30, 0x30(r1)
/* 0AE504 800B3AA4 FFC01890 */  fmr     f30, f3
/* 0AE508 800B3AA8 DBA10028 */  stfd    f29, 0x28(r1)
/* 0AE50C 800B3AAC FFA01090 */  fmr     f29, f2
/* 0AE510 800B3AB0 93E10024 */  stw     r31, 0x24(r1)
/* 0AE514 800B3AB4 7C7F1B78 */  mr      r31, r3
/* 0AE518 800B3AB8 C0A284A8 */  lfs     f5, D_80146488-_SDA2_BASE_(r2)
/* 0AE51C 800B3ABC C00284AC */  lfs     f0, D_8014648C-_SDA2_BASE_(r2)
/* 0AE520 800B3AC0 EC250072 */  fmuls   f1, f5, f1
/* 0AE524 800B3AC4 EC200072 */  fmuls   f1, f0, f1
/* 0AE528 800B3AC8 4802A749 */  bl      tanf
/* 0AE52C 800B3ACC C0628498 */  lfs     f3, D_80146478-_SDA2_BASE_(r2)
/* 0AE530 800B3AD0 EC5FF028 */  fsubs   f2, f31, f30
/* 0AE534 800B3AD4 EC1F07B2 */  fmuls   f0, f31, f30
/* 0AE538 800B3AD8 EC830824 */  fdivs   f4, f3, f1
/* 0AE53C 800B3ADC EC24E824 */  fdivs   f1, f4, f29
/* 0AE540 800B3AE0 D03F0000 */  stfs    f1, 0(r31)
/* 0AE544 800B3AE4 EC631024 */  fdivs   f3, f3, f2
/* 0AE548 800B3AE8 C04284A0 */  lfs     f2, D_80146480-_SDA2_BASE_(r2)
/* 0AE54C 800B3AEC D05F0004 */  stfs    f2, 4(r31)
/* 0AE550 800B3AF0 D05F0008 */  stfs    f2, 8(r31)
/* 0AE554 800B3AF4 D05F000C */  stfs    f2, 0xc(r31)
/* 0AE558 800B3AF8 D05F0010 */  stfs    f2, 0x10(r31)
/* 0AE55C 800B3AFC FC20F050 */  fneg    f1, f30
/* 0AE560 800B3B00 FC000050 */  fneg    f0, f0
/* 0AE564 800B3B04 D09F0014 */  stfs    f4, 0x14(r31)
/* 0AE568 800B3B08 EC2100F2 */  fmuls   f1, f1, f3
/* 0AE56C 800B3B0C D05F0018 */  stfs    f2, 0x18(r31)
/* 0AE570 800B3B10 EC030032 */  fmuls   f0, f3, f0
/* 0AE574 800B3B14 D05F001C */  stfs    f2, 0x1c(r31)
/* 0AE578 800B3B18 D05F0020 */  stfs    f2, 0x20(r31)
/* 0AE57C 800B3B1C D05F0024 */  stfs    f2, 0x24(r31)
/* 0AE580 800B3B20 D03F0028 */  stfs    f1, 0x28(r31)
/* 0AE584 800B3B24 D01F002C */  stfs    f0, 0x2c(r31)
/* 0AE588 800B3B28 D05F0030 */  stfs    f2, 0x30(r31)
/* 0AE58C 800B3B2C D05F0034 */  stfs    f2, 0x34(r31)
/* 0AE590 800B3B30 C00284A4 */  lfs     f0, D_80146484-_SDA2_BASE_(r2)
/* 0AE594 800B3B34 D01F0038 */  stfs    f0, 0x38(r31)
/* 0AE598 800B3B38 D05F003C */  stfs    f2, 0x3c(r31)
/* 0AE59C 800B3B3C 80010044 */  lwz     r0, 0x44(r1)
/* 0AE5A0 800B3B40 CBE10038 */  lfd     f31, 0x38(r1)
/* 0AE5A4 800B3B44 CBC10030 */  lfd     f30, 0x30(r1)
/* 0AE5A8 800B3B48 CBA10028 */  lfd     f29, 0x28(r1)
/* 0AE5AC 800B3B4C 83E10024 */  lwz     r31, 0x24(r1)
/* 0AE5B0 800B3B50 38210040 */  addi    r1, r1, 0x40
/* 0AE5B4 800B3B54 7C0803A6 */  mtlr    r0
/* 0AE5B8 800B3B58 4E800020 */  blr     

glabel C_MTXOrtho
/* 0AE5BC 800B3B5C ED041828 */  fsubs   f8, f4, f3
/* 0AE5C0 800B3B60 C1228498 */  lfs     f9, D_80146478-_SDA2_BASE_(r2)
/* 0AE5C4 800B3B64 EC011028 */  fsubs   f0, f1, f2
/* 0AE5C8 800B3B68 C0E2849C */  lfs     f7, D_8014647C-_SDA2_BASE_(r2)
/* 0AE5CC 800B3B6C EC64182A */  fadds   f3, f4, f3
/* 0AE5D0 800B3B70 ED494024 */  fdivs   f10, f9, f8
/* 0AE5D4 800B3B74 ED090024 */  fdivs   f8, f9, f0
/* 0AE5D8 800B3B78 EC8702B2 */  fmuls   f4, f7, f10
/* 0AE5DC 800B3B7C FC601850 */  fneg    f3, f3
/* 0AE5E0 800B3B80 EC062828 */  fsubs   f0, f6, f5
/* 0AE5E4 800B3B84 D0830000 */  stfs    f4, 0(r3)
/* 0AE5E8 800B3B88 EC21102A */  fadds   f1, f1, f2
/* 0AE5EC 800B3B8C EC4A00F2 */  fmuls   f2, f10, f3
/* 0AE5F0 800B3B90 C06284A0 */  lfs     f3, D_80146480-_SDA2_BASE_(r2)
/* 0AE5F4 800B3B94 FC200850 */  fneg    f1, f1
/* 0AE5F8 800B3B98 D0630004 */  stfs    f3, 4(r3)
/* 0AE5FC 800B3B9C EC890024 */  fdivs   f4, f9, f0
/* 0AE600 800B3BA0 D0630008 */  stfs    f3, 8(r3)
/* 0AE604 800B3BA4 D043000C */  stfs    f2, 0xc(r3)
/* 0AE608 800B3BA8 D0630010 */  stfs    f3, 0x10(r3)
/* 0AE60C 800B3BAC EC470232 */  fmuls   f2, f7, f8
/* 0AE610 800B3BB0 FC003050 */  fneg    f0, f6
/* 0AE614 800B3BB4 EC280072 */  fmuls   f1, f8, f1
/* 0AE618 800B3BB8 D0430014 */  stfs    f2, 0x14(r3)
/* 0AE61C 800B3BBC EC000132 */  fmuls   f0, f0, f4
/* 0AE620 800B3BC0 D0630018 */  stfs    f3, 0x18(r3)
/* 0AE624 800B3BC4 D023001C */  stfs    f1, 0x1c(r3)
/* 0AE628 800B3BC8 D0630020 */  stfs    f3, 0x20(r3)
/* 0AE62C 800B3BCC D0630024 */  stfs    f3, 0x24(r3)
/* 0AE630 800B3BD0 C02284A4 */  lfs     f1, D_80146484-_SDA2_BASE_(r2)
/* 0AE634 800B3BD4 EC210132 */  fmuls   f1, f1, f4
/* 0AE638 800B3BD8 D0230028 */  stfs    f1, 0x28(r3)
/* 0AE63C 800B3BDC D003002C */  stfs    f0, 0x2c(r3)
/* 0AE640 800B3BE0 D0630030 */  stfs    f3, 0x30(r3)
/* 0AE644 800B3BE4 D0630034 */  stfs    f3, 0x34(r3)
/* 0AE648 800B3BE8 D0630038 */  stfs    f3, 0x38(r3)
/* 0AE64C 800B3BEC D123003C */  stfs    f9, 0x3c(r3)
/* 0AE650 800B3BF0 4E800020 */  blr     

glabel PSMTX44Concat
/* 0AE654 800B3BF4 E0030000 */  psq_l   f0, 0(r3), 0, qr0
/* 0AE658 800B3BF8 E0440000 */  psq_l   f2, 0(r4), 0, qr0
/* 0AE65C 800B3BFC 10C20018 */  ps_muls0    f6, f2, f0
/* 0AE660 800B3C00 E0640010 */  psq_l   f3, 16(r4), 0, qr0
/* 0AE664 800B3C04 E0840020 */  psq_l   f4, 32(r4), 0, qr0
/* 0AE668 800B3C08 10C3301E */  ps_madds1   f6, f3, f0, f6
/* 0AE66C 800B3C0C E0230008 */  psq_l   f1, 8(r3), 0, qr0
/* 0AE670 800B3C10 E0A40030 */  psq_l   f5, 48(r4), 0, qr0
/* 0AE674 800B3C14 10C4305C */  ps_madds0   f6, f4, f1, f6
/* 0AE678 800B3C18 E0030010 */  psq_l   f0, 16(r3), 0, qr0
/* 0AE67C 800B3C1C 10C5305E */  ps_madds1   f6, f5, f1, f6
/* 0AE680 800B3C20 E0230018 */  psq_l   f1, 24(r3), 0, qr0
/* 0AE684 800B3C24 11020018 */  ps_muls0    f8, f2, f0
/* 0AE688 800B3C28 1103401E */  ps_madds1   f8, f3, f0, f8
/* 0AE68C 800B3C2C E0030020 */  psq_l   f0, 32(r3), 0, qr0
/* 0AE690 800B3C30 1104405C */  ps_madds0   f8, f4, f1, f8
/* 0AE694 800B3C34 1105405E */  ps_madds1   f8, f5, f1, f8
/* 0AE698 800B3C38 E0230028 */  psq_l   f1, 40(r3), 0, qr0
/* 0AE69C 800B3C3C 11420018 */  ps_muls0    f10, f2, f0
/* 0AE6A0 800B3C40 1143501E */  ps_madds1   f10, f3, f0, f10
/* 0AE6A4 800B3C44 E0030030 */  psq_l   f0, 48(r3), 0, qr0
/* 0AE6A8 800B3C48 1144505C */  ps_madds0   f10, f4, f1, f10
/* 0AE6AC 800B3C4C 1145505E */  ps_madds1   f10, f5, f1, f10
/* 0AE6B0 800B3C50 E0230038 */  psq_l   f1, 56(r3), 0, qr0
/* 0AE6B4 800B3C54 11820018 */  ps_muls0    f12, f2, f0
/* 0AE6B8 800B3C58 E0440008 */  psq_l   f2, 8(r4), 0, qr0
/* 0AE6BC 800B3C5C 1183601E */  ps_madds1   f12, f3, f0, f12
/* 0AE6C0 800B3C60 E0030000 */  psq_l   f0, 0(r3), 0, qr0
/* 0AE6C4 800B3C64 1184605C */  ps_madds0   f12, f4, f1, f12
/* 0AE6C8 800B3C68 E0640018 */  psq_l   f3, 24(r4), 0, qr0
/* 0AE6CC 800B3C6C 1185605E */  ps_madds1   f12, f5, f1, f12
/* 0AE6D0 800B3C70 E0230008 */  psq_l   f1, 8(r3), 0, qr0
/* 0AE6D4 800B3C74 10E20018 */  ps_muls0    f7, f2, f0
/* 0AE6D8 800B3C78 E0840028 */  psq_l   f4, 40(r4), 0, qr0
/* 0AE6DC 800B3C7C 10E3381E */  ps_madds1   f7, f3, f0, f7
/* 0AE6E0 800B3C80 E0A40038 */  psq_l   f5, 56(r4), 0, qr0
/* 0AE6E4 800B3C84 10E4385C */  ps_madds0   f7, f4, f1, f7
/* 0AE6E8 800B3C88 E0030010 */  psq_l   f0, 16(r3), 0, qr0
/* 0AE6EC 800B3C8C 10E5385E */  ps_madds1   f7, f5, f1, f7
/* 0AE6F0 800B3C90 E0230018 */  psq_l   f1, 24(r3), 0, qr0
/* 0AE6F4 800B3C94 11220018 */  ps_muls0    f9, f2, f0
/* 0AE6F8 800B3C98 F0C50000 */  psq_st  f6, 0(r5), 0, qr0
/* 0AE6FC 800B3C9C 1123481E */  ps_madds1   f9, f3, f0, f9
/* 0AE700 800B3CA0 E0030020 */  psq_l   f0, 32(r3), 0, qr0
/* 0AE704 800B3CA4 1124485C */  ps_madds0   f9, f4, f1, f9
/* 0AE708 800B3CA8 F1050010 */  psq_st  f8, 16(r5), 0, qr0
/* 0AE70C 800B3CAC 1125485E */  ps_madds1   f9, f5, f1, f9
/* 0AE710 800B3CB0 E0230028 */  psq_l   f1, 40(r3), 0, qr0
/* 0AE714 800B3CB4 11620018 */  ps_muls0    f11, f2, f0
/* 0AE718 800B3CB8 F1450020 */  psq_st  f10, 32(r5), 0, qr0
/* 0AE71C 800B3CBC 1163581E */  ps_madds1   f11, f3, f0, f11
/* 0AE720 800B3CC0 E0030030 */  psq_l   f0, 48(r3), 0, qr0
/* 0AE724 800B3CC4 1164585C */  ps_madds0   f11, f4, f1, f11
/* 0AE728 800B3CC8 F1850030 */  psq_st  f12, 48(r5), 0, qr0
/* 0AE72C 800B3CCC 1165585E */  ps_madds1   f11, f5, f1, f11
/* 0AE730 800B3CD0 E0230038 */  psq_l   f1, 56(r3), 0, qr0
/* 0AE734 800B3CD4 11A20018 */  ps_muls0    f13, f2, f0
/* 0AE738 800B3CD8 F0E50008 */  psq_st  f7, 8(r5), 0, qr0
/* 0AE73C 800B3CDC 11A3681E */  ps_madds1   f13, f3, f0, f13
/* 0AE740 800B3CE0 F1250018 */  psq_st  f9, 24(r5), 0, qr0
/* 0AE744 800B3CE4 11A4685C */  ps_madds0   f13, f4, f1, f13
/* 0AE748 800B3CE8 F1650028 */  psq_st  f11, 40(r5), 0, qr0
/* 0AE74C 800B3CEC 11A5685E */  ps_madds1   f13, f5, f1, f13
/* 0AE750 800B3CF0 F1A50038 */  psq_st  f13, 56(r5), 0, qr0
/* 0AE754 800B3CF4 4E800020 */  blr     


.section .sdata2, "wa"

.balign 8

/* 00100538 80146478 0004 */
D_80146478:
    .float 1.0

.balign 4

/* 0010053C 8014647C 0004 */
D_8014647C:
    .float 2.0

.balign 4

/* 00100540 80146480 0004 */
D_80146480:
    .float 0.0

.balign 4

/* 00100544 80146484 0004 */
D_80146484:
    .float -1.0

.balign 4

/* 00100548 80146488 0004 */
D_80146488:
    .float 0.5

.balign 4

/* 0010054C 8014648C 0004 */
D_8014648C:
    .float 0.01745329238474369


