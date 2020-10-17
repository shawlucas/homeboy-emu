# THPVideoDecode.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel CreateVideoDecodeThread
/* 00E2B4 80013854 7C0802A6 */  mflr    r0
/* 00E2B8 80013858 7C852379 */  or.     r5, r4, r4
/* 00E2BC 8001385C 90010004 */  stw     r0, 4(r1)
/* 00E2C0 80013860 3C808011 */  lis     r4, VideoDecodeThread@ha
/* 00E2C4 80013864 39030000 */  addi    r8, r3, 0
/* 00E2C8 80013868 9421FFE8 */  stwu    r1, -0x18(r1)
/* 00E2CC 8001386C 93E10014 */  stw     r31, 0x14(r1)
/* 00E2D0 80013870 3BE4A9D0 */  addi    r31, r4, VideoDecodeThread@l
/* 00E2D4 80013874 41820040 */  beq     lbl_800138B4
/* 00E2D8 80013878 3C608001 */  lis     r3, VideoDecoderForOnMemory@ha
/* 00E2DC 8001387C 38833A48 */  addi    r4, r3, VideoDecoderForOnMemory@l
/* 00E2E0 80013880 387F0000 */  addi    r3, r31, 0
/* 00E2E4 80013884 38DF1318 */  addi    r6, r31, 0x1318
/* 00E2E8 80013888 38E01000 */  li      r7, 0x1000
/* 00E2EC 8001388C 39200001 */  li      r9, 1
/* 00E2F0 80013890 48099971 */  bl      OSCreateThread
/* 00E2F4 80013894 2C030000 */  cmpwi   r3, 0
/* 00E2F8 80013898 4082005C */  bne     lbl_800138F4
/* 00E2FC 8001389C 3C60800F */  lis     r3, D_800F6640@ha
/* 00E300 800138A0 4CC63182 */  crclr   6
/* 00E304 800138A4 38636640 */  addi    r3, r3, D_800F6640@l
/* 00E308 800138A8 480967C5 */  bl      OSReport
/* 00E30C 800138AC 38600000 */  li      r3, 0
/* 00E310 800138B0 48000074 */  b       lbl_80013924
lbl_800138B4:
/* 00E314 800138B4 3C608001 */  lis     r3, VideoDecoder@ha
/* 00E318 800138B8 3883396C */  addi    r4, r3, VideoDecoder@l
/* 00E31C 800138BC 387F0000 */  addi    r3, r31, 0
/* 00E320 800138C0 38DF1318 */  addi    r6, r31, 0x1318
/* 00E324 800138C4 38A00000 */  li      r5, 0
/* 00E328 800138C8 38E01000 */  li      r7, 0x1000
/* 00E32C 800138CC 39200001 */  li      r9, 1
/* 00E330 800138D0 48099931 */  bl      OSCreateThread
/* 00E334 800138D4 2C030000 */  cmpwi   r3, 0
/* 00E338 800138D8 4082001C */  bne     lbl_800138F4
/* 00E33C 800138DC 3C60800F */  lis     r3, D_800F6640@ha
/* 00E340 800138E0 4CC63182 */  crclr   6
/* 00E344 800138E4 38636640 */  addi    r3, r3, D_800F6640@l
/* 00E348 800138E8 48096785 */  bl      OSReport
/* 00E34C 800138EC 38600000 */  li      r3, 0
/* 00E350 800138F0 48000034 */  b       lbl_80013924
lbl_800138F4:
/* 00E354 800138F4 387F1318 */  addi    r3, r31, 0x1318
/* 00E358 800138F8 389F1358 */  addi    r4, r31, 0x1358
/* 00E35C 800138FC 38A00003 */  li      r5, 3
/* 00E360 80013900 480976F5 */  bl      OSInitMessageQueue
/* 00E364 80013904 387F1338 */  addi    r3, r31, 0x1338
/* 00E368 80013908 389F1364 */  addi    r4, r31, 0x1364
/* 00E36C 8001390C 38A00003 */  li      r5, 3
/* 00E370 80013910 480976E5 */  bl      OSInitMessageQueue
/* 00E374 80013914 38000001 */  li      r0, 1
/* 00E378 80013918 900D8F38 */  stw     r0, VideoDecodeThreadCreated-_SDA_BASE_(r13)
/* 00E37C 8001391C 38600001 */  li      r3, 1
/* 00E380 80013920 900D8F3C */  stw     r0, First-_SDA_BASE_(r13)
lbl_80013924:
/* 00E384 80013924 8001001C */  lwz     r0, 0x1c(r1)
/* 00E388 80013928 83E10014 */  lwz     r31, 0x14(r1)
/* 00E38C 8001392C 38210018 */  addi    r1, r1, 0x18
/* 00E390 80013930 7C0803A6 */  mtlr    r0
/* 00E394 80013934 4E800020 */  blr     

