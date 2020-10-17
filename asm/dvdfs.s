# dvdfs.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel __DVDFSInit
/* 0B8C10 800BE1B0 3C608000 */  lis     r3, 0x8000
/* 0B8C14 800BE1B4 906D92F8 */  stw     r3, BootInfo-_SDA_BASE_(r13)
/* 0B8C18 800BE1B8 80030038 */  lwz     r0, 0x38(r3)
/* 0B8C1C 800BE1BC 900D92FC */  stw     r0, FstStart-_SDA_BASE_(r13)
/* 0B8C20 800BE1C0 806D92FC */  lwz     r3, FstStart-_SDA_BASE_(r13)
/* 0B8C24 800BE1C4 28030000 */  cmplwi  r3, 0
/* 0B8C28 800BE1C8 4D820020 */  beqlr   
/* 0B8C2C 800BE1CC 80030008 */  lwz     r0, 8(r3)
/* 0B8C30 800BE1D0 900D9304 */  stw     r0, MaxEntryNum-_SDA_BASE_(r13)
/* 0B8C34 800BE1D4 800D9304 */  lwz     r0, MaxEntryNum-_SDA_BASE_(r13)
/* 0B8C38 800BE1D8 1C00000C */  mulli   r0, r0, 0xc
/* 0B8C3C 800BE1DC 7C030214 */  add     r0, r3, r0
/* 0B8C40 800BE1E0 900D9300 */  stw     r0, FstStringStart-_SDA_BASE_(r13)
/* 0B8C44 800BE1E4 4E800020 */  blr     

