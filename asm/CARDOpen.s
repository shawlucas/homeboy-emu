# CARDOpen.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel __CARDCompareFileName
/* 0C6998 800CBF38 38A30008 */  addi    r5, r3, 8
/* 0C699C 800CBF3C 38E00020 */  li      r7, 0x20
/* 0C69A0 800CBF40 4800003C */  b       lbl_800CBF7C
lbl_800CBF44:
/* 0C69A4 800CBF44 88050000 */  lbz     r0, 0(r5)
/* 0C69A8 800CBF48 38A50001 */  addi    r5, r5, 1
/* 0C69AC 800CBF4C 88C40000 */  lbz     r6, 0(r4)
/* 0C69B0 800CBF50 38840001 */  addi    r4, r4, 1
/* 0C69B4 800CBF54 7C030774 */  extsb   r3, r0
/* 0C69B8 800CBF58 7CC00774 */  extsb   r0, r6
/* 0C69BC 800CBF5C 7C030000 */  cmpw    r3, r0
/* 0C69C0 800CBF60 4182000C */  beq     lbl_800CBF6C
/* 0C69C4 800CBF64 38600000 */  li      r3, 0
/* 0C69C8 800CBF68 4E800020 */  blr     
lbl_800CBF6C:
/* 0C69CC 800CBF6C 7CC00775 */  extsb.  r0, r6
/* 0C69D0 800CBF70 4082000C */  bne     lbl_800CBF7C
/* 0C69D4 800CBF74 38600001 */  li      r3, 1
/* 0C69D8 800CBF78 4E800020 */  blr     
lbl_800CBF7C:
/* 0C69DC 800CBF7C 34E7FFFF */  addic.  r7, r7, -1
/* 0C69E0 800CBF80 4080FFC4 */  bge     lbl_800CBF44
/* 0C69E4 800CBF84 88040000 */  lbz     r0, 0(r4)
/* 0C69E8 800CBF88 7C000775 */  extsb.  r0, r0
/* 0C69EC 800CBF8C 4082000C */  bne     lbl_800CBF98
/* 0C69F0 800CBF90 38600001 */  li      r3, 1
/* 0C69F4 800CBF94 4E800020 */  blr     
lbl_800CBF98:
/* 0C69F8 800CBF98 38600000 */  li      r3, 0
/* 0C69FC 800CBF9C 4E800020 */  blr     

glabel __CARDAccess
/* 0C6A00 800CBFA0 7C0802A6 */  mflr    r0
/* 0C6A04 800CBFA4 90010004 */  stw     r0, 4(r1)
/* 0C6A08 800CBFA8 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0C6A0C 800CBFAC 93E10014 */  stw     r31, 0x14(r1)
/* 0C6A10 800CBFB0 93C10010 */  stw     r30, 0x10(r1)
/* 0C6A14 800CBFB4 7C9E2378 */  mr      r30, r4
/* 0C6A18 800CBFB8 88040000 */  lbz     r0, 0(r4)
/* 0C6A1C 800CBFBC 83E3010C */  lwz     r31, 0x10c(r3)
/* 0C6A20 800CBFC0 280000FF */  cmplwi  r0, 0xff
/* 0C6A24 800CBFC4 4082000C */  bne     lbl_800CBFD0
/* 0C6A28 800CBFC8 3860FFFC */  li      r3, -4
/* 0C6A2C 800CBFCC 48000050 */  b       lbl_800CC01C
lbl_800CBFD0:
/* 0C6A30 800CBFD0 3C608014 */  lis     r3, __CARDDiskNone@ha
/* 0C6A34 800CBFD4 380326F0 */  addi    r0, r3, __CARDDiskNone@l
/* 0C6A38 800CBFD8 7C1F0040 */  cmplw   r31, r0
/* 0C6A3C 800CBFDC 41820034 */  beq     lbl_800CC010
/* 0C6A40 800CBFE0 387E0000 */  addi    r3, r30, 0
/* 0C6A44 800CBFE4 389F0000 */  addi    r4, r31, 0
/* 0C6A48 800CBFE8 38A00004 */  li      r5, 4
/* 0C6A4C 800CBFEC 4800EAB1 */  bl      memcmp
/* 0C6A50 800CBFF0 2C030000 */  cmpwi   r3, 0
/* 0C6A54 800CBFF4 40820024 */  bne     lbl_800CC018
/* 0C6A58 800CBFF8 387E0004 */  addi    r3, r30, 4
/* 0C6A5C 800CBFFC 389F0004 */  addi    r4, r31, 4
/* 0C6A60 800CC000 38A00002 */  li      r5, 2
/* 0C6A64 800CC004 4800EA99 */  bl      memcmp
/* 0C6A68 800CC008 2C030000 */  cmpwi   r3, 0
/* 0C6A6C 800CC00C 4082000C */  bne     lbl_800CC018
lbl_800CC010:
/* 0C6A70 800CC010 38600000 */  li      r3, 0
/* 0C6A74 800CC014 48000008 */  b       lbl_800CC01C
lbl_800CC018:
/* 0C6A78 800CC018 3860FFF6 */  li      r3, -10
lbl_800CC01C:
/* 0C6A7C 800CC01C 8001001C */  lwz     r0, 0x1c(r1)
/* 0C6A80 800CC020 83E10014 */  lwz     r31, 0x14(r1)
/* 0C6A84 800CC024 83C10010 */  lwz     r30, 0x10(r1)
/* 0C6A88 800CC028 38210018 */  addi    r1, r1, 0x18
/* 0C6A8C 800CC02C 7C0803A6 */  mtlr    r0
/* 0C6A90 800CC030 4E800020 */  blr     

