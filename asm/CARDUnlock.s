# CARDUnlock.c
.include "macros.inc"

.section .text, "ax"

.balign 4

bitrev:
/* 0C2C2C 800C81CC 38000008 */  li      r0, 8
/* 0C2C30 800C81D0 7C0903A6 */  mtctr   r0
/* 0C2C34 800C81D4 54660FFE */  srwi    r6, r3, 0x1f
/* 0C2C38 800C81D8 39200000 */  li      r9, 0
/* 0C2C3C 800C81DC 39400001 */  li      r10, 1
/* 0C2C40 800C81E0 38E00000 */  li      r7, 0
/* 0C2C44 800C81E4 39000000 */  li      r8, 0
/* 0C2C48 800C81E8 38A00001 */  li      r5, 1
lbl_800C81EC:
/* 0C2C4C 800C81EC 2808000F */  cmplwi  r8, 0xf
/* 0C2C50 800C81F0 4081002C */  ble     lbl_800C821C
/* 0C2C54 800C81F4 2808001F */  cmplwi  r8, 0x1f
/* 0C2C58 800C81F8 4082000C */  bne     lbl_800C8204
/* 0C2C5C 800C81FC 7CE73378 */  or      r7, r7, r6
/* 0C2C60 800C8200 48000038 */  b       lbl_800C8238
lbl_800C8204:
/* 0C2C64 800C8204 7CA04030 */  slw     r0, r5, r8
/* 0C2C68 800C8208 7C600038 */  and     r0, r3, r0
/* 0C2C6C 800C820C 7C005430 */  srw     r0, r0, r10
/* 0C2C70 800C8210 7CE70378 */  or      r7, r7, r0
/* 0C2C74 800C8214 394A0002 */  addi    r10, r10, 2
/* 0C2C78 800C8218 48000020 */  b       lbl_800C8238
lbl_800C821C:
/* 0C2C7C 800C821C 7CA44030 */  slw     r4, r5, r8
/* 0C2C80 800C8220 2008001F */  subfic  r0, r8, 0x1f
/* 0C2C84 800C8224 7C090050 */  subf    r0, r9, r0
/* 0C2C88 800C8228 7C642038 */  and     r4, r3, r4
/* 0C2C8C 800C822C 7C800030 */  slw     r0, r4, r0
/* 0C2C90 800C8230 7CE70378 */  or      r7, r7, r0
/* 0C2C94 800C8234 39290001 */  addi    r9, r9, 1
lbl_800C8238:
/* 0C2C98 800C8238 39080001 */  addi    r8, r8, 1
/* 0C2C9C 800C823C 2808000F */  cmplwi  r8, 0xf
/* 0C2CA0 800C8240 4081002C */  ble     lbl_800C826C
/* 0C2CA4 800C8244 2808001F */  cmplwi  r8, 0x1f
/* 0C2CA8 800C8248 4082000C */  bne     lbl_800C8254
/* 0C2CAC 800C824C 7CE73378 */  or      r7, r7, r6
/* 0C2CB0 800C8250 48000038 */  b       lbl_800C8288
lbl_800C8254:
/* 0C2CB4 800C8254 7CA04030 */  slw     r0, r5, r8
/* 0C2CB8 800C8258 7C600038 */  and     r0, r3, r0
/* 0C2CBC 800C825C 7C005430 */  srw     r0, r0, r10
/* 0C2CC0 800C8260 7CE70378 */  or      r7, r7, r0
/* 0C2CC4 800C8264 394A0002 */  addi    r10, r10, 2
/* 0C2CC8 800C8268 48000020 */  b       lbl_800C8288
lbl_800C826C:
/* 0C2CCC 800C826C 7CA44030 */  slw     r4, r5, r8
/* 0C2CD0 800C8270 2008001F */  subfic  r0, r8, 0x1f
/* 0C2CD4 800C8274 7C090050 */  subf    r0, r9, r0
/* 0C2CD8 800C8278 7C642038 */  and     r4, r3, r4
/* 0C2CDC 800C827C 7C800030 */  slw     r0, r4, r0
/* 0C2CE0 800C8280 7CE70378 */  or      r7, r7, r0
/* 0C2CE4 800C8284 39290001 */  addi    r9, r9, 1
lbl_800C8288:
/* 0C2CE8 800C8288 39080001 */  addi    r8, r8, 1
/* 0C2CEC 800C828C 2808000F */  cmplwi  r8, 0xf
/* 0C2CF0 800C8290 4081002C */  ble     lbl_800C82BC
/* 0C2CF4 800C8294 2808001F */  cmplwi  r8, 0x1f
/* 0C2CF8 800C8298 4082000C */  bne     lbl_800C82A4
/* 0C2CFC 800C829C 7CE73378 */  or      r7, r7, r6
/* 0C2D00 800C82A0 48000038 */  b       lbl_800C82D8
lbl_800C82A4:
/* 0C2D04 800C82A4 7CA04030 */  slw     r0, r5, r8
/* 0C2D08 800C82A8 7C600038 */  and     r0, r3, r0
/* 0C2D0C 800C82AC 7C005430 */  srw     r0, r0, r10
/* 0C2D10 800C82B0 7CE70378 */  or      r7, r7, r0
/* 0C2D14 800C82B4 394A0002 */  addi    r10, r10, 2
/* 0C2D18 800C82B8 48000020 */  b       lbl_800C82D8
lbl_800C82BC:
/* 0C2D1C 800C82BC 7CA44030 */  slw     r4, r5, r8
/* 0C2D20 800C82C0 2008001F */  subfic  r0, r8, 0x1f
/* 0C2D24 800C82C4 7C090050 */  subf    r0, r9, r0
/* 0C2D28 800C82C8 7C642038 */  and     r4, r3, r4
/* 0C2D2C 800C82CC 7C800030 */  slw     r0, r4, r0
/* 0C2D30 800C82D0 7CE70378 */  or      r7, r7, r0
/* 0C2D34 800C82D4 39290001 */  addi    r9, r9, 1
lbl_800C82D8:
/* 0C2D38 800C82D8 39080001 */  addi    r8, r8, 1
/* 0C2D3C 800C82DC 2808000F */  cmplwi  r8, 0xf
/* 0C2D40 800C82E0 4081002C */  ble     lbl_800C830C
/* 0C2D44 800C82E4 2808001F */  cmplwi  r8, 0x1f
/* 0C2D48 800C82E8 4082000C */  bne     lbl_800C82F4
/* 0C2D4C 800C82EC 7CE73378 */  or      r7, r7, r6
/* 0C2D50 800C82F0 48000038 */  b       lbl_800C8328
lbl_800C82F4:
/* 0C2D54 800C82F4 7CA04030 */  slw     r0, r5, r8
/* 0C2D58 800C82F8 7C600038 */  and     r0, r3, r0
/* 0C2D5C 800C82FC 7C005430 */  srw     r0, r0, r10
/* 0C2D60 800C8300 7CE70378 */  or      r7, r7, r0
/* 0C2D64 800C8304 394A0002 */  addi    r10, r10, 2
/* 0C2D68 800C8308 48000020 */  b       lbl_800C8328
lbl_800C830C:
/* 0C2D6C 800C830C 7CA44030 */  slw     r4, r5, r8
/* 0C2D70 800C8310 2008001F */  subfic  r0, r8, 0x1f
/* 0C2D74 800C8314 7C090050 */  subf    r0, r9, r0
/* 0C2D78 800C8318 7C642038 */  and     r4, r3, r4
/* 0C2D7C 800C831C 7C800030 */  slw     r0, r4, r0
/* 0C2D80 800C8320 7CE70378 */  or      r7, r7, r0
/* 0C2D84 800C8324 39290001 */  addi    r9, r9, 1
lbl_800C8328:
/* 0C2D88 800C8328 39080001 */  addi    r8, r8, 1
/* 0C2D8C 800C832C 4200FEC0 */  bdnz    lbl_800C81EC
/* 0C2D90 800C8330 7CE33B78 */  mr      r3, r7
/* 0C2D94 800C8334 4E800020 */  blr     

ReadArrayUnlock:
/* 0C2D98 800C8338 7C0802A6 */  mflr    r0
/* 0C2D9C 800C833C 90010004 */  stw     r0, 4(r1)
/* 0C2DA0 800C8340 9421FFC0 */  stwu    r1, -0x40(r1)
/* 0C2DA4 800C8344 BF410028 */  stmw    r26, 0x28(r1)
/* 0C2DA8 800C8348 3BA30000 */  addi    r29, r3, 0
/* 0C2DAC 800C834C 3C608014 */  lis     r3, __CARDBlock@ha
/* 0C2DB0 800C8350 380324D0 */  addi    r0, r3, __CARDBlock@l
/* 0C2DB4 800C8354 1D1D0110 */  mulli   r8, r29, 0x110
/* 0C2DB8 800C8358 3B440000 */  addi    r26, r4, 0
/* 0C2DBC 800C835C 3BC50000 */  addi    r30, r5, 0
/* 0C2DC0 800C8360 3BE60000 */  addi    r31, r6, 0
/* 0C2DC4 800C8364 3B670000 */  addi    r27, r7, 0
/* 0C2DC8 800C8368 387D0000 */  addi    r3, r29, 0
/* 0C2DCC 800C836C 7F804214 */  add     r28, r0, r8
/* 0C2DD0 800C8370 38800000 */  li      r4, 0
/* 0C2DD4 800C8374 38A00004 */  li      r5, 4
/* 0C2DD8 800C8378 4BFE6ABD */  bl      EXISelect
/* 0C2DDC 800C837C 2C030000 */  cmpwi   r3, 0
/* 0C2DE0 800C8380 4082000C */  bne     lbl_800C838C
/* 0C2DE4 800C8384 3860FFFD */  li      r3, -3
/* 0C2DE8 800C8388 480000E0 */  b       lbl_800C8468
lbl_800C838C:
/* 0C2DEC 800C838C 575A0026 */  rlwinm  r26, r26, 0, 0, 0x13
/* 0C2DF0 800C8390 3861001C */  addi    r3, r1, 0x1c
/* 0C2DF4 800C8394 38800000 */  li      r4, 0
/* 0C2DF8 800C8398 38A00005 */  li      r5, 5
/* 0C2DFC 800C839C 4BF3D035 */  bl      memset
/* 0C2E00 800C83A0 38000052 */  li      r0, 0x52
/* 0C2E04 800C83A4 2C1B0000 */  cmpwi   r27, 0
/* 0C2E08 800C83A8 9801001C */  stb     r0, 0x1c(r1)
/* 0C2E0C 800C83AC 40820028 */  bne     lbl_800C83D4
/* 0C2E10 800C83B0 57401FBE */  rlwinm  r0, r26, 3, 0x1e, 0x1f
/* 0C2E14 800C83B4 9801001D */  stb     r0, 0x1d(r1)
/* 0C2E18 800C83B8 57405E3E */  rlwinm  r0, r26, 0xb, 0x18, 0x1f
/* 0C2E1C 800C83BC 57436FBE */  rlwinm  r3, r26, 0xd, 0x1e, 0x1f
/* 0C2E20 800C83C0 9801001E */  stb     r0, 0x1e(r1)
/* 0C2E24 800C83C4 5740A67E */  rlwinm  r0, r26, 0x14, 0x19, 0x1f
/* 0C2E28 800C83C8 9861001F */  stb     r3, 0x1f(r1)
/* 0C2E2C 800C83CC 98010020 */  stb     r0, 0x20(r1)
/* 0C2E30 800C83D0 48000014 */  b       lbl_800C83E4
lbl_800C83D4:
/* 0C2E34 800C83D4 5740463E */  srwi    r0, r26, 0x18
/* 0C2E38 800C83D8 9801001D */  stb     r0, 0x1d(r1)
/* 0C2E3C 800C83DC 5740863E */  rlwinm  r0, r26, 0x10, 0x18, 0x1f
/* 0C2E40 800C83E0 9801001E */  stb     r0, 0x1e(r1)
lbl_800C83E4:
/* 0C2E44 800C83E4 387D0000 */  addi    r3, r29, 0
/* 0C2E48 800C83E8 3881001C */  addi    r4, r1, 0x1c
/* 0C2E4C 800C83EC 38A00005 */  li      r5, 5
/* 0C2E50 800C83F0 38C00001 */  li      r6, 1
/* 0C2E54 800C83F4 4BFE6135 */  bl      EXIImmEx
/* 0C2E58 800C83F8 809C0080 */  lwz     r4, 0x80(r28)
/* 0C2E5C 800C83FC 7C600034 */  cntlzw  r0, r3
/* 0C2E60 800C8400 80BC0014 */  lwz     r5, 0x14(r28)
/* 0C2E64 800C8404 387D0000 */  addi    r3, r29, 0
/* 0C2E68 800C8408 541CD97E */  srwi    r28, r0, 5
/* 0C2E6C 800C840C 38840200 */  addi    r4, r4, 0x200
/* 0C2E70 800C8410 38C00001 */  li      r6, 1
/* 0C2E74 800C8414 4BFE6115 */  bl      EXIImmEx
/* 0C2E78 800C8418 7C600034 */  cntlzw  r0, r3
/* 0C2E7C 800C841C 5400D97E */  srwi    r0, r0, 5
/* 0C2E80 800C8420 387D0000 */  addi    r3, r29, 0
/* 0C2E84 800C8424 389E0000 */  addi    r4, r30, 0
/* 0C2E88 800C8428 38BF0000 */  addi    r5, r31, 0
/* 0C2E8C 800C842C 7F9C0378 */  or      r28, r28, r0
/* 0C2E90 800C8430 38C00000 */  li      r6, 0
/* 0C2E94 800C8434 4BFE60F5 */  bl      EXIImmEx
/* 0C2E98 800C8438 7C600034 */  cntlzw  r0, r3
/* 0C2E9C 800C843C 5400D97E */  srwi    r0, r0, 5
/* 0C2EA0 800C8440 387D0000 */  addi    r3, r29, 0
/* 0C2EA4 800C8444 7F9C0378 */  or      r28, r28, r0
/* 0C2EA8 800C8448 4BFE6B19 */  bl      EXIDeselect
/* 0C2EAC 800C844C 7C600034 */  cntlzw  r0, r3
/* 0C2EB0 800C8450 5400D97E */  srwi    r0, r0, 5
/* 0C2EB4 800C8454 7F9C0379 */  or.     r28, r28, r0
/* 0C2EB8 800C8458 4182000C */  beq     lbl_800C8464
/* 0C2EBC 800C845C 3860FFFD */  li      r3, -3
/* 0C2EC0 800C8460 48000008 */  b       lbl_800C8468
lbl_800C8464:
/* 0C2EC4 800C8464 38600000 */  li      r3, 0
lbl_800C8468:
/* 0C2EC8 800C8468 BB410028 */  lmw     r26, 0x28(r1)
/* 0C2ECC 800C846C 80010044 */  lwz     r0, 0x44(r1)
/* 0C2ED0 800C8470 38210040 */  addi    r1, r1, 0x40
/* 0C2ED4 800C8474 7C0803A6 */  mtlr    r0
/* 0C2ED8 800C8478 4E800020 */  blr     