glabel VideoDecodeThreadStart
/* 00E398 80013938 7C0802A6 */  mflr    r0
/* 00E39C 8001393C 90010004 */  stw     r0, 4(r1)
/* 00E3A0 80013940 9421FFF8 */  stwu    r1, -8(r1)
/* 00E3A4 80013944 800D8F38 */  lwz     r0, VideoDecodeThreadCreated-_SDA_BASE_(r13)
/* 00E3A8 80013948 2C000000 */  cmpwi   r0, 0
/* 00E3AC 8001394C 41820010 */  beq     lbl_8001395C
/* 00E3B0 80013950 3C608011 */  lis     r3, VideoDecodeThread@ha
/* 00E3B4 80013954 3863A9D0 */  addi    r3, r3, VideoDecodeThread@l
/* 00E3B8 80013958 48099D31 */  bl      OSResumeThread
lbl_8001395C:
/* 00E3BC 8001395C 8001000C */  lwz     r0, 0xc(r1)
/* 00E3C0 80013960 38210008 */  addi    r1, r1, 8
/* 00E3C4 80013964 7C0803A6 */  mtlr    r0
/* 00E3C8 80013968 4E800020 */  blr     

VideoDecoder:
/* 00E3CC 8001396C 7C0802A6 */  mflr    r0
/* 00E3D0 80013970 3C608011 */  lis     r3, ActivePlayer@ha
/* 00E3D4 80013974 90010004 */  stw     r0, 4(r1)
/* 00E3D8 80013978 9421FFE0 */  stwu    r1, -0x20(r1)
/* 00E3DC 8001397C 93E1001C */  stw     r31, 0x1c(r1)
/* 00E3E0 80013980 3BE38060 */  addi    r31, r3, ActivePlayer@l
/* 00E3E4 80013984 93C10018 */  stw     r30, 0x18(r1)
/* 00E3E8 80013988 3BDF00D8 */  addi    r30, r31, 0xd8
/* 00E3EC 8001398C 93A10014 */  stw     r29, 0x14(r1)
/* 00E3F0 80013990 3BBF00A7 */  addi    r29, r31, 0xa7
/* 00E3F4 80013994 93810010 */  stw     r28, 0x10(r1)
lbl_80013998:
/* 00E3F8 80013998 881D0000 */  lbz     r0, 0(r29)
/* 00E3FC 8001399C 28000000 */  cmplwi  r0, 0
/* 00E400 800139A0 41820074 */  beq     lbl_80013A14
/* 00E404 800139A4 48000064 */  b       lbl_80013A08
lbl_800139A8:
/* 00E408 800139A8 4BFFE8F5 */  bl      PopReadedBuffer2
/* 00E40C 800139AC 7C7C1B78 */  mr      r28, r3
/* 00E410 800139B0 80BF0050 */  lwz     r5, 0x50(r31)
/* 00E414 800139B4 807F00C0 */  lwz     r3, 0xc0(r31)
/* 00E418 800139B8 809C0004 */  lwz     r4, 4(r28)
/* 00E41C 800139BC 3805FFFF */  addi    r0, r5, -1
/* 00E420 800139C0 7C841A14 */  add     r4, r4, r3
/* 00E424 800139C4 7C642B96 */  divwu   r3, r4, r5
/* 00E428 800139C8 7C6329D6 */  mullw   r3, r3, r5
/* 00E42C 800139CC 7C632050 */  subf    r3, r3, r4
/* 00E430 800139D0 7C030040 */  cmplw   r3, r0
/* 00E434 800139D4 40820018 */  bne     lbl_800139EC
/* 00E438 800139D8 881F00A6 */  lbz     r0, 0xa6(r31)
/* 00E43C 800139DC 540007FF */  clrlwi. r0, r0, 0x1f
/* 00E440 800139E0 4082000C */  bne     lbl_800139EC
/* 00E444 800139E4 7F83E378 */  mr      r3, r28
/* 00E448 800139E8 48000195 */  bl      VideoDecode
lbl_800139EC:
/* 00E44C 800139EC 7F83E378 */  mr      r3, r28
/* 00E450 800139F0 4BFFE8E1 */  bl      PushFreeReadBuffer
/* 00E454 800139F4 48096D7D */  bl      OSDisableInterrupts
/* 00E458 800139F8 809E0000 */  lwz     r4, 0(r30)
/* 00E45C 800139FC 38040001 */  addi    r0, r4, 1
/* 00E460 80013A00 901E0000 */  stw     r0, 0(r30)
/* 00E464 80013A04 48096D95 */  bl      OSRestoreInterrupts
lbl_80013A08:
/* 00E468 80013A08 801E0000 */  lwz     r0, 0(r30)
/* 00E46C 80013A0C 2C000000 */  cmpwi   r0, 0
/* 00E470 80013A10 4180FF98 */  blt     lbl_800139A8
lbl_80013A14:
/* 00E474 80013A14 881D0000 */  lbz     r0, 0(r29)
/* 00E478 80013A18 28000000 */  cmplwi  r0, 0
/* 00E47C 80013A1C 41820010 */  beq     lbl_80013A2C
/* 00E480 80013A20 4BFFE87D */  bl      PopReadedBuffer2
/* 00E484 80013A24 7C7C1B78 */  mr      r28, r3
/* 00E488 80013A28 4800000C */  b       lbl_80013A34
lbl_80013A2C:
/* 00E48C 80013A2C 4BFFE8D5 */  bl      PopReadedBuffer
/* 00E490 80013A30 7C7C1B78 */  mr      r28, r3
lbl_80013A34:
/* 00E494 80013A34 7F83E378 */  mr      r3, r28
/* 00E498 80013A38 48000145 */  bl      VideoDecode
/* 00E49C 80013A3C 7F83E378 */  mr      r3, r28
/* 00E4A0 80013A40 4BFFE891 */  bl      PushFreeReadBuffer
/* 00E4A4 80013A44 4BFFFF54 */  b       lbl_80013998

