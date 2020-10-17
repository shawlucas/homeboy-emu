# nubevent.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel TRKInitializeEventQueue
/* 0CFD94 800D5334 7C0802A6 */  mflr    r0
/* 0CFD98 800D5338 3C608014 */  lis     r3, gTRKEventQueue@ha
/* 0CFD9C 800D533C 90010004 */  stw     r0, 4(r1)
/* 0CFDA0 800D5340 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0CFDA4 800D5344 93E1000C */  stw     r31, 0xc(r1)
/* 0CFDA8 800D5348 3BE32850 */  addi    r31, r3, gTRKEventQueue@l
/* 0CFDAC 800D534C 387F0000 */  addi    r3, r31, 0
/* 0CFDB0 800D5350 48002591 */  bl      TRKInitializeMutex
/* 0CFDB4 800D5354 7FE3FB78 */  mr      r3, r31
/* 0CFDB8 800D5358 48002591 */  bl      TRKAcquireMutex
/* 0CFDBC 800D535C 38600000 */  li      r3, 0
/* 0CFDC0 800D5360 907F0004 */  stw     r3, 4(r31)
/* 0CFDC4 800D5364 38000100 */  li      r0, 0x100
/* 0CFDC8 800D5368 907F0008 */  stw     r3, 8(r31)
/* 0CFDCC 800D536C 7FE3FB78 */  mr      r3, r31
/* 0CFDD0 800D5370 901F0024 */  stw     r0, 0x24(r31)
/* 0CFDD4 800D5374 4800257D */  bl      TRKReleaseMutex
/* 0CFDD8 800D5378 38600000 */  li      r3, 0
/* 0CFDDC 800D537C 83E1000C */  lwz     r31, 0xc(r1)
/* 0CFDE0 800D5380 38210010 */  addi    r1, r1, 0x10
/* 0CFDE4 800D5384 80010004 */  lwz     r0, 4(r1)
/* 0CFDE8 800D5388 7C0803A6 */  mtlr    r0
/* 0CFDEC 800D538C 4E800020 */  blr     

glabel TRKCopyEvent
/* 0CFDF0 800D5390 7C0802A6 */  mflr    r0
/* 0CFDF4 800D5394 38A0000C */  li      r5, 0xc
/* 0CFDF8 800D5398 90010004 */  stw     r0, 4(r1)
/* 0CFDFC 800D539C 9421FFF8 */  stwu    r1, -8(r1)
/* 0CFE00 800D53A0 4BF2E0B9 */  bl      TRK_memcpy
/* 0CFE04 800D53A4 38210008 */  addi    r1, r1, 8
/* 0CFE08 800D53A8 80010004 */  lwz     r0, 4(r1)
/* 0CFE0C 800D53AC 7C0803A6 */  mtlr    r0
/* 0CFE10 800D53B0 4E800020 */  blr     