glabel __CARDIsWritable
/* 0C6A94 800CC034 7C0802A6 */  mflr    r0
/* 0C6A98 800CC038 90010004 */  stw     r0, 4(r1)
/* 0C6A9C 800CC03C 9421FFD8 */  stwu    r1, -0x28(r1)
/* 0C6AA0 800CC040 BF610014 */  stmw    r27, 0x14(r1)
/* 0C6AA4 800CC044 7C9B2378 */  mr      r27, r4
/* 0C6AA8 800CC048 88040000 */  lbz     r0, 0(r4)
/* 0C6AAC 800CC04C 83A3010C */  lwz     r29, 0x10c(r3)
/* 0C6AB0 800CC050 280000FF */  cmplwi  r0, 0xff
/* 0C6AB4 800CC054 4082000C */  bne     lbl_800CC060
/* 0C6AB8 800CC058 3BC0FFFC */  li      r30, -4
/* 0C6ABC 800CC05C 48000050 */  b       lbl_800CC0AC
lbl_800CC060:
/* 0C6AC0 800CC060 3C608014 */  lis     r3, __CARDDiskNone@ha
/* 0C6AC4 800CC064 380326F0 */  addi    r0, r3, __CARDDiskNone@l
/* 0C6AC8 800CC068 7C1D0040 */  cmplw   r29, r0
/* 0C6ACC 800CC06C 41820034 */  beq     lbl_800CC0A0
/* 0C6AD0 800CC070 387B0000 */  addi    r3, r27, 0
/* 0C6AD4 800CC074 389D0000 */  addi    r4, r29, 0
/* 0C6AD8 800CC078 38A00004 */  li      r5, 4
/* 0C6ADC 800CC07C 4800EA21 */  bl      memcmp
/* 0C6AE0 800CC080 2C030000 */  cmpwi   r3, 0
/* 0C6AE4 800CC084 40820024 */  bne     lbl_800CC0A8
/* 0C6AE8 800CC088 387B0004 */  addi    r3, r27, 4
/* 0C6AEC 800CC08C 389D0004 */  addi    r4, r29, 4
/* 0C6AF0 800CC090 38A00002 */  li      r5, 2
/* 0C6AF4 800CC094 4800EA09 */  bl      memcmp
/* 0C6AF8 800CC098 2C030000 */  cmpwi   r3, 0
/* 0C6AFC 800CC09C 4082000C */  bne     lbl_800CC0A8
lbl_800CC0A0:
/* 0C6B00 800CC0A0 3BC00000 */  li      r30, 0
/* 0C6B04 800CC0A4 48000008 */  b       lbl_800CC0AC
lbl_800CC0A8:
/* 0C6B08 800CC0A8 3BC0FFF6 */  li      r30, -10
lbl_800CC0AC:
/* 0C6B0C 800CC0AC 2C1EFFF6 */  cmpwi   r30, -10
/* 0C6B10 800CC0B0 408200A0 */  bne     lbl_800CC150
/* 0C6B14 800CC0B4 887B0034 */  lbz     r3, 0x34(r27)
/* 0C6B18 800CC0B8 880D8E3A */  lbz     r0, __CARDPermMask-_SDA_BASE_(r13)
/* 0C6B1C 800CC0BC 7C600038 */  and     r0, r3, r0
/* 0C6B20 800CC0C0 541C063E */  clrlwi  r28, r0, 0x18
/* 0C6B24 800CC0C4 540006B5 */  rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 0C6B28 800CC0C8 41820044 */  beq     lbl_800CC10C
/* 0C6B2C 800CC0CC 3C608014 */  lis     r3, __CARDDiskNone@ha
/* 0C6B30 800CC0D0 3BE326F0 */  addi    r31, r3, __CARDDiskNone@l
/* 0C6B34 800CC0D4 387B0000 */  addi    r3, r27, 0
/* 0C6B38 800CC0D8 389F0000 */  addi    r4, r31, 0
/* 0C6B3C 800CC0DC 38A00004 */  li      r5, 4
/* 0C6B40 800CC0E0 4800E9BD */  bl      memcmp
/* 0C6B44 800CC0E4 2C030000 */  cmpwi   r3, 0
/* 0C6B48 800CC0E8 40820024 */  bne     lbl_800CC10C
/* 0C6B4C 800CC0EC 387B0004 */  addi    r3, r27, 4
/* 0C6B50 800CC0F0 389F0004 */  addi    r4, r31, 4
/* 0C6B54 800CC0F4 38A00002 */  li      r5, 2
/* 0C6B58 800CC0F8 4800E9A5 */  bl      memcmp
/* 0C6B5C 800CC0FC 2C030000 */  cmpwi   r3, 0
/* 0C6B60 800CC100 4082000C */  bne     lbl_800CC10C
/* 0C6B64 800CC104 38600000 */  li      r3, 0
/* 0C6B68 800CC108 4800004C */  b       lbl_800CC154
lbl_800CC10C:
/* 0C6B6C 800CC10C 57800673 */  rlwinm. r0, r28, 0, 0x19, 0x19
/* 0C6B70 800CC110 41820040 */  beq     lbl_800CC150
/* 0C6B74 800CC114 3C608014 */  lis     r3, __CARDDiskNone@ha
/* 0C6B78 800CC118 388326F0 */  addi    r4, r3, __CARDDiskNone@l
/* 0C6B7C 800CC11C 387B0000 */  addi    r3, r27, 0
/* 0C6B80 800CC120 38A00004 */  li      r5, 4
/* 0C6B84 800CC124 4800E979 */  bl      memcmp
/* 0C6B88 800CC128 2C030000 */  cmpwi   r3, 0
/* 0C6B8C 800CC12C 40820024 */  bne     lbl_800CC150
/* 0C6B90 800CC130 387B0004 */  addi    r3, r27, 4
/* 0C6B94 800CC134 389D0004 */  addi    r4, r29, 4
/* 0C6B98 800CC138 38A00002 */  li      r5, 2
/* 0C6B9C 800CC13C 4800E961 */  bl      memcmp
/* 0C6BA0 800CC140 2C030000 */  cmpwi   r3, 0
/* 0C6BA4 800CC144 4082000C */  bne     lbl_800CC150
/* 0C6BA8 800CC148 38600000 */  li      r3, 0
/* 0C6BAC 800CC14C 48000008 */  b       lbl_800CC154
lbl_800CC150:
/* 0C6BB0 800CC150 7FC3F378 */  mr      r3, r30
lbl_800CC154:
/* 0C6BB4 800CC154 BB610014 */  lmw     r27, 0x14(r1)
/* 0C6BB8 800CC158 8001002C */  lwz     r0, 0x2c(r1)
/* 0C6BBC 800CC15C 38210028 */  addi    r1, r1, 0x28
/* 0C6BC0 800CC160 7C0803A6 */  mtlr    r0
/* 0C6BC4 800CC164 4E800020 */  blr     

