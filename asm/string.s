# string.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel strchr
/* 0D73BC 800DC95C 3863FFFF */  addi	r3, r3, -1
/* 0D73C0 800DC960 5480063E */  clrlwi	r0, r4, 0x18
/* 0D73C4 800DC964 4800000C */  b		lbl_800DC970
lbl_800DC968:
/* 0D73C8 800DC968 7C040040 */  cmplw	r4, r0
/* 0D73CC 800DC96C 4D820020 */  beqlr	
lbl_800DC970:
/* 0D73D0 800DC970 8C830001 */  lbzu	r4, 1(r3)
/* 0D73D4 800DC974 28040000 */  cmplwi	r4, 0
/* 0D73D8 800DC978 4082FFF0 */  bne		lbl_800DC968
/* 0D73DC 800DC97C 28000000 */  cmplwi	r0, 0
/* 0D73E0 800DC980 4D820020 */  beqlr	
/* 0D73E4 800DC984 38600000 */  li		r3, 0
/* 0D73E8 800DC988 4E800020 */  blr		

glabel strncmp
/* 0D73EC 800DC98C 3863FFFF */  addi	r3, r3, -1
/* 0D73F0 800DC990 3884FFFF */  addi	r4, r4, -1
/* 0D73F4 800DC994 38C50001 */  addi	r6, r5, 1
/* 0D73F8 800DC998 48000024 */  b		lbl_800DC9BC
lbl_800DC99C:
/* 0D73FC 800DC99C 8C030001 */  lbzu	r0, 1(r3)
/* 0D7400 800DC9A0 8CA40001 */  lbzu	r5, 1(r4)
/* 0D7404 800DC9A4 7C002840 */  cmplw	r0, r5
/* 0D7408 800DC9A8 4182000C */  beq		lbl_800DC9B4
/* 0D740C 800DC9AC 7C650050 */  subf	r3, r5, r0
/* 0D7410 800DC9B0 4E800020 */  blr		
lbl_800DC9B4:
/* 0D7414 800DC9B4 28000000 */  cmplwi	r0, 0
/* 0D7418 800DC9B8 4182000C */  beq		lbl_800DC9C4
lbl_800DC9BC:
/* 0D741C 800DC9BC 34C6FFFF */  addic.	r6, r6, -1
/* 0D7420 800DC9C0 4082FFDC */  bne		lbl_800DC99C
lbl_800DC9C4:
/* 0D7424 800DC9C4 38600000 */  li		r3, 0
/* 0D7428 800DC9C8 4E800020 */  blr		