glabel DVDConvertPathToEntrynum
/* 0B8C48 800BE1E8 7C0802A6 */  mflr    r0
/* 0B8C4C 800BE1EC 90010004 */  stw     r0, 4(r1)
/* 0B8C50 800BE1F0 9421FFB8 */  stwu    r1, -0x48(r1)
/* 0B8C54 800BE1F4 BE810018 */  stmw    r20, 0x18(r1)
/* 0B8C58 800BE1F8 7C771B78 */  mr      r23, r3
/* 0B8C5C 800BE1FC 3C608010 */  lis     r3, D_80100358@ha
/* 0B8C60 800BE200 3B370000 */  addi    r25, r23, 0
/* 0B8C64 800BE204 3BE30358 */  addi    r31, r3, D_80100358@l
/* 0B8C68 800BE208 834D9308 */  lwz     r26, currentDirectory-_SDA_BASE_(r13)
lbl_800BE20C:
/* 0B8C6C 800BE20C 88770000 */  lbz     r3, 0(r23)
/* 0B8C70 800BE210 7C600775 */  extsb.  r0, r3
/* 0B8C74 800BE214 4082000C */  bne     lbl_800BE220
/* 0B8C78 800BE218 7F43D378 */  mr      r3, r26
/* 0B8C7C 800BE21C 480002AC */  b       lbl_800BE4C8
lbl_800BE220:
/* 0B8C80 800BE220 7C600774 */  extsb   r0, r3
/* 0B8C84 800BE224 2C00002F */  cmpwi   r0, 0x2f
/* 0B8C88 800BE228 40820010 */  bne     lbl_800BE238
/* 0B8C8C 800BE22C 3B400000 */  li      r26, 0
/* 0B8C90 800BE230 3AF70001 */  addi    r23, r23, 1
/* 0B8C94 800BE234 4BFFFFD8 */  b       lbl_800BE20C
lbl_800BE238:
/* 0B8C98 800BE238 2C00002E */  cmpwi   r0, 0x2e
/* 0B8C9C 800BE23C 40820074 */  bne     lbl_800BE2B0
/* 0B8CA0 800BE240 88770001 */  lbz     r3, 1(r23)
/* 0B8CA4 800BE244 7C600774 */  extsb   r0, r3
/* 0B8CA8 800BE248 2C00002E */  cmpwi   r0, 0x2e
/* 0B8CAC 800BE24C 40820044 */  bne     lbl_800BE290
/* 0B8CB0 800BE250 88770002 */  lbz     r3, 2(r23)
/* 0B8CB4 800BE254 2C03002F */  cmpwi   r3, 0x2f
/* 0B8CB8 800BE258 4082001C */  bne     lbl_800BE274
/* 0B8CBC 800BE25C 1C7A000C */  mulli   r3, r26, 0xc
/* 0B8CC0 800BE260 808D92FC */  lwz     r4, FstStart-_SDA_BASE_(r13)
/* 0B8CC4 800BE264 38030004 */  addi    r0, r3, 4
/* 0B8CC8 800BE268 7F44002E */  lwzx    r26, r4, r0
/* 0B8CCC 800BE26C 3AF70003 */  addi    r23, r23, 3
/* 0B8CD0 800BE270 4BFFFF9C */  b       lbl_800BE20C
lbl_800BE274:
/* 0B8CD4 800BE274 7C600775 */  extsb.  r0, r3
/* 0B8CD8 800BE278 40820038 */  bne     lbl_800BE2B0
/* 0B8CDC 800BE27C 1C1A000C */  mulli   r0, r26, 0xc
/* 0B8CE0 800BE280 806D92FC */  lwz     r3, FstStart-_SDA_BASE_(r13)
/* 0B8CE4 800BE284 7C630214 */  add     r3, r3, r0
/* 0B8CE8 800BE288 80630004 */  lwz     r3, 4(r3)
/* 0B8CEC 800BE28C 4800023C */  b       lbl_800BE4C8
lbl_800BE290:
/* 0B8CF0 800BE290 2C00002F */  cmpwi   r0, 0x2f
/* 0B8CF4 800BE294 4082000C */  bne     lbl_800BE2A0
/* 0B8CF8 800BE298 3AF70002 */  addi    r23, r23, 2
/* 0B8CFC 800BE29C 4BFFFF70 */  b       lbl_800BE20C
lbl_800BE2A0:
/* 0B8D00 800BE2A0 7C600775 */  extsb.  r0, r3
/* 0B8D04 800BE2A4 4082000C */  bne     lbl_800BE2B0
/* 0B8D08 800BE2A8 7F43D378 */  mr      r3, r26
/* 0B8D0C 800BE2AC 4800021C */  b       lbl_800BE4C8
lbl_800BE2B0:
/* 0B8D10 800BE2B0 800D930C */  lwz     r0, __DVDLongFileNameFlag-_SDA_BASE_(r13)
/* 0B8D14 800BE2B4 28000000 */  cmplwi  r0, 0
/* 0B8D18 800BE2B8 408200AC */  bne     lbl_800BE364
/* 0B8D1C 800BE2BC 3B970000 */  addi    r28, r23, 0
/* 0B8D20 800BE2C0 38A00000 */  li      r5, 0
/* 0B8D24 800BE2C4 38800000 */  li      r4, 0
/* 0B8D28 800BE2C8 48000048 */  b       lbl_800BE310
lbl_800BE2CC:
/* 0B8D2C 800BE2CC 7C600774 */  extsb   r0, r3
/* 0B8D30 800BE2D0 2C00002E */  cmpwi   r0, 0x2e
/* 0B8D34 800BE2D4 4082002C */  bne     lbl_800BE300
/* 0B8D38 800BE2D8 7C17E050 */  subf    r0, r23, r28
/* 0B8D3C 800BE2DC 2C000008 */  cmpwi   r0, 8
/* 0B8D40 800BE2E0 4181000C */  bgt     lbl_800BE2EC
/* 0B8D44 800BE2E4 2C050001 */  cmpwi   r5, 1
/* 0B8D48 800BE2E8 4082000C */  bne     lbl_800BE2F4
lbl_800BE2EC:
/* 0B8D4C 800BE2EC 38800001 */  li      r4, 1
/* 0B8D50 800BE2F0 48000038 */  b       lbl_800BE328
lbl_800BE2F4:
/* 0B8D54 800BE2F4 3B1C0001 */  addi    r24, r28, 1
/* 0B8D58 800BE2F8 38A00001 */  li      r5, 1
/* 0B8D5C 800BE2FC 48000010 */  b       lbl_800BE30C
lbl_800BE300:
/* 0B8D60 800BE300 2C000020 */  cmpwi   r0, 0x20
/* 0B8D64 800BE304 40820008 */  bne     lbl_800BE30C
/* 0B8D68 800BE308 38800001 */  li      r4, 1
lbl_800BE30C:
/* 0B8D6C 800BE30C 3B9C0001 */  addi    r28, r28, 1
lbl_800BE310:
/* 0B8D70 800BE310 887C0000 */  lbz     r3, 0(r28)
/* 0B8D74 800BE314 7C600775 */  extsb.  r0, r3
/* 0B8D78 800BE318 41820010 */  beq     lbl_800BE328
/* 0B8D7C 800BE31C 7C600774 */  extsb   r0, r3
/* 0B8D80 800BE320 2C00002F */  cmpwi   r0, 0x2f
/* 0B8D84 800BE324 4082FFA8 */  bne     lbl_800BE2CC
lbl_800BE328:
/* 0B8D88 800BE328 2C050001 */  cmpwi   r5, 1
/* 0B8D8C 800BE32C 40820014 */  bne     lbl_800BE340
/* 0B8D90 800BE330 7C18E050 */  subf    r0, r24, r28
/* 0B8D94 800BE334 2C000003 */  cmpwi   r0, 3
/* 0B8D98 800BE338 40810008 */  ble     lbl_800BE340
/* 0B8D9C 800BE33C 38800001 */  li      r4, 1
lbl_800BE340:
/* 0B8DA0 800BE340 2C040000 */  cmpwi   r4, 0
/* 0B8DA4 800BE344 41820044 */  beq     lbl_800BE388
/* 0B8DA8 800BE348 38BF0000 */  addi    r5, r31, 0
/* 0B8DAC 800BE34C 4CC63182 */  crclr   6
/* 0B8DB0 800BE350 38D90000 */  addi    r6, r25, 0
/* 0B8DB4 800BE354 386D8DD0 */  addi    r3, r13, D_801457B0-_SDA_BASE_
/* 0B8DB8 800BE358 3880017F */  li      r4, 0x17f
/* 0B8DBC 800BE35C 4BFEBD91 */  bl      OSPanic
/* 0B8DC0 800BE360 48000028 */  b       lbl_800BE388
lbl_800BE364:
/* 0B8DC4 800BE364 7EFCBB78 */  mr      r28, r23
/* 0B8DC8 800BE368 48000008 */  b       lbl_800BE370
lbl_800BE36C:
/* 0B8DCC 800BE36C 3B9C0001 */  addi    r28, r28, 1
lbl_800BE370:
/* 0B8DD0 800BE370 887C0000 */  lbz     r3, 0(r28)
/* 0B8DD4 800BE374 7C600775 */  extsb.  r0, r3
/* 0B8DD8 800BE378 41820010 */  beq     lbl_800BE388
/* 0B8DDC 800BE37C 7C600774 */  extsb   r0, r3
/* 0B8DE0 800BE380 2C00002F */  cmpwi   r0, 0x2f
/* 0B8DE4 800BE384 4082FFE8 */  bne     lbl_800BE36C
lbl_800BE388:
/* 0B8DE8 800BE388 881C0000 */  lbz     r0, 0(r28)
/* 0B8DEC 800BE38C 7C000775 */  extsb.  r0, r0
/* 0B8DF0 800BE390 4082000C */  bne     lbl_800BE39C
/* 0B8DF4 800BE394 3BC00000 */  li      r30, 0
/* 0B8DF8 800BE398 48000008 */  b       lbl_800BE3A0
lbl_800BE39C:
/* 0B8DFC 800BE39C 3BC00001 */  li      r30, 1
lbl_800BE3A0:
/* 0B8E00 800BE3A0 1FBA000C */  mulli   r29, r26, 0xc
/* 0B8E04 800BE3A4 7F77E050 */  subf    r27, r23, r28
/* 0B8E08 800BE3A8 3B5A0001 */  addi    r26, r26, 1
/* 0B8E0C 800BE3AC 480000E4 */  b       lbl_800BE490
lbl_800BE3B0:
/* 0B8E10 800BE3B0 1F9A000C */  mulli   r28, r26, 0xc
/* 0B8E14 800BE3B4 7C83E02E */  lwzx    r4, r3, r28
/* 0B8E18 800BE3B8 5480000F */  rlwinm. r0, r4, 0, 0, 7
/* 0B8E1C 800BE3BC 4082000C */  bne     lbl_800BE3C8
/* 0B8E20 800BE3C0 38000000 */  li      r0, 0
/* 0B8E24 800BE3C4 48000008 */  b       lbl_800BE3CC
lbl_800BE3C8:
/* 0B8E28 800BE3C8 38000001 */  li      r0, 1
lbl_800BE3CC:
/* 0B8E2C 800BE3CC 2C000000 */  cmpwi   r0, 0
/* 0B8E30 800BE3D0 4082000C */  bne     lbl_800BE3DC
/* 0B8E34 800BE3D4 2C1E0001 */  cmpwi   r30, 1
/* 0B8E38 800BE3D8 41820080 */  beq     lbl_800BE458
lbl_800BE3DC:
/* 0B8E3C 800BE3DC 806D9300 */  lwz     r3, FstStringStart-_SDA_BASE_(r13)
/* 0B8E40 800BE3E0 5480023E */  clrlwi  r0, r4, 8
/* 0B8E44 800BE3E4 3AB70000 */  addi    r21, r23, 0
/* 0B8E48 800BE3E8 7E830214 */  add     r20, r3, r0
/* 0B8E4C 800BE3EC 48000038 */  b       lbl_800BE424
lbl_800BE3F0:
/* 0B8E50 800BE3F0 88140000 */  lbz     r0, 0(r20)
/* 0B8E54 800BE3F4 3A940001 */  addi    r20, r20, 1
/* 0B8E58 800BE3F8 7C030774 */  extsb   r3, r0
/* 0B8E5C 800BE3FC 4801C361 */  bl      tolower
/* 0B8E60 800BE400 88150000 */  lbz     r0, 0(r21)
/* 0B8E64 800BE404 3AC30000 */  addi    r22, r3, 0
/* 0B8E68 800BE408 3AB50001 */  addi    r21, r21, 1
/* 0B8E6C 800BE40C 7C030774 */  extsb   r3, r0
/* 0B8E70 800BE410 4801C34D */  bl      tolower
/* 0B8E74 800BE414 7C03B000 */  cmpw    r3, r22
/* 0B8E78 800BE418 4182000C */  beq     lbl_800BE424
/* 0B8E7C 800BE41C 38000000 */  li      r0, 0
/* 0B8E80 800BE420 48000030 */  b       lbl_800BE450
lbl_800BE424:
/* 0B8E84 800BE424 88140000 */  lbz     r0, 0(r20)
/* 0B8E88 800BE428 7C000775 */  extsb.  r0, r0
/* 0B8E8C 800BE42C 4082FFC4 */  bne     lbl_800BE3F0
/* 0B8E90 800BE430 88750000 */  lbz     r3, 0(r21)
/* 0B8E94 800BE434 2C03002F */  cmpwi   r3, 0x2f
/* 0B8E98 800BE438 4182000C */  beq     lbl_800BE444
/* 0B8E9C 800BE43C 7C600775 */  extsb.  r0, r3
/* 0B8EA0 800BE440 4082000C */  bne     lbl_800BE44C
lbl_800BE444:
/* 0B8EA4 800BE444 38000001 */  li      r0, 1
/* 0B8EA8 800BE448 48000008 */  b       lbl_800BE450
lbl_800BE44C:
/* 0B8EAC 800BE44C 38000000 */  li      r0, 0
lbl_800BE450:
/* 0B8EB0 800BE450 2C000001 */  cmpwi   r0, 1
/* 0B8EB4 800BE454 41820058 */  beq     lbl_800BE4AC
lbl_800BE458:
/* 0B8EB8 800BE458 800D92FC */  lwz     r0, FstStart-_SDA_BASE_(r13)
/* 0B8EBC 800BE45C 7C60E214 */  add     r3, r0, r28
/* 0B8EC0 800BE460 80030000 */  lwz     r0, 0(r3)
/* 0B8EC4 800BE464 5400000F */  rlwinm. r0, r0, 0, 0, 7
/* 0B8EC8 800BE468 4082000C */  bne     lbl_800BE474
/* 0B8ECC 800BE46C 38000000 */  li      r0, 0
/* 0B8ED0 800BE470 48000008 */  b       lbl_800BE478
lbl_800BE474:
/* 0B8ED4 800BE474 38000001 */  li      r0, 1
lbl_800BE478:
/* 0B8ED8 800BE478 2C000000 */  cmpwi   r0, 0
/* 0B8EDC 800BE47C 4182000C */  beq     lbl_800BE488
/* 0B8EE0 800BE480 80030008 */  lwz     r0, 8(r3)
/* 0B8EE4 800BE484 48000008 */  b       lbl_800BE48C
lbl_800BE488:
/* 0B8EE8 800BE488 381A0001 */  addi    r0, r26, 1
lbl_800BE48C:
/* 0B8EEC 800BE48C 7C1A0378 */  mr      r26, r0
lbl_800BE490:
/* 0B8EF0 800BE490 806D92FC */  lwz     r3, FstStart-_SDA_BASE_(r13)
/* 0B8EF4 800BE494 38030008 */  addi    r0, r3, 8
/* 0B8EF8 800BE498 7C1D002E */  lwzx    r0, r29, r0
/* 0B8EFC 800BE49C 7C1A0040 */  cmplw   r26, r0
/* 0B8F00 800BE4A0 4180FF10 */  blt     lbl_800BE3B0
/* 0B8F04 800BE4A4 3860FFFF */  li      r3, -1
/* 0B8F08 800BE4A8 48000020 */  b       lbl_800BE4C8
lbl_800BE4AC:
/* 0B8F0C 800BE4AC 2C1E0000 */  cmpwi   r30, 0
/* 0B8F10 800BE4B0 4082000C */  bne     lbl_800BE4BC
/* 0B8F14 800BE4B4 7F43D378 */  mr      r3, r26
/* 0B8F18 800BE4B8 48000010 */  b       lbl_800BE4C8
lbl_800BE4BC:
/* 0B8F1C 800BE4BC 7EFBBA14 */  add     r23, r27, r23
/* 0B8F20 800BE4C0 3AF70001 */  addi    r23, r23, 1
/* 0B8F24 800BE4C4 4BFFFD48 */  b       lbl_800BE20C
lbl_800BE4C8:
/* 0B8F28 800BE4C8 BA810018 */  lmw     r20, 0x18(r1)
/* 0B8F2C 800BE4CC 8001004C */  lwz     r0, 0x4c(r1)
/* 0B8F30 800BE4D0 38210048 */  addi    r1, r1, 0x48
/* 0B8F34 800BE4D4 7C0803A6 */  mtlr    r0
/* 0B8F38 800BE4D8 4E800020 */  blr     

