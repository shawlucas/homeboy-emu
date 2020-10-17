# CARDDelete.c
.include "macros.inc"

.section .text, "ax"

.balign 4

DeleteCallback:
/* 0C7A7C 800CD01C 7C0802A6 */  mflr	r0
/* 0C7A80 800CD020 90010004 */  stw		r0, 4(r1)
/* 0C7A84 800CD024 9421FFE0 */  stwu	r1, -0x20(r1)
/* 0C7A88 800CD028 93E1001C */  stw		r31, 0x1c(r1)
/* 0C7A8C 800CD02C 93C10018 */  stw		r30, 0x18(r1)
/* 0C7A90 800CD030 93A10014 */  stw		r29, 0x14(r1)
/* 0C7A94 800CD034 7C9D2379 */  or.		r29, r4, r4
/* 0C7A98 800CD038 93810010 */  stw		r28, 0x10(r1)
/* 0C7A9C 800CD03C 3B830000 */  addi	r28, r3, 0
/* 0C7AA0 800CD040 1CBC0110 */  mulli	r5, r28, 0x110
/* 0C7AA4 800CD044 3C608014 */  lis		r3, __CARDBlock@ha
/* 0C7AA8 800CD048 380324D0 */  addi	r0, r3, __CARDBlock@l
/* 0C7AAC 800CD04C 7FE02A14 */  add		r31, r0, r5
/* 0C7AB0 800CD050 83DF00D0 */  lwz		r30, 0xd0(r31)
/* 0C7AB4 800CD054 38000000 */  li		r0, 0
/* 0C7AB8 800CD058 901F00D0 */  stw		r0, 0xd0(r31)
/* 0C7ABC 800CD05C 4180001C */  blt		lbl_800CD078
/* 0C7AC0 800CD060 A09F00BE */  lhz		r4, 0xbe(r31)
/* 0C7AC4 800CD064 387C0000 */  addi	r3, r28, 0
/* 0C7AC8 800CD068 38BE0000 */  addi	r5, r30, 0
/* 0C7ACC 800CD06C 4BFFC915 */  bl		__CARDFreeBlock
/* 0C7AD0 800CD070 7C7D1B79 */  or.		r29, r3, r3
/* 0C7AD4 800CD074 4080002C */  bge		lbl_800CD0A0
lbl_800CD078:
/* 0C7AD8 800CD078 387F0000 */  addi	r3, r31, 0
/* 0C7ADC 800CD07C 389D0000 */  addi	r4, r29, 0
/* 0C7AE0 800CD080 4BFFAE81 */  bl		__CARDPutControlBlock
/* 0C7AE4 800CD084 281E0000 */  cmplwi	r30, 0
/* 0C7AE8 800CD088 41820018 */  beq		lbl_800CD0A0
/* 0C7AEC 800CD08C 399E0000 */  addi	r12, r30, 0
/* 0C7AF0 800CD090 7D8803A6 */  mtlr	r12
/* 0C7AF4 800CD094 387C0000 */  addi	r3, r28, 0
/* 0C7AF8 800CD098 389D0000 */  addi	r4, r29, 0
/* 0C7AFC 800CD09C 4E800021 */  blrl	
lbl_800CD0A0:
/* 0C7B00 800CD0A0 80010024 */  lwz		r0, 0x24(r1)
/* 0C7B04 800CD0A4 83E1001C */  lwz		r31, 0x1c(r1)
/* 0C7B08 800CD0A8 83C10018 */  lwz		r30, 0x18(r1)
/* 0C7B0C 800CD0AC 83A10014 */  lwz		r29, 0x14(r1)
/* 0C7B10 800CD0B0 83810010 */  lwz		r28, 0x10(r1)
/* 0C7B14 800CD0B4 38210020 */  addi	r1, r1, 0x20
/* 0C7B18 800CD0B8 7C0803A6 */  mtlr	r0
/* 0C7B1C 800CD0BC 4E800020 */  blr		