VideoDecoderForOnMemory:
/* 00E4A8 80013A48 7C0802A6 */  mflr    r0
/* 00E4AC 80013A4C 3C808011 */  lis     r4, ActivePlayer@ha
/* 00E4B0 80013A50 90010004 */  stw     r0, 4(r1)
/* 00E4B4 80013A54 9421FFC8 */  stwu    r1, -0x38(r1)
/* 00E4B8 80013A58 BF610024 */  stmw    r27, 0x24(r1)
/* 00E4BC 80013A5C 3BE48060 */  addi    r31, r4, ActivePlayer@l
/* 00E4C0 80013A60 3C808011 */  lis     r4, VideoDecodeThread@ha
/* 00E4C4 80013A64 3BDF00D8 */  addi    r30, r31, 0xd8
/* 00E4C8 80013A68 3B64A9D0 */  addi    r27, r4, VideoDecodeThread@l
/* 00E4CC 80013A6C 3B800000 */  li      r28, 0
/* 00E4D0 80013A70 83BF00BC */  lwz     r29, 0xbc(r31)
/* 00E4D4 80013A74 90610010 */  stw     r3, 0x10(r1)
lbl_80013A78:
/* 00E4D8 80013A78 881F00A7 */  lbz     r0, 0xa7(r31)
/* 00E4DC 80013A7C 28000000 */  cmplwi  r0, 0
/* 00E4E0 80013A80 41820084 */  beq     lbl_80013B04
/* 00E4E4 80013A84 48000074 */  b       lbl_80013AF8
lbl_80013A88:
/* 00E4E8 80013A88 48096CE9 */  bl      OSDisableInterrupts
/* 00E4EC 80013A8C 809E0000 */  lwz     r4, 0(r30)
/* 00E4F0 80013A90 38040001 */  addi    r0, r4, 1
/* 00E4F4 80013A94 901E0000 */  stw     r0, 0(r30)
/* 00E4F8 80013A98 48096D01 */  bl      OSRestoreInterrupts
/* 00E4FC 80013A9C 801F00C0 */  lwz     r0, 0xc0(r31)
/* 00E500 80013AA0 809F0050 */  lwz     r4, 0x50(r31)
/* 00E504 80013AA4 7C7C0214 */  add     r3, r28, r0
/* 00E508 80013AA8 7C032396 */  divwu   r0, r3, r4
/* 00E50C 80013AAC 7C0021D6 */  mullw   r0, r0, r4
/* 00E510 80013AB0 7C601850 */  subf    r3, r0, r3
/* 00E514 80013AB4 3804FFFF */  addi    r0, r4, -1
/* 00E518 80013AB8 7C030040 */  cmplw   r3, r0
/* 00E51C 80013ABC 40820024 */  bne     lbl_80013AE0
/* 00E520 80013AC0 881F00A6 */  lbz     r0, 0xa6(r31)
/* 00E524 80013AC4 540007FF */  clrlwi. r0, r0, 0x1f
/* 00E528 80013AC8 4182003C */  beq     lbl_80013B04
/* 00E52C 80013ACC 80610010 */  lwz     r3, 0x10(r1)
/* 00E530 80013AD0 801F00B4 */  lwz     r0, 0xb4(r31)
/* 00E534 80013AD4 83A30000 */  lwz     r29, 0(r3)
/* 00E538 80013AD8 90010010 */  stw     r0, 0x10(r1)
/* 00E53C 80013ADC 48000018 */  b       lbl_80013AF4
lbl_80013AE0:
/* 00E540 80013AE0 80610010 */  lwz     r3, 0x10(r1)
/* 00E544 80013AE4 80830000 */  lwz     r4, 0(r3)
/* 00E548 80013AE8 7C03EA14 */  add     r0, r3, r29
/* 00E54C 80013AEC 90010010 */  stw     r0, 0x10(r1)
/* 00E550 80013AF0 7C9D2378 */  mr      r29, r4
lbl_80013AF4:
/* 00E554 80013AF4 3B9C0001 */  addi    r28, r28, 1
lbl_80013AF8:
/* 00E558 80013AF8 801E0000 */  lwz     r0, 0(r30)
/* 00E55C 80013AFC 2C000000 */  cmpwi   r0, 0
/* 00E560 80013B00 4180FF88 */  blt     lbl_80013A88
lbl_80013B04:
/* 00E564 80013B04 93810014 */  stw     r28, 0x14(r1)
/* 00E568 80013B08 38610010 */  addi    r3, r1, 0x10
/* 00E56C 80013B0C 48000071 */  bl      VideoDecode
/* 00E570 80013B10 801F00C0 */  lwz     r0, 0xc0(r31)
/* 00E574 80013B14 809F0050 */  lwz     r4, 0x50(r31)
/* 00E578 80013B18 7C7C0214 */  add     r3, r28, r0
/* 00E57C 80013B1C 7C032396 */  divwu   r0, r3, r4
/* 00E580 80013B20 7C0021D6 */  mullw   r0, r0, r4
/* 00E584 80013B24 7C601850 */  subf    r3, r0, r3
/* 00E588 80013B28 3804FFFF */  addi    r0, r4, -1
/* 00E58C 80013B2C 7C030040 */  cmplw   r3, r0
/* 00E590 80013B30 40820030 */  bne     lbl_80013B60
/* 00E594 80013B34 881F00A6 */  lbz     r0, 0xa6(r31)
/* 00E598 80013B38 540007FF */  clrlwi. r0, r0, 0x1f
/* 00E59C 80013B3C 41820018 */  beq     lbl_80013B54
/* 00E5A0 80013B40 80610010 */  lwz     r3, 0x10(r1)
/* 00E5A4 80013B44 801F00B4 */  lwz     r0, 0xb4(r31)
/* 00E5A8 80013B48 83A30000 */  lwz     r29, 0(r3)
/* 00E5AC 80013B4C 90010010 */  stw     r0, 0x10(r1)
/* 00E5B0 80013B50 48000024 */  b       lbl_80013B74
lbl_80013B54:
/* 00E5B4 80013B54 7F63DB78 */  mr      r3, r27
/* 00E5B8 80013B58 48099DB9 */  bl      OSSuspendThread
/* 00E5BC 80013B5C 48000018 */  b       lbl_80013B74
lbl_80013B60:
/* 00E5C0 80013B60 80610010 */  lwz     r3, 0x10(r1)
/* 00E5C4 80013B64 80830000 */  lwz     r4, 0(r3)
/* 00E5C8 80013B68 7C03EA14 */  add     r0, r3, r29
/* 00E5CC 80013B6C 90010010 */  stw     r0, 0x10(r1)
/* 00E5D0 80013B70 7C9D2378 */  mr      r29, r4
lbl_80013B74:
/* 00E5D4 80013B74 3B9C0001 */  addi    r28, r28, 1
/* 00E5D8 80013B78 4BFFFF00 */  b       lbl_80013A78

