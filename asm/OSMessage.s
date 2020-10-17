# OSMessage.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel OSInitMessageQueue
/* 0A5A54 800AAFF4 7C0802A6 */  mflr    r0
/* 0A5A58 800AAFF8 90010004 */  stw     r0, 4(r1)
/* 0A5A5C 800AAFFC 9421FFD8 */  stwu    r1, -0x28(r1)
/* 0A5A60 800AB000 93E10024 */  stw     r31, 0x24(r1)
/* 0A5A64 800AB004 3BE50000 */  addi    r31, r5, 0
/* 0A5A68 800AB008 93C10020 */  stw     r30, 0x20(r1)
/* 0A5A6C 800AB00C 3BC40000 */  addi    r30, r4, 0
/* 0A5A70 800AB010 93A1001C */  stw     r29, 0x1c(r1)
/* 0A5A74 800AB014 3BA30000 */  addi    r29, r3, 0
/* 0A5A78 800AB018 48001C91 */  bl      OSInitThreadQueue
/* 0A5A7C 800AB01C 387D0008 */  addi    r3, r29, 8
/* 0A5A80 800AB020 48001C89 */  bl      OSInitThreadQueue
/* 0A5A84 800AB024 93DD0010 */  stw     r30, 0x10(r29)
/* 0A5A88 800AB028 38000000 */  li      r0, 0
/* 0A5A8C 800AB02C 93FD0014 */  stw     r31, 0x14(r29)
/* 0A5A90 800AB030 901D0018 */  stw     r0, 0x18(r29)
/* 0A5A94 800AB034 901D001C */  stw     r0, 0x1c(r29)
/* 0A5A98 800AB038 8001002C */  lwz     r0, 0x2c(r1)
/* 0A5A9C 800AB03C 83E10024 */  lwz     r31, 0x24(r1)
/* 0A5AA0 800AB040 83C10020 */  lwz     r30, 0x20(r1)
/* 0A5AA4 800AB044 83A1001C */  lwz     r29, 0x1c(r1)
/* 0A5AA8 800AB048 38210028 */  addi    r1, r1, 0x28
/* 0A5AAC 800AB04C 7C0803A6 */  mtlr    r0
/* 0A5AB0 800AB050 4E800020 */  blr     

