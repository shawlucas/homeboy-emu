# xlFileGCN.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel xlFileEvent
/* 0007E0 80005D80 7C0802A6 */  mflr    r0
/* 0007E4 80005D84 2C040003 */  cmpwi   r4, 3
/* 0007E8 80005D88 90010004 */  stw     r0, 4(r1)
/* 0007EC 80005D8C 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0007F0 80005D90 93E1001C */  stw     r31, 0x1c(r1)
/* 0007F4 80005D94 3BE30000 */  addi    r31, r3, 0
/* 0007F8 80005D98 4182005C */  beq     lbl_80005DF4
/* 0007FC 80005D9C 40800018 */  bge     lbl_80005DB4
/* 000800 80005DA0 2C040002 */  cmpwi   r4, 2
/* 000804 80005DA4 4080001C */  bge     lbl_80005DC0
/* 000808 80005DA8 2C040000 */  cmpwi   r4, 0
/* 00080C 80005DAC 40800094 */  bge     lbl_80005E40
/* 000810 80005DB0 48000088 */  b       lbl_80005E38
lbl_80005DB4:
/* 000814 80005DB4 2C040005 */  cmpwi   r4, 5
/* 000818 80005DB8 40800080 */  bge     lbl_80005E38
/* 00081C 80005DBC 48000084 */  b       lbl_80005E40
lbl_80005DC0:
/* 000820 80005DC0 38000000 */  li      r0, 0
/* 000824 80005DC4 901F0010 */  stw     r0, 0x10(r31)
/* 000828 80005DC8 3C803000 */  lis     r4, 0x3000
/* 00082C 80005DCC 387F0008 */  addi    r3, r31, 8
/* 000830 80005DD0 901F0014 */  stw     r0, 0x14(r31)
/* 000834 80005DD4 38841024 */  addi    r4, r4, 0x1024
/* 000838 80005DD8 901F0000 */  stw     r0, 0(r31)
/* 00083C 80005DDC 901F0004 */  stw     r0, 4(r31)
/* 000840 80005DE0 48001305 */  bl      xlHeapTake
/* 000844 80005DE4 2C030000 */  cmpwi   r3, 0
/* 000848 80005DE8 40820058 */  bne     lbl_80005E40
/* 00084C 80005DEC 38600000 */  li      r3, 0
/* 000850 80005DF0 48000054 */  b       lbl_80005E44
lbl_80005DF4:
/* 000854 80005DF4 801F0004 */  lwz     r0, 4(r31)
/* 000858 80005DF8 28000000 */  cmplwi  r0, 0
/* 00085C 80005DFC 4182001C */  beq     lbl_80005E18
/* 000860 80005E00 387F0004 */  addi    r3, r31, 4
/* 000864 80005E04 480011C5 */  bl      xlHeapFree
/* 000868 80005E08 2C030000 */  cmpwi   r3, 0
/* 00086C 80005E0C 4082000C */  bne     lbl_80005E18
/* 000870 80005E10 38600000 */  li      r3, 0
/* 000874 80005E14 48000030 */  b       lbl_80005E44
lbl_80005E18:
/* 000878 80005E18 387F0024 */  addi    r3, r31, 0x24
/* 00087C 80005E1C 480B87FD */  bl      DVDClose
/* 000880 80005E20 387F0008 */  addi    r3, r31, 8
/* 000884 80005E24 480011A5 */  bl      xlHeapFree
/* 000888 80005E28 2C030000 */  cmpwi   r3, 0
/* 00088C 80005E2C 40820014 */  bne     lbl_80005E40
/* 000890 80005E30 38600000 */  li      r3, 0
/* 000894 80005E34 48000010 */  b       lbl_80005E44
lbl_80005E38:
/* 000898 80005E38 38600000 */  li      r3, 0
/* 00089C 80005E3C 48000008 */  b       lbl_80005E44
lbl_80005E40:
/* 0008A0 80005E40 38600001 */  li      r3, 1
lbl_80005E44:
/* 0008A4 80005E44 80010024 */  lwz     r0, 0x24(r1)
/* 0008A8 80005E48 83E1001C */  lwz     r31, 0x1c(r1)
/* 0008AC 80005E4C 38210020 */  addi    r1, r1, 0x20
/* 0008B0 80005E50 7C0803A6 */  mtlr    r0
/* 0008B4 80005E54 4E800020 */  blr     