VideoDecode:
/* 00E5DC 80013B7C 7C0802A6 */  mflr    r0
/* 00E5E0 80013B80 3C808011 */  lis     r4, ActivePlayer@ha
/* 00E5E4 80013B84 90010004 */  stw     r0, 4(r1)
/* 00E5E8 80013B88 9421FFC8 */  stwu    r1, -0x38(r1)
/* 00E5EC 80013B8C BEE10014 */  stmw    r23, 0x14(r1)
/* 00E5F0 80013B90 3BE48060 */  addi    r31, r4, ActivePlayer@l
/* 00E5F4 80013B94 7C781B78 */  mr      r24, r3
/* 00E5F8 80013B98 3BBF006C */  addi    r29, r31, 0x6c
/* 00E5FC 80013B9C 801F006C */  lwz     r0, 0x6c(r31)
/* 00E600 80013BA0 80830000 */  lwz     r4, 0(r3)
/* 00E604 80013BA4 5403103A */  slwi    r3, r0, 2
/* 00E608 80013BA8 3B230008 */  addi    r25, r3, 8
/* 00E60C 80013BAC 3B440008 */  addi    r26, r4, 8
/* 00E610 80013BB0 7F24CA14 */  add     r25, r4, r25
/* 00E614 80013BB4 480000E9 */  bl      PopFreeTextureSet
/* 00E618 80013BB8 3C808011 */  lis     r4, VideoDecodeThread@ha
/* 00E61C 80013BBC 3B830000 */  addi    r28, r3, 0
/* 00E620 80013BC0 3BDF0000 */  addi    r30, r31, 0
/* 00E624 80013BC4 3AE4A9D0 */  addi    r23, r4, VideoDecodeThread@l
/* 00E628 80013BC8 3B600000 */  li      r27, 0
/* 00E62C 80013BCC 48000094 */  b       lbl_80013C60
lbl_80013BD0:
/* 00E630 80013BD0 881E0070 */  lbz     r0, 0x70(r30)
/* 00E634 80013BD4 2C000000 */  cmpwi   r0, 0
/* 00E638 80013BD8 41820008 */  beq     lbl_80013BE0
/* 00E63C 80013BDC 48000070 */  b       lbl_80013C4C
lbl_80013BE0:
/* 00E640 80013BE0 809C0000 */  lwz     r4, 0(r28)
/* 00E644 80013BE4 7F23CB78 */  mr      r3, r25
/* 00E648 80013BE8 80BC0004 */  lwz     r5, 4(r28)
/* 00E64C 80013BEC 80DC0008 */  lwz     r6, 8(r28)
/* 00E650 80013BF0 80FF009C */  lwz     r7, 0x9c(r31)
/* 00E654 80013BF4 480B9A5D */  bl      THPVideoDecode
/* 00E658 80013BF8 2C030000 */  cmpwi   r3, 0
/* 00E65C 80013BFC 907F00AC */  stw     r3, 0xac(r31)
/* 00E660 80013C00 41820028 */  beq     lbl_80013C28
/* 00E664 80013C04 800D8F3C */  lwz     r0, First-_SDA_BASE_(r13)
/* 00E668 80013C08 2C000000 */  cmpwi   r0, 0
/* 00E66C 80013C0C 41820014 */  beq     lbl_80013C20
/* 00E670 80013C10 38600000 */  li      r3, 0
/* 00E674 80013C14 4BFFCD11 */  bl      PrepareReady
/* 00E678 80013C18 38000000 */  li      r0, 0
/* 00E67C 80013C1C 900D8F3C */  stw     r0, First-_SDA_BASE_(r13)
lbl_80013C20:
/* 00E680 80013C20 7EE3BB78 */  mr      r3, r23
/* 00E684 80013C24 48099CED */  bl      OSSuspendThread
lbl_80013C28:
/* 00E688 80013C28 80180004 */  lwz     r0, 4(r24)
/* 00E68C 80013C2C 7F83E378 */  mr      r3, r28
/* 00E690 80013C30 901C000C */  stw     r0, 0xc(r28)
/* 00E694 80013C34 48000111 */  bl      PushDecodedTextureSet
/* 00E698 80013C38 48096B39 */  bl      OSDisableInterrupts
/* 00E69C 80013C3C 809F00D8 */  lwz     r4, 0xd8(r31)
/* 00E6A0 80013C40 38040001 */  addi    r0, r4, 1
/* 00E6A4 80013C44 901F00D8 */  stw     r0, 0xd8(r31)
/* 00E6A8 80013C48 48096B51 */  bl      OSRestoreInterrupts
lbl_80013C4C:
/* 00E6AC 80013C4C 801A0000 */  lwz     r0, 0(r26)
/* 00E6B0 80013C50 3B7B0001 */  addi    r27, r27, 1
/* 00E6B4 80013C54 3B5A0004 */  addi    r26, r26, 4
/* 00E6B8 80013C58 7F390214 */  add     r25, r25, r0
/* 00E6BC 80013C5C 3BDE0001 */  addi    r30, r30, 1
lbl_80013C60:
/* 00E6C0 80013C60 801D0000 */  lwz     r0, 0(r29)
/* 00E6C4 80013C64 7C1B0040 */  cmplw   r27, r0
/* 00E6C8 80013C68 4180FF68 */  blt     lbl_80013BD0
/* 00E6CC 80013C6C 800D8F3C */  lwz     r0, First-_SDA_BASE_(r13)
/* 00E6D0 80013C70 2C000000 */  cmpwi   r0, 0
/* 00E6D4 80013C74 41820014 */  beq     lbl_80013C88
/* 00E6D8 80013C78 38600001 */  li      r3, 1
/* 00E6DC 80013C7C 4BFFCCA9 */  bl      PrepareReady
/* 00E6E0 80013C80 38000000 */  li      r0, 0
/* 00E6E4 80013C84 900D8F3C */  stw     r0, First-_SDA_BASE_(r13)
lbl_80013C88:
/* 00E6E8 80013C88 BAE10014 */  lmw     r23, 0x14(r1)
/* 00E6EC 80013C8C 8001003C */  lwz     r0, 0x3c(r1)
/* 00E6F0 80013C90 38210038 */  addi    r1, r1, 0x38
/* 00E6F4 80013C94 7C0803A6 */  mtlr    r0
/* 00E6F8 80013C98 4E800020 */  blr     