glabel __CARDIsReadable
/* 0C6BC8 800CC168 7C0802A6 */  mflr    r0
/* 0C6BCC 800CC16C 90010004 */  stw     r0, 4(r1)
/* 0C6BD0 800CC170 9421FFD8 */  stwu    r1, -0x28(r1)
/* 0C6BD4 800CC174 BF610014 */  stmw    r27, 0x14(r1)
/* 0C6BD8 800CC178 7C9B2378 */  mr      r27, r4
/* 0C6BDC 800CC17C 8383010C */  lwz     r28, 0x10c(r3)
/* 0C6BE0 800CC180 4BFFFE21 */  bl      __CARDAccess
/* 0C6BE4 800CC184 3BA30000 */  addi    r29, r3, 0
/* 0C6BE8 800CC188 2C1DFFF6 */  cmpwi   r29, -10
/* 0C6BEC 800CC18C 4082009C */  bne     lbl_800CC228
/* 0C6BF0 800CC190 887B0034 */  lbz     r3, 0x34(r27)
/* 0C6BF4 800CC194 880D8E3A */  lbz     r0, __CARDPermMask-_SDA_BASE_(r13)
/* 0C6BF8 800CC198 7C600038 */  and     r0, r3, r0
/* 0C6BFC 800CC19C 541E063E */  clrlwi  r30, r0, 0x18
/* 0C6C00 800CC1A0 540006B5 */  rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 0C6C04 800CC1A4 41820044 */  beq     lbl_800CC1E8
/* 0C6C08 800CC1A8 3C608014 */  lis     r3, __CARDDiskNone@ha
/* 0C6C0C 800CC1AC 3BE326F0 */  addi    r31, r3, __CARDDiskNone@l
/* 0C6C10 800CC1B0 387B0000 */  addi    r3, r27, 0
/* 0C6C14 800CC1B4 389F0000 */  addi    r4, r31, 0
/* 0C6C18 800CC1B8 38A00004 */  li      r5, 4
/* 0C6C1C 800CC1BC 4800E8E1 */  bl      memcmp
/* 0C6C20 800CC1C0 2C030000 */  cmpwi   r3, 0
/* 0C6C24 800CC1C4 40820024 */  bne     lbl_800CC1E8
/* 0C6C28 800CC1C8 387B0004 */  addi    r3, r27, 4
/* 0C6C2C 800CC1CC 389F0004 */  addi    r4, r31, 4
/* 0C6C30 800CC1D0 38A00002 */  li      r5, 2
/* 0C6C34 800CC1D4 4800E8C9 */  bl      memcmp
/* 0C6C38 800CC1D8 2C030000 */  cmpwi   r3, 0
/* 0C6C3C 800CC1DC 4082000C */  bne     lbl_800CC1E8
/* 0C6C40 800CC1E0 3BA00000 */  li      r29, 0
/* 0C6C44 800CC1E4 48000044 */  b       lbl_800CC228
lbl_800CC1E8:
/* 0C6C48 800CC1E8 57C00673 */  rlwinm. r0, r30, 0, 0x19, 0x19
/* 0C6C4C 800CC1EC 4182003C */  beq     lbl_800CC228
/* 0C6C50 800CC1F0 3C608014 */  lis     r3, __CARDDiskNone@ha
/* 0C6C54 800CC1F4 388326F0 */  addi    r4, r3, __CARDDiskNone@l
/* 0C6C58 800CC1F8 387B0000 */  addi    r3, r27, 0
/* 0C6C5C 800CC1FC 38A00004 */  li      r5, 4
/* 0C6C60 800CC200 4800E89D */  bl      memcmp
/* 0C6C64 800CC204 2C030000 */  cmpwi   r3, 0
/* 0C6C68 800CC208 40820020 */  bne     lbl_800CC228
/* 0C6C6C 800CC20C 387B0004 */  addi    r3, r27, 4
/* 0C6C70 800CC210 389C0004 */  addi    r4, r28, 4
/* 0C6C74 800CC214 38A00002 */  li      r5, 2
/* 0C6C78 800CC218 4800E885 */  bl      memcmp
/* 0C6C7C 800CC21C 2C030000 */  cmpwi   r3, 0
/* 0C6C80 800CC220 40820008 */  bne     lbl_800CC228
/* 0C6C84 800CC224 3BA00000 */  li      r29, 0
lbl_800CC228:
/* 0C6C88 800CC228 2C1DFFF6 */  cmpwi   r29, -10
/* 0C6C8C 800CC22C 40820018 */  bne     lbl_800CC244
/* 0C6C90 800CC230 881B0034 */  lbz     r0, 0x34(r27)
/* 0C6C94 800CC234 5400077B */  rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0C6C98 800CC238 4182000C */  beq     lbl_800CC244
/* 0C6C9C 800CC23C 38600000 */  li      r3, 0
/* 0C6CA0 800CC240 48000008 */  b       lbl_800CC248
lbl_800CC244:
/* 0C6CA4 800CC244 7FA3EB78 */  mr      r3, r29
lbl_800CC248:
/* 0C6CA8 800CC248 BB610014 */  lmw     r27, 0x14(r1)
/* 0C6CAC 800CC24C 8001002C */  lwz     r0, 0x2c(r1)
/* 0C6CB0 800CC250 38210028 */  addi    r1, r1, 0x28
/* 0C6CB4 800CC254 7C0803A6 */  mtlr    r0
/* 0C6CB8 800CC258 4E800020 */  blr     

