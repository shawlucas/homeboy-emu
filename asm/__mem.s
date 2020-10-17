# __mem.c
.include "macros.inc"

.section .init, "ax"

.balign 4

glabel memset
/* 0022D0 800053D0 7C0802A6 */  mflr	r0
/* 0022D4 800053D4 90010004 */  stw		r0, 4(r1)
/* 0022D8 800053D8 9421FFE0 */  stwu	r1, -0x20(r1)
/* 0022DC 800053DC 93E1001C */  stw		r31, 0x1c(r1)
/* 0022E0 800053E0 7C7F1B78 */  mr		r31, r3
/* 0022E4 800053E4 4800001D */  bl		__fill_mem
/* 0022E8 800053E8 80010024 */  lwz		r0, 0x24(r1)
/* 0022EC 800053EC 7FE3FB78 */  mr		r3, r31
/* 0022F0 800053F0 83E1001C */  lwz		r31, 0x1c(r1)
/* 0022F4 800053F4 38210020 */  addi	r1, r1, 0x20
/* 0022F8 800053F8 7C0803A6 */  mtlr	r0
/* 0022FC 800053FC 4E800020 */  blr		

glabel __fill_mem
/* 002300 80005400 28050020 */  cmplwi	r5, 0x20
/* 002304 80005404 5480063E */  clrlwi	r0, r4, 0x18
/* 002308 80005408 7C070378 */  mr		r7, r0
/* 00230C 8000540C 38C3FFFF */  addi	r6, r3, -1
/* 002310 80005410 41800098 */  blt		lbl_800054A8
/* 002314 80005414 7CC030F8 */  nor		r0, r6, r6
/* 002318 80005418 540007BF */  clrlwi.	r0, r0, 0x1e
/* 00231C 8000541C 7C030378 */  mr		r3, r0
/* 002320 80005420 41820018 */  beq		lbl_80005438
/* 002324 80005424 7CA32850 */  subf	r5, r3, r5
/* 002328 80005428 54E0063E */  clrlwi	r0, r7, 0x18
lbl_8000542C:
/* 00232C 8000542C 3463FFFF */  addic.	r3, r3, -1
/* 002330 80005430 9C060001 */  stbu	r0, 1(r6)
/* 002334 80005434 4082FFF8 */  bne		lbl_8000542C
lbl_80005438:
/* 002338 80005438 28070000 */  cmplwi	r7, 0
/* 00233C 8000543C 4182001C */  beq		lbl_80005458
/* 002340 80005440 54E3C00E */  slwi	r3, r7, 0x18
/* 002344 80005444 54E0801E */  slwi	r0, r7, 0x10
/* 002348 80005448 54E4402E */  slwi	r4, r7, 8
/* 00234C 8000544C 7C600378 */  or		r0, r3, r0
/* 002350 80005450 7C800378 */  or		r0, r4, r0
/* 002354 80005454 7CE70378 */  or		r7, r7, r0
lbl_80005458:
/* 002358 80005458 54A0D97F */  rlwinm.	r0, r5, 0x1b, 5, 0x1f
/* 00235C 8000545C 3866FFFD */  addi	r3, r6, -3
/* 002360 80005460 4182002C */  beq		lbl_8000548C
lbl_80005464:
/* 002364 80005464 90E30004 */  stw		r7, 4(r3)
/* 002368 80005468 3400FFFF */  addic.	r0, r0, -1
/* 00236C 8000546C 90E30008 */  stw		r7, 8(r3)
/* 002370 80005470 90E3000C */  stw		r7, 0xc(r3)
/* 002374 80005474 90E30010 */  stw		r7, 0x10(r3)
/* 002378 80005478 90E30014 */  stw		r7, 0x14(r3)
/* 00237C 8000547C 90E30018 */  stw		r7, 0x18(r3)
/* 002380 80005480 90E3001C */  stw		r7, 0x1c(r3)
/* 002384 80005484 94E30020 */  stwu	r7, 0x20(r3)
/* 002388 80005488 4082FFDC */  bne		lbl_80005464
lbl_8000548C:
/* 00238C 8000548C 54A0F77F */  rlwinm.	r0, r5, 0x1e, 0x1d, 0x1f
/* 002390 80005490 41820010 */  beq		lbl_800054A0
lbl_80005494:
/* 002394 80005494 3400FFFF */  addic.	r0, r0, -1
/* 002398 80005498 94E30004 */  stwu	r7, 4(r3)
/* 00239C 8000549C 4082FFF8 */  bne		lbl_80005494
lbl_800054A0:
/* 0023A0 800054A0 38C30003 */  addi	r6, r3, 3
/* 0023A4 800054A4 54A507BE */  clrlwi	r5, r5, 0x1e
lbl_800054A8:
/* 0023A8 800054A8 28050000 */  cmplwi	r5, 0
/* 0023AC 800054AC 4D820020 */  beqlr	
/* 0023B0 800054B0 54E0063E */  clrlwi	r0, r7, 0x18
lbl_800054B4:
/* 0023B4 800054B4 34A5FFFF */  addic.	r5, r5, -1
/* 0023B8 800054B8 9C060001 */  stbu	r0, 1(r6)
/* 0023BC 800054BC 4082FFF8 */  bne		lbl_800054B4
/* 0023C0 800054C0 4E800020 */  blr		

glabel memcpy
/* 0023C4 800054C4 7C041840 */  cmplw	r4, r3
/* 0023C8 800054C8 41800028 */  blt		lbl_800054F0
/* 0023CC 800054CC 3884FFFF */  addi	r4, r4, -1
/* 0023D0 800054D0 38C3FFFF */  addi	r6, r3, -1
/* 0023D4 800054D4 38A50001 */  addi	r5, r5, 1
/* 0023D8 800054D8 4800000C */  b		lbl_800054E4
lbl_800054DC:
/* 0023DC 800054DC 8C040001 */  lbzu	r0, 1(r4)
/* 0023E0 800054E0 9C060001 */  stbu	r0, 1(r6)
lbl_800054E4:
/* 0023E4 800054E4 34A5FFFF */  addic.	r5, r5, -1
/* 0023E8 800054E8 4082FFF4 */  bne		lbl_800054DC
/* 0023EC 800054EC 4E800020 */  blr		
lbl_800054F0:
/* 0023F0 800054F0 7C842A14 */  add		r4, r4, r5
/* 0023F4 800054F4 7CC32A14 */  add		r6, r3, r5
/* 0023F8 800054F8 38A50001 */  addi	r5, r5, 1
/* 0023FC 800054FC 4800000C */  b		lbl_80005508
lbl_80005500:
/* 002400 80005500 8C04FFFF */  lbzu	r0, -1(r4)
/* 002404 80005504 9C06FFFF */  stbu	r0, -1(r6)
lbl_80005508:
/* 002408 80005508 34A5FFFF */  addic.	r5, r5, -1
/* 00240C 8000550C 4082FFF4 */  bne		lbl_80005500
/* 002410 80005510 4E800020 */  blr		