glabel TRKGetNextEvent
/* 0CFE14 800D53B4 7C0802A6 */  mflr    r0
/* 0CFE18 800D53B8 3C808014 */  lis     r4, gTRKEventQueue@ha
/* 0CFE1C 800D53BC 90010004 */  stw     r0, 4(r1)
/* 0CFE20 800D53C0 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0CFE24 800D53C4 93E10014 */  stw     r31, 0x14(r1)
/* 0CFE28 800D53C8 3BE42850 */  addi    r31, r4, gTRKEventQueue@l
/* 0CFE2C 800D53CC 93C10010 */  stw     r30, 0x10(r1)
/* 0CFE30 800D53D0 93A1000C */  stw     r29, 0xc(r1)
/* 0CFE34 800D53D4 3BA00000 */  li      r29, 0
/* 0CFE38 800D53D8 93810008 */  stw     r28, 8(r1)
/* 0CFE3C 800D53DC 3B830000 */  addi    r28, r3, 0
/* 0CFE40 800D53E0 387F0000 */  addi    r3, r31, 0
/* 0CFE44 800D53E4 48002505 */  bl      TRKAcquireMutex
/* 0CFE48 800D53E8 3BDF0004 */  addi    r30, r31, 4
/* 0CFE4C 800D53EC 801F0004 */  lwz     r0, 4(r31)
/* 0CFE50 800D53F0 2C000000 */  cmpwi   r0, 0
/* 0CFE54 800D53F4 40810050 */  ble     lbl_800D5444
/* 0CFE58 800D53F8 3BBF0008 */  addi    r29, r31, 8
/* 0CFE5C 800D53FC 801F0008 */  lwz     r0, 8(r31)
/* 0CFE60 800D5400 387C0000 */  addi    r3, r28, 0
/* 0CFE64 800D5404 1C00000C */  mulli   r0, r0, 0xc
/* 0CFE68 800D5408 7C9F0214 */  add     r4, r31, r0
/* 0CFE6C 800D540C 3884000C */  addi    r4, r4, 0xc
/* 0CFE70 800D5410 4BFFFF81 */  bl      TRKCopyEvent
/* 0CFE74 800D5414 807E0000 */  lwz     r3, 0(r30)
/* 0CFE78 800D5418 3803FFFF */  addi    r0, r3, -1
/* 0CFE7C 800D541C 901E0000 */  stw     r0, 0(r30)
/* 0CFE80 800D5420 807D0000 */  lwz     r3, 0(r29)
/* 0CFE84 800D5424 38030001 */  addi    r0, r3, 1
/* 0CFE88 800D5428 901D0000 */  stw     r0, 0(r29)
/* 0CFE8C 800D542C 801D0000 */  lwz     r0, 0(r29)
/* 0CFE90 800D5430 2C000002 */  cmpwi   r0, 2
/* 0CFE94 800D5434 4082000C */  bne     lbl_800D5440
/* 0CFE98 800D5438 38000000 */  li      r0, 0
/* 0CFE9C 800D543C 901D0000 */  stw     r0, 0(r29)
lbl_800D5440:
/* 0CFEA0 800D5440 3BA00001 */  li      r29, 1
lbl_800D5444:
/* 0CFEA4 800D5444 3C608014 */  lis     r3, gTRKEventQueue@ha
/* 0CFEA8 800D5448 38632850 */  addi    r3, r3, gTRKEventQueue@l
/* 0CFEAC 800D544C 480024A5 */  bl      TRKReleaseMutex
/* 0CFEB0 800D5450 7FA3EB78 */  mr      r3, r29
/* 0CFEB4 800D5454 83E10014 */  lwz     r31, 0x14(r1)
/* 0CFEB8 800D5458 83C10010 */  lwz     r30, 0x10(r1)
/* 0CFEBC 800D545C 83A1000C */  lwz     r29, 0xc(r1)
/* 0CFEC0 800D5460 83810008 */  lwz     r28, 8(r1)
/* 0CFEC4 800D5464 38210018 */  addi    r1, r1, 0x18
/* 0CFEC8 800D5468 80010004 */  lwz     r0, 4(r1)
/* 0CFECC 800D546C 7C0803A6 */  mtlr    r0
/* 0CFED0 800D5470 4E800020 */  blr     