DummyLen:
/* 0C2EDC 800C847C 7C0802A6 */  mflr    r0
/* 0C2EE0 800C8480 90010004 */  stw     r0, 4(r1)
/* 0C2EE4 800C8484 9421FFD8 */  stwu    r1, -0x28(r1)
/* 0C2EE8 800C8488 93E10024 */  stw     r31, 0x24(r1)
/* 0C2EEC 800C848C 93C10020 */  stw     r30, 0x20(r1)
/* 0C2EF0 800C8490 3BC00001 */  li      r30, 1
/* 0C2EF4 800C8494 93A1001C */  stw     r29, 0x1c(r1)
/* 0C2EF8 800C8498 3BA00000 */  li      r29, 0
/* 0C2EFC 800C849C 4BFE5899 */  bl      OSGetTick
/* 0C2F00 800C84A0 906D8E30 */  stw     r3, next-_SDA_BASE_(r13)
/* 0C2F04 800C84A4 3C6041C6 */  lis     r3, 0x41c6
/* 0C2F08 800C84A8 3BE34E6D */  addi    r31, r3, 0x4e6d
/* 0C2F0C 800C84AC 800D8E30 */  lwz     r0, next-_SDA_BASE_(r13)
/* 0C2F10 800C84B0 7C60F9D6 */  mullw   r3, r0, r31
/* 0C2F14 800C84B4 38033039 */  addi    r0, r3, 0x3039
/* 0C2F18 800C84B8 900D8E30 */  stw     r0, next-_SDA_BASE_(r13)
/* 0C2F1C 800C84BC 800D8E30 */  lwz     r0, next-_SDA_BASE_(r13)
/* 0C2F20 800C84C0 540386FE */  rlwinm  r3, r0, 0x10, 0x1b, 0x1f
/* 0C2F24 800C84C4 38630001 */  addi    r3, r3, 1
/* 0C2F28 800C84C8 48000040 */  b       lbl_800C8508
lbl_800C84CC:
/* 0C2F2C 800C84CC 4BFE5869 */  bl      OSGetTick
/* 0C2F30 800C84D0 7C60F030 */  slw     r0, r3, r30
/* 0C2F34 800C84D4 3BDE0001 */  addi    r30, r30, 1
/* 0C2F38 800C84D8 281E0010 */  cmplwi  r30, 0x10
/* 0C2F3C 800C84DC 40810008 */  ble     lbl_800C84E4
/* 0C2F40 800C84E0 3BC00001 */  li      r30, 1
lbl_800C84E4:
/* 0C2F44 800C84E4 900D8E30 */  stw     r0, next-_SDA_BASE_(r13)
/* 0C2F48 800C84E8 3BBD0001 */  addi    r29, r29, 1
/* 0C2F4C 800C84EC 800D8E30 */  lwz     r0, next-_SDA_BASE_(r13)
/* 0C2F50 800C84F0 7C60F9D6 */  mullw   r3, r0, r31
/* 0C2F54 800C84F4 38033039 */  addi    r0, r3, 0x3039
/* 0C2F58 800C84F8 900D8E30 */  stw     r0, next-_SDA_BASE_(r13)
/* 0C2F5C 800C84FC 800D8E30 */  lwz     r0, next-_SDA_BASE_(r13)
/* 0C2F60 800C8500 540386FE */  rlwinm  r3, r0, 0x10, 0x1b, 0x1f
/* 0C2F64 800C8504 38630001 */  addi    r3, r3, 1
lbl_800C8508:
/* 0C2F68 800C8508 2C030004 */  cmpwi   r3, 4
/* 0C2F6C 800C850C 4080000C */  bge     lbl_800C8518
/* 0C2F70 800C8510 281D000A */  cmplwi  r29, 0xa
/* 0C2F74 800C8514 4180FFB8 */  blt     lbl_800C84CC
lbl_800C8518:
/* 0C2F78 800C8518 2C030004 */  cmpwi   r3, 4
/* 0C2F7C 800C851C 40800008 */  bge     lbl_800C8524
/* 0C2F80 800C8520 38600004 */  li      r3, 4
lbl_800C8524:
/* 0C2F84 800C8524 8001002C */  lwz     r0, 0x2c(r1)
/* 0C2F88 800C8528 83E10024 */  lwz     r31, 0x24(r1)
/* 0C2F8C 800C852C 83C10020 */  lwz     r30, 0x20(r1)
/* 0C2F90 800C8530 83A1001C */  lwz     r29, 0x1c(r1)
/* 0C2F94 800C8534 38210028 */  addi    r1, r1, 0x28
/* 0C2F98 800C8538 7C0803A6 */  mtlr    r0
/* 0C2F9C 800C853C 4E800020 */  blr     

