# disk.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel diskEvent
/* 092790 80097D30 7C0802A6 */  mflr    r0
/* 092794 80097D34 2C040003 */  cmpwi   r4, 3
/* 092798 80097D38 90010004 */  stw     r0, 4(r1)
/* 09279C 80097D3C 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0927A0 80097D40 93E1001C */  stw     r31, 0x1c(r1)
/* 0927A4 80097D44 3BE50000 */  addi    r31, r5, 0
/* 0927A8 80097D48 93C10018 */  stw     r30, 0x18(r1)
/* 0927AC 80097D4C 3BC30000 */  addi    r30, r3, 0
/* 0927B0 80097D50 41820160 */  beq     lbl_80097EB0
/* 0927B4 80097D54 40800018 */  bge     lbl_80097D6C
/* 0927B8 80097D58 2C040002 */  cmpwi   r4, 2
/* 0927BC 80097D5C 40800028 */  bge     lbl_80097D84
/* 0927C0 80097D60 2C040000 */  cmpwi   r4, 0
/* 0927C4 80097D64 4080014C */  bge     lbl_80097EB0
/* 0927C8 80097D68 48000140 */  b       lbl_80097EA8
lbl_80097D6C:
/* 0927CC 80097D6C 2C041003 */  cmpwi   r4, 0x1003
/* 0927D0 80097D70 41820140 */  beq     lbl_80097EB0
/* 0927D4 80097D74 40800134 */  bge     lbl_80097EA8
/* 0927D8 80097D78 2C041002 */  cmpwi   r4, 0x1002
/* 0927DC 80097D7C 40800010 */  bge     lbl_80097D8C
/* 0927E0 80097D80 48000128 */  b       lbl_80097EA8
lbl_80097D84:
/* 0927E4 80097D84 93FE0000 */  stw     r31, 0(r30)
/* 0927E8 80097D88 48000128 */  b       lbl_80097EB0
lbl_80097D8C:
/* 0927EC 80097D8C 801F0000 */  lwz     r0, 0(r31)
/* 0927F0 80097D90 2C000001 */  cmpwi   r0, 1
/* 0927F4 80097D94 41820094 */  beq     lbl_80097E28
/* 0927F8 80097D98 40800118 */  bge     lbl_80097EB0
/* 0927FC 80097D9C 2C000000 */  cmpwi   r0, 0
/* 092800 80097DA0 40800008 */  bge     lbl_80097DA8
/* 092804 80097DA4 4800010C */  b       lbl_80097EB0
lbl_80097DA8:
/* 092808 80097DA8 807E0000 */  lwz     r3, 0(r30)
/* 09280C 80097DAC 3CA08009 */  lis     r5, diskPutDrive8@ha
/* 092810 80097DB0 3CC08009 */  lis     r6, diskPutDrive16@ha
/* 092814 80097DB4 3CE08009 */  lis     r7, diskPutDrive32@ha
/* 092818 80097DB8 80630024 */  lwz     r3, 0x24(r3)
/* 09281C 80097DBC 3C808009 */  lis     r4, diskPutDrive64@ha
/* 092820 80097DC0 39047F1C */  addi    r8, r4, diskPutDrive64@l
/* 092824 80097DC4 38A57F58 */  addi    r5, r5, diskPutDrive8@l
/* 092828 80097DC8 38C67F50 */  addi    r6, r6, diskPutDrive16@l
/* 09282C 80097DCC 38E77F24 */  addi    r7, r7, diskPutDrive32@l
/* 092830 80097DD0 389F0000 */  addi    r4, r31, 0
/* 092834 80097DD4 4BF9D14D */  bl      cpuSetDevicePut
/* 092838 80097DD8 2C030000 */  cmpwi   r3, 0
/* 09283C 80097DDC 4082000C */  bne     lbl_80097DE8
/* 092840 80097DE0 38600000 */  li      r3, 0
/* 092844 80097DE4 480000D0 */  b       lbl_80097EB4
lbl_80097DE8:
/* 092848 80097DE8 807E0000 */  lwz     r3, 0(r30)
/* 09284C 80097DEC 3CA08009 */  lis     r5, diskGetDrive8@ha
/* 092850 80097DF0 3CC08009 */  lis     r6, diskGetDrive16@ha
/* 092854 80097DF4 3CE08009 */  lis     r7, diskGetDrive32@ha
/* 092858 80097DF8 80630024 */  lwz     r3, 0x24(r3)
/* 09285C 80097DFC 3C808009 */  lis     r4, diskGetDrive64@ha
/* 092860 80097E00 39047ECC */  addi    r8, r4, diskGetDrive64@l
/* 092864 80097E04 38A57F14 */  addi    r5, r5, diskGetDrive8@l
/* 092868 80097E08 38C67F0C */  addi    r6, r6, diskGetDrive16@l
/* 09286C 80097E0C 38E77ED4 */  addi    r7, r7, diskGetDrive32@l
/* 092870 80097E10 389F0000 */  addi    r4, r31, 0
/* 092874 80097E14 4BF9D125 */  bl      cpuSetDeviceGet
/* 092878 80097E18 2C030000 */  cmpwi   r3, 0
/* 09287C 80097E1C 40820094 */  bne     lbl_80097EB0
/* 092880 80097E20 38600000 */  li      r3, 0
/* 092884 80097E24 48000090 */  b       lbl_80097EB4
lbl_80097E28:
/* 092888 80097E28 807E0000 */  lwz     r3, 0(r30)
/* 09288C 80097E2C 3CA08009 */  lis     r5, diskPutROM8@ha
/* 092890 80097E30 3CC08009 */  lis     r6, diskPutROM16@ha
/* 092894 80097E34 3CE08009 */  lis     r7, diskPutROM32@ha
/* 092898 80097E38 80630024 */  lwz     r3, 0x24(r3)
/* 09289C 80097E3C 3C808009 */  lis     r4, diskPutROM64@ha
/* 0928A0 80097E40 39047FA4 */  addi    r8, r4, diskPutROM64@l
/* 0928A4 80097E44 38A57FBC */  addi    r5, r5, diskPutROM8@l
/* 0928A8 80097E48 38C67FB4 */  addi    r6, r6, diskPutROM16@l
/* 0928AC 80097E4C 38E77FAC */  addi    r7, r7, diskPutROM32@l
/* 0928B0 80097E50 389F0000 */  addi    r4, r31, 0
/* 0928B4 80097E54 4BF9D0CD */  bl      cpuSetDevicePut
/* 0928B8 80097E58 2C030000 */  cmpwi   r3, 0
/* 0928BC 80097E5C 4082000C */  bne     lbl_80097E68
/* 0928C0 80097E60 38600000 */  li      r3, 0
/* 0928C4 80097E64 48000050 */  b       lbl_80097EB4
lbl_80097E68:
/* 0928C8 80097E68 807E0000 */  lwz     r3, 0(r30)
/* 0928CC 80097E6C 3CA08009 */  lis     r5, diskGetROM8@ha
/* 0928D0 80097E70 3CC08009 */  lis     r6, diskGetROM16@ha
/* 0928D4 80097E74 3CE08009 */  lis     r7, diskGetROM32@ha
/* 0928D8 80097E78 80630024 */  lwz     r3, 0x24(r3)
/* 0928DC 80097E7C 3C808009 */  lis     r4, diskGetROM64@ha
/* 0928E0 80097E80 39047F60 */  addi    r8, r4, diskGetROM64@l
/* 0928E4 80097E84 38A57F94 */  addi    r5, r5, diskGetROM8@l
/* 0928E8 80097E88 38C67F84 */  addi    r6, r6, diskGetROM16@l
/* 0928EC 80097E8C 38E77F74 */  addi    r7, r7, diskGetROM32@l
/* 0928F0 80097E90 389F0000 */  addi    r4, r31, 0
/* 0928F4 80097E94 4BF9D0A5 */  bl      cpuSetDeviceGet
/* 0928F8 80097E98 2C030000 */  cmpwi   r3, 0
/* 0928FC 80097E9C 40820014 */  bne     lbl_80097EB0
/* 092900 80097EA0 38600000 */  li      r3, 0
/* 092904 80097EA4 48000010 */  b       lbl_80097EB4
lbl_80097EA8:
/* 092908 80097EA8 38600000 */  li      r3, 0
/* 09290C 80097EAC 48000008 */  b       lbl_80097EB4
lbl_80097EB0:
/* 092910 80097EB0 38600001 */  li      r3, 1
lbl_80097EB4:
/* 092914 80097EB4 80010024 */  lwz     r0, 0x24(r1)
/* 092918 80097EB8 83E1001C */  lwz     r31, 0x1c(r1)
/* 09291C 80097EBC 83C10018 */  lwz     r30, 0x18(r1)
/* 092920 80097EC0 7C0803A6 */  mtlr    r0
/* 092924 80097EC4 38210020 */  addi    r1, r1, 0x20
/* 092928 80097EC8 4E800020 */  blr     