glabel OSSendMessage
/* 0A5AB4 800AB054 7C0802A6 */  mflr    r0
/* 0A5AB8 800AB058 90010004 */  stw     r0, 4(r1)
/* 0A5ABC 800AB05C 9421FFD8 */  stwu    r1, -0x28(r1)
/* 0A5AC0 800AB060 93E10024 */  stw     r31, 0x24(r1)
/* 0A5AC4 800AB064 3BE50000 */  addi    r31, r5, 0
/* 0A5AC8 800AB068 93C10020 */  stw     r30, 0x20(r1)
/* 0A5ACC 800AB06C 93A1001C */  stw     r29, 0x1c(r1)
/* 0A5AD0 800AB070 3BA40000 */  addi    r29, r4, 0
/* 0A5AD4 800AB074 93810018 */  stw     r28, 0x18(r1)
/* 0A5AD8 800AB078 3B830000 */  addi    r28, r3, 0
/* 0A5ADC 800AB07C 4BFFF6F5 */  bl      OSDisableInterrupts
/* 0A5AE0 800AB080 3BC30000 */  addi    r30, r3, 0
/* 0A5AE4 800AB084 57FF07FE */  clrlwi  r31, r31, 0x1f
/* 0A5AE8 800AB088 48000024 */  b       lbl_800AB0AC
lbl_800AB08C:
/* 0A5AEC 800AB08C 2C1F0000 */  cmpwi   r31, 0
/* 0A5AF0 800AB090 40820014 */  bne     lbl_800AB0A4
/* 0A5AF4 800AB094 7FC3F378 */  mr      r3, r30
/* 0A5AF8 800AB098 4BFFF701 */  bl      OSRestoreInterrupts
/* 0A5AFC 800AB09C 38600000 */  li      r3, 0
/* 0A5B00 800AB0A0 4800005C */  b       lbl_800AB0FC
lbl_800AB0A4:
/* 0A5B04 800AB0A4 7F83E378 */  mr      r3, r28
/* 0A5B08 800AB0A8 480029D9 */  bl      OSSleepThread
lbl_800AB0AC:
/* 0A5B0C 800AB0AC 80DC0014 */  lwz     r6, 0x14(r28)
/* 0A5B10 800AB0B0 809C001C */  lwz     r4, 0x1c(r28)
/* 0A5B14 800AB0B4 7C062000 */  cmpw    r6, r4
/* 0A5B18 800AB0B8 4081FFD4 */  ble     lbl_800AB08C
/* 0A5B1C 800AB0BC 801C0018 */  lwz     r0, 0x18(r28)
/* 0A5B20 800AB0C0 387C0008 */  addi    r3, r28, 8
/* 0A5B24 800AB0C4 80BC0010 */  lwz     r5, 0x10(r28)
/* 0A5B28 800AB0C8 7C802214 */  add     r4, r0, r4
/* 0A5B2C 800AB0CC 7C0433D6 */  divw    r0, r4, r6
/* 0A5B30 800AB0D0 7C0031D6 */  mullw   r0, r0, r6
/* 0A5B34 800AB0D4 7C002050 */  subf    r0, r0, r4
/* 0A5B38 800AB0D8 5400103A */  slwi    r0, r0, 2
/* 0A5B3C 800AB0DC 7FA5012E */  stwx    r29, r5, r0
/* 0A5B40 800AB0E0 809C001C */  lwz     r4, 0x1c(r28)
/* 0A5B44 800AB0E4 38040001 */  addi    r0, r4, 1
/* 0A5B48 800AB0E8 901C001C */  stw     r0, 0x1c(r28)
/* 0A5B4C 800AB0EC 48002A81 */  bl      OSWakeupThread
/* 0A5B50 800AB0F0 7FC3F378 */  mr      r3, r30
/* 0A5B54 800AB0F4 4BFFF6A5 */  bl      OSRestoreInterrupts
/* 0A5B58 800AB0F8 38600001 */  li      r3, 1
lbl_800AB0FC:
/* 0A5B5C 800AB0FC 8001002C */  lwz     r0, 0x2c(r1)
/* 0A5B60 800AB100 83E10024 */  lwz     r31, 0x24(r1)
/* 0A5B64 800AB104 83C10020 */  lwz     r30, 0x20(r1)
/* 0A5B68 800AB108 83A1001C */  lwz     r29, 0x1c(r1)
/* 0A5B6C 800AB10C 83810018 */  lwz     r28, 0x18(r1)
/* 0A5B70 800AB110 38210028 */  addi    r1, r1, 0x28
/* 0A5B74 800AB114 7C0803A6 */  mtlr    r0
/* 0A5B78 800AB118 4E800020 */  blr     