glabel __CARDUnlock
/* 0C2FA0 800C8540 7C0802A6 */  mflr    r0
/* 0C2FA4 800C8544 90010004 */  stw     r0, 4(r1)
/* 0C2FA8 800C8548 9421FEE0 */  stwu    r1, -0x120(r1)
/* 0C2FAC 800C854C BEC100F8 */  stmw    r22, 0xf8(r1)
/* 0C2FB0 800C8550 3B030000 */  addi    r24, r3, 0
/* 0C2FB4 800C8554 3C608014 */  lis     r3, __CARDBlock@ha
/* 0C2FB8 800C8558 1CB80110 */  mulli   r5, r24, 0x110
/* 0C2FBC 800C855C 380324D0 */  addi    r0, r3, __CARDBlock@l
/* 0C2FC0 800C8560 7FE02A14 */  add     r31, r0, r5
/* 0C2FC4 800C8564 3AE40000 */  addi    r23, r4, 0
/* 0C2FC8 800C8568 3BDF0030 */  addi    r30, r31, 0x30
/* 0C2FCC 800C856C 807F0080 */  lwz     r3, 0x80(r31)
/* 0C2FD0 800C8570 3803002F */  addi    r0, r3, 0x2f
/* 0C2FD4 800C8574 541C0034 */  rlwinm  r28, r0, 0, 0, 0x1a
/* 0C2FD8 800C8578 3BA30000 */  addi    r29, r3, 0
/* 0C2FDC 800C857C 3ADC0020 */  addi    r22, r28, 0x20
/* 0C2FE0 800C8580 4BFE57B5 */  bl      OSGetTick
/* 0C2FE4 800C8584 906D8E30 */  stw     r3, next-_SDA_BASE_(r13)
/* 0C2FE8 800C8588 3C6041C6 */  lis     r3, 0x41c6
/* 0C2FEC 800C858C 3CA07FED */  lis     r5, 0x7fed
/* 0C2FF0 800C8590 808D8E30 */  lwz     r4, next-_SDA_BASE_(r13)
/* 0C2FF4 800C8594 38034E6D */  addi    r0, r3, 0x4e6d
/* 0C2FF8 800C8598 3B258000 */  addi    r25, r5, -32768
/* 0C2FFC 800C859C 7C6401D6 */  mullw   r3, r4, r0
/* 0C3000 800C85A0 38033039 */  addi    r0, r3, 0x3039
/* 0C3004 800C85A4 900D8E30 */  stw     r0, next-_SDA_BASE_(r13)
/* 0C3008 800C85A8 800D8E30 */  lwz     r0, next-_SDA_BASE_(r13)
/* 0C300C 800C85AC 5400847E */  rlwinm  r0, r0, 0x10, 0x11, 0x1f
/* 0C3010 800C85B0 7F390378 */  or      r25, r25, r0
/* 0C3014 800C85B4 57390026 */  rlwinm  r25, r25, 0, 0, 0x13
/* 0C3018 800C85B8 4BFFFEC5 */  bl      DummyLen
/* 0C301C 800C85BC 3B430000 */  addi    r26, r3, 0
/* 0C3020 800C85C0 38DA0000 */  addi    r6, r26, 0
/* 0C3024 800C85C4 38780000 */  addi    r3, r24, 0
/* 0C3028 800C85C8 38990000 */  addi    r4, r25, 0
/* 0C302C 800C85CC 38A100A4 */  addi    r5, r1, 0xa4
/* 0C3030 800C85D0 38E00000 */  li      r7, 0
/* 0C3034 800C85D4 4BFFFD65 */  bl      ReadArrayUnlock
/* 0C3038 800C85D8 2C030000 */  cmpwi   r3, 0
/* 0C303C 800C85DC 4080000C */  bge     lbl_800C85E8
/* 0C3040 800C85E0 3860FFFD */  li      r3, -3
/* 0C3044 800C85E4 48000AA0 */  b       lbl_800C9084
lbl_800C85E8:
/* 0C3048 800C85E8 57431838 */  slwi    r3, r26, 3
/* 0C304C 800C85EC 38830001 */  addi    r4, r3, 1
/* 0C3050 800C85F0 28040000 */  cmplwi  r4, 0
/* 0C3054 800C85F4 38600000 */  li      r3, 0
/* 0C3058 800C85F8 40810168 */  ble     lbl_800C8760
/* 0C305C 800C85FC 28040008 */  cmplwi  r4, 8
/* 0C3060 800C8600 38A4FFF8 */  addi    r5, r4, -8
/* 0C3064 800C8604 40810124 */  ble     lbl_800C8728
/* 0C3068 800C8608 38050007 */  addi    r0, r5, 7
/* 0C306C 800C860C 5400E8FE */  srwi    r0, r0, 3
/* 0C3070 800C8610 28050000 */  cmplwi  r5, 0
/* 0C3074 800C8614 7C0903A6 */  mtctr   r0
/* 0C3078 800C8618 40810110 */  ble     lbl_800C8728
lbl_800C861C:
/* 0C307C 800C861C 5720C9FE */  srwi    r0, r25, 7
/* 0C3080 800C8620 57258BFE */  srwi    r5, r25, 0xf
/* 0C3084 800C8624 7F200278 */  xor     r0, r25, r0
/* 0C3088 800C8628 7CA00278 */  xor     r0, r5, r0
/* 0C308C 800C862C 57264DFE */  srwi    r6, r25, 0x17
/* 0C3090 800C8630 7CC00238 */  eqv     r0, r6, r0
/* 0C3094 800C8634 5725F87E */  srwi    r5, r25, 1
/* 0C3098 800C8638 5400F042 */  rlwinm  r0, r0, 0x1e, 1, 1
/* 0C309C 800C863C 7CA70378 */  or      r7, r5, r0
/* 0C30A0 800C8640 54E0C9FE */  srwi    r0, r7, 7
/* 0C30A4 800C8644 54E58BFE */  srwi    r5, r7, 0xf
/* 0C30A8 800C8648 7CE00278 */  xor     r0, r7, r0
/* 0C30AC 800C864C 54E64DFE */  srwi    r6, r7, 0x17
/* 0C30B0 800C8650 7CA00278 */  xor     r0, r5, r0
/* 0C30B4 800C8654 7CC00238 */  eqv     r0, r6, r0
/* 0C30B8 800C8658 5408F042 */  rlwinm  r8, r0, 0x1e, 1, 1
/* 0C30BC 800C865C 50E8F8BE */  rlwimi  r8, r7, 0x1f, 2, 0x1f
/* 0C30C0 800C8660 5500C9FE */  srwi    r0, r8, 7
/* 0C30C4 800C8664 55058BFE */  srwi    r5, r8, 0xf
/* 0C30C8 800C8668 7D000278 */  xor     r0, r8, r0
/* 0C30CC 800C866C 55064DFE */  srwi    r6, r8, 0x17
/* 0C30D0 800C8670 7CA00278 */  xor     r0, r5, r0
/* 0C30D4 800C8674 7CC00238 */  eqv     r0, r6, r0
/* 0C30D8 800C8678 5407F042 */  rlwinm  r7, r0, 0x1e, 1, 1
/* 0C30DC 800C867C 5107F8BE */  rlwimi  r7, r8, 0x1f, 2, 0x1f
/* 0C30E0 800C8680 54E0C9FE */  srwi    r0, r7, 7
/* 0C30E4 800C8684 54E58BFE */  srwi    r5, r7, 0xf
/* 0C30E8 800C8688 7CE00278 */  xor     r0, r7, r0
/* 0C30EC 800C868C 54E64DFE */  srwi    r6, r7, 0x17
/* 0C30F0 800C8690 7CA00278 */  xor     r0, r5, r0
/* 0C30F4 800C8694 7CC00238 */  eqv     r0, r6, r0
/* 0C30F8 800C8698 5408F042 */  rlwinm  r8, r0, 0x1e, 1, 1
/* 0C30FC 800C869C 50E8F8BE */  rlwimi  r8, r7, 0x1f, 2, 0x1f
/* 0C3100 800C86A0 5500C9FE */  srwi    r0, r8, 7
/* 0C3104 800C86A4 55058BFE */  srwi    r5, r8, 0xf
/* 0C3108 800C86A8 7D000278 */  xor     r0, r8, r0
/* 0C310C 800C86AC 55064DFE */  srwi    r6, r8, 0x17
/* 0C3110 800C86B0 7CA00278 */  xor     r0, r5, r0
/* 0C3114 800C86B4 7CC00238 */  eqv     r0, r6, r0
/* 0C3118 800C86B8 5407F042 */  rlwinm  r7, r0, 0x1e, 1, 1
/* 0C311C 800C86BC 5107F8BE */  rlwimi  r7, r8, 0x1f, 2, 0x1f
/* 0C3120 800C86C0 54E0C9FE */  srwi    r0, r7, 7
/* 0C3124 800C86C4 54E58BFE */  srwi    r5, r7, 0xf
/* 0C3128 800C86C8 7CE00278 */  xor     r0, r7, r0
/* 0C312C 800C86CC 54E64DFE */  srwi    r6, r7, 0x17
/* 0C3130 800C86D0 7CA00278 */  xor     r0, r5, r0
/* 0C3134 800C86D4 7CC00238 */  eqv     r0, r6, r0
/* 0C3138 800C86D8 5408F042 */  rlwinm  r8, r0, 0x1e, 1, 1
/* 0C313C 800C86DC 50E8F8BE */  rlwimi  r8, r7, 0x1f, 2, 0x1f
/* 0C3140 800C86E0 5500C9FE */  srwi    r0, r8, 7
/* 0C3144 800C86E4 55058BFE */  srwi    r5, r8, 0xf
/* 0C3148 800C86E8 7D000278 */  xor     r0, r8, r0
/* 0C314C 800C86EC 55064DFE */  srwi    r6, r8, 0x17
/* 0C3150 800C86F0 7CA00278 */  xor     r0, r5, r0
/* 0C3154 800C86F4 7CC00238 */  eqv     r0, r6, r0
/* 0C3158 800C86F8 5407F042 */  rlwinm  r7, r0, 0x1e, 1, 1
/* 0C315C 800C86FC 5107F8BE */  rlwimi  r7, r8, 0x1f, 2, 0x1f
/* 0C3160 800C8700 54E0C9FE */  srwi    r0, r7, 7
/* 0C3164 800C8704 54E58BFE */  srwi    r5, r7, 0xf
/* 0C3168 800C8708 7CE00278 */  xor     r0, r7, r0
/* 0C316C 800C870C 54E64DFE */  srwi    r6, r7, 0x17
/* 0C3170 800C8710 7CA00278 */  xor     r0, r5, r0
/* 0C3174 800C8714 7CC00238 */  eqv     r0, r6, r0
/* 0C3178 800C8718 5419F042 */  rlwinm  r25, r0, 0x1e, 1, 1
/* 0C317C 800C871C 50F9F8BE */  rlwimi  r25, r7, 0x1f, 2, 0x1f
/* 0C3180 800C8720 38630008 */  addi    r3, r3, 8
/* 0C3184 800C8724 4200FEF8 */  bdnz    lbl_800C861C
lbl_800C8728:
/* 0C3188 800C8728 7C032050 */  subf    r0, r3, r4
/* 0C318C 800C872C 7C032040 */  cmplw   r3, r4
/* 0C3190 800C8730 7C0903A6 */  mtctr   r0
/* 0C3194 800C8734 4080002C */  bge     lbl_800C8760
lbl_800C8738:
/* 0C3198 800C8738 5720C9FE */  srwi    r0, r25, 7
/* 0C319C 800C873C 57238BFE */  srwi    r3, r25, 0xf
/* 0C31A0 800C8740 7F200278 */  xor     r0, r25, r0
/* 0C31A4 800C8744 57244DFE */  srwi    r4, r25, 0x17
/* 0C31A8 800C8748 7C600278 */  xor     r0, r3, r0
/* 0C31AC 800C874C 7C800238 */  eqv     r0, r4, r0
/* 0C31B0 800C8750 5723F87E */  srwi    r3, r25, 1
/* 0C31B4 800C8754 5400F042 */  rlwinm  r0, r0, 0x1e, 1, 1
/* 0C31B8 800C8758 7C790378 */  or      r25, r3, r0
/* 0C31BC 800C875C 4200FFDC */  bdnz    lbl_800C8738
lbl_800C8760:
/* 0C31C0 800C8760 5720C9FE */  srwi    r0, r25, 7
/* 0C31C4 800C8764 57238BFE */  srwi    r3, r25, 0xf
/* 0C31C8 800C8768 7F200278 */  xor     r0, r25, r0
/* 0C31CC 800C876C 57244DFE */  srwi    r4, r25, 0x17
/* 0C31D0 800C8770 7C600278 */  xor     r0, r3, r0
/* 0C31D4 800C8774 7C800238 */  eqv     r0, r4, r0
/* 0C31D8 800C8778 5400F800 */  slwi    r0, r0, 0x1f
/* 0C31DC 800C877C 7F200378 */  or      r0, r25, r0
/* 0C31E0 800C8780 901F002C */  stw     r0, 0x2c(r31)
/* 0C31E4 800C8784 807F002C */  lwz     r3, 0x2c(r31)
/* 0C31E8 800C8788 4BFFFA45 */  bl      bitrev
/* 0C31EC 800C878C 907F002C */  stw     r3, 0x2c(r31)
/* 0C31F0 800C8790 4BFFFCED */  bl      DummyLen
/* 0C31F4 800C8794 3B630000 */  addi    r27, r3, 0
/* 0C31F8 800C8798 38DB0014 */  addi    r6, r27, 0x14
/* 0C31FC 800C879C 38780000 */  addi    r3, r24, 0
/* 0C3200 800C87A0 38A100A4 */  addi    r5, r1, 0xa4
/* 0C3204 800C87A4 38800000 */  li      r4, 0
/* 0C3208 800C87A8 38E00001 */  li      r7, 1
/* 0C320C 800C87AC 4BFFFB8D */  bl      ReadArrayUnlock
/* 0C3210 800C87B0 2C030000 */  cmpwi   r3, 0
/* 0C3214 800C87B4 4080000C */  bge     lbl_800C87C0
/* 0C3218 800C87B8 3860FFFD */  li      r3, -3
/* 0C321C 800C87BC 480008C8 */  b       lbl_800C9084
lbl_800C87C0:
/* 0C3220 800C87C0 38600004 */  li      r3, 4
/* 0C3224 800C87C4 80FF002C */  lwz     r7, 0x2c(r31)
/* 0C3228 800C87C8 832100A4 */  lwz     r25, 0xa4(r1)
/* 0C322C 800C87CC 7C6903A6 */  mtctr   r3
/* 0C3230 800C87D0 834100A8 */  lwz     r26, 0xa8(r1)
/* 0C3234 800C87D4 830100AC */  lwz     r24, 0xac(r1)
/* 0C3238 800C87D8 7F393A78 */  xor     r25, r25, r7
/* 0C323C 800C87DC 800100B0 */  lwz     r0, 0xb0(r1)
/* 0C3240 800C87E0 80A100B4 */  lwz     r5, 0xb4(r1)
lbl_800C87E4:
/* 0C3244 800C87E4 54E33830 */  slwi    r3, r7, 7
/* 0C3248 800C87E8 54E47820 */  slwi    r4, r7, 0xf
/* 0C324C 800C87EC 7CE31A78 */  xor     r3, r7, r3
/* 0C3250 800C87F0 7C831A78 */  xor     r3, r4, r3
/* 0C3254 800C87F4 54E6B810 */  slwi    r6, r7, 0x17
/* 0C3258 800C87F8 7CC31A38 */  eqv     r3, r6, r3
/* 0C325C 800C87FC 54E4083C */  slwi    r4, r7, 1
/* 0C3260 800C8800 546317BC */  rlwinm  r3, r3, 2, 0x1e, 0x1e
/* 0C3264 800C8804 7C871B78 */  or      r7, r4, r3
/* 0C3268 800C8808 54E33830 */  slwi    r3, r7, 7
/* 0C326C 800C880C 54E47820 */  slwi    r4, r7, 0xf
/* 0C3270 800C8810 7CE31A78 */  xor     r3, r7, r3
/* 0C3274 800C8814 54E6B810 */  slwi    r6, r7, 0x17
/* 0C3278 800C8818 7C831A78 */  xor     r3, r4, r3
/* 0C327C 800C881C 7CC31A38 */  eqv     r3, r6, r3
/* 0C3280 800C8820 546917BC */  rlwinm  r9, r3, 2, 0x1e, 0x1e
/* 0C3284 800C8824 50E9083A */  rlwimi  r9, r7, 1, 0, 0x1d
/* 0C3288 800C8828 55233830 */  slwi    r3, r9, 7
/* 0C328C 800C882C 55247820 */  slwi    r4, r9, 0xf
/* 0C3290 800C8830 7D231A78 */  xor     r3, r9, r3
/* 0C3294 800C8834 5526B810 */  slwi    r6, r9, 0x17
/* 0C3298 800C8838 7C831A78 */  xor     r3, r4, r3
/* 0C329C 800C883C 7CC31A38 */  eqv     r3, r6, r3
/* 0C32A0 800C8840 546817BC */  rlwinm  r8, r3, 2, 0x1e, 0x1e
/* 0C32A4 800C8844 5128083A */  rlwimi  r8, r9, 1, 0, 0x1d
/* 0C32A8 800C8848 55033830 */  slwi    r3, r8, 7
/* 0C32AC 800C884C 55047820 */  slwi    r4, r8, 0xf
/* 0C32B0 800C8850 7D031A78 */  xor     r3, r8, r3
/* 0C32B4 800C8854 5506B810 */  slwi    r6, r8, 0x17
/* 0C32B8 800C8858 7C831A78 */  xor     r3, r4, r3
/* 0C32BC 800C885C 7CC31A38 */  eqv     r3, r6, r3
/* 0C32C0 800C8860 546717BC */  rlwinm  r7, r3, 2, 0x1e, 0x1e
/* 0C32C4 800C8864 5107083A */  rlwimi  r7, r8, 1, 0, 0x1d
/* 0C32C8 800C8868 54E33830 */  slwi    r3, r7, 7
/* 0C32CC 800C886C 54E47820 */  slwi    r4, r7, 0xf
/* 0C32D0 800C8870 7CE31A78 */  xor     r3, r7, r3
/* 0C32D4 800C8874 54E6B810 */  slwi    r6, r7, 0x17
/* 0C32D8 800C8878 7C831A78 */  xor     r3, r4, r3
/* 0C32DC 800C887C 7CC31A38 */  eqv     r3, r6, r3
/* 0C32E0 800C8880 546817BC */  rlwinm  r8, r3, 2, 0x1e, 0x1e
/* 0C32E4 800C8884 50E8083A */  rlwimi  r8, r7, 1, 0, 0x1d
/* 0C32E8 800C8888 55033830 */  slwi    r3, r8, 7
/* 0C32EC 800C888C 55047820 */  slwi    r4, r8, 0xf
/* 0C32F0 800C8890 7D031A78 */  xor     r3, r8, r3
/* 0C32F4 800C8894 5506B810 */  slwi    r6, r8, 0x17
/* 0C32F8 800C8898 7C831A78 */  xor     r3, r4, r3
/* 0C32FC 800C889C 7CC31A38 */  eqv     r3, r6, r3
/* 0C3300 800C88A0 546717BC */  rlwinm  r7, r3, 2, 0x1e, 0x1e
/* 0C3304 800C88A4 5107083A */  rlwimi  r7, r8, 1, 0, 0x1d
/* 0C3308 800C88A8 54E33830 */  slwi    r3, r7, 7
/* 0C330C 800C88AC 54E47820 */  slwi    r4, r7, 0xf
/* 0C3310 800C88B0 7CE31A78 */  xor     r3, r7, r3
/* 0C3314 800C88B4 54E6B810 */  slwi    r6, r7, 0x17
/* 0C3318 800C88B8 7C831A78 */  xor     r3, r4, r3
/* 0C331C 800C88BC 7CC31A38 */  eqv     r3, r6, r3
/* 0C3320 800C88C0 546817BC */  rlwinm  r8, r3, 2, 0x1e, 0x1e
/* 0C3324 800C88C4 50E8083A */  rlwimi  r8, r7, 1, 0, 0x1d
/* 0C3328 800C88C8 55033830 */  slwi    r3, r8, 7
/* 0C332C 800C88CC 55047820 */  slwi    r4, r8, 0xf
/* 0C3330 800C88D0 7D031A78 */  xor     r3, r8, r3
/* 0C3334 800C88D4 5506B810 */  slwi    r6, r8, 0x17
/* 0C3338 800C88D8 7C831A78 */  xor     r3, r4, r3
/* 0C333C 800C88DC 7CC31A38 */  eqv     r3, r6, r3
/* 0C3340 800C88E0 546717BC */  rlwinm  r7, r3, 2, 0x1e, 0x1e
/* 0C3344 800C88E4 5107083A */  rlwimi  r7, r8, 1, 0, 0x1d
/* 0C3348 800C88E8 4200FEFC */  bdnz    lbl_800C87E4
/* 0C334C 800C88EC 54E33830 */  slwi    r3, r7, 7
/* 0C3350 800C88F0 54E47820 */  slwi    r4, r7, 0xf
/* 0C3354 800C88F4 7CE31A78 */  xor     r3, r7, r3
/* 0C3358 800C88F8 54E6B810 */  slwi    r6, r7, 0x17
/* 0C335C 800C88FC 7C831A78 */  xor     r3, r4, r3
/* 0C3360 800C8900 7CC31A38 */  eqv     r3, r6, r3
/* 0C3364 800C8904 54630FFE */  srwi    r3, r3, 0x1f
/* 0C3368 800C8908 7CE31B78 */  or      r3, r7, r3
/* 0C336C 800C890C 907F002C */  stw     r3, 0x2c(r31)
/* 0C3370 800C8910 38600004 */  li      r3, 4
/* 0C3374 800C8914 7C6903A6 */  mtctr   r3
/* 0C3378 800C8918 80FF002C */  lwz     r7, 0x2c(r31)
/* 0C337C 800C891C 7F5A3A78 */  xor     r26, r26, r7
lbl_800C8920:
/* 0C3380 800C8920 54E33830 */  slwi    r3, r7, 7
/* 0C3384 800C8924 54E47820 */  slwi    r4, r7, 0xf
/* 0C3388 800C8928 7CE31A78 */  xor     r3, r7, r3
/* 0C338C 800C892C 7C831A78 */  xor     r3, r4, r3
/* 0C3390 800C8930 54E6B810 */  slwi    r6, r7, 0x17
/* 0C3394 800C8934 7CC31A38 */  eqv     r3, r6, r3
/* 0C3398 800C8938 54E4083C */  slwi    r4, r7, 1
/* 0C339C 800C893C 546317BC */  rlwinm  r3, r3, 2, 0x1e, 0x1e
/* 0C33A0 800C8940 7C871B78 */  or      r7, r4, r3
/* 0C33A4 800C8944 54E33830 */  slwi    r3, r7, 7
/* 0C33A8 800C8948 54E47820 */  slwi    r4, r7, 0xf
/* 0C33AC 800C894C 7CE31A78 */  xor     r3, r7, r3
/* 0C33B0 800C8950 54E6B810 */  slwi    r6, r7, 0x17
/* 0C33B4 800C8954 7C831A78 */  xor     r3, r4, r3
/* 0C33B8 800C8958 7CC31A38 */  eqv     r3, r6, r3
/* 0C33BC 800C895C 546917BC */  rlwinm  r9, r3, 2, 0x1e, 0x1e
/* 0C33C0 800C8960 50E9083A */  rlwimi  r9, r7, 1, 0, 0x1d
/* 0C33C4 800C8964 55233830 */  slwi    r3, r9, 7
/* 0C33C8 800C8968 55247820 */  slwi    r4, r9, 0xf
/* 0C33CC 800C896C 7D231A78 */  xor     r3, r9, r3
/* 0C33D0 800C8970 5526B810 */  slwi    r6, r9, 0x17
/* 0C33D4 800C8974 7C831A78 */  xor     r3, r4, r3
/* 0C33D8 800C8978 7CC31A38 */  eqv     r3, r6, r3
/* 0C33DC 800C897C 546817BC */  rlwinm  r8, r3, 2, 0x1e, 0x1e
/* 0C33E0 800C8980 5128083A */  rlwimi  r8, r9, 1, 0, 0x1d
/* 0C33E4 800C8984 55033830 */  slwi    r3, r8, 7
/* 0C33E8 800C8988 55047820 */  slwi    r4, r8, 0xf
/* 0C33EC 800C898C 7D031A78 */  xor     r3, r8, r3
/* 0C33F0 800C8990 5506B810 */  slwi    r6, r8, 0x17
/* 0C33F4 800C8994 7C831A78 */  xor     r3, r4, r3
/* 0C33F8 800C8998 7CC31A38 */  eqv     r3, r6, r3
/* 0C33FC 800C899C 546717BC */  rlwinm  r7, r3, 2, 0x1e, 0x1e
/* 0C3400 800C89A0 5107083A */  rlwimi  r7, r8, 1, 0, 0x1d
/* 0C3404 800C89A4 54E33830 */  slwi    r3, r7, 7
/* 0C3408 800C89A8 54E47820 */  slwi    r4, r7, 0xf
/* 0C340C 800C89AC 7CE31A78 */  xor     r3, r7, r3
/* 0C3410 800C89B0 54E6B810 */  slwi    r6, r7, 0x17
/* 0C3414 800C89B4 7C831A78 */  xor     r3, r4, r3
/* 0C3418 800C89B8 7CC31A38 */  eqv     r3, r6, r3
/* 0C341C 800C89BC 546817BC */  rlwinm  r8, r3, 2, 0x1e, 0x1e
/* 0C3420 800C89C0 50E8083A */  rlwimi  r8, r7, 1, 0, 0x1d
/* 0C3424 800C89C4 55033830 */  slwi    r3, r8, 7
/* 0C3428 800C89C8 55047820 */  slwi    r4, r8, 0xf
/* 0C342C 800C89CC 7D031A78 */  xor     r3, r8, r3
/* 0C3430 800C89D0 5506B810 */  slwi    r6, r8, 0x17
/* 0C3434 800C89D4 7C831A78 */  xor     r3, r4, r3
/* 0C3438 800C89D8 7CC31A38 */  eqv     r3, r6, r3
/* 0C343C 800C89DC 546717BC */  rlwinm  r7, r3, 2, 0x1e, 0x1e
/* 0C3440 800C89E0 5107083A */  rlwimi  r7, r8, 1, 0, 0x1d
/* 0C3444 800C89E4 54E33830 */  slwi    r3, r7, 7
/* 0C3448 800C89E8 54E47820 */  slwi    r4, r7, 0xf
/* 0C344C 800C89EC 7CE31A78 */  xor     r3, r7, r3
/* 0C3450 800C89F0 54E6B810 */  slwi    r6, r7, 0x17
/* 0C3454 800C89F4 7C831A78 */  xor     r3, r4, r3
/* 0C3458 800C89F8 7CC31A38 */  eqv     r3, r6, r3
/* 0C345C 800C89FC 546817BC */  rlwinm  r8, r3, 2, 0x1e, 0x1e
/* 0C3460 800C8A00 50E8083A */  rlwimi  r8, r7, 1, 0, 0x1d
/* 0C3464 800C8A04 55033830 */  slwi    r3, r8, 7
/* 0C3468 800C8A08 55047820 */  slwi    r4, r8, 0xf
/* 0C346C 800C8A0C 7D031A78 */  xor     r3, r8, r3
/* 0C3470 800C8A10 5506B810 */  slwi    r6, r8, 0x17
/* 0C3474 800C8A14 7C831A78 */  xor     r3, r4, r3
/* 0C3478 800C8A18 7CC31A38 */  eqv     r3, r6, r3
/* 0C347C 800C8A1C 546717BC */  rlwinm  r7, r3, 2, 0x1e, 0x1e
/* 0C3480 800C8A20 5107083A */  rlwimi  r7, r8, 1, 0, 0x1d
/* 0C3484 800C8A24 4200FEFC */  bdnz    lbl_800C8920
/* 0C3488 800C8A28 54E33830 */  slwi    r3, r7, 7
/* 0C348C 800C8A2C 54E47820 */  slwi    r4, r7, 0xf
/* 0C3490 800C8A30 7CE31A78 */  xor     r3, r7, r3
/* 0C3494 800C8A34 54E6B810 */  slwi    r6, r7, 0x17
/* 0C3498 800C8A38 7C831A78 */  xor     r3, r4, r3
/* 0C349C 800C8A3C 7CC31A38 */  eqv     r3, r6, r3
/* 0C34A0 800C8A40 54630FFE */  srwi    r3, r3, 0x1f
/* 0C34A4 800C8A44 7CE31B78 */  or      r3, r7, r3
/* 0C34A8 800C8A48 907F002C */  stw     r3, 0x2c(r31)
/* 0C34AC 800C8A4C 38600004 */  li      r3, 4
/* 0C34B0 800C8A50 7C6903A6 */  mtctr   r3
/* 0C34B4 800C8A54 80FF002C */  lwz     r7, 0x2c(r31)
/* 0C34B8 800C8A58 7F183A78 */  xor     r24, r24, r7
lbl_800C8A5C:
/* 0C34BC 800C8A5C 54E33830 */  slwi    r3, r7, 7
/* 0C34C0 800C8A60 54E47820 */  slwi    r4, r7, 0xf
/* 0C34C4 800C8A64 7CE31A78 */  xor     r3, r7, r3
/* 0C34C8 800C8A68 7C831A78 */  xor     r3, r4, r3
/* 0C34CC 800C8A6C 54E6B810 */  slwi    r6, r7, 0x17
/* 0C34D0 800C8A70 7CC31A38 */  eqv     r3, r6, r3
/* 0C34D4 800C8A74 54E4083C */  slwi    r4, r7, 1
/* 0C34D8 800C8A78 546317BC */  rlwinm  r3, r3, 2, 0x1e, 0x1e
/* 0C34DC 800C8A7C 7C871B78 */  or      r7, r4, r3
/* 0C34E0 800C8A80 54E33830 */  slwi    r3, r7, 7
/* 0C34E4 800C8A84 54E47820 */  slwi    r4, r7, 0xf
/* 0C34E8 800C8A88 7CE31A78 */  xor     r3, r7, r3
/* 0C34EC 800C8A8C 54E6B810 */  slwi    r6, r7, 0x17
/* 0C34F0 800C8A90 7C831A78 */  xor     r3, r4, r3
/* 0C34F4 800C8A94 7CC31A38 */  eqv     r3, r6, r3
/* 0C34F8 800C8A98 546917BC */  rlwinm  r9, r3, 2, 0x1e, 0x1e
/* 0C34FC 800C8A9C 50E9083A */  rlwimi  r9, r7, 1, 0, 0x1d
/* 0C3500 800C8AA0 55233830 */  slwi    r3, r9, 7
/* 0C3504 800C8AA4 55247820 */  slwi    r4, r9, 0xf
/* 0C3508 800C8AA8 7D231A78 */  xor     r3, r9, r3
/* 0C350C 800C8AAC 5526B810 */  slwi    r6, r9, 0x17
/* 0C3510 800C8AB0 7C831A78 */  xor     r3, r4, r3
/* 0C3514 800C8AB4 7CC31A38 */  eqv     r3, r6, r3
/* 0C3518 800C8AB8 546817BC */  rlwinm  r8, r3, 2, 0x1e, 0x1e
/* 0C351C 800C8ABC 5128083A */  rlwimi  r8, r9, 1, 0, 0x1d
/* 0C3520 800C8AC0 55033830 */  slwi    r3, r8, 7
/* 0C3524 800C8AC4 55047820 */  slwi    r4, r8, 0xf
/* 0C3528 800C8AC8 7D031A78 */  xor     r3, r8, r3
/* 0C352C 800C8ACC 5506B810 */  slwi    r6, r8, 0x17
/* 0C3530 800C8AD0 7C831A78 */  xor     r3, r4, r3
/* 0C3534 800C8AD4 7CC31A38 */  eqv     r3, r6, r3
/* 0C3538 800C8AD8 546717BC */  rlwinm  r7, r3, 2, 0x1e, 0x1e
/* 0C353C 800C8ADC 5107083A */  rlwimi  r7, r8, 1, 0, 0x1d
/* 0C3540 800C8AE0 54E33830 */  slwi    r3, r7, 7
/* 0C3544 800C8AE4 54E47820 */  slwi    r4, r7, 0xf
/* 0C3548 800C8AE8 7CE31A78 */  xor     r3, r7, r3
/* 0C354C 800C8AEC 54E6B810 */  slwi    r6, r7, 0x17
/* 0C3550 800C8AF0 7C831A78 */  xor     r3, r4, r3
/* 0C3554 800C8AF4 7CC31A38 */  eqv     r3, r6, r3
/* 0C3558 800C8AF8 546817BC */  rlwinm  r8, r3, 2, 0x1e, 0x1e
/* 0C355C 800C8AFC 50E8083A */  rlwimi  r8, r7, 1, 0, 0x1d
/* 0C3560 800C8B00 55033830 */  slwi    r3, r8, 7
/* 0C3564 800C8B04 55047820 */  slwi    r4, r8, 0xf
/* 0C3568 800C8B08 7D031A78 */  xor     r3, r8, r3
/* 0C356C 800C8B0C 5506B810 */  slwi    r6, r8, 0x17
/* 0C3570 800C8B10 7C831A78 */  xor     r3, r4, r3
/* 0C3574 800C8B14 7CC31A38 */  eqv     r3, r6, r3
/* 0C3578 800C8B18 546717BC */  rlwinm  r7, r3, 2, 0x1e, 0x1e
/* 0C357C 800C8B1C 5107083A */  rlwimi  r7, r8, 1, 0, 0x1d
/* 0C3580 800C8B20 54E33830 */  slwi    r3, r7, 7
/* 0C3584 800C8B24 54E47820 */  slwi    r4, r7, 0xf
/* 0C3588 800C8B28 7CE31A78 */  xor     r3, r7, r3
/* 0C358C 800C8B2C 54E6B810 */  slwi    r6, r7, 0x17
/* 0C3590 800C8B30 7C831A78 */  xor     r3, r4, r3
/* 0C3594 800C8B34 7CC31A38 */  eqv     r3, r6, r3
/* 0C3598 800C8B38 546817BC */  rlwinm  r8, r3, 2, 0x1e, 0x1e
/* 0C359C 800C8B3C 50E8083A */  rlwimi  r8, r7, 1, 0, 0x1d
/* 0C35A0 800C8B40 55033830 */  slwi    r3, r8, 7
/* 0C35A4 800C8B44 55047820 */  slwi    r4, r8, 0xf
/* 0C35A8 800C8B48 7D031A78 */  xor     r3, r8, r3
/* 0C35AC 800C8B4C 5506B810 */  slwi    r6, r8, 0x17
/* 0C35B0 800C8B50 7C831A78 */  xor     r3, r4, r3
/* 0C35B4 800C8B54 7CC31A38 */  eqv     r3, r6, r3
/* 0C35B8 800C8B58 546717BC */  rlwinm  r7, r3, 2, 0x1e, 0x1e
/* 0C35BC 800C8B5C 5107083A */  rlwimi  r7, r8, 1, 0, 0x1d
/* 0C35C0 800C8B60 4200FEFC */  bdnz    lbl_800C8A5C
/* 0C35C4 800C8B64 54E33830 */  slwi    r3, r7, 7
/* 0C35C8 800C8B68 54E47820 */  slwi    r4, r7, 0xf
/* 0C35CC 800C8B6C 7CE31A78 */  xor     r3, r7, r3
/* 0C35D0 800C8B70 54E6B810 */  slwi    r6, r7, 0x17
/* 0C35D4 800C8B74 7C831A78 */  xor     r3, r4, r3
/* 0C35D8 800C8B78 7CC31A38 */  eqv     r3, r6, r3
/* 0C35DC 800C8B7C 54630FFE */  srwi    r3, r3, 0x1f
/* 0C35E0 800C8B80 7CE31B78 */  or      r3, r7, r3
/* 0C35E4 800C8B84 907F002C */  stw     r3, 0x2c(r31)
/* 0C35E8 800C8B88 38600004 */  li      r3, 4
/* 0C35EC 800C8B8C 7C6903A6 */  mtctr   r3
/* 0C35F0 800C8B90 80FF002C */  lwz     r7, 0x2c(r31)
/* 0C35F4 800C8B94 7C003A78 */  xor     r0, r0, r7
lbl_800C8B98:
/* 0C35F8 800C8B98 54E33830 */  slwi    r3, r7, 7
/* 0C35FC 800C8B9C 54E47820 */  slwi    r4, r7, 0xf
/* 0C3600 800C8BA0 7CE31A78 */  xor     r3, r7, r3
/* 0C3604 800C8BA4 7C831A78 */  xor     r3, r4, r3
/* 0C3608 800C8BA8 54E6B810 */  slwi    r6, r7, 0x17
/* 0C360C 800C8BAC 7CC31A38 */  eqv     r3, r6, r3
/* 0C3610 800C8BB0 54E4083C */  slwi    r4, r7, 1
/* 0C3614 800C8BB4 546317BC */  rlwinm  r3, r3, 2, 0x1e, 0x1e
/* 0C3618 800C8BB8 7C871B78 */  or      r7, r4, r3
/* 0C361C 800C8BBC 54E33830 */  slwi    r3, r7, 7
/* 0C3620 800C8BC0 54E47820 */  slwi    r4, r7, 0xf
/* 0C3624 800C8BC4 7CE31A78 */  xor     r3, r7, r3
/* 0C3628 800C8BC8 54E6B810 */  slwi    r6, r7, 0x17
/* 0C362C 800C8BCC 7C831A78 */  xor     r3, r4, r3
/* 0C3630 800C8BD0 7CC31A38 */  eqv     r3, r6, r3
/* 0C3634 800C8BD4 546917BC */  rlwinm  r9, r3, 2, 0x1e, 0x1e
/* 0C3638 800C8BD8 50E9083A */  rlwimi  r9, r7, 1, 0, 0x1d
/* 0C363C 800C8BDC 55233830 */  slwi    r3, r9, 7
/* 0C3640 800C8BE0 55247820 */  slwi    r4, r9, 0xf
/* 0C3644 800C8BE4 7D231A78 */  xor     r3, r9, r3
/* 0C3648 800C8BE8 5526B810 */  slwi    r6, r9, 0x17
/* 0C364C 800C8BEC 7C831A78 */  xor     r3, r4, r3
/* 0C3650 800C8BF0 7CC31A38 */  eqv     r3, r6, r3
/* 0C3654 800C8BF4 546817BC */  rlwinm  r8, r3, 2, 0x1e, 0x1e
/* 0C3658 800C8BF8 5128083A */  rlwimi  r8, r9, 1, 0, 0x1d
/* 0C365C 800C8BFC 55033830 */  slwi    r3, r8, 7
/* 0C3660 800C8C00 55047820 */  slwi    r4, r8, 0xf
/* 0C3664 800C8C04 7D031A78 */  xor     r3, r8, r3
/* 0C3668 800C8C08 5506B810 */  slwi    r6, r8, 0x17
/* 0C366C 800C8C0C 7C831A78 */  xor     r3, r4, r3
/* 0C3670 800C8C10 7CC31A38 */  eqv     r3, r6, r3
/* 0C3674 800C8C14 546717BC */  rlwinm  r7, r3, 2, 0x1e, 0x1e
/* 0C3678 800C8C18 5107083A */  rlwimi  r7, r8, 1, 0, 0x1d
/* 0C367C 800C8C1C 54E33830 */  slwi    r3, r7, 7
/* 0C3680 800C8C20 54E47820 */  slwi    r4, r7, 0xf
/* 0C3684 800C8C24 7CE31A78 */  xor     r3, r7, r3
/* 0C3688 800C8C28 54E6B810 */  slwi    r6, r7, 0x17
/* 0C368C 800C8C2C 7C831A78 */  xor     r3, r4, r3
/* 0C3690 800C8C30 7CC31A38 */  eqv     r3, r6, r3
/* 0C3694 800C8C34 546817BC */  rlwinm  r8, r3, 2, 0x1e, 0x1e
/* 0C3698 800C8C38 50E8083A */  rlwimi  r8, r7, 1, 0, 0x1d
/* 0C369C 800C8C3C 55033830 */  slwi    r3, r8, 7
/* 0C36A0 800C8C40 55047820 */  slwi    r4, r8, 0xf
/* 0C36A4 800C8C44 7D031A78 */  xor     r3, r8, r3
/* 0C36A8 800C8C48 5506B810 */  slwi    r6, r8, 0x17
/* 0C36AC 800C8C4C 7C831A78 */  xor     r3, r4, r3
/* 0C36B0 800C8C50 7CC31A38 */  eqv     r3, r6, r3
/* 0C36B4 800C8C54 546717BC */  rlwinm  r7, r3, 2, 0x1e, 0x1e
/* 0C36B8 800C8C58 5107083A */  rlwimi  r7, r8, 1, 0, 0x1d
/* 0C36BC 800C8C5C 54E33830 */  slwi    r3, r7, 7
/* 0C36C0 800C8C60 54E47820 */  slwi    r4, r7, 0xf
/* 0C36C4 800C8C64 7CE31A78 */  xor     r3, r7, r3
/* 0C36C8 800C8C68 54E6B810 */  slwi    r6, r7, 0x17
/* 0C36CC 800C8C6C 7C831A78 */  xor     r3, r4, r3
/* 0C36D0 800C8C70 7CC31A38 */  eqv     r3, r6, r3
/* 0C36D4 800C8C74 546817BC */  rlwinm  r8, r3, 2, 0x1e, 0x1e
/* 0C36D8 800C8C78 50E8083A */  rlwimi  r8, r7, 1, 0, 0x1d
/* 0C36DC 800C8C7C 55033830 */  slwi    r3, r8, 7
/* 0C36E0 800C8C80 55047820 */  slwi    r4, r8, 0xf
/* 0C36E4 800C8C84 7D031A78 */  xor     r3, r8, r3
/* 0C36E8 800C8C88 5506B810 */  slwi    r6, r8, 0x17
/* 0C36EC 800C8C8C 7C831A78 */  xor     r3, r4, r3
/* 0C36F0 800C8C90 7CC31A38 */  eqv     r3, r6, r3
/* 0C36F4 800C8C94 546717BC */  rlwinm  r7, r3, 2, 0x1e, 0x1e
/* 0C36F8 800C8C98 5107083A */  rlwimi  r7, r8, 1, 0, 0x1d
/* 0C36FC 800C8C9C 4200FEFC */  bdnz    lbl_800C8B98
/* 0C3700 800C8CA0 54E33830 */  slwi    r3, r7, 7
/* 0C3704 800C8CA4 54E47820 */  slwi    r4, r7, 0xf
/* 0C3708 800C8CA8 7CE31A78 */  xor     r3, r7, r3
/* 0C370C 800C8CAC 7C831A78 */  xor     r3, r4, r3
/* 0C3710 800C8CB0 54E6B810 */  slwi    r6, r7, 0x17
/* 0C3714 800C8CB4 7CC31A38 */  eqv     r3, r6, r3
/* 0C3718 800C8CB8 54630FFE */  srwi    r3, r3, 0x1f
/* 0C371C 800C8CBC 7CE31B78 */  or      r3, r7, r3
/* 0C3720 800C8CC0 907F002C */  stw     r3, 0x2c(r31)
/* 0C3724 800C8CC4 57641838 */  slwi    r4, r27, 3
/* 0C3728 800C8CC8 28040000 */  cmplwi  r4, 0
/* 0C372C 800C8CCC 80DF002C */  lwz     r6, 0x2c(r31)
/* 0C3730 800C8CD0 38600000 */  li      r3, 0
/* 0C3734 800C8CD4 7CA53278 */  xor     r5, r5, r6
/* 0C3738 800C8CD8 40810168 */  ble     lbl_800C8E40
/* 0C373C 800C8CDC 28040008 */  cmplwi  r4, 8
/* 0C3740 800C8CE0 3904FFF8 */  addi    r8, r4, -8
/* 0C3744 800C8CE4 40810124 */  ble     lbl_800C8E08
/* 0C3748 800C8CE8 38E80007 */  addi    r7, r8, 7
/* 0C374C 800C8CEC 54E7E8FE */  srwi    r7, r7, 3
/* 0C3750 800C8CF0 28080000 */  cmplwi  r8, 0
/* 0C3754 800C8CF4 7CE903A6 */  mtctr   r7
/* 0C3758 800C8CF8 40810110 */  ble     lbl_800C8E08
lbl_800C8CFC:
/* 0C375C 800C8CFC 54C73830 */  slwi    r7, r6, 7
/* 0C3760 800C8D00 54C87820 */  slwi    r8, r6, 0xf
/* 0C3764 800C8D04 7CC73A78 */  xor     r7, r6, r7
/* 0C3768 800C8D08 7D073A78 */  xor     r7, r8, r7
/* 0C376C 800C8D0C 54C9B810 */  slwi    r9, r6, 0x17
/* 0C3770 800C8D10 7D273A38 */  eqv     r7, r9, r7
/* 0C3774 800C8D14 54C8083C */  slwi    r8, r6, 1
/* 0C3778 800C8D18 54E617BC */  rlwinm  r6, r7, 2, 0x1e, 0x1e
/* 0C377C 800C8D1C 7D093378 */  or      r9, r8, r6
/* 0C3780 800C8D20 55263830 */  slwi    r6, r9, 7
/* 0C3784 800C8D24 55277820 */  slwi    r7, r9, 0xf
/* 0C3788 800C8D28 7D263278 */  xor     r6, r9, r6
/* 0C378C 800C8D2C 5528B810 */  slwi    r8, r9, 0x17
/* 0C3790 800C8D30 7CE63278 */  xor     r6, r7, r6
/* 0C3794 800C8D34 7D063238 */  eqv     r6, r8, r6
/* 0C3798 800C8D38 54CA17BC */  rlwinm  r10, r6, 2, 0x1e, 0x1e
/* 0C379C 800C8D3C 512A083A */  rlwimi  r10, r9, 1, 0, 0x1d
/* 0C37A0 800C8D40 55463830 */  slwi    r6, r10, 7
/* 0C37A4 800C8D44 55477820 */  slwi    r7, r10, 0xf
/* 0C37A8 800C8D48 7D463278 */  xor     r6, r10, r6
/* 0C37AC 800C8D4C 5548B810 */  slwi    r8, r10, 0x17
/* 0C37B0 800C8D50 7CE63278 */  xor     r6, r7, r6
/* 0C37B4 800C8D54 7D063238 */  eqv     r6, r8, r6
/* 0C37B8 800C8D58 54C917BC */  rlwinm  r9, r6, 2, 0x1e, 0x1e
/* 0C37BC 800C8D5C 5149083A */  rlwimi  r9, r10, 1, 0, 0x1d
/* 0C37C0 800C8D60 55263830 */  slwi    r6, r9, 7
/* 0C37C4 800C8D64 55277820 */  slwi    r7, r9, 0xf
/* 0C37C8 800C8D68 7D263278 */  xor     r6, r9, r6
/* 0C37CC 800C8D6C 5528B810 */  slwi    r8, r9, 0x17
/* 0C37D0 800C8D70 7CE63278 */  xor     r6, r7, r6
/* 0C37D4 800C8D74 7D063238 */  eqv     r6, r8, r6
/* 0C37D8 800C8D78 54CA17BC */  rlwinm  r10, r6, 2, 0x1e, 0x1e
/* 0C37DC 800C8D7C 512A083A */  rlwimi  r10, r9, 1, 0, 0x1d
/* 0C37E0 800C8D80 55463830 */  slwi    r6, r10, 7
/* 0C37E4 800C8D84 55477820 */  slwi    r7, r10, 0xf
/* 0C37E8 800C8D88 7D463278 */  xor     r6, r10, r6
/* 0C37EC 800C8D8C 5548B810 */  slwi    r8, r10, 0x17
/* 0C37F0 800C8D90 7CE63278 */  xor     r6, r7, r6
/* 0C37F4 800C8D94 7D063238 */  eqv     r6, r8, r6
/* 0C37F8 800C8D98 54C917BC */  rlwinm  r9, r6, 2, 0x1e, 0x1e
/* 0C37FC 800C8D9C 5149083A */  rlwimi  r9, r10, 1, 0, 0x1d
/* 0C3800 800C8DA0 55263830 */  slwi    r6, r9, 7
/* 0C3804 800C8DA4 55277820 */  slwi    r7, r9, 0xf
/* 0C3808 800C8DA8 7D263278 */  xor     r6, r9, r6
/* 0C380C 800C8DAC 5528B810 */  slwi    r8, r9, 0x17
/* 0C3810 800C8DB0 7CE63278 */  xor     r6, r7, r6
/* 0C3814 800C8DB4 7D063238 */  eqv     r6, r8, r6
/* 0C3818 800C8DB8 54CA17BC */  rlwinm  r10, r6, 2, 0x1e, 0x1e
/* 0C381C 800C8DBC 512A083A */  rlwimi  r10, r9, 1, 0, 0x1d
/* 0C3820 800C8DC0 55463830 */  slwi    r6, r10, 7
/* 0C3824 800C8DC4 55477820 */  slwi    r7, r10, 0xf
/* 0C3828 800C8DC8 7D463278 */  xor     r6, r10, r6
/* 0C382C 800C8DCC 5548B810 */  slwi    r8, r10, 0x17
/* 0C3830 800C8DD0 7CE63278 */  xor     r6, r7, r6
/* 0C3834 800C8DD4 7D063238 */  eqv     r6, r8, r6
/* 0C3838 800C8DD8 54C917BC */  rlwinm  r9, r6, 2, 0x1e, 0x1e
/* 0C383C 800C8DDC 5149083A */  rlwimi  r9, r10, 1, 0, 0x1d
/* 0C3840 800C8DE0 55263830 */  slwi    r6, r9, 7
/* 0C3844 800C8DE4 55277820 */  slwi    r7, r9, 0xf
/* 0C3848 800C8DE8 7D263278 */  xor     r6, r9, r6
/* 0C384C 800C8DEC 5528B810 */  slwi    r8, r9, 0x17
/* 0C3850 800C8DF0 7CE63278 */  xor     r6, r7, r6
/* 0C3854 800C8DF4 7D063238 */  eqv     r6, r8, r6
/* 0C3858 800C8DF8 54C617BC */  rlwinm  r6, r6, 2, 0x1e, 0x1e
/* 0C385C 800C8DFC 5126083A */  rlwimi  r6, r9, 1, 0, 0x1d
/* 0C3860 800C8E00 38630008 */  addi    r3, r3, 8
/* 0C3864 800C8E04 4200FEF8 */  bdnz    lbl_800C8CFC
lbl_800C8E08:
/* 0C3868 800C8E08 7CE32050 */  subf    r7, r3, r4
/* 0C386C 800C8E0C 7C032040 */  cmplw   r3, r4
/* 0C3870 800C8E10 7CE903A6 */  mtctr   r7
/* 0C3874 800C8E14 4080002C */  bge     lbl_800C8E40
lbl_800C8E18:
/* 0C3878 800C8E18 54C33830 */  slwi    r3, r6, 7
/* 0C387C 800C8E1C 54C47820 */  slwi    r4, r6, 0xf
/* 0C3880 800C8E20 7CC31A78 */  xor     r3, r6, r3
/* 0C3884 800C8E24 54C7B810 */  slwi    r7, r6, 0x17
/* 0C3888 800C8E28 7C831A78 */  xor     r3, r4, r3
/* 0C388C 800C8E2C 7CE31A38 */  eqv     r3, r7, r3
/* 0C3890 800C8E30 54C4083C */  slwi    r4, r6, 1
/* 0C3894 800C8E34 546317BC */  rlwinm  r3, r3, 2, 0x1e, 0x1e
/* 0C3898 800C8E38 7C861B78 */  or      r6, r4, r3
/* 0C389C 800C8E3C 4200FFDC */  bdnz    lbl_800C8E18
lbl_800C8E40:
/* 0C38A0 800C8E40 54C33830 */  slwi    r3, r6, 7
/* 0C38A4 800C8E44 54C47820 */  slwi    r4, r6, 0xf
/* 0C38A8 800C8E48 7CC31A78 */  xor     r3, r6, r3
/* 0C38AC 800C8E4C 54C7B810 */  slwi    r7, r6, 0x17
/* 0C38B0 800C8E50 7C831A78 */  xor     r3, r4, r3
/* 0C38B4 800C8E54 7CE31A38 */  eqv     r3, r7, r3
/* 0C38B8 800C8E58 54630FFE */  srwi    r3, r3, 0x1f
/* 0C38BC 800C8E5C 7CC31B78 */  or      r3, r6, r3
/* 0C38C0 800C8E60 907F002C */  stw     r3, 0x2c(r31)
/* 0C38C4 800C8E64 38600004 */  li      r3, 4
/* 0C38C8 800C8E68 7C6903A6 */  mtctr   r3
/* 0C38CC 800C8E6C 38600000 */  li      r3, 0
/* 0C38D0 800C8E70 809F002C */  lwz     r4, 0x2c(r31)
lbl_800C8E74:
/* 0C38D4 800C8E74 54863830 */  slwi    r6, r4, 7
/* 0C38D8 800C8E78 54877820 */  slwi    r7, r4, 0xf
/* 0C38DC 800C8E7C 7C863278 */  xor     r6, r4, r6
/* 0C38E0 800C8E80 7CE63278 */  xor     r6, r7, r6
/* 0C38E4 800C8E84 5488B810 */  slwi    r8, r4, 0x17
/* 0C38E8 800C8E88 7D063238 */  eqv     r6, r8, r6
/* 0C38EC 800C8E8C 5487083C */  slwi    r7, r4, 1
/* 0C38F0 800C8E90 54C417BC */  rlwinm  r4, r6, 2, 0x1e, 0x1e
/* 0C38F4 800C8E94 7CE82378 */  or      r8, r7, r4
/* 0C38F8 800C8E98 55043830 */  slwi    r4, r8, 7
/* 0C38FC 800C8E9C 55067820 */  slwi    r6, r8, 0xf
/* 0C3900 800C8EA0 7D042278 */  xor     r4, r8, r4
/* 0C3904 800C8EA4 5507B810 */  slwi    r7, r8, 0x17
/* 0C3908 800C8EA8 7CC42278 */  xor     r4, r6, r4
/* 0C390C 800C8EAC 7CE42238 */  eqv     r4, r7, r4
/* 0C3910 800C8EB0 548917BC */  rlwinm  r9, r4, 2, 0x1e, 0x1e
/* 0C3914 800C8EB4 5109083A */  rlwimi  r9, r8, 1, 0, 0x1d
/* 0C3918 800C8EB8 55243830 */  slwi    r4, r9, 7
/* 0C391C 800C8EBC 55267820 */  slwi    r6, r9, 0xf
/* 0C3920 800C8EC0 7D242278 */  xor     r4, r9, r4
/* 0C3924 800C8EC4 5527B810 */  slwi    r7, r9, 0x17
/* 0C3928 800C8EC8 7CC42278 */  xor     r4, r6, r4
/* 0C392C 800C8ECC 7CE42238 */  eqv     r4, r7, r4
/* 0C3930 800C8ED0 548817BC */  rlwinm  r8, r4, 2, 0x1e, 0x1e
/* 0C3934 800C8ED4 5128083A */  rlwimi  r8, r9, 1, 0, 0x1d
/* 0C3938 800C8ED8 55043830 */  slwi    r4, r8, 7
/* 0C393C 800C8EDC 55067820 */  slwi    r6, r8, 0xf
/* 0C3940 800C8EE0 7D042278 */  xor     r4, r8, r4
/* 0C3944 800C8EE4 5507B810 */  slwi    r7, r8, 0x17
/* 0C3948 800C8EE8 7CC42278 */  xor     r4, r6, r4
/* 0C394C 800C8EEC 7CE42238 */  eqv     r4, r7, r4
/* 0C3950 800C8EF0 548917BC */  rlwinm  r9, r4, 2, 0x1e, 0x1e
/* 0C3954 800C8EF4 5109083A */  rlwimi  r9, r8, 1, 0, 0x1d
/* 0C3958 800C8EF8 55243830 */  slwi    r4, r9, 7
/* 0C395C 800C8EFC 55267820 */  slwi    r6, r9, 0xf
/* 0C3960 800C8F00 7D242278 */  xor     r4, r9, r4
/* 0C3964 800C8F04 5527B810 */  slwi    r7, r9, 0x17
/* 0C3968 800C8F08 7CC42278 */  xor     r4, r6, r4
/* 0C396C 800C8F0C 7CE42238 */  eqv     r4, r7, r4
/* 0C3970 800C8F10 548817BC */  rlwinm  r8, r4, 2, 0x1e, 0x1e
/* 0C3974 800C8F14 5128083A */  rlwimi  r8, r9, 1, 0, 0x1d
/* 0C3978 800C8F18 55043830 */  slwi    r4, r8, 7
/* 0C397C 800C8F1C 55067820 */  slwi    r6, r8, 0xf
/* 0C3980 800C8F20 7D042278 */  xor     r4, r8, r4
/* 0C3984 800C8F24 5507B810 */  slwi    r7, r8, 0x17
/* 0C3988 800C8F28 7CC42278 */  xor     r4, r6, r4
/* 0C398C 800C8F2C 7CE42238 */  eqv     r4, r7, r4
/* 0C3990 800C8F30 548917BC */  rlwinm  r9, r4, 2, 0x1e, 0x1e
/* 0C3994 800C8F34 5109083A */  rlwimi  r9, r8, 1, 0, 0x1d
/* 0C3998 800C8F38 55243830 */  slwi    r4, r9, 7
/* 0C399C 800C8F3C 55267820 */  slwi    r6, r9, 0xf
/* 0C39A0 800C8F40 7D242278 */  xor     r4, r9, r4
/* 0C39A4 800C8F44 5527B810 */  slwi    r7, r9, 0x17
/* 0C39A8 800C8F48 7CC42278 */  xor     r4, r6, r4
/* 0C39AC 800C8F4C 7CE42238 */  eqv     r4, r7, r4
/* 0C39B0 800C8F50 548817BC */  rlwinm  r8, r4, 2, 0x1e, 0x1e
/* 0C39B4 800C8F54 5128083A */  rlwimi  r8, r9, 1, 0, 0x1d
/* 0C39B8 800C8F58 55043830 */  slwi    r4, r8, 7
/* 0C39BC 800C8F5C 55067820 */  slwi    r6, r8, 0xf
/* 0C39C0 800C8F60 7D042278 */  xor     r4, r8, r4
/* 0C39C4 800C8F64 5507B810 */  slwi    r7, r8, 0x17
/* 0C39C8 800C8F68 7CC42278 */  xor     r4, r6, r4
/* 0C39CC 800C8F6C 7CE42238 */  eqv     r4, r7, r4
/* 0C39D0 800C8F70 548417BC */  rlwinm  r4, r4, 2, 0x1e, 0x1e
/* 0C39D4 800C8F74 5104083A */  rlwimi  r4, r8, 1, 0, 0x1d
/* 0C39D8 800C8F78 38630008 */  addi    r3, r3, 8
/* 0C39DC 800C8F7C 4200FEF8 */  bdnz    lbl_800C8E74
/* 0C39E0 800C8F80 20C30021 */  subfic  r6, r3, 0x21
/* 0C39E4 800C8F84 28030021 */  cmplwi  r3, 0x21
/* 0C39E8 800C8F88 7CC903A6 */  mtctr   r6
/* 0C39EC 800C8F8C 4080002C */  bge     lbl_800C8FB8
lbl_800C8F90:
/* 0C39F0 800C8F90 54833830 */  slwi    r3, r4, 7
/* 0C39F4 800C8F94 54867820 */  slwi    r6, r4, 0xf
/* 0C39F8 800C8F98 7C831A78 */  xor     r3, r4, r3
/* 0C39FC 800C8F9C 5487B810 */  slwi    r7, r4, 0x17
/* 0C3A00 800C8FA0 7CC31A78 */  xor     r3, r6, r3
/* 0C3A04 800C8FA4 7CE31A38 */  eqv     r3, r7, r3
/* 0C3A08 800C8FA8 5484083C */  slwi    r4, r4, 1
/* 0C3A0C 800C8FAC 546317BC */  rlwinm  r3, r3, 2, 0x1e, 0x1e
/* 0C3A10 800C8FB0 7C841B78 */  or      r4, r4, r3
/* 0C3A14 800C8FB4 4200FFDC */  bdnz    lbl_800C8F90
lbl_800C8FB8:
/* 0C3A18 800C8FB8 54833830 */  slwi    r3, r4, 7
/* 0C3A1C 800C8FBC 54867820 */  slwi    r6, r4, 0xf
/* 0C3A20 800C8FC0 7C831A78 */  xor     r3, r4, r3
/* 0C3A24 800C8FC4 5487B810 */  slwi    r7, r4, 0x17
/* 0C3A28 800C8FC8 7CC31A78 */  xor     r3, r6, r3
/* 0C3A2C 800C8FCC 7CE31A38 */  eqv     r3, r7, r3
/* 0C3A30 800C8FD0 54630FFE */  srwi    r3, r3, 0x1f
/* 0C3A34 800C8FD4 7C831B78 */  or      r3, r4, r3
/* 0C3A38 800C8FD8 907F002C */  stw     r3, 0x2c(r31)
/* 0C3A3C 800C8FDC 38C00008 */  li      r6, 8
/* 0C3A40 800C8FE0 3B600000 */  li      r27, 0
/* 0C3A44 800C8FE4 901C0000 */  stw     r0, 0(r28)
/* 0C3A48 800C8FE8 387C0000 */  addi    r3, r28, 0
/* 0C3A4C 800C8FEC 38800008 */  li      r4, 8
/* 0C3A50 800C8FF0 90BC0004 */  stw     r5, 4(r28)
/* 0C3A54 800C8FF4 939D0000 */  stw     r28, 0(r29)
/* 0C3A58 800C8FF8 90DD0004 */  stw     r6, 4(r29)
/* 0C3A5C 800C8FFC 92DD000C */  stw     r22, 0xc(r29)
/* 0C3A60 800C9000 937D0008 */  stw     r27, 8(r29)
/* 0C3A64 800C9004 4BFE01ED */  bl      DCFlushRange
/* 0C3A68 800C9008 38760000 */  addi    r3, r22, 0
/* 0C3A6C 800C900C 38800004 */  li      r4, 4
/* 0C3A70 800C9010 4BFE01B5 */  bl      DCInvalidateRange
/* 0C3A74 800C9014 387D0000 */  addi    r3, r29, 0
/* 0C3A78 800C9018 38800010 */  li      r4, 0x10
/* 0C3A7C 800C901C 4BFE01D5 */  bl      DCFlushRange
/* 0C3A80 800C9020 380000FF */  li      r0, 0xff
/* 0C3A84 800C9024 3C608010 */  lis     r3, CardData@ha
/* 0C3A88 800C9028 901E0004 */  stw     r0, 4(r30)
/* 0C3A8C 800C902C 38631B20 */  addi    r3, r3, CardData@l
/* 0C3A90 800C9030 3C038000 */  addis   r0, r3, 0x8000
/* 0C3A94 800C9034 901E000C */  stw     r0, 0xc(r30)
/* 0C3A98 800C9038 38000160 */  li      r0, 0x160
/* 0C3A9C 800C903C 3C80800D */  lis     r4, InitCallback@ha
/* 0C3AA0 800C9040 901E0010 */  stw     r0, 0x10(r30)
/* 0C3AA4 800C9044 3C60800D */  lis     r3, DoneCallback@ha
/* 0C3AA8 800C9048 38A00010 */  li      r5, 0x10
/* 0C3AAC 800C904C 937E0014 */  stw     r27, 0x14(r30)
/* 0C3AB0 800C9050 38849098 */  addi    r4, r4, InitCallback@l
/* 0C3AB4 800C9054 38039108 */  addi    r0, r3, DoneCallback@l
/* 0C3AB8 800C9058 B0BE0024 */  sth     r5, 0x24(r30)
/* 0C3ABC 800C905C 7FC3F378 */  mr      r3, r30
/* 0C3AC0 800C9060 909E0028 */  stw     r4, 0x28(r30)
/* 0C3AC4 800C9064 937E002C */  stw     r27, 0x2c(r30)
/* 0C3AC8 800C9068 901E0030 */  stw     r0, 0x30(r30)
/* 0C3ACC 800C906C 937E0034 */  stw     r27, 0x34(r30)
/* 0C3AD0 800C9070 4BFFD535 */  bl      DSPAddTask
/* 0C3AD4 800C9074 93370000 */  stw     r25, 0(r23)
/* 0C3AD8 800C9078 38600000 */  li      r3, 0
/* 0C3ADC 800C907C 93570004 */  stw     r26, 4(r23)
/* 0C3AE0 800C9080 93170008 */  stw     r24, 8(r23)
lbl_800C9084:
/* 0C3AE4 800C9084 BAC100F8 */  lmw     r22, 0xf8(r1)
/* 0C3AE8 800C9088 80010124 */  lwz     r0, 0x124(r1)
/* 0C3AEC 800C908C 38210120 */  addi    r1, r1, 0x120
/* 0C3AF0 800C9090 7C0803A6 */  mtlr    r0
/* 0C3AF4 800C9094 4E800020 */  blr     