diskGetDrive64:
/* 09292C 80097ECC 38600001 */  li      r3, 1
/* 092930 80097ED0 4E800020 */  blr     

diskGetDrive32:
/* 092934 80097ED4 5480023E */  clrlwi  r0, r4, 8
/* 092938 80097ED8 2C000510 */  cmpwi   r0, 0x510
/* 09293C 80097EDC 41820020 */  beq     lbl_80097EFC
/* 092940 80097EE0 40800024 */  bge     lbl_80097F04
/* 092944 80097EE4 2C000508 */  cmpwi   r0, 0x508
/* 092948 80097EE8 41820008 */  beq     lbl_80097EF0
/* 09294C 80097EEC 48000018 */  b       lbl_80097F04
lbl_80097EF0:
/* 092950 80097EF0 38000000 */  li      r0, 0
/* 092954 80097EF4 90050000 */  stw     r0, 0(r5)
/* 092958 80097EF8 4800000C */  b       lbl_80097F04
lbl_80097EFC:
/* 09295C 80097EFC 38600000 */  li      r3, 0
/* 092960 80097F00 4E800020 */  blr     
lbl_80097F04:
/* 092964 80097F04 38600001 */  li      r3, 1
/* 092968 80097F08 4E800020 */  blr     

diskGetDrive16:
/* 09296C 80097F0C 38600001 */  li      r3, 1
/* 092970 80097F10 4E800020 */  blr     

