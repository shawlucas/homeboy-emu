# dolphin_trk.c
.include "macros.inc"

.section .init, "ax"

.balign 4

glabel __TRK_reset
/* 0022B0 800053B0 7C0802A6 */  mflr    r0
/* 0022B4 800053B4 90010004 */  stw     r0, 4(r1)
/* 0022B8 800053B8 9421FFF8 */  stwu    r1, -8(r1)
/* 0022BC 800053BC 480D3D49 */  bl      __TRK_copy_vectors
/* 0022C0 800053C0 38210008 */  addi    r1, r1, 8
/* 0022C4 800053C4 80010004 */  lwz     r0, 4(r1)
/* 0022C8 800053C8 7C0803A6 */  mtlr    r0
/* 0022CC 800053CC 4E800020 */  blr     


.section .text, "ax"

.balign 4

glabel InitMetroTRK
/* 0D3A44 800D8FE4 3821FFFC */  addi    r1, r1, -4
/* 0D3A48 800D8FE8 90610000 */  stw     r3, 0(r1)
/* 0D3A4C 800D8FEC 3C608014 */  lis     r3, gTRKCPUState@h
/* 0D3A50 800D8FF0 606343A0 */  ori     r3, r3, gTRKCPUState@l
/* 0D3A54 800D8FF4 BC030000 */  stmw    r0, 0(r3)
/* 0D3A58 800D8FF8 80810000 */  lwz     r4, 0(r1)
/* 0D3A5C 800D8FFC 38210004 */  addi    r1, r1, 4
/* 0D3A60 800D9000 90230004 */  stw     r1, 4(r3)
/* 0D3A64 800D9004 9083000C */  stw     r4, 0xc(r3)
/* 0D3A68 800D9008 7C8802A6 */  mflr    r4
/* 0D3A6C 800D900C 90830084 */  stw     r4, 0x84(r3)
/* 0D3A70 800D9010 90830080 */  stw     r4, 0x80(r3)
/* 0D3A74 800D9014 7C800026 */  mfcr    r4
/* 0D3A78 800D9018 90830088 */  stw     r4, 0x88(r3)
/* 0D3A7C 800D901C 7C8000A6 */  mfmsr   r4
/* 0D3A80 800D9020 60838000 */  ori     r3, r4, 0x8000
/* 0D3A84 800D9024 68638000 */  xori    r3, r3, 0x8000
/* 0D3A88 800D9028 7C600124 */  mtmsr   r3
/* 0D3A8C 800D902C 7C9B03A6 */  mtspr   0x1b, r4
/* 0D3A90 800D9030 480001A9 */  bl      TRKSaveExtended1Block
/* 0D3A94 800D9034 3C608014 */  lis     r3, gTRKCPUState@h
/* 0D3A98 800D9038 606343A0 */  ori     r3, r3, gTRKCPUState@l
/* 0D3A9C 800D903C B8030000 */  .4byte 0xB8030000 /* illegal lmw    r0, 0(r3) */
/* 0D3AA0 800D9040 38000000 */  li      r0, 0
/* 0D3AA4 800D9044 7C12FBA6 */  mtspr   0x3f2, r0
/* 0D3AA8 800D9048 7C15FBA6 */  mtspr   0x3f5, r0
/* 0D3AAC 800D904C 3C208015 */  lis     r1, _db_stack_addr@h
/* 0D3AB0 800D9050 602187B0 */  ori     r1, r1, _db_stack_addr@l
/* 0D3AB4 800D9054 7CA32B78 */  mr      r3, r5
/* 0D3AB8 800D9058 48000601 */  bl      InitMetroTRKCommTable
/* 0D3ABC 800D905C 2C030001 */  cmpwi   r3, 1
/* 0D3AC0 800D9060 40820014 */  bne     lbl_800D9074
/* 0D3AC4 800D9064 80830084 */  lwz     r4, 0x84(r3)
/* 0D3AC8 800D9068 7C8803A6 */  mtlr    r4
/* 0D3ACC 800D906C B8030000 */  .4byte 0xB8030000 /* illegal lmw    r0, 0(r3) */
/* 0D3AD0 800D9070 4E800020 */  blr     
lbl_800D9074:
/* 0D3AD4 800D9074 480004DC */  b       TRK_main