glabel DVDFastOpen
/* 0B8F3C 800BE4DC 2C030000 */  cmpwi   r3, 0
/* 0B8F40 800BE4E0 41800038 */  blt     lbl_800BE518
/* 0B8F44 800BE4E4 800D9304 */  lwz     r0, MaxEntryNum-_SDA_BASE_(r13)
/* 0B8F48 800BE4E8 7C030040 */  cmplw   r3, r0
/* 0B8F4C 800BE4EC 4080002C */  bge     lbl_800BE518
/* 0B8F50 800BE4F0 1CC3000C */  mulli   r6, r3, 0xc
/* 0B8F54 800BE4F4 806D92FC */  lwz     r3, FstStart-_SDA_BASE_(r13)
/* 0B8F58 800BE4F8 7C03302E */  lwzx    r0, r3, r6
/* 0B8F5C 800BE4FC 5400000F */  rlwinm. r0, r0, 0, 0, 7
/* 0B8F60 800BE500 4082000C */  bne     lbl_800BE50C
/* 0B8F64 800BE504 38000000 */  li      r0, 0
/* 0B8F68 800BE508 48000008 */  b       lbl_800BE510
lbl_800BE50C:
/* 0B8F6C 800BE50C 38000001 */  li      r0, 1
lbl_800BE510:
/* 0B8F70 800BE510 2C000000 */  cmpwi   r0, 0
/* 0B8F74 800BE514 4182000C */  beq     lbl_800BE520
lbl_800BE518:
/* 0B8F78 800BE518 38600000 */  li      r3, 0
/* 0B8F7C 800BE51C 4E800020 */  blr     
lbl_800BE520:
/* 0B8F80 800BE520 7C633214 */  add     r3, r3, r6
/* 0B8F84 800BE524 80A30004 */  lwz     r5, 4(r3)
/* 0B8F88 800BE528 38000000 */  li      r0, 0
/* 0B8F8C 800BE52C 38600001 */  li      r3, 1
/* 0B8F90 800BE530 90A40030 */  stw     r5, 0x30(r4)
/* 0B8F94 800BE534 80AD92FC */  lwz     r5, FstStart-_SDA_BASE_(r13)
/* 0B8F98 800BE538 7CA53214 */  add     r5, r5, r6
/* 0B8F9C 800BE53C 80A50008 */  lwz     r5, 8(r5)
/* 0B8FA0 800BE540 90A40034 */  stw     r5, 0x34(r4)
/* 0B8FA4 800BE544 90040038 */  stw     r0, 0x38(r4)
/* 0B8FA8 800BE548 9004000C */  stw     r0, 0xc(r4)
/* 0B8FAC 800BE54C 4E800020 */  blr     

glabel DVDOpen
/* 0B8FB0 800BE550 7C0802A6 */  mflr    r0
/* 0B8FB4 800BE554 90010004 */  stw     r0, 4(r1)
/* 0B8FB8 800BE558 9421FF68 */  stwu    r1, -0x98(r1)
/* 0B8FBC 800BE55C 93E10094 */  stw     r31, 0x94(r1)
/* 0B8FC0 800BE560 3BE40000 */  addi    r31, r4, 0
/* 0B8FC4 800BE564 93C10090 */  stw     r30, 0x90(r1)
/* 0B8FC8 800BE568 3BC30000 */  addi    r30, r3, 0
/* 0B8FCC 800BE56C 4BFFFC7D */  bl      DVDConvertPathToEntrynum
/* 0B8FD0 800BE570 2C030000 */  cmpwi   r3, 0
/* 0B8FD4 800BE574 40800030 */  bge     lbl_800BE5A4
/* 0B8FD8 800BE578 38610010 */  addi    r3, r1, 0x10
/* 0B8FDC 800BE57C 38800080 */  li      r4, 0x80
/* 0B8FE0 800BE580 4800021D */  bl      DVDGetCurrentDir
/* 0B8FE4 800BE584 3C608010 */  lis     r3, D_80100420@ha
/* 0B8FE8 800BE588 4CC63182 */  crclr   6
/* 0B8FEC 800BE58C 38630420 */  addi    r3, r3, D_80100420@l
/* 0B8FF0 800BE590 389E0000 */  addi    r4, r30, 0
/* 0B8FF4 800BE594 38A10010 */  addi    r5, r1, 0x10
/* 0B8FF8 800BE598 4BFEBAD5 */  bl      OSReport
/* 0B8FFC 800BE59C 38600000 */  li      r3, 0
/* 0B9000 800BE5A0 48000060 */  b       lbl_800BE600
lbl_800BE5A4:
/* 0B9004 800BE5A4 1CA3000C */  mulli   r5, r3, 0xc
/* 0B9008 800BE5A8 806D92FC */  lwz     r3, FstStart-_SDA_BASE_(r13)
/* 0B900C 800BE5AC 7C03282E */  lwzx    r0, r3, r5
/* 0B9010 800BE5B0 5400000F */  rlwinm. r0, r0, 0, 0, 7
/* 0B9014 800BE5B4 4082000C */  bne     lbl_800BE5C0
/* 0B9018 800BE5B8 38000000 */  li      r0, 0
/* 0B901C 800BE5BC 48000008 */  b       lbl_800BE5C4
lbl_800BE5C0:
/* 0B9020 800BE5C0 38000001 */  li      r0, 1
lbl_800BE5C4:
/* 0B9024 800BE5C4 2C000000 */  cmpwi   r0, 0
/* 0B9028 800BE5C8 4182000C */  beq     lbl_800BE5D4
/* 0B902C 800BE5CC 38600000 */  li      r3, 0
/* 0B9030 800BE5D0 48000030 */  b       lbl_800BE600
lbl_800BE5D4:
/* 0B9034 800BE5D4 7C632A14 */  add     r3, r3, r5
/* 0B9038 800BE5D8 80830004 */  lwz     r4, 4(r3)
/* 0B903C 800BE5DC 38000000 */  li      r0, 0
/* 0B9040 800BE5E0 38600001 */  li      r3, 1
/* 0B9044 800BE5E4 909F0030 */  stw     r4, 0x30(r31)
/* 0B9048 800BE5E8 808D92FC */  lwz     r4, FstStart-_SDA_BASE_(r13)
/* 0B904C 800BE5EC 7C842A14 */  add     r4, r4, r5
/* 0B9050 800BE5F0 80840008 */  lwz     r4, 8(r4)
/* 0B9054 800BE5F4 909F0034 */  stw     r4, 0x34(r31)
/* 0B9058 800BE5F8 901F0038 */  stw     r0, 0x38(r31)
/* 0B905C 800BE5FC 901F000C */  stw     r0, 0xc(r31)
lbl_800BE600:
/* 0B9060 800BE600 8001009C */  lwz     r0, 0x9c(r1)
/* 0B9064 800BE604 83E10094 */  lwz     r31, 0x94(r1)
/* 0B9068 800BE608 83C10090 */  lwz     r30, 0x90(r1)
/* 0B906C 800BE60C 38210098 */  addi    r1, r1, 0x98
/* 0B9070 800BE610 7C0803A6 */  mtlr    r0
/* 0B9074 800BE614 4E800020 */  blr     