InitCallback:
/* 0C3AF8 800C9098 7C0802A6 */  mflr    r0
/* 0C3AFC 800C909C 3C808014 */  lis     r4, __CARDBlock@ha
/* 0C3B00 800C90A0 90010004 */  stw     r0, 4(r1)
/* 0C3B04 800C90A4 388424D0 */  addi    r4, r4, __CARDBlock@l
/* 0C3B08 800C90A8 38040030 */  addi    r0, r4, 0x30
/* 0C3B0C 800C90AC 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0C3B10 800C90B0 7C001840 */  cmplw   r0, r3
/* 0C3B14 800C90B4 93E10014 */  stw     r31, 0x14(r1)
/* 0C3B18 800C90B8 41820010 */  beq     lbl_800C90C8
/* 0C3B1C 800C90BC 38040140 */  addi    r0, r4, 0x140
/* 0C3B20 800C90C0 7C001840 */  cmplw   r0, r3
/* 0C3B24 800C90C4 38840110 */  addi    r4, r4, 0x110
lbl_800C90C8:
/* 0C3B28 800C90C8 83E40080 */  lwz     r31, 0x80(r4)
/* 0C3B2C 800C90CC 3C60FF00 */  lis     r3, 0xff00
/* 0C3B30 800C90D0 4BFFD3FD */  bl      DSPSendMailToDSP
lbl_800C90D4:
/* 0C3B34 800C90D4 4BFFD3C1 */  bl      DSPCheckMailToDSP
/* 0C3B38 800C90D8 28030000 */  cmplwi  r3, 0
/* 0C3B3C 800C90DC 4082FFF8 */  bne     lbl_800C90D4
/* 0C3B40 800C90E0 7FE3FB78 */  mr      r3, r31
/* 0C3B44 800C90E4 4BFFD3E9 */  bl      DSPSendMailToDSP
lbl_800C90E8:
/* 0C3B48 800C90E8 4BFFD3AD */  bl      DSPCheckMailToDSP
/* 0C3B4C 800C90EC 28030000 */  cmplwi  r3, 0
/* 0C3B50 800C90F0 4082FFF8 */  bne     lbl_800C90E8
/* 0C3B54 800C90F4 8001001C */  lwz     r0, 0x1c(r1)
/* 0C3B58 800C90F8 83E10014 */  lwz     r31, 0x14(r1)
/* 0C3B5C 800C90FC 38210018 */  addi    r1, r1, 0x18
/* 0C3B60 800C9100 7C0803A6 */  mtlr    r0
/* 0C3B64 800C9104 4E800020 */  blr     