glabel EnableMetroTRKInterrupts
/* 0D3AD8 800D9078 7C0802A6 */  mflr    r0
/* 0D3ADC 800D907C 90010004 */  stw     r0, 4(r1)
/* 0D3AE0 800D9080 9421FFF8 */  stwu    r1, -8(r1)
/* 0D3AE4 800D9084 48000701 */  bl      EnableEXI2Interrupts
/* 0D3AE8 800D9088 38210008 */  addi    r1, r1, 8
/* 0D3AEC 800D908C 80010004 */  lwz     r0, 4(r1)
/* 0D3AF0 800D9090 7C0803A6 */  mtlr    r0
/* 0D3AF4 800D9094 4E800020 */  blr     

glabel TRKTargetTranslate
/* 0D3AF8 800D9098 546000BE */  clrlwi  r0, r3, 2
/* 0D3AFC 800D909C 64038000 */  oris    r3, r0, 0x8000
/* 0D3B00 800D90A0 4E800020 */  blr     

glabel TRK_copy_vector
/* 0D3B04 800D90A4 7C0802A6 */  mflr    r0
/* 0D3B08 800D90A8 90010004 */  stw     r0, 4(r1)
/* 0D3B0C 800D90AC 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0D3B10 800D90B0 93E1000C */  stw     r31, 0xc(r1)
/* 0D3B14 800D90B4 93C10008 */  stw     r30, 8(r1)
/* 0D3B18 800D90B8 7C7E1B78 */  mr      r30, r3
/* 0D3B1C 800D90BC 7FC3F378 */  mr      r3, r30
/* 0D3B20 800D90C0 4BFFFFD9 */  bl      TRKTargetTranslate
/* 0D3B24 800D90C4 3C808000 */  lis     r4, gTRKInterruptVectorTable@ha
/* 0D3B28 800D90C8 3804347C */  addi    r0, r4, gTRKInterruptVectorTable@l
/* 0D3B2C 800D90CC 7C7F1B78 */  mr      r31, r3
/* 0D3B30 800D90D0 7C80F214 */  add     r4, r0, r30
/* 0D3B34 800D90D4 7FE3FB78 */  mr      r3, r31
/* 0D3B38 800D90D8 38A00100 */  li      r5, 0x100
/* 0D3B3C 800D90DC 4BF2A37D */  bl      TRK_memcpy
/* 0D3B40 800D90E0 7FE3FB78 */  mr      r3, r31
/* 0D3B44 800D90E4 38800100 */  li      r4, 0x100
/* 0D3B48 800D90E8 4BFFE8E9 */  bl      TRK_flush_cache
/* 0D3B4C 800D90EC 83E1000C */  lwz     r31, 0xc(r1)
/* 0D3B50 800D90F0 83C10008 */  lwz     r30, 8(r1)
/* 0D3B54 800D90F4 38210010 */  addi    r1, r1, 0x10
/* 0D3B58 800D90F8 80010004 */  lwz     r0, 4(r1)
/* 0D3B5C 800D90FC 7C0803A6 */  mtlr    r0
/* 0D3B60 800D9100 4E800020 */  blr     