glabel DVDClose
/* 0B9078 800BE618 7C0802A6 */  mflr    r0
/* 0B907C 800BE61C 90010004 */  stw     r0, 4(r1)
/* 0B9080 800BE620 9421FFF8 */  stwu    r1, -8(r1)
/* 0B9084 800BE624 48002EE9 */  bl      DVDCancel
/* 0B9088 800BE628 38600001 */  li      r3, 1
/* 0B908C 800BE62C 8001000C */  lwz     r0, 0xc(r1)
/* 0B9090 800BE630 38210008 */  addi    r1, r1, 8
/* 0B9094 800BE634 7C0803A6 */  mtlr    r0
/* 0B9098 800BE638 4E800020 */  blr     

entryToPath:
/* 0B909C 800BE63C 7C0802A6 */  mflr    r0
/* 0B90A0 800BE640 28030000 */  cmplwi  r3, 0
/* 0B90A4 800BE644 90010004 */  stw     r0, 4(r1)
/* 0B90A8 800BE648 9421FFD0 */  stwu    r1, -0x30(r1)
/* 0B90AC 800BE64C 93E1002C */  stw     r31, 0x2c(r1)
/* 0B90B0 800BE650 93C10028 */  stw     r30, 0x28(r1)
/* 0B90B4 800BE654 3BC50000 */  addi    r30, r5, 0
/* 0B90B8 800BE658 93A10024 */  stw     r29, 0x24(r1)
/* 0B90BC 800BE65C 3BA40000 */  addi    r29, r4, 0
/* 0B90C0 800BE660 93810020 */  stw     r28, 0x20(r1)
/* 0B90C4 800BE664 4082000C */  bne     lbl_800BE670
/* 0B90C8 800BE668 38600000 */  li      r3, 0
/* 0B90CC 800BE66C 48000110 */  b       lbl_800BE77C
lbl_800BE670:
/* 0B90D0 800BE670 808D92FC */  lwz     r4, FstStart-_SDA_BASE_(r13)
/* 0B90D4 800BE674 1C63000C */  mulli   r3, r3, 0xc
/* 0B90D8 800BE678 80CD9300 */  lwz     r6, FstStringStart-_SDA_BASE_(r13)
/* 0B90DC 800BE67C 38A40004 */  addi    r5, r4, 4
/* 0B90E0 800BE680 7C04182E */  lwzx    r0, r4, r3
/* 0B90E4 800BE684 7C65182E */  lwzx    r3, r5, r3
/* 0B90E8 800BE688 5400023E */  clrlwi  r0, r0, 8
/* 0B90EC 800BE68C 28030000 */  cmplwi  r3, 0
/* 0B90F0 800BE690 7FE60214 */  add     r31, r6, r0
/* 0B90F4 800BE694 4082000C */  bne     lbl_800BE6A0
/* 0B90F8 800BE698 38600000 */  li      r3, 0
/* 0B90FC 800BE69C 48000080 */  b       lbl_800BE71C
lbl_800BE6A0:
/* 0B9100 800BE6A0 1C63000C */  mulli   r3, r3, 0xc
/* 0B9104 800BE6A4 7C04182E */  lwzx    r0, r4, r3
/* 0B9108 800BE6A8 7FA4EB78 */  mr      r4, r29
/* 0B910C 800BE6AC 7C65182E */  lwzx    r3, r5, r3
/* 0B9110 800BE6B0 38BE0000 */  addi    r5, r30, 0
/* 0B9114 800BE6B4 5400023E */  clrlwi  r0, r0, 8
/* 0B9118 800BE6B8 7F860214 */  add     r28, r6, r0
/* 0B911C 800BE6BC 4BFFFF81 */  bl      entryToPath
/* 0B9120 800BE6C0 7C03F040 */  cmplw   r3, r30
/* 0B9124 800BE6C4 40820008 */  bne     lbl_800BE6CC
/* 0B9128 800BE6C8 48000054 */  b       lbl_800BE71C
lbl_800BE6CC:
/* 0B912C 800BE6CC 38030000 */  addi    r0, r3, 0
/* 0B9130 800BE6D0 38630001 */  addi    r3, r3, 1
/* 0B9134 800BE6D4 3880002F */  li      r4, 0x2f
/* 0B9138 800BE6D8 7CC3F050 */  subf    r6, r3, r30
/* 0B913C 800BE6DC 7C9D01AE */  stbx    r4, r29, r0
/* 0B9140 800BE6E0 38860000 */  addi    r4, r6, 0
/* 0B9144 800BE6E4 7CBD1A14 */  add     r5, r29, r3
/* 0B9148 800BE6E8 48000018 */  b       lbl_800BE700
lbl_800BE6EC:
/* 0B914C 800BE6EC 881C0000 */  lbz     r0, 0(r28)
/* 0B9150 800BE6F0 3B9C0001 */  addi    r28, r28, 1
/* 0B9154 800BE6F4 3884FFFF */  addi    r4, r4, -1
/* 0B9158 800BE6F8 98050000 */  stb     r0, 0(r5)
/* 0B915C 800BE6FC 38A50001 */  addi    r5, r5, 1
lbl_800BE700:
/* 0B9160 800BE700 28040000 */  cmplwi  r4, 0
/* 0B9164 800BE704 41820010 */  beq     lbl_800BE714
/* 0B9168 800BE708 881C0000 */  lbz     r0, 0(r28)
/* 0B916C 800BE70C 7C000775 */  extsb.  r0, r0
/* 0B9170 800BE710 4082FFDC */  bne     lbl_800BE6EC
lbl_800BE714:
/* 0B9174 800BE714 7C043050 */  subf    r0, r4, r6
/* 0B9178 800BE718 7C630214 */  add     r3, r3, r0
lbl_800BE71C:
/* 0B917C 800BE71C 7C03F040 */  cmplw   r3, r30
/* 0B9180 800BE720 40820008 */  bne     lbl_800BE728
/* 0B9184 800BE724 48000058 */  b       lbl_800BE77C
lbl_800BE728:
/* 0B9188 800BE728 38030000 */  addi    r0, r3, 0
/* 0B918C 800BE72C 38630001 */  addi    r3, r3, 1
/* 0B9190 800BE730 3880002F */  li      r4, 0x2f
/* 0B9194 800BE734 7CE3F050 */  subf    r7, r3, r30
/* 0B9198 800BE738 7C9D01AE */  stbx    r4, r29, r0
/* 0B919C 800BE73C 38DF0000 */  addi    r6, r31, 0
/* 0B91A0 800BE740 38870000 */  addi    r4, r7, 0
/* 0B91A4 800BE744 7CBD1A14 */  add     r5, r29, r3
/* 0B91A8 800BE748 48000018 */  b       lbl_800BE760
lbl_800BE74C:
/* 0B91AC 800BE74C 88060000 */  lbz     r0, 0(r6)
/* 0B91B0 800BE750 38C60001 */  addi    r6, r6, 1
/* 0B91B4 800BE754 3884FFFF */  addi    r4, r4, -1
/* 0B91B8 800BE758 98050000 */  stb     r0, 0(r5)
/* 0B91BC 800BE75C 38A50001 */  addi    r5, r5, 1
lbl_800BE760:
/* 0B91C0 800BE760 28040000 */  cmplwi  r4, 0
/* 0B91C4 800BE764 41820010 */  beq     lbl_800BE774
/* 0B91C8 800BE768 88060000 */  lbz     r0, 0(r6)
/* 0B91CC 800BE76C 7C000775 */  extsb.  r0, r0
/* 0B91D0 800BE770 4082FFDC */  bne     lbl_800BE74C
lbl_800BE774:
/* 0B91D4 800BE774 7C043850 */  subf    r0, r4, r7
/* 0B91D8 800BE778 7C630214 */  add     r3, r3, r0
lbl_800BE77C:
/* 0B91DC 800BE77C 80010034 */  lwz     r0, 0x34(r1)
/* 0B91E0 800BE780 83E1002C */  lwz     r31, 0x2c(r1)
/* 0B91E4 800BE784 83C10028 */  lwz     r30, 0x28(r1)
/* 0B91E8 800BE788 83A10024 */  lwz     r29, 0x24(r1)
/* 0B91EC 800BE78C 83810020 */  lwz     r28, 0x20(r1)
/* 0B91F0 800BE790 38210030 */  addi    r1, r1, 0x30
/* 0B91F4 800BE794 7C0803A6 */  mtlr    r0
/* 0B91F8 800BE798 4E800020 */  blr     