glabel PopFreeTextureSet
/* 00E6FC 80013C9C 7C0802A6 */  mflr    r0
/* 00E700 80013CA0 3C608011 */  lis     r3, FreeTextureSetQueue@ha
/* 00E704 80013CA4 90010004 */  stw     r0, 4(r1)
/* 00E708 80013CA8 3863BCE8 */  addi    r3, r3, FreeTextureSetQueue@l
/* 00E70C 80013CAC 38A00001 */  li      r5, 1
/* 00E710 80013CB0 9421FFF0 */  stwu    r1, -0x10(r1)
/* 00E714 80013CB4 38810008 */  addi    r4, r1, 8
/* 00E718 80013CB8 48097465 */  bl      OSReceiveMessage
/* 00E71C 80013CBC 80010014 */  lwz     r0, 0x14(r1)
/* 00E720 80013CC0 80610008 */  lwz     r3, 8(r1)
/* 00E724 80013CC4 38210010 */  addi    r1, r1, 0x10
/* 00E728 80013CC8 7C0803A6 */  mtlr    r0
/* 00E72C 80013CCC 4E800020 */  blr     

glabel PushFreeTextureSet
/* 00E730 80013CD0 7C0802A6 */  mflr    r0
/* 00E734 80013CD4 3CA08011 */  lis     r5, FreeTextureSetQueue@ha
/* 00E738 80013CD8 90010004 */  stw     r0, 4(r1)
/* 00E73C 80013CDC 38830000 */  addi    r4, r3, 0
/* 00E740 80013CE0 3865BCE8 */  addi    r3, r5, FreeTextureSetQueue@l
/* 00E744 80013CE4 9421FFF8 */  stwu    r1, -8(r1)
/* 00E748 80013CE8 38A00000 */  li      r5, 0
/* 00E74C 80013CEC 48097369 */  bl      OSSendMessage
/* 00E750 80013CF0 8001000C */  lwz     r0, 0xc(r1)
/* 00E754 80013CF4 38210008 */  addi    r1, r1, 8
/* 00E758 80013CF8 7C0803A6 */  mtlr    r0
/* 00E75C 80013CFC 4E800020 */  blr     