glabel __TRK_copy_vectors
/* 0D3B64 800D9104 7C0802A6 */  mflr    r0
/* 0D3B68 800D9108 90010004 */  stw     r0, 4(r1)
/* 0D3B6C 800D910C 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0D3B70 800D9110 93E10014 */  stw     r31, 0x14(r1)
/* 0D3B74 800D9114 93C10010 */  stw     r30, 0x10(r1)
/* 0D3B78 800D9118 93A1000C */  stw     r29, 0xc(r1)
/* 0D3B7C 800D911C 93810008 */  stw     r28, 8(r1)
/* 0D3B80 800D9120 38600044 */  li      r3, 0x44
/* 0D3B84 800D9124 4BFFFF75 */  bl      TRKTargetTranslate
/* 0D3B88 800D9128 3BA00000 */  li      r29, 0
/* 0D3B8C 800D912C 83830000 */  lwz     r28, 0(r3)
/* 0D3B90 800D9130 3C608010 */  lis     r3, TRK_ISR_OFFSETS@ha
/* 0D3B94 800D9134 57A4103A */  slwi    r4, r29, 2
/* 0D3B98 800D9138 38031DB8 */  addi    r0, r3, TRK_ISR_OFFSETS@l
/* 0D3B9C 800D913C 7FC02214 */  add     r30, r0, r4
/* 0D3BA0 800D9140 48000004 */  b       lbl_800D9144
lbl_800D9144:
/* 0D3BA4 800D9144 3BE00001 */  li      r31, 1
/* 0D3BA8 800D9148 48000004 */  b       lbl_800D914C
lbl_800D914C:
/* 0D3BAC 800D914C 48000004 */  b       lbl_800D9150
lbl_800D9150:
/* 0D3BB0 800D9150 7FE0E830 */  slw     r0, r31, r29
/* 0D3BB4 800D9154 7F800038 */  and     r0, r28, r0
/* 0D3BB8 800D9158 28000000 */  cmplwi  r0, 0
/* 0D3BBC 800D915C 4182000C */  beq     lbl_800D9168
/* 0D3BC0 800D9160 807E0000 */  lwz     r3, 0(r30)
/* 0D3BC4 800D9164 4BFFFF41 */  bl      TRK_copy_vector
lbl_800D9168:
/* 0D3BC8 800D9168 3BDE0004 */  addi    r30, r30, 4
/* 0D3BCC 800D916C 3BBD0001 */  addi    r29, r29, 1
/* 0D3BD0 800D9170 2C1D000E */  cmpwi   r29, 0xe
/* 0D3BD4 800D9174 4081FFDC */  ble     lbl_800D9150
/* 0D3BD8 800D9178 83E10014 */  lwz     r31, 0x14(r1)
/* 0D3BDC 800D917C 83C10010 */  lwz     r30, 0x10(r1)
/* 0D3BE0 800D9180 83A1000C */  lwz     r29, 0xc(r1)
/* 0D3BE4 800D9184 83810008 */  lwz     r28, 8(r1)
/* 0D3BE8 800D9188 38210018 */  addi    r1, r1, 0x18
/* 0D3BEC 800D918C 80010004 */  lwz     r0, 4(r1)
/* 0D3BF0 800D9190 7C0803A6 */  mtlr    r0
/* 0D3BF4 800D9194 4E800020 */  blr     

glabel TRKInitializeTarget
/* 0D3BF8 800D9198 7C0802A6 */  mflr    r0
/* 0D3BFC 800D919C 90010004 */  stw     r0, 4(r1)
/* 0D3C00 800D91A0 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0D3C04 800D91A4 93E1000C */  stw     r31, 0xc(r1)
/* 0D3C08 800D91A8 3C608014 */  lis     r3, gTRKState@ha
/* 0D3C0C 800D91AC 3BE342F8 */  addi    r31, r3, gTRKState@l
/* 0D3C10 800D91B0 38000001 */  li      r0, 1
/* 0D3C14 800D91B4 901F0098 */  stw     r0, 0x98(r31)
/* 0D3C18 800D91B8 4BFFE851 */  bl      __TRK_get_MSR
/* 0D3C1C 800D91BC 907F008C */  stw     r3, 0x8c(r31)
/* 0D3C20 800D91C0 38600000 */  li      r3, 0
/* 0D3C24 800D91C4 83E1000C */  lwz     r31, 0xc(r1)
/* 0D3C28 800D91C8 38210010 */  addi    r1, r1, 0x10
/* 0D3C2C 800D91CC 80010004 */  lwz     r0, 4(r1)
/* 0D3C30 800D91D0 7C0803A6 */  mtlr    r0
/* 0D3C34 800D91D4 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000FEE38 80101DB8 003C */
TRK_ISR_OFFSETS:
    .long 0x00000100, 0x00000200, 0x00000300, 0x00000400, 0x00000500, 0x00000600, 0x00000700, 0x00000800
    .long 0x00000900, 0x00000C00, 0x00000D00, 0x00000F00, 0x00001300, 0x00001400, 0x00001700