glabel DVDGetCurrentDir
/* 0B91FC 800BE79C 7C0802A6 */  mflr    r0
/* 0B9200 800BE7A0 90010004 */  stw     r0, 4(r1)
/* 0B9204 800BE7A4 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0B9208 800BE7A8 93E1001C */  stw     r31, 0x1c(r1)
/* 0B920C 800BE7AC 93C10018 */  stw     r30, 0x18(r1)
/* 0B9210 800BE7B0 3BC40000 */  addi    r30, r4, 0
/* 0B9214 800BE7B4 38BE0000 */  addi    r5, r30, 0
/* 0B9218 800BE7B8 93A10014 */  stw     r29, 0x14(r1)
/* 0B921C 800BE7BC 3BA30000 */  addi    r29, r3, 0
/* 0B9220 800BE7C0 389D0000 */  addi    r4, r29, 0
/* 0B9224 800BE7C4 83ED9308 */  lwz     r31, currentDirectory-_SDA_BASE_(r13)
/* 0B9228 800BE7C8 387F0000 */  addi    r3, r31, 0
/* 0B922C 800BE7CC 4BFFFE71 */  bl      entryToPath
/* 0B9230 800BE7D0 7C03F040 */  cmplw   r3, r30
/* 0B9234 800BE7D4 40820014 */  bne     lbl_800BE7E8
/* 0B9238 800BE7D8 38000000 */  li      r0, 0
/* 0B923C 800BE7DC 7C7DF214 */  add     r3, r29, r30
/* 0B9240 800BE7E0 9803FFFF */  stb     r0, -1(r3)
/* 0B9244 800BE7E4 4800005C */  b       lbl_800BE840
lbl_800BE7E8:
/* 0B9248 800BE7E8 1C1F000C */  mulli   r0, r31, 0xc
/* 0B924C 800BE7EC 808D92FC */  lwz     r4, FstStart-_SDA_BASE_(r13)
/* 0B9250 800BE7F0 7C04002E */  lwzx    r0, r4, r0
/* 0B9254 800BE7F4 5400000F */  rlwinm. r0, r0, 0, 0, 7
/* 0B9258 800BE7F8 4082000C */  bne     lbl_800BE804
/* 0B925C 800BE7FC 38000000 */  li      r0, 0
/* 0B9260 800BE800 48000008 */  b       lbl_800BE808
lbl_800BE804:
/* 0B9264 800BE804 38000001 */  li      r0, 1
lbl_800BE808:
/* 0B9268 800BE808 2C000000 */  cmpwi   r0, 0
/* 0B926C 800BE80C 41820028 */  beq     lbl_800BE834
/* 0B9270 800BE810 381EFFFF */  addi    r0, r30, -1
/* 0B9274 800BE814 7C030040 */  cmplw   r3, r0
/* 0B9278 800BE818 40820010 */  bne     lbl_800BE828
/* 0B927C 800BE81C 38000000 */  li      r0, 0
/* 0B9280 800BE820 7C1D19AE */  stbx    r0, r29, r3
/* 0B9284 800BE824 4800001C */  b       lbl_800BE840
lbl_800BE828:
/* 0B9288 800BE828 3800002F */  li      r0, 0x2f
/* 0B928C 800BE82C 7C1D19AE */  stbx    r0, r29, r3
/* 0B9290 800BE830 38630001 */  addi    r3, r3, 1
lbl_800BE834:
/* 0B9294 800BE834 38000000 */  li      r0, 0
/* 0B9298 800BE838 7C1D19AE */  stbx    r0, r29, r3
/* 0B929C 800BE83C 38000001 */  li      r0, 1
lbl_800BE840:
/* 0B92A0 800BE840 7C030378 */  mr      r3, r0
/* 0B92A4 800BE844 80010024 */  lwz     r0, 0x24(r1)
/* 0B92A8 800BE848 83E1001C */  lwz     r31, 0x1c(r1)
/* 0B92AC 800BE84C 83C10018 */  lwz     r30, 0x18(r1)
/* 0B92B0 800BE850 83A10014 */  lwz     r29, 0x14(r1)
/* 0B92B4 800BE854 38210020 */  addi    r1, r1, 0x20
/* 0B92B8 800BE858 7C0803A6 */  mtlr    r0
/* 0B92BC 800BE85C 4E800020 */  blr     

