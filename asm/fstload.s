# fstload.c
.include "macros.inc"

.section .text, "ax"

.balign 4

cb:
/* 0BC748 800C1CE8 7C0802A6 */  mflr	r0
/* 0BC74C 800C1CEC 2C030000 */  cmpwi	r3, 0
/* 0BC750 800C1CF0 90010004 */  stw		r0, 4(r1)
/* 0BC754 800C1CF4 9421FFE8 */  stwu	r1, -0x18(r1)
/* 0BC758 800C1CF8 93E10014 */  stw		r31, 0x14(r1)
/* 0BC75C 800C1CFC 3BE40000 */  addi	r31, r4, 0
/* 0BC760 800C1D00 4081007C */  ble		lbl_800C1D7C
/* 0BC764 800C1D04 800D9368 */  lwz		r0, status-_SDA_BASE_(r13)
/* 0BC768 800C1D08 2C000001 */  cmpwi	r0, 1
/* 0BC76C 800C1D0C 4182003C */  beq		lbl_800C1D48
/* 0BC770 800C1D10 4080009C */  bge		lbl_800C1DAC
/* 0BC774 800C1D14 2C000000 */  cmpwi	r0, 0
/* 0BC778 800C1D18 40800008 */  bge		lbl_800C1D20
/* 0BC77C 800C1D1C 48000090 */  b		lbl_800C1DAC
lbl_800C1D20:
/* 0BC780 800C1D20 38000001 */  li		r0, 1
/* 0BC784 800C1D24 808D936C */  lwz		r4, bb2-_SDA_BASE_(r13)
/* 0BC788 800C1D28 3C60800C */  lis		r3, cb@ha
/* 0BC78C 800C1D2C 900D9368 */  stw		r0, status-_SDA_BASE_(r13)
/* 0BC790 800C1D30 38E31CE8 */  addi	r7, r3, cb@l
/* 0BC794 800C1D34 387F0000 */  addi	r3, r31, 0
/* 0BC798 800C1D38 38A00020 */  li		r5, 0x20
/* 0BC79C 800C1D3C 38C00420 */  li		r6, 0x420
/* 0BC7A0 800C1D40 4BFFED81 */  bl		DVDReadAbsAsyncForBS
/* 0BC7A4 800C1D44 48000068 */  b		lbl_800C1DAC
lbl_800C1D48:
/* 0BC7A8 800C1D48 38000002 */  li		r0, 2
/* 0BC7AC 800C1D4C 80CD936C */  lwz		r6, bb2-_SDA_BASE_(r13)
/* 0BC7B0 800C1D50 900D9368 */  stw		r0, status-_SDA_BASE_(r13)
/* 0BC7B4 800C1D54 3C60800C */  lis		r3, cb@ha
/* 0BC7B8 800C1D58 38E31CE8 */  addi	r7, r3, cb@l
/* 0BC7BC 800C1D5C 80A60008 */  lwz		r5, 8(r6)
/* 0BC7C0 800C1D60 7FE3FB78 */  mr		r3, r31
/* 0BC7C4 800C1D64 80860010 */  lwz		r4, 0x10(r6)
/* 0BC7C8 800C1D68 3805001F */  addi	r0, r5, 0x1f
/* 0BC7CC 800C1D6C 80C60004 */  lwz		r6, 4(r6)
/* 0BC7D0 800C1D70 54050034 */  rlwinm	r5, r0, 0, 0, 0x1a
/* 0BC7D4 800C1D74 4BFFED4D */  bl		DVDReadAbsAsyncForBS
/* 0BC7D8 800C1D78 48000034 */  b		lbl_800C1DAC
lbl_800C1D7C:
/* 0BC7DC 800C1D7C 2C03FFFF */  cmpwi	r3, -1
/* 0BC7E0 800C1D80 4182002C */  beq		lbl_800C1DAC
/* 0BC7E4 800C1D84 2C03FFFC */  cmpwi	r3, -4
/* 0BC7E8 800C1D88 40820024 */  bne		lbl_800C1DAC
/* 0BC7EC 800C1D8C 38000000 */  li		r0, 0
/* 0BC7F0 800C1D90 900D9368 */  stw		r0, status-_SDA_BASE_(r13)
/* 0BC7F4 800C1D94 4BFFF361 */  bl		DVDReset
/* 0BC7F8 800C1D98 3C60800C */  lis		r3, cb@ha
/* 0BC7FC 800C1D9C 808D9370 */  lwz		r4, idTmp-_SDA_BASE_(r13)
/* 0BC800 800C1DA0 38A31CE8 */  addi	r5, r3, cb@l
/* 0BC804 800C1DA4 387F0000 */  addi	r3, r31, 0
/* 0BC808 800C1DA8 4BFFEDE9 */  bl		DVDReadDiskID
lbl_800C1DAC:
/* 0BC80C 800C1DAC 8001001C */  lwz		r0, 0x1c(r1)
/* 0BC810 800C1DB0 83E10014 */  lwz		r31, 0x14(r1)
/* 0BC814 800C1DB4 38210018 */  addi	r1, r1, 0x18
/* 0BC818 800C1DB8 7C0803A6 */  mtlr	r0
/* 0BC81C 800C1DBC 4E800020 */  blr		