glabel __CARDGetFileNo
/* 0C6CBC 800CC25C 7C0802A6 */  mflr    r0
/* 0C6CC0 800CC260 90010004 */  stw     r0, 4(r1)
/* 0C6CC4 800CC264 9421FFC8 */  stwu    r1, -0x38(r1)
/* 0C6CC8 800CC268 BF21001C */  stmw    r25, 0x1c(r1)
/* 0C6CCC 800CC26C 7C7B1B78 */  mr      r27, r3
/* 0C6CD0 800CC270 3B840000 */  addi    r28, r4, 0
/* 0C6CD4 800CC274 3BA50000 */  addi    r29, r5, 0
/* 0C6CD8 800CC278 80030000 */  lwz     r0, 0(r3)
/* 0C6CDC 800CC27C 2C000000 */  cmpwi   r0, 0
/* 0C6CE0 800CC280 4082000C */  bne     lbl_800CC28C
/* 0C6CE4 800CC284 3860FFFD */  li      r3, -3
/* 0C6CE8 800CC288 48000110 */  b       lbl_800CC398
lbl_800CC28C:
/* 0C6CEC 800CC28C 7F63DB78 */  mr      r3, r27
/* 0C6CF0 800CC290 4BFFD839 */  bl      __CARDGetDirBlock
/* 0C6CF4 800CC294 3C808014 */  lis     r4, __CARDDiskNone@ha
/* 0C6CF8 800CC298 3BE30000 */  addi    r31, r3, 0
/* 0C6CFC 800CC29C 3B4426F0 */  addi    r26, r4, __CARDDiskNone@l
/* 0C6D00 800CC2A0 3BC00000 */  li      r30, 0
lbl_800CC2A4:
/* 0C6D04 800CC2A4 881F0000 */  lbz     r0, 0(r31)
/* 0C6D08 800CC2A8 833B010C */  lwz     r25, 0x10c(r27)
/* 0C6D0C 800CC2AC 280000FF */  cmplwi  r0, 0xff
/* 0C6D10 800CC2B0 4082000C */  bne     lbl_800CC2BC
/* 0C6D14 800CC2B4 3800FFFC */  li      r0, -4
/* 0C6D18 800CC2B8 48000048 */  b       lbl_800CC300
lbl_800CC2BC:
/* 0C6D1C 800CC2BC 7C19D040 */  cmplw   r25, r26
/* 0C6D20 800CC2C0 41820034 */  beq     lbl_800CC2F4
/* 0C6D24 800CC2C4 387F0000 */  addi    r3, r31, 0
/* 0C6D28 800CC2C8 38990000 */  addi    r4, r25, 0
/* 0C6D2C 800CC2CC 38A00004 */  li      r5, 4
/* 0C6D30 800CC2D0 4800E7CD */  bl      memcmp
/* 0C6D34 800CC2D4 2C030000 */  cmpwi   r3, 0
/* 0C6D38 800CC2D8 40820024 */  bne     lbl_800CC2FC
/* 0C6D3C 800CC2DC 387F0004 */  addi    r3, r31, 4
/* 0C6D40 800CC2E0 38990004 */  addi    r4, r25, 4
/* 0C6D44 800CC2E4 38A00002 */  li      r5, 2
/* 0C6D48 800CC2E8 4800E7B5 */  bl      memcmp
/* 0C6D4C 800CC2EC 2C030000 */  cmpwi   r3, 0
/* 0C6D50 800CC2F0 4082000C */  bne     lbl_800CC2FC
lbl_800CC2F4:
/* 0C6D54 800CC2F4 38000000 */  li      r0, 0
/* 0C6D58 800CC2F8 48000008 */  b       lbl_800CC300
lbl_800CC2FC:
/* 0C6D5C 800CC2FC 3800FFF6 */  li      r0, -10
lbl_800CC300:
/* 0C6D60 800CC300 2C000000 */  cmpwi   r0, 0
/* 0C6D64 800CC304 41800080 */  blt     lbl_800CC384
/* 0C6D68 800CC308 38FC0000 */  addi    r7, r28, 0
/* 0C6D6C 800CC30C 38DF0008 */  addi    r6, r31, 8
/* 0C6D70 800CC310 38800020 */  li      r4, 0x20
/* 0C6D74 800CC314 4800003C */  b       lbl_800CC350
lbl_800CC318:
/* 0C6D78 800CC318 88060000 */  lbz     r0, 0(r6)
/* 0C6D7C 800CC31C 38C60001 */  addi    r6, r6, 1
/* 0C6D80 800CC320 88A70000 */  lbz     r5, 0(r7)
/* 0C6D84 800CC324 38E70001 */  addi    r7, r7, 1
/* 0C6D88 800CC328 7C030774 */  extsb   r3, r0
/* 0C6D8C 800CC32C 7CA00774 */  extsb   r0, r5
/* 0C6D90 800CC330 7C030000 */  cmpw    r3, r0
/* 0C6D94 800CC334 4182000C */  beq     lbl_800CC340
/* 0C6D98 800CC338 38000000 */  li      r0, 0
/* 0C6D9C 800CC33C 48000034 */  b       lbl_800CC370
lbl_800CC340:
/* 0C6DA0 800CC340 7CA00775 */  extsb.  r0, r5
/* 0C6DA4 800CC344 4082000C */  bne     lbl_800CC350
/* 0C6DA8 800CC348 38000001 */  li      r0, 1
/* 0C6DAC 800CC34C 48000024 */  b       lbl_800CC370
lbl_800CC350:
/* 0C6DB0 800CC350 3484FFFF */  addic.  r4, r4, -1
/* 0C6DB4 800CC354 4080FFC4 */  bge     lbl_800CC318
/* 0C6DB8 800CC358 88070000 */  lbz     r0, 0(r7)
/* 0C6DBC 800CC35C 7C000775 */  extsb.  r0, r0
/* 0C6DC0 800CC360 4082000C */  bne     lbl_800CC36C
/* 0C6DC4 800CC364 38000001 */  li      r0, 1
/* 0C6DC8 800CC368 48000008 */  b       lbl_800CC370
lbl_800CC36C:
/* 0C6DCC 800CC36C 38000000 */  li      r0, 0
lbl_800CC370:
/* 0C6DD0 800CC370 2C000000 */  cmpwi   r0, 0
/* 0C6DD4 800CC374 41820010 */  beq     lbl_800CC384
/* 0C6DD8 800CC378 93DD0000 */  stw     r30, 0(r29)
/* 0C6DDC 800CC37C 38600000 */  li      r3, 0
/* 0C6DE0 800CC380 48000018 */  b       lbl_800CC398
lbl_800CC384:
/* 0C6DE4 800CC384 3BDE0001 */  addi    r30, r30, 1
/* 0C6DE8 800CC388 2C1E007F */  cmpwi   r30, 0x7f
/* 0C6DEC 800CC38C 3BFF0040 */  addi    r31, r31, 0x40
/* 0C6DF0 800CC390 4180FF14 */  blt     lbl_800CC2A4
/* 0C6DF4 800CC394 3860FFFC */  li      r3, -4
lbl_800CC398:
/* 0C6DF8 800CC398 BB21001C */  lmw     r25, 0x1c(r1)
/* 0C6DFC 800CC39C 8001003C */  lwz     r0, 0x3c(r1)
/* 0C6E00 800CC3A0 38210038 */  addi    r1, r1, 0x38
/* 0C6E04 800CC3A4 7C0803A6 */  mtlr    r0
/* 0C6E08 800CC3A8 4E800020 */  blr     