glabel xlFileGetPosition
/* 0008B8 80005E58 28040000 */  cmplwi  r4, 0
/* 0008BC 80005E5C 4182000C */  beq     lbl_80005E68
/* 0008C0 80005E60 80030014 */  lwz     r0, 0x14(r3)
/* 0008C4 80005E64 90040000 */  stw     r0, 0(r4)
lbl_80005E68:
/* 0008C8 80005E68 38600001 */  li      r3, 1
/* 0008CC 80005E6C 4E800020 */  blr     

glabel xlFileSetPosition
/* 0008D0 80005E70 2C040000 */  cmpwi   r4, 0
/* 0008D4 80005E74 4180001C */  blt     lbl_80005E90
/* 0008D8 80005E78 80030010 */  lwz     r0, 0x10(r3)
/* 0008DC 80005E7C 7C040000 */  cmpw    r4, r0
/* 0008E0 80005E80 40800010 */  bge     lbl_80005E90
/* 0008E4 80005E84 90830014 */  stw     r4, 0x14(r3)
/* 0008E8 80005E88 38600001 */  li      r3, 1
/* 0008EC 80005E8C 4E800020 */  blr     
lbl_80005E90:
/* 0008F0 80005E90 38600000 */  li      r3, 0
/* 0008F4 80005E94 4E800020 */  blr     

glabel xlFileGet
/* 0008F8 80005E98 7C0802A6 */  mflr    r0
/* 0008FC 80005E9C 90010004 */  stw     r0, 4(r1)
/* 000900 80005EA0 9421FFD0 */  stwu    r1, -0x30(r1)
/* 000904 80005EA4 BF61001C */  stmw    r27, 0x1c(r1)
/* 000908 80005EA8 7C7B1B78 */  mr      r27, r3
/* 00090C 80005EAC 7CBD2B78 */  mr      r29, r5
/* 000910 80005EB0 3B840000 */  addi    r28, r4, 0
/* 000914 80005EB4 80630014 */  lwz     r3, 0x14(r3)
/* 000918 80005EB8 80BB0010 */  lwz     r5, 0x10(r27)
/* 00091C 80005EBC 7C03EA14 */  add     r0, r3, r29
/* 000920 80005EC0 7C002800 */  cmpw    r0, r5
/* 000924 80005EC4 40810008 */  ble     lbl_80005ECC
/* 000928 80005EC8 7FA32850 */  subf    r29, r3, r5
lbl_80005ECC:
/* 00092C 80005ECC 2C1D0000 */  cmpwi   r29, 0
/* 000930 80005ED0 408200AC */  bne     lbl_80005F7C
/* 000934 80005ED4 3800FFFF */  li      r0, -1
/* 000938 80005ED8 981C0000 */  stb     r0, 0(r28)
/* 00093C 80005EDC 38600000 */  li      r3, 0
/* 000940 80005EE0 480000A8 */  b       lbl_80005F88
/* 000944 80005EE4 48000098 */  b       lbl_80005F7C
lbl_80005EE8:
/* 000948 80005EE8 3BDD0000 */  addi    r30, r29, 0
/* 00094C 80005EEC 2C1E1000 */  cmpwi   r30, 0x1000
/* 000950 80005EF0 40810008 */  ble     lbl_80005EF8
/* 000954 80005EF4 3BC01000 */  li      r30, 0x1000
lbl_80005EF8:
/* 000958 80005EF8 807B0014 */  lwz     r3, 0x14(r27)
/* 00095C 80005EFC 818D8E84 */  lwz     r12, gpfRead-_SDA_BASE_(r13)
/* 000960 80005F00 547F07BE */  clrlwi  r31, r3, 0x1e
/* 000964 80005F04 381F001F */  addi    r0, r31, 0x1f
/* 000968 80005F08 7C1E0214 */  add     r0, r30, r0
/* 00096C 80005F0C 280C0000 */  cmplwi  r12, 0
/* 000970 80005F10 5466003A */  rlwinm  r6, r3, 0, 0, 0x1d
/* 000974 80005F14 54050034 */  rlwinm  r5, r0, 0, 0, 0x1a
/* 000978 80005F18 4182001C */  beq     lbl_80005F34
/* 00097C 80005F1C 807B0000 */  lwz     r3, 0(r27)
/* 000980 80005F20 7D8803A6 */  mtlr    r12
/* 000984 80005F24 809B0008 */  lwz     r4, 8(r27)
/* 000988 80005F28 38E00000 */  li      r7, 0
/* 00098C 80005F2C 4E800021 */  blrl    
/* 000990 80005F30 48000014 */  b       lbl_80005F44
lbl_80005F34:
/* 000994 80005F34 807B0000 */  lwz     r3, 0(r27)
/* 000998 80005F38 38E00002 */  li      r7, 2
/* 00099C 80005F3C 809B0008 */  lwz     r4, 8(r27)
/* 0009A0 80005F40 480B8A11 */  bl      DVDReadPrio
lbl_80005F44:
/* 0009A4 80005F44 801B0008 */  lwz     r0, 8(r27)
/* 0009A8 80005F48 387C0000 */  addi    r3, r28, 0
/* 0009AC 80005F4C 38BE0000 */  addi    r5, r30, 0
/* 0009B0 80005F50 7C80FA14 */  add     r4, r0, r31
/* 0009B4 80005F54 48000ACD */  bl      xlHeapCopy
/* 0009B8 80005F58 2C030000 */  cmpwi   r3, 0
/* 0009BC 80005F5C 4082000C */  bne     lbl_80005F68
/* 0009C0 80005F60 38600000 */  li      r3, 0
/* 0009C4 80005F64 48000024 */  b       lbl_80005F88
lbl_80005F68:
/* 0009C8 80005F68 801B0014 */  lwz     r0, 0x14(r27)
/* 0009CC 80005F6C 7F9CF214 */  add     r28, r28, r30
/* 0009D0 80005F70 7FBEE850 */  subf    r29, r30, r29
/* 0009D4 80005F74 7C00F214 */  add     r0, r0, r30
/* 0009D8 80005F78 901B0014 */  stw     r0, 0x14(r27)
lbl_80005F7C:
/* 0009DC 80005F7C 2C1D0000 */  cmpwi   r29, 0
/* 0009E0 80005F80 4082FF68 */  bne     lbl_80005EE8
/* 0009E4 80005F84 38600001 */  li      r3, 1
lbl_80005F88:
/* 0009E8 80005F88 BB61001C */  lmw     r27, 0x1c(r1)
/* 0009EC 80005F8C 80010034 */  lwz     r0, 0x34(r1)
/* 0009F0 80005F90 38210030 */  addi    r1, r1, 0x30
/* 0009F4 80005F94 7C0803A6 */  mtlr    r0
/* 0009F8 80005F98 4E800020 */  blr     