glabel TRKPostEvent
/* 0CFED4 800D5474 7C0802A6 */  mflr    r0
/* 0CFED8 800D5478 3C808014 */  lis     r4, gTRKEventQueue@ha
/* 0CFEDC 800D547C 90010004 */  stw     r0, 4(r1)
/* 0CFEE0 800D5480 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0CFEE4 800D5484 93E10014 */  stw     r31, 0x14(r1)
/* 0CFEE8 800D5488 3BE30000 */  addi    r31, r3, 0
/* 0CFEEC 800D548C 93C10010 */  stw     r30, 0x10(r1)
/* 0CFEF0 800D5490 3BC42850 */  addi    r30, r4, gTRKEventQueue@l
/* 0CFEF4 800D5494 387E0000 */  addi    r3, r30, 0
/* 0CFEF8 800D5498 93A1000C */  stw     r29, 0xc(r1)
/* 0CFEFC 800D549C 93810008 */  stw     r28, 8(r1)
/* 0CFF00 800D54A0 3B800000 */  li      r28, 0
/* 0CFF04 800D54A4 48002445 */  bl      TRKAcquireMutex
/* 0CFF08 800D54A8 3BBE0004 */  addi    r29, r30, 4
/* 0CFF0C 800D54AC 807E0004 */  lwz     r3, 4(r30)
/* 0CFF10 800D54B0 2C030002 */  cmpwi   r3, 2
/* 0CFF14 800D54B4 4082000C */  bne     lbl_800D54C0
/* 0CFF18 800D54B8 3B800100 */  li      r28, 0x100
/* 0CFF1C 800D54BC 48000068 */  b       lbl_800D5524
lbl_800D54C0:
/* 0CFF20 800D54C0 801E0008 */  lwz     r0, 8(r30)
/* 0CFF24 800D54C4 389F0000 */  addi    r4, r31, 0
/* 0CFF28 800D54C8 7C001A14 */  add     r0, r0, r3
/* 0CFF2C 800D54CC 7C030E70 */  srawi   r3, r0, 1
/* 0CFF30 800D54D0 7C630194 */  addze   r3, r3
/* 0CFF34 800D54D4 5463083C */  slwi    r3, r3, 1
/* 0CFF38 800D54D8 7C630010 */  subfc   r3, r3, r0
/* 0CFF3C 800D54DC 1C03000C */  mulli   r0, r3, 0xc
/* 0CFF40 800D54E0 7FFE0214 */  add     r31, r30, r0
/* 0CFF44 800D54E4 387F000C */  addi    r3, r31, 0xc
/* 0CFF48 800D54E8 4BFFFEA9 */  bl      TRKCopyEvent
/* 0CFF4C 800D54EC 389E0024 */  addi    r4, r30, 0x24
/* 0CFF50 800D54F0 801E0024 */  lwz     r0, 0x24(r30)
/* 0CFF54 800D54F4 901F0010 */  stw     r0, 0x10(r31)
/* 0CFF58 800D54F8 807E0024 */  lwz     r3, 0x24(r30)
/* 0CFF5C 800D54FC 38030001 */  addi    r0, r3, 1
/* 0CFF60 800D5500 901E0024 */  stw     r0, 0x24(r30)
/* 0CFF64 800D5504 801E0024 */  lwz     r0, 0x24(r30)
/* 0CFF68 800D5508 28000100 */  cmplwi  r0, 0x100
/* 0CFF6C 800D550C 4080000C */  bge     lbl_800D5518
/* 0CFF70 800D5510 38000100 */  li      r0, 0x100
/* 0CFF74 800D5514 90040000 */  stw     r0, 0(r4)
lbl_800D5518:
/* 0CFF78 800D5518 807D0000 */  lwz     r3, 0(r29)
/* 0CFF7C 800D551C 38030001 */  addi    r0, r3, 1
/* 0CFF80 800D5520 901D0000 */  stw     r0, 0(r29)
lbl_800D5524:
/* 0CFF84 800D5524 3C608014 */  lis     r3, gTRKEventQueue@ha
/* 0CFF88 800D5528 38632850 */  addi    r3, r3, gTRKEventQueue@l
/* 0CFF8C 800D552C 480023C5 */  bl      TRKReleaseMutex
/* 0CFF90 800D5530 7F83E378 */  mr      r3, r28
/* 0CFF94 800D5534 83E10014 */  lwz     r31, 0x14(r1)
/* 0CFF98 800D5538 83C10010 */  lwz     r30, 0x10(r1)
/* 0CFF9C 800D553C 83A1000C */  lwz     r29, 0xc(r1)
/* 0CFFA0 800D5540 83810008 */  lwz     r28, 8(r1)
/* 0CFFA4 800D5544 38210018 */  addi    r1, r1, 0x18
/* 0CFFA8 800D5548 80010004 */  lwz     r0, 4(r1)
/* 0CFFAC 800D554C 7C0803A6 */  mtlr    r0
/* 0CFFB0 800D5550 4E800020 */  blr     

glabel TRKConstructEvent
/* 0CFFB4 800D5554 98830000 */  stb     r4, 0(r3)
/* 0CFFB8 800D5558 38800000 */  li      r4, 0
/* 0CFFBC 800D555C 3800FFFF */  li      r0, -1
/* 0CFFC0 800D5560 90830004 */  stw     r4, 4(r3)
/* 0CFFC4 800D5564 90030008 */  stw     r0, 8(r3)
/* 0CFFC8 800D5568 4E800020 */  blr     

glabel TRKDestructEvent
/* 0CFFCC 800D556C 7C0802A6 */  mflr    r0
/* 0CFFD0 800D5570 90010004 */  stw     r0, 4(r1)
/* 0CFFD4 800D5574 9421FFF8 */  stwu    r1, -8(r1)
/* 0CFFD8 800D5578 80630008 */  lwz     r3, 8(r3)
/* 0CFFDC 800D557C 48000319 */  bl      TRKReleaseBuffer
/* 0CFFE0 800D5580 38210008 */  addi    r1, r1, 8
/* 0CFFE4 800D5584 80010004 */  lwz     r0, 4(r1)
/* 0CFFE8 800D5588 7C0803A6 */  mtlr    r0
/* 0CFFEC 800D558C 4E800020 */  blr     


.section .bss, "wa"

.balign 4

/* 0013F8D0 80142850 0028 */
glabel gTRKEventQueue
    .skip 40