glabel __fstLoad
/* 0BC820 800C1DC0 7C0802A6 */  mflr	r0
/* 0BC824 800C1DC4 3C608010 */  lis		r3, D_80100910@ha
/* 0BC828 800C1DC8 90010004 */  stw		r0, 4(r1)
/* 0BC82C 800C1DCC 9421FFA0 */  stwu	r1, -0x60(r1)
/* 0BC830 800C1DD0 93E1005C */  stw		r31, 0x5c(r1)
/* 0BC834 800C1DD4 3BE30910 */  addi	r31, r3, D_80100910@l
/* 0BC838 800C1DD8 93C10058 */  stw		r30, 0x58(r1)
/* 0BC83C 800C1DDC 93A10054 */  stw		r29, 0x54(r1)
/* 0BC840 800C1DE0 4BFE711D */  bl		OSGetArenaHi
/* 0BC844 800C1DE4 3C608014 */  lis		r3, bb2Buf@ha
/* 0BC848 800C1DE8 38632358 */  addi	r3, r3, bb2Buf@l
/* 0BC84C 800C1DEC 3881002B */  addi	r4, r1, 0x2b
/* 0BC850 800C1DF0 3803001F */  addi	r0, r3, 0x1f
/* 0BC854 800C1DF4 54830034 */  rlwinm	r3, r4, 0, 0, 0x1a
/* 0BC858 800C1DF8 54000034 */  rlwinm	r0, r0, 0, 0, 0x1a
/* 0BC85C 800C1DFC 906D9370 */  stw		r3, idTmp-_SDA_BASE_(r13)
/* 0BC860 800C1E00 900D936C */  stw		r0, bb2-_SDA_BASE_(r13)
/* 0BC864 800C1E04 4BFFF2F1 */  bl		DVDReset
/* 0BC868 800C1E08 3C608014 */  lis		r3, block$18@ha
/* 0BC86C 800C1E0C 808D9370 */  lwz		r4, idTmp-_SDA_BASE_(r13)
/* 0BC870 800C1E10 3CA0800C */  lis		r5, cb@ha
/* 0BC874 800C1E14 38632398 */  addi	r3, r3, block$18@l
/* 0BC878 800C1E18 38A51CE8 */  addi	r5, r5, cb@l
/* 0BC87C 800C1E1C 4BFFED75 */  bl		DVDReadDiskID
lbl_800C1E20:
/* 0BC880 800C1E20 4BFFF365 */  bl		DVDGetDriveStatus
/* 0BC884 800C1E24 2C030000 */  cmpwi	r3, 0
/* 0BC888 800C1E28 4082FFF8 */  bne		lbl_800C1E20
/* 0BC88C 800C1E2C 806D936C */  lwz		r3, bb2-_SDA_BASE_(r13)
/* 0BC890 800C1E30 3FA08000 */  lis		r29, 0x8000
/* 0BC894 800C1E34 3FC08000 */  lis		r30, 0x8000
/* 0BC898 800C1E38 80030010 */  lwz		r0, 0x10(r3)
/* 0BC89C 800C1E3C 387D0000 */  addi	r3, r29, 0
/* 0BC8A0 800C1E40 38A00020 */  li		r5, 0x20
/* 0BC8A4 800C1E44 901E0038 */  stw		r0, 0x38(r30)
/* 0BC8A8 800C1E48 808D936C */  lwz		r4, bb2-_SDA_BASE_(r13)
/* 0BC8AC 800C1E4C 8004000C */  lwz		r0, 0xc(r4)
/* 0BC8B0 800C1E50 901E003C */  stw		r0, 0x3c(r30)
/* 0BC8B4 800C1E54 808D9370 */  lwz		r4, idTmp-_SDA_BASE_(r13)
/* 0BC8B8 800C1E58 4BF4366D */  bl		memcpy
/* 0BC8BC 800C1E5C 386D8DF0 */  addi	r3, r13, D_801457D0-_SDA_BASE_
/* 0BC8C0 800C1E60 4CC63182 */  crclr	6
/* 0BC8C4 800C1E64 4BFE8209 */  bl		OSReport
/* 0BC8C8 800C1E68 889D0000 */  lbz		r4, 0(r29)
/* 0BC8CC 800C1E6C 7FE3FB78 */  mr		r3, r31
/* 0BC8D0 800C1E70 88BD0001 */  lbz		r5, 1(r29)
/* 0BC8D4 800C1E74 4CC63182 */  crclr	6
/* 0BC8D8 800C1E78 88DD0002 */  lbz		r6, 2(r29)
/* 0BC8DC 800C1E7C 88FD0003 */  lbz		r7, 3(r29)
/* 0BC8E0 800C1E80 7C840774 */  extsb	r4, r4
/* 0BC8E4 800C1E84 7CA50774 */  extsb	r5, r5
/* 0BC8E8 800C1E88 7CC60774 */  extsb	r6, r6
/* 0BC8EC 800C1E8C 7CE70774 */  extsb	r7, r7
/* 0BC8F0 800C1E90 4BFE81DD */  bl		OSReport
/* 0BC8F4 800C1E94 889D0004 */  lbz		r4, 4(r29)
/* 0BC8F8 800C1E98 387F001C */  addi	r3, r31, 0x1c
/* 0BC8FC 800C1E9C 88BD0005 */  lbz		r5, 5(r29)
/* 0BC900 800C1EA0 4CC63182 */  crclr	6
/* 0BC904 800C1EA4 7C840774 */  extsb	r4, r4
/* 0BC908 800C1EA8 7CA50774 */  extsb	r5, r5
/* 0BC90C 800C1EAC 4BFE81C1 */  bl		OSReport
/* 0BC910 800C1EB0 889D0006 */  lbz		r4, 6(r29)
/* 0BC914 800C1EB4 387F0034 */  addi	r3, r31, 0x34
/* 0BC918 800C1EB8 4CC63182 */  crclr	6
/* 0BC91C 800C1EBC 4BFE81B1 */  bl		OSReport
/* 0BC920 800C1EC0 889D0007 */  lbz		r4, 7(r29)
/* 0BC924 800C1EC4 387F0048 */  addi	r3, r31, 0x48
/* 0BC928 800C1EC8 4CC63182 */  crclr	6
/* 0BC92C 800C1ECC 4BFE81A1 */  bl		OSReport
/* 0BC930 800C1ED0 881E0008 */  lbz		r0, 8(r30)
/* 0BC934 800C1ED4 28000000 */  cmplwi	r0, 0
/* 0BC938 800C1ED8 4082000C */  bne		lbl_800C1EE4
/* 0BC93C 800C1EDC 388D8DF4 */  addi	r4, r13, D_801457D4-_SDA_BASE_
/* 0BC940 800C1EE0 48000008 */  b		lbl_800C1EE8
lbl_800C1EE4:
/* 0BC944 800C1EE4 388D8DF8 */  addi	r4, r13, D_801457D8-_SDA_BASE_
lbl_800C1EE8:
/* 0BC948 800C1EE8 4CC63182 */  crclr	6
/* 0BC94C 800C1EEC 387F005C */  addi	r3, r31, 0x5c
/* 0BC950 800C1EF0 4BFE817D */  bl		OSReport
/* 0BC954 800C1EF4 386D8DF0 */  addi	r3, r13, D_801457D0-_SDA_BASE_
/* 0BC958 800C1EF8 4CC63182 */  crclr	6
/* 0BC95C 800C1EFC 4BFE8171 */  bl		OSReport
/* 0BC960 800C1F00 806D936C */  lwz		r3, bb2-_SDA_BASE_(r13)
/* 0BC964 800C1F04 80630010 */  lwz		r3, 0x10(r3)
/* 0BC968 800C1F08 4BFE7005 */  bl		OSSetArenaHi
/* 0BC96C 800C1F0C 80010064 */  lwz		r0, 0x64(r1)
/* 0BC970 800C1F10 83E1005C */  lwz		r31, 0x5c(r1)
/* 0BC974 800C1F14 83C10058 */  lwz		r30, 0x58(r1)
/* 0BC978 800C1F18 83A10054 */  lwz		r29, 0x54(r1)
/* 0BC97C 800C1F1C 38210060 */  addi	r1, r1, 0x60
/* 0BC980 800C1F20 7C0803A6 */  mtlr	r0
/* 0BC984 800C1F24 4E800020 */  blr		