glabel strcmp
/* 0D742C 800DC9CC 88C30000 */  lbz		r6, 0(r3)
/* 0D7430 800DC9D0 88A40000 */  lbz		r5, 0(r4)
/* 0D7434 800DC9D4 7C053051 */  subf.	r0, r5, r6
/* 0D7438 800DC9D8 4182000C */  beq		lbl_800DC9E4
/* 0D743C 800DC9DC 7C653050 */  subf	r3, r5, r6
/* 0D7440 800DC9E0 4E800020 */  blr		
lbl_800DC9E4:
/* 0D7444 800DC9E4 548007BE */  clrlwi	r0, r4, 0x1e
/* 0D7448 800DC9E8 546507BE */  clrlwi	r5, r3, 0x1e
/* 0D744C 800DC9EC 7C002840 */  cmplw	r0, r5
/* 0D7450 800DC9F0 408200C8 */  bne		lbl_800DCAB8
/* 0D7454 800DC9F4 28050000 */  cmplwi	r5, 0
/* 0D7458 800DC9F8 41820058 */  beq		lbl_800DCA50
/* 0D745C 800DC9FC 28060000 */  cmplwi	r6, 0
/* 0D7460 800DCA00 4082000C */  bne		lbl_800DCA0C
/* 0D7464 800DCA04 38600000 */  li		r3, 0
/* 0D7468 800DCA08 4E800020 */  blr		
lbl_800DCA0C:
/* 0D746C 800DCA0C 20050003 */  subfic	r0, r5, 3
/* 0D7470 800DCA10 28000000 */  cmplwi	r0, 0
/* 0D7474 800DCA14 7C0903A6 */  mtctr	r0
/* 0D7478 800DCA18 41820030 */  beq		lbl_800DCA48
lbl_800DCA1C:
/* 0D747C 800DCA1C 8CA30001 */  lbzu	r5, 1(r3)
/* 0D7480 800DCA20 8C040001 */  lbzu	r0, 1(r4)
/* 0D7484 800DCA24 7C002851 */  subf.	r0, r0, r5
/* 0D7488 800DCA28 4182000C */  beq		lbl_800DCA34
/* 0D748C 800DCA2C 7C030378 */  mr		r3, r0
/* 0D7490 800DCA30 4E800020 */  blr		
lbl_800DCA34:
/* 0D7494 800DCA34 28050000 */  cmplwi	r5, 0
/* 0D7498 800DCA38 4082000C */  bne		lbl_800DCA44
/* 0D749C 800DCA3C 38600000 */  li		r3, 0
/* 0D74A0 800DCA40 4E800020 */  blr		
lbl_800DCA44:
/* 0D74A4 800DCA44 4200FFD8 */  bdnz	lbl_800DCA1C
lbl_800DCA48:
/* 0D74A8 800DCA48 38630001 */  addi	r3, r3, 1
/* 0D74AC 800DCA4C 38840001 */  addi	r4, r4, 1
lbl_800DCA50:
/* 0D74B0 800DCA50 80E30000 */  lwz		r7, 0(r3)
/* 0D74B4 800DCA54 80CD8E54 */  lwz		r6, K2-_SDA_BASE_(r13)
/* 0D74B8 800DCA58 80AD8E50 */  lwz		r5, K1-_SDA_BASE_(r13)
/* 0D74BC 800DCA5C 7C073214 */  add		r0, r7, r6
/* 0D74C0 800DCA60 81040000 */  lwz		r8, 0(r4)
/* 0D74C4 800DCA64 7C002839 */  and.	r0, r0, r5
/* 0D74C8 800DCA68 40820038 */  bne		lbl_800DCAA0
/* 0D74CC 800DCA6C 48000018 */  b		lbl_800DCA84
lbl_800DCA70:
/* 0D74D0 800DCA70 84E30004 */  lwzu	r7, 4(r3)
/* 0D74D4 800DCA74 85040004 */  lwzu	r8, 4(r4)
/* 0D74D8 800DCA78 7C073214 */  add		r0, r7, r6
/* 0D74DC 800DCA7C 7C002839 */  and.	r0, r0, r5
/* 0D74E0 800DCA80 40820020 */  bne		lbl_800DCAA0
lbl_800DCA84:
/* 0D74E4 800DCA84 7C074040 */  cmplw	r7, r8
/* 0D74E8 800DCA88 4182FFE8 */  beq		lbl_800DCA70
/* 0D74EC 800DCA8C 4081000C */  ble		lbl_800DCA98
/* 0D74F0 800DCA90 38600001 */  li		r3, 1
/* 0D74F4 800DCA94 4E800020 */  blr		
lbl_800DCA98:
/* 0D74F8 800DCA98 3860FFFF */  li		r3, -1
/* 0D74FC 800DCA9C 4E800020 */  blr		
lbl_800DCAA0:
/* 0D7500 800DCAA0 88C30000 */  lbz		r6, 0(r3)
/* 0D7504 800DCAA4 88A40000 */  lbz		r5, 0(r4)
/* 0D7508 800DCAA8 7C053051 */  subf.	r0, r5, r6
/* 0D750C 800DCAAC 4182000C */  beq		lbl_800DCAB8
/* 0D7510 800DCAB0 7C653050 */  subf	r3, r5, r6
/* 0D7514 800DCAB4 4E800020 */  blr		
lbl_800DCAB8:
/* 0D7518 800DCAB8 28060000 */  cmplwi	r6, 0
/* 0D751C 800DCABC 4082000C */  bne		lbl_800DCAC8
/* 0D7520 800DCAC0 38600000 */  li		r3, 0
/* 0D7524 800DCAC4 4E800020 */  blr		
lbl_800DCAC8:
/* 0D7528 800DCAC8 8CA30001 */  lbzu	r5, 1(r3)
/* 0D752C 800DCACC 8C040001 */  lbzu	r0, 1(r4)
/* 0D7530 800DCAD0 7C002851 */  subf.	r0, r0, r5
/* 0D7534 800DCAD4 4182000C */  beq		lbl_800DCAE0
/* 0D7538 800DCAD8 7C030378 */  mr		r3, r0
/* 0D753C 800DCADC 4E800020 */  blr		
lbl_800DCAE0:
/* 0D7540 800DCAE0 28050000 */  cmplwi	r5, 0
/* 0D7544 800DCAE4 4082FFE4 */  bne		lbl_800DCAC8
/* 0D7548 800DCAE8 38600000 */  li		r3, 0
/* 0D754C 800DCAEC 4E800020 */  blr		