glabel OSReceiveMessage
/* 0A5B7C 800AB11C 7C0802A6 */  mflr    r0
/* 0A5B80 800AB120 90010004 */  stw     r0, 4(r1)
/* 0A5B84 800AB124 9421FFD8 */  stwu    r1, -0x28(r1)
/* 0A5B88 800AB128 93E10024 */  stw     r31, 0x24(r1)
/* 0A5B8C 800AB12C 3BE30000 */  addi    r31, r3, 0
/* 0A5B90 800AB130 93C10020 */  stw     r30, 0x20(r1)
/* 0A5B94 800AB134 3BC50000 */  addi    r30, r5, 0
/* 0A5B98 800AB138 93A1001C */  stw     r29, 0x1c(r1)
/* 0A5B9C 800AB13C 93810018 */  stw     r28, 0x18(r1)
/* 0A5BA0 800AB140 3B840000 */  addi    r28, r4, 0
/* 0A5BA4 800AB144 4BFFF62D */  bl      OSDisableInterrupts
/* 0A5BA8 800AB148 3BA30000 */  addi    r29, r3, 0
/* 0A5BAC 800AB14C 57DE07FE */  clrlwi  r30, r30, 0x1f
/* 0A5BB0 800AB150 48000024 */  b       lbl_800AB174
lbl_800AB154:
/* 0A5BB4 800AB154 2C1E0000 */  cmpwi   r30, 0
/* 0A5BB8 800AB158 40820014 */  bne     lbl_800AB16C
/* 0A5BBC 800AB15C 7FA3EB78 */  mr      r3, r29
/* 0A5BC0 800AB160 4BFFF639 */  bl      OSRestoreInterrupts
/* 0A5BC4 800AB164 38600000 */  li      r3, 0
/* 0A5BC8 800AB168 48000070 */  b       lbl_800AB1D8
lbl_800AB16C:
/* 0A5BCC 800AB16C 387F0008 */  addi    r3, r31, 8
/* 0A5BD0 800AB170 48002911 */  bl      OSSleepThread
lbl_800AB174:
/* 0A5BD4 800AB174 801F001C */  lwz     r0, 0x1c(r31)
/* 0A5BD8 800AB178 2C000000 */  cmpwi   r0, 0
/* 0A5BDC 800AB17C 4182FFD8 */  beq     lbl_800AB154
/* 0A5BE0 800AB180 281C0000 */  cmplwi  r28, 0
/* 0A5BE4 800AB184 41820018 */  beq     lbl_800AB19C
/* 0A5BE8 800AB188 801F0018 */  lwz     r0, 0x18(r31)
/* 0A5BEC 800AB18C 807F0010 */  lwz     r3, 0x10(r31)
/* 0A5BF0 800AB190 5400103A */  slwi    r0, r0, 2
/* 0A5BF4 800AB194 7C03002E */  lwzx    r0, r3, r0
/* 0A5BF8 800AB198 901C0000 */  stw     r0, 0(r28)
lbl_800AB19C:
/* 0A5BFC 800AB19C 80BF0018 */  lwz     r5, 0x18(r31)
/* 0A5C00 800AB1A0 7FE3FB78 */  mr      r3, r31
/* 0A5C04 800AB1A4 809F0014 */  lwz     r4, 0x14(r31)
/* 0A5C08 800AB1A8 38A50001 */  addi    r5, r5, 1
/* 0A5C0C 800AB1AC 7C0523D6 */  divw    r0, r5, r4
/* 0A5C10 800AB1B0 7C0021D6 */  mullw   r0, r0, r4
/* 0A5C14 800AB1B4 7C002850 */  subf    r0, r0, r5
/* 0A5C18 800AB1B8 901F0018 */  stw     r0, 0x18(r31)
/* 0A5C1C 800AB1BC 809F001C */  lwz     r4, 0x1c(r31)
/* 0A5C20 800AB1C0 3804FFFF */  addi    r0, r4, -1
/* 0A5C24 800AB1C4 901F001C */  stw     r0, 0x1c(r31)
/* 0A5C28 800AB1C8 480029A5 */  bl      OSWakeupThread
/* 0A5C2C 800AB1CC 7FA3EB78 */  mr      r3, r29
/* 0A5C30 800AB1D0 4BFFF5C9 */  bl      OSRestoreInterrupts
/* 0A5C34 800AB1D4 38600001 */  li      r3, 1
lbl_800AB1D8:
/* 0A5C38 800AB1D8 8001002C */  lwz     r0, 0x2c(r1)
/* 0A5C3C 800AB1DC 83E10024 */  lwz     r31, 0x24(r1)
/* 0A5C40 800AB1E0 83C10020 */  lwz     r30, 0x20(r1)
/* 0A5C44 800AB1E4 83A1001C */  lwz     r29, 0x1c(r1)
/* 0A5C48 800AB1E8 83810018 */  lwz     r28, 0x18(r1)
/* 0A5C4C 800AB1EC 38210028 */  addi    r1, r1, 0x28
/* 0A5C50 800AB1F0 7C0803A6 */  mtlr    r0
/* 0A5C54 800AB1F4 4E800020 */  blr     