glabel DVDReadAsyncPrio
/* 0B92C0 800BE860 7C0802A6 */  mflr    r0
/* 0B92C4 800BE864 90010004 */  stw     r0, 4(r1)
/* 0B92C8 800BE868 9421FFC8 */  stwu    r1, -0x38(r1)
/* 0B92CC 800BE86C BF410020 */  stmw    r26, 0x20(r1)
/* 0B92D0 800BE870 7CDD3379 */  or.     r29, r6, r6
/* 0B92D4 800BE874 3B430000 */  addi    r26, r3, 0
/* 0B92D8 800BE878 3B640000 */  addi    r27, r4, 0
/* 0B92DC 800BE87C 3B850000 */  addi    r28, r5, 0
/* 0B92E0 800BE880 3BC70000 */  addi    r30, r7, 0
/* 0B92E4 800BE884 3BE80000 */  addi    r31, r8, 0
/* 0B92E8 800BE888 41800010 */  blt     lbl_800BE898
/* 0B92EC 800BE88C 801A0034 */  lwz     r0, 0x34(r26)
/* 0B92F0 800BE890 7C1D0040 */  cmplw   r29, r0
/* 0B92F4 800BE894 4180001C */  blt     lbl_800BE8B0
lbl_800BE898:
/* 0B92F8 800BE898 3C608010 */  lis     r3, D_80100458@ha
/* 0B92FC 800BE89C 4CC63182 */  crclr   6
/* 0B9300 800BE8A0 38A30458 */  addi    r5, r3, D_80100458@l
/* 0B9304 800BE8A4 386D8DD0 */  addi    r3, r13, D_801457B0-_SDA_BASE_
/* 0B9308 800BE8A8 388002EA */  li      r4, 0x2ea
/* 0B930C 800BE8AC 4BFEB841 */  bl      OSPanic
lbl_800BE8B0:
/* 0B9310 800BE8B0 7C9DE215 */  add.    r4, r29, r28
/* 0B9314 800BE8B4 41800014 */  blt     lbl_800BE8C8
/* 0B9318 800BE8B8 807A0034 */  lwz     r3, 0x34(r26)
/* 0B931C 800BE8BC 38030020 */  addi    r0, r3, 0x20
/* 0B9320 800BE8C0 7C040040 */  cmplw   r4, r0
/* 0B9324 800BE8C4 4180001C */  blt     lbl_800BE8E0
lbl_800BE8C8:
/* 0B9328 800BE8C8 3C608010 */  lis     r3, D_80100458@ha
/* 0B932C 800BE8CC 4CC63182 */  crclr   6
/* 0B9330 800BE8D0 38A30458 */  addi    r5, r3, D_80100458@l
/* 0B9334 800BE8D4 386D8DD0 */  addi    r3, r13, D_801457B0-_SDA_BASE_
/* 0B9338 800BE8D8 388002F0 */  li      r4, 0x2f0
/* 0B933C 800BE8DC 4BFEB811 */  bl      OSPanic
lbl_800BE8E0:
/* 0B9340 800BE8E0 93DA0038 */  stw     r30, 0x38(r26)
/* 0B9344 800BE8E4 3C60800C */  lis     r3, cbForReadAsync@ha
/* 0B9348 800BE8E8 38E3E920 */  addi    r7, r3, cbForReadAsync@l
/* 0B934C 800BE8EC 801A0030 */  lwz     r0, 0x30(r26)
/* 0B9350 800BE8F0 387A0000 */  addi    r3, r26, 0
/* 0B9354 800BE8F4 389B0000 */  addi    r4, r27, 0
/* 0B9358 800BE8F8 38BC0000 */  addi    r5, r28, 0
/* 0B935C 800BE8FC 391F0000 */  addi    r8, r31, 0
/* 0B9360 800BE900 7CC0EA14 */  add     r6, r0, r29
/* 0B9364 800BE904 48002015 */  bl      DVDReadAbsAsyncPrio
/* 0B9368 800BE908 BB410020 */  lmw     r26, 0x20(r1)
/* 0B936C 800BE90C 38600001 */  li      r3, 1
/* 0B9370 800BE910 8001003C */  lwz     r0, 0x3c(r1)
/* 0B9374 800BE914 38210038 */  addi    r1, r1, 0x38
/* 0B9378 800BE918 7C0803A6 */  mtlr    r0
/* 0B937C 800BE91C 4E800020 */  blr     

cbForReadAsync:
/* 0B9380 800BE920 7C0802A6 */  mflr    r0
/* 0B9384 800BE924 90010004 */  stw     r0, 4(r1)
/* 0B9388 800BE928 9421FFF8 */  stwu    r1, -8(r1)
/* 0B938C 800BE92C 81840038 */  lwz     r12, 0x38(r4)
/* 0B9390 800BE930 280C0000 */  cmplwi  r12, 0
/* 0B9394 800BE934 4182000C */  beq     lbl_800BE940
/* 0B9398 800BE938 7D8803A6 */  mtlr    r12
/* 0B939C 800BE93C 4E800021 */  blrl    
lbl_800BE940:
/* 0B93A0 800BE940 8001000C */  lwz     r0, 0xc(r1)
/* 0B93A4 800BE944 38210008 */  addi    r1, r1, 8
/* 0B93A8 800BE948 7C0803A6 */  mtlr    r0
/* 0B93AC 800BE94C 4E800020 */  blr     

glabel DVDReadPrio
/* 0B93B0 800BE950 7C0802A6 */  mflr    r0
/* 0B93B4 800BE954 90010004 */  stw     r0, 4(r1)
/* 0B93B8 800BE958 9421FFC8 */  stwu    r1, -0x38(r1)
/* 0B93BC 800BE95C BF610024 */  stmw    r27, 0x24(r1)
/* 0B93C0 800BE960 7CDD3379 */  or.     r29, r6, r6
/* 0B93C4 800BE964 3BE30000 */  addi    r31, r3, 0
/* 0B93C8 800BE968 3B640000 */  addi    r27, r4, 0
/* 0B93CC 800BE96C 3B850000 */  addi    r28, r5, 0
/* 0B93D0 800BE970 3BC70000 */  addi    r30, r7, 0
/* 0B93D4 800BE974 41800010 */  blt     lbl_800BE984
/* 0B93D8 800BE978 801F0034 */  lwz     r0, 0x34(r31)
/* 0B93DC 800BE97C 7C1D0040 */  cmplw   r29, r0
/* 0B93E0 800BE980 4180001C */  blt     lbl_800BE99C
lbl_800BE984:
/* 0B93E4 800BE984 3C608010 */  lis     r3, D_8010048C@ha
/* 0B93E8 800BE988 4CC63182 */  crclr   6
/* 0B93EC 800BE98C 38A3048C */  addi    r5, r3, D_8010048C@l
/* 0B93F0 800BE990 386D8DD0 */  addi    r3, r13, D_801457B0-_SDA_BASE_
/* 0B93F4 800BE994 38800330 */  li      r4, 0x330
/* 0B93F8 800BE998 4BFEB755 */  bl      OSPanic
lbl_800BE99C:
/* 0B93FC 800BE99C 7C9DE215 */  add.    r4, r29, r28
/* 0B9400 800BE9A0 41800014 */  blt     lbl_800BE9B4
/* 0B9404 800BE9A4 807F0034 */  lwz     r3, 0x34(r31)
/* 0B9408 800BE9A8 38030020 */  addi    r0, r3, 0x20
/* 0B940C 800BE9AC 7C040040 */  cmplw   r4, r0
/* 0B9410 800BE9B0 4180001C */  blt     lbl_800BE9CC
lbl_800BE9B4:
/* 0B9414 800BE9B4 3C608010 */  lis     r3, D_8010048C@ha
/* 0B9418 800BE9B8 4CC63182 */  crclr   6
/* 0B941C 800BE9BC 38A3048C */  addi    r5, r3, D_8010048C@l
/* 0B9420 800BE9C0 386D8DD0 */  addi    r3, r13, D_801457B0-_SDA_BASE_
/* 0B9424 800BE9C4 38800336 */  li      r4, 0x336
/* 0B9428 800BE9C8 4BFEB725 */  bl      OSPanic
lbl_800BE9CC:
/* 0B942C 800BE9CC 801F0030 */  lwz     r0, 0x30(r31)
/* 0B9430 800BE9D0 3C80800C */  lis     r4, cbForReadSync@ha
/* 0B9434 800BE9D4 38E4EA68 */  addi    r7, r4, cbForReadSync@l
/* 0B9438 800BE9D8 387F0000 */  addi    r3, r31, 0
/* 0B943C 800BE9DC 389B0000 */  addi    r4, r27, 0
/* 0B9440 800BE9E0 38BC0000 */  addi    r5, r28, 0
/* 0B9444 800BE9E4 391E0000 */  addi    r8, r30, 0
/* 0B9448 800BE9E8 7CC0EA14 */  add     r6, r0, r29
/* 0B944C 800BE9EC 48001F2D */  bl      DVDReadAbsAsyncPrio
/* 0B9450 800BE9F0 2C030000 */  cmpwi   r3, 0
/* 0B9454 800BE9F4 4082000C */  bne     lbl_800BEA00
/* 0B9458 800BE9F8 3860FFFF */  li      r3, -1
/* 0B945C 800BE9FC 48000058 */  b       lbl_800BEA54
lbl_800BEA00:
/* 0B9460 800BEA00 4BFEBD71 */  bl      OSDisableInterrupts
/* 0B9464 800BEA04 7C7E1B78 */  mr      r30, r3
lbl_800BEA08:
/* 0B9468 800BEA08 801F000C */  lwz     r0, 0xc(r31)
/* 0B946C 800BEA0C 2C000000 */  cmpwi   r0, 0
/* 0B9470 800BEA10 4082000C */  bne     lbl_800BEA1C
/* 0B9474 800BEA14 83FF0020 */  lwz     r31, 0x20(r31)
/* 0B9478 800BEA18 48000030 */  b       lbl_800BEA48
lbl_800BEA1C:
/* 0B947C 800BEA1C 2C00FFFF */  cmpwi   r0, -1
/* 0B9480 800BEA20 4082000C */  bne     lbl_800BEA2C
/* 0B9484 800BEA24 3BE0FFFF */  li      r31, -1
/* 0B9488 800BEA28 48000020 */  b       lbl_800BEA48
lbl_800BEA2C:
/* 0B948C 800BEA2C 2C00000A */  cmpwi   r0, 0xa
/* 0B9490 800BEA30 4082000C */  bne     lbl_800BEA3C
/* 0B9494 800BEA34 3BE0FFFD */  li      r31, -3
/* 0B9498 800BEA38 48000010 */  b       lbl_800BEA48
lbl_800BEA3C:
/* 0B949C 800BEA3C 386D9310 */  addi    r3, r13, __DVDThreadQueue-_SDA_BASE_
/* 0B94A0 800BEA40 4BFEF041 */  bl      OSSleepThread
/* 0B94A4 800BEA44 4BFFFFC4 */  b       lbl_800BEA08
lbl_800BEA48:
/* 0B94A8 800BEA48 7FC3F378 */  mr      r3, r30
/* 0B94AC 800BEA4C 4BFEBD4D */  bl      OSRestoreInterrupts
/* 0B94B0 800BEA50 7FE3FB78 */  mr      r3, r31
lbl_800BEA54:
/* 0B94B4 800BEA54 BB610024 */  lmw     r27, 0x24(r1)
/* 0B94B8 800BEA58 8001003C */  lwz     r0, 0x3c(r1)
/* 0B94BC 800BEA5C 38210038 */  addi    r1, r1, 0x38
/* 0B94C0 800BEA60 7C0803A6 */  mtlr    r0
/* 0B94C4 800BEA64 4E800020 */  blr     