glabel strcat
/* 0D7550 800DCAF0 3884FFFF */  addi	r4, r4, -1
/* 0D7554 800DCAF4 38A3FFFF */  addi	r5, r3, -1
lbl_800DCAF8:
/* 0D7558 800DCAF8 8C050001 */  lbzu	r0, 1(r5)
/* 0D755C 800DCAFC 28000000 */  cmplwi	r0, 0
/* 0D7560 800DCB00 4082FFF8 */  bne		lbl_800DCAF8
/* 0D7564 800DCB04 38A5FFFF */  addi	r5, r5, -1
lbl_800DCB08:
/* 0D7568 800DCB08 8C040001 */  lbzu	r0, 1(r4)
/* 0D756C 800DCB0C 28000000 */  cmplwi	r0, 0
/* 0D7570 800DCB10 9C050001 */  stbu	r0, 1(r5)
/* 0D7574 800DCB14 4082FFF4 */  bne		lbl_800DCB08
/* 0D7578 800DCB18 4E800020 */  blr		

glabel strncpy
/* 0D757C 800DCB1C 3884FFFF */  addi	r4, r4, -1
/* 0D7580 800DCB20 38C3FFFF */  addi	r6, r3, -1
/* 0D7584 800DCB24 38A50001 */  addi	r5, r5, 1
/* 0D7588 800DCB28 4800002C */  b		lbl_800DCB54
lbl_800DCB2C:
/* 0D758C 800DCB2C 8C040001 */  lbzu	r0, 1(r4)
/* 0D7590 800DCB30 28000000 */  cmplwi	r0, 0
/* 0D7594 800DCB34 9C060001 */  stbu	r0, 1(r6)
/* 0D7598 800DCB38 4082001C */  bne		lbl_800DCB54
/* 0D759C 800DCB3C 38000000 */  li		r0, 0
/* 0D75A0 800DCB40 48000008 */  b		lbl_800DCB48
lbl_800DCB44:
/* 0D75A4 800DCB44 9C060001 */  stbu	r0, 1(r6)
lbl_800DCB48:
/* 0D75A8 800DCB48 34A5FFFF */  addic.	r5, r5, -1
/* 0D75AC 800DCB4C 4082FFF8 */  bne		lbl_800DCB44
/* 0D75B0 800DCB50 4E800020 */  blr		
lbl_800DCB54:
/* 0D75B4 800DCB54 34A5FFFF */  addic.	r5, r5, -1
/* 0D75B8 800DCB58 4082FFD4 */  bne		lbl_800DCB2C
/* 0D75BC 800DCB5C 4E800020 */  blr		