diskGetDrive8:
/* 092974 80097F14 38600001 */  li      r3, 1
/* 092978 80097F18 4E800020 */  blr     

diskPutDrive64:
/* 09297C 80097F1C 38600001 */  li      r3, 1
/* 092980 80097F20 4E800020 */  blr     

diskPutDrive32:
/* 092984 80097F24 5480023E */  clrlwi  r0, r4, 8
/* 092988 80097F28 2C000510 */  cmpwi   r0, 0x510
/* 09298C 80097F2C 4182001C */  beq     lbl_80097F48
/* 092990 80097F30 40800018 */  bge     lbl_80097F48
/* 092994 80097F34 2C000508 */  cmpwi   r0, 0x508
/* 092998 80097F38 41820008 */  beq     lbl_80097F40
/* 09299C 80097F3C 4800000C */  b       lbl_80097F48
lbl_80097F40:
/* 0929A0 80097F40 38600000 */  li      r3, 0
/* 0929A4 80097F44 4E800020 */  blr     
lbl_80097F48:
/* 0929A8 80097F48 38600001 */  li      r3, 1
/* 0929AC 80097F4C 4E800020 */  blr     

diskPutDrive16:
/* 0929B0 80097F50 38600001 */  li      r3, 1
/* 0929B4 80097F54 4E800020 */  blr     

diskPutDrive8:
/* 0929B8 80097F58 38600001 */  li      r3, 1
/* 0929BC 80097F5C 4E800020 */  blr     

diskGetROM64:
/* 0929C0 80097F60 38000000 */  li      r0, 0
/* 0929C4 80097F64 90050004 */  stw     r0, 4(r5)
/* 0929C8 80097F68 38600001 */  li      r3, 1
/* 0929CC 80097F6C 90050000 */  stw     r0, 0(r5)
/* 0929D0 80097F70 4E800020 */  blr     

diskGetROM32:
/* 0929D4 80097F74 38000000 */  li      r0, 0
/* 0929D8 80097F78 90050000 */  stw     r0, 0(r5)
/* 0929DC 80097F7C 38600001 */  li      r3, 1
/* 0929E0 80097F80 4E800020 */  blr     

diskGetROM16:
/* 0929E4 80097F84 38000000 */  li      r0, 0
/* 0929E8 80097F88 B0050000 */  sth     r0, 0(r5)
/* 0929EC 80097F8C 38600001 */  li      r3, 1
/* 0929F0 80097F90 4E800020 */  blr     

diskGetROM8:
/* 0929F4 80097F94 38000000 */  li      r0, 0
/* 0929F8 80097F98 98050000 */  stb     r0, 0(r5)
/* 0929FC 80097F9C 38600001 */  li      r3, 1
/* 092A00 80097FA0 4E800020 */  blr     

diskPutROM64:
/* 092A04 80097FA4 38600001 */  li      r3, 1
/* 092A08 80097FA8 4E800020 */  blr     

diskPutROM32:
/* 092A0C 80097FAC 38600001 */  li      r3, 1
/* 092A10 80097FB0 4E800020 */  blr     

diskPutROM16:
/* 092A14 80097FB4 38600001 */  li      r3, 1
/* 092A18 80097FB8 4E800020 */  blr     

diskPutROM8:
/* 092A1C 80097FBC 38600001 */  li      r3, 1
/* 092A20 80097FC0 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000F90C0 800FC040 0010 */
glabel gClassDisk
    .long D_801455A0, 0x00000004, 0x00000000, diskEvent


.section .sdata, "wa"

.balign 8

/* 000FFE00 801455A0 0005 */
D_801455A0:
    .asciz "DISK"