cbForReadSync:
/* 0B94C8 800BEA68 7C0802A6 */  mflr    r0
/* 0B94CC 800BEA6C 386D9310 */  addi    r3, r13, __DVDThreadQueue-_SDA_BASE_
/* 0B94D0 800BEA70 90010004 */  stw     r0, 4(r1)
/* 0B94D4 800BEA74 9421FFF8 */  stwu    r1, -8(r1)
/* 0B94D8 800BEA78 4BFEF0F5 */  bl      OSWakeupThread
/* 0B94DC 800BEA7C 8001000C */  lwz     r0, 0xc(r1)
/* 0B94E0 800BEA80 38210008 */  addi    r1, r1, 8
/* 0B94E4 800BEA84 7C0803A6 */  mtlr    r0
/* 0B94E8 800BEA88 4E800020 */  blr     

glabel DVDSeekAsyncPrio
/* 0B94EC 800BEA8C 7C0802A6 */  mflr    r0
/* 0B94F0 800BEA90 90010004 */  stw     r0, 4(r1)
/* 0B94F4 800BEA94 9421FFD8 */  stwu    r1, -0x28(r1)
/* 0B94F8 800BEA98 93E10024 */  stw     r31, 0x24(r1)
/* 0B94FC 800BEA9C 3BE60000 */  addi    r31, r6, 0
/* 0B9500 800BEAA0 93C10020 */  stw     r30, 0x20(r1)
/* 0B9504 800BEAA4 3BC50000 */  addi    r30, r5, 0
/* 0B9508 800BEAA8 93A1001C */  stw     r29, 0x1c(r1)
/* 0B950C 800BEAAC 7C9D2379 */  or.     r29, r4, r4
/* 0B9510 800BEAB0 93810018 */  stw     r28, 0x18(r1)
/* 0B9514 800BEAB4 3B830000 */  addi    r28, r3, 0
/* 0B9518 800BEAB8 41800010 */  blt     lbl_800BEAC8
/* 0B951C 800BEABC 801C0034 */  lwz     r0, 0x34(r28)
/* 0B9520 800BEAC0 7C1D0040 */  cmplw   r29, r0
/* 0B9524 800BEAC4 4180001C */  blt     lbl_800BEAE0
lbl_800BEAC8:
/* 0B9528 800BEAC8 3C608010 */  lis     r3, D_801004BC@ha
/* 0B952C 800BEACC 4CC63182 */  crclr   6
/* 0B9530 800BEAD0 38A304BC */  addi    r5, r3, D_801004BC@l
/* 0B9534 800BEAD4 386D8DD0 */  addi    r3, r13, D_801457B0-_SDA_BASE_
/* 0B9538 800BEAD8 38800387 */  li      r4, 0x387
/* 0B953C 800BEADC 4BFEB611 */  bl      OSPanic
lbl_800BEAE0:
/* 0B9540 800BEAE0 93DC0038 */  stw     r30, 0x38(r28)
/* 0B9544 800BEAE4 3C60800C */  lis     r3, cbForSeekAsync@ha
/* 0B9548 800BEAE8 38A3EB24 */  addi    r5, r3, cbForSeekAsync@l
/* 0B954C 800BEAEC 801C0030 */  lwz     r0, 0x30(r28)
/* 0B9550 800BEAF0 387C0000 */  addi    r3, r28, 0
/* 0B9554 800BEAF4 38DF0000 */  addi    r6, r31, 0
/* 0B9558 800BEAF8 7C80EA14 */  add     r4, r0, r29
/* 0B955C 800BEAFC 48001EF9 */  bl      DVDSeekAbsAsyncPrio
/* 0B9560 800BEB00 8001002C */  lwz     r0, 0x2c(r1)
/* 0B9564 800BEB04 38600001 */  li      r3, 1
/* 0B9568 800BEB08 83E10024 */  lwz     r31, 0x24(r1)
/* 0B956C 800BEB0C 83C10020 */  lwz     r30, 0x20(r1)
/* 0B9570 800BEB10 83A1001C */  lwz     r29, 0x1c(r1)
/* 0B9574 800BEB14 83810018 */  lwz     r28, 0x18(r1)
/* 0B9578 800BEB18 38210028 */  addi    r1, r1, 0x28
/* 0B957C 800BEB1C 7C0803A6 */  mtlr    r0
/* 0B9580 800BEB20 4E800020 */  blr     

cbForSeekAsync:
/* 0B9584 800BEB24 7C0802A6 */  mflr    r0
/* 0B9588 800BEB28 90010004 */  stw     r0, 4(r1)
/* 0B958C 800BEB2C 9421FFF8 */  stwu    r1, -8(r1)
/* 0B9590 800BEB30 81840038 */  lwz     r12, 0x38(r4)
/* 0B9594 800BEB34 280C0000 */  cmplwi  r12, 0
/* 0B9598 800BEB38 4182000C */  beq     lbl_800BEB44
/* 0B959C 800BEB3C 7D8803A6 */  mtlr    r12
/* 0B95A0 800BEB40 4E800021 */  blrl    
lbl_800BEB44:
/* 0B95A4 800BEB44 8001000C */  lwz     r0, 0xc(r1)
/* 0B95A8 800BEB48 38210008 */  addi    r1, r1, 8
/* 0B95AC 800BEB4C 7C0803A6 */  mtlr    r0
/* 0B95B0 800BEB50 4E800020 */  blr     