DoneCallback:
/* 0C3B68 800C9108 7C0802A6 */  mflr    r0
/* 0C3B6C 800C910C 3C808014 */  lis     r4, __CARDBlock@ha
/* 0C3B70 800C9110 90010004 */  stw     r0, 4(r1)
/* 0C3B74 800C9114 388424D0 */  addi    r4, r4, __CARDBlock@l
/* 0C3B78 800C9118 38040030 */  addi    r0, r4, 0x30
/* 0C3B7C 800C911C 9421FF78 */  stwu    r1, -0x88(r1)
/* 0C3B80 800C9120 7C001840 */  cmplw   r0, r3
/* 0C3B84 800C9124 93E10084 */  stw     r31, 0x84(r1)
/* 0C3B88 800C9128 3BE00000 */  li      r31, 0
/* 0C3B8C 800C912C 93C10080 */  stw     r30, 0x80(r1)
/* 0C3B90 800C9130 93A1007C */  stw     r29, 0x7c(r1)
/* 0C3B94 800C9134 3BA40000 */  addi    r29, r4, 0
/* 0C3B98 800C9138 93810078 */  stw     r28, 0x78(r1)
/* 0C3B9C 800C913C 41820020 */  beq     lbl_800C915C
/* 0C3BA0 800C9140 38040140 */  addi    r0, r4, 0x140
/* 0C3BA4 800C9144 7C001840 */  cmplw   r0, r3
/* 0C3BA8 800C9148 38840110 */  addi    r4, r4, 0x110
/* 0C3BAC 800C914C 3BA40000 */  addi    r29, r4, 0
/* 0C3BB0 800C9150 3BE00001 */  li      r31, 1
/* 0C3BB4 800C9154 41820008 */  beq     lbl_800C915C
/* 0C3BB8 800C9158 3BE00002 */  li      r31, 2
lbl_800C915C:
/* 0C3BBC 800C915C 807D0080 */  lwz     r3, 0x80(r29)
/* 0C3BC0 800C9160 3803002F */  addi    r0, r3, 0x2f
/* 0C3BC4 800C9164 54030034 */  rlwinm  r3, r0, 0, 0, 0x1a
/* 0C3BC8 800C9168 83C30020 */  lwz     r30, 0x20(r3)
/* 0C3BCC 800C916C 4BFFF311 */  bl      DummyLen
/* 0C3BD0 800C9170 801D002C */  lwz     r0, 0x2c(r29)
/* 0C3BD4 800C9174 3B830000 */  addi    r28, r3, 0
/* 0C3BD8 800C9178 38DC0000 */  addi    r6, r28, 0
/* 0C3BDC 800C917C 7FC00278 */  xor     r0, r30, r0
/* 0C3BE0 800C9180 5404001E */  rlwinm  r4, r0, 0, 0, 0xf
/* 0C3BE4 800C9184 387F0000 */  addi    r3, r31, 0
/* 0C3BE8 800C9188 38A10034 */  addi    r5, r1, 0x34
/* 0C3BEC 800C918C 38E00001 */  li      r7, 1
/* 0C3BF0 800C9190 4BFFF1A9 */  bl      ReadArrayUnlock
/* 0C3BF4 800C9194 2C030000 */  cmpwi   r3, 0
/* 0C3BF8 800C9198 4080001C */  bge     lbl_800C91B4
/* 0C3BFC 800C919C 7FE3FB78 */  mr      r3, r31
/* 0C3C00 800C91A0 4BFE6549 */  bl      EXIUnlock
/* 0C3C04 800C91A4 387F0000 */  addi    r3, r31, 0
/* 0C3C08 800C91A8 3880FFFD */  li      r4, -3
/* 0C3C0C 800C91AC 48002141 */  bl      __CARDMountCallback
/* 0C3C10 800C91B0 4800025C */  b       lbl_800C940C
lbl_800C91B4:
/* 0C3C14 800C91B4 809D0014 */  lwz     r4, 0x14(r29)
/* 0C3C18 800C91B8 38600000 */  li      r3, 0
/* 0C3C1C 800C91BC 801D002C */  lwz     r0, 0x2c(r29)
/* 0C3C20 800C91C0 7C9C2214 */  add     r4, r28, r4
/* 0C3C24 800C91C4 38840004 */  addi    r4, r4, 4
/* 0C3C28 800C91C8 54841838 */  slwi    r4, r4, 3
/* 0C3C2C 800C91CC 38840001 */  addi    r4, r4, 1
/* 0C3C30 800C91D0 28040000 */  cmplwi  r4, 0
/* 0C3C34 800C91D4 40810168 */  ble     lbl_800C933C
/* 0C3C38 800C91D8 28040008 */  cmplwi  r4, 8
/* 0C3C3C 800C91DC 38C4FFF8 */  addi    r6, r4, -8
/* 0C3C40 800C91E0 40810124 */  ble     lbl_800C9304
/* 0C3C44 800C91E4 38A60007 */  addi    r5, r6, 7
/* 0C3C48 800C91E8 54A5E8FE */  srwi    r5, r5, 3
/* 0C3C4C 800C91EC 28060000 */  cmplwi  r6, 0
/* 0C3C50 800C91F0 7CA903A6 */  mtctr   r5
/* 0C3C54 800C91F4 40810110 */  ble     lbl_800C9304
lbl_800C91F8:
/* 0C3C58 800C91F8 54053830 */  slwi    r5, r0, 7
/* 0C3C5C 800C91FC 54067820 */  slwi    r6, r0, 0xf
/* 0C3C60 800C9200 7C052A78 */  xor     r5, r0, r5
/* 0C3C64 800C9204 7CC52A78 */  xor     r5, r6, r5
/* 0C3C68 800C9208 5407B810 */  slwi    r7, r0, 0x17
/* 0C3C6C 800C920C 7CE52A38 */  eqv     r5, r7, r5
/* 0C3C70 800C9210 5406083C */  slwi    r6, r0, 1
/* 0C3C74 800C9214 54A017BC */  rlwinm  r0, r5, 2, 0x1e, 0x1e
/* 0C3C78 800C9218 7CC70378 */  or      r7, r6, r0
/* 0C3C7C 800C921C 54E03830 */  slwi    r0, r7, 7
/* 0C3C80 800C9220 54E57820 */  slwi    r5, r7, 0xf
/* 0C3C84 800C9224 7CE00278 */  xor     r0, r7, r0
/* 0C3C88 800C9228 54E6B810 */  slwi    r6, r7, 0x17
/* 0C3C8C 800C922C 7CA00278 */  xor     r0, r5, r0
/* 0C3C90 800C9230 7CC00238 */  eqv     r0, r6, r0
/* 0C3C94 800C9234 540817BC */  rlwinm  r8, r0, 2, 0x1e, 0x1e
/* 0C3C98 800C9238 50E8083A */  rlwimi  r8, r7, 1, 0, 0x1d
/* 0C3C9C 800C923C 55003830 */  slwi    r0, r8, 7
/* 0C3CA0 800C9240 55057820 */  slwi    r5, r8, 0xf
/* 0C3CA4 800C9244 7D000278 */  xor     r0, r8, r0
/* 0C3CA8 800C9248 5506B810 */  slwi    r6, r8, 0x17
/* 0C3CAC 800C924C 7CA00278 */  xor     r0, r5, r0
/* 0C3CB0 800C9250 7CC00238 */  eqv     r0, r6, r0
/* 0C3CB4 800C9254 540717BC */  rlwinm  r7, r0, 2, 0x1e, 0x1e
/* 0C3CB8 800C9258 5107083A */  rlwimi  r7, r8, 1, 0, 0x1d
/* 0C3CBC 800C925C 54E03830 */  slwi    r0, r7, 7
/* 0C3CC0 800C9260 54E57820 */  slwi    r5, r7, 0xf
/* 0C3CC4 800C9264 7CE00278 */  xor     r0, r7, r0
/* 0C3CC8 800C9268 54E6B810 */  slwi    r6, r7, 0x17
/* 0C3CCC 800C926C 7CA00278 */  xor     r0, r5, r0
/* 0C3CD0 800C9270 7CC00238 */  eqv     r0, r6, r0
/* 0C3CD4 800C9274 540817BC */  rlwinm  r8, r0, 2, 0x1e, 0x1e
/* 0C3CD8 800C9278 50E8083A */  rlwimi  r8, r7, 1, 0, 0x1d
/* 0C3CDC 800C927C 55003830 */  slwi    r0, r8, 7
/* 0C3CE0 800C9280 55057820 */  slwi    r5, r8, 0xf
/* 0C3CE4 800C9284 7D000278 */  xor     r0, r8, r0
/* 0C3CE8 800C9288 5506B810 */  slwi    r6, r8, 0x17
/* 0C3CEC 800C928C 7CA00278 */  xor     r0, r5, r0
/* 0C3CF0 800C9290 7CC00238 */  eqv     r0, r6, r0
/* 0C3CF4 800C9294 540717BC */  rlwinm  r7, r0, 2, 0x1e, 0x1e
/* 0C3CF8 800C9298 5107083A */  rlwimi  r7, r8, 1, 0, 0x1d
/* 0C3CFC 800C929C 54E03830 */  slwi    r0, r7, 7
/* 0C3D00 800C92A0 54E57820 */  slwi    r5, r7, 0xf
/* 0C3D04 800C92A4 7CE00278 */  xor     r0, r7, r0
/* 0C3D08 800C92A8 54E6B810 */  slwi    r6, r7, 0x17
/* 0C3D0C 800C92AC 7CA00278 */  xor     r0, r5, r0
/* 0C3D10 800C92B0 7CC00238 */  eqv     r0, r6, r0
/* 0C3D14 800C92B4 540817BC */  rlwinm  r8, r0, 2, 0x1e, 0x1e
/* 0C3D18 800C92B8 50E8083A */  rlwimi  r8, r7, 1, 0, 0x1d
/* 0C3D1C 800C92BC 55003830 */  slwi    r0, r8, 7
/* 0C3D20 800C92C0 55057820 */  slwi    r5, r8, 0xf
/* 0C3D24 800C92C4 7D000278 */  xor     r0, r8, r0
/* 0C3D28 800C92C8 5506B810 */  slwi    r6, r8, 0x17
/* 0C3D2C 800C92CC 7CA00278 */  xor     r0, r5, r0
/* 0C3D30 800C92D0 7CC00238 */  eqv     r0, r6, r0
/* 0C3D34 800C92D4 540717BC */  rlwinm  r7, r0, 2, 0x1e, 0x1e
/* 0C3D38 800C92D8 5107083A */  rlwimi  r7, r8, 1, 0, 0x1d
/* 0C3D3C 800C92DC 54E03830 */  slwi    r0, r7, 7
/* 0C3D40 800C92E0 54E57820 */  slwi    r5, r7, 0xf
/* 0C3D44 800C92E4 7CE00278 */  xor     r0, r7, r0
/* 0C3D48 800C92E8 54E6B810 */  slwi    r6, r7, 0x17
/* 0C3D4C 800C92EC 7CA00278 */  xor     r0, r5, r0
/* 0C3D50 800C92F0 7CC00238 */  eqv     r0, r6, r0
/* 0C3D54 800C92F4 540017BC */  rlwinm  r0, r0, 2, 0x1e, 0x1e
/* 0C3D58 800C92F8 50E0083A */  rlwimi  r0, r7, 1, 0, 0x1d
/* 0C3D5C 800C92FC 38630008 */  addi    r3, r3, 8
/* 0C3D60 800C9300 4200FEF8 */  bdnz    lbl_800C91F8
lbl_800C9304:
/* 0C3D64 800C9304 7CA32050 */  subf    r5, r3, r4
/* 0C3D68 800C9308 7C032040 */  cmplw   r3, r4
/* 0C3D6C 800C930C 7CA903A6 */  mtctr   r5
/* 0C3D70 800C9310 4080002C */  bge     lbl_800C933C
lbl_800C9314:
/* 0C3D74 800C9314 54033830 */  slwi    r3, r0, 7
/* 0C3D78 800C9318 54047820 */  slwi    r4, r0, 0xf
/* 0C3D7C 800C931C 7C031A78 */  xor     r3, r0, r3
/* 0C3D80 800C9320 5405B810 */  slwi    r5, r0, 0x17
/* 0C3D84 800C9324 7C831A78 */  xor     r3, r4, r3
/* 0C3D88 800C9328 7CA31A38 */  eqv     r3, r5, r3
/* 0C3D8C 800C932C 5404083C */  slwi    r4, r0, 1
/* 0C3D90 800C9330 546017BC */  rlwinm  r0, r3, 2, 0x1e, 0x1e
/* 0C3D94 800C9334 7C800378 */  or      r0, r4, r0
/* 0C3D98 800C9338 4200FFDC */  bdnz    lbl_800C9314
lbl_800C933C:
/* 0C3D9C 800C933C 54033830 */  slwi    r3, r0, 7
/* 0C3DA0 800C9340 54047820 */  slwi    r4, r0, 0xf
/* 0C3DA4 800C9344 7C031A78 */  xor     r3, r0, r3
/* 0C3DA8 800C9348 5405B810 */  slwi    r5, r0, 0x17
/* 0C3DAC 800C934C 7C831A78 */  xor     r3, r4, r3
/* 0C3DB0 800C9350 7CA31A38 */  eqv     r3, r5, r3
/* 0C3DB4 800C9354 54630FFE */  srwi    r3, r3, 0x1f
/* 0C3DB8 800C9358 7C001B78 */  or      r0, r0, r3
/* 0C3DBC 800C935C 901D002C */  stw     r0, 0x2c(r29)
/* 0C3DC0 800C9360 4BFFF11D */  bl      DummyLen
/* 0C3DC4 800C9364 801D002C */  lwz     r0, 0x2c(r29)
/* 0C3DC8 800C9368 57C4801E */  slwi    r4, r30, 0x10
/* 0C3DCC 800C936C 38C30000 */  addi    r6, r3, 0
/* 0C3DD0 800C9370 7C800278 */  xor     r0, r4, r0
/* 0C3DD4 800C9374 5404001E */  rlwinm  r4, r0, 0, 0, 0xf
/* 0C3DD8 800C9378 387F0000 */  addi    r3, r31, 0
/* 0C3DDC 800C937C 38A10034 */  addi    r5, r1, 0x34
/* 0C3DE0 800C9380 38E00001 */  li      r7, 1
/* 0C3DE4 800C9384 4BFFEFB5 */  bl      ReadArrayUnlock
/* 0C3DE8 800C9388 2C030000 */  cmpwi   r3, 0
/* 0C3DEC 800C938C 4080001C */  bge     lbl_800C93A8
/* 0C3DF0 800C9390 7FE3FB78 */  mr      r3, r31
/* 0C3DF4 800C9394 4BFE6355 */  bl      EXIUnlock
/* 0C3DF8 800C9398 387F0000 */  addi    r3, r31, 0
/* 0C3DFC 800C939C 3880FFFD */  li      r4, -3
/* 0C3E00 800C93A0 48001F4D */  bl      __CARDMountCallback
/* 0C3E04 800C93A4 48000068 */  b       lbl_800C940C
lbl_800C93A8:
/* 0C3E08 800C93A8 387F0000 */  addi    r3, r31, 0
/* 0C3E0C 800C93AC 38810030 */  addi    r4, r1, 0x30
/* 0C3E10 800C93B0 4BFFDF4D */  bl      __CARDReadStatus
/* 0C3E14 800C93B4 3B830000 */  addi    r28, r3, 0
/* 0C3E18 800C93B8 387F0000 */  addi    r3, r31, 0
/* 0C3E1C 800C93BC 4BFE577D */  bl      EXIProbe
/* 0C3E20 800C93C0 2C030000 */  cmpwi   r3, 0
/* 0C3E24 800C93C4 4082001C */  bne     lbl_800C93E0
/* 0C3E28 800C93C8 7FE3FB78 */  mr      r3, r31
/* 0C3E2C 800C93CC 4BFE631D */  bl      EXIUnlock
/* 0C3E30 800C93D0 387F0000 */  addi    r3, r31, 0
/* 0C3E34 800C93D4 3880FFFD */  li      r4, -3
/* 0C3E38 800C93D8 48001F15 */  bl      __CARDMountCallback
/* 0C3E3C 800C93DC 48000030 */  b       lbl_800C940C
lbl_800C93E0:
/* 0C3E40 800C93E0 2C1C0000 */  cmpwi   r28, 0
/* 0C3E44 800C93E4 4082001C */  bne     lbl_800C9400
/* 0C3E48 800C93E8 88010030 */  lbz     r0, 0x30(r1)
/* 0C3E4C 800C93EC 54000673 */  rlwinm. r0, r0, 0, 0x19, 0x19
/* 0C3E50 800C93F0 40820010 */  bne     lbl_800C9400
/* 0C3E54 800C93F4 7FE3FB78 */  mr      r3, r31
/* 0C3E58 800C93F8 4BFE62F1 */  bl      EXIUnlock
/* 0C3E5C 800C93FC 3B80FFFB */  li      r28, -5
lbl_800C9400:
/* 0C3E60 800C9400 387F0000 */  addi    r3, r31, 0
/* 0C3E64 800C9404 389C0000 */  addi    r4, r28, 0
/* 0C3E68 800C9408 48001EE5 */  bl      __CARDMountCallback
lbl_800C940C:
/* 0C3E6C 800C940C 8001008C */  lwz     r0, 0x8c(r1)
/* 0C3E70 800C9410 83E10084 */  lwz     r31, 0x84(r1)
/* 0C3E74 800C9414 83C10080 */  lwz     r30, 0x80(r1)
/* 0C3E78 800C9418 83A1007C */  lwz     r29, 0x7c(r1)
/* 0C3E7C 800C941C 83810078 */  lwz     r28, 0x78(r1)
/* 0C3E80 800C9420 38210088 */  addi    r1, r1, 0x88
/* 0C3E84 800C9424 7C0803A6 */  mtlr    r0
/* 0C3E88 800C9428 4E800020 */  blr     