glabel PopDecodedTextureSet
/* 00E760 80013D00 7C0802A6 */  mflr    r0
/* 00E764 80013D04 3C808011 */  lis     r4, DecodedTextureSetQueue@ha
/* 00E768 80013D08 90010004 */  stw     r0, 4(r1)
/* 00E76C 80013D0C 38A30000 */  addi    r5, r3, 0
/* 00E770 80013D10 3864BD08 */  addi    r3, r4, DecodedTextureSetQueue@l
/* 00E774 80013D14 9421FFF0 */  stwu    r1, -0x10(r1)
/* 00E778 80013D18 3881000C */  addi    r4, r1, 0xc
/* 00E77C 80013D1C 48097401 */  bl      OSReceiveMessage
/* 00E780 80013D20 2C030001 */  cmpwi   r3, 1
/* 00E784 80013D24 4082000C */  bne     lbl_80013D30
/* 00E788 80013D28 8061000C */  lwz     r3, 0xc(r1)
/* 00E78C 80013D2C 48000008 */  b       lbl_80013D34
lbl_80013D30:
/* 00E790 80013D30 38600000 */  li      r3, 0
lbl_80013D34:
/* 00E794 80013D34 80010014 */  lwz     r0, 0x14(r1)
/* 00E798 80013D38 38210010 */  addi    r1, r1, 0x10
/* 00E79C 80013D3C 7C0803A6 */  mtlr    r0
/* 00E7A0 80013D40 4E800020 */  blr     