glabel DVDPrepareStreamAsync
/* 0B95B4 800BEB54 7C0802A6 */  mflr    r0
/* 0B95B8 800BEB58 90010004 */  stw     r0, 4(r1)
/* 0B95BC 800BEB5C 9421FFC8 */  stwu    r1, -0x38(r1)
/* 0B95C0 800BEB60 BF610024 */  stmw    r27, 0x24(r1)
/* 0B95C4 800BEB64 3BA50000 */  addi    r29, r5, 0
/* 0B95C8 800BEB68 7C7B1B78 */  mr      r27, r3
/* 0B95CC 800BEB6C 3B840000 */  addi    r28, r4, 0
/* 0B95D0 800BEB70 3BC60000 */  addi    r30, r6, 0
/* 0B95D4 800BEB74 80E30030 */  lwz     r7, 0x30(r3)
/* 0B95D8 800BEB78 3C608010 */  lis     r3, D_80100358@ha
/* 0B95DC 800BEB7C 3BE30358 */  addi    r31, r3, D_80100358@l
/* 0B95E0 800BEB80 7C07EA14 */  add     r0, r7, r29
/* 0B95E4 800BEB84 5400047F */  clrlwi. r0, r0, 0x11
/* 0B95E8 800BEB88 41820020 */  beq     lbl_800BEBA8
/* 0B95EC 800BEB8C 38C70000 */  addi    r6, r7, 0
/* 0B95F0 800BEB90 4CC63182 */  crclr   6
/* 0B95F4 800BEB94 38FD0000 */  addi    r7, r29, 0
/* 0B95F8 800BEB98 38BF01C8 */  addi    r5, r31, 0x1c8
/* 0B95FC 800BEB9C 386D8DD0 */  addi    r3, r13, D_801457B0-_SDA_BASE_
/* 0B9600 800BEBA0 388004A9 */  li      r4, 0x4a9
/* 0B9604 800BEBA4 4BFEB549 */  bl      OSPanic
lbl_800BEBA8:
/* 0B9608 800BEBA8 281C0000 */  cmplwi  r28, 0
/* 0B960C 800BEBAC 4082000C */  bne     lbl_800BEBB8
/* 0B9610 800BEBB0 801B0034 */  lwz     r0, 0x34(r27)
/* 0B9614 800BEBB4 7F9D0050 */  subf    r28, r29, r0
lbl_800BEBB8:
/* 0B9618 800BEBB8 5780047F */  clrlwi. r0, r28, 0x11
/* 0B961C 800BEBBC 4182001C */  beq     lbl_800BEBD8
/* 0B9620 800BEBC0 38DC0000 */  addi    r6, r28, 0
/* 0B9624 800BEBC4 4CC63182 */  crclr   6
/* 0B9628 800BEBC8 38BF0230 */  addi    r5, r31, 0x230
/* 0B962C 800BEBCC 386D8DD0 */  addi    r3, r13, D_801457B0-_SDA_BASE_
/* 0B9630 800BEBD0 388004B3 */  li      r4, 0x4b3
/* 0B9634 800BEBD4 4BFEB519 */  bl      OSPanic
lbl_800BEBD8:
/* 0B9638 800BEBD8 807B0034 */  lwz     r3, 0x34(r27)
/* 0B963C 800BEBDC 7C1D1840 */  cmplw   r29, r3
/* 0B9640 800BEBE0 40800010 */  bge     lbl_800BEBF0
/* 0B9644 800BEBE4 7C1DE214 */  add     r0, r29, r28
/* 0B9648 800BEBE8 7C001840 */  cmplw   r0, r3
/* 0B964C 800BEBEC 40810020 */  ble     lbl_800BEC0C
lbl_800BEBF0:
/* 0B9650 800BEBF0 38DD0000 */  addi    r6, r29, 0
/* 0B9654 800BEBF4 4CC63182 */  crclr   6
/* 0B9658 800BEBF8 38FC0000 */  addi    r7, r28, 0
/* 0B965C 800BEBFC 38BF0288 */  addi    r5, r31, 0x288
/* 0B9660 800BEC00 386D8DD0 */  addi    r3, r13, D_801457B0-_SDA_BASE_
/* 0B9664 800BEC04 388004BB */  li      r4, 0x4bb
/* 0B9668 800BEC08 4BFEB4E5 */  bl      OSPanic
lbl_800BEC0C:
/* 0B966C 800BEC0C 93DB0038 */  stw     r30, 0x38(r27)
/* 0B9670 800BEC10 3C60800C */  lis     r3, cbForPrepareStreamAsync@ha
/* 0B9674 800BEC14 38C3EC40 */  addi    r6, r3, cbForPrepareStreamAsync@l
/* 0B9678 800BEC18 801B0030 */  lwz     r0, 0x30(r27)
/* 0B967C 800BEC1C 387B0000 */  addi    r3, r27, 0
/* 0B9680 800BEC20 389C0000 */  addi    r4, r28, 0
/* 0B9684 800BEC24 7CA0EA14 */  add     r5, r0, r29
/* 0B9688 800BEC28 4800203D */  bl      DVDPrepareStreamAbsAsync
/* 0B968C 800BEC2C BB610024 */  lmw     r27, 0x24(r1)
/* 0B9690 800BEC30 8001003C */  lwz     r0, 0x3c(r1)
/* 0B9694 800BEC34 38210038 */  addi    r1, r1, 0x38
/* 0B9698 800BEC38 7C0803A6 */  mtlr    r0
/* 0B969C 800BEC3C 4E800020 */  blr     

cbForPrepareStreamAsync:
/* 0B96A0 800BEC40 7C0802A6 */  mflr    r0
/* 0B96A4 800BEC44 90010004 */  stw     r0, 4(r1)
/* 0B96A8 800BEC48 9421FFF8 */  stwu    r1, -8(r1)
/* 0B96AC 800BEC4C 81840038 */  lwz     r12, 0x38(r4)
/* 0B96B0 800BEC50 280C0000 */  cmplwi  r12, 0
/* 0B96B4 800BEC54 4182000C */  beq     lbl_800BEC60
/* 0B96B8 800BEC58 7D8803A6 */  mtlr    r12
/* 0B96BC 800BEC5C 4E800021 */  blrl    
lbl_800BEC60:
/* 0B96C0 800BEC60 8001000C */  lwz     r0, 0xc(r1)
/* 0B96C4 800BEC64 38210008 */  addi    r1, r1, 8
/* 0B96C8 800BEC68 7C0803A6 */  mtlr    r0
/* 0B96CC 800BEC6C 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000FD3D8 80100358 00C8 */
D_80100358:
    .asciz "DVDConvertEntrynumToPath(possibly DVDOpen or DVDChangeDir or DVDOpenDir): specified directory or file (%s) doesn't match standard 8.3 format. This is a temporary restriction and will be removed soon\n"

.balign 4

/* 000FD4A0 80100420 0037 */
D_80100420:
    .asciz "Warning: DVDOpen(): file '%s' was not found under %s.\n"

.balign 4

/* 000FD4D8 80100458 0034 */
D_80100458:
    .asciz "DVDReadAsync(): specified area is out of the file  "

.balign 4

/* 000FD50C 8010048C 002F */
D_8010048C:
    .asciz "DVDRead(): specified area is out of the file  "

.balign 4

/* 000FD53C 801004BC 0027 */
D_801004BC:
    .asciz "DVDSeek(): offset is out of the file  "

.balign 4

/* 000FD564 801004E4 003A */
D_801004E4:
    .asciz "Warning: DVDOpenDir(): file '%s' was not found under %s.\n"

.balign 4

/* 000FD5A0 80100520 0066 */
D_80100520:
    .asciz "DVDPrepareStreamAsync(): Specified start address (filestart(0x%x) + offset(0x%x)) is not 32KB aligned"

.balign 4

/* 000FD608 80100588 0055 */
D_80100588:
    .asciz "DVDPrepareStreamAsync(): Specified length (0x%x) is not a multiple of 32768(32*1024)"

.balign 4

/* 000FD660 801005E0 005C */
D_801005E0:
    .asciz "DVDPrepareStreamAsync(): The area specified (offset(0x%x), length(0x%x)) is out of the file"

.balign 4

/* 000FD6BC 8010063C 0061 */
D_8010063C:
    .asciz "DVDPrepareStream(): Specified start address (filestart(0x%x) + offset(0x%x)) is not 32KB aligned"

.balign 4

/* 000FD720 801006A0 0050 */
D_801006A0:
    .asciz "DVDPrepareStream(): Specified length (0x%x) is not a multiple of 32768(32*1024)"

.balign 4

/* 000FD770 801006F0 0057 */
D_801006F0:
    .asciz "DVDPrepareStream(): The area specified (offset(0x%x), length(0x%x)) is out of the file"


.section .sdata, "wa"

.balign 8

/* 00100010 801457B0 0008 */
D_801457B0:
    .asciz "dvdfs.c"


.section .sbss, "wa"

.balign 8

/* 00100538 80145CD8 0004 */
BootInfo:
    .skip 4

.balign 4

/* 0010053C 80145CDC 0004 */
FstStart:
    .skip 4

.balign 4

/* 00100540 80145CE0 0004 */
FstStringStart:
    .skip 4

.balign 4

/* 00100544 80145CE4 0004 */
MaxEntryNum:
    .skip 4

.balign 4

/* 00100548 80145CE8 0004 */
currentDirectory:
    .skip 4

.balign 4

/* 0010054C 80145CEC 0004 */
glabel __DVDLongFileNameFlag
    .skip 4

.balign 8

/* 00100550 80145CF0 0008 */
glabel __DVDThreadQueue
    .skip 8