glabel xlFileClose
/* 0009FC 80005F9C 7C0802A6 */  mflr    r0
/* 000A00 80005FA0 90010004 */  stw     r0, 4(r1)
/* 000A04 80005FA4 9421FFF8 */  stwu    r1, -8(r1)
/* 000A08 80005FA8 480023CD */  bl      xlObjectFree
/* 000A0C 80005FAC 2C030000 */  cmpwi   r3, 0
/* 000A10 80005FB0 4082000C */  bne     lbl_80005FBC
/* 000A14 80005FB4 38600000 */  li      r3, 0
/* 000A18 80005FB8 48000008 */  b       lbl_80005FC0
lbl_80005FBC:
/* 000A1C 80005FBC 38600001 */  li      r3, 1
lbl_80005FC0:
/* 000A20 80005FC0 8001000C */  lwz     r0, 0xc(r1)
/* 000A24 80005FC4 38210008 */  addi    r1, r1, 8
/* 000A28 80005FC8 7C0803A6 */  mtlr    r0
/* 000A2C 80005FCC 4E800020 */  blr     

glabel xlFileOpen
/* 000A30 80005FD0 7C0802A6 */  mflr    r0
/* 000A34 80005FD4 3CC0800E */  lis     r6, gTypeFile@ha
/* 000A38 80005FD8 90010004 */  stw     r0, 4(r1)
/* 000A3C 80005FDC 38067940 */  addi    r0, r6, gTypeFile@l
/* 000A40 80005FE0 9421FFD8 */  stwu    r1, -0x28(r1)
/* 000A44 80005FE4 93E10024 */  stw     r31, 0x24(r1)
/* 000A48 80005FE8 3BE50000 */  addi    r31, r5, 0
/* 000A4C 80005FEC 7C050378 */  mr      r5, r0
/* 000A50 80005FF0 93C10020 */  stw     r30, 0x20(r1)
/* 000A54 80005FF4 3BC40000 */  addi    r30, r4, 0
/* 000A58 80005FF8 38800000 */  li      r4, 0
/* 000A5C 80005FFC 93A1001C */  stw     r29, 0x1c(r1)
/* 000A60 80006000 3BA30000 */  addi    r29, r3, 0
/* 000A64 80006004 48002409 */  bl      xlObjectMake
/* 000A68 80006008 2C030000 */  cmpwi   r3, 0
/* 000A6C 8000600C 4082000C */  bne     lbl_80006018
/* 000A70 80006010 38600000 */  li      r3, 0
/* 000A74 80006014 48000074 */  b       lbl_80006088
lbl_80006018:
/* 000A78 80006018 818D8E80 */  lwz     r12, gpfOpen-_SDA_BASE_(r13)
/* 000A7C 8000601C 280C0000 */  cmplwi  r12, 0
/* 000A80 80006020 4182001C */  beq     lbl_8000603C
/* 000A84 80006024 809D0000 */  lwz     r4, 0(r29)
/* 000A88 80006028 7D8803A6 */  mtlr    r12
/* 000A8C 8000602C 387F0000 */  addi    r3, r31, 0
/* 000A90 80006030 38840024 */  addi    r4, r4, 0x24
/* 000A94 80006034 4E800021 */  blrl    
/* 000A98 80006038 48000014 */  b       lbl_8000604C
lbl_8000603C:
/* 000A9C 8000603C 809D0000 */  lwz     r4, 0(r29)
/* 000AA0 80006040 387F0000 */  addi    r3, r31, 0
/* 000AA4 80006044 38840024 */  addi    r4, r4, 0x24
/* 000AA8 80006048 480B8509 */  bl      DVDOpen
lbl_8000604C:
/* 000AAC 8000604C 2C030000 */  cmpwi   r3, 0
/* 000AB0 80006050 4182002C */  beq     lbl_8000607C
/* 000AB4 80006054 809D0000 */  lwz     r4, 0(r29)
/* 000AB8 80006058 38600001 */  li      r3, 1
/* 000ABC 8000605C 93C40018 */  stw     r30, 0x18(r4)
/* 000AC0 80006060 809D0000 */  lwz     r4, 0(r29)
/* 000AC4 80006064 80040058 */  lwz     r0, 0x58(r4)
/* 000AC8 80006068 90040010 */  stw     r0, 0x10(r4)
/* 000ACC 8000606C 809D0000 */  lwz     r4, 0(r29)
/* 000AD0 80006070 38040024 */  addi    r0, r4, 0x24
/* 000AD4 80006074 90040000 */  stw     r0, 0(r4)
/* 000AD8 80006078 48000010 */  b       lbl_80006088
lbl_8000607C:
/* 000ADC 8000607C 7FA3EB78 */  mr      r3, r29
/* 000AE0 80006080 480022F5 */  bl      xlObjectFree
/* 000AE4 80006084 38600000 */  li      r3, 0
lbl_80006088:
/* 000AE8 80006088 8001002C */  lwz     r0, 0x2c(r1)
/* 000AEC 8000608C 83E10024 */  lwz     r31, 0x24(r1)
/* 000AF0 80006090 83C10020 */  lwz     r30, 0x20(r1)
/* 000AF4 80006094 7C0803A6 */  mtlr    r0
/* 000AF8 80006098 83A1001C */  lwz     r29, 0x1c(r1)
/* 000AFC 8000609C 38210028 */  addi    r1, r1, 0x28
/* 000B00 800060A0 4E800020 */  blr     

glabel xlFileSetRead
/* 000B04 800060A4 906D8E84 */  stw     r3, gpfRead-_SDA_BASE_(r13)
/* 000B08 800060A8 38600001 */  li      r3, 1
/* 000B0C 800060AC 4E800020 */  blr     

glabel xlFileSetOpen
/* 000B10 800060B0 906D8E80 */  stw     r3, gpfOpen-_SDA_BASE_(r13)
/* 000B14 800060B4 38600001 */  li      r3, 1
/* 000B18 800060B8 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000E49C0 800E7940 0010 */
glabel gTypeFile
    .long D_801449E0, 0x00000060, 0x00000000, xlFileEvent


.section .sdata, "wa"

.balign 8

/* 000FF240 801449E0 0005 */
D_801449E0:
    .asciz "FILE"


.section .sbss, "wa"

.balign 8

/* 001000C0 80145860 0004 */
gpfOpen:
    .skip 4

.balign 4

/* 001000C4 80145864 0004 */
gpfRead:
    .skip 4