glabel CARDOpen
/* 0C6E0C 800CC3AC 7C0802A6 */  mflr    r0
/* 0C6E10 800CC3B0 90010004 */  stw     r0, 4(r1)
/* 0C6E14 800CC3B4 3800FFFF */  li      r0, -1
/* 0C6E18 800CC3B8 9421FFC8 */  stwu    r1, -0x38(r1)
/* 0C6E1C 800CC3BC BF21001C */  stmw    r25, 0x1c(r1)
/* 0C6E20 800CC3C0 3B240000 */  addi    r25, r4, 0
/* 0C6E24 800CC3C4 3BC50000 */  addi    r30, r5, 0
/* 0C6E28 800CC3C8 3BA30000 */  addi    r29, r3, 0
/* 0C6E2C 800CC3CC 38810014 */  addi    r4, r1, 0x14
/* 0C6E30 800CC3D0 90050000 */  stw     r0, 0(r5)
/* 0C6E34 800CC3D4 4BFFBA75 */  bl      __CARDGetControlBlock
/* 0C6E38 800CC3D8 2C030000 */  cmpwi   r3, 0
/* 0C6E3C 800CC3DC 40800008 */  bge     lbl_800CC3E4
/* 0C6E40 800CC3E0 480000D4 */  b       lbl_800CC4B4
lbl_800CC3E4:
/* 0C6E44 800CC3E4 83410014 */  lwz     r26, 0x14(r1)
/* 0C6E48 800CC3E8 801A0000 */  lwz     r0, 0(r26)
/* 0C6E4C 800CC3EC 2C000000 */  cmpwi   r0, 0
/* 0C6E50 800CC3F0 4082000C */  bne     lbl_800CC3FC
/* 0C6E54 800CC3F4 3B40FFFD */  li      r26, -3
/* 0C6E58 800CC3F8 4800005C */  b       lbl_800CC454
lbl_800CC3FC:
/* 0C6E5C 800CC3FC 7F43D378 */  mr      r3, r26
/* 0C6E60 800CC400 4BFFD6C9 */  bl      __CARDGetDirBlock
/* 0C6E64 800CC404 3B630000 */  addi    r27, r3, 0
/* 0C6E68 800CC408 3B800000 */  li      r28, 0
lbl_800CC40C:
/* 0C6E6C 800CC40C 387A0000 */  addi    r3, r26, 0
/* 0C6E70 800CC410 389B0000 */  addi    r4, r27, 0
/* 0C6E74 800CC414 4BFFFB8D */  bl      __CARDAccess
/* 0C6E78 800CC418 2C030000 */  cmpwi   r3, 0
/* 0C6E7C 800CC41C 41800024 */  blt     lbl_800CC440
/* 0C6E80 800CC420 387B0000 */  addi    r3, r27, 0
/* 0C6E84 800CC424 38990000 */  addi    r4, r25, 0
/* 0C6E88 800CC428 4BFFFB11 */  bl      __CARDCompareFileName
/* 0C6E8C 800CC42C 2C030000 */  cmpwi   r3, 0
/* 0C6E90 800CC430 41820010 */  beq     lbl_800CC440
/* 0C6E94 800CC434 3BFC0000 */  addi    r31, r28, 0
/* 0C6E98 800CC438 3B400000 */  li      r26, 0
/* 0C6E9C 800CC43C 48000018 */  b       lbl_800CC454
lbl_800CC440:
/* 0C6EA0 800CC440 3B9C0001 */  addi    r28, r28, 1
/* 0C6EA4 800CC444 2C1C007F */  cmpwi   r28, 0x7f
/* 0C6EA8 800CC448 3B7B0040 */  addi    r27, r27, 0x40
/* 0C6EAC 800CC44C 4180FFC0 */  blt     lbl_800CC40C
/* 0C6EB0 800CC450 3B40FFFC */  li      r26, -4
lbl_800CC454:
/* 0C6EB4 800CC454 2C1A0000 */  cmpwi   r26, 0
/* 0C6EB8 800CC458 41800050 */  blt     lbl_800CC4A8
/* 0C6EBC 800CC45C 80610014 */  lwz     r3, 0x14(r1)
/* 0C6EC0 800CC460 4BFFD669 */  bl      __CARDGetDirBlock
/* 0C6EC4 800CC464 57E03032 */  slwi    r0, r31, 6
/* 0C6EC8 800CC468 7CA30214 */  add     r5, r3, r0
/* 0C6ECC 800CC46C A0850036 */  lhz     r4, 0x36(r5)
/* 0C6ED0 800CC470 28040005 */  cmplwi  r4, 5
/* 0C6ED4 800CC474 41800014 */  blt     lbl_800CC488
/* 0C6ED8 800CC478 80610014 */  lwz     r3, 0x14(r1)
/* 0C6EDC 800CC47C A0030010 */  lhz     r0, 0x10(r3)
/* 0C6EE0 800CC480 7C040040 */  cmplw   r4, r0
/* 0C6EE4 800CC484 4180000C */  blt     lbl_800CC490
lbl_800CC488:
/* 0C6EE8 800CC488 3B40FFFA */  li      r26, -6
/* 0C6EEC 800CC48C 4800001C */  b       lbl_800CC4A8
lbl_800CC490:
/* 0C6EF0 800CC490 93BE0000 */  stw     r29, 0(r30)
/* 0C6EF4 800CC494 38000000 */  li      r0, 0
/* 0C6EF8 800CC498 93FE0004 */  stw     r31, 4(r30)
/* 0C6EFC 800CC49C 901E0008 */  stw     r0, 8(r30)
/* 0C6F00 800CC4A0 A0050036 */  lhz     r0, 0x36(r5)
/* 0C6F04 800CC4A4 B01E0010 */  sth     r0, 0x10(r30)
lbl_800CC4A8:
/* 0C6F08 800CC4A8 80610014 */  lwz     r3, 0x14(r1)
/* 0C6F0C 800CC4AC 7F44D378 */  mr      r4, r26
/* 0C6F10 800CC4B0 4BFFBA51 */  bl      __CARDPutControlBlock
lbl_800CC4B4:
/* 0C6F14 800CC4B4 BB21001C */  lmw     r25, 0x1c(r1)
/* 0C6F18 800CC4B8 8001003C */  lwz     r0, 0x3c(r1)
/* 0C6F1C 800CC4BC 38210038 */  addi    r1, r1, 0x38
/* 0C6F20 800CC4C0 7C0803A6 */  mtlr    r0
/* 0C6F24 800CC4C4 4E800020 */  blr     