.section .data, "wa"

.balign 8

/* 000FD990 80100910 001A */
D_80100910:
    .asciz "  Game Name ... %c%c%c%c\n"

.balign 4

/* 000FD9AC 8010092C 0016 */
D_8010092C:
    .asciz "  Company ..... %c%c\n"

.balign 4

/* 000FD9C4 80100944 0014 */
D_80100944:
    .asciz "  Disk # ...... %d\n"

.balign 4

/* 000FD9D8 80100958 0014 */
D_80100958:
    .asciz "  Game ver .... %d\n"

.balign 4

/* 000FD9EC 8010096C 0014 */
D_8010096C:
    .asciz "  Streaming ... %s\n"


.section .bss, "wa"

.balign 4

/* 0013F3D8 80142358 003F */
bb2Buf:
    .skip 63

.balign 4

/* 0013F418 80142398 0030 */
block$18:
    .skip 48


.section .sdata, "wa"

.balign 8

/* 00100030 801457D0 0002 */
D_801457D0:
    .asciz "\n"

.balign 4

/* 00100034 801457D4 0004 */
D_801457D4:
    .asciz "OFF"

.balign 4

/* 00100038 801457D8 0003 */
D_801457D8:
    .asciz "ON"


.section .sbss, "wa"

.balign 8

/* 001005A8 80145D48 0004 */
status:
    .skip 4

.balign 4

/* 001005AC 80145D4C 0004 */
bb2:
    .skip 4

.balign 4

/* 001005B0 80145D50 0004 */
idTmp:
    .skip 4