glabel PushDecodedTextureSet
/* 00E7A4 80013D44 7C0802A6 */  mflr    r0
/* 00E7A8 80013D48 3CA08011 */  lis     r5, DecodedTextureSetQueue@ha
/* 00E7AC 80013D4C 90010004 */  stw     r0, 4(r1)
/* 00E7B0 80013D50 38830000 */  addi    r4, r3, 0
/* 00E7B4 80013D54 3865BD08 */  addi    r3, r5, DecodedTextureSetQueue@l
/* 00E7B8 80013D58 9421FFF8 */  stwu    r1, -8(r1)
/* 00E7BC 80013D5C 38A00001 */  li      r5, 1
/* 00E7C0 80013D60 480972F5 */  bl      OSSendMessage
/* 00E7C4 80013D64 8001000C */  lwz     r0, 0xc(r1)
/* 00E7C8 80013D68 38210008 */  addi    r1, r1, 8
/* 00E7CC 80013D6C 7C0803A6 */  mtlr    r0
/* 00E7D0 80013D70 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000F36C0 800F6640 0022 */
D_800F6640:
    .asciz "Can't create video decode thread\n"


.section .bss, "wa"

.balign 4

/* 00107A50 8010A9D0 0318 */
VideoDecodeThread:
    .skip 792

.balign 4

/* 00107D68 8010ACE8 1000 */
VideoDecodeThreadStack:
    .skip 4096

.balign 4

/* 00108D68 8010BCE8 0020 */
FreeTextureSetQueue:
    .skip 32

.balign 4

/* 00108D88 8010BD08 0020 */
DecodedTextureSetQueue:
    .skip 32

.balign 4

/* 00108DA8 8010BD28 000C */
FreeTextureSetMessage:
    .skip 12

.balign 4

/* 00108DB4 8010BD34 000C */
DecodedTextureSetMessage:
    .skip 12


.section .sbss, "wa"

.balign 8

/* 00100178 80145918 0004 */
VideoDecodeThreadCreated:
    .skip 4

.balign 4

/* 0010017C 8014591C 0004 */
First:
    .skip 4