glabel CARDClose
/* 0C6F28 800CC4C8 7C0802A6 */  mflr    r0
/* 0C6F2C 800CC4CC 90010004 */  stw     r0, 4(r1)
/* 0C6F30 800CC4D0 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0C6F34 800CC4D4 93E10014 */  stw     r31, 0x14(r1)
/* 0C6F38 800CC4D8 7C7F1B78 */  mr      r31, r3
/* 0C6F3C 800CC4DC 3881000C */  addi    r4, r1, 0xc
/* 0C6F40 800CC4E0 80630000 */  lwz     r3, 0(r3)
/* 0C6F44 800CC4E4 4BFFB965 */  bl      __CARDGetControlBlock
/* 0C6F48 800CC4E8 2C030000 */  cmpwi   r3, 0
/* 0C6F4C 800CC4EC 40800008 */  bge     lbl_800CC4F4
/* 0C6F50 800CC4F0 48000018 */  b       lbl_800CC508
lbl_800CC4F4:
/* 0C6F54 800CC4F4 3800FFFF */  li      r0, -1
/* 0C6F58 800CC4F8 901F0000 */  stw     r0, 0(r31)
/* 0C6F5C 800CC4FC 38800000 */  li      r4, 0
/* 0C6F60 800CC500 8061000C */  lwz     r3, 0xc(r1)
/* 0C6F64 800CC504 4BFFB9FD */  bl      __CARDPutControlBlock
lbl_800CC508:
/* 0C6F68 800CC508 8001001C */  lwz     r0, 0x1c(r1)
/* 0C6F6C 800CC50C 83E10014 */  lwz     r31, 0x14(r1)
/* 0C6F70 800CC510 38210018 */  addi    r1, r1, 0x18
/* 0C6F74 800CC514 7C0803A6 */  mtlr    r0
/* 0C6F78 800CC518 4E800020 */  blr     

glabel __CARDIsOpened
/* 0C6F7C 800CC51C 38600000 */  li      r3, 0
/* 0C6F80 800CC520 4E800020 */  blr     