.section .data, "wa"

.balign 32

/* 000FEBA0 80101B20 0160 */
CardData:
    .long 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000021, 0x02FF0021, 0x13061203, 0x12041305, 0x009200FF, 0x0088FFFF, 0x0089FFFF, 0x008AFFFF, 0x008BFFFF, 0x8F0002BF
    .long 0x008816FC, 0xDCD116FD, 0x000016FB, 0x000102BF, 0x008E25FF, 0x0380FF00, 0x02940027, 0x02BF008E, 0x1FDF24FF, 0x02400FFF, 0x00980400, 0x009A0010, 0x00990000, 0x8E0002BF, 0x009402BF, 0x864402BF
    .long 0x008816FC, 0xDCD116FD, 0x000316FB, 0x00018F00, 0x02BF008E, 0x0380CDD1, 0x02940048, 0x27FF0380, 0x00010295, 0x005A0380, 0x00020295, 0x8000029F, 0x00480021, 0x8E0002BF, 0x008E25FF, 0x02BF008E
    .long 0x25FF02BF, 0x008E25FF, 0x02BF008E, 0x00C5FFFF, 0x03400FFF, 0x1C9F02BF, 0x008E00C7, 0xFFFF02BF, 0x008E00C6, 0xFFFF02BF, 0x008E00C0, 0xFFFF02BF, 0x008E20FF, 0x03400FFF, 0x1F5F02BF, 0x008E21FF
    .long 0x02BF008E, 0x23FF1205, 0x1206029F, 0x80B50021, 0x27FC03C0, 0x8000029D, 0x008802DF, 0x27FE03C0, 0x8000029C, 0x008E02DF, 0x2ECE2CCF, 0x00F8FFCD, 0x00F9FFC9, 0x00FAFFCB, 0x26C902C0, 0x0004029D
    .long 0x009C02DF, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000


.section .sdata, "wa"

.balign 8

/* 00100070 80145810 0004 */
next:
    .long 0x00000001


