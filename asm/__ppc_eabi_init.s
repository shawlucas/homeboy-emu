# __ppc_eabi_init.cpp
.include "macros.inc"

.section .init, "ax"

.balign 4

glabel __init_hardware
/* 000300 80003400 7C0000A6 */  mfmsr   r0
/* 000304 80003404 60002000 */  ori     r0, r0, 0x2000
/* 000308 80003408 7C000124 */  mtmsr   r0
/* 00030C 8000340C 7FE802A6 */  mflr    r31
/* 000310 80003410 480A4C8D */  bl      __OSPSInit
/* 000314 80003414 480A4231 */  bl      __OSFPRInit
/* 000318 80003418 480A62F1 */  bl      __OSCacheInit
/* 00031C 8000341C 7FE803A6 */  mtlr    r31
/* 000320 80003420 4E800020 */  blr     

glabel __flush_cache
/* 000324 80003424 3CA0FFFF */  lis     r5, 0xffff
/* 000328 80003428 60A5FFF1 */  ori     r5, r5, 0xfff1
/* 00032C 8000342C 7CA51838 */  and     r5, r5, r3
/* 000330 80003430 7C651850 */  subf    r3, r5, r3
/* 000334 80003434 7C841A14 */  add     r4, r4, r3
lbl_80003438:
/* 000338 80003438 7C00286C */  dcbst   0, r5
/* 00033C 8000343C 7C0004AC */  sync    0
/* 000340 80003440 7C002FAC */  icbi    0, r5
/* 000344 80003444 30A50008 */  addic   r5, r5, 8
/* 000348 80003448 3484FFF8 */  addic.  r4, r4, -8
/* 00034C 8000344C 4080FFEC */  bge     lbl_80003438
/* 000350 80003450 4C00012C */  isync   
/* 000354 80003454 4E800020 */  blr     


.section .text, "ax"

.balign 4

glabel InitMetroTRK_BBA
/* 0A8BA0 800AE140 4E800020 */  blr     

glabel __init_user
/* 0A8BA4 800AE144 7C0802A6 */  mflr    r0
/* 0A8BA8 800AE148 90010004 */  stw     r0, 4(r1)
/* 0A8BAC 800AE14C 9421FFF8 */  stwu    r1, -8(r1)
/* 0A8BB0 800AE150 48000015 */  bl      __init_cpp
/* 0A8BB4 800AE154 8001000C */  lwz     r0, 0xc(r1)
/* 0A8BB8 800AE158 38210008 */  addi    r1, r1, 8
/* 0A8BBC 800AE15C 7C0803A6 */  mtlr    r0
/* 0A8BC0 800AE160 4E800020 */  blr     

__init_cpp:
/* 0A8BC4 800AE164 7C0802A6 */  mflr    r0
/* 0A8BC8 800AE168 90010004 */  stw     r0, 4(r1)
/* 0A8BCC 800AE16C 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0A8BD0 800AE170 93E1000C */  stw     r31, 0xc(r1)
/* 0A8BD4 800AE174 3C60800E */  lis     r3, _ctors@ha
/* 0A8BD8 800AE178 3803F160 */  addi    r0, r3, _ctors@l
/* 0A8BDC 800AE17C 7C1F0378 */  mr      r31, r0
/* 0A8BE0 800AE180 48000004 */  b       lbl_800AE184
lbl_800AE184:
/* 0A8BE4 800AE184 48000004 */  b       lbl_800AE188
lbl_800AE188:
/* 0A8BE8 800AE188 48000010 */  b       lbl_800AE198
lbl_800AE18C:
/* 0A8BEC 800AE18C 7D8803A6 */  mtlr    r12
/* 0A8BF0 800AE190 4E800021 */  blrl    
/* 0A8BF4 800AE194 3BFF0004 */  addi    r31, r31, 4
lbl_800AE198:
/* 0A8BF8 800AE198 819F0000 */  lwz     r12, 0(r31)
/* 0A8BFC 800AE19C 280C0000 */  cmplwi  r12, 0
/* 0A8C00 800AE1A0 4082FFEC */  bne     lbl_800AE18C
/* 0A8C04 800AE1A4 80010014 */  lwz     r0, 0x14(r1)
/* 0A8C08 800AE1A8 83E1000C */  lwz     r31, 0xc(r1)
/* 0A8C0C 800AE1AC 38210010 */  addi    r1, r1, 0x10
/* 0A8C10 800AE1B0 7C0803A6 */  mtlr    r0
/* 0A8C14 800AE1B4 4E800020 */  blr     

glabel _ExitProcess
/* 0A8C18 800AE1B8 7C0802A6 */  mflr    r0
/* 0A8C1C 800AE1BC 90010004 */  stw     r0, 4(r1)
/* 0A8C20 800AE1C0 9421FFF8 */  stwu    r1, -8(r1)
/* 0A8C24 800AE1C4 4BFF93AD */  bl      PPCHalt
/* 0A8C28 800AE1C8 8001000C */  lwz     r0, 0xc(r1)
/* 0A8C2C 800AE1CC 38210008 */  addi    r1, r1, 8
/* 0A8C30 800AE1D0 7C0803A6 */  mtlr    r0
/* 0A8C34 800AE1D4 4E800020 */  blr     