glabel CARDDeleteAsync
/* 0C7B20 800CD0C0 7C0802A6 */  mflr	r0
/* 0C7B24 800CD0C4 90010004 */  stw		r0, 4(r1)
/* 0C7B28 800CD0C8 9421FFD0 */  stwu	r1, -0x30(r1)
/* 0C7B2C 800CD0CC 93E1002C */  stw		r31, 0x2c(r1)
/* 0C7B30 800CD0D0 3BE30000 */  addi	r31, r3, 0
/* 0C7B34 800CD0D4 93C10028 */  stw		r30, 0x28(r1)
/* 0C7B38 800CD0D8 3BC50000 */  addi	r30, r5, 0
/* 0C7B3C 800CD0DC 93A10024 */  stw		r29, 0x24(r1)
/* 0C7B40 800CD0E0 3BA40000 */  addi	r29, r4, 0
/* 0C7B44 800CD0E4 38810018 */  addi	r4, r1, 0x18
/* 0C7B48 800CD0E8 4BFFAD61 */  bl		__CARDGetControlBlock
/* 0C7B4C 800CD0EC 2C030000 */  cmpwi	r3, 0
/* 0C7B50 800CD0F0 40800008 */  bge		lbl_800CD0F8
/* 0C7B54 800CD0F4 480000C0 */  b		lbl_800CD1B4
lbl_800CD0F8:
/* 0C7B58 800CD0F8 80610018 */  lwz		r3, 0x18(r1)
/* 0C7B5C 800CD0FC 389D0000 */  addi	r4, r29, 0
/* 0C7B60 800CD100 38A10014 */  addi	r5, r1, 0x14
/* 0C7B64 800CD104 4BFFF159 */  bl		__CARDGetFileNo
/* 0C7B68 800CD108 7C641B79 */  or.		r4, r3, r3
/* 0C7B6C 800CD10C 40800010 */  bge		lbl_800CD11C
/* 0C7B70 800CD110 80610018 */  lwz		r3, 0x18(r1)
/* 0C7B74 800CD114 4BFFADED */  bl		__CARDPutControlBlock
/* 0C7B78 800CD118 4800009C */  b		lbl_800CD1B4
lbl_800CD11C:
/* 0C7B7C 800CD11C 80610018 */  lwz		r3, 0x18(r1)
/* 0C7B80 800CD120 80810014 */  lwz		r4, 0x14(r1)
/* 0C7B84 800CD124 4BFFF3F9 */  bl		__CARDIsOpened
/* 0C7B88 800CD128 2C030000 */  cmpwi	r3, 0
/* 0C7B8C 800CD12C 41820014 */  beq		lbl_800CD140
/* 0C7B90 800CD130 80610018 */  lwz		r3, 0x18(r1)
/* 0C7B94 800CD134 3880FFFF */  li		r4, -1
/* 0C7B98 800CD138 4BFFADC9 */  bl		__CARDPutControlBlock
/* 0C7B9C 800CD13C 48000078 */  b		lbl_800CD1B4
lbl_800CD140:
/* 0C7BA0 800CD140 80610018 */  lwz		r3, 0x18(r1)
/* 0C7BA4 800CD144 4BFFC985 */  bl		__CARDGetDirBlock
/* 0C7BA8 800CD148 80010014 */  lwz		r0, 0x14(r1)
/* 0C7BAC 800CD14C 388000FF */  li		r4, 0xff
/* 0C7BB0 800CD150 80C10018 */  lwz		r6, 0x18(r1)
/* 0C7BB4 800CD154 38A00040 */  li		r5, 0x40
/* 0C7BB8 800CD158 54003032 */  slwi	r0, r0, 6
/* 0C7BBC 800CD15C 7C630214 */  add		r3, r3, r0
/* 0C7BC0 800CD160 A0030036 */  lhz		r0, 0x36(r3)
/* 0C7BC4 800CD164 B00600BE */  sth		r0, 0xbe(r6)
/* 0C7BC8 800CD168 4BF38269 */  bl		memset
/* 0C7BCC 800CD16C 281E0000 */  cmplwi	r30, 0
/* 0C7BD0 800CD170 4182000C */  beq		lbl_800CD17C
/* 0C7BD4 800CD174 7FC0F378 */  mr		r0, r30
/* 0C7BD8 800CD178 4800000C */  b		lbl_800CD184
lbl_800CD17C:
/* 0C7BDC 800CD17C 3C60800C */  lis		r3, __CARDDefaultApiCallback@ha
/* 0C7BE0 800CD180 38036EE8 */  addi	r0, r3, __CARDDefaultApiCallback@l
lbl_800CD184:
/* 0C7BE4 800CD184 80A10018 */  lwz		r5, 0x18(r1)
/* 0C7BE8 800CD188 3C60800D */  lis		r3, DeleteCallback@ha
/* 0C7BEC 800CD18C 3883D01C */  addi	r4, r3, DeleteCallback@l
/* 0C7BF0 800CD190 900500D0 */  stw		r0, 0xd0(r5)
/* 0C7BF4 800CD194 7FE3FB78 */  mr		r3, r31
/* 0C7BF8 800CD198 4BFFCAD1 */  bl		__CARDUpdateDir
/* 0C7BFC 800CD19C 7C7F1B79 */  or.		r31, r3, r3
/* 0C7C00 800CD1A0 40800010 */  bge		lbl_800CD1B0
/* 0C7C04 800CD1A4 80610018 */  lwz		r3, 0x18(r1)
/* 0C7C08 800CD1A8 7FE4FB78 */  mr		r4, r31
/* 0C7C0C 800CD1AC 4BFFAD55 */  bl		__CARDPutControlBlock
lbl_800CD1B0:
/* 0C7C10 800CD1B0 7FE3FB78 */  mr		r3, r31
lbl_800CD1B4:
/* 0C7C14 800CD1B4 80010034 */  lwz		r0, 0x34(r1)
/* 0C7C18 800CD1B8 83E1002C */  lwz		r31, 0x2c(r1)
/* 0C7C1C 800CD1BC 83C10028 */  lwz		r30, 0x28(r1)
/* 0C7C20 800CD1C0 83A10024 */  lwz		r29, 0x24(r1)
/* 0C7C24 800CD1C4 38210030 */  addi	r1, r1, 0x30
/* 0C7C28 800CD1C8 7C0803A6 */  mtlr	r0
/* 0C7C2C 800CD1CC 4E800020 */  blr		