glabel strcpy
/* 0D75C0 800DCB60 546007BE */  clrlwi	r0, r3, 0x1e
/* 0D75C4 800DCB64 548507BE */  clrlwi	r5, r4, 0x1e
/* 0D75C8 800DCB68 7C002840 */  cmplw	r0, r5
/* 0D75CC 800DCB6C 38E30000 */  addi	r7, r3, 0
/* 0D75D0 800DCB70 40820080 */  bne		lbl_800DCBF0
/* 0D75D4 800DCB74 28050000 */  cmplwi	r5, 0
/* 0D75D8 800DCB78 41820040 */  beq		lbl_800DCBB8
/* 0D75DC 800DCB7C 88040000 */  lbz		r0, 0(r4)
/* 0D75E0 800DCB80 28000000 */  cmplwi	r0, 0
/* 0D75E4 800DCB84 98070000 */  stb		r0, 0(r7)
/* 0D75E8 800DCB88 4D820020 */  beqlr	
/* 0D75EC 800DCB8C 20050003 */  subfic	r0, r5, 3
/* 0D75F0 800DCB90 28000000 */  cmplwi	r0, 0
/* 0D75F4 800DCB94 7C0903A6 */  mtctr	r0
/* 0D75F8 800DCB98 41820018 */  beq		lbl_800DCBB0
lbl_800DCB9C:
/* 0D75FC 800DCB9C 8C040001 */  lbzu	r0, 1(r4)
/* 0D7600 800DCBA0 28000000 */  cmplwi	r0, 0
/* 0D7604 800DCBA4 9C070001 */  stbu	r0, 1(r7)
/* 0D7608 800DCBA8 4D820020 */  beqlr	
/* 0D760C 800DCBAC 4200FFF0 */  bdnz	lbl_800DCB9C
lbl_800DCBB0:
/* 0D7610 800DCBB0 38E70001 */  addi	r7, r7, 1
/* 0D7614 800DCBB4 38840001 */  addi	r4, r4, 1
lbl_800DCBB8:
/* 0D7618 800DCBB8 80A40000 */  lwz		r5, 0(r4)
/* 0D761C 800DCBBC 800D8E54 */  lwz		r0, K2-_SDA_BASE_(r13)
/* 0D7620 800DCBC0 80CD8E50 */  lwz		r6, K1-_SDA_BASE_(r13)
/* 0D7624 800DCBC4 39050000 */  addi	r8, r5, 0
/* 0D7628 800DCBC8 7CA50214 */  add		r5, r5, r0
/* 0D762C 800DCBCC 7CA53039 */  and.	r5, r5, r6
/* 0D7630 800DCBD0 40820020 */  bne		lbl_800DCBF0
/* 0D7634 800DCBD4 38E7FFFC */  addi	r7, r7, -4
lbl_800DCBD8:
/* 0D7638 800DCBD8 95070004 */  stwu	r8, 4(r7)
/* 0D763C 800DCBDC 85040004 */  lwzu	r8, 4(r4)
/* 0D7640 800DCBE0 7CA80214 */  add		r5, r8, r0
/* 0D7644 800DCBE4 7CA53039 */  and.	r5, r5, r6
/* 0D7648 800DCBE8 4182FFF0 */  beq		lbl_800DCBD8
/* 0D764C 800DCBEC 38E70004 */  addi	r7, r7, 4
lbl_800DCBF0:
/* 0D7650 800DCBF0 88040000 */  lbz		r0, 0(r4)
/* 0D7654 800DCBF4 28000000 */  cmplwi	r0, 0
/* 0D7658 800DCBF8 98070000 */  stb		r0, 0(r7)
/* 0D765C 800DCBFC 4D820020 */  beqlr	
lbl_800DCC00:
/* 0D7660 800DCC00 8C040001 */  lbzu	r0, 1(r4)
/* 0D7664 800DCC04 28000000 */  cmplwi	r0, 0
/* 0D7668 800DCC08 9C070001 */  stbu	r0, 1(r7)
/* 0D766C 800DCC0C 4082FFF4 */  bne		lbl_800DCC00
/* 0D7670 800DCC10 4E800020 */  blr		

glabel strlen
/* 0D7674 800DCC14 3880FFFF */  li		r4, -1
/* 0D7678 800DCC18 3863FFFF */  addi	r3, r3, -1
lbl_800DCC1C:
/* 0D767C 800DCC1C 8C030001 */  lbzu	r0, 1(r3)
/* 0D7680 800DCC20 38840001 */  addi	r4, r4, 1
/* 0D7684 800DCC24 28000000 */  cmplwi	r0, 0
/* 0D7688 800DCC28 4082FFF4 */  bne		lbl_800DCC1C
/* 0D768C 800DCC2C 7C832378 */  mr		r3, r4
/* 0D7690 800DCC30 4E800020 */  blr		


.section .sdata, "wa"

.balign 8

/* 00100090 80145830 0004 */
K1:
    .long 0x80808080

.balign 4

/* 00100094 80145834 0004 */
K2:
    .long 0xFEFEFEFF


